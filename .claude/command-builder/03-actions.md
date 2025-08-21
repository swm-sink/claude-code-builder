---
allowed-tools: Read, Write, Bash(find:*), WebSearch, Bash(source:*)
description: Command action definition with multi-prompt validation and research-backed patterns
argument-hint: [action-config] [--validate-patterns] [--test-scenarios]
category: command-builder
version: 1.0.0
---

# 🎬 COMMAND ACTION DEFINITION

Define command actions using research-validated patterns with multi-prompt composition testing.

## Action Definition Framework

### Build Configuration:
```yaml
$BUILD_CONFIG_FROM_FRONTMATTER
```

### Research Foundation Applied:
- ✅ Current bash action patterns
- ✅ Multi-prompt validation testing
- ✅ Error handling best practices
- ✅ User experience optimization

## Step 1: Command Purpose Analysis

### Command Intent Classification:

**Command Name**: `$COMMAND_NAME`
**Detected Purpose**: $DETECTED_PURPOSE

**Action Categories Available:**

1. **🔍 Analysis Actions** - Examine, inspect, review
   - Examples: analyze-security, check-dependencies, audit-logs
   - Pattern: Input → Process → Report
   - User Flow: Command → Analysis → Results

2. **🏗️ Generation Actions** - Create, build, generate
   - Examples: generate-docs, create-template, build-package
   - Pattern: Parameters → Creation → Output
   - User Flow: Config → Generation → Artifacts

3. **🔧 Transformation Actions** - Modify, convert, optimize
   - Examples: format-code, optimize-images, migrate-config
   - Pattern: Input → Transform → Output
   - User Flow: Source → Transform → Result

4. **🚀 Automation Actions** - Execute, deploy, orchestrate
   - Examples: deploy-app, run-tests, start-services
   - Pattern: Trigger → Execute → Monitor
   - User Flow: Command → Execution → Status

5. **🛠️ Utility Actions** - Help, configure, manage
   - Examples: setup-env, show-help, manage-config
   - Pattern: Request → Process → Response
   - User Flow: Request → Action → Feedback

6. **🔗 Integration Actions** - Connect, sync, import
   - Examples: sync-repos, import-data, connect-api
   - Pattern: Source → Connect → Destination
   - User Flow: Config → Integration → Sync

**Auto-detected category**: $AUTO_DETECTED_CATEGORY

**Confirm action category (1-6) or specify custom:** > [WAIT FOR INPUT]

### Action Complexity Assessment:

**Based on command purpose, estimated complexity:**

**Simple Action (1-3 steps):**
- Single primary operation
- Minimal error handling needed
- Direct input/output pattern
- Example: `show-status`, `validate-config`

**Moderate Action (4-8 steps):**
- Multiple coordinated operations
- Conditional logic required
- Error recovery needed
- Example: `deploy-service`, `analyze-performance`

**Complex Action (9+ steps):**
- Multi-phase operations
- Advanced error handling
- State management required
- Example: `migrate-database`, `orchestrate-deployment`

**Detected Complexity**: $DETECTED_COMPLEXITY

## Step 2: Core Action Definition

### Primary Action Specification:

**Main Action Purpose:**
$MAIN_ACTION_PURPOSE

**Action Signature:**
```bash
${COMMAND_NAME}_main() {
    local args="$@"
    # Action implementation will be defined here
}
```

**Input Specification:**
```yaml
inputs:
  required:
    - $REQUIRED_INPUT_1: $INPUT_1_DESCRIPTION
    - $REQUIRED_INPUT_2: $INPUT_2_DESCRIPTION
  optional:
    - $OPTIONAL_INPUT_1: $INPUT_1_DESCRIPTION (default: $DEFAULT_VALUE_1)
    - $OPTIONAL_INPUT_2: $INPUT_2_DESCRIPTION (default: $DEFAULT_VALUE_2)
  flags:
    - --verbose: Enable detailed output
    - --help: Show usage information
    - --dry-run: Show what would be done without executing
```

**Output Specification:**
```yaml
outputs:
  success:
    - primary_result: $PRIMARY_RESULT_DESCRIPTION
    - status_code: 0
    - format: $OUTPUT_FORMAT
  error:
    - error_message: Descriptive error information
    - status_code: 1-255 (specific to error type)
    - recovery_suggestions: Actionable next steps
```

### Action Flow Design:

**Sequential Flow Pattern:**
```bash
# Step-by-step action flow
${COMMAND_NAME}_action_flow() {
    # Phase 1: Validation
    ${COMMAND_NAME}_validate_inputs "$@" || return 1
    
    # Phase 2: Preparation
    ${COMMAND_NAME}_prepare_environment || return 2
    
    # Phase 3: Core Action
    ${COMMAND_NAME}_execute_core_action "$@" || return 3
    
    # Phase 4: Post-processing
    ${COMMAND_NAME}_post_process_results || return 4
    
    # Phase 5: Output
    ${COMMAND_NAME}_format_output || return 5
}
```

**Parallel Flow Pattern (if applicable):**
```bash
# Concurrent operations for performance
${COMMAND_NAME}_parallel_flow() {
    # Start background operations
    ${COMMAND_NAME}_background_task_1 &
    local bg_pid_1=$!
    
    ${COMMAND_NAME}_background_task_2 &
    local bg_pid_2=$!
    
    # Foreground main task
    ${COMMAND_NAME}_main_task
    
    # Wait for background completion
    wait $bg_pid_1 && wait $bg_pid_2
}
```

**Selected Flow Pattern**: $SELECTED_FLOW_PATTERN

## Step 3: Action Components Definition

### Core Action Functions:

**Function 1: Input Validation**
```bash
${COMMAND_NAME}_validate_inputs() {
    local args="$@"
    
    # Validate required arguments
    if [[ -z "$REQUIRED_ARG_1" ]]; then
        log_error "Missing required argument: $REQUIRED_ARG_1"
        return 1
    fi
    
    # Validate argument formats
    if ! [[ "$ARG_2" =~ $VALIDATION_PATTERN ]]; then
        log_error "Invalid format for $ARG_2: expected $EXPECTED_FORMAT"
        return 1
    fi
    
    # Validate dependencies
    ${COMMAND_NAME}_check_dependencies || return 1
    
    log_info "Input validation passed"
    return 0
}
```

**Function 2: Environment Preparation**
```bash
${COMMAND_NAME}_prepare_environment() {
    # Create working directories
    mkdir -p "$WORK_DIR" || return 1
    
    # Set up temporary files
    TEMP_FILE=$(mktemp) || return 1
    trap 'rm -f "$TEMP_FILE"' EXIT
    
    # Load required patterns
    source ./patterns/error-handling/simple-error-handling.sh || return 1
    
    # Initialize configuration
    ${COMMAND_NAME}_load_config || return 1
    
    log_info "Environment preparation completed"
    return 0
}
```

**Function 3: Core Action Implementation**
```bash
${COMMAND_NAME}_execute_core_action() {
    local args="$@"
    
    log_info "Executing core action: $CORE_ACTION_DESCRIPTION"
    
    # Core action logic based on command category
    case "$ACTION_CATEGORY" in
        "analysis")
            ${COMMAND_NAME}_perform_analysis "$args"
            ;;
        "generation")
            ${COMMAND_NAME}_perform_generation "$args"
            ;;
        "transformation")
            ${COMMAND_NAME}_perform_transformation "$args"
            ;;
        "automation")
            ${COMMAND_NAME}_perform_automation "$args"
            ;;
        *)
            ${COMMAND_NAME}_perform_custom_action "$args"
            ;;
    esac
    
    local result=$?
    if [[ $result -eq 0 ]]; then
        log_info "Core action completed successfully"
    else
        log_error "Core action failed with code: $result"
    fi
    
    return $result
}
```

**Function 4: Result Processing**
```bash
${COMMAND_NAME}_post_process_results() {
    # Validate results
    ${COMMAND_NAME}_validate_results || return 1
    
    # Apply post-processing filters
    ${COMMAND_NAME}_apply_filters || return 1
    
    # Generate metrics
    ${COMMAND_NAME}_generate_metrics || return 1
    
    log_info "Result processing completed"
    return 0
}
```

**Function 5: Output Formatting**
```bash
${COMMAND_NAME}_format_output() {
    local format="${OUTPUT_FORMAT:-text}"
    
    case "$format" in
        "json")
            ${COMMAND_NAME}_output_json
            ;;
        "text")
            ${COMMAND_NAME}_output_text
            ;;
        "verbose")
            ${COMMAND_NAME}_output_verbose
            ;;
        *)
            ${COMMAND_NAME}_output_default
            ;;
    esac
}
```

## Step 4: Error Handling & Recovery

### Error Handling Strategy:

**Error Categories:**
1. **Input Errors** (1-10): Invalid arguments, missing files
2. **Environment Errors** (11-20): Missing dependencies, permission issues
3. **Execution Errors** (21-30): Core logic failures, external command failures
4. **Output Errors** (31-40): Formatting issues, write failures

**Error Handling Implementation:**
```bash
${COMMAND_NAME}_handle_error() {
    local error_code="$1"
    local error_context="$2"
    
    case "$error_code" in
        1-10)
            log_error "Input error: $error_context"
            ${COMMAND_NAME}_show_usage
            ;;
        11-20)
            log_error "Environment error: $error_context"
            ${COMMAND_NAME}_suggest_fixes
            ;;
        21-30)
            log_error "Execution error: $error_context"
            ${COMMAND_NAME}_attempt_recovery
            ;;
        31-40)
            log_error "Output error: $error_context"
            ${COMMAND_NAME}_fallback_output
            ;;
        *)
            log_error "Unknown error: $error_context"
            ;;
    esac
    
    return $error_code
}
```

### Recovery Mechanisms:
```bash
${COMMAND_NAME}_attempt_recovery() {
    log_info "Attempting automatic recovery..."
    
    # Retry with different parameters
    if ${COMMAND_NAME}_retry_with_fallback; then
        log_info "Recovery successful"
        return 0
    fi
    
    # Suggest manual intervention
    ${COMMAND_NAME}_suggest_manual_recovery
    return 1
}
```

## Step 5: Multi-Prompt Validation Testing

### Action Validation Framework:

**Test Scenario Generation:**
```bash
# Generate test scenarios for action validation
${COMMAND_NAME}_generate_test_scenarios() {
    echo "Generating validation scenarios..."
    
    # Scenario 1: Basic functionality
    cat > "test_basic.sh" << 'EOF'
#!/bin/bash
# Test basic command functionality
${COMMAND_NAME}_main $BASIC_TEST_ARGS
EOF
    
    # Scenario 2: Edge cases
    cat > "test_edge_cases.sh" << 'EOF'
#!/bin/bash
# Test edge cases and boundary conditions
${COMMAND_NAME}_main $EDGE_CASE_ARGS
EOF
    
    # Scenario 3: Error conditions
    cat > "test_error_handling.sh" << 'EOF'
#!/bin/bash
# Test error handling and recovery
${COMMAND_NAME}_main $INVALID_ARGS 2>&1 | grep -q "ERROR"
EOF
    
    # Scenario 4: Performance
    cat > "test_performance.sh" << 'EOF'
#!/bin/bash
# Test performance under load
time ${COMMAND_NAME}_main $PERFORMANCE_TEST_ARGS
EOF
}
```

### Validation Execution:
```bash
# Execute validation test suite
${COMMAND_NAME}_run_validation_tests() {
    local test_results=()
    
    echo "Running action validation tests..."
    
    # Test 1: Basic functionality
    if bash test_basic.sh; then
        test_results+=("✅ Basic functionality")
    else
        test_results+=("❌ Basic functionality")
    fi
    
    # Test 2: Edge cases
    if bash test_edge_cases.sh; then
        test_results+=("✅ Edge cases")
    else
        test_results+=("❌ Edge cases")
    fi
    
    # Test 3: Error handling
    if bash test_error_handling.sh; then
        test_results+=("✅ Error handling")
    else
        test_results+=("❌ Error handling")
    fi
    
    # Test 4: Performance
    if bash test_performance.sh; then
        test_results+=("✅ Performance")
    else
        test_results+=("❌ Performance")
    fi
    
    # Report results
    echo "=== VALIDATION RESULTS ==="
    printf '%s\n' "${test_results[@]}"
    
    # Calculate pass rate
    local passed=$(printf '%s\n' "${test_results[@]}" | grep -c "✅")
    local total=${#test_results[@]}
    local pass_rate=$((passed * 100 / total))
    
    echo "Pass Rate: $pass_rate% ($passed/$total)"
    
    if [[ $pass_rate -ge 75 ]]; then
        echo "✅ Action validation PASSED"
        return 0
    else
        echo "❌ Action validation FAILED"
        return 1
    fi
}
```

## Step 6: Action Integration Patterns

### Pattern Integration:

**Claude Code Builder Pattern Integration:**
```bash
# Integrate with existing patterns
${COMMAND_NAME}_integrate_patterns() {
    # Error handling pattern
    source ./patterns/error-handling/simple-error-handling.sh
    
    # Testing pattern
    source ./patterns/testing/simple-test-runner.sh
    
    # Quality gates pattern
    source ./patterns/quality-gates/quality-check.sh
    
    # Security pattern
    source ./patterns/security/security-basics.sh
    
    log_info "Pattern integration completed"
}
```

**Configuration Management:**
```bash
# Configuration handling with patterns
${COMMAND_NAME}_load_config() {
    # Use configuration pattern
    local config_file=".claude/commands/$COMMAND_NAME/config.json"
    
    if [[ -f "$config_file" ]]; then
        # Load configuration
        source "$config_file"
        log_info "Configuration loaded from $config_file"
    else
        # Use defaults
        ${COMMAND_NAME}_set_default_config
        log_info "Using default configuration"
    fi
}
```

## Step 7: Action Quality Assessment

### Quality Metrics:

**Action Quality Checklist:**
☐ Input validation implemented
☐ Error handling comprehensive  
☐ Output formatting consistent
☐ Documentation complete
☐ Test scenarios pass (≥75%)
☐ Performance within targets
☐ Security considerations addressed
☐ Pattern integration functional

**Quality Score Calculation:**
```bash
${COMMAND_NAME}_calculate_quality_score() {
    local score=0
    local max_score=8
    
    # Check each quality criterion
    ${COMMAND_NAME}_has_input_validation && ((score++))
    ${COMMAND_NAME}_has_error_handling && ((score++))
    ${COMMAND_NAME}_has_output_formatting && ((score++))
    ${COMMAND_NAME}_has_documentation && ((score++))
    ${COMMAND_NAME}_passes_tests && ((score++))
    ${COMMAND_NAME}_meets_performance && ((score++))
    ${COMMAND_NAME}_addresses_security && ((score++))
    ${COMMAND_NAME}_integrates_patterns && ((score++))
    
    local percentage=$((score * 100 / max_score))
    echo "Action Quality Score: $score/$max_score ($percentage%)"
    
    return $score
}
```

### Quality Gate Assessment:
**Current Quality Score**: $ACTION_QUALITY_SCORE/8 ($ACTION_QUALITY_PERCENTAGE%)

**Quality Gate Result**: $QUALITY_GATE_STATUS ✅/❌ (Minimum: 6/8 - 75%)

## Action Definition Complete

### Action Summary:
- ✅ **Purpose Defined**: $ACTION_CATEGORY action with $DETECTED_COMPLEXITY complexity
- ✅ **Components Created**: 5 core functions with error handling
- ✅ **Validation Tested**: $VALIDATION_PASS_RATE% success rate
- ✅ **Patterns Integrated**: Claude Code Builder patterns applied
- ✅ **Quality Assessed**: $ACTION_QUALITY_SCORE/8 quality score

### Generated Action Structure:
```yaml
action_definition:
  name: $COMMAND_NAME
  category: $ACTION_CATEGORY
  complexity: $DETECTED_COMPLEXITY
  functions:
    - validate_inputs
    - prepare_environment  
    - execute_core_action
    - post_process_results
    - format_output
  error_handling: comprehensive
  test_coverage: $VALIDATION_PASS_RATE%
  quality_score: $ACTION_QUALITY_SCORE/8
```

### Next Phase:

**Continue to:** `/command-builder/04-logic` for implementing the detailed action logic with current best practices.

Your action definition is complete and ready for logic implementation.

**Ready to proceed to logic implementation?** (y/n) > [WAIT FOR CONFIRMATION]