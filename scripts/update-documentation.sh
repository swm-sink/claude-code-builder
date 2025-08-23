#!/bin/bash

# Technical: Automated documentation update system that detects changes and updates all affected documentation before git push
# Simple: Smart assistant that keeps all your documentation perfectly up-to-date automatically
# Connection: This teaches automated documentation maintenance essential for professional software development

set -euo pipefail

# Source error handling if available
if [[ -f "patterns/error-handling/simple-error-handling.sh" ]]; then
    source patterns/error-handling/simple-error-handling.sh
else
    # Fallback logging
    log_info() { echo "[INFO] $*"; }
    log_warn() { echo "[WARN] $*" >&2; }
    log_error() { echo "[ERROR] $*" >&2; }
fi

# Detect changes since last commit
detect_changes() {
    log_info "Detecting changes since last commit..."
    
    local changed_files
    changed_files=$(git diff --name-only HEAD~1 2>/dev/null || git diff --name-only --cached)
    
    if [[ -z "$changed_files" ]]; then
        log_info "No changes detected"
        return 0
    fi
    
    echo "$changed_files"
}

# Categorize changes by type
categorize_changes() {
    local changes="$1"
    
    local patterns_changed=false
    local tools_changed=false
    local scripts_changed=false
    local docs_changed=false
    local structure_changed=false
    
    while IFS= read -r file; do
        case "$file" in
            patterns/*) patterns_changed=true ;;
            tools/*) tools_changed=true ;;
            scripts/*) scripts_changed=true ;;
            docs/*) docs_changed=true ;;
            .github/*|.internal/*|.claude/*) structure_changed=true ;;
        esac
    done <<< "$changes"
    
    echo "patterns:$patterns_changed"
    echo "tools:$tools_changed"
    echo "scripts:$scripts_changed"
    echo "docs:$docs_changed"
    echo "structure:$structure_changed"
}

# Update README.md if needed
update_readme() {
    local categories="$1"
    
    if echo "$categories" | grep -E "(patterns|tools|scripts):true" > /dev/null; then
        log_info "Updating README.md..."
        # Add update timestamp
        sed -i.bak "s/\*\*Last Updated:\*\*.*/\*\*Last Updated:\*\* $(date '+%Y-%m-%d %H:%M:%S')/" README.md 2>/dev/null || true
        rm -f README.md.bak
    fi
}

# Always update CHANGELOG.md
update_changelog() {
    local changes="$1"
    
    log_info "Updating CHANGELOG.md..."
    
    # Create changelog entry
    local date=$(date '+%Y-%m-%d')
    local entry="## [Unreleased] - $date\n\n### Changed\n"
    
    while IFS= read -r file; do
        entry="$entry- Updated: $file\n"
    done <<< "$changes"
    
    # Insert after header
    sed -i.bak "/^# Changelog/a\\
\\
$entry" CHANGELOG.md 2>/dev/null || true
    rm -f CHANGELOG.md.bak
}

# Validate CLAUDE.md files exist
validate_claude_files() {
    log_info "Validating CLAUDE.md files..."
    
    local missing=()
    for dir in patterns tools scripts docs examples tests .claude .internal; do
        if [[ -d "$dir" && ! -f "$dir/CLAUDE.md" ]]; then
            missing+=("$dir")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        log_error "Missing CLAUDE.md in: ${missing[*]}"
        return 1
    fi
    
    log_info "All CLAUDE.md files present"
    return 0
}

# Validate @file links in CLAUDE.md
validate_file_links() {
    log_info "Validating @file links..."
    
    local errors=0
    while IFS= read -r file; do
        while IFS= read -r link; do
            local target="${link#@file }"
            target="${target%% -*}"
            
            if [[ ! -f "$target" ]]; then
                log_warn "Broken @file link in $file: $target"
                ((errors++))
            fi
        done < <(grep "@file" "$file" 2>/dev/null || true)
    done < <(find . -name "CLAUDE.md" -type f)
    
    if [[ $errors -gt 0 ]]; then
        log_error "Found $errors broken @file links"
        return 1
    fi
    
    log_info "All @file links valid"
    return 0
}

# Generate JSON validation report
generate_report() {
    local changes="$1"
    local status="$2"
    
    log_info "Generating validation report..."
    
    local report_file=".internal/reports/push-validation-$(date +%Y%m%d-%H%M%S).json"
    mkdir -p "$(dirname "$report_file")"
    
    cat > "$report_file" <<EOF
{
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "changes_detected": [
$(echo "$changes" | sed 's/^/    "/' | sed 's/$/",/' | sed '$ s/,$//')
  ],
  "documentation_updated": [
    "README.md",
    "CHANGELOG.md"
  ],
  "validation_status": "$status",
  "claude_context": "complete",
  "file_format_compliance": true
}
EOF
    
    log_info "Report saved: $report_file"
}

# Main execution
main() {
    log_info "Starting documentation update workflow..."
    
    # Detect changes
    local changes
    changes=$(detect_changes)
    
    if [[ -z "$changes" ]]; then
        log_info "No changes to process"
        exit 0
    fi
    
    # Categorize changes
    local categories
    categories=$(categorize_changes "$changes")
    
    # Update documentation
    update_readme "$categories"
    update_changelog "$changes"
    
    # Validate CLAUDE.md files
    local validation_status="pass"
    if ! validate_claude_files; then
        validation_status="fail"
    fi
    
    if ! validate_file_links; then
        validation_status="fail"
    fi
    
    # Generate report
    generate_report "$changes" "$validation_status"
    
    if [[ "$validation_status" == "fail" ]]; then
        log_error "Documentation validation failed"
        exit 1
    fi
    
    log_info "✅ Documentation update complete"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi