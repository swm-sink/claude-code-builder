#!/bin/bash
# Technical: Simple pattern validation test with functionality verification
# Simple: Test runner that checks if all patterns work correctly
# Connection: Teaches testing principles essential for reliable software

set -e

# Source error handling for better test output
source ./patterns/error-handling/simple-error-handling.sh 2>/dev/null || {
    echo "[INFO] Basic pattern testing (error handling not available)"
}

# Load test helpers
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/test-helpers.sh" 2>/dev/null

# Main test workflow
main() {
    init_tests
    
    # Test core patterns
    test_pattern "Error handling" "./patterns/error-handling/simple-error-handling.sh"
    test_pattern "Dependency checker" "./patterns/dependencies/dependency-checker.sh" "detect_project_type"
    test_pattern "Test runner" "./patterns/testing/simple-test-runner.sh"
    test_pattern "Quality gates" "./patterns/quality-gates/quality-check.sh"
    test_pattern "Security basics" "./patterns/security/security-basics.sh"
    test_pattern "Logging" "./patterns/logging/simple-logging.sh"
    test_pattern "Git hooks" "./patterns/git-hooks/git-hooks-setup.sh"
    
    # Show results
    show_test_results
}

# Run tests
main "$@"