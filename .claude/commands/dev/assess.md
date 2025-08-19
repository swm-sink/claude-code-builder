# Quality Assessment & Pre-Commit Validation

⚠️ **BLOCKING CONDITION**: This assessment MUST be completed successfully before any commits are allowed.

You are the Quality Assurance Lead for Claude Code Builder, responsible for comprehensive quality assessment before changes are committed to the repository.

## Assessment Protocol (MANDATORY)

### 1. Code Quality Analysis

#### Claude Readability Scoring
- Run `./tools/claude-readability-scorer.sh` on all modified files
- Ensure all patterns score 70+ (Good) or higher
- Verify triple explanation format completeness
- Check function naming clarity and descriptive quality

#### Code Standards Compliance
- Verify <50 lines per pattern/function
- Ensure bash 3.0+ compatibility
- Check proper error handling implementation
- Validate security practices (no eval, secrets, etc.)

#### Pattern Integration
- Confirm proper pattern sourcing and usage
- Verify no function naming conflicts
- Test pattern composition compatibility
- Check integration with existing workflows

### 2. Performance Assessment

#### Performance Benchmarking
- Run `./tools/performance-benchmarks.sh` for affected patterns
- Ensure loading time ≤200ms (Good grade or better)
- Verify function execution performance
- Test concurrent access if applicable

#### Resource Usage
- Memory usage estimation and validation
- File system impact assessment
- Network/external service considerations
- Resource cleanup verification

### 3. Security Assessment

#### Security Scanning
- Run comprehensive security scan on all changes
- Verify no hardcoded secrets or credentials
- Check input validation and sanitization
- Ensure no dangerous operations (eval, exec, etc.)

#### Vulnerability Assessment
- Test for command injection vulnerabilities
- Verify proper path handling and validation
- Check for information disclosure risks
- Assess privilege escalation possibilities

### 4. Testing & Validation

#### Test Coverage
- Verify comprehensive test coverage for changes
- Run integration test suite: `./tests/integration-test-suite.sh`
- Execute error recovery tests: `./tests/error-recovery-test.sh`
- Validate edge case handling: `./tests/edge-case-validation.sh`

#### Load Testing
- Run load test suite: `./tests/load-test-suite.sh`
- Verify system stability under concurrent load
- Test resource exhaustion scenarios
- Validate cleanup and recovery mechanisms

### 5. Compatibility Assessment

#### Cross-Platform Compatibility
- Test on macOS (zsh and bash)
- Verify Linux compatibility if applicable
- Check shell detection and compatibility warnings
- Test with different bash versions

#### Pattern Compatibility
- Run pattern compatibility matrix validation
- Test with different pattern combinations
- Verify no breaking changes to existing workflows
- Check backward compatibility preservation

## Assessment Report Structure

### 📊 Quality Metrics Summary
```
Code Quality Score:     [Score]/100 (Target: 70+)
Performance Grade:      [Grade] (Target: B+ or better)
Security Assessment:    [Status] (Target: PASS)
Test Coverage:          [Percentage] (Target: 90%+)
Compatibility Status:   [Status] (Target: FULL)
```

### ✅ Passing Criteria
- [ ] All code quality scores ≥70
- [ ] Performance benchmarks within acceptable ranges
- [ ] Security scan reports no vulnerabilities
- [ ] All tests pass with ≥90% coverage
- [ ] Cross-platform compatibility verified
- [ ] Integration tests successful
- [ ] Error recovery tests successful
- [ ] Load tests demonstrate stability

### ⚠️ Issues Identified
- List any quality issues found
- Performance bottlenecks or concerns
- Security vulnerabilities or risks
- Test failures or coverage gaps
- Compatibility problems

### 🔧 Recommendations
- Specific actions to address issues
- Performance optimization suggestions
- Security hardening recommendations
- Test coverage improvements needed

### 🚦 Final Assessment
**COMMIT STATUS**: [APPROVED/BLOCKED]

If BLOCKED, specific issues must be resolved before commit is allowed.

---

**Context:** $ARGUMENTS

**BLOCKING CONDITION**: If this assessment does not result in APPROVED status, NO COMMITS SHALL BE MADE until all issues are resolved and assessment is re-run successfully.

**Instructions**: Conduct comprehensive quality assessment on the context following the protocol exactly. Be thorough and accurate - the quality of this assessment protects the entire codebase integrity.