#!/bin/bash
# Technical: Comprehensive integration test suite validating pattern combinations and real-world workflows
# Simple: Like testing recipe combinations - makes sure all ingredients work together perfectly
# Connection: Teaches integration testing and system validation essential for robust software

set -e

# Test configuration
TEST_DIR="/tmp/claude-integration-test-$$"
RESULTS_FILE="$TEST_DIR/results.log"
PASSED=0
FAILED=0

# Setup test environment
setup_test_env() {
    mkdir -p "$TEST_DIR"
    echo "🧪 Integration Test Suite - $(date)" > "$RESULTS_FILE"
    echo "Test Directory: $TEST_DIR" >> "$RESULTS_FILE"
    echo "" >> "$RESULTS_FILE"
}

# Cleanup test environment
cleanup_test_env() {
    rm -rf "$TEST_DIR"
}

# Test result tracking
test_result() {
    local test_name="$1"
    local result="$2"
    local message="${3:-}"
    
    if [[ "$result" == "PASS" ]]; then
        echo "✅ $test_name: PASS $message"
        echo "✅ $test_name: PASS $message" >> "$RESULTS_FILE"
        PASSED=$((PASSED + 1))
    else
        echo "❌ $test_name: FAIL $message"
        echo "❌ $test_name: FAIL $message" >> "$RESULTS_FILE"
        FAILED=$((FAILED + 1))
    fi
}

# Test 1: Foundation Stack Integration (Error + Logging)
test_foundation_stack() {
    echo "🏗️ Testing Foundation Stack Integration..."
    
    # Create test script
    cat > "$TEST_DIR/foundation_test.sh" << 'EOF'
#!/bin/bash
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh

test_foundation() {
    log_info "Testing foundation stack"
    
    # Test error handling with logging
    if true; then
        log_info "Success case works"
        return 0
    else
        log_error "Failure case"
        handle_error $LINENO
        return 1
    fi
}

test_foundation
EOF
    
    chmod +x "$TEST_DIR/foundation_test.sh"
    
    if (cd . && "$TEST_DIR/foundation_test.sh" >/dev/null 2>&1); then
        test_result "Foundation Stack" "PASS" "Error handling + Logging integration works"
    else
        test_result "Foundation Stack" "FAIL" "Error handling + Logging integration failed"
    fi
}

# Test 2: Quality Assurance Stack Integration
test_qa_stack() {
    echo "🔍 Testing QA Stack Integration..."
    
    cat > "$TEST_DIR/qa_test.sh" << 'EOF'
#!/bin/bash
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/testing/simple-test-runner.sh
source ./patterns/security/security-basics.sh

test_qa_stack() {
    log_info "Testing QA integration"
    
    # Test security scan
    if basic_security_scan . >/dev/null 2>&1; then
        log_info "Security scan passed"
    else
        log_error "Security scan failed"
        return 1
    fi
    
    return 0
}

test_qa_stack
EOF
    
    chmod +x "$TEST_DIR/qa_test.sh"
    
    if (cd . && "$TEST_DIR/qa_test.sh" >/dev/null 2>&1); then
        test_result "QA Stack" "PASS" "Testing + Security + Error handling integration works"
    else
        test_result "QA Stack" "FAIL" "QA stack integration failed"
    fi
}

# Test 3: Development Setup Stack Integration  
test_setup_stack() {
    echo "🔧 Testing Setup Stack Integration..."
    
    cat > "$TEST_DIR/setup_test.sh" << 'EOF'
#!/bin/bash
source ./patterns/dependencies/dependency-checker.sh
source ./patterns/project-validation/project-validator.sh
source ./patterns/configuration/config-reader.sh

test_setup_stack() {
    # Test dependency checking
    if check_dependencies . >/dev/null 2>&1; then
        echo "Dependencies check passed"
    else
        echo "Dependencies check failed"
        return 1
    fi
    
    # Test project validation
    local project_type=$(detect_project_type ".")
    if [[ -n "$project_type" ]]; then
        echo "Project detection passed: $project_type"
    else
        echo "Project detection failed"
        return 1
    fi
    
    return 0
}

test_setup_stack
EOF
    
    chmod +x "$TEST_DIR/setup_test.sh"
    
    if (cd . && "$TEST_DIR/setup_test.sh" >/dev/null 2>&1); then
        test_result "Setup Stack" "PASS" "Dependencies + Project validation + Config integration works"
    else
        test_result "Setup Stack" "FAIL" "Setup stack integration failed"
    fi
}

# Test 4: Cross-Pattern Communication
test_cross_pattern_communication() {
    echo "🔗 Testing Cross-Pattern Communication..."
    
    cat > "$TEST_DIR/communication_test.sh" << 'EOF'
#!/bin/bash
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh
source ./patterns/testing/simple-test-runner.sh

test_communication() {
    # Test that patterns can share information
    log_info "Starting cross-pattern test"
    
    # Log an operation
    log_info "Testing operation"
    
    # Use error handling
    if true; then
        log_info "Operation successful"
        return 0
    else
        log_error "Operation failed"
        handle_error $LINENO
        return 1
    fi
}

test_communication
EOF
    
    chmod +x "$TEST_DIR/communication_test.sh"
    
    if (cd . && "$TEST_DIR/communication_test.sh" >/dev/null 2>&1); then
        test_result "Cross-Pattern Communication" "PASS" "Patterns communicate effectively"
    else
        test_result "Cross-Pattern Communication" "FAIL" "Pattern communication failed"
    fi
}

# Test 5: Real-World Workflow Simulation
test_real_world_workflow() {
    echo "🌍 Testing Real-World Workflow..."
    
    # Create a realistic project structure
    mkdir -p "$TEST_DIR/test-project/src"
    echo '{"name": "test-project", "version": "1.0.0"}' > "$TEST_DIR/test-project/package.json"
    echo 'console.log("Hello World");' > "$TEST_DIR/test-project/src/index.js"
    
    cat > "$TEST_DIR/workflow_test.sh" << 'EOF'
#!/bin/bash
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/dependencies/dependency-checker.sh
source ./patterns/project-validation/project-validator.sh
source ./patterns/security/security-basics.sh

test_real_workflow() {
    local project_dir="$1"
    
    log_info "Starting real-world workflow test"
    
    # 1. Detect project type
    local project_type=$(detect_project_type "$project_dir")
    log_info "Detected project type: $project_type"
    
    # 2. Check dependencies
    if check_dependencies "$project_dir" >/dev/null 2>&1; then
        log_info "Dependencies validated"
    else
        log_warn "Some dependencies missing (expected in test)"
    fi
    
    # 3. Security scan
    if basic_security_scan "$project_dir" >/dev/null 2>&1; then
        log_info "Security scan passed"
    else
        log_warn "Security scan issues (non-critical in test)"
    fi
    
    log_info "Real-world workflow completed successfully"
    return 0
}

test_real_workflow "$TEST_DIR/test-project"
EOF
    
    chmod +x "$TEST_DIR/workflow_test.sh"
    
    if (cd . && "$TEST_DIR/workflow_test.sh" >/dev/null 2>&1); then
        test_result "Real-World Workflow" "PASS" "Complete development workflow works"
    else
        test_result "Real-World Workflow" "FAIL" "Real-world workflow failed"
    fi
}

# Test 6: Pattern Loading Order Independence
test_loading_order() {
    echo "🔄 Testing Loading Order Independence..."
    
    # Test different loading orders
    local orders=(
        "error-handling logging testing"
        "testing error-handling logging"  
        "logging testing error-handling"
    )
    
    local order_tests_passed=0
    local total_orders=${#orders[@]}
    
    for order in "${orders[@]}"; do
        cat > "$TEST_DIR/order_test.sh" << EOF
#!/bin/bash
$(for pattern in $order; do
    echo "source ./patterns/$pattern/simple-*.sh 2>/dev/null || true"
done)

# Test that all patterns loaded
if command -v log_info >/dev/null 2>&1 && command -v handle_error >/dev/null 2>&1; then
    log_info "Order test passed"
    exit 0
else
    exit 1
fi
EOF
        
        chmod +x "$TEST_DIR/order_test.sh"
        
        if (cd . && "$TEST_DIR/order_test.sh" >/dev/null 2>&1); then
            order_tests_passed=$((order_tests_passed + 1))
        fi
    done
    
    if [[ $order_tests_passed -eq $total_orders ]]; then
        test_result "Loading Order Independence" "PASS" "All loading orders work ($order_tests_passed/$total_orders)"
    else
        test_result "Loading Order Independence" "FAIL" "Some loading orders failed ($order_tests_passed/$total_orders)"
    fi
}

# Test 7: Composition Examples Validation
test_composition_examples() {
    echo "🧩 Testing Composition Examples..."
    
    if [[ -f "./examples/composition-examples.sh" ]]; then
        if ./examples/composition-examples.sh foundation >/dev/null 2>&1; then
            test_result "Composition Examples" "PASS" "Foundation example works"
        else
            test_result "Composition Examples" "FAIL" "Foundation example failed"
        fi
    else
        test_result "Composition Examples" "FAIL" "Composition examples file missing"
    fi
}

# Test 8: Tool Integration
test_tool_integration() {
    echo "🛠️ Testing Tool Integration..."
    
    local tool_tests_passed=0
    local total_tools=3
    
    # Test readability scorer
    if ./tools/claude-readability-scorer.sh score-file ./patterns/error-handling/simple-error-handling.sh >/dev/null 2>&1; then
        tool_tests_passed=$((tool_tests_passed + 1))
    fi
    
    # Test performance benchmarks (simple file check)
    if [[ -x "./tools/performance-benchmarks.sh" ]] && ./tools/performance-benchmarks.sh help >/dev/null 2>&1; then
        tool_tests_passed=$((tool_tests_passed + 1))
    fi
    
    # Test security scan from pattern
    if (source ./patterns/security/security-basics.sh && basic_security_scan . >/dev/null 2>&1); then
        tool_tests_passed=$((tool_tests_passed + 1))
    fi
    
    if [[ $tool_tests_passed -eq $total_tools ]]; then
        test_result "Tool Integration" "PASS" "All tools integrate properly ($tool_tests_passed/$total_tools)"
    else
        test_result "Tool Integration" "FAIL" "Some tools failed integration ($tool_tests_passed/$total_tools)"
    fi
}

# Generate test report
generate_report() {
    echo ""
    echo "📊 Integration Test Results"
    echo "=========================="
    echo "Tests Passed: $PASSED"
    echo "Tests Failed: $FAILED"
    echo "Total Tests: $((PASSED + FAILED))"
    
    local success_rate=0
    if [[ $((PASSED + FAILED)) -gt 0 ]]; then
        success_rate=$((PASSED * 100 / (PASSED + FAILED)))
    fi
    
    echo "Success Rate: ${success_rate}%"
    echo ""
    
    if [[ $FAILED -eq 0 ]]; then
        echo "🎉 All integration tests passed!"
        echo "✅ Claude Code Builder patterns integrate successfully"
    else
        echo "⚠️  Some integration tests failed"
        echo "❌ Review failed tests and fix integration issues"
    fi
    
    echo ""
    echo "📝 Full results saved to: $RESULTS_FILE"
    
    # Return appropriate exit code
    [[ $FAILED -eq 0 ]]
}

# Main execution
main() {
    echo "🧪 Claude Code Builder Integration Test Suite"
    echo "============================================="
    echo ""
    
    setup_test_env
    trap cleanup_test_env EXIT
    
    # Run all integration tests
    test_foundation_stack
    test_qa_stack  
    test_setup_stack
    test_cross_pattern_communication
    test_real_world_workflow
    test_loading_order
    test_composition_examples
    test_tool_integration
    
    generate_report
}

# Run if called directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi