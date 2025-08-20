#!/bin/bash
# hello-world.sh - Simple example showing Claude Code Builder patterns
# This demonstrates how to build a basic script with patterns

# Load essential patterns (from project root)
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$PROJECT_ROOT/patterns/logging/simple-logging.sh"
source "$PROJECT_ROOT/patterns/error-handling/simple-error-handling.sh"

# Main function demonstrating pattern usage
main() {
    log_info "🌍 Hello from Claude Code Builder!"
    
    # Show some basic functionality
    log_info "📦 Patterns loaded successfully"
    log_success "✅ Ready for AI-assisted development"
    
    # Demonstrate error handling
    if [[ "${1:-}" == "--error-demo" ]]; then
        log_warn "⚠️ Demonstrating error handling..."
        handle_error $LINENO "This is a demo error (not a real problem)"
    fi
    
    log_info "🎯 This is how easy it is to build with Claude Code Builder patterns!"
}

# Run the example
main "$@"