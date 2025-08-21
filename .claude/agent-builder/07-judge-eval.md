---
allowed-tools: Read, Bash(source:*), Bash(declare:*), WebSearch, Grep
description: Three-judge evaluation system with checklist-based assessment
argument-hint: [agent-path] [--strict] [--detailed-feedback]
category: agent-builder
version: 1.0.0
---

# ⚖️ THREE-JUDGE EVALUATION SYSTEM

Comprehensive agent evaluation using research-backed multi-judge validation with structured checklists.

## Judge Evaluation Framework

### Research Foundation:
- **Finding**: LLM-as-judge provides objective, consistent evaluation
- **Method**: Three specialized judges with different expertise areas
- **Validation**: Checklist-based assessment for precision and insight

### Agent Under Evaluation:
```yaml
$AGENT_CONFIG_AND_MULTI_PROMPT_RESULTS
```

## Judge 1: Technical Correctness & Implementation

### Expertise Area: Code Quality, Performance, Architecture

#### Technical Assessment Checklist:

**Code Implementation (25 points)**
☐ **Syntax Correctness** (5pts)
  - Bash syntax is valid and error-free
  - Functions are properly defined
  - Variable scoping is correct

☐ **Logic Soundness** (5pts)
  - Algorithm logic is correct
  - Control flow is appropriate
  - Edge cases are handled

☐ **Pattern Integration** (5pts)
  - Patterns are loaded correctly
  - Pattern functions are used properly
  - No pattern conflicts exist

☐ **Error Handling** (5pts)
  - All error paths are covered
  - Error messages are informative
  - Graceful degradation implemented

☐ **Code Structure** (5pts)
  - Functions are well-organized
  - Code is readable and maintainable
  - Comments are helpful and accurate

**Performance & Efficiency (25 points)**
☐ **Response Time** (8pts)
  - Meets target response time ($TARGET_RESPONSE_TIME ms)
  - No unnecessary delays
  - Efficient algorithms used

☐ **Memory Usage** (8pts)
  - Memory usage within limits ($MAX_MEMORY MB)
  - No memory leaks detected
  - Efficient data structures

☐ **Resource Management** (9pts)
  - Proper cleanup of resources
  - Efficient file/network operations
  - CPU usage optimized

**Technical Evaluation Process:**
```bash
# Load and analyze agent
source .claude/agents/$AGENT_NAME/agent.md

# Check function definitions
echo "Functions defined:"
declare -F | grep ${AGENT_NAME}

# Test syntax
bash -n .claude/agents/$AGENT_NAME/agent.md
syntax_check=$?

# Performance baseline test
time ${AGENT_NAME}_main $TEST_ARGS
performance_time=$?

# Memory usage test
memory_before=$(ps -o rss= -p $$)
${AGENT_NAME}_main $TEST_ARGS
memory_after=$(ps -o rss= -p $$)
memory_usage=$((memory_after - memory_before))
```

### Judge 1 Detailed Scoring:

**Code Implementation: $CODE_IMPL_SCORE/25**
- Syntax Correctness: $SYNTAX_SCORE/5
- Logic Soundness: $LOGIC_SCORE/5
- Pattern Integration: $PATTERN_SCORE/5
- Error Handling: $ERROR_SCORE/5
- Code Structure: $STRUCTURE_SCORE/5

**Performance & Efficiency: $PERFORMANCE_SCORE/25**
- Response Time: $TIME_SCORE/8
- Memory Usage: $MEMORY_SCORE/8
- Resource Management: $RESOURCE_SCORE/9

**Judge 1 Total Score: $JUDGE1_TOTAL/50**

### Judge 1 Technical Feedback:
$JUDGE1_DETAILED_FEEDBACK

---

## Judge 2: User Experience & Interface Design

### Expertise Area: Usability, Documentation, Error Messages

#### UX Assessment Checklist:

**Interface Design (25 points)**
☐ **Command Clarity** (5pts)
  - Command invocation is intuitive
  - Argument structure is logical
  - Help/usage information is clear

☐ **Input Validation** (5pts)
  - Input validation is user-friendly
  - Clear feedback on invalid inputs
  - Helpful error suggestions

☐ **Output Quality** (5pts)
  - Output format is consistent
  - Information is well-structured
  - Visual presentation is clean

☐ **Error Messages** (5pts)
  - Error messages are user-friendly
  - Errors provide actionable guidance
  - Technical details are appropriate for $TARGET_USERS

☐ **Progress Feedback** (5pts)
  - Long operations show progress
  - User is informed of current state
  - Completion status is clear

**Documentation & Usability (25 points)**
☐ **Documentation Completeness** (8pts)
  - Usage examples are comprehensive
  - All features are documented
  - Troubleshooting guide exists

☐ **Learning Curve** (8pts)
  - Easy for $TARGET_USERS to learn
  - Logical progression from basic to advanced
  - Good defaults reduce complexity

☐ **Accessibility** (9pts)
  - Works across different environments
  - Accommodates different skill levels
  - Provides multiple interaction modes

**UX Evaluation Process:**
```bash
# Test user interaction scenarios
echo "=== UX Testing Scenarios ==="

# Scenario 1: New user with minimal knowledge
echo "Testing new user scenario..."
${AGENT_NAME}_main --help

# Scenario 2: Typical user with basic knowledge
echo "Testing typical user scenario..."
${AGENT_NAME}_main $BASIC_ARGS

# Scenario 3: Advanced user with complex needs
echo "Testing advanced user scenario..."
${AGENT_NAME}_main $ADVANCED_ARGS

# Test error scenarios
echo "Testing error handling UX..."
${AGENT_NAME}_main $INVALID_ARGS
```

### Judge 2 Detailed Scoring:

**Interface Design: $INTERFACE_SCORE/25**
- Command Clarity: $CLARITY_SCORE/5
- Input Validation: $VALIDATION_UX_SCORE/5
- Output Quality: $OUTPUT_UX_SCORE/5
- Error Messages: $ERROR_UX_SCORE/5
- Progress Feedback: $PROGRESS_SCORE/5

**Documentation & Usability: $USABILITY_SCORE/25**
- Documentation Completeness: $DOCS_SCORE/8
- Learning Curve: $LEARNING_SCORE/8
- Accessibility: $ACCESS_SCORE/9

**Judge 2 Total Score: $JUDGE2_TOTAL/50**

### Judge 2 UX Feedback:
$JUDGE2_DETAILED_FEEDBACK

---

## Judge 3: Best Practices & Standards Compliance

### Expertise Area: Security, Standards, Industry Best Practices

#### Best Practices Assessment Checklist:

**Security & Safety (25 points)**
☐ **Input Sanitization** (5pts)
  - All inputs are properly sanitized
  - Injection attacks prevented
  - File path traversal blocked

☐ **Output Security** (5pts)
  - Sensitive data is not exposed
  - Output is properly escaped
  - No information leakage

☐ **Permission Model** (5pts)
  - Principle of least privilege applied
  - Required permissions are minimal
  - Dangerous operations are restricted

☐ **Audit & Logging** (5pts)
  - Security events are logged
  - Audit trail is comprehensive
  - Logs don't contain sensitive data

☐ **Vulnerability Assessment** (5pts)
  - No known security vulnerabilities
  - Dependencies are secure
  - Regular security review possible

**Standards Compliance (25 points)**
☐ **Coding Standards** (8pts)
  - Follows established bash best practices
  - Consistent naming conventions
  - Proper error code usage

☐ **Claude Code Standards** (8pts)
  - Proper frontmatter usage
  - Correct tool permissions
  - Follows command structure guidelines

☐ **Industry Best Practices** (9pts)
  - Follows 2024 best practices
  - Implements current security standards
  - Uses recommended patterns

**Standards Evaluation Process:**
```bash
# Security scan
echo "=== Security Assessment ==="
source patterns/security/security-basics.sh
basic_security_scan .claude/agents/$AGENT_NAME/

# Standards check
echo "=== Standards Compliance ==="
# Check frontmatter
head -10 .claude/agents/$AGENT_NAME/agent.md | grep -E "^---$|allowed-tools|description"

# Check pattern usage
grep -E "source.*patterns" .claude/agents/$AGENT_NAME/agent.md

# Best practices validation
if command -v shellcheck >/dev/null 2>&1; then
    shellcheck .claude/agents/$AGENT_NAME/agent.md
fi
```

### Judge 3 Detailed Scoring:

**Security & Safety: $SECURITY_SCORE/25**
- Input Sanitization: $INPUT_SEC_SCORE/5
- Output Security: $OUTPUT_SEC_SCORE/5
- Permission Model: $PERM_SCORE/5
- Audit & Logging: $AUDIT_SCORE/5
- Vulnerability Assessment: $VULN_SCORE/5

**Standards Compliance: $STANDARDS_SCORE/25**
- Coding Standards: $CODING_STD_SCORE/8
- Claude Code Standards: $CLAUDE_STD_SCORE/8
- Industry Best Practices: $INDUSTRY_SCORE/9

**Judge 3 Total Score: $JUDGE3_TOTAL/50**

### Judge 3 Standards Feedback:
$JUDGE3_DETAILED_FEEDBACK

---

## Consensus & Final Evaluation

### Individual Judge Scores:
| Judge | Focus Area | Score | Status |
|-------|------------|-------|---------|
| **Judge 1** | Technical Correctness | $JUDGE1_TOTAL/50 | $JUDGE1_STATUS |
| **Judge 2** | User Experience | $JUDGE2_TOTAL/50 | $JUDGE2_STATUS |
| **Judge 3** | Best Practices | $JUDGE3_TOTAL/50 | $JUDGE3_STATUS |

### Consensus Calculation:
```bash
# Calculate weighted average (equal weighting)
consensus_score=$(( (JUDGE1_TOTAL + JUDGE2_TOTAL + JUDGE3_TOTAL) / 3 ))
```

**Consensus Score: $CONSENSUS_SCORE/50 ($CONSENSUS_PERCENTAGE%)**

### Evaluation Gates:

**Gate 1: Minimum Viability (Required)**
- Consensus Score ≥ 30/50 (60%)
- No judge scores below 20/50
- Critical security issues: 0

**Gate 1 Status: $GATE1_STATUS** ✅/❌

**Gate 2: Production Ready (Recommended)**
- Consensus Score ≥ 40/50 (80%)
- All judges score ≥ 30/50
- Major issues: ≤ 2

**Gate 2 Status: $GATE2_STATUS** ✅/❌

**Gate 3: Excellence Standard (Ideal)**
- Consensus Score ≥ 45/50 (90%)
- All judges score ≥ 40/50
- Critical & major issues: 0

**Gate 3 Status: $GATE3_STATUS** ✅/❌

## Issue Classification & Remediation

### Critical Issues (Must Fix):
$CRITICAL_ISSUES_LIST

### Major Issues (Should Fix):
$MAJOR_ISSUES_LIST

### Minor Issues (Consider Fixing):
$MINOR_ISSUES_LIST

### Remediation Plan:
1. **Critical Issues**: $CRITICAL_REMEDIATION
2. **Major Issues**: $MAJOR_REMEDIATION
3. **Minor Issues**: $MINOR_REMEDIATION

### Remediation Required?
**If Consensus Score < 40/50 or Critical Issues > 0:**

**Return to optimization phase?** (y/n) > [WAIT FOR INPUT IF REMEDIATION NEEDED]

## Evaluation Summary

### Overall Assessment:
- **Technical Quality**: $JUDGE1_ASSESSMENT
- **User Experience**: $JUDGE2_ASSESSMENT
- **Standards Compliance**: $JUDGE3_ASSESSMENT

### Consensus Decision:
**Agent Quality Level**: $QUALITY_LEVEL (Minimum/Production/Excellence)

### Next Steps:
$NEXT_STEPS_RECOMMENDATION

## Validation Complete

Three-judge evaluation completed with detailed feedback and actionable recommendations.

**Continue to: /agent-builder/08-optimize** for meta-prompt optimization (if needed) or **Continue to: /agent-builder/10-rag-enhance** for knowledge augmentation.