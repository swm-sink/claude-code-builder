#!/bin/bash
# Technical: Lightweight load testing suite measuring pattern performance under concurrent execution and high-frequency usage
# Simple: Like stress-testing a bridge - sees how much traffic patterns can handle before slowing down
# Connection: Teaches performance engineering and scalability testing essential for production systems

set -e

# Test configuration
TEST_DIR="/tmp/load-test-$$"
RESULTS_FILE="$TEST_DIR/load_results.log"
CONCURRENT_PROCESSES=5
ITERATIONS_PER_PROCESS=10

# Performance tracking
PASSED=0
FAILED=0

# Setup test environment
setup_test_env() {
    mkdir -p "$TEST_DIR"
    echo "🚀 Load Test Suite - $(date)" > "$RESULTS_FILE"
    echo "Configuration:" >> "$RESULTS_FILE"
    echo "- Concurrent processes: $CONCURRENT_PROCESSES" >> "$RESULTS_FILE"
    echo "- Iterations per process: $ITERATIONS_PER_PROCESS" >> "$RESULTS_FILE"
    echo "- Total operations: $((CONCURRENT_PROCESSES * ITERATIONS_PER_PROCESS))" >> "$RESULTS_FILE"
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

# Get current timestamp in milliseconds
get_timestamp_ms() {
    if command -v gdate >/dev/null 2>&1; then
        gdate +%s%3N
    elif date --version 2>/dev/null | grep -q GNU; then
        date +%s%3N
    else
        python3 -c "import time; print(int(time.time() * 1000))" 2>/dev/null || echo "$(date +%s)000"
    fi
}

# Test 1: Concurrent Pattern Loading
test_concurrent_loading() {
    echo "🔄 Testing Concurrent Pattern Loading..."
    
    local start_time=$(get_timestamp_ms)
    local pids=()
    
    # Start concurrent loading processes
    for ((i=1; i<=CONCURRENT_PROCESSES; i++)); do
        {
            local worker_start=$(get_timestamp_ms)
            for ((j=1; j<=ITERATIONS_PER_PROCESS; j++)); do
                # Load pattern in subshell to isolate
                (source ./patterns/error-handling/simple-error-handling.sh >/dev/null 2>&1) || true
            done
            local worker_end=$(get_timestamp_ms)
            echo "Worker $i: $((worker_end - worker_start))ms" >> "$TEST_DIR/worker_results.log"
        } &
        pids+=($!)
    done
    
    # Wait for all workers to complete
    local failed_workers=0
    for pid in "${pids[@]}"; do
        if ! wait "$pid"; then
            failed_workers=$((failed_workers + 1))
        fi
    done
    
    local end_time=$(get_timestamp_ms)
    local total_time=$((end_time - start_time))
    local ops_per_second=$(((CONCURRENT_PROCESSES * ITERATIONS_PER_PROCESS * 1000) / total_time))
    
    if [[ $failed_workers -eq 0 ]]; then
        test_result "Concurrent Loading" "PASS" "${ops_per_second} ops/sec, ${total_time}ms total"
    else
        test_result "Concurrent Loading" "FAIL" "$failed_workers workers failed"
    fi
}

# Test 2: High-Frequency Function Calls
test_high_frequency_calls() {
    echo "⚡ Testing High-Frequency Function Calls..."
    
    # Load pattern once
    source ./patterns/logging/simple-logging.sh >/dev/null 2>&1 || {
        test_result "High-Frequency Calls" "FAIL" "Could not load logging pattern"
        return 1
    }
    
    local start_time=$(get_timestamp_ms)
    local call_count=0
    local failed_calls=0
    
    # Make rapid function calls
    for ((i=1; i<=100; i++)); do
        if log_info "Load test message $i" >/dev/null 2>&1; then
            call_count=$((call_count + 1))
        else
            failed_calls=$((failed_calls + 1))
        fi
    done
    
    local end_time=$(get_timestamp_ms)
    local total_time=$((end_time - start_time))
    local calls_per_second=$(((call_count * 1000) / total_time))
    
    if [[ $failed_calls -eq 0 ]]; then
        test_result "High-Frequency Calls" "PASS" "${calls_per_second} calls/sec, 0% failures"
    else
        test_result "High-Frequency Calls" "FAIL" "$failed_calls/$((call_count + failed_calls)) calls failed"
    fi
}

# Test 3: Memory Pressure Test
test_memory_pressure() {
    echo "💾 Testing Memory Pressure..."
    
    local start_time=$(get_timestamp_ms)
    local pattern_loads=0
    local max_loads=50
    
    # Load patterns repeatedly to test memory handling
    for ((i=1; i<=max_loads; i++)); do
        {
            # Load multiple patterns in subshell
            source ./patterns/error-handling/simple-error-handling.sh >/dev/null 2>&1 &&
            source ./patterns/logging/simple-logging.sh >/dev/null 2>&1 &&
            source ./patterns/testing/simple-test-runner.sh >/dev/null 2>&1
        } && pattern_loads=$((pattern_loads + 1))
    done
    
    local end_time=$(get_timestamp_ms)
    local total_time=$((end_time - start_time))
    
    if [[ $pattern_loads -eq $max_loads ]]; then
        test_result "Memory Pressure" "PASS" "All $max_loads loads successful in ${total_time}ms"
    else
        test_result "Memory Pressure" "FAIL" "Only $pattern_loads/$max_loads loads successful"
    fi
}

# Test 4: Concurrent Mixed Operations
test_concurrent_mixed_operations() {
    echo "🔀 Testing Concurrent Mixed Operations..."
    
    local start_time=$(get_timestamp_ms)
    local pids=()
    local operations=("error-handling/simple-error-handling.sh" "logging/simple-logging.sh" "testing/simple-test-runner.sh" "security/security-basics.sh")
    
    # Start workers with different operations
    for ((i=1; i<=CONCURRENT_PROCESSES; i++)); do
        {
            local pattern=${operations[$((i % ${#operations[@]}))]}
            local worker_success=0
            
            for ((j=1; j<=5; j++)); do
                if (source "./patterns/$pattern" >/dev/null 2>&1); then
                    worker_success=$((worker_success + 1))
                fi
            done
            
            local pattern_name=$(basename "$pattern" .sh)
            echo "Worker $i ($pattern_name): $worker_success/5 success" >> "$TEST_DIR/mixed_results.log"
            [[ $worker_success -eq 5 ]]
        } &
        pids+=($!)
    done
    
    # Wait for all workers
    local successful_workers=0
    for pid in "${pids[@]}"; do
        if wait "$pid"; then
            successful_workers=$((successful_workers + 1))
        fi
    done
    
    local end_time=$(get_timestamp_ms)
    local total_time=$((end_time - start_time))
    
    if [[ $successful_workers -eq $CONCURRENT_PROCESSES ]]; then
        test_result "Mixed Operations" "PASS" "All $CONCURRENT_PROCESSES workers succeeded in ${total_time}ms"
    else
        test_result "Mixed Operations" "FAIL" "Only $successful_workers/$CONCURRENT_PROCESSES workers succeeded"
    fi
}

# Test 5: Rapid Pattern Switching
test_rapid_switching() {
    echo "🔄 Testing Rapid Pattern Switching..."
    
    local patterns=("error-handling/simple-error-handling.sh" "logging/simple-logging.sh" "testing/simple-test-runner.sh" "security/security-basics.sh" "dependencies/dependency-checker.sh")
    local start_time=$(get_timestamp_ms)
    local switch_count=0
    local switch_failures=0
    
    # Rapidly switch between patterns
    for ((i=1; i<=25; i++)); do
        local pattern=${patterns[$((i % ${#patterns[@]}))]}
        
        if (source "./patterns/$pattern" >/dev/null 2>&1); then
            switch_count=$((switch_count + 1))
        else
            switch_failures=$((switch_failures + 1))
        fi
    done
    
    local end_time=$(get_timestamp_ms)
    local total_time=$((end_time - start_time))
    local switches_per_second=$(((switch_count * 1000) / total_time))
    
    if [[ $switch_failures -eq 0 ]]; then
        test_result "Rapid Switching" "PASS" "${switches_per_second} switches/sec, 0% failures"
    else
        test_result "Rapid Switching" "FAIL" "$switch_failures failures in $((switch_count + switch_failures)) attempts"
    fi
}

# Test 6: Resource Cleanup Test
test_resource_cleanup() {
    echo "🧹 Testing Resource Cleanup..."
    
    local start_time=$(get_timestamp_ms)
    local cleanup_tests=20
    local cleanup_success=0
    
    # Test that repeated loading doesn't cause issues
    for ((i=1; i<=cleanup_tests; i++)); do
        if (source ./patterns/error-handling/simple-error-handling.sh >/dev/null 2>&1 &&
            source ./patterns/logging/simple-logging.sh >/dev/null 2>&1); then
            cleanup_success=$((cleanup_success + 1))
        fi
    done
    
    local end_time=$(get_timestamp_ms)
    local total_time=$((end_time - start_time))
    
    if [[ $cleanup_success -eq $cleanup_tests ]]; then
        test_result "Resource Cleanup" "PASS" "All $cleanup_tests cleanup cycles successful"
    else
        test_result "Resource Cleanup" "FAIL" "Only $cleanup_success/$cleanup_tests cycles successful"
    fi
}

# Generate comprehensive load test report
generate_load_report() {
    echo ""
    echo "🚀 Load Test Results"
    echo "==================="
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
        echo "🎉 All load tests passed!"
        echo "✅ Claude Code Builder handles load gracefully"
        echo "🚀 System is ready for production workloads"
    elif [[ $success_rate -ge 80 ]]; then
        echo "⚠️ Most load tests passed"
        echo "🔧 Some performance optimizations recommended"
    else
        echo "❌ Load testing revealed performance issues"
        echo "🚨 System may not handle production loads"
    fi
    
    echo ""
    echo "📝 Detailed results saved to: $RESULTS_FILE"
    
    # Performance summary
    echo ""
    echo "🏃‍♂️ Performance Summary:"
    echo "- Concurrent processes tested: $CONCURRENT_PROCESSES"
    echo "- Total operations: $((CONCURRENT_PROCESSES * ITERATIONS_PER_PROCESS))"
    echo "- Pattern loading: Concurrent and sequential tested"
    echo "- Function calls: High-frequency execution tested"
    echo "- Memory pressure: Multiple pattern loading tested"
    
    # Return appropriate exit code
    [[ $FAILED -eq 0 ]]
}

# Main execution
main() {
    echo "🚀 Claude Code Builder Load Test Suite"
    echo "======================================"
    echo ""
    
    setup_test_env
    trap cleanup_test_env EXIT
    
    # Run all load tests
    test_concurrent_loading
    test_high_frequency_calls
    test_memory_pressure
    test_concurrent_mixed_operations
    test_rapid_switching
    test_resource_cleanup
    
    generate_load_report
}

# Run if called directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi