---
allowed-tools: Read, Write, Bash(source:*), Bash(git status:*), WebSearch
description: Command composition and integration testing with ecosystem validation
argument-hint: [compose-config] [--test-integration] [--validate-ecosystem]
category: command-builder
version: 1.0.0
---

# 🔗 COMMAND COMPOSITION & INTEGRATION

Test command integration with Claude Code Builder ecosystem and external systems.

## Composition Framework

### Logic Implementation Status:
```yaml
$LOGIC_IMPLEMENTATION_FROM_PREVIOUS_STEP
```

### Research Foundation Applied:
- ✅ Claude Code Builder integration patterns
- ✅ Command composition best practices
- ✅ Ecosystem compatibility standards
- ✅ Interoperability testing methods

## Step 1: Integration Architecture Analysis

### Integration Points Identification:

**Claude Code Builder Ecosystem Integration:**

1. **Pattern Integration** - How command uses existing patterns
   - Error handling patterns
   - Testing patterns
   - Security patterns
   - Quality gate patterns

2. **Command Integration** - How command works with other commands
   - Command chaining capabilities
   - Input/output compatibility
   - State sharing mechanisms

3. **Agent Integration** - How command works with agents
   - Agent orchestration support
   - Shared context handling
   - Event-driven integration

4. **Tool Integration** - How command works with external tools
   - CLI tool integration
   - API integration
   - File format compatibility

**Integration Assessment Matrix:**
| Integration Type | Current Status | Test Required | Priority |
|-----------------|----------------|---------------|----------|
| Pattern Integration | $PATTERN_STATUS | $PATTERN_TEST | High |
| Command Integration | $COMMAND_STATUS | $COMMAND_TEST | High |
| Agent Integration | $AGENT_STATUS | $AGENT_TEST | Medium |
| Tool Integration | $TOOL_STATUS | $TOOL_TEST | Medium |
| Ecosystem Integration | $ECOSYSTEM_STATUS | $ECOSYSTEM_TEST | High |

### Composition Strategy Selection:

**Strategy Options:**

1. **Standalone Composition** - Independent operation
   - Best for: Utility commands, self-contained tools
   - Pattern: Command operates independently
   - Testing: Isolated functionality testing

2. **Pipeline Composition** - Sequential command chaining
   - Best for: Data processing, transformation commands
   - Pattern: Command A | Command B | Command C
   - Testing: Pipeline integration testing

3. **Orchestrated Composition** - Agent-managed coordination
   - Best for: Complex workflows, multi-step operations
   - Pattern: Agent orchestrates command execution
   - Testing: Orchestration scenario testing

4. **Event-Driven Composition** - Reactive integration
   - Best for: Monitoring, automation commands
   - Pattern: Event triggers command execution
   - Testing: Event-response testing

5. **Hybrid Composition** - Multiple integration patterns
   - Best for: Complex commands with multiple use cases
   - Pattern: Supports multiple composition modes
   - Testing: Multi-modal testing

**Recommended Composition**: $RECOMMENDED_COMPOSITION for "$COMMAND_NAME"

**Select composition strategy (1-5):** > [WAIT FOR INPUT]

## Step 2: Pattern Integration Testing

### Claude Code Builder Pattern Integration:

**Pattern Integration Validation:**
```bash
${COMMAND_NAME}_test_pattern_integration() {
    echo "Testing pattern integration..."
    local integration_results=()
    
    # Test 1: Error Handling Pattern
    echo "Testing error handling pattern integration..."
    source ./patterns/error-handling/simple-error-handling.sh
    
    if ${COMMAND_NAME}_test_error_integration; then
        integration_results+=("✅ Error handling pattern")
    else
        integration_results+=("❌ Error handling pattern")
    fi
    
    # Test 2: Testing Pattern
    echo "Testing testing pattern integration..."
    source ./patterns/testing/simple-test-runner.sh
    
    if ${COMMAND_NAME}_test_testing_integration; then
        integration_results+=("✅ Testing pattern")
    else
        integration_results+=("❌ Testing pattern")
    fi
    
    # Test 3: Security Pattern
    echo "Testing security pattern integration..."
    source ./patterns/security/security-basics.sh
    
    if ${COMMAND_NAME}_test_security_integration; then
        integration_results+=("✅ Security pattern")
    else
        integration_results+=("❌ Security pattern")
    fi
    
    # Test 4: Quality Gates Pattern
    echo "Testing quality gates pattern integration..."
    source ./patterns/quality-gates/quality-check.sh
    
    if ${COMMAND_NAME}_test_quality_integration; then
        integration_results+=("✅ Quality gates pattern")
    else
        integration_results+=("❌ Quality gates pattern")
    fi
    
    # Report results
    echo "=== PATTERN INTEGRATION RESULTS ==="
    printf '%s\n' "${integration_results[@]}"
    
    # Calculate success rate
    local passed=$(printf '%s\n' "${integration_results[@]}" | grep -c "✅")
    local total=${#integration_results[@]}
    local success_rate=$((passed * 100 / total))
    
    echo "Pattern Integration Success Rate: $success_rate% ($passed/$total)"
    
    if [[ $success_rate -ge 75 ]]; then
        echo "✅ Pattern integration PASSED"
        return 0
    else
        echo "❌ Pattern integration FAILED"
        return 1
    fi
}

# Individual pattern integration tests
${COMMAND_NAME}_test_error_integration() {
    # Test that command properly uses error handling functions
    log_info "Testing error handling integration"
    
    # Test log functions are available
    if ! declare -f log_info log_warn log_error >/dev/null 2>&1; then
        return 1
    fi
    
    # Test error handling function is available
    if ! declare -f handle_error >/dev/null 2>&1; then
        return 1
    fi
    
    # Test command uses error handling
    if ! ${COMMAND_NAME}_main --invalid-arg 2>&1 | grep -q "ERROR"; then
        return 1
    fi
    
    return 0
}

${COMMAND_NAME}_test_testing_integration() {
    # Test that command works with testing pattern
    log_info "Testing testing pattern integration"
    
    # Test that run_all_tests function is available
    if ! declare -f run_all_tests >/dev/null 2>&1; then
        return 1
    fi
    
    # Test command can be tested
    if ! ${COMMAND_NAME}_run_self_tests; then
        return 1
    fi
    
    return 0
}

${COMMAND_NAME}_test_security_integration() {
    # Test that command implements security measures
    log_info "Testing security pattern integration"
    
    # Test basic security scan function is available
    if ! declare -f basic_security_scan >/dev/null 2>&1; then
        return 1
    fi
    
    # Test command passes basic security scan
    if ! basic_security_scan ".claude/commands/$COMMAND_NAME/"; then
        return 1
    fi
    
    return 0
}
```

## Step 3: Command Ecosystem Integration

### Command Chaining and Compatibility:

**Command Compatibility Testing:**
```bash
${COMMAND_NAME}_test_command_ecosystem() {
    echo "Testing command ecosystem integration..."
    local ecosystem_results=()
    
    # Test 1: Command Chaining
    echo "Testing command chaining capabilities..."
    if ${COMMAND_NAME}_test_command_chaining; then
        ecosystem_results+=("✅ Command chaining")
    else
        ecosystem_results+=("❌ Command chaining")
    fi
    
    # Test 2: Input/Output Compatibility
    echo "Testing I/O compatibility..."
    if ${COMMAND_NAME}_test_io_compatibility; then
        ecosystem_results+=("✅ I/O compatibility")
    else
        ecosystem_results+=("❌ I/O compatibility")
    fi
    
    # Test 3: Configuration Compatibility
    echo "Testing configuration compatibility..."
    if ${COMMAND_NAME}_test_config_compatibility; then
        ecosystem_results+=("✅ Configuration compatibility")
    else
        ecosystem_results+=("❌ Configuration compatibility")
    fi
    
    # Test 4: Environment Compatibility
    echo "Testing environment compatibility..."
    if ${COMMAND_NAME}_test_env_compatibility; then
        ecosystem_results+=("✅ Environment compatibility")
    else
        ecosystem_results+=("❌ Environment compatibility")
    fi
    
    # Report results
    echo "=== ECOSYSTEM INTEGRATION RESULTS ==="
    printf '%s\n' "${ecosystem_results[@]}"
    
    # Calculate success rate
    local passed=$(printf '%s\n' "${ecosystem_results[@]}" | grep -c "✅")
    local total=${#ecosystem_results[@]}
    local success_rate=$((passed * 100 / total))
    
    echo "Ecosystem Integration Success Rate: $success_rate% ($passed/$total)"
    
    return $((success_rate >= 75 ? 0 : 1))
}

${COMMAND_NAME}_test_command_chaining() {
    # Test command can be used in pipelines
    log_info "Testing command chaining"
    
    # Test 1: Command accepts piped input
    if echo "test input" | ${COMMAND_NAME}_main --stdin >/dev/null 2>&1; then
        log_info "✅ Accepts piped input"
    else
        log_warn "❌ Does not accept piped input"
        return 1
    fi
    
    # Test 2: Command produces pipeable output
    if ${COMMAND_NAME}_main --test-output | wc -l >/dev/null 2>&1; then
        log_info "✅ Produces pipeable output"
    else
        log_warn "❌ Does not produce pipeable output"
        return 1
    fi
    
    # Test 3: Command supports standard exit codes
    ${COMMAND_NAME}_main --test-success >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        log_info "✅ Standard exit codes"
    else
        log_warn "❌ Non-standard exit codes"
        return 1
    fi
    
    return 0
}

${COMMAND_NAME}_test_io_compatibility() {
    # Test I/O format compatibility
    log_info "Testing I/O compatibility"
    
    # Test JSON input/output
    if echo '{"test": "data"}' | ${COMMAND_NAME}_main --format json | jq . >/dev/null 2>&1; then
        log_info "✅ JSON compatibility"
    else
        log_info "ℹ️ JSON not supported (optional)"
    fi
    
    # Test text input/output
    if echo "test data" | ${COMMAND_NAME}_main --format text >/dev/null 2>&1; then
        log_info "✅ Text compatibility"
    else
        log_warn "❌ Text compatibility failed"
        return 1
    fi
    
    return 0
}
```

## Step 4: Agent Integration Testing

### Agent Orchestration Compatibility:

**Agent Integration Validation:**
```bash
${COMMAND_NAME}_test_agent_integration() {
    echo "Testing agent integration capabilities..."
    local agent_results=()
    
    # Test 1: Agent Orchestration
    if ${COMMAND_NAME}_test_agent_orchestration; then
        agent_results+=("✅ Agent orchestration")
    else
        agent_results+=("❌ Agent orchestration")
    fi
    
    # Test 2: Shared Context
    if ${COMMAND_NAME}_test_shared_context; then
        agent_results+=("✅ Shared context")
    else
        agent_results+=("❌ Shared context")
    fi
    
    # Test 3: Event Integration
    if ${COMMAND_NAME}_test_event_integration; then
        agent_results+=("✅ Event integration")
    else
        agent_results+=("❌ Event integration")
    fi
    
    # Report results
    echo "=== AGENT INTEGRATION RESULTS ==="
    printf '%s\n' "${agent_results[@]}"
    
    local passed=$(printf '%s\n' "${agent_results[@]}" | grep -c "✅")
    local total=${#agent_results[@]}
    local success_rate=$((passed * 100 / total))
    
    echo "Agent Integration Success Rate: $success_rate% ($passed/$total)"
    
    return $((success_rate >= 60 ? 0 : 1)) # Lower threshold for agent integration
}

${COMMAND_NAME}_test_agent_orchestration() {
    # Test command can be orchestrated by agents
    log_info "Testing agent orchestration"
    
    # Create mock agent orchestration test
    cat > "/tmp/${COMMAND_NAME}_agent_test.sh" << 'EOF'
#!/bin/bash
# Mock agent orchestration test

# Agent context setup
export AGENT_CONTEXT="test_agent"
export AGENT_SESSION_ID="test_session_123"

# Test agent can call command
if ${COMMAND_NAME}_main --agent-mode; then
    echo "agent_orchestration_success"
else
    echo "agent_orchestration_failed"
fi
EOF
    
    chmod +x "/tmp/${COMMAND_NAME}_agent_test.sh"
    
    if bash "/tmp/${COMMAND_NAME}_agent_test.sh" | grep -q "agent_orchestration_success"; then
        rm -f "/tmp/${COMMAND_NAME}_agent_test.sh"
        return 0
    else
        rm -f "/tmp/${COMMAND_NAME}_agent_test.sh"
        return 1
    fi
}

${COMMAND_NAME}_test_shared_context() {
    # Test command can share context with agents
    log_info "Testing shared context"
    
    # Export test context
    export SHARED_CONTEXT_TEST="test_value"
    
    # Test command can access shared context
    if ${COMMAND_NAME}_main --test-context | grep -q "test_value"; then
        return 0
    else
        return 1
    fi
}
```

## Step 5: External Tool Integration

### Tool Ecosystem Compatibility:

**External Tool Integration Testing:**
```bash
${COMMAND_NAME}_test_external_integration() {
    echo "Testing external tool integration..."
    local tool_results=()
    
    # Test 1: Git Integration
    if ${COMMAND_NAME}_test_git_integration; then
        tool_results+=("✅ Git integration")
    else
        tool_results+=("❌ Git integration")
    fi
    
    # Test 2: CLI Tool Integration
    if ${COMMAND_NAME}_test_cli_integration; then
        tool_results+=("✅ CLI tool integration")
    else
        tool_results+=("❌ CLI tool integration")
    fi
    
    # Test 3: API Integration
    if ${COMMAND_NAME}_test_api_integration; then
        tool_results+=("✅ API integration")
    else
        tool_results+=("❌ API integration")
    fi
    
    # Test 4: File Format Integration
    if ${COMMAND_NAME}_test_format_integration; then
        tool_results+=("✅ File format integration")
    else
        tool_results+=("❌ File format integration")
    fi
    
    # Report results
    echo "=== EXTERNAL TOOL INTEGRATION RESULTS ==="
    printf '%s\n' "${tool_results[@]}"
    
    local passed=$(printf '%s\n' "${tool_results[@]}" | grep -c "✅")
    local total=${#tool_results[@]}
    local success_rate=$((passed * 100 / total))
    
    echo "External Tool Integration Success Rate: $success_rate% ($passed/$total)"
    
    return $((success_rate >= 50 ? 0 : 1)) # Lower threshold for external tools
}

${COMMAND_NAME}_test_git_integration() {
    # Test command works with git repositories
    log_info "Testing git integration"
    
    # Check if we're in a git repository
    if ! git status >/dev/null 2>&1; then
        log_info "ℹ️ Not in git repository, skipping git integration test"
        return 0
    fi
    
    # Test command can work with git status
    if ${COMMAND_NAME}_main --git-aware >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

${COMMAND_NAME}_test_cli_integration() {
    # Test command integrates with common CLI tools
    log_info "Testing CLI tool integration"
    
    local cli_tools=("grep" "awk" "sed" "jq" "curl")
    local working_tools=0
    
    for tool in "${cli_tools[@]}"; do
        if command -v "$tool" >/dev/null 2>&1; then
            if ${COMMAND_NAME}_test_tool_integration "$tool"; then
                ((working_tools++))
            fi
        fi
    done
    
    # At least 50% of available tools should work
    local available_tools=0
    for tool in "${cli_tools[@]}"; do
        if command -v "$tool" >/dev/null 2>&1; then
            ((available_tools++))
        fi
    done
    
    if [[ $available_tools -eq 0 ]]; then
        return 0 # No tools available to test
    fi
    
    local success_rate=$((working_tools * 100 / available_tools))
    return $((success_rate >= 50 ? 0 : 1))
}
```

## Step 6: Composition Performance Testing

### Performance Under Integration:

**Composition Performance Analysis:**
```bash
${COMMAND_NAME}_test_composition_performance() {
    echo "Testing composition performance..."
    local performance_results=()
    
    # Test 1: Standalone Performance
    local standalone_time
    standalone_time=$(${COMMAND_NAME}_measure_standalone_performance)
    
    if [[ $standalone_time -le $TARGET_STANDALONE_TIME ]]; then
        performance_results+=("✅ Standalone performance: ${standalone_time}ms")
    else
        performance_results+=("❌ Standalone performance: ${standalone_time}ms (target: ${TARGET_STANDALONE_TIME}ms)")
    fi
    
    # Test 2: Pipeline Performance
    local pipeline_time
    pipeline_time=$(${COMMAND_NAME}_measure_pipeline_performance)
    
    if [[ $pipeline_time -le $TARGET_PIPELINE_TIME ]]; then
        performance_results+=("✅ Pipeline performance: ${pipeline_time}ms")
    else
        performance_results+=("❌ Pipeline performance: ${pipeline_time}ms (target: ${TARGET_PIPELINE_TIME}ms)")
    fi
    
    # Test 3: Memory Usage
    local memory_usage
    memory_usage=$(${COMMAND_NAME}_measure_memory_usage)
    
    if [[ $memory_usage -le $TARGET_MEMORY_USAGE ]]; then
        performance_results+=("✅ Memory usage: ${memory_usage}KB")
    else
        performance_results+=("❌ Memory usage: ${memory_usage}KB (target: ${TARGET_MEMORY_USAGE}KB)")
    fi
    
    # Report results
    echo "=== COMPOSITION PERFORMANCE RESULTS ==="
    printf '%s\n' "${performance_results[@]}"
    
    local passed=$(printf '%s\n' "${performance_results[@]}" | grep -c "✅")
    local total=${#performance_results[@]}
    local success_rate=$((passed * 100 / total))
    
    echo "Performance Success Rate: $success_rate% ($passed/$total)"
    
    return $((success_rate >= 75 ? 0 : 1))
}

${COMMAND_NAME}_measure_standalone_performance() {
    local start_time=$(date +%s%N)
    ${COMMAND_NAME}_main $PERFORMANCE_TEST_ARGS >/dev/null 2>&1
    local end_time=$(date +%s%N)
    echo $(((end_time - start_time) / 1000000))
}

${COMMAND_NAME}_measure_pipeline_performance() {
    local start_time=$(date +%s%N)
    echo "test data" | ${COMMAND_NAME}_main --stdin | head -n 1 >/dev/null 2>&1
    local end_time=$(date +%s%N)
    echo $(((end_time - start_time) / 1000000))
}
```

## Step 7: Composition Quality Assessment

### Comprehensive Integration Quality:

**Integration Quality Matrix:**
```bash
${COMMAND_NAME}_assess_composition_quality() {
    echo "Assessing overall composition quality..."
    local quality_matrix=()
    local total_score=0
    
    # Pattern Integration (25 points)
    ${COMMAND_NAME}_test_pattern_integration
    local pattern_score=$((($? == 0) ? 25 : 0))
    quality_matrix+=("Pattern Integration: $pattern_score/25")
    total_score=$((total_score + pattern_score))
    
    # Ecosystem Integration (25 points)
    ${COMMAND_NAME}_test_command_ecosystem
    local ecosystem_score=$((($? == 0) ? 25 : 0))
    quality_matrix+=("Ecosystem Integration: $ecosystem_score/25")
    total_score=$((total_score + ecosystem_score))
    
    # Agent Integration (20 points)
    ${COMMAND_NAME}_test_agent_integration
    local agent_score=$((($? == 0) ? 20 : 0))
    quality_matrix+=("Agent Integration: $agent_score/20")
    total_score=$((total_score + agent_score))
    
    # External Tool Integration (15 points)
    ${COMMAND_NAME}_test_external_integration
    local external_score=$((($? == 0) ? 15 : 0))
    quality_matrix+=("External Tool Integration: $external_score/15")
    total_score=$((total_score + external_score))
    
    # Performance Integration (15 points)
    ${COMMAND_NAME}_test_composition_performance
    local performance_score=$((($? == 0) ? 15 : 0))
    quality_matrix+=("Performance Integration: $performance_score/15")
    total_score=$((total_score + performance_score))
    
    # Report quality matrix
    echo "=== COMPOSITION QUALITY MATRIX ==="
    printf '%s\n' "${quality_matrix[@]}"
    echo "Total Composition Score: $total_score/100"
    
    # Quality gates
    if [[ $total_score -ge 80 ]]; then
        echo "✅ EXCELLENT composition quality"
        export COMPOSITION_QUALITY_LEVEL="excellent"
    elif [[ $total_score -ge 65 ]]; then
        echo "✅ GOOD composition quality"
        export COMPOSITION_QUALITY_LEVEL="good"
    elif [[ $total_score -ge 50 ]]; then
        echo "⚠️ ACCEPTABLE composition quality"
        export COMPOSITION_QUALITY_LEVEL="acceptable"
    else
        echo "❌ POOR composition quality"
        export COMPOSITION_QUALITY_LEVEL="poor"
        return 1
    fi
    
    export COMPOSITION_QUALITY_SCORE="$total_score"
    return 0
}
```

### Integration Documentation:

**Generate Integration Report:**
```bash
${COMMAND_NAME}_generate_integration_report() {
    local report_file=".claude/commands/$COMMAND_NAME/integration_report.md"
    
    cat > "$report_file" << EOF
# $COMMAND_NAME Integration Report

Generated: $(date -Iseconds)

## Integration Summary

**Overall Quality Score**: $COMPOSITION_QUALITY_SCORE/100
**Quality Level**: $COMPOSITION_QUALITY_LEVEL

## Integration Test Results

### Pattern Integration
$PATTERN_INTEGRATION_RESULTS

### Ecosystem Integration
$ECOSYSTEM_INTEGRATION_RESULTS

### Agent Integration
$AGENT_INTEGRATION_RESULTS

### External Tool Integration
$EXTERNAL_TOOL_INTEGRATION_RESULTS

### Performance Integration
$PERFORMANCE_INTEGRATION_RESULTS

## Recommendations

$INTEGRATION_RECOMMENDATIONS

## Compatibility Matrix

| Integration Type | Status | Notes |
|-----------------|--------|-------|
| Error Handling Pattern | $ERROR_PATTERN_STATUS | $ERROR_PATTERN_NOTES |
| Testing Pattern | $TESTING_PATTERN_STATUS | $TESTING_PATTERN_NOTES |
| Security Pattern | $SECURITY_PATTERN_STATUS | $SECURITY_PATTERN_NOTES |
| Command Chaining | $CHAINING_STATUS | $CHAINING_NOTES |
| Agent Orchestration | $AGENT_STATUS | $AGENT_NOTES |
| Git Integration | $GIT_STATUS | $GIT_NOTES |

## Next Steps

$NEXT_STEPS_RECOMMENDATIONS
EOF

    echo "Integration report generated: $report_file"
}
```

## Composition Testing Complete

### Composition Summary:
- ✅ **Strategy Applied**: $SELECTED_COMPOSITION composition pattern
- ✅ **Pattern Integration**: $PATTERN_INTEGRATION_SCORE% success rate
- ✅ **Ecosystem Integration**: $ECOSYSTEM_INTEGRATION_SCORE% success rate
- ✅ **Agent Integration**: $AGENT_INTEGRATION_SCORE% success rate
- ✅ **External Tool Integration**: $EXTERNAL_INTEGRATION_SCORE% success rate
- ✅ **Performance Integration**: $PERFORMANCE_INTEGRATION_SCORE% success rate
- ✅ **Overall Quality**: $COMPOSITION_QUALITY_SCORE/100 ($COMPOSITION_QUALITY_LEVEL)

### Integration Configuration:
```yaml
composition_results:
  strategy: $SELECTED_COMPOSITION
  pattern_integration: $PATTERN_INTEGRATION_SCORE%
  ecosystem_integration: $ECOSYSTEM_INTEGRATION_SCORE%
  agent_integration: $AGENT_INTEGRATION_SCORE%
  external_integration: $EXTERNAL_INTEGRATION_SCORE%
  performance_integration: $PERFORMANCE_INTEGRATION_SCORE%
  overall_quality: $COMPOSITION_QUALITY_SCORE/100
  quality_level: $COMPOSITION_QUALITY_LEVEL
  ready_for_variants: true
```

### Next Phase:

**Continue to:** `/command-builder/06-variants` for multi-prompt variation testing.

Your command composition is validated and ready for multi-prompt testing.

**Ready to proceed to variants testing?** (y/n) > [WAIT FOR CONFIRMATION]