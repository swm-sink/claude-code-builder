#!/bin/bash
# Technical: Pattern demonstration helper for quick-start workflow
# Simple: Demo functions that show you how patterns work
# Connection: Teaches pattern usage essential for AI-assisted development

# Demo error handling pattern functionality
demo_error_handling() {
    local project_dir="${1:-.}"
    
    echo ""
    echo "📚 Loading error handling pattern for demo..."
    
    if source "$project_dir/patterns/error-handling/simple-error-handling.sh" 2>/dev/null; then
        log_info "🎉 Pattern loaded successfully!"
        log_info "Available functions: log_info, log_warn, log_error, handle_error"
        log_warn "This is a warning message"
        log_error "This is an error message (for demo)"
    else
        echo "⚠️  Could not load error handling pattern"
        return 1
    fi
    
    return 0
}

# Show completion message and next steps
show_completion() {
    echo ""
    echo "🎯 Quick start complete! Check README.md for more information."
    echo "💡 Try: source ./patterns/error-handling/simple-error-handling.sh"
    echo "📖 More patterns: ./patterns/ directory"
    echo "🧪 Test patterns: ./tests/simple-pattern-test.sh"
}

# Run pattern demo if not in test mode
run_demo_if_needed() {
    local project_dir="${1:-.}"
    local test_mode="${2:-false}"
    
    if [ "$test_mode" = true ]; then
        echo "🧪 Test mode: Validation complete"
        return 0
    fi
    
    demo_error_handling "$project_dir"
    show_completion
}