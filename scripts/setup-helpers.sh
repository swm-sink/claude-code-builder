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
    
    # Auto-detect if we need to look in claude-code-builder subdirectory
    if [ ! -d "$PROJECT_DIR/patterns" ] && [ -d "$PROJECT_DIR/claude-code-builder/patterns" ]; then
        PROJECT_DIR="$PROJECT_DIR/claude-code-builder"
    fi
    
    # Export PROJECT_DIR so it's available to other functions
    export PROJECT_DIR
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
    
    # Check current directory first
    if [ -d "$project_dir/patterns" ]; then
        echo "✅ Patterns directory found"
    # Check if we're being called from a parent directory with claude-code-builder
    elif [ -d "$project_dir/claude-code-builder/patterns" ]; then
        PROJECT_DIR="$project_dir/claude-code-builder"
        echo "✅ Patterns directory found in claude-code-builder/"
    else
        echo "❌ Patterns directory not found. Are you in the right directory?"
        echo "💡 Try running from the claude-code-builder directory"
        return 1
    fi
    
    local pattern_count
    pattern_count=$(find "$PROJECT_DIR/patterns" -name "*.sh" | wc -l || echo 0)
    echo "✅ Found $pattern_count pattern scripts"
    return 0
}