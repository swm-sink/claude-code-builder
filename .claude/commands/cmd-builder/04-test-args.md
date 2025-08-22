---
allowed-tools: Read, Task(subagent_type:tester)
argument-hint: [implementation-details-json] or [command-name]
description: Test argument handling and parameter processing
category: cmd-builder
---

# Command Argument Testing Phase

Test argument handling and parameter processing: **$ARGUMENTS**

## Argument Testing Process

I'll conduct comprehensive testing of the command's argument handling and parameter processing:

### 1. Parse Implementation Details
Extract testing requirements from implementation information:
- Command location and structure
- Expected parameter formats
- Argument processing logic
- Validation rules and error handling
- Integration requirements

### 2. Argument Processing Test Suite

#### Basic Parameter Testing
Test fundamental argument handling:

**Single Parameter Test**
```
Test: Basic single parameter
Input: /command-name "simple-parameter"
Expected: Parameter correctly parsed and processed
Validation: Core functionality works with basic input
```

**Multiple Parameter Test**
```
Test: Multiple parameter handling
Input: /command-name "param1" "param2" "param3"
Expected: All parameters parsed correctly
Validation: Multi-parameter processing works
```

**Empty Parameter Test**
```
Test: Empty parameter handling
Input: /command-name ""
Expected: Graceful handling with appropriate message
Validation: Empty input doesn't break command
```

#### $ARGUMENTS Variable Testing
Test Claude Code's native argument passing:

**Simple $ARGUMENTS Test**
```
Test: Basic $ARGUMENTS processing
Input: Simple string argument
Expected: $ARGUMENTS variable properly substituted
Validation: Native Claude Code integration works
```

**Complex $ARGUMENTS Test**
```
Test: Complex $ARGUMENTS handling
Input: Multi-word, quoted, and special characters
Expected: All argument formats handled correctly
Validation: Robust parsing of various formats
```

**Structured $ARGUMENTS Test**
```
Test: JSON/structured data in arguments
Input: {"key": "value", "array": [1,2,3]}
Expected: Structured data parsed appropriately
Validation: Advanced parameter handling works
```

### 3. Parameter Validation Testing

#### Format Validation
Test input format validation:

**Valid Format Test**
```
Test: Accepted format validation
Input: Parameters in expected format
Expected: Validation passes, processing continues
Validation: Valid inputs are accepted
```

**Invalid Format Test**
```
Test: Invalid format rejection
Input: Parameters in wrong format
Expected: Clear error message with guidance
Validation: Invalid inputs are properly rejected
```

**Edge Format Test**
```
Test: Edge case format handling
Input: Boundary cases and unusual formats
Expected: Appropriate handling or clear rejection
Validation: Edge cases don't cause unexpected behavior
```

#### Content Validation
Test parameter content validation:

**Valid Content Test**
```
Test: Acceptable content validation
Input: Parameters with valid content
Expected: Content accepted and processed
Validation: Valid content passes validation
```

**Invalid Content Test**
```
Test: Invalid content rejection
Input: Parameters with invalid content
Expected: Content validation fails with helpful message
Validation: Invalid content is caught and handled
```

**Boundary Content Test**
```
Test: Content boundary testing
Input: Maximum length, special characters, edge cases
Expected: Boundaries respected with appropriate handling
Validation: Content limits are properly enforced
```

### 4. Special Character and Encoding Testing

#### Special Character Handling
```
Test: Special character processing
Input: Unicode, emojis, symbols, accents
Expected: Characters handled correctly without corruption
Validation: Internationalization and special chars work
```

#### Shell Character Safety
```
Test: Shell injection prevention
Input: Characters with shell significance (;, |, &, $)
Expected: Characters safely escaped or rejected
Validation: Command injection attacks prevented
```

#### Path Traversal Prevention
```
Test: Path traversal attack prevention
Input: "../", "../../etc/passwd", etc.
Expected: Path traversal attempts blocked
Validation: Directory traversal attacks prevented
```

### 5. Error Message Quality Testing

#### Error Message Clarity
```
Test: Error message helpfulness
Input: Various invalid inputs
Expected: Clear, specific, actionable error messages
Validation: Users can understand and fix errors
```

#### Error Recovery Guidance
```
Test: Error recovery assistance
Input: Common mistake patterns
Expected: Suggestions for correct usage
Validation: Users get help to succeed
```

#### Help Integration
```
Test: Help system integration
Input: --help, invalid usage requiring help
Expected: Contextual help provided appropriately
Validation: Help system is accessible and useful
```

### 6. Performance Testing

#### Large Parameter Testing
```
Test: Large parameter handling
Input: Very long parameter strings
Expected: Efficient processing or appropriate limits
Validation: Performance remains acceptable
```

#### Multiple Invocation Testing
```
Test: Repeated command execution
Input: Multiple consecutive command calls
Expected: Consistent performance and behavior
Validation: No performance degradation over time
```

## Testing Execution

I'll use the specialized tester subagent for comprehensive argument testing:

**Activating argument testing specialist...**

The tester will systematically validate:
- Basic parameter processing
- $ARGUMENTS integration
- Input validation robustness
- Error handling quality
- Performance characteristics

## Argument Testing Report Format

```json
{
  "testing_phase": "argument_handling",
  "command_tested": "[command-name]",
  "test_timestamp": "2025-01-XX",
  "test_summary": {
    "total_tests": 0,
    "passed": 0,
    "failed": 0,
    "warnings": 0,
    "overall_status": "pass/fail/warning"
  },
  "test_categories": {
    "basic_parameters": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "single_param": "pass/fail",
      "multiple_params": "pass/fail",
      "empty_params": "pass/fail"
    },
    "arguments_integration": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "simple_substitution": "pass/fail",
      "complex_substitution": "pass/fail",
      "structured_data": "pass/fail"
    },
    "validation_testing": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "format_validation": "pass/fail",
      "content_validation": "pass/fail",
      "boundary_testing": "pass/fail"
    },
    "security_testing": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "special_characters": "pass/fail",
      "injection_prevention": "pass/fail",
      "path_traversal": "pass/fail"
    },
    "error_handling": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "message_clarity": "excellent/good/poor",
      "recovery_guidance": "helpful/basic/missing",
      "help_integration": "seamless/adequate/poor"
    },
    "performance": {
      "status": "✅/⚠️/❌",
      "tests_run": 0,
      "large_params": "efficient/adequate/slow",
      "repeated_calls": "stable/degrading/unstable"
    }
  },
  "detailed_findings": {
    "critical_issues": [],
    "argument_parsing_quality": "excellent/good/needs_work",
    "validation_robustness": "strong/adequate/weak",
    "error_message_quality": "excellent/good/poor",
    "performance_assessment": "fast/adequate/slow"
  },
  "recommendations": {
    "immediate_fixes": [],
    "performance_improvements": [],
    "usability_enhancements": [],
    "security_hardening": []
  },
  "ready_for_tool_testing": true/false
}
```

## Pass/Fail Criteria

### Critical Requirements (Must Pass)
- Basic parameter parsing works correctly
- $ARGUMENTS integration functions properly
- Input validation prevents security issues
- Error messages are clear and helpful
- Performance is acceptable for intended use

### Important Requirements (Should Pass)
- Complex parameter formats handled well
- Validation is comprehensive and robust
- Error recovery guidance is provided
- Help system integration works smoothly
- Performance is optimized for efficiency

### Enhancement Opportunities (Nice to Have)
- Advanced parameter processing features
- Exceptional error message quality
- Superior performance characteristics
- Comprehensive security hardening

## Usage

### Standalone Argument Testing
```
/cmd-builder:04-test-args [implementation-details-json]
```

### As Part of Chain
This command receives implementation details from step 03 and outputs testing results for step 05 (tool testing).

## Success Criteria

- All critical argument handling tests pass
- Input validation is robust and secure
- Error messages are clear and helpful
- Performance meets expectations
- Ready for tool permission testing
- User experience is smooth and intuitive

The argument testing phase ensures the command can reliably process user input and provide appropriate feedback across all usage scenarios.