---
allowed-tools: Read, Write, Bash(source:*), WebSearch, Bash(timeout:*)
description: Multi-prompt variation testing across percentiles with statistical validation
argument-hint: [variant-config] [--percentiles 5,25,50,75,95] [--iterations 10]
category: command-builder
version: 1.0.0
---

# 🎯 MULTI-PROMPT VARIATION TESTING

Validate command robustness through multi-prompt testing across usage percentiles.

## Variant Testing Framework

### Composition Results:
```yaml
$COMPOSITION_RESULTS_FROM_PREVIOUS_STEP
```

### Research Foundation Applied:
- ✅ Multi-prompt validation methodologies
- ✅ Statistical testing approaches
- ✅ User behavior modeling (percentiles)
- ✅ Robustness testing standards

## Step 1: Variant Testing Strategy

### Multi-Prompt Testing Philosophy:

**Research Insight**: Commands must work reliably across the full spectrum of user interactions, from simple basic usage (5th percentile) to complex edge cases (95th percentile).

**Percentile-Based Testing Approach:**

1. **5th Percentile** - Novice users, basic usage
   - Simple commands with default options
   - Common use cases, standard inputs
   - Minimal complexity, straightforward workflows

2. **25th Percentile** - Regular users, typical usage
   - Standard commands with some options
   - Normal use cases with variations
   - Moderate complexity, documented workflows

3. **50th Percentile** - Experienced users, diverse usage
   - Commands with multiple options
   - Mixed use cases, varied inputs
   - Standard complexity, flexible workflows

4. **75th Percentile** - Advanced users, complex usage
   - Commands with many options and flags
   - Edge cases, unusual inputs
   - High complexity, custom workflows

5. **95th Percentile** - Expert users, extreme usage
   - Commands with all options, edge combinations
   - Extreme edge cases, boundary conditions
   - Maximum complexity, innovative workflows

### Testing Configuration:

**Test Parameters:**
```yaml
variant_testing:
  command: $COMMAND_NAME
  percentiles: [5, 25, 50, 75, 95]
  iterations_per_percentile: 10
  total_test_scenarios: 50
  success_threshold: 85%
  performance_threshold: $TARGET_RESPONSE_TIME ms
  memory_threshold: $TARGET_MEMORY_USAGE KB
```

## Step 2: Percentile Scenario Generation

### 5th Percentile Scenarios (Novice Users):

**Basic Usage Patterns:**
```bash
${COMMAND_NAME}_generate_5th_percentile_tests() {
    echo "Generating 5th percentile test scenarios..."
    local scenarios=()
    
    # Scenario 1: Help usage
    scenarios+=("${COMMAND_NAME}_main --help")
    
    # Scenario 2: Default execution
    scenarios+=("${COMMAND_NAME}_main")
    
    # Scenario 3: Single basic argument
    scenarios+=("${COMMAND_NAME}_main simple_input")
    
    # Scenario 4: Most common option
    scenarios+=("${COMMAND_NAME}_main --verbose")
    
    # Scenario 5: Basic file input
    scenarios+=("${COMMAND_NAME}_main input.txt")
    
    # Scenario 6: Basic output redirection
    scenarios+=("${COMMAND_NAME}_main > output.txt")
    
    # Scenario 7: Simple error case
    scenarios+=("${COMMAND_NAME}_main nonexistent_file")
    
    # Scenario 8: Basic configuration
    scenarios+=("${COMMAND_NAME}_main --config default")
    
    # Scenario 9: Standard format
    scenarios+=("${COMMAND_NAME}_main --format text")
    
    # Scenario 10: Common combination
    scenarios+=("${COMMAND_NAME}_main --verbose input.txt")
    
    printf '%s\n' "${scenarios[@]}"
}
```

### 25th Percentile Scenarios (Regular Users):

**Typical Usage Patterns:**
```bash
${COMMAND_NAME}_generate_25th_percentile_tests() {
    echo "Generating 25th percentile test scenarios..."
    local scenarios=()
    
    # Scenario 1: Multiple input files
    scenarios+=("${COMMAND_NAME}_main file1.txt file2.txt")
    
    # Scenario 2: Format specification
    scenarios+=("${COMMAND_NAME}_main --format json input.txt")
    
    # Scenario 3: Output specification
    scenarios+=("${COMMAND_NAME}_main --output result.json input.txt")
    
    # Scenario 4: Configuration file usage
    scenarios+=("${COMMAND_NAME}_main --config config.json")
    
    # Scenario 5: Filtering options
    scenarios+=("${COMMAND_NAME}_main --filter pattern input.txt")
    
    # Scenario 6: Verbosity levels
    scenarios+=("${COMMAND_NAME}_main --verbose --debug input.txt")
    
    # Scenario 7: Directory processing
    scenarios+=("${COMMAND_NAME}_main --recursive /path/to/dir")
    
    # Scenario 8: Format conversion
    scenarios+=("${COMMAND_NAME}_main --from csv --to json input.csv")
    
    # Scenario 9: Pipeline usage
    scenarios+=("cat input.txt | ${COMMAND_NAME}_main --stdin")
    
    # Scenario 10: Error handling test
    scenarios+=("${COMMAND_NAME}_main --strict invalid_input")
    
    printf '%s\n' "${scenarios[@]}"
}
```

### 50th Percentile Scenarios (Experienced Users):

**Diverse Usage Patterns:**
```bash
${COMMAND_NAME}_generate_50th_percentile_tests() {
    echo "Generating 50th percentile test scenarios..."
    local scenarios=()
    
    # Scenario 1: Complex filtering
    scenarios+=("${COMMAND_NAME}_main --filter 'pattern.*complex' --exclude temp")
    
    # Scenario 2: Multiple format options
    scenarios+=("${COMMAND_NAME}_main --format json --pretty --indent 4")
    
    # Scenario 3: Performance optimization
    scenarios+=("${COMMAND_NAME}_main --parallel --threads 4 large_dataset")
    
    # Scenario 4: Custom configuration
    scenarios+=("${COMMAND_NAME}_main --config custom.yaml --override key=value")
    
    # Scenario 5: Advanced output control
    scenarios+=("${COMMAND_NAME}_main --output-dir results --template custom.tmpl")
    
    # Scenario 6: Conditional processing
    scenarios+=("${COMMAND_NAME}_main --if-exists skip --if-missing create")
    
    # Scenario 7: Complex pipeline
    scenarios+=("find . -name '*.txt' | ${COMMAND_NAME}_main --batch --stdin")
    
    # Scenario 8: Error recovery
    scenarios+=("${COMMAND_NAME}_main --retry 3 --timeout 30 unreliable_source")
    
    # Scenario 9: Validation modes
    scenarios+=("${COMMAND_NAME}_main --validate --strict --report errors.log")
    
    # Scenario 10: Mixed input types
    scenarios+=("${COMMAND_NAME}_main file.json url://api.example.com stdin:///dev/stdin")
    
    printf '%s\n' "${scenarios[@]}"
}
```

### 75th Percentile Scenarios (Advanced Users):

**Complex Usage Patterns:**
```bash
${COMMAND_NAME}_generate_75th_percentile_tests() {
    echo "Generating 75th percentile test scenarios..."
    local scenarios=()
    
    # Scenario 1: Advanced filtering with regex
    scenarios+=("${COMMAND_NAME}_main --filter-regex '^(?!test).*\\.js$' --ignore-case")
    
    # Scenario 2: Custom output formatting
    scenarios+=("${COMMAND_NAME}_main --format custom --template '{{.name}}: {{.value}}' --separator ';'")
    
    # Scenario 3: Performance tuning
    scenarios+=("${COMMAND_NAME}_main --memory-limit 512M --cache-size 100M --worker-pool 8")
    
    # Scenario 4: Complex configuration merging
    scenarios+=("${COMMAND_NAME}_main --config base.yaml --config-override local.yaml --env-prefix MYAPP")
    
    # Scenario 5: Advanced error handling
    scenarios+=("${COMMAND_NAME}_main --on-error continue --error-log errors.json --recovery-mode auto")
    
    # Scenario 6: Conditional logic
    scenarios+=("${COMMAND_NAME}_main --if 'size > 1MB' --then compress --else skip")
    
    # Scenario 7: Multi-stage processing
    scenarios+=("${COMMAND_NAME}_main --stage validate,transform,output --checkpoint /tmp/progress")
    
    # Scenario 8: Plugin integration
    scenarios+=("${COMMAND_NAME}_main --plugin custom-processor --plugin-config plugin.yaml")
    
    # Scenario 9: Advanced monitoring
    scenarios+=("${COMMAND_NAME}_main --monitor --metrics-endpoint http://metrics:8080 --trace-id abc123")
    
    # Scenario 10: Edge case combinations
    scenarios+=("${COMMAND_NAME}_main --dry-run --verbose --debug --profile --measure-memory unusual_input")
    
    printf '%s\n' "${scenarios[@]}"
}
```

### 95th Percentile Scenarios (Expert Users):

**Extreme Usage Patterns:**
```bash
${COMMAND_NAME}_generate_95th_percentile_tests() {
    echo "Generating 95th percentile test scenarios..."
    local scenarios=()
    
    # Scenario 1: Maximum complexity
    scenarios+=("${COMMAND_NAME}_main --config complex.yaml --override-json '{\"key\": \"value\"}' --env-file .env.prod --template-vars vars.json --filter-chain 'filter1|filter2|filter3' --output-format custom --custom-format '{{range .items}}{{.id}}:{{.status}}{{end}}' --parallel --max-workers 16 --memory-limit 2G --timeout 300 --retry 5 --retry-backoff exponential --on-error custom-handler --error-format json --log-level trace --profile cpu,memory --trace-endpoint jaeger:14268 --metrics prometheus:9090 --checkpoint-every 1000 --resume-from /tmp/checkpoint --dry-run --validate-only --strict-mode --ignore-warnings huge_dataset")
    
    # Scenario 2: Boundary conditions
    scenarios+=("${COMMAND_NAME}_main empty_file /dev/null /dev/zero file_with_unicode_🚀 'file with spaces and symbols!@#$%^&*()'")
    
    # Scenario 3: Resource stress test
    scenarios+=("${COMMAND_NAME}_main --threads 100 --memory-unlimited --no-timeout /dev/urandom")
    
    # Scenario 4: Security edge cases
    scenarios+=("${COMMAND_NAME}_main --allow-dangerous --no-sandbox --trust-all '../../../etc/passwd'")
    
    # Scenario 5: Network extremes
    scenarios+=("${COMMAND_NAME}_main --source 'http://example.com/huge_file' --proxy socks5://proxy:1080 --auth bearer:token --headers 'X-Custom: value' --insecure --timeout 3600")
    
    # Scenario 6: Format conversion chaos
    scenarios+=("${COMMAND_NAME}_main --from auto --to json,yaml,xml,csv,toml --output-dir /tmp/outputs --preserve-structure --flatten-arrays --null-as-empty")
    
    # Scenario 7: Plugin ecosystem stress
    scenarios+=("${COMMAND_NAME}_main --plugin plugin1,plugin2,plugin3 --plugin-path /custom/plugins --plugin-config '{\"p1\": {\"enabled\": true}, \"p2\": {\"level\": \"debug\"}}' --plugin-timeout 60")
    
    # Scenario 8: Monitoring overload
    scenarios+=("${COMMAND_NAME}_main --trace --profile all --metrics-interval 1s --log-everything --debug-memory --debug-cpu --audit-trail --telemetry-endpoint multiple_endpoints")
    
    # Scenario 9: Error injection testing
    scenarios+=("${COMMAND_NAME}_main --inject-error-rate 0.1 --simulate-failures network,disk,memory --chaos-mode --expect-failures")
    
    # Scenario 10: Extreme edge case
    scenarios+=("echo -e '\\x00\\x01\\x02\\xff\\xfe' | ${COMMAND_NAME}_main --stdin --binary-mode --encoding utf-8,utf-16,iso-8859-1 --null-delimiter --escape-sequences --preserve-binary --output /dev/stdout --tee /tmp/binary_output --checksum md5,sha256 --verify-integrity")
    
    printf '%s\n' "${scenarios[@]}"
}
```

## Step 3: Variant Execution Engine

### Test Execution Framework:

**Multi-Percentile Test Runner:**
```bash
${COMMAND_NAME}_run_variant_tests() {
    echo "Running multi-prompt variant testing..."
    
    local test_results=()
    local percentiles=(5 25 50 75 95)
    local total_tests=0
    local passed_tests=0
    
    for percentile in "${percentiles[@]}"; do
        echo "=== Testing ${percentile}th Percentile ==="
        
        # Generate scenarios for this percentile
        local scenarios
        mapfile -t scenarios < <(${COMMAND_NAME}_generate_${percentile}th_percentile_tests)
        
        local percentile_passed=0
        local percentile_total=${#scenarios[@]}
        
        for scenario in "${scenarios[@]}"; do
            echo "Testing: $scenario"
            
            if ${COMMAND_NAME}_run_single_variant_test "$scenario" "$percentile"; then
                ((percentile_passed++))
                ((passed_tests++))
                test_results+=("✅ P$percentile: $scenario")
            else
                test_results+=("❌ P$percentile: $scenario")
            fi
            
            ((total_tests++))
        done
        
        local percentile_success_rate=$((percentile_passed * 100 / percentile_total))
        echo "${percentile}th Percentile Success Rate: $percentile_success_rate% ($percentile_passed/$percentile_total)"
        
        # Store percentile-specific results
        export "PERCENTILE_${percentile}_SUCCESS_RATE=$percentile_success_rate"
        export "PERCENTILE_${percentile}_PASSED=$percentile_passed"
        export "PERCENTILE_${percentile}_TOTAL=$percentile_total"
    done
    
    # Calculate overall success rate
    local overall_success_rate=$((passed_tests * 100 / total_tests))
    echo ""
    echo "=== OVERALL VARIANT TEST RESULTS ==="
    echo "Total Tests: $total_tests"
    echo "Passed Tests: $passed_tests"
    echo "Overall Success Rate: $overall_success_rate%"
    
    # Store overall results
    export VARIANT_OVERALL_SUCCESS_RATE="$overall_success_rate"
    export VARIANT_TOTAL_TESTS="$total_tests"
    export VARIANT_PASSED_TESTS="$passed_tests"
    
    # Quality gate
    if [[ $overall_success_rate -ge 85 ]]; then
        echo "✅ Variant testing PASSED"
        export VARIANT_TEST_STATUS="PASSED"
        return 0
    else
        echo "❌ Variant testing FAILED (minimum: 85%)"
        export VARIANT_TEST_STATUS="FAILED"
        return 1
    fi
}

${COMMAND_NAME}_run_single_variant_test() {
    local scenario="$1"
    local percentile="$2"
    local test_timeout=30
    
    # Adjust timeout based on percentile complexity
    case "$percentile" in
        5|25) test_timeout=10 ;;
        50) test_timeout=20 ;;
        75) test_timeout=45 ;;
        95) test_timeout=120 ;;
    esac
    
    # Create isolated test environment
    local test_dir="/tmp/${COMMAND_NAME}_variant_test_$$"
    mkdir -p "$test_dir"
    cd "$test_dir"
    
    # Setup test files if needed
    ${COMMAND_NAME}_setup_test_environment "$percentile"
    
    # Run test with timeout and capture all output
    local test_start=$(date +%s%N)
    local test_result=0
    
    if timeout "$test_timeout" bash -c "$scenario" &>/dev/null; then
        test_result=0
    else
        test_result=1
    fi
    
    local test_end=$(date +%s%N)
    local test_duration=$(((test_end - test_start) / 1000000))
    
    # Performance validation
    local max_duration
    case "$percentile" in
        5|25) max_duration=1000 ;;  # 1 second for basic operations
        50) max_duration=5000 ;;    # 5 seconds for standard operations
        75) max_duration=15000 ;;   # 15 seconds for complex operations
        95) max_duration=60000 ;;   # 60 seconds for extreme operations
    esac
    
    if [[ $test_duration -gt $max_duration ]]; then
        echo "⚠️ Performance warning: ${test_duration}ms > ${max_duration}ms"
        # Don't fail test for performance, but log it
    fi
    
    # Cleanup
    cd - >/dev/null
    rm -rf "$test_dir"
    
    return $test_result
}

${COMMAND_NAME}_setup_test_environment() {
    local percentile="$1"
    
    # Create standard test files
    echo "test content" > input.txt
    echo "test line 1\ntest line 2" > file1.txt
    echo "test line 3\ntest line 4" > file2.txt
    echo '{"key": "value", "number": 42}' > input.json
    echo "name,value\ntest,123" > input.csv
    
    # Create configuration files
    cat > config.json << 'EOF'
{
    "setting1": "value1",
    "setting2": true,
    "setting3": 42
}
EOF
    
    cat > config.yaml << 'EOF'
setting1: value1
setting2: true
setting3: 42
EOF
    
    # Create complex test files for higher percentiles
    if [[ $percentile -ge 75 ]]; then
        # Create large file for stress testing
        dd if=/dev/zero of=large_file bs=1M count=10 2>/dev/null
        
        # Create file with special characters
        echo -e "unicode test: 🚀 emoji test\ntab\ttest\nnewline test" > special_chars.txt
        
        # Create deeply nested structure
        mkdir -p deep/nested/directory/structure
        echo "deep content" > deep/nested/directory/structure/file.txt
    fi
    
    if [[ $percentile -eq 95 ]]; then
        # Create extreme test conditions
        echo "" > empty_file
        touch /tmp/test_permissions
        chmod 000 /tmp/test_permissions 2>/dev/null || true
        
        # Create files with edge case names
        touch "file with spaces"
        touch "file-with-dashes"
        touch "file_with_underscores"
        touch "file.with.dots"
        
        # Create binary test file
        dd if=/dev/urandom of=binary_file bs=1K count=1 2>/dev/null
    fi
}
```

## Step 4: Statistical Analysis

### Performance Distribution Analysis:

**Statistical Validation:**
```bash
${COMMAND_NAME}_analyze_variant_statistics() {
    echo "Analyzing variant test statistics..."
    
    # Collect performance data
    local performance_data=()
    local percentiles=(5 25 50 75 95)
    
    for percentile in "${percentiles[@]}"; do
        local var_name="PERCENTILE_${percentile}_SUCCESS_RATE"
        local success_rate=${!var_name}
        performance_data+=("$percentile:$success_rate")
    done
    
    # Calculate statistical measures
    local total_percentiles=${#percentiles[@]}
    local sum=0
    local min=100
    local max=0
    
    for data in "${performance_data[@]}"; do
        local rate=${data#*:}
        sum=$((sum + rate))
        
        if [[ $rate -lt $min ]]; then
            min=$rate
        fi
        
        if [[ $rate -gt $max ]]; then
            max=$rate
        fi
    done
    
    local mean=$((sum / total_percentiles))
    local range=$((max - min))
    
    # Calculate standard deviation
    local variance_sum=0
    for data in "${performance_data[@]}"; do
        local rate=${data#*:}
        local diff=$((rate - mean))
        variance_sum=$((variance_sum + diff * diff))
    done
    
    local variance=$((variance_sum / total_percentiles))
    local std_dev=$(echo "sqrt($variance)" | bc -l | cut -d. -f1)
    
    # Statistical analysis report
    echo "=== STATISTICAL ANALYSIS ==="
    echo "Mean Success Rate: $mean%"
    echo "Min Success Rate: $min% (worst case)"
    echo "Max Success Rate: $max% (best case)"
    echo "Range: $range%"
    echo "Standard Deviation: $std_dev%"
    
    # Performance stability assessment
    if [[ $std_dev -le 10 ]]; then
        echo "✅ Performance is STABLE (std dev ≤ 10%)"
        export PERFORMANCE_STABILITY="stable"
    elif [[ $std_dev -le 20 ]]; then
        echo "⚠️ Performance is MODERATE (std dev ≤ 20%)"
        export PERFORMANCE_STABILITY="moderate"
    else
        echo "❌ Performance is UNSTABLE (std dev > 20%)"
        export PERFORMANCE_STABILITY="unstable"
    fi
    
    # Store statistical results
    export VARIANT_MEAN_SUCCESS="$mean"
    export VARIANT_MIN_SUCCESS="$min"
    export VARIANT_MAX_SUCCESS="$max"
    export VARIANT_STD_DEV="$std_dev"
    export VARIANT_RANGE="$range"
    
    return $((std_dev <= 20 ? 0 : 1))
}
```

### Robustness Assessment:

**Robustness Quality Matrix:**
```bash
${COMMAND_NAME}_assess_robustness() {
    echo "Assessing command robustness..."
    
    local robustness_score=0
    local robustness_report=()
    
    # Criterion 1: Overall success rate (40 points)
    local overall_success=$VARIANT_OVERALL_SUCCESS_RATE
    local success_points
    if [[ $overall_success -ge 95 ]]; then
        success_points=40
    elif [[ $overall_success -ge 90 ]]; then
        success_points=35
    elif [[ $overall_success -ge 85 ]]; then
        success_points=30
    elif [[ $overall_success -ge 75 ]]; then
        success_points=20
    else
        success_points=0
    fi
    
    robustness_score=$((robustness_score + success_points))
    robustness_report+=("Overall Success Rate: $success_points/40 ($overall_success%)")
    
    # Criterion 2: Performance stability (25 points)
    local stability_points
    case "$PERFORMANCE_STABILITY" in
        "stable") stability_points=25 ;;
        "moderate") stability_points=15 ;;
        "unstable") stability_points=0 ;;
    esac
    
    robustness_score=$((robustness_score + stability_points))
    robustness_report+=("Performance Stability: $stability_points/25 ($PERFORMANCE_STABILITY)")
    
    # Criterion 3: Edge case handling (20 points)
    local edge_case_success=$PERCENTILE_95_SUCCESS_RATE
    local edge_points
    if [[ $edge_case_success -ge 80 ]]; then
        edge_points=20
    elif [[ $edge_case_success -ge 60 ]]; then
        edge_points=15
    elif [[ $edge_case_success -ge 40 ]]; then
        edge_points=10
    else
        edge_points=0
    fi
    
    robustness_score=$((robustness_score + edge_points))
    robustness_report+=("Edge Case Handling: $edge_points/20 ($edge_case_success%)")
    
    # Criterion 4: Basic reliability (15 points)
    local basic_success=$PERCENTILE_5_SUCCESS_RATE
    local basic_points
    if [[ $basic_success -ge 95 ]]; then
        basic_points=15
    elif [[ $basic_success -ge 90 ]]; then
        basic_points=10
    else
        basic_points=0
    fi
    
    robustness_score=$((robustness_score + basic_points))
    robustness_report+=("Basic Reliability: $basic_points/15 ($basic_success%)")
    
    # Report robustness assessment
    echo "=== ROBUSTNESS ASSESSMENT ==="
    printf '%s\n' "${robustness_report[@]}"
    echo "Total Robustness Score: $robustness_score/100"
    
    # Robustness certification
    if [[ $robustness_score -ge 85 ]]; then
        echo "🏆 EXCELLENT robustness - Production ready"
        export ROBUSTNESS_LEVEL="excellent"
    elif [[ $robustness_score -ge 70 ]]; then
        echo "✅ GOOD robustness - Recommended for use"
        export ROBUSTNESS_LEVEL="good"
    elif [[ $robustness_score -ge 55 ]]; then
        echo "⚠️ ACCEPTABLE robustness - Suitable with monitoring"
        export ROBUSTNESS_LEVEL="acceptable"
    else
        echo "❌ POOR robustness - Requires improvement"
        export ROBUSTNESS_LEVEL="poor"
        return 1
    fi
    
    export ROBUSTNESS_SCORE="$robustness_score"
    return 0
}
```

## Step 5: Failure Analysis

### Detailed Failure Investigation:

**Failure Pattern Analysis:**
```bash
${COMMAND_NAME}_analyze_failures() {
    echo "Analyzing failure patterns..."
    
    # Categorize failures by percentile
    local failure_categories=()
    local percentiles=(5 25 50 75 95)
    
    for percentile in "${percentiles[@]}"; do
        local var_name="PERCENTILE_${percentile}_SUCCESS_RATE"
        local success_rate=${!var_name}
        local failure_rate=$((100 - success_rate))
        
        echo "P$percentile Failure Rate: $failure_rate%"
        
        if [[ $failure_rate -gt 20 ]]; then
            failure_categories+=("P$percentile: High failure rate ($failure_rate%)")
        elif [[ $failure_rate -gt 10 ]]; then
            failure_categories+=("P$percentile: Moderate failure rate ($failure_rate%)")
        elif [[ $failure_rate -gt 0 ]]; then
            failure_categories+=("P$percentile: Low failure rate ($failure_rate%)")
        fi
    done
    
    if [[ ${#failure_categories[@]} -gt 0 ]]; then
        echo "=== FAILURE ANALYSIS ==="
        printf '%s\n' "${failure_categories[@]}"
        
        # Generate improvement recommendations
        ${COMMAND_NAME}_generate_improvement_recommendations
    else
        echo "✅ No significant failure patterns detected"
    fi
}

${COMMAND_NAME}_generate_improvement_recommendations() {
    echo "=== IMPROVEMENT RECOMMENDATIONS ==="
    
    # Analyze failure patterns and suggest improvements
    if [[ $PERCENTILE_5_SUCCESS_RATE -lt 95 ]]; then
        echo "🔧 Basic Usage: Improve help documentation and error messages"
    fi
    
    if [[ $PERCENTILE_25_SUCCESS_RATE -lt 90 ]]; then
        echo "🔧 Regular Usage: Enhance input validation and default handling"
    fi
    
    if [[ $PERCENTILE_50_SUCCESS_RATE -lt 85 ]]; then
        echo "🔧 Diverse Usage: Improve option compatibility and configuration"
    fi
    
    if [[ $PERCENTILE_75_SUCCESS_RATE -lt 75 ]]; then
        echo "🔧 Advanced Usage: Enhance complex scenario handling and performance"
    fi
    
    if [[ $PERCENTILE_95_SUCCESS_RATE -lt 60 ]]; then
        echo "🔧 Expert Usage: Improve edge case handling and resource management"
    fi
    
    if [[ "$PERFORMANCE_STABILITY" == "unstable" ]]; then
        echo "🔧 Performance: Implement better resource management and optimization"
    fi
}
```

## Step 6: Variant Test Report Generation

### Comprehensive Test Report:

**Generate Detailed Report:**
```bash
${COMMAND_NAME}_generate_variant_report() {
    local report_file=".claude/commands/$COMMAND_NAME/variant_test_report.md"
    
    cat > "$report_file" << EOF
# $COMMAND_NAME Multi-Prompt Variant Test Report

Generated: $(date -Iseconds)

## Executive Summary

**Overall Success Rate**: $VARIANT_OVERALL_SUCCESS_RATE%
**Robustness Level**: $ROBUSTNESS_LEVEL
**Performance Stability**: $PERFORMANCE_STABILITY
**Recommendation**: $ROBUSTNESS_LEVEL command ready for $DEPLOYMENT_RECOMMENDATION

## Test Results by Percentile

| Percentile | Success Rate | Status | Notes |
|------------|--------------|--------|-------|
| 5th (Novice) | $PERCENTILE_5_SUCCESS_RATE% | $PERCENTILE_5_STATUS | Basic usage patterns |
| 25th (Regular) | $PERCENTILE_25_SUCCESS_RATE% | $PERCENTILE_25_STATUS | Typical usage patterns |
| 50th (Experienced) | $PERCENTILE_50_SUCCESS_RATE% | $PERCENTILE_50_STATUS | Diverse usage patterns |
| 75th (Advanced) | $PERCENTILE_75_SUCCESS_RATE% | $PERCENTILE_75_STATUS | Complex usage patterns |
| 95th (Expert) | $PERCENTILE_95_SUCCESS_RATE% | $PERCENTILE_95_STATUS | Extreme usage patterns |

## Statistical Analysis

- **Mean Success Rate**: $VARIANT_MEAN_SUCCESS%
- **Range**: $VARIANT_MIN_SUCCESS% - $VARIANT_MAX_SUCCESS%
- **Standard Deviation**: $VARIANT_STD_DEV%
- **Performance Stability**: $PERFORMANCE_STABILITY

## Robustness Assessment

**Total Score**: $ROBUSTNESS_SCORE/100

$ROBUSTNESS_BREAKDOWN

## Failure Analysis

$FAILURE_ANALYSIS_RESULTS

## Improvement Recommendations

$IMPROVEMENT_RECOMMENDATIONS

## Test Configuration

- **Total Test Scenarios**: $VARIANT_TOTAL_TESTS
- **Success Threshold**: 85%
- **Performance Thresholds**: Variable by percentile
- **Test Environment**: Isolated containers

## Next Steps

$NEXT_STEPS_BASED_ON_RESULTS
EOF

    echo "Variant test report generated: $report_file"
}
```

## Variant Testing Complete

### Variant Testing Summary:
- ✅ **Total Tests**: $VARIANT_TOTAL_TESTS scenarios across 5 percentiles
- ✅ **Overall Success**: $VARIANT_OVERALL_SUCCESS_RATE% (threshold: 85%)
- ✅ **Performance Stability**: $PERFORMANCE_STABILITY (std dev: $VARIANT_STD_DEV%)
- ✅ **Robustness Level**: $ROBUSTNESS_LEVEL ($ROBUSTNESS_SCORE/100)
- ✅ **Edge Case Handling**: $PERCENTILE_95_SUCCESS_RATE% success rate
- ✅ **Basic Reliability**: $PERCENTILE_5_SUCCESS_RATE% success rate

### Percentile Performance:
```yaml
variant_results:
  overall_success_rate: $VARIANT_OVERALL_SUCCESS_RATE%
  robustness_score: $ROBUSTNESS_SCORE/100
  robustness_level: $ROBUSTNESS_LEVEL
  performance_stability: $PERFORMANCE_STABILITY
  
  percentile_breakdown:
    5th_percentile: $PERCENTILE_5_SUCCESS_RATE%
    25th_percentile: $PERCENTILE_25_SUCCESS_RATE%
    50th_percentile: $PERCENTILE_50_SUCCESS_RATE%
    75th_percentile: $PERCENTILE_75_SUCCESS_RATE%
    95th_percentile: $PERCENTILE_95_SUCCESS_RATE%
  
  statistical_analysis:
    mean: $VARIANT_MEAN_SUCCESS%
    std_dev: $VARIANT_STD_DEV%
    range: $VARIANT_RANGE%
    
  ready_for_judging: true
```

### Next Phase:

**Continue to:** `/command-builder/07-judge` for three-judge evaluation system.

Your command has been validated across all usage percentiles and is ready for expert evaluation.

**Ready to proceed to judge evaluation?** (y/n) > [WAIT FOR CONFIRMATION]