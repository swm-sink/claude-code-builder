#!/bin/bash
# Technical: Quick-start script for Claude Code Builder pattern initialization
# Simple: Fast setup script that gets you started with patterns quickly
# Connection: Teaches project initialization essential for development workflows

set -e

# Check if running in test mode
TEST_MODE=false
if [[ "$*" == *"--mode=test"* ]]; then
    TEST_MODE=true
fi

# Basic setup validation
setup_validation() {
    local project_dir="${1:-.}"
    
    echo "🚀 Claude Code Builder Quick Start"
    echo "Project directory: $project_dir"
    
    # Check basic requirements
    if ! command -v bash >/dev/null 2>&1; then
        echo "❌ Bash not found. Please install bash."
        exit 1
    fi
    
    echo "✅ Bash version: $(bash --version | head -1)"
    
    # Check if patterns directory exists
    if [ ! -d "$project_dir/patterns" ]; then
        echo "❌ Patterns directory not found. Are you in the right directory?"
        exit 1
    fi
    
    echo "✅ Patterns directory found"
    
    # Check pattern availability
    local pattern_count
    pattern_count=$(find "$project_dir/patterns" -name "*.sh" | wc -l || echo 0)
    echo "✅ Found $pattern_count pattern scripts"
    
    if [ "$TEST_MODE" = true ]; then
        echo "🧪 Test mode: Validation complete"
        return 0
    fi
    
    # Demo basic pattern usage
    echo ""
    echo "📚 Loading error handling pattern for demo..."
    
    if source "$project_dir/patterns/error-handling/simple-error-handling.sh" 2>/dev/null; then
        log_info "🎉 Pattern loaded successfully!"
        log_info "Available functions: log_info, log_warn, log_error, handle_error"
        log_warn "This is a warning message"
        log_error "This is an error message (for demo)"
    else
        echo "⚠️  Could not load error handling pattern"
    fi
    
    echo ""
    echo "🎯 Quick start complete! Check README.md for more information."
    echo "💡 Try: source ./patterns/error-handling/simple-error-handling.sh"
}

# Run setup
setup_validation "$@"