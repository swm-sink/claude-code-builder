#!/bin/bash
# Technical: Working examples of pattern composition for common development workflows
# Simple: Real examples you can copy and use in your own projects
# Connection: Teaches practical application of modular design patterns

set -e

# Example 1: Foundation Stack (Error + Logging)
foundation_example() {
    echo "🏗️ Foundation Stack Example"
    echo "=========================="
    
    # Load foundation patterns
    source ./patterns/error-handling/simple-error-handling.sh
    source ./patterns/logging/simple-logging.sh
    
    log_info "Starting application..."
    
    # Simulate some work
    if [ "$1" = "fail" ]; then
        log_error "Simulated failure for demonstration"
        handle_error $LINENO
    else
        log_info "Application running successfully"
    fi
}

# Example 2: Quality Assurance Stack
quality_example() {
    echo "🔍 Quality Assurance Stack Example"
    echo "================================="
    
    # Load QA patterns
    source ./patterns/error-handling/simple-error-handling.sh
    source ./patterns/testing/simple-test-runner.sh
    source ./patterns/security/security-basics.sh
    
    log_info "Running quality checks..."
    
    # Security scan
    if basic_security_scan .; then
        log_info "✅ Security scan passed"
    else
        log_warn "⚠️  Security issues detected"
    fi
    
    log_info "Quality check complete"
}

# Example 3: Development Setup Stack
setup_example() {
    echo "🔧 Development Setup Stack Example"
    echo "=================================="
    
    # Load setup patterns
    source ./patterns/error-handling/simple-error-handling.sh
    source ./patterns/dependencies/dependency-checker.sh
    source ./patterns/project-validation/project-validator.sh
    
    local project_dir="${1:-.}"
    
    log_info "Setting up development environment..."
    
    # Check project type
    local project_type=$(detect_project_type "$project_dir")
    log_info "📋 Project type: $project_type"
    
    # Validate dependencies
    if check_dependencies "$project_dir"; then
        log_info "✅ Dependencies satisfied"
    else
        log_warn "⚠️  Missing dependencies"
    fi
    
    # Check project health
    project_health_check "$project_dir"
}

# Example 4: Complete Workflow
complete_example() {
    echo "🚀 Complete Workflow Example"
    echo "============================"
    
    # Load all patterns
    source ./patterns/error-handling/simple-error-handling.sh
    source ./patterns/dependencies/dependency-checker.sh
    source ./patterns/security/security-basics.sh
    
    log_info "Running complete development workflow..."
    
    # 1. Environment check
    if check_dependencies .; then
        log_info "✅ Environment ready"
    else
        log_error "❌ Environment not ready"
        return 1
    fi
    
    # 2. Security check
    if basic_security_scan .; then
        log_info "✅ Security validated"
    else
        log_warn "⚠️  Security issues found"
    fi
    
    log_info "🎉 Workflow complete!"
}

# Main function to run examples
main() {
    echo "🧩 Pattern Composition Examples"
    echo "==============================="
    echo ""
    
    case "${1:-all}" in
        foundation)
            foundation_example "$2"
            ;;
        quality)
            quality_example
            ;;
        setup)
            setup_example "$2"
            ;;
        complete)
            complete_example
            ;;
        all)
            foundation_example
            echo ""
            quality_example
            echo ""
            setup_example
            echo ""
            complete_example
            ;;
        *)
            echo "Usage: $0 [foundation|quality|setup|complete|all] [args...]"
            echo ""
            echo "Examples:"
            echo "  $0 foundation        # Basic error handling + logging"
            echo "  $0 foundation fail   # Demonstrate error handling"
            echo "  $0 quality           # Quality assurance stack"
            echo "  $0 setup /path       # Development setup for path"
            echo "  $0 complete          # Complete workflow"
            echo "  $0 all               # Run all examples"
            ;;
    esac
}

# Run if called directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi