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

# Test error handling pattern functions
test_error_handling_functions() {
    echo "🧪 Testing error handling pattern functions..."
    
    source ./patterns/error-handling/simple-error-handling.sh
    
    # Test log_info function
    if log_info "test message" 2>&1 | grep -q "test message"; then
        echo "✅ log_info function works"
        ((PASSED++))
    else
        echo "❌ log_info function failed"
        ((FAILED++))
    fi
    
    # Test log_warn function
    if log_warn "test warning" 2>&1 | grep -q "test warning"; then
        echo "✅ log_warn function works"
        ((PASSED++))
    else
        echo "❌ log_warn function failed"
        ((FAILED++))
    fi
    
    # Test log_error function
    if log_error "test error" 2>&1 | grep -q "test error"; then
        echo "✅ log_error function works"
        ((PASSED++))
    else
        echo "❌ log_error function failed"
        ((FAILED++))
    fi
}

# Test dependency checker functions
test_dependency_checker_functions() {
    echo "🧪 Testing dependency checker pattern functions..."
    
    source ./patterns/dependencies/dependency-checker.sh
    
    # Test project type detection
    mkdir -p "$TEST_DIR/nodejs-project"
    echo '{"name": "test"}' > "$TEST_DIR/nodejs-project/package.json"
    
    if [[ "$(detect_project_type "$TEST_DIR/nodejs-project")" == "nodejs" ]]; then
        echo "✅ Node.js project detection works"
        ((PASSED++))
    else
        echo "❌ Node.js project detection failed"
        ((FAILED++))
    fi
    
    # Test Python project detection
    mkdir -p "$TEST_DIR/python-project"
    echo "requests==2.25.1" > "$TEST_DIR/python-project/requirements.txt"
    
    if [[ "$(detect_project_type "$TEST_DIR/python-project")" == "python" ]]; then
        echo "✅ Python project detection works"
        ((PASSED++))
    else
        echo "❌ Python project detection failed"
        ((FAILED++))
    fi
    
    # Test unknown project detection
    mkdir -p "$TEST_DIR/unknown-project"
    
    if [[ "$(detect_project_type "$TEST_DIR/unknown-project")" == "unknown" ]]; then
        echo "✅ Unknown project detection works"
        ((PASSED++))
    else
        echo "❌ Unknown project detection failed"
        ((FAILED++))
    fi
}

# Test configuration functions
test_configuration_functions() {
    echo "🧪 Testing configuration pattern functions..."
    
    source ./patterns/configuration/config-reader.sh
    
    # Test environment variable reading
    export TEST_VAR="test_value"
    if [[ "$(get_config "TEST_VAR" "" "default")" == "test_value" ]]; then
        echo "✅ Environment variable reading works"
        ((PASSED++))
    else
        echo "❌ Environment variable reading failed"
        ((FAILED++))
    fi
    
    # Test default value fallback
    if [[ "$(get_config "NONEXISTENT_VAR" "" "default_val")" == "default_val" ]]; then
        echo "✅ Default value fallback works"
        ((PASSED++))
    else
        echo "❌ Default value fallback failed"
        ((FAILED++))
    fi
    
    unset TEST_VAR
}

# Test security functions
test_security_functions() {
    echo "🧪 Testing security pattern functions..."
    
    source ./patterns/security/security-basics.sh
    
    # Test basic security scan function exists and runs
    if command -v basic_security_scan >/dev/null 2>&1; then
        echo "✅ Security scan function available"
        ((PASSED++))
        
        # Test that it runs without error
        if basic_security_scan . 2>/dev/null; then
            echo "✅ Security scan executes successfully"
            ((PASSED++))
        else
            echo "❌ Security scan execution failed"
            ((FAILED++))
        fi
    else
        echo "❌ Security scan function not available"
        ((FAILED++))
    fi
}

# Test git hooks functionality
test_git_hooks_functions() {
    echo "🧪 Testing git hooks pattern functions..."
    
    source ./patterns/git-hooks/git-hooks-setup.sh
    
    # Test that setup function exists
    if command -v setup_git_hooks >/dev/null 2>&1; then
        echo "✅ Git hooks setup function available"
        ((PASSED++))
    else
        echo "❌ Git hooks setup function not available"
        ((FAILED++))
    fi
}

# Main test execution
main() {
    echo "🚀 Starting pattern functionality tests..."
    
    test_error_handling_functions
    test_dependency_checker_functions
    test_configuration_functions
    test_security_functions
    test_git_hooks_functions
    
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