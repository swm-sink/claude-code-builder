#!/bin/bash
# Technical: Comprehensive pattern functionality testing with actual function execution
# Simple: Tests that verify pattern functions actually work, not just load
# Connection: Teaches functional testing essential for reliable code libraries

set -e

# Test configuration
PASSED=0
FAILED=0
TEST_DIR="/tmp/pattern-func-test-$$"

# Clean test environment
cleanup() {
    rm -rf "$TEST_DIR" 2>/dev/null || true
}
trap cleanup EXIT

# Load test helpers
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/function-test-helpers.sh"

# Main test execution
main() {
    echo "🚀 Starting pattern functionality tests..."
    
    test_error_handling_functions
    test_dependency_checker_functions
    test_configuration_functions
    test_security_and_hooks
    
    echo ""
    echo "📊 Functionality Test Results: $PASSED passed, $FAILED failed"
    
    if [ "$FAILED" -eq 0 ]; then
        echo "🎉 All pattern functionality tests passed!"
        return 0
    else
        echo "💥 Some pattern functionality tests failed"
        return 1
    fi
}

# Execute tests
main "$@"