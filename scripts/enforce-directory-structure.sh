#!/bin/bash
# Technical: Enforces mandatory directory organization structure per CLAUDE.md requirements
# Simple: Keeps your project organized by moving files to their proper homes automatically
# Connection: Teaches clean project structure essential for professional development

set -e

# Source error handling
source "$(dirname "$0")/../patterns/error-handling/simple-error-handling.sh" 2>/dev/null || {
    echo "Error: Could not load error handling pattern"
    exit 1
}

log_info "🗂️ Enforcing mandatory directory structure..."

# Counter for violations
VIOLATIONS=0
FIXES=0

# Check and create required directories
ensure_directories() {
    local dirs=(
        ".system/reports"
        ".system/checklists"
        ".internal/drafts"
        "tests/native-commands"
    )
    
    for dir in "${dirs[@]}"; do
        if [[ ! -d "$dir" ]]; then
            log_warn "Creating missing directory: $dir"
            mkdir -p "$dir"
            ((FIXES++))
        fi
    done
}

# Check root directory file count
check_root_file_count() {
    # Count only files, not directories
    local file_count=$(find . -maxdepth 1 -type f ! -name ".*" | wc -l | tr -d ' ')
    
    if [[ $file_count -gt 12 ]]; then
        log_error "❌ Root directory has $file_count files (max allowed: 12)"
        ((VIOLATIONS++))
        return 1
    else
        log_info "✅ Root directory file count: $file_count (within limit)"
        return 0
    fi
}

# Move test files to proper location
enforce_test_files() {
    local test_files=$(ls test-*.sh *-test.sh 2>/dev/null || true)
    
    if [[ -n "$test_files" ]]; then
        log_warn "Found test files in root directory"
        for file in $test_files; do
            log_info "  Moving $file → tests/native-commands/"
            mv "$file" tests/native-commands/
            ((FIXES++))
        done
    fi
}

# Move report files to proper location
enforce_report_files() {
    local report_files=$(ls *REPORT*.md *ANALYSIS*.md *RESULTS*.md 2>/dev/null | grep -v README || true)
    
    if [[ -n "$report_files" ]]; then
        log_warn "Found report files in root directory"
        for file in $report_files; do
            log_info "  Moving $file → .system/reports/"
            mv "$file" .system/reports/
            ((FIXES++))
        done
    fi
}

# Move checklist files to proper location
enforce_checklist_files() {
    local checklist_files=$(ls *CHECKLIST*.md *VALIDATION*.md 2>/dev/null | grep -v README || true)
    
    if [[ -n "$checklist_files" ]]; then
        log_warn "Found checklist files in root directory"
        for file in $checklist_files; do
            log_info "  Moving $file → .system/checklists/"
            mv "$file" .system/checklists/
            ((FIXES++))
        done
    fi
}

# Move working/draft documents to proper location
enforce_draft_files() {
    local draft_files=$(ls *_v[0-9].md *DRAFT*.md *WIP*.md 2>/dev/null || true)
    
    if [[ -n "$draft_files" ]]; then
        log_warn "Found draft/working files in root directory"
        for file in $draft_files; do
            log_info "  Moving $file → .internal/drafts/"
            mv "$file" .internal/drafts/
            ((FIXES++))
        done
    fi
}

# Clean temporary files
clean_temp_files() {
    local temp_files=$(ls *.tmp *.bak *.swp *~ 2>/dev/null || true)
    
    if [[ -n "$temp_files" ]]; then
        log_warn "Found temporary files in root directory"
        for file in $temp_files; do
            log_info "  Removing temporary file: $file"
            rm -f "$file"
            ((FIXES++))
        done
    fi
}

# Check for misplaced files
check_misplaced_files() {
    # Files that should never be in root
    local bad_patterns=(
        "test-*.sh"
        "*-test.sh"
        "*REPORT*.md"
        "*CHECKLIST*.md"
        "*VALIDATION*.md"
        "*_v[0-9].md"
        "*.tmp"
        "*.bak"
    )
    
    for pattern in "${bad_patterns[@]}"; do
        if ls $pattern 2>/dev/null | grep -v README >/dev/null 2>&1; then
            log_error "Found misplaced files matching: $pattern"
            ((VIOLATIONS++))
        fi
    done
}

# Main enforcement
main() {
    log_info "Starting directory structure enforcement..."
    
    # Ensure all directories exist
    ensure_directories
    
    # Enforce file placement rules
    enforce_test_files
    enforce_report_files
    enforce_checklist_files
    enforce_draft_files
    clean_temp_files
    
    # Final checks
    check_root_file_count
    check_misplaced_files
    
    # Report results
    echo ""
    log_info "📊 Enforcement Summary:"
    log_info "  Fixed: $FIXES issues"
    
    if [[ $VIOLATIONS -gt 0 ]]; then
        log_error "  Remaining violations: $VIOLATIONS"
        log_error "❌ Directory structure enforcement found issues"
        log_info "Please review and fix remaining violations manually"
        exit 1
    else
        log_info "✅ Directory structure is compliant with CLAUDE.md requirements"
        exit 0
    fi
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi