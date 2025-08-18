#!/bin/bash
# Technical: Modular setup validation helpers for project initialization
# Simple: Helper functions that check if your project setup is correct
# Connection: Teaches modular design essential for maintainable automation

# Parse command line arguments for setup scripts
parse_setup_args() {
    TEST_MODE=false
    PROJECT_DIR="."
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            --mode=test)
                TEST_MODE=true
                shift
                ;;
            --type=*)
                # Handle project type (future enhancement)
                shift
                ;;
            *)
                # Treat as project directory if it's a valid path
                if [[ -d "$1" ]]; then
                    PROJECT_DIR="$1"
                fi
                shift
                ;;
        esac
    done
}

# Check basic system requirements
check_requirements() {
    echo "🚀 Claude Code Builder Quick Start"
    echo "Project directory: ${PROJECT_DIR:-.}"
    command -v bash >/dev/null 2>&1 || { echo "❌ Bash not found. Please install bash."; return 1; }
    echo "✅ Bash version: $(bash --version | head -1)"
    return 0
}

# Validate project structure
validate_project() {
    local project_dir="${PROJECT_DIR:-.}"
    [ ! -d "$project_dir/patterns" ] && { echo "❌ Patterns directory not found. Are you in the right directory?"; return 1; }
    echo "✅ Patterns directory found"
    local pattern_count
    pattern_count=$(find "$project_dir/patterns" -name "*.sh" | wc -l || echo 0)
    echo "✅ Found $pattern_count pattern scripts"
    return 0
}