---
allowed-tools: Read, Task(subagent_type:tester), WebSearch
argument-hint: [basic-test-results-json] or [agent-name]
description: Test advanced scenarios, edge cases, and error handling
category: agent-builder
---

# Agent Advanced Testing Phase

Test advanced scenarios, edge cases, and error handling: **$ARGUMENTS**

## Advanced Testing Process

I'll conduct comprehensive advanced testing to ensure the agent handles complex scenarios robustly:

### 1. Parse Basic Test Results
Review basic test results to understand:
- Agent performance baseline
- Areas needing focused testing
- Known issues to investigate further
- Successful patterns to stress test

### 2. Edge Case Testing

#### Input Boundary Testing
Test extreme and unusual inputs:

**Empty/Null Inputs**
```
Test: Empty input handling
Input: "", null, undefined
Expected: Graceful handling with helpful message
```

**Extremely Long Inputs**
```
Test: Long input processing
Input: Very long text (>10k characters)
Expected: Efficient processing or appropriate limits
```

**Special Characters and Formats**
```
Test: Special character handling
Input: Unicode, emojis, code snippets, URLs
Expected: Proper parsing without breaking
```

**Malformed Data**
```
Test: Invalid input recovery
Input: Broken JSON, invalid syntax, corrupted data
Expected: Error detection and recovery
```

#### Output Stress Testing
Test output generation under stress:

**Large Output Generation**
```
Test: Large response handling
Input: Request requiring extensive output
Expected: Efficient generation or chunking
```

**Format Edge Cases**
```
Test: Output format consistency
Input: Requests with complex formatting needs
Expected: Consistent, readable output
```

### 3. Error Handling Validation

#### Tool Permission Errors
```
Test: Permission denial handling
Scenario: Request requiring unavailable tools
Expected: Clear error message and alternatives
```

#### Resource Unavailability
```
Test: Resource failure recovery
Scenario: Network issues, file access problems
Expected: Graceful degradation and retry logic
```

#### Context Overflow
```
Test: Context limit handling
Scenario: Very long conversation history
Expected: Appropriate context management
```

#### Invalid State Recovery
```
Test: State corruption recovery
Scenario: Inconsistent or invalid state
Expected: Safe reset and recovery
```

### 4. Performance Testing

#### Response Time Analysis
```
Test: Response time consistency
Scenario: Various input sizes and complexities
Expected: Reasonable and consistent response times
```

#### Token Efficiency
```
Test: Token usage optimization
Scenario: Various interaction patterns
Expected: Efficient token usage
```

#### Memory Usage
```
Test: Resource consumption
Scenario: Extended usage sessions
Expected: Stable memory usage
```

#### Concurrent Usage
```
Test: Multiple session handling
Scenario: Simulated concurrent usage
Expected: Stable performance
```

### 5. Security Testing

#### Input Injection Testing
```
Test: Injection attack resistance
Input: Attempted prompt injection, command injection
Expected: Input sanitization and safe handling
```

#### Permission Escalation Testing
```
Test: Privilege boundary enforcement
Input: Requests for unauthorized actions
Expected: Proper permission checking
```

#### Data Leakage Prevention
```
Test: Information disclosure protection
Input: Attempts to access system information
Expected: Appropriate information boundaries
```

### 6. Integration Stress Testing

#### Chain Compatibility
```
Test: Complex chain interactions
Scenario: Multi-step command chains
Expected: Reliable data passing and processing
```

#### Session Management
```
Test: Long-running session handling
Scenario: Extended conversation sessions
Expected: Stable context and performance
```

#### Ecosystem Integration
```
Test: Claude Code feature integration
Scenario: Using all native features
Expected: Seamless integration
```

## Advanced Testing Execution

I'll leverage the specialized tester subagent for comprehensive advanced testing:

**Activating advanced testing protocols...**

The tester will conduct systematic testing across all advanced scenarios:
- Edge case resilience
- Error recovery mechanisms
- Performance under stress
- Security boundary enforcement
- Integration stability

## Advanced Test Results Format

```json
{
  "test_phase": "advanced_scenarios",
  "agent_tested": "[agent-name]",
  "test_timestamp": "2025-01-XX",
  "baseline_performance": {
    "basic_test_score": "X/100",
    "known_issues": [],
    "performance_baseline": {}
  },
  "advanced_test_results": {
    "edge_cases": {
      "total_tests": 0,
      "passed": 0,
      "failed": 0,
      "critical_failures": [],
      "resilience_score": "excellent/good/fair/poor"
    },
    "error_handling": {
      "recovery_tests": 0,
      "successful_recoveries": 0,
      "graceful_failures": 0,
      "error_handling_score": "excellent/good/fair/poor"
    },
    "performance_stress": {
      "response_time_consistency": "stable/variable/unstable",
      "token_efficiency": "excellent/good/fair/poor",
      "resource_usage": "efficient/moderate/heavy",
      "scalability": "excellent/good/fair/poor"
    },
    "security_validation": {
      "injection_resistance": "strong/moderate/weak",
      "permission_enforcement": "strict/moderate/loose",
      "data_protection": "secure/adequate/insufficient"
    },
    "integration_testing": {
      "chain_compatibility": "excellent/good/fair/poor",
      "session_stability": "stable/moderate/unstable",
      "ecosystem_integration": "seamless/good/problematic"
    }
  },
  "performance_metrics": {
    "avg_response_time": "X ms",
    "token_efficiency": "X tokens/request",
    "memory_usage": "X MB",
    "error_rate": "X%"
  },
  "critical_issues": [],
  "security_concerns": [],
  "performance_bottlenecks": [],
  "recommendations": {
    "immediate_fixes": [],
    "performance_improvements": [],
    "security_enhancements": [],
    "feature_enhancements": []
  },
  "production_readiness": "ready/needs_work/not_ready"
}
```

## Quality Gates

### Production Readiness Criteria
- **Edge Case Resilience**: 90%+ edge cases handled gracefully
- **Error Recovery**: 95%+ error scenarios handled properly
- **Performance**: Consistent response times under load
- **Security**: No critical security vulnerabilities
- **Integration**: Stable operation in ecosystem

### Performance Benchmarks
- Response time: <2s for typical requests
- Token efficiency: <500 tokens per interaction
- Error rate: <1% under normal conditions
- Memory usage: Stable over extended sessions

## Usage

### Standalone Advanced Testing
```
/agent-builder:05-test-advanced [basic-test-results-json]
```

### As Part of Chain
This command receives basic test results from step 04 and outputs comprehensive test results for step 06 (validation).

## Success Criteria

- Comprehensive edge case coverage
- Robust error handling confirmed
- Performance meets benchmarks
- Security vulnerabilities identified and addressed
- Production readiness assessment complete

The advanced testing phase ensures the agent is robust, secure, and ready for production use.