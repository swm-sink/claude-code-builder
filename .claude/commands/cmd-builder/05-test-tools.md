---
allowed-tools: Read, Task(subagent_type:tester), Bash(test:*)
argument-hint: [arg-test-results-json] or [command-name]
description: Test tool permissions and usage patterns
category: cmd-builder
---

# Command Tool Testing Phase

Test tool permissions and usage patterns: **$ARGUMENTS**

## Tool Testing Process

I'll conduct comprehensive testing of the command's tool permissions and usage:

### 1. Parse Argument Test Results
Review argument testing outcomes to understand:
- Command functionality baseline
- Parameter handling verification
- Areas requiring tool integration testing
- Known issues to investigate further

### 2. Tool Permission Testing

#### Permission Verification
Test that declared tool permissions work correctly:

**Read Tool Permission Test**
```
Test: File reading capability
Condition: If command declares Read tool
Input: Valid file path for reading
Expected: File content accessed successfully
Validation: Read permissions work as declared
```

**Write Tool Permission Test**
```
Test: File writing capability
Condition: If command declares Write tool
Input: Valid file path for writing
Expected: File content written successfully
Validation: Write permissions work as declared
```

**Bash Tool Permission Test**
```
Test: Shell command execution
Condition: If command declares Bash tools
Input: Allowed shell command
Expected: Command executes with proper output
Validation: Bash permissions work within scope
```

**WebSearch Tool Permission Test**
```
Test: Web search capability
Condition: If command declares WebSearch tool
Input: Search query
Expected: Search results retrieved successfully
Validation: Web search permissions functional
```

#### Permission Boundary Testing
Test that tool permissions are properly restricted:

**Unauthorized Tool Usage Test**
```
Test: Unauthorized tool prevention
Input: Attempt to use undeclared tool
Expected: Permission denied with clear message
Validation: Tool restrictions are enforced
```

**Bash Command Restriction Test**
```
Test: Bash command scope limitation
Condition: If Bash(specific:*) is declared
Input: Command outside allowed scope
Expected: Permission denied or scope restriction
Validation: Bash permissions are properly scoped
```

**File Access Boundary Test**
```
Test: File access limitations
Input: Attempt to access restricted files
Expected: Access denied with appropriate message
Validation: File access boundaries are enforced
```

### 3. Tool Usage Pattern Testing

#### Efficient Tool Usage
Test that tools are used efficiently and appropriately:

**Tool Selection Appropriateness**
```
Test: Correct tool selection for tasks
Input: Various functionality requests
Expected: Most appropriate tool used for each task
Validation: Tool usage is optimized and logical
```

**Resource Usage Efficiency**
```
Test: Efficient resource utilization
Input: Tasks requiring tool usage
Expected: Minimal resource usage for maximum effect
Validation: Tools used efficiently without waste
```

**Error Recovery with Tools**
```
Test: Tool error handling and recovery
Input: Scenarios where tool usage might fail
Expected: Graceful handling and alternative approaches
Validation: Robust tool error management
```

### 4. Integration Testing

#### Tool Combination Testing
Test how multiple tools work together:

**Multi-Tool Workflow Test**
```
Test: Multiple tool coordination
Input: Tasks requiring several tools
Expected: Smooth coordination between tools
Validation: Multi-tool workflows function correctly
```

**Tool Chain Dependency Test**
```
Test: Tool dependency management
Input: Tasks with tool interdependencies
Expected: Dependencies handled correctly
Validation: Tool chains work reliably
```

#### Claude Code Integration Testing
Test integration with Claude Code's native features:

**Native Feature Integration Test**
```
Test: Claude Code feature utilization
Input: Standard Claude Code operations
Expected: Native features work seamlessly with tools
Validation: Full Claude Code integration achieved
```

### 5. Security Testing

#### Permission Security Testing
Test that tool permissions don't introduce security vulnerabilities:

**Privilege Escalation Prevention**
```
Test: No unauthorized privilege escalation
Input: Attempts to gain higher privileges
Expected: Escalation attempts blocked
Validation: Security boundaries maintained
```

**Command Injection Prevention**
```
Test: Shell command injection prevention
Condition: If Bash tools are used
Input: Malicious command injection attempts
Expected: Injection attempts safely handled
Validation: Command injection vulnerabilities prevented
```

**File System Security**
```
Test: File system access security
Condition: If Read/Write tools are used
Input: Attempts to access sensitive system files
Expected: Unauthorized access blocked
Validation: File system security maintained
```

### 6. Performance Testing

#### Tool Performance Testing
Test tool usage performance characteristics:

**Tool Response Time**
```
Test: Tool operation response times
Input: Various tool operations
Expected: Reasonable response times for all tools
Validation: Tool performance meets expectations
```

**Resource Consumption**
```
Test: Tool resource usage
Input: Tool-intensive operations
Expected: Reasonable resource consumption
Validation: Tools don't consume excessive resources
```

**Concurrent Tool Usage**
```
Test: Multiple tool operations
Input: Concurrent or rapid tool usage
Expected: Stable performance under load
Validation: Tools handle concurrent usage well
```

## Testing Execution

I'll leverage the specialized tester subagent for comprehensive tool testing:

**Activating tool permission testing protocols...**

The tester will systematically validate:
- Declared tool permissions functionality
- Permission boundary enforcement
- Tool usage efficiency and appropriateness
- Security posture with tool permissions
- Performance characteristics of tool usage

## Tool Testing Report Format

```json
{
  "testing_phase": "tool_permissions",
  "command_tested": "[command-name]",
  "test_timestamp": "2025-01-XX",
  "baseline_performance": {
    "argument_test_score": "X/100",
    "known_issues": [],
    "functionality_baseline": "good/fair/poor"
  },
  "tool_permission_analysis": {
    "declared_tools": [],
    "permission_scope": "minimal/moderate/extensive",
    "security_risk": "low/medium/high",
    "efficiency_rating": "excellent/good/fair/poor"
  },
  "test_results": {
    "permission_verification": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "read_permissions": "pass/fail/n_a",
      "write_permissions": "pass/fail/n_a",
      "bash_permissions": "pass/fail/n_a",
      "web_permissions": "pass/fail/n_a"
    },
    "permission_boundaries": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "unauthorized_prevention": "pass/fail",
      "scope_restrictions": "pass/fail",
      "access_boundaries": "pass/fail"
    },
    "usage_patterns": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "tool_selection": "optimal/good/poor",
      "resource_efficiency": "excellent/good/poor",
      "error_recovery": "robust/adequate/weak"
    },
    "integration_testing": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "multi_tool_coordination": "excellent/good/poor",
      "dependency_management": "robust/adequate/weak",
      "native_integration": "seamless/good/problematic"
    },
    "security_validation": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "privilege_escalation": "prevented/concerns/vulnerable",
      "injection_prevention": "secure/adequate/vulnerable",
      "file_system_security": "secure/adequate/vulnerable"
    },
    "performance_testing": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "response_times": "fast/adequate/slow",
      "resource_consumption": "efficient/moderate/heavy",
      "concurrent_usage": "stable/adequate/unstable"
    }
  },
  "detailed_analysis": {
    "tool_utilization_score": "X/100",
    "security_posture": "strong/adequate/weak",
    "performance_rating": "excellent/good/poor",
    "integration_quality": "seamless/good/problematic"
  },
  "critical_findings": [],
  "security_recommendations": [],
  "performance_optimizations": [],
  "ready_for_validation": true/false
}
```

## Quality Gates

### Security Gates (Must Pass)
- No unauthorized tool usage possible
- Command injection prevention working
- File system access properly restricted
- Privilege escalation blocked
- All security boundaries enforced

### Functionality Gates (Must Pass)
- All declared tools work correctly
- Tool combinations function properly
- Error handling is robust
- Performance is acceptable
- Integration with Claude Code is seamless

### Quality Gates (Should Pass)
- Tool usage is efficient and appropriate
- Resource consumption is reasonable
- Error recovery is graceful
- Documentation matches actual behavior
- User experience is smooth

## Usage

### Standalone Tool Testing
```
/cmd-builder:05-test-tools [arg-test-results-json]
```

### As Part of Chain
This command receives argument test results from step 04 and outputs tool test results for step 06 (validation).

## Success Criteria

- All declared tool permissions work correctly
- Security boundaries are properly enforced
- Tool usage is efficient and appropriate
- Performance meets expectations
- Integration with Claude Code is seamless
- No security vulnerabilities identified
- Ready for comprehensive validation

The tool testing phase ensures the command uses its permissions safely, efficiently, and correctly within the Claude Code ecosystem.