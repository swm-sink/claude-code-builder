---
allowed-tools: Write, Read, Bash(source:*), Bash(declare:*), Bash(time:*)
description: Multi-prompt validation testing for agent robustness (5th-95th percentile)
argument-hint: [agent-path] [--percentiles 5,25,50,75,95] [--iterations 3]
category: agent-builder
version: 1.0.0
---

# 🎯 MULTI-PROMPT VALIDATION TESTING

Testing agent robustness across multiple prompt variations based on 2024 research findings.

## Multi-Prompt Testing Framework

### Research Foundation:
- **Finding**: Single prompts lead to brittle, unreliable results
- **Solution**: Test across 5th, 25th, 50th, 75th, 95th percentiles
- **Goal**: Ensure robust performance across all user types

### Agent Under Test:
```yaml
$AGENT_CONFIG_FROM_PREVIOUS_STEP
```

## Step 1: Prompt Variation Generation

### Variation 1: Minimal Prompt (5th Percentile)
**Simulates**: Novice users, minimal context, terse commands

```markdown
# Minimal Agent Invocation
$AGENT_NAME $MINIMAL_ARGS

# Context: Bare minimum instructions
# User type: Beginner, inexperienced
# Expectation: Should still work correctly
```

**Test Command:**
```bash
${AGENT_NAME}_main --help
${AGENT_NAME}_main $BASIC_ARG
```

### Variation 2: Concise Prompt (25th Percentile)
**Simulates**: Typical users, brief but clear instructions

```markdown
# Standard Agent Usage
$AGENT_NAME $STANDARD_ARGS --verbose

# Context: Clear but brief instructions
# User type: Regular user, some experience
# Expectation: Smooth operation
```

**Test Command:**
```bash
${AGENT_NAME}_main $STANDARD_ARGS --verbose
${AGENT_NAME}_main $STANDARD_ARGS --output json
```

### Variation 3: Standard Prompt (50th Percentile)
**Simulates**: Average users, balanced detail level

```markdown
# Typical Agent Execution
Run $AGENT_NAME with $DETAILED_ARGS to $ACTION_DESCRIPTION.
Handle errors gracefully and provide detailed output.

# Context: Typical user interaction
# User type: Average experience level
# Expectation: Full functionality
```

**Test Command:**
```bash
${AGENT_NAME}_main $DETAILED_ARGS --format detailed
${AGENT_NAME}_main $DETAILED_ARGS --dry-run
```

### Variation 4: Detailed Prompt (75th Percentile)
**Simulates**: Advanced users, comprehensive instructions

```markdown
# Advanced Agent Configuration
Execute $AGENT_NAME with the following configuration:
- Args: $COMPLEX_ARGS
- Options: $ADVANCED_OPTIONS
- Error handling: $ERROR_STRATEGY
- Output format: $OUTPUT_FORMAT
- Performance monitoring: enabled

# Context: Experienced user with specific needs
# User type: Advanced, power user
# Expectation: All features working
```

**Test Command:**
```bash
${AGENT_NAME}_main $COMPLEX_ARGS $ADVANCED_OPTIONS
${AGENT_NAME}_monitor_performance ${AGENT_NAME}_main $COMPLEX_ARGS
```

### Variation 5: Expert Prompt (95th Percentile)
**Simulates**: Expert users, maximum optimization, edge cases

```markdown
# Expert-Level Agent Deployment
Deploy $AGENT_NAME in expert mode with:
- Full argument specification: $EXPERT_ARGS
- Custom error handlers: $CUSTOM_HANDLERS
- Performance optimizations: $OPTIMIZATIONS
- Integration with: $INTEGRATIONS
- Monitoring: comprehensive
- Security: maximum
- Validation: strict

# Context: Expert prompt engineer
# User type: Expert, knows all capabilities
# Expectation: Perfect execution with all features
```

**Test Command:**
```bash
${AGENT_NAME}_main $EXPERT_ARGS $EXPERT_OPTIONS
${AGENT_NAME}_validate_inputs "$EXPERT_VALIDATION"
${AGENT_NAME}_monitor_performance ${AGENT_NAME}_main $EXPERT_FULL_CONFIG
```

## Step 2: Percentile Testing Execution

### Testing Infrastructure:
```bash
# Test execution framework
run_percentile_test() {
    local percentile="$1"
    local test_command="$2"
    local iteration="$3"
    
    echo "Testing Percentile $percentile, Iteration $iteration"
    
    # Capture metrics
    local start_time=$(date +%s%N)
    local memory_before=$(ps -o rss= -p $$ | tr -d ' ')
    
    # Execute test
    eval "$test_command" 2>&1
    local exit_code=$?
    
    # Calculate metrics
    local end_time=$(date +%s%N)
    local duration=$((($end_time - $start_time) / 1000000))
    local memory_after=$(ps -o rss= -p $$ | tr -d ' ')
    local memory_used=$((memory_after - memory_before))
    
    # Store results
    echo "$percentile,$iteration,$exit_code,$duration,$memory_used" >> test_results.csv
    
    return $exit_code
}
```

### Executing All Variations:

**Percentile 5 (3 iterations):**
```bash
for i in 1 2 3; do
    run_percentile_test "5" "${AGENT_NAME}_main --help" "$i"
    run_percentile_test "5" "${AGENT_NAME}_main $BASIC_ARG" "$i"
done
```

**Percentile 25 (3 iterations):**
```bash
for i in 1 2 3; do
    run_percentile_test "25" "${AGENT_NAME}_main $STANDARD_ARGS --verbose" "$i"
    run_percentile_test "25" "${AGENT_NAME}_main $STANDARD_ARGS --output json" "$i"
done
```

**Percentile 50 (3 iterations):**
```bash
for i in 1 2 3; do
    run_percentile_test "50" "${AGENT_NAME}_main $DETAILED_ARGS --format detailed" "$i"
    run_percentile_test "50" "${AGENT_NAME}_main $DETAILED_ARGS --dry-run" "$i"
done
```

**Percentile 75 (3 iterations):**
```bash
for i in 1 2 3; do
    run_percentile_test "75" "${AGENT_NAME}_main $COMPLEX_ARGS $ADVANCED_OPTIONS" "$i"
    run_percentile_test "75" "${AGENT_NAME}_monitor_performance ${AGENT_NAME}_main $COMPLEX_ARGS" "$i"
done
```

**Percentile 95 (3 iterations):**
```bash
for i in 1 2 3; do
    run_percentile_test "95" "${AGENT_NAME}_main $EXPERT_ARGS $EXPERT_OPTIONS" "$i"
    run_percentile_test "95" "${AGENT_NAME}_monitor_performance ${AGENT_NAME}_main $EXPERT_FULL_CONFIG" "$i"
done
```

## Step 3: Results Analysis

### Raw Test Results:
```csv
Percentile,Iteration,ExitCode,Duration(ms),Memory(KB)
5,1,$P5_I1_EXIT,$P5_I1_TIME,$P5_I1_MEM
5,2,$P5_I2_EXIT,$P5_I2_TIME,$P5_I2_MEM
5,3,$P5_I3_EXIT,$P5_I3_TIME,$P5_I3_MEM
25,1,$P25_I1_EXIT,$P25_I1_TIME,$P25_I1_MEM
...
95,3,$P95_I3_EXIT,$P95_I3_TIME,$P95_I3_MEM
```

### Statistical Analysis:
```bash
# Calculate percentile statistics
analyze_results() {
    echo "=== MULTI-PROMPT VALIDATION RESULTS ==="
    echo
    
    for percentile in 5 25 50 75 95; do
        echo "Percentile $percentile Results:"
        
        # Success rate
        local success_count=$(awk -F',' "\$1==$percentile && \$3==0 {count++} END {print count+0}" test_results.csv)
        local total_count=$(awk -F',' "\$1==$percentile {count++} END {print count+0}" test_results.csv)
        local success_rate=$((success_count * 100 / total_count))
        
        # Average response time
        local avg_time=$(awk -F',' "\$1==$percentile && \$3==0 {sum+=\$4; count++} END {print sum/count}" test_results.csv)
        
        # Average memory usage
        local avg_memory=$(awk -F',' "\$1==$percentile && \$3==0 {sum+=\$5; count++} END {print sum/count}" test_results.csv)
        
        echo "  Success Rate: $success_rate% ($success_count/$total_count)"
        echo "  Avg Response Time: ${avg_time}ms"
        echo "  Avg Memory Usage: ${avg_memory}KB"
        echo
    done
}

analyze_results
```

### Performance Distribution:
| Percentile | Success Rate | Avg Response Time | Avg Memory | Status |
|------------|-------------|------------------|------------|---------|
| 5th | $P5_SUCCESS% | $P5_TIME ms | $P5_MEM KB | $P5_STATUS |
| 25th | $P25_SUCCESS% | $P25_TIME ms | $P25_MEM KB | $P25_STATUS |
| 50th | $P50_SUCCESS% | $P50_TIME ms | $P50_MEM KB | $P50_STATUS |
| 75th | $P75_SUCCESS% | $P75_TIME ms | $P75_MEM KB | $P75_STATUS |
| 95th | $P95_SUCCESS% | $P95_TIME ms | $P95_MEM KB | $P95_STATUS |

## Step 4: Robustness Assessment

### Robustness Criteria (Based on 2024 Research):
- **Minimum Success Rate**: 90% across all percentiles
- **Performance Degradation**: <50% variance between percentiles
- **Memory Stability**: <100% variance in memory usage
- **Error Gracfulness**: All failures should be graceful (no crashes)

### Assessment Results:

**Overall Robustness Score**: $OVERALL_SCORE/100

**Detailed Assessment:**
- ✅/❌ **Success Rate**: $SUCCESS_ASSESSMENT (Required: >90% all percentiles)
- ✅/❌ **Performance Stability**: $PERFORMANCE_ASSESSMENT (<50% variance)
- ✅/❌ **Memory Stability**: $MEMORY_ASSESSMENT (<100% variance)
- ✅/❌ **Error Handling**: $ERROR_ASSESSMENT (All failures graceful)

### Identified Issues:
$IDENTIFIED_ISSUES_LIST

### Optimization Recommendations:
$OPTIMIZATION_RECOMMENDATIONS

## Step 5: Robustness Validation Gates

### Gate 1: Minimum Viability (Required to Proceed)
- 5th percentile success rate ≥ 80%
- No crashes or undefined behavior
- Basic functionality works

**Gate 1 Status**: $GATE1_STATUS ✅/❌

### Gate 2: Production Readiness (Recommended)
- All percentiles success rate ≥ 90%
- Performance variance < 50%
- Memory variance < 100%

**Gate 2 Status**: $GATE2_STATUS ✅/❌

### Gate 3: Expert Optimization (Ideal)
- All percentiles success rate ≥ 95%
- Performance variance < 25%
- Memory variance < 50%

**Gate 3 Status**: $GATE3_STATUS ✅/❌

## Step 6: Remediation (If Required)

### If Gates Failed:
**Remediation Strategy:**
1. **Identify worst-performing percentile**
2. **Analyze specific failure modes**
3. **Implement targeted fixes**
4. **Re-run validation**

**Specific Remediations Needed:**
$REMEDIATION_PLAN

**Re-run validation?** (y/n) > [WAIT FOR INPUT IF FAILURES]

## Validation Complete

### Multi-Prompt Validation Summary:
- **Percentiles Tested**: 5th, 25th, 50th, 75th, 95th
- **Total Test Iterations**: 30 (6 tests × 5 percentiles)
- **Overall Robustness**: $OVERALL_SCORE/100
- **Production Ready**: $PRODUCTION_READY_STATUS ✅/❌

### Performance Distribution Summary:
- **Best Case (95th)**: $BEST_CASE_PERFORMANCE
- **Typical Case (50th)**: $TYPICAL_CASE_PERFORMANCE
- **Worst Case (5th)**: $WORST_CASE_PERFORMANCE

## Next Phase

Multi-prompt validation completed with statistical robustness analysis.

**Continue to: /agent-builder/07-judge-eval** for three-judge comprehensive evaluation.