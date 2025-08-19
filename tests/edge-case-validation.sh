#!/bin/bash
# Technical: Comprehensive edge case validation testing boundary conditions, unusual inputs, and extreme scenarios
# Simple: Like testing how your car handles ice, potholes, and steep hills - ensures it works in tough conditions
# Connection: Teaches boundary testing and defensive programming essential for robust software systems

set -e

# Test configuration
TEST_DIR="/tmp/edge-case-test-$$"
RESULTS_FILE="$TEST_DIR/edge_case_results.log"
PASSED=0
FAILED=0

# Setup test environment
setup_test_env() {
    mkdir -p "$TEST_DIR"
    echo "🧪 Edge Case Validation Suite - $(date)" > "$RESULTS_FILE"
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

# Test 1: Empty and Null Input Handling
test_empty_inputs() {
    echo "🚫 Testing Empty and Null Input Handling..."
    
    source ./patterns/logging/simple-logging.sh >/dev/null 2>&1 || {
        test_result "Empty Inputs" "FAIL" "Could not load logging pattern"
        return 1
    }
    
    local test_passed=true
    
    # Test empty string
    if ! log_info "" >/dev/null 2>&1; then
        test_passed=false
    fi
    
    # Test with just spaces
    if ! log_info "   " >/dev/null 2>&1; then
        test_passed=false
    fi
    
    # Test with newlines
    if ! log_info $'\n\n' >/dev/null 2>&1; then
        test_passed=false
    fi
    
    if [[ "$test_passed" == "true" ]]; then
        test_result "Empty Inputs" "PASS" "Handles empty/null inputs gracefully"
    else
        test_result "Empty Inputs" "FAIL" "Some empty input tests failed"
    fi
}

# Test 2: Special Characters and Unicode
test_special_characters() {
    echo "🔣 Testing Special Characters and Unicode..."
    
    source ./patterns/logging/simple-logging.sh >/dev/null 2>&1 || {
        test_result "Special Characters" "FAIL" "Could not load logging pattern"
        return 1
    }
    
    local test_passed=true
    local special_inputs=(
        "Special chars: !@#$%^&*()_+-={}[]|\\:;\"'<>?,./"
        "Unicode: 🚀 🎉 ✅ ❌ 🔍 💾"
        "Escape sequences: \t\n\r\b\f"
        "Mixed: Hello 世界 🌍 Test"
    )
    
    for input in "${special_inputs[@]}"; do
        if ! log_info "$input" >/dev/null 2>&1; then
            test_passed=false
            break
        fi
    done
    
    if [[ "$test_passed" == "true" ]]; then
        test_result "Special Characters" "PASS" "Handles special characters and unicode"
    else
        test_result "Special Characters" "FAIL" "Some special character tests failed"
    fi
}

# Test 3: Very Long Input Strings
test_long_inputs() {
    echo "📏 Testing Very Long Input Strings..."
    
    source ./patterns/logging/simple-logging.sh >/dev/null 2>&1 || {
        test_result "Long Inputs" "FAIL" "Could not load logging pattern"
        return 1
    }
    
    # Generate very long string (1000 characters)
    local long_string=$(printf 'A%.0s' {1..1000})
    
    # Generate extremely long string (10000 characters)  
    local very_long_string=$(printf 'B%.0s' {1..10000})
    
    local test_passed=true
    
    # Test long string
    if ! log_info "$long_string" >/dev/null 2>&1; then
        test_passed=false
    fi
    
    # Test very long string
    if ! log_info "$very_long_string" >/dev/null 2>&1; then
        test_passed=false
    fi
    
    if [[ "$test_passed" == "true" ]]; then
        test_result "Long Inputs" "PASS" "Handles very long strings (up to 10K chars)"
    else
        test_result "Long Inputs" "FAIL" "Long string handling failed"
    fi
}

# Test 4: Filesystem Edge Cases
test_filesystem_edge_cases() {
    echo "📁 Testing Filesystem Edge Cases..."
    
    source ./patterns/configuration/config-reader.sh >/dev/null 2>&1 || {
        test_result "Filesystem Edge Cases" "FAIL" "Could not load config pattern"
        return 1
    }
    
    local test_passed=true
    
    # Test non-existent file
    local value1=$(get_config "KEY" "/nonexistent/path/file.conf" "default" 2>/dev/null)
    if [[ "$value1" != "default" ]]; then
        test_passed=false
    fi
    
    # Test directory instead of file
    local value2=$(get_config "KEY" "/tmp" "default" 2>/dev/null)
    if [[ "$value2" != "default" ]]; then
        test_passed=false
    fi
    
    # Test empty file
    touch "$TEST_DIR/empty.conf"
    local value3=$(get_config "KEY" "$TEST_DIR/empty.conf" "default" 2>/dev/null)
    if [[ "$value3" != "default" ]]; then
        test_passed=false
    fi
    
    # Test file with special path characters
    local special_path="$TEST_DIR/file with spaces & special-chars.conf"
    echo "TEST_KEY=test_value" > "$special_path"
    local value4=$(get_config "TEST_KEY" "$special_path" "default" 2>/dev/null)
    if [[ "$value4" != "test_value" ]]; then
        test_passed=false
    fi
    
    if [[ "$test_passed" == "true" ]]; then
        test_result "Filesystem Edge Cases" "PASS" "Handles filesystem edge cases properly"
    else
        test_result "Filesystem Edge Cases" "FAIL" "Some filesystem tests failed"
    fi
}

# Test 5: Concurrent Access Edge Cases
test_concurrent_edge_cases() {
    echo "⚡ Testing Concurrent Access Edge Cases..."
    
    source ./patterns/logging/simple-logging.sh >/dev/null 2>&1 || {
        test_result "Concurrent Edge Cases" "FAIL" "Could not load logging pattern"
        return 1
    }
    
    local pids=()
    local test_file="$TEST_DIR/concurrent_test.log"
    
    # Start multiple processes writing simultaneously
    for i in {1..5}; do
        {
            for j in {1..10}; do
                log_info "Concurrent test process $i iteration $j" >> "$test_file" 2>/dev/null
            done
        } &
        pids+=($!)
    done
    
    # Wait for all processes
    local failed_processes=0
    for pid in "${pids[@]}"; do
        if ! wait "$pid"; then
            failed_processes=$((failed_processes + 1))
        fi
    done
    
    # Check that file was written to
    local line_count=0
    if [[ -f "$test_file" ]]; then
        line_count=$(wc -l < "$test_file" 2>/dev/null || echo "0")
    fi
    
    if [[ $failed_processes -eq 0 ]] && [[ $line_count -gt 0 ]]; then
        test_result "Concurrent Edge Cases" "PASS" "Handles concurrent access (${line_count} log entries)"
    else
        test_result "Concurrent Edge Cases" "FAIL" "$failed_processes processes failed, $line_count lines written"
    fi
}

# Test 6: Resource Exhaustion Simulation
test_resource_exhaustion() {
    echo "💾 Testing Resource Exhaustion Simulation..."
    
    source ./patterns/error-handling/simple-error-handling.sh >/dev/null 2>&1 || {
        test_result "Resource Exhaustion" "FAIL" "Could not load error handling pattern"
        return 1
    }
    
    # Test handling when temp space might be limited
    local temp_files=()
    local creation_success=0
    local max_files=100
    
    # Try to create many temp files
    for ((i=1; i<=max_files; i++)); do
        local temp_file="$TEST_DIR/temp_$i.txt"
        if echo "test data $i" > "$temp_file" 2>/dev/null; then
            temp_files+=("$temp_file")
            creation_success=$((creation_success + 1))
        else
            break
        fi
    done
    
    # Cleanup temp files
    for temp_file in "${temp_files[@]}"; do
        rm -f "$temp_file" 2>/dev/null
    done
    
    if [[ $creation_success -gt 50 ]]; then
        test_result "Resource Exhaustion" "PASS" "Created $creation_success temp files successfully"
    else
        test_result "Resource Exhaustion" "FAIL" "Only created $creation_success temp files"
    fi
}

# Test 7: Invalid Project Structure Edge Cases
test_invalid_project_structures() {
    echo "🏗️ Testing Invalid Project Structure Edge Cases..."
    
    source ./patterns/dependencies/dependency-checker.sh >/dev/null 2>&1 || {
        test_result "Invalid Project Structures" "FAIL" "Could not load dependency checker"
        return 1
    }
    
    local test_passed=true
    
    # Test empty directory
    mkdir -p "$TEST_DIR/empty_project"
    local type1=$(detect_project_type "$TEST_DIR/empty_project" 2>/dev/null)
    if [[ "$type1" != "unknown" ]]; then
        test_passed=false
    fi
    
    # Test directory with conflicting files
    mkdir -p "$TEST_DIR/conflicted_project"
    echo '{"name": "test"}' > "$TEST_DIR/conflicted_project/package.json"
    echo "requests==2.25.1" > "$TEST_DIR/conflicted_project/requirements.txt"
    echo "module test" > "$TEST_DIR/conflicted_project/go.mod"
    
    local type2=$(detect_project_type "$TEST_DIR/conflicted_project" 2>/dev/null)
    # Should detect first match (nodejs)
    if [[ "$type2" != "nodejs" ]]; then
        test_passed=false
    fi
    
    # Test with broken files
    mkdir -p "$TEST_DIR/broken_project"  
    echo "invalid json content" > "$TEST_DIR/broken_project/package.json"
    
    local type3=$(detect_project_type "$TEST_DIR/broken_project" 2>/dev/null)
    # Should still detect nodejs based on file presence
    if [[ "$type3" != "nodejs" ]]; then
        test_passed=false
    fi
    
    if [[ "$test_passed" == "true" ]]; then
        test_result "Invalid Project Structures" "PASS" "Handles invalid project structures gracefully"
    else
        test_result "Invalid Project Structures" "FAIL" "Some project structure tests failed"
    fi
}

# Test 8: Boundary Value Testing
test_boundary_values() {
    echo "🎯 Testing Boundary Values..."
    
    source ./patterns/dependencies/dependency-checker.sh >/dev/null 2>&1 || {
        test_result "Boundary Values" "FAIL" "Could not load dependency checker"
        return 1
    }
    
    local test_passed=true
    
    # Test with maximum path length (near system limits)
    local long_path="$TEST_DIR"
    for ((i=1; i<=10; i++)); do
        long_path="$long_path/very_long_directory_name_that_might_cause_issues_$i"
    done
    
    # Try to create the deep directory structure
    if mkdir -p "$long_path" 2>/dev/null; then
        local type=$(detect_project_type "$long_path" 2>/dev/null)
        if [[ "$type" != "unknown" ]]; then
            test_passed=false
        fi
    fi
    
    # Test with minimum inputs
    local type_empty=$(detect_project_type "" 2>/dev/null)
    if [[ "$type_empty" == "" ]]; then
        test_passed=false
    fi
    
    if [[ "$test_passed" == "true" ]]; then
        test_result "Boundary Values" "PASS" "Handles boundary value conditions"
    else
        test_result "Boundary Values" "FAIL" "Some boundary value tests failed"
    fi
}

# Generate comprehensive edge case report
generate_edge_case_report() {
    echo ""
    echo "🧪 Edge Case Validation Results"
    echo "=============================="
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
        echo "🎉 All edge case tests passed!"
        echo "✅ Claude Code Builder handles edge cases gracefully"
        echo "🛡️ System is robust against unusual conditions"
    elif [[ $success_rate -ge 80 ]]; then
        echo "⚠️ Most edge case tests passed"
        echo "🔧 Some edge cases need attention"
    else
        echo "❌ Edge case handling needs improvement"
        echo "🚨 System may fail under unusual conditions"
    fi
    
    echo ""
    echo "📝 Detailed results saved to: $RESULTS_FILE"
    
    # Edge case summary
    echo ""
    echo "🔍 Edge Cases Tested:"
    echo "- Empty and null inputs"
    echo "- Special characters and unicode"
    echo "- Very long strings (up to 10K chars)"
    echo "- Filesystem edge cases"
    echo "- Concurrent access scenarios"
    echo "- Resource exhaustion simulation"
    echo "- Invalid project structures"
    echo "- Boundary value conditions"
    
    # Return appropriate exit code
    [[ $FAILED -eq 0 ]]
}

# Main execution
main() {
    echo "🧪 Claude Code Builder Edge Case Validation Suite"
    echo "================================================"
    echo ""
    
    setup_test_env
    trap cleanup_test_env EXIT
    
    # Run all edge case tests
    test_empty_inputs
    test_special_characters
    test_long_inputs
    test_filesystem_edge_cases
    test_concurrent_edge_cases
    test_resource_exhaustion
    test_invalid_project_structures
    test_boundary_values
    
    generate_edge_case_report
}

# Run if called directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi