---
allowed-tools: Read, Task(subagent_type:tester)
argument-hint: [prototype-info-json] or [agent-file-path]
description: Test basic functionality of the agent prototype
category: agent-builder
---

# Agent Basic Testing Phase

Test basic functionality of the agent prototype: **$ARGUMENTS**

## Basic Testing Process

I'll conduct comprehensive basic functionality testing to ensure the agent works correctly:

### 1. Parse Prototype Information
Extract testing details from the prototype information:
- Agent file location
- Expected functionality
- Tool requirements
- Basic use cases

### 2. Agent File Validation
Verify the agent file structure:

#### File Structure Check
- [ ] File exists at specified location
- [ ] YAML frontmatter is present and valid
- [ ] System prompt is complete
- [ ] Markdown formatting is correct

#### Metadata Validation
- [ ] Required frontmatter fields present (name, description)
- [ ] Tool permissions are specified correctly
- [ ] Category and version information included
- [ ] All fields follow Claude Code standards

### 3. Core Functionality Testing

#### Basic Invocation Test
Test that the agent can be invoked and responds:
```
Test: Basic agent invocation
Input: Simple request within agent's scope
Expected: Appropriate response following agent's design
```

#### Tool Permission Test
Verify tool permissions work correctly:
```
Test: Tool usage validation
Input: Request that requires specified tools
Expected: Agent uses tools successfully
```

#### Input Handling Test
Test how the agent handles various inputs:
```
Test: Standard input processing
Input: Typical use case scenario
Expected: Correct parsing and processing
```

#### Output Format Test
Verify output follows specifications:
```
Test: Output formatting
Input: Request requiring structured output
Expected: Output matches design specifications
```

### 4. Role Adherence Testing

#### Scope Boundary Test
Verify agent stays within defined scope:
```
Test: Scope adherence
Input: Request outside agent's domain
Expected: Appropriate refusal or redirection
```

#### Expertise Demonstration
Test agent demonstrates claimed expertise:
```
Test: Expertise validation
Input: Domain-specific request
Expected: Knowledgeable, accurate response
```

### 5. Integration Testing

#### Context Handling
Test how agent handles conversation context:
```
Test: Context management
Input: Multi-turn conversation
Expected: Maintains context appropriately
```

#### Chainability Test
If designed for chaining, test integration:
```
Test: Chain compatibility
Input: Use as part of command chain
Expected: Passes/receives data correctly
```

## Testing Execution

I'll use the specialized tester subagent to conduct thorough testing:

**Activating testing subagent for comprehensive basic functionality testing...**

The tester will provide detailed results for each test category:
- File structure and metadata validation
- Core functionality verification
- Input/output handling assessment
- Role adherence confirmation
- Basic integration testing

## Test Results Format

```json
{
  "test_phase": "basic_functionality",
  "agent_tested": "[agent-name]",
  "test_timestamp": "2025-01-XX",
  "test_summary": {
    "total_tests": 0,
    "passed": 0,
    "failed": 0,
    "warnings": 0,
    "overall_status": "pass/fail/warning"
  },
  "test_categories": {
    "file_structure": {
      "status": "pass/fail/warning",
      "tests_run": 0,
      "issues_found": []
    },
    "core_functionality": {
      "status": "pass/fail/warning",
      "tests_run": 0,
      "key_findings": []
    },
    "input_handling": {
      "status": "pass/fail/warning",
      "tests_run": 0,
      "edge_cases_tested": []
    },
    "output_formatting": {
      "status": "pass/fail/warning",
      "tests_run": 0,
      "format_compliance": "good/fair/poor"
    },
    "integration": {
      "status": "pass/fail/warning",
      "tests_run": 0,
      "compatibility_notes": []
    }
  },
  "critical_issues": [],
  "recommendations": [],
  "ready_for_advanced_testing": true/false
}
```

## Pass/Fail Criteria

### Must Pass (Blocking Issues)
- Agent file exists and is valid
- YAML frontmatter is correct
- Basic functionality works
- Agent responds appropriately to simple requests
- Tool permissions are functional

### Should Pass (Quality Issues)
- Output formatting is consistent
- Error handling is graceful
- Context handling is appropriate
- Documentation is accurate
- Performance is reasonable

### Nice to Have (Enhancement Opportunities)
- Advanced features work smoothly
- Edge cases are handled well
- Integration is seamless
- User experience is excellent

## Usage

### Standalone Basic Testing
```
/agent-builder:04-test-basic [prototype-info-json]
```

### As Part of Chain
This command receives prototype information from step 03 and outputs test results for step 05 (advanced testing).

## Success Criteria

- All critical tests pass
- No blocking issues identified
- Basic functionality confirmed
- Ready for advanced testing phase
- Clear test results and recommendations provided

The basic testing phase ensures the agent prototype is functional and ready for more comprehensive testing.