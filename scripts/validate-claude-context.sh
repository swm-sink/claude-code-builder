#!/bin/bash

# Technical: CLAUDE.md validation system that ensures all directories have context files and @file links work correctly
# Simple: Quality checker that makes sure AI context is complete and properly connected
# Connection: This ensures AI assistants can navigate and understand the entire project structure

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

# Check if CLAUDE.md exists in all required directories
check_claude_files() {
    log_info "Checking for CLAUDE.md files in all directories..."
    
    local missing=()
    local found=0
    
    # Main directories that must have CLAUDE.md
    local required_dirs=(
        "."
        "patterns"
        "tools"  
        "scripts"
        "docs"
        "examples"
        "tests"
        ".claude"
        ".internal"
    )
    
    for dir in "${required_dirs[@]}"; do
        if [[ -d "$dir" ]]; then
            if [[ -f "$dir/CLAUDE.md" ]]; then
                log_info "✅ Found: $dir/CLAUDE.md"
                ((found++))
            else
                log_error "❌ Missing: $dir/CLAUDE.md"
                missing+=("$dir")
            fi
        fi
    done
    
    # Check pattern subdirectories
    for pattern_dir in patterns/*/; do
        if [[ -d "$pattern_dir" ]]; then
            if [[ -f "$pattern_dir/CLAUDE.md" ]]; then
                ((found++))
            else
                log_warn "⚠️ Missing: $pattern_dir/CLAUDE.md"
                missing+=("$pattern_dir")
            fi
        fi
    done
    
    log_info "Found $found CLAUDE.md files"
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        log_error "Missing CLAUDE.md in ${#missing[@]} directories"
        return 1
    fi
    
    return 0
}

# Validate @file links in CLAUDE.md files
validate_file_links() {
    log_info "Validating @file links in CLAUDE.md files..."
    
    local broken_links=0
    local valid_links=0
    
    while IFS= read -r claude_file; do
        local dir=$(dirname "$claude_file")
        
        while IFS= read -r line; do
            if [[ "$line" =~ @file[[:space:]]+([^[:space:]]+) ]]; then
                local link_path="${BASH_REMATCH[1]}"
                # Remove any trailing description after dash
                link_path="${link_path%% -*}"
                
                # Resolve relative to the CLAUDE.md file's directory
                local full_path
                if [[ "$link_path" = /* ]]; then
                    full_path=".$link_path"
                elif [[ "$dir" = "." ]]; then
                    full_path="$link_path"
                else
                    full_path="$dir/$link_path"
                fi
                
                if [[ -f "$full_path" ]]; then
                    ((valid_links++))
                else
                    log_error "❌ Broken link in $claude_file: @file $link_path"
                    ((broken_links++))
                fi
            fi
        done < "$claude_file"
    done < <(find . -name "CLAUDE.md" -type f)
    
    log_info "✅ Valid links: $valid_links"
    
    if [[ $broken_links -gt 0 ]]; then
        log_error "❌ Broken links: $broken_links"
        return 1
    fi
    
    return 0
}

# Check CLAUDE.md content quality
check_content_quality() {
    log_info "Checking CLAUDE.md content quality..."
    
    local issues=0
    
    while IFS= read -r claude_file; do
        local size=$(wc -l < "$claude_file")
        
        # Check minimum content
        if [[ $size -lt 10 ]]; then
            log_warn "⚠️ Minimal content in $claude_file (only $size lines)"
            ((issues++))
        fi
        
        # Check for required sections
        if ! grep -q "## " "$claude_file"; then
            log_warn "⚠️ No sections (##) in $claude_file"
            ((issues++))
        fi
        
        # Check for @file links in main CLAUDE.md
        if [[ "$claude_file" = "./CLAUDE.md" ]]; then
            if ! grep -q "@file" "$claude_file"; then
                log_warn "⚠️ No @file links in main CLAUDE.md"
                ((issues++))
            fi
        fi
    done < <(find . -name "CLAUDE.md" -type f)
    
    if [[ $issues -gt 0 ]]; then
        log_warn "Found $issues content quality issues"
    else
        log_info "✅ All CLAUDE.md files have adequate content"
    fi
    
    return 0
}

# Generate validation report
generate_report() {
    local status="$1"
    
    log_info "Generating CLAUDE.md validation report..."
    
    local report_file=".internal/reports/claude-validation-$(date +%Y%m%d-%H%M%S).json"
    mkdir -p "$(dirname "$report_file")"
    
    local claude_count=$(find . -name "CLAUDE.md" -type f | wc -l)
    local link_count=$(grep -h "@file" $(find . -name "CLAUDE.md" -type f) 2>/dev/null | wc -l || echo 0)
    
    cat > "$report_file" <<EOF
{
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "validation_status": "$status",
  "claude_files_found": $claude_count,
  "file_links_found": $link_count,
  "directories_checked": [
    "patterns", "tools", "scripts", "docs",
    "examples", "tests", ".claude", ".internal"
  ]
}
EOF
    
    log_info "Report saved: $report_file"
}

# Main execution
main() {
    log_info "Starting CLAUDE.md validation..."
    
    local validation_status="pass"
    
    # Check for CLAUDE.md files
    if ! check_claude_files; then
        validation_status="fail"
    fi
    
    # Validate @file links
    if ! validate_file_links; then
        validation_status="fail"
    fi
    
    # Check content quality
    check_content_quality
    
    # Generate report
    generate_report "$validation_status"
    
    if [[ "$validation_status" == "fail" ]]; then
        log_error "❌ CLAUDE.md validation failed"
        exit 1
    fi
    
    log_info "✅ CLAUDE.md validation complete"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi