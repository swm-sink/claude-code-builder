---
allowed-tools: Read, Write, Bash(source:*), WebSearch
description: Meta-prompt optimization using self-improvement loops
argument-hint: [agent-path] [--optimization-target technical|ux|standards] [--iterations 3]
category: agent-builder
version: 1.0.0
---

# 🔄 META-PROMPT OPTIMIZATION

Self-improvement optimization using meta-prompting techniques based on 2024 research findings.

## Meta-Prompt Optimization Framework

### Research Foundation:
- **Finding**: Meta-prompting uses higher intelligence to optimize prompts for better outcomes
- **Method**: Self-improvement loops with structured validation
- **Goal**: Iterative enhancement with measurable improvements

### Optimization Target:
```yaml
$JUDGE_EVALUATION_RESULTS_FROM_PREVIOUS_STEP
```

### Identified Areas for Optimization:
- **Technical Issues**: $TECHNICAL_ISSUES_COUNT
- **UX Issues**: $UX_ISSUES_COUNT  
- **Standards Issues**: $STANDARDS_ISSUES_COUNT

## Step 1: Optimization Strategy Selection

### Current Performance Analysis:
| Area | Current Score | Target Score | Gap | Priority |
|------|---------------|--------------|-----|----------|
| Technical | $JUDGE1_TOTAL/50 | 45/50 | $TECH_GAP | $TECH_PRIORITY |
| UX | $JUDGE2_TOTAL/50 | 45/50 | $UX_GAP | $UX_PRIORITY |
| Standards | $JUDGE3_TOTAL/50 | 45/50 | $STD_GAP | $STD_PRIORITY |

### Optimization Strategy:
**Primary Focus**: $PRIMARY_FOCUS (largest gap)
**Secondary Focus**: $SECONDARY_FOCUS (second largest gap)
**Iterations Planned**: 3 (research-recommended minimum)

### Optimization Approach Selection:
1. **Focused**: Address specific highest-impact issues
2. **Holistic**: Comprehensive improvements across all areas
3. **Iterative**: Step-by-step improvements with validation

**Selected Approach**: > [WAIT FOR USER INPUT]

## Step 2: Meta-Prompt Generation for Optimization

### Optimization Meta-Prompt:

```markdown
You are an expert agent optimization specialist with deep knowledge of:
- Bash scripting best practices (2024 standards)
- Claude Code Builder patterns and architecture
- User experience design for technical tools
- Security and compliance requirements
- Performance optimization techniques

Current Agent Assessment:
$CURRENT_AGENT_ASSESSMENT

Optimization Objective:
Improve the agent to achieve:
- Technical Score: 45/50 (currently $JUDGE1_TOTAL/50)
- UX Score: 45/50 (currently $JUDGE2_TOTAL/50)  
- Standards Score: 45/50 (currently $JUDGE3_TOTAL/50)

Specific Issues to Address:
$PRIORITIZED_ISSUES_LIST

Constraints:
- Maintain compatibility with existing patterns
- Preserve current functionality
- Follow Claude Code Builder principles
- Stay within performance targets
- Implement 2024 security best practices

Optimization Instructions:
1. Analyze the current implementation thoroughly
2. Identify specific improvement opportunities
3. Propose targeted changes with justification
4. Ensure changes address root causes, not symptoms
5. Validate that improvements don't introduce new issues

Generate optimized implementation that addresses the identified issues while maintaining all current functionality.
```

### Meta-Prompt Application:

**Iteration 1: High-Impact Optimizations**

**Current Implementation Analysis:**
```bash
# Read current agent implementation
current_impl=$(cat .claude/agents/$AGENT_NAME/agent.md)

# Analyze issue patterns
echo "Current implementation issues:"
echo "- $ISSUE_1"
echo "- $ISSUE_2"
echo "- $ISSUE_3"
```

**Optimization Focus Areas:**
1. **$OPTIMIZATION_AREA_1**: $OPTIMIZATION_DESCRIPTION_1
2. **$OPTIMIZATION_AREA_2**: $OPTIMIZATION_DESCRIPTION_2
3. **$OPTIMIZATION_AREA_3**: $OPTIMIZATION_DESCRIPTION_3

**Generated Optimizations:**

**Optimization 1: $OPT1_TITLE**
```bash
# Before (problematic code)
$BEFORE_CODE_1

# After (optimized code)
$AFTER_CODE_1

# Improvement: $OPT1_IMPROVEMENT
```

**Optimization 2: $OPT2_TITLE**
```bash
# Before
$BEFORE_CODE_2

# After  
$AFTER_CODE_2

# Improvement: $OPT2_IMPROVEMENT
```

**Optimization 3: $OPT3_TITLE**
```bash
# Before
$BEFORE_CODE_3

# After
$AFTER_CODE_3

# Improvement: $OPT3_IMPROVEMENT
```

## Step 3: Optimization Implementation & Testing

### Implementation Process:

**Create Optimized Version:**
```bash
# Backup current version
cp .claude/agents/$AGENT_NAME/agent.md .claude/agents/$AGENT_NAME/agent.md.backup

# Apply optimizations
cat > .claude/agents/$AGENT_NAME/agent.md << 'EOF'
$OPTIMIZED_AGENT_IMPLEMENTATION
EOF
```

**Validation Testing:**
```bash
# Test optimized version
source .claude/agents/$AGENT_NAME/agent.md

# Basic functionality test
${AGENT_NAME}_main --help
basic_test_result=$?

# Performance test
start_time=$(date +%s%N)
${AGENT_NAME}_main $TEST_ARGS
end_time=$(date +%s%N)
performance_time=$((($end_time - $start_time) / 1000000))

# Memory test
memory_before=$(ps -o rss= -p $$)
${AGENT_NAME}_main $TEST_ARGS
memory_after=$(ps -o rss= -p $$)
memory_usage=$((memory_after - memory_before))
```

### Optimization Results (Iteration 1):

**Performance Metrics:**
| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Response Time | $BEFORE_TIME ms | $AFTER_TIME ms | $TIME_IMPROVEMENT |
| Memory Usage | $BEFORE_MEMORY KB | $AFTER_MEMORY KB | $MEMORY_IMPROVEMENT |
| Function Count | $BEFORE_FUNCTIONS | $AFTER_FUNCTIONS | $FUNCTION_IMPROVEMENT |

**Functionality Validation:**
- Basic Test: $BASIC_TEST_RESULT ✅/❌
- Performance Test: $PERF_TEST_RESULT ✅/❌
- Compatibility Test: $COMPAT_TEST_RESULT ✅/❌

## Step 4: Re-Evaluation After Optimization

### Mini-Judge Re-Assessment:

**Technical Improvements:**
- Issue "$TECH_ISSUE_1": $TECH_FIX_STATUS
- Issue "$TECH_ISSUE_2": $TECH_FIX_STATUS
- Issue "$TECH_ISSUE_3": $TECH_FIX_STATUS

**Estimated New Technical Score**: $NEW_TECH_SCORE/50 (was $JUDGE1_TOTAL/50)

**UX Improvements:**
- Issue "$UX_ISSUE_1": $UX_FIX_STATUS
- Issue "$UX_ISSUE_2": $UX_FIX_STATUS
- Issue "$UX_ISSUE_3": $UX_FIX_STATUS

**Estimated New UX Score**: $NEW_UX_SCORE/50 (was $JUDGE2_TOTAL/50)

**Standards Improvements:**
- Issue "$STD_ISSUE_1": $STD_FIX_STATUS
- Issue "$STD_ISSUE_2": $STD_FIX_STATUS
- Issue "$STD_ISSUE_3": $STD_FIX_STATUS

**Estimated New Standards Score**: $NEW_STD_SCORE/50 (was $JUDGE3_TOTAL/50)

### Optimization Progress:
**Consensus Score**: $NEW_CONSENSUS_SCORE/50 (was $CONSENSUS_SCORE/50)
**Improvement**: +$SCORE_IMPROVEMENT points ($IMPROVEMENT_PERCENTAGE% improvement)

## Step 5: Iterative Optimization (If Needed)

### Optimization Decision Gate:
**Target Achievement Check:**
- Consensus Score ≥ 45/50: $TARGET_ACHIEVED ✅/❌
- All individual scores ≥ 40/50: $INDIVIDUAL_TARGETS ✅/❌
- Critical issues = 0: $CRITICAL_RESOLVED ✅/❌

### Continue Optimization?
**If targets not met, continue with Iteration 2:**

**Iteration 2 Focus Areas:**
- $ITERATION2_FOCUS_1
- $ITERATION2_FOCUS_2
- $ITERATION2_FOCUS_3

**Iteration 2 Meta-Prompt:**
```markdown
Based on Iteration 1 results, further optimize the agent:

Previous Improvements Made:
$ITERATION1_IMPROVEMENTS

Remaining Issues:
$REMAINING_ISSUES

New Optimization Target:
$ITERATION2_TARGETS

Focus on addressing root causes and edge cases not covered in Iteration 1.
```

**Continue optimization?** (y/n) > [WAIT FOR INPUT IF TARGETS NOT MET]

## Step 6: Optimization Completion

### Final Optimization Results:

**Total Iterations Completed**: $COMPLETED_ITERATIONS
**Final Scores**:
| Judge | Before | After | Improvement |
|-------|--------|-------|-------------|
| Technical | $ORIGINAL_TECH/50 | $FINAL_TECH/50 | +$TECH_DELTA |
| UX | $ORIGINAL_UX/50 | $FINAL_UX/50 | +$UX_DELTA |
| Standards | $ORIGINAL_STD/50 | $FINAL_STD/50 | +$STD_DELTA |

**Final Consensus Score**: $FINAL_CONSENSUS/50 ($FINAL_PERCENTAGE%)

### Optimization Summary:
**Key Improvements Made:**
1. $KEY_IMPROVEMENT_1
2. $KEY_IMPROVEMENT_2  
3. $KEY_IMPROVEMENT_3

**Performance Gains:**
- Response Time: $TOTAL_TIME_IMPROVEMENT
- Memory Usage: $TOTAL_MEMORY_IMPROVEMENT
- Code Quality: $TOTAL_QUALITY_IMPROVEMENT

### Optimization Validation:
**Final Validation Tests:**
```bash
# Comprehensive testing of optimized agent
source .claude/agents/$AGENT_NAME/agent.md

# Multi-scenario testing
${AGENT_NAME}_main --help
${AGENT_NAME}_main $BASIC_ARGS
${AGENT_NAME}_main $ADVANCED_ARGS
${AGENT_NAME}_main $EDGE_CASE_ARGS

# Performance validation
${AGENT_NAME}_monitor_performance ${AGENT_NAME}_main $PERFORMANCE_TEST_ARGS
```

**All Tests Passed**: $ALL_TESTS_PASSED ✅/❌

### Quality Gates Assessment:
- **Minimum Viability**: ✅ Passed (Score ≥ 30/50)
- **Production Ready**: $PRODUCTION_GATE ✅/❌ (Score ≥ 40/50)  
- **Excellence Standard**: $EXCELLENCE_GATE ✅/❌ (Score ≥ 45/50)

## Optimization Complete

### Meta-Prompt Optimization Results:
- **Optimization Approach**: $SELECTED_APPROACH
- **Iterations Required**: $COMPLETED_ITERATIONS
- **Total Improvement**: +$TOTAL_IMPROVEMENT points
- **Final Quality Level**: $FINAL_QUALITY_LEVEL

### Agent Status:
**Ready for**: $NEXT_PHASE_RECOMMENDATION

## Next Phase

Meta-prompt optimization completed with measurable improvements.

**Continue to: /agent-builder/10-rag-enhance** for knowledge augmentation or **Continue to: /agent-builder/11-finalize** if optimization targets achieved.