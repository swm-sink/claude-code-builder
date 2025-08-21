---
allowed-tools: Read, Write, Edit, Bash(source:*), WebSearch, Bash(shellcheck:*)
description: Command logic implementation with research-backed best practices and optimization
argument-hint: [logic-config] [--optimize-performance] [--validate-security]
category: command-builder
version: 1.0.0
---

# 🧠 COMMAND LOGIC IMPLEMENTATION

Implement detailed command logic using current best practices and optimization techniques.

## Logic Implementation Framework

### Action Configuration:
```yaml
$ACTION_DEFINITION_FROM_PREVIOUS_STEP
```

### Research Foundation Applied:
- ✅ Current bash scripting best practices
- ✅ Performance optimization techniques
- ✅ Security implementation standards
- ✅ Error handling patterns

## Step 1: Core Logic Architecture

### Implementation Strategy Selection:

**Based on action category "$ACTION_CATEGORY" and complexity "$DETECTED_COMPLEXITY":**

**Strategy Options:**

1. **Linear Implementation** - Sequential execution
   - Best for: Simple actions, single-purpose commands
   - Pattern: Step 1 → Step 2 → Step 3 → Complete
   - Example: validation → processing → output

2. **Modular Implementation** - Component-based architecture
   - Best for: Moderate actions, reusable components
   - Pattern: Module A + Module B + Module C = Result
   - Example: parser + processor + formatter

3. **Pipeline Implementation** - Data flow architecture
   - Best for: Transformation actions, data processing
   - Pattern: Input → Filter → Transform → Output
   - Example: read → validate → process → format → write

4. **State Machine Implementation** - State-driven logic
   - Best for: Complex actions, multi-phase operations
   - Pattern: State A → Event → State B → Event → State C
   - Example: init → configure → execute → monitor → complete

5. **Event-Driven Implementation** - Reactive architecture
   - Best for: Automation actions, integration commands
   - Pattern: Trigger → Handler → Action → Response
   - Example: watch → detect → respond → notify

**Recommended Strategy**: $RECOMMENDED_STRATEGY for $ACTION_CATEGORY complexity

**Confirm implementation strategy (1-5):** > [WAIT FOR INPUT]

### Architecture Pattern Application:

**Selected Strategy**: $SELECTED_STRATEGY

**Architecture Components:**
```yaml
architecture:
  strategy: $SELECTED_STRATEGY
  components:
    - $COMPONENT_1: $COMPONENT_1_DESCRIPTION
    - $COMPONENT_2: $COMPONENT_2_DESCRIPTION
    - $COMPONENT_3: $COMPONENT_3_DESCRIPTION
  data_flow: $DATA_FLOW_PATTERN
  error_propagation: $ERROR_PROPAGATION_PATTERN
  state_management: $STATE_MANAGEMENT_APPROACH
```

## Step 2: Detailed Function Implementation

### Core Function Logic:

**Function 1: Input Validation (Enhanced)**
```bash
${COMMAND_NAME}_validate_inputs() {
    local args=("$@")
    local validation_errors=()
    
    log_info "Starting comprehensive input validation..."
    
    # Parse arguments with enhanced validation
    while [[ $# -gt 0 ]]; do
        case $1 in
            --help|-h)
                ${COMMAND_NAME}_show_usage
                exit 0
                ;;
            --verbose|-v)
                export ${COMMAND_NAME}_VERBOSE=1
                shift
                ;;
            --dry-run)
                export ${COMMAND_NAME}_DRY_RUN=1
                shift
                ;;
            --config=*)
                local config_file="${1#*=}"
                if [[ ! -f "$config_file" ]]; then
                    validation_errors+=("Config file not found: $config_file")
                fi
                export ${COMMAND_NAME}_CONFIG="$config_file"
                shift
                ;;
            --*)
                validation_errors+=("Unknown option: $1")
                shift
                ;;
            *)
                # Positional argument validation
                ${COMMAND_NAME}_validate_positional_arg "$1" || validation_errors+=("Invalid argument: $1")
                shift
                ;;
        esac
    done
    
    # Validate required arguments
    ${COMMAND_NAME}_check_required_args || validation_errors+=("Missing required arguments")
    
    # Validate argument combinations
    ${COMMAND_NAME}_validate_arg_combinations || validation_errors+=("Invalid argument combination")
    
    # Validate dependencies
    ${COMMAND_NAME}_check_dependencies || validation_errors+=("Missing dependencies")
    
    # Report validation results
    if [[ ${#validation_errors[@]} -gt 0 ]]; then
        log_error "Input validation failed:"
        printf '  - %s\n' "${validation_errors[@]}"
        ${COMMAND_NAME}_show_usage
        return 1
    fi
    
    log_info "✅ Input validation passed"
    return 0
}

# Enhanced argument validation helpers
${COMMAND_NAME}_validate_positional_arg() {
    local arg="$1"
    
    # Implement specific validation based on action type
    case "$ACTION_CATEGORY" in
        "analysis")
            # Validate file/directory paths
            [[ -e "$arg" ]] || return 1
            ;;
        "generation")
            # Validate output path is writable
            local dir=$(dirname "$arg")
            [[ -w "$dir" ]] || return 1
            ;;
        "transformation")
            # Validate source format
            ${COMMAND_NAME}_validate_source_format "$arg" || return 1
            ;;
        *)
            # Generic validation
            [[ -n "$arg" ]] || return 1
            ;;
    esac
    
    return 0
}

${COMMAND_NAME}_check_dependencies() {
    local missing_deps=()
    
    # Check system dependencies
    for dep in "${SYSTEM_DEPENDENCIES[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            missing_deps+=("$dep")
        fi
    done
    
    # Check pattern dependencies
    for pattern in "${PATTERN_DEPENDENCIES[@]}"; do
        if [[ ! -f "./patterns/$pattern" ]]; then
            missing_deps+=("pattern: $pattern")
        fi
    done
    
    if [[ ${#missing_deps[@]} -gt 0 ]]; then
        log_error "Missing dependencies:"
        printf '  - %s\n' "${missing_deps[@]}"
        return 1
    fi
    
    return 0
}
```

**Function 2: Environment Preparation (Optimized)**
```bash
${COMMAND_NAME}_prepare_environment() {
    log_info "Preparing optimized execution environment..."
    
    # Performance-optimized directory setup
    ${COMMAND_NAME}_setup_work_directories || return 1
    
    # Memory-efficient temporary file management
    ${COMMAND_NAME}_setup_temp_files || return 1
    
    # Pattern loading with caching
    ${COMMAND_NAME}_load_patterns_cached || return 1
    
    # Configuration loading with validation
    ${COMMAND_NAME}_load_and_validate_config || return 1
    
    # Security context setup
    ${COMMAND_NAME}_setup_security_context || return 1
    
    # Performance monitoring setup
    ${COMMAND_NAME}_setup_performance_monitoring || return 1
    
    log_info "✅ Environment preparation completed"
    return 0
}

${COMMAND_NAME}_setup_work_directories() {
    # Create work directory with proper permissions
    local work_dir="${${COMMAND_NAME}_WORK_DIR:-/tmp/${COMMAND_NAME}_$$}"
    
    if ! mkdir -p "$work_dir" 2>/dev/null; then
        log_error "Failed to create work directory: $work_dir"
        return 1
    fi
    
    # Set proper permissions (secure by default)
    chmod 700 "$work_dir" || return 1
    
    # Export for use by other functions
    export ${COMMAND_NAME}_WORK_DIR="$work_dir"
    
    # Setup cleanup trap
    trap "${COMMAND_NAME}_cleanup_environment" EXIT
    
    log_info "Work directory created: $work_dir"
    return 0
}

${COMMAND_NAME}_load_patterns_cached() {
    local pattern_cache="/tmp/.${COMMAND_NAME}_patterns_cache"
    
    # Check if patterns are already cached
    if [[ -f "$pattern_cache" ]] && [[ $(find "$pattern_cache" -mmin -60 | wc -l) -gt 0 ]]; then
        log_info "Loading patterns from cache..."
        source "$pattern_cache"
        return 0
    fi
    
    # Load patterns and create cache
    log_info "Loading and caching patterns..."
    {
        source ./patterns/error-handling/simple-error-handling.sh
        source ./patterns/testing/simple-test-runner.sh
        source ./patterns/security/security-basics.sh
        
        # Add pattern-specific functions
        declare -f log_info log_warn log_error handle_error
    } > "$pattern_cache"
    
    source "$pattern_cache"
    log_info "Patterns loaded and cached"
    return 0
}
```

**Function 3: Core Action Implementation (Optimized)**
```bash
${COMMAND_NAME}_execute_core_action() {
    local args=("$@")
    
    log_info "Executing core action with optimization..."
    
    # Pre-execution validation
    ${COMMAND_NAME}_pre_execution_check || return 1
    
    # Performance tracking
    local start_time=$(date +%s%N)
    
    # Execute based on implementation strategy
    case "$SELECTED_STRATEGY" in
        "linear")
            ${COMMAND_NAME}_execute_linear_strategy "${args[@]}"
            ;;
        "modular")
            ${COMMAND_NAME}_execute_modular_strategy "${args[@]}"
            ;;
        "pipeline")
            ${COMMAND_NAME}_execute_pipeline_strategy "${args[@]}"
            ;;
        "state_machine")
            ${COMMAND_NAME}_execute_state_machine_strategy "${args[@]}"
            ;;
        "event_driven")
            ${COMMAND_NAME}_execute_event_driven_strategy "${args[@]}"
            ;;
        *)
            log_error "Unknown implementation strategy: $SELECTED_STRATEGY"
            return 1
            ;;
    esac
    
    local execution_result=$?
    local end_time=$(date +%s%N)
    local duration=$(((end_time - start_time) / 1000000))
    
    # Log performance metrics
    log_info "Core action completed in ${duration}ms with result: $execution_result"
    
    # Post-execution validation
    if [[ $execution_result -eq 0 ]]; then
        ${COMMAND_NAME}_post_execution_validation || return 2
    fi
    
    return $execution_result
}

# Strategy-specific implementations
${COMMAND_NAME}_execute_linear_strategy() {
    local args=("$@")
    
    log_info "Executing linear strategy..."
    
    # Step 1: Data acquisition
    ${COMMAND_NAME}_acquire_data "${args[@]}" || return 1
    
    # Step 2: Data processing
    ${COMMAND_NAME}_process_data || return 2
    
    # Step 3: Result generation
    ${COMMAND_NAME}_generate_results || return 3
    
    return 0
}

${COMMAND_NAME}_execute_modular_strategy() {
    local args=("$@")
    
    log_info "Executing modular strategy..."
    
    # Module 1: Input processor
    local processed_input
    processed_input=$(${COMMAND_NAME}_input_processor_module "${args[@]}") || return 1
    
    # Module 2: Core processor
    local core_result
    core_result=$(${COMMAND_NAME}_core_processor_module "$processed_input") || return 2
    
    # Module 3: Output formatter
    ${COMMAND_NAME}_output_formatter_module "$core_result" || return 3
    
    return 0
}

${COMMAND_NAME}_execute_pipeline_strategy() {
    local args=("$@")
    
    log_info "Executing pipeline strategy..."
    
    # Pipeline: Input → Filter → Transform → Output
    echo "${args[@]}" | \
        ${COMMAND_NAME}_input_filter | \
        ${COMMAND_NAME}_data_transformer | \
        ${COMMAND_NAME}_output_generator || return 1
    
    return 0
}
```

**Function 4: Result Processing (Enhanced)**
```bash
${COMMAND_NAME}_post_process_results() {
    log_info "Processing results with enhanced validation..."
    
    # Validate result integrity
    ${COMMAND_NAME}_validate_result_integrity || return 1
    
    # Apply result filters
    ${COMMAND_NAME}_apply_result_filters || return 2
    
    # Generate metadata
    ${COMMAND_NAME}_generate_result_metadata || return 3
    
    # Security scan results
    ${COMMAND_NAME}_scan_results_security || return 4
    
    # Performance analysis
    ${COMMAND_NAME}_analyze_result_performance || return 5
    
    log_info "✅ Result processing completed"
    return 0
}

${COMMAND_NAME}_validate_result_integrity() {
    local result_file="$1"
    
    # Check result exists and is not empty
    if [[ ! -s "$result_file" ]]; then
        log_error "Result file is empty or missing: $result_file"
        return 1
    fi
    
    # Validate result format
    case "$EXPECTED_RESULT_FORMAT" in
        "json")
            jq . "$result_file" >/dev/null 2>&1 || {
                log_error "Invalid JSON format in result file"
                return 1
            }
            ;;
        "yaml")
            yq . "$result_file" >/dev/null 2>&1 || {
                log_error "Invalid YAML format in result file"
                return 1
            }
            ;;
        "text")
            # Check for basic text validity
            file "$result_file" | grep -q "text" || {
                log_error "Result file is not valid text"
                return 1
            }
            ;;
    esac
    
    log_info "Result integrity validation passed"
    return 0
}
```

**Function 5: Output Formatting (Advanced)**
```bash
${COMMAND_NAME}_format_output() {
    local format="${OUTPUT_FORMAT:-auto}"
    local result_data="$1"
    
    log_info "Formatting output as: $format"
    
    # Auto-detect format if needed
    if [[ "$format" == "auto" ]]; then
        format=$(${COMMAND_NAME}_detect_optimal_format "$result_data")
    fi
    
    # Apply format-specific processing
    case "$format" in
        "json")
            ${COMMAND_NAME}_format_json "$result_data"
            ;;
        "yaml")
            ${COMMAND_NAME}_format_yaml "$result_data"
            ;;
        "table")
            ${COMMAND_NAME}_format_table "$result_data"
            ;;
        "markdown")
            ${COMMAND_NAME}_format_markdown "$result_data"
            ;;
        "text")
            ${COMMAND_NAME}_format_text "$result_data"
            ;;
        "csv")
            ${COMMAND_NAME}_format_csv "$result_data"
            ;;
        *)
            log_warn "Unknown format '$format', using text format"
            ${COMMAND_NAME}_format_text "$result_data"
            ;;
    esac
    
    # Add metadata footer if verbose mode
    if [[ "${${COMMAND_NAME}_VERBOSE:-0}" == "1" ]]; then
        ${COMMAND_NAME}_add_metadata_footer
    fi
    
    return 0
}

${COMMAND_NAME}_format_json() {
    local data="$1"
    
    # Pretty-print JSON with jq if available
    if command -v jq >/dev/null 2>&1; then
        echo "$data" | jq .
    else
        # Fallback to basic JSON formatting
        echo "$data"
    fi
}

${COMMAND_NAME}_format_table() {
    local data="$1"
    
    # Use column command for table formatting if available
    if command -v column >/dev/null 2>&1; then
        echo "$data" | column -t -s "|"
    else
        # Fallback to basic formatting
        echo "$data"
    fi
}
```

## Step 3: Performance Optimization

### Optimization Techniques:

**Memory Optimization:**
```bash
${COMMAND_NAME}_optimize_memory() {
    # Use memory-efficient data structures
    declare -A data_cache
    
    # Process data in chunks for large datasets
    local chunk_size=1000
    
    # Clear unnecessary variables
    ${COMMAND_NAME}_cleanup_variables
    
    # Use memory mapping for large files
    if [[ -n "$LARGE_FILE" ]]; then
        exec 3< "$LARGE_FILE"
        while IFS= read -r line <&3; do
            ${COMMAND_NAME}_process_line "$line"
        done
        exec 3<&-
    fi
}
```

**CPU Optimization:**
```bash
${COMMAND_NAME}_optimize_cpu() {
    # Use parallel processing where beneficial
    if [[ "$ENABLE_PARALLEL" == "1" ]] && [[ "$DATASET_SIZE" -gt 100 ]]; then
        ${COMMAND_NAME}_parallel_process
    else
        ${COMMAND_NAME}_sequential_process
    fi
    
    # Cache expensive computations
    ${COMMAND_NAME}_enable_computation_cache
    
    # Use optimized algorithms
    ${COMMAND_NAME}_use_optimized_algorithms
}

${COMMAND_NAME}_parallel_process() {
    local max_jobs=4
    local job_count=0
    
    for item in "${items[@]}"; do
        if [[ $job_count -ge $max_jobs ]]; then
            wait # Wait for any job to complete
            ((job_count--))
        fi
        
        ${COMMAND_NAME}_process_item "$item" &
        ((job_count++))
    done
    
    wait # Wait for all remaining jobs
}
```

**I/O Optimization:**
```bash
${COMMAND_NAME}_optimize_io() {
    # Batch file operations
    local batch_operations=()
    
    # Use efficient file reading
    ${COMMAND_NAME}_efficient_file_read() {
        local file="$1"
        
        # Use mmap for large files
        if [[ $(stat -c%s "$file") -gt 10485760 ]]; then # 10MB
            ${COMMAND_NAME}_mmap_read "$file"
        else
            ${COMMAND_NAME}_standard_read "$file"
        fi
    }
    
    # Buffer output operations
    ${COMMAND_NAME}_buffer_output_operations
}
```

## Step 4: Security Implementation

### Security Measures:

**Input Security:**
```bash
${COMMAND_NAME}_secure_input_handling() {
    local input="$1"
    
    # Input sanitization
    input=$(${COMMAND_NAME}_sanitize_input "$input")
    
    # Input validation against injection attacks
    if ${COMMAND_NAME}_detect_injection_attempt "$input"; then
        log_error "Security violation: potential injection detected"
        return 1
    fi
    
    # Path traversal protection
    if [[ "$input" == *"../"* ]] || [[ "$input" == *"..\\\\"]* ]]; then
        log_error "Security violation: path traversal attempt"
        return 1
    fi
    
    # Command injection protection
    if [[ "$input" =~ [;\|\&\$\(\)] ]]; then
        log_error "Security violation: command injection attempt"
        return 1
    fi
    
    return 0
}
```

**Output Security:**
```bash
${COMMAND_NAME}_secure_output_handling() {
    local output="$1"
    
    # Sanitize output to prevent information disclosure
    output=$(${COMMAND_NAME}_sanitize_output "$output")
    
    # Remove sensitive information
    output=$(echo "$output" | sed 's/password=[^[:space:]]*/password=****/g')
    output=$(echo "$output" | sed 's/token=[^[:space:]]*/token=****/g')
    
    # Validate output doesn't contain control characters
    if [[ "$output" =~ [[:cntrl:]] ]]; then
        output=$(echo "$output" | tr -d '[:cntrl:]')
    fi
    
    echo "$output"
}
```

**Execution Security:**
```bash
${COMMAND_NAME}_secure_execution() {
    # Drop privileges if running as root
    if [[ $EUID -eq 0 ]] && [[ "$ALLOW_ROOT" != "1" ]]; then
        log_error "Security policy: Command should not run as root"
        return 1
    fi
    
    # Set secure umask
    umask 0077
    
    # Disable core dumps
    ulimit -c 0
    
    # Set resource limits
    ulimit -f 1048576  # 1GB file size limit
    ulimit -t 300      # 5 minute CPU time limit
    ulimit -v 1048576  # 1GB virtual memory limit
    
    return 0
}
```

## Step 5: Advanced Error Handling

### Comprehensive Error Strategy:

**Multi-Level Error Handling:**
```bash
${COMMAND_NAME}_advanced_error_handling() {
    local error_code="$1"
    local error_context="$2"
    local stack_trace="$3"
    
    # Log error with full context
    log_error "Error $error_code in $error_context"
    
    # Stack trace if available
    if [[ -n "$stack_trace" ]]; then
        log_error "Stack trace: $stack_trace"
    fi
    
    # Categorize error type
    local error_category
    error_category=$(${COMMAND_NAME}_categorize_error "$error_code")
    
    # Apply category-specific handling
    case "$error_category" in
        "recoverable")
            ${COMMAND_NAME}_attempt_recovery "$error_code" "$error_context"
            ;;
        "user_error")
            ${COMMAND_NAME}_handle_user_error "$error_code" "$error_context"
            ;;
        "system_error")
            ${COMMAND_NAME}_handle_system_error "$error_code" "$error_context"
            ;;
        "critical")
            ${COMMAND_NAME}_handle_critical_error "$error_code" "$error_context"
            ;;
    esac
    
    # Generate error report
    ${COMMAND_NAME}_generate_error_report "$error_code" "$error_context"
    
    return $error_code
}

${COMMAND_NAME}_attempt_recovery() {
    local error_code="$1"
    local error_context="$2"
    
    log_info "Attempting automatic recovery..."
    
    # Recovery strategies based on error type
    case "$error_code" in
        1-10) # Input errors
            ${COMMAND_NAME}_recover_input_error
            ;;
        11-20) # Environment errors
            ${COMMAND_NAME}_recover_environment_error
            ;;
        21-30) # Execution errors
            ${COMMAND_NAME}_recover_execution_error
            ;;
        *)
            log_warn "No recovery strategy available for error $error_code"
            return 1
            ;;
    esac
}
```

## Step 6: Logic Quality Validation

### Quality Assessment Framework:

**Logic Quality Checklist:**
```bash
${COMMAND_NAME}_assess_logic_quality() {
    local quality_score=0
    local quality_report=()
    
    # Check 1: Function modularity
    if ${COMMAND_NAME}_check_function_modularity; then
        ((quality_score += 10))
        quality_report+=("✅ Function modularity")
    else
        quality_report+=("❌ Function modularity")
    fi
    
    # Check 2: Error handling coverage
    if ${COMMAND_NAME}_check_error_coverage; then
        ((quality_score += 15))
        quality_report+=("✅ Error handling coverage")
    else
        quality_report+=("❌ Error handling coverage")
    fi
    
    # Check 3: Performance optimization
    if ${COMMAND_NAME}_check_performance_optimization; then
        ((quality_score += 10))
        quality_report+=("✅ Performance optimization")
    else
        quality_report+=("❌ Performance optimization")
    fi
    
    # Check 4: Security implementation
    if ${COMMAND_NAME}_check_security_implementation; then
        ((quality_score += 15))
        quality_report+=("✅ Security implementation")
    else
        quality_report+=("❌ Security implementation")
    fi
    
    # Check 5: Code readability
    if ${COMMAND_NAME}_check_code_readability; then
        ((quality_score += 10))
        quality_report+=("✅ Code readability")
    else
        quality_report+=("❌ Code readability")
    fi
    
    # Check 6: Testing coverage
    if ${COMMAND_NAME}_check_testing_coverage; then
        ((quality_score += 15))
        quality_report+=("✅ Testing coverage")
    else
        quality_report+=("❌ Testing coverage")
    fi
    
    # Check 7: Documentation quality
    if ${COMMAND_NAME}_check_documentation_quality; then
        ((quality_score += 10))
        quality_report+=("✅ Documentation quality")
    else
        quality_report+=("❌ Documentation quality")
    fi
    
    # Check 8: Pattern compliance
    if ${COMMAND_NAME}_check_pattern_compliance; then
        ((quality_score += 15))
        quality_report+=("✅ Pattern compliance")
    else
        quality_report+=("❌ Pattern compliance")
    fi
    
    # Report results
    echo "=== LOGIC QUALITY ASSESSMENT ==="
    printf '%s\n' "${quality_report[@]}"
    echo "Quality Score: $quality_score/100"
    
    # Quality gate
    if [[ $quality_score -ge 80 ]]; then
        echo "✅ Logic quality PASSED"
        return 0
    else
        echo "❌ Logic quality FAILED (minimum: 80/100)"
        return 1
    fi
}
```

### Static Code Analysis:
```bash
${COMMAND_NAME}_run_static_analysis() {
    echo "Running static code analysis..."
    
    # ShellCheck analysis
    if command -v shellcheck >/dev/null 2>&1; then
        shellcheck ".claude/commands/$COMMAND_NAME/implementation.sh" || {
            log_warn "ShellCheck found issues"
        }
    fi
    
    # Custom analysis rules
    ${COMMAND_NAME}_check_custom_rules
    
    # Performance analysis
    ${COMMAND_NAME}_analyze_performance_patterns
    
    # Security analysis
    ${COMMAND_NAME}_analyze_security_patterns
}
```

## Logic Implementation Complete

### Implementation Summary:
- ✅ **Strategy Applied**: $SELECTED_STRATEGY architecture
- ✅ **Functions Implemented**: 5 core functions with optimization
- ✅ **Performance Optimized**: Memory, CPU, and I/O optimizations
- ✅ **Security Hardened**: Input, output, and execution security
- ✅ **Error Handling**: Multi-level error handling with recovery
- ✅ **Quality Validated**: $LOGIC_QUALITY_SCORE/100 quality score

### Implementation Configuration:
```yaml
logic_implementation:
  strategy: $SELECTED_STRATEGY
  optimization_level: high
  security_level: strict
  error_handling: comprehensive
  quality_score: $LOGIC_QUALITY_SCORE/100
  static_analysis: passed
  ready_for_testing: true
```

### Next Phase:

**Continue to:** `/command-builder/05-compose` for integration and composition testing.

Your command logic is fully implemented and ready for composition testing.

**Ready to proceed to composition phase?** (y/n) > [WAIT FOR CONFIRMATION]