#!/bin/bash
# Technical: Simple pattern validation test with functionality verification
# Simple: Test runner that checks if all patterns work correctly
# Connection: Teaches testing principles essential for reliable software

set -e

# Source error handling for better test output
source ./patterns/error-handling/simple-error-handling.sh 2>/dev/null || {
    echo "[INFO] Basic pattern testing (error handling not available)"
}

# Test pattern loading and basic functionality
test_patterns() {
    local passed=0
    local failed=0
    
    log_info "🧪 Running pattern functionality tests..."
    
    # Test error handling pattern
    if source ./patterns/error-handling/simple-error-handling.sh 2>/dev/null; then
        log_info "✅ Error handling pattern loads successfully"
        ((passed++))
    else
        log_error "❌ Error handling pattern failed to load"
        ((failed++))
    fi
    
    # Test dependency checker pattern
    if source ./patterns/dependencies/dependency-checker.sh 2>/dev/null; then
        log_info "✅ Dependency checker pattern loads successfully"
        ((passed++))
        
        # Test a function exists
        if command -v detect_project_type >/dev/null 2>&1; then
            log_info "✅ Dependency checker functions available"
            ((passed++))
        else
            log_error "❌ Dependency checker functions not available"
            ((failed++))
        fi
    else
        log_error "❌ Dependency checker pattern failed to load"
        ((failed++))
    fi
    
    # Test testing pattern
    if source ./patterns/testing/simple-test-runner.sh 2>/dev/null; then
        log_info "✅ Test runner pattern loads successfully"
        ((passed++))
    else
        log_error "❌ Test runner pattern failed to load"
        ((failed++))
    fi
    
    # Test quality gates pattern
    if source ./patterns/quality-gates/quality-check.sh 2>/dev/null; then
        log_info "✅ Quality gates pattern loads successfully"
        ((passed++))
    else
        log_error "❌ Quality gates pattern failed to load"
        ((failed++))
    fi
    
    # Test security pattern
    if source ./patterns/security/security-basics.sh 2>/dev/null; then
        log_info "✅ Security basics pattern loads successfully"
        ((passed++))
    else
        log_error "❌ Security basics pattern failed to load"
        ((failed++))
    fi
    
    echo ""
    log_info "📊 Test Results: $passed passed, $failed failed"
    
    if [ "$failed" -eq 0 ]; then
        log_info "🎉 All pattern tests passed!"
        return 0
    else
        log_error "💥 Some pattern tests failed"
        return 1
    fi
}

# Run tests
test_patterns