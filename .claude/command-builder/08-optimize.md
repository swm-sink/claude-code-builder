---
allowed-tools: Read, Write, Edit, Bash(source:*), WebSearch
description: Meta-prompt optimization for command improvement using self-improvement loops
argument-hint: [optimize-config] [--target-score 85] [--max-iterations 3]
category: command-builder
version: 1.0.0
---

# 🔄 COMMAND META-PROMPT OPTIMIZATION

Self-improvement optimization for commands using meta-prompting techniques.

## Optimization Framework

### Judge Evaluation Results:
```yaml
$JUDGE_EVALUATION_FROM_PREVIOUS_STEP
```

### Research Foundation Applied:
- ✅ Meta-prompting self-improvement methodology
- ✅ Iterative enhancement loops
- ✅ Target-driven optimization
- ✅ Quality convergence analysis

## Step 1: Optimization Strategy & Target Analysis

### Current Performance Assessment:

**Judge Evaluation Summary:**
| Judge | Score | Weight | Contribution | Target | Gap |
|-------|-------|--------|--------------|--------|-----|
| Technical | $JUDGE1_TOTAL_SCORE/100 | 40% | $WEIGHTED_TECHNICAL | 40 | $TECHNICAL_GAP |
| UX | $JUDGE2_TOTAL_SCORE/100 | 35% | $WEIGHTED_UX | 35 | $UX_GAP |
| Standards | $JUDGE3_TOTAL_SCORE/100 | 25% | $WEIGHTED_STANDARDS | 25 | $STANDARDS_GAP |
| **Consensus** | **$CONSENSUS_SCORE/100** | **100%** | **$CONSENSUS_SCORE** | **85** | **$CONSENSUS_GAP** |

### Optimization Decision Gate:

**Optimization Required?**
```bash
check_optimization_requirement() {
    local consensus_score="$CONSENSUS_SCORE"
    local target_score="${TARGET_CONSENSUS_SCORE:-85}"
    
    if [[ $consensus_score -ge $target_score ]]; then
        echo "✅ Consensus score ($consensus_score) meets target ($target_score)"
        echo "Optimization: OPTIONAL - Command ready for enhancement"
        export OPTIMIZATION_REQUIRED="false"
        export OPTIMIZATION_REASON="target_achieved"
        return 0
    else
        local gap=$((target_score - consensus_score))
        echo "⚠️ Consensus score ($consensus_score) below target ($target_score)"
        echo "Gap: $gap points - Optimization REQUIRED"
        export OPTIMIZATION_REQUIRED="true"
        export OPTIMIZATION_GAP="$gap"
        return 1
    fi
}

check_optimization_requirement
```

### Optimization Strategy Selection:

**If optimization required, select strategy:**

1. **Focused Optimization** - Target highest-impact area
   - Best for: Single weak area
   - Approach: Intensive improvement of lowest-scoring judge
   - Target: +15-20 points in one area

2. **Balanced Optimization** - Improve all areas proportionally
   - Best for: Multiple moderate gaps
   - Approach: Distribute improvements across all judges
   - Target: +5-10 points in each area

3. **Iterative Optimization** - Multiple improvement rounds
   - Best for: Large gaps (>20 points)
   - Approach: Multiple optimization cycles
   - Target: +8-12 points per iteration

**Selected Strategy**: $SELECTED_OPTIMIZATION_STRATEGY

## Step 2: Meta-Prompt Generation for Command Optimization

### Optimization Meta-Prompt Creation:

**Iteration 1 Meta-Prompt:**
```markdown
You are an expert command optimization specialist with deep expertise in:
- Claude Code Builder patterns and architecture
- Bash scripting best practices and optimization
- User experience design for CLI tools
- Software quality standards and compliance
- Performance optimization techniques

Current Command Assessment:
- **Command Name**: $COMMAND_NAME
- **Current Consensus Score**: $CONSENSUS_SCORE/100
- **Target Score**: $TARGET_CONSENSUS_SCORE/100
- **Optimization Gap**: $OPTIMIZATION_GAP points

Individual Judge Scores:
- **Technical Judge**: $JUDGE1_TOTAL_SCORE/100 (Target: improve by $TECHNICAL_IMPROVEMENT_TARGET points)
- **UX Judge**: $JUDGE2_TOTAL_SCORE/100 (Target: improve by $UX_IMPROVEMENT_TARGET points)  
- **Standards Judge**: $JUDGE3_TOTAL_SCORE/100 (Target: improve by $STANDARDS_IMPROVEMENT_TARGET points)

Priority Issues to Address:
$PRIORITIZED_ISSUES_FOR_OPTIMIZATION

Current Implementation Analysis:
$CURRENT_IMPLEMENTATION_SUMMARY

Optimization Constraints:
- Maintain all existing functionality
- Follow Claude Code Builder principles (<50 lines per function)
- Preserve pattern integration
- Stay within performance targets
- Implement current security best practices
- Ensure backward compatibility

Optimization Objectives:
1. Address the specific issues identified by each judge
2. Improve the lowest-scoring areas first
3. Enhance overall code quality and user experience
4. Strengthen standards compliance
5. Optimize for the identified optimization strategy: $SELECTED_OPTIMIZATION_STRATEGY

Generate optimized implementation that systematically addresses each identified issue while maintaining command integrity and improving the consensus score toward the target of $TARGET_CONSENSUS_SCORE/100.

Focus Areas for This Iteration:
$FOCUS_AREAS_FOR_CURRENT_ITERATION
```

### Meta-Prompt Application Process:

**Optimization Execution:**
```bash
execute_command_optimization() {
    local iteration="$1"
    local current_score="$2"
    local target_score="$3"
    
    echo "=== OPTIMIZATION ITERATION $iteration ==="
    echo "Current Score: $current_score/100"
    echo "Target Score: $target_score/100"
    echo "Strategy: $SELECTED_OPTIMIZATION_STRATEGY"
    
    # Analyze current implementation
    ${COMMAND_NAME}_analyze_current_implementation
    
    # Identify optimization opportunities
    ${COMMAND_NAME}_identify_optimization_opportunities "$iteration"
    
    # Generate optimizations based on meta-prompt
    ${COMMAND_NAME}_generate_optimizations "$iteration"
    
    # Apply optimizations
    ${COMMAND_NAME}_apply_optimizations "$iteration"
    
    # Validate optimizations
    ${COMMAND_NAME}_validate_optimizations "$iteration"
    
    return 0
}

${COMMAND_NAME}_analyze_current_implementation() {
    echo "Analyzing current implementation for optimization opportunities..."
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local analysis_results=()
    
    # Code structure analysis
    local function_count
    function_count=$(grep -c "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$command_path"/*.sh 2>/dev/null || echo 0)
    analysis_results+=("Functions: $function_count")
    
    # Line count analysis
    local total_lines
    total_lines=$(wc -l < "$command_path"/*.sh 2>/dev/null || echo 0)
    analysis_results+=("Total lines: $total_lines")
    
    # Pattern usage analysis
    local error_pattern_usage
    error_pattern_usage=$(grep -c "log_info\|log_warn\|log_error" "$command_path"/*.sh 2>/dev/null || echo 0)
    analysis_results+=("Error pattern usage: $error_pattern_usage instances")
    
    # Documentation analysis
    local documentation_files
    documentation_files=$(find "$command_path" -name "*.md" | wc -l)
    analysis_results+=("Documentation files: $documentation_files")
    
    echo "Current Implementation Analysis:"
    printf '  - %s\n' "${analysis_results[@]}"
    
    export CURRENT_ANALYSIS_RESULTS="$(IFS=';'; echo "${analysis_results[*]}")"
}

${COMMAND_NAME}_identify_optimization_opportunities() {
    local iteration="$1"
    
    echo "Identifying optimization opportunities for iteration $iteration..."
    
    local opportunities=()
    
    # Technical optimization opportunities
    if [[ $JUDGE1_TOTAL_SCORE -lt 80 ]]; then
        opportunities+=("Technical: Improve code quality and performance")
        
        if [[ $JUDGE1_TOTAL_SCORE -lt 60 ]]; then
            opportunities+=("Technical: Critical - Add comprehensive error handling")
            opportunities+=("Technical: Critical - Implement security measures")
        fi
    fi
    
    # UX optimization opportunities
    if [[ $JUDGE2_TOTAL_SCORE -lt 75 ]]; then
        opportunities+=("UX: Enhance user experience and documentation")
        
        if [[ $JUDGE2_TOTAL_SCORE -lt 55 ]]; then
            opportunities+=("UX: Critical - Improve help system and error messages")
            opportunities+=("UX: Critical - Add comprehensive documentation")
        fi
    fi
    
    # Standards optimization opportunities
    if [[ $JUDGE3_TOTAL_SCORE -lt 70 ]]; then
        opportunities+=("Standards: Improve compliance and integration")
        
        if [[ $JUDGE3_TOTAL_SCORE -lt 50 ]]; then
            opportunities+=("Standards: Critical - Implement pattern compliance")
            opportunities+=("Standards: Critical - Follow naming conventions")
        fi
    fi
    
    echo "Optimization Opportunities:"
    printf '  - %s\n' "${opportunities[@]}"
    
    export "OPTIMIZATION_OPPORTUNITIES_$iteration"="$(IFS=';'; echo "${opportunities[*]}")"
}
```

## Step 3: Specific Optimization Implementation

### Technical Optimizations:

**Technical Enhancement Framework:**
```bash
${COMMAND_NAME}_apply_technical_optimizations() {
    local iteration="$1"
    
    echo "Applying technical optimizations..."
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local optimizations_applied=()
    
    # Optimization 1: Enhanced Error Handling
    if [[ $JUDGE1_TOTAL_SCORE -lt 80 ]]; then
        ${COMMAND_NAME}_enhance_error_handling "$command_path"
        optimizations_applied+=("Enhanced error handling")
    fi
    
    # Optimization 2: Performance Improvements
    if grep -q "performance" <<< "$JUDGE1_DETAILED_SCORES"; then
        ${COMMAND_NAME}_add_performance_optimizations "$command_path"
        optimizations_applied+=("Performance optimizations")
    fi
    
    # Optimization 3: Security Enhancements
    if grep -q "security" <<< "$JUDGE1_DETAILED_SCORES"; then
        ${COMMAND_NAME}_add_security_measures "$command_path"
        optimizations_applied+=("Security enhancements")
    fi
    
    # Optimization 4: Code Quality Improvements
    ${COMMAND_NAME}_improve_code_quality "$command_path"
    optimizations_applied+=("Code quality improvements")
    
    echo "Technical optimizations applied:"
    printf '  - %s\n' "${optimizations_applied[@]}"
    
    export "TECHNICAL_OPTIMIZATIONS_$iteration"="$(IFS=';'; echo "${optimizations_applied[*]}")"
}

${COMMAND_NAME}_enhance_error_handling() {
    local command_path="$1"
    
    echo "Enhancing error handling..."
    
    # Add comprehensive error handling if missing
    if ! grep -q "handle_error" "$command_path"/*.sh 2>/dev/null; then
        cat >> "$command_path/implementation.sh" << 'EOF'

# Enhanced error handling
${COMMAND_NAME}_handle_error() {
    local error_code="$1"
    local error_context="$2"
    local line_number="$3"
    
    log_error "Error $error_code at line $line_number: $error_context"
    
    # Provide recovery suggestions
    case "$error_code" in
        1) log_error "Suggestion: Check input arguments and try again" ;;
        2) log_error "Suggestion: Verify file permissions and paths" ;;
        3) log_error "Suggestion: Check system resources and dependencies" ;;
        *) log_error "Suggestion: Run with --help for usage information" ;;
    esac
    
    return $error_code
}
EOF
    fi
    
    # Add error traps if missing
    if ! grep -q "trap.*error" "$command_path"/*.sh 2>/dev/null; then
        sed -i '1a\\ntrap '\''${COMMAND_NAME}_handle_error $? "${BASH_COMMAND}" $LINENO'\'' ERR' "$command_path"/implementation.sh
    fi
}

${COMMAND_NAME}_add_performance_optimizations() {
    local command_path="$1"
    
    echo "Adding performance optimizations..."
    
    cat >> "$command_path/implementation.sh" << 'EOF'

# Performance monitoring and optimization
${COMMAND_NAME}_monitor_performance() {
    local command_to_monitor="$1"
    shift
    local args=("$@")
    
    local start_time=$(date +%s%N)
    local start_memory=$(ps -o rss= -p $$)
    
    # Execute command with monitoring
    "$command_to_monitor" "${args[@]}"
    local exit_code=$?
    
    local end_time=$(date +%s%N)
    local end_memory=$(ps -o rss= -p $$)
    
    local duration=$(((end_time - start_time) / 1000000))
    local memory_diff=$((end_memory - start_memory))
    
    if [[ "${${COMMAND_NAME}_VERBOSE:-0}" == "1" ]]; then
        log_info "Performance: ${duration}ms execution, ${memory_diff}KB memory delta"
    fi
    
    return $exit_code
}
EOF
}

${COMMAND_NAME}_add_security_measures() {
    local command_path="$1"
    
    echo "Adding security measures..."
    
    cat >> "$command_path/implementation.sh" << 'EOF'

# Enhanced security measures
${COMMAND_NAME}_secure_input() {
    local input="$1"
    
    # Path traversal protection
    if [[ "$input" == *"../"* ]] || [[ "$input" == *"..\\"* ]]; then
        log_error "Security violation: Path traversal attempt detected"
        return 1
    fi
    
    # Command injection protection
    if [[ "$input" =~ [;\|\&\$\(\)\`] ]]; then
        log_error "Security violation: Command injection attempt detected"
        return 1
    fi
    
    # NULL byte protection
    if [[ "$input" == *$'\0'* ]]; then
        log_error "Security violation: NULL byte detected"
        return 1
    fi
    
    echo "$input"
}

${COMMAND_NAME}_secure_output() {
    local output="$1"
    
    # Remove potential sensitive information
    output=$(echo "$output" | sed 's/password=[^[:space:]]*/password=****/g')
    output=$(echo "$output" | sed 's/token=[^[:space:]]*/token=****/g')
    output=$(echo "$output" | sed 's/key=[^[:space:]]*/key=****/g')
    
    echo "$output"
}
EOF
}
```

### UX Optimizations:

**User Experience Enhancement Framework:**
```bash
${COMMAND_NAME}_apply_ux_optimizations() {
    local iteration="$1"
    
    echo "Applying UX optimizations..."
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local ux_optimizations=()
    
    # Optimization 1: Enhanced Help System
    if [[ $JUDGE2_TOTAL_SCORE -lt 75 ]]; then
        ${COMMAND_NAME}_enhance_help_system "$command_path"
        ux_optimizations+=("Enhanced help system")
    fi
    
    # Optimization 2: Better Error Messages
    ${COMMAND_NAME}_improve_error_messages "$command_path"
    ux_optimizations+=("Improved error messages")
    
    # Optimization 3: Progress Feedback
    ${COMMAND_NAME}_add_progress_feedback "$command_path"
    ux_optimizations+=("Added progress feedback")
    
    # Optimization 4: Output Formatting
    ${COMMAND_NAME}_enhance_output_formatting "$command_path"
    ux_optimizations+=("Enhanced output formatting")
    
    echo "UX optimizations applied:"
    printf '  - %s\n' "${ux_optimizations[@]}"
    
    export "UX_OPTIMIZATIONS_$iteration"="$(IFS=';'; echo "${ux_optimizations[*]}")"
}

${COMMAND_NAME}_enhance_help_system() {
    local command_path="$1"
    
    echo "Enhancing help system..."
    
    # Create comprehensive help documentation
    cat > "$command_path/help.md" << EOF
# $COMMAND_NAME Help

## Description
$COMMAND_DESCRIPTION

## Usage
\`\`\`bash
$COMMAND_NAME [options] [arguments]
\`\`\`

## Options
- \`--help, -h\`: Show this help message
- \`--verbose, -v\`: Enable verbose output
- \`--dry-run\`: Show what would be done without executing
- \`--format FORMAT\`: Output format (text, json, yaml)
- \`--config FILE\`: Use custom configuration file

## Examples

### Basic Usage
\`\`\`bash
$COMMAND_NAME input.txt
\`\`\`

### Advanced Usage
\`\`\`bash
$COMMAND_NAME --verbose --format json input.txt output.json
\`\`\`

### With Configuration
\`\`\`bash
$COMMAND_NAME --config custom.yaml --dry-run input.txt
\`\`\`

## Troubleshooting
- If you encounter permission errors, check file permissions
- For performance issues, try using --verbose to see timing information
- Configuration problems can be debugged with --dry-run

For more help, visit: https://docs.example.com/$COMMAND_NAME
EOF

    # Add inline help function
    cat >> "$command_path/implementation.sh" << 'EOF'

${COMMAND_NAME}_show_help() {
    cat << 'HELP_EOF'
Usage: ${COMMAND_NAME} [options] [arguments]

Description:
  A well-optimized command following Claude Code Builder patterns.

Options:
  --help, -h          Show this help message
  --verbose, -v       Enable verbose output
  --dry-run          Show what would be done without executing
  --format FORMAT    Output format (text, json, yaml)
  --config FILE      Use custom configuration file

Examples:
  ${COMMAND_NAME} input.txt
  ${COMMAND_NAME} --verbose --format json input.txt
  ${COMMAND_NAME} --config custom.yaml --dry-run input.txt

For more information, see the full documentation at:
  .claude/commands/${COMMAND_NAME}/help.md
HELP_EOF
}
EOF
}

${COMMAND_NAME}_improve_error_messages() {
    local command_path="$1"
    
    echo "Improving error messages..."
    
    cat >> "$command_path/implementation.sh" << 'EOF'

${COMMAND_NAME}_user_friendly_error() {
    local error_type="$1"
    local error_details="$2"
    
    case "$error_type" in
        "file_not_found")
            log_error "File not found: $error_details"
            log_error "💡 Tip: Check the file path and ensure the file exists"
            log_error "🔍 You can list files with: ls -la"
            ;;
        "permission_denied")
            log_error "Permission denied: $error_details"
            log_error "💡 Tip: You may need to change file permissions"
            log_error "🔧 Try: chmod +r $error_details"
            ;;
        "invalid_argument")
            log_error "Invalid argument: $error_details"
            log_error "💡 Tip: Run with --help to see valid options"
            log_error "📖 Usage: ${COMMAND_NAME} --help"
            ;;
        "dependency_missing")
            log_error "Missing dependency: $error_details"
            log_error "💡 Tip: Install the required dependency"
            log_error "📦 Try: which $error_details"
            ;;
        *)
            log_error "Error: $error_details"
            log_error "💡 For help, run: ${COMMAND_NAME} --help"
            ;;
    esac
}
EOF
}
```

### Standards Optimizations:

**Standards Compliance Enhancement:**
```bash
${COMMAND_NAME}_apply_standards_optimizations() {
    local iteration="$1"
    
    echo "Applying standards optimizations..."
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local standards_optimizations=()
    
    # Optimization 1: Pattern Compliance
    ${COMMAND_NAME}_ensure_pattern_compliance "$command_path"
    standards_optimizations+=("Pattern compliance")
    
    # Optimization 2: Naming Conventions
    ${COMMAND_NAME}_fix_naming_conventions "$command_path"
    standards_optimizations+=("Naming conventions")
    
    # Optimization 3: Documentation Standards
    ${COMMAND_NAME}_standardize_documentation "$command_path"
    standards_optimizations+=("Documentation standards")
    
    # Optimization 4: Code Structure
    ${COMMAND_NAME}_improve_code_structure "$command_path"
    standards_optimizations+=("Code structure")
    
    echo "Standards optimizations applied:"
    printf '  - %s\n' "${standards_optimizations[@]}"
    
    export "STANDARDS_OPTIMIZATIONS_$iteration"="$(IFS=';'; echo "${standards_optimizations[*]}")"
}

${COMMAND_NAME}_ensure_pattern_compliance() {
    local command_path="$1"
    
    echo "Ensuring pattern compliance..."
    
    # Ensure error handling pattern is properly integrated
    if ! grep -q "source.*error-handling" "$command_path"/*.sh 2>/dev/null; then
        sed -i '1a\\nsource ./patterns/error-handling/simple-error-handling.sh' "$command_path"/implementation.sh
    fi
    
    # Ensure consistent function naming
    sed -i 's/function \([a-zA-Z_][a-zA-Z0-9_]*\)/\1()/g' "$command_path"/*.sh 2>/dev/null || true
    
    # Add proper bash settings
    if ! grep -q "set -euo pipefail" "$command_path"/*.sh 2>/dev/null; then
        sed -i '2i\\nset -euo pipefail' "$command_path"/implementation.sh
    fi
}
```

## Step 4: Optimization Validation & Re-evaluation

### Post-Optimization Testing:

**Validation Framework:**
```bash
${COMMAND_NAME}_validate_optimization() {
    local iteration="$1"
    
    echo "=== Validating Optimization Iteration $iteration ==="
    
    local validation_results=()
    
    # Test 1: Basic functionality still works
    if ${COMMAND_NAME}_test_basic_functionality; then
        validation_results+=("✅ Basic functionality preserved")
    else
        validation_results+=("❌ Basic functionality broken")
        return 1
    fi
    
    # Test 2: Performance hasn't degraded
    if ${COMMAND_NAME}_test_performance_regression; then
        validation_results+=("✅ No performance regression")
    else
        validation_results+=("⚠️ Performance regression detected")
    fi
    
    # Test 3: New features work correctly
    if ${COMMAND_NAME}_test_new_optimizations; then
        validation_results+=("✅ New optimizations working")
    else
        validation_results+=("❌ New optimizations have issues")
        return 1
    fi
    
    # Test 4: Pattern integration still intact
    if ${COMMAND_NAME}_test_pattern_integration; then
        validation_results+=("✅ Pattern integration intact")
    else
        validation_results+=("❌ Pattern integration broken")
        return 1
    fi
    
    echo "Optimization Validation Results:"
    printf '%s\n' "${validation_results[@]}"
    
    local passed=$(printf '%s\n' "${validation_results[@]}" | grep -c "✅")
    local total=${#validation_results[@]}
    local pass_rate=$((passed * 100 / total))
    
    echo "Validation Pass Rate: $pass_rate% ($passed/$total)"
    
    if [[ $pass_rate -ge 75 ]]; then
        echo "✅ Optimization validation PASSED"
        return 0
    else
        echo "❌ Optimization validation FAILED"
        return 1
    fi
}

${COMMAND_NAME}_re_evaluate_after_optimization() {
    local iteration="$1"
    
    echo "Re-evaluating command after optimization iteration $iteration..."
    
    # Quick re-evaluation using simplified judge criteria
    local new_technical_score
    new_technical_score=$(${COMMAND_NAME}_quick_technical_assessment)
    
    local new_ux_score
    new_ux_score=$(${COMMAND_NAME}_quick_ux_assessment)
    
    local new_standards_score
    new_standards_score=$(${COMMAND_NAME}_quick_standards_assessment)
    
    # Calculate new consensus score
    local new_consensus_score
    new_consensus_score=$(((new_technical_score * 40 + new_ux_score * 35 + new_standards_score * 25) / 100))
    
    echo "=== Post-Optimization Scores ==="
    echo "Technical: $new_technical_score/100 (was $JUDGE1_TOTAL_SCORE/100)"
    echo "UX: $new_ux_score/100 (was $JUDGE2_TOTAL_SCORE/100)"
    echo "Standards: $new_standards_score/100 (was $JUDGE3_TOTAL_SCORE/100)"
    echo "Consensus: $new_consensus_score/100 (was $CONSENSUS_SCORE/100)"
    
    # Calculate improvements
    local technical_improvement=$((new_technical_score - JUDGE1_TOTAL_SCORE))
    local ux_improvement=$((new_ux_score - JUDGE2_TOTAL_SCORE))
    local standards_improvement=$((new_standards_score - JUDGE3_TOTAL_SCORE))
    local consensus_improvement=$((new_consensus_score - CONSENSUS_SCORE))
    
    echo "=== Improvements ==="
    echo "Technical: +$technical_improvement points"
    echo "UX: +$ux_improvement points"
    echo "Standards: +$standards_improvement points"
    echo "Consensus: +$consensus_improvement points"
    
    # Update scores for next iteration
    export "JUDGE1_TOTAL_SCORE_ITER_$iteration"="$new_technical_score"
    export "JUDGE2_TOTAL_SCORE_ITER_$iteration"="$new_ux_score"
    export "JUDGE3_TOTAL_SCORE_ITER_$iteration"="$new_standards_score"
    export "CONSENSUS_SCORE_ITER_$iteration"="$new_consensus_score"
    
    # Check if target achieved
    if [[ $new_consensus_score -ge $TARGET_CONSENSUS_SCORE ]]; then
        echo "🎯 TARGET ACHIEVED: Optimization complete"
        export OPTIMIZATION_TARGET_ACHIEVED="true"
        return 0
    else
        local remaining_gap=$((TARGET_CONSENSUS_SCORE - new_consensus_score))
        echo "🎯 Target not yet achieved. Remaining gap: $remaining_gap points"
        export OPTIMIZATION_TARGET_ACHIEVED="false"
        export "REMAINING_GAP_ITER_$iteration"="$remaining_gap"
        return 1
    fi
}
```

## Step 5: Iterative Optimization Control

### Multi-Iteration Management:

**Optimization Loop Controller:**
```bash
${COMMAND_NAME}_run_optimization_iterations() {
    local max_iterations="${MAX_OPTIMIZATION_ITERATIONS:-3}"
    local target_score="${TARGET_CONSENSUS_SCORE:-85}"
    local current_score="$CONSENSUS_SCORE"
    
    echo "Starting optimization iterations..."
    echo "Max iterations: $max_iterations"
    echo "Target score: $target_score"
    echo "Starting score: $current_score"
    
    local iteration=1
    local optimization_successful=false
    
    while [[ $iteration -le $max_iterations ]]; do
        echo ""
        echo "=== OPTIMIZATION ITERATION $iteration/$max_iterations ==="
        
        # Execute optimization for this iteration
        execute_command_optimization "$iteration" "$current_score" "$target_score"
        
        # Apply optimizations
        ${COMMAND_NAME}_apply_technical_optimizations "$iteration"
        ${COMMAND_NAME}_apply_ux_optimizations "$iteration"
        ${COMMAND_NAME}_apply_standards_optimizations "$iteration"
        
        # Validate optimizations
        if ! ${COMMAND_NAME}_validate_optimization "$iteration"; then
            log_error "Optimization validation failed for iteration $iteration"
            break
        fi
        
        # Re-evaluate
        if ${COMMAND_NAME}_re_evaluate_after_optimization "$iteration"; then
            echo "🎉 Optimization target achieved in iteration $iteration"
            optimization_successful=true
            break
        fi
        
        # Update current score for next iteration
        current_score=$(eval echo \$CONSENSUS_SCORE_ITER_$iteration)
        
        # Check for improvement
        local improvement=$((current_score - CONSENSUS_SCORE))
        if [[ $improvement -lt 2 ]]; then
            log_warn "Minimal improvement (+$improvement) in iteration $iteration"
            log_warn "Consider different optimization strategy"
        fi
        
        ((iteration++))
    done
    
    # Final optimization summary
    ${COMMAND_NAME}_generate_optimization_summary "$iteration" "$optimization_successful"
    
    return $((optimization_successful ? 0 : 1))
}

${COMMAND_NAME}_generate_optimization_summary() {
    local completed_iterations="$1"
    local successful="$2"
    
    echo ""
    echo "=== OPTIMIZATION SUMMARY ==="
    echo "Completed Iterations: $completed_iterations"
    echo "Target Achieved: $(if [[ "$successful" == "true" ]]; then echo "✅ YES"; else echo "❌ NO"; fi)"
    
    # Score progression
    echo ""
    echo "Score Progression:"
    echo "Initial: $CONSENSUS_SCORE/100"
    
    for ((i=1; i<completed_iterations; i++)); do
        local iter_score_var="CONSENSUS_SCORE_ITER_$i"
        local iter_score=$(eval echo \$$iter_score_var)
        local improvement=$((iter_score - CONSENSUS_SCORE))
        echo "Iteration $i: $iter_score/100 (+$improvement)"
    done
    
    # Final recommendation
    if [[ "$successful" == "true" ]]; then
        echo ""
        echo "🏆 OPTIMIZATION SUCCESSFUL"
        echo "✅ Command ready for RAG enhancement phase"
        export OPTIMIZATION_STATUS="successful"
        export READY_FOR_ENHANCEMENT="true"
    else
        echo ""
        echo "⚠️ OPTIMIZATION INCOMPLETE"
        echo "🔄 Consider manual review or alternative optimization strategies"
        export OPTIMIZATION_STATUS="incomplete"
        export READY_FOR_ENHANCEMENT="false"
    fi
}
```

## Command Optimization Complete

### Optimization Summary:
- ✅ **Optimization Strategy**: $SELECTED_OPTIMIZATION_STRATEGY applied
- ✅ **Iterations Completed**: $COMPLETED_ITERATIONS/$MAX_OPTIMIZATION_ITERATIONS
- ✅ **Target Achievement**: $OPTIMIZATION_TARGET_ACHIEVED
- ✅ **Final Consensus Score**: $FINAL_CONSENSUS_SCORE/100 (was $CONSENSUS_SCORE/100)
- ✅ **Improvement**: +$TOTAL_IMPROVEMENT points
- ✅ **Status**: $OPTIMIZATION_STATUS

### Optimization Results:
```yaml
optimization_results:
  strategy: $SELECTED_OPTIMIZATION_STRATEGY
  iterations_completed: $COMPLETED_ITERATIONS
  target_achieved: $OPTIMIZATION_TARGET_ACHIEVED
  
  score_progression:
    initial: $CONSENSUS_SCORE/100
    final: $FINAL_CONSENSUS_SCORE/100
    improvement: +$TOTAL_IMPROVEMENT
    
  optimizations_applied:
    technical: $TECHNICAL_OPTIMIZATIONS_APPLIED
    ux: $UX_OPTIMIZATIONS_APPLIED
    standards: $STANDARDS_OPTIMIZATIONS_APPLIED
    
  ready_for_enhancement: $READY_FOR_ENHANCEMENT
```

### Next Phase:

**Continue to:** `/command-builder/09-enhance` for RAG enhancement integration.

Your command has been optimized and is ready for knowledge enhancement.

**Ready to proceed to enhancement phase?** (y/n) > [WAIT FOR CONFIRMATION]