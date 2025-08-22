---
allowed-tools: Read, Task(subagent_type:validator), WebSearch
argument-hint: [tool-test-results-json] or [command-name]
description: Validate command against Claude Code standards and best practices
category: cmd-builder
---

# Command Validation Phase

Validate command against Claude Code standards and best practices: **$ARGUMENTS**

## Validation Process

I'll conduct comprehensive validation to ensure the command meets all Claude Code standards and industry best practices:

### 1. Parse Tool Test Results
Review tool testing outcomes to understand:
- Tool permission validation status
- Security posture assessment
- Performance characteristics
- Integration quality metrics
- Areas requiring validation focus

### 2. Claude Code Standards Validation

#### Frontmatter Compliance Validation
Validate YAML frontmatter against Claude Code requirements:

**Structure Validation**
```
Validation: YAML frontmatter structure
Check: Proper YAML syntax and formatting
Standard: Valid YAML with required fields
Result: ✅/⚠️/❌
```

**Required Fields Validation**
```
Validation: Essential frontmatter fields
Check: allowed-tools, argument-hint, description, category
Standard: All required fields present and valid
Result: ✅/⚠️/❌
```

**Tool Permission Validation**
```
Validation: Tool permission appropriateness
Check: Minimal necessary permissions declared
Standard: Least privilege principle followed
Result: ✅/⚠️/❌
```

#### Content Standards Validation
Validate command content against Claude Code patterns:

**Markdown Structure Validation**
```
Validation: Markdown formatting and structure
Check: Proper headers, formatting, readability
Standard: Claude Code documentation standards
Result: ✅/⚠️/❌
```

**$ARGUMENTS Usage Validation**
```
Validation: Proper $ARGUMENTS implementation
Check: Correct usage of argument variable
Standard: Native Claude Code argument handling
Result: ✅/⚠️/❌
```

**Integration Pattern Validation**
```
Validation: Claude Code integration patterns
Check: Native feature utilization
Standard: Follows established patterns
Result: ✅/⚠️/❌
```

### 3. Industry Best Practices Validation

#### Command Design Best Practices
Validate against current industry standards:

**Single Responsibility Validation**
```
Validation: Command has single, clear purpose
Check: Focused functionality without scope creep
Standard: Single responsibility principle
Result: ✅/⚠️/❌
```

**User Experience Validation**
```
Validation: User-friendly interface and behavior
Check: Intuitive usage, clear help, good error messages
Standard: Excellent user experience standards
Result: ✅/⚠️/❌
```

**Error Handling Validation**
```
Validation: Comprehensive error handling
Check: All error scenarios handled gracefully
Standard: Robust error handling patterns
Result: ✅/⚠️/❌
```

#### Performance Standards Validation
Validate performance characteristics:

**Response Time Validation**
```
Validation: Acceptable response times
Check: Commands respond within reasonable time
Standard: <2s for typical operations
Result: ✅/⚠️/❌
```

**Resource Efficiency Validation**
```
Validation: Efficient resource usage
Check: Minimal CPU, memory, and token usage
Standard: Optimized resource consumption
Result: ✅/⚠️/❌
```

### 4. Security Standards Validation

#### Security Best Practices
Validate security implementation:

**Input Validation Standards**
```
Validation: Comprehensive input validation
Check: All inputs validated and sanitized
Standard: Security-first input handling
Result: ✅/⚠️/❌
```

**Permission Security Validation**
```
Validation: Secure permission usage
Check: No excessive permissions or security risks
Standard: Principle of least privilege
Result: ✅/⚠️/❌
```

**Output Safety Validation**
```
Validation: Safe output handling
Check: No sensitive information disclosure
Standard: Secure output practices
Result: ✅/⚠️/❌
```

### 5. Documentation Standards Validation

#### Documentation Completeness
Validate documentation quality:

**Usage Documentation Validation**
```
Validation: Clear usage instructions
Check: Users can understand and use command
Standard: Comprehensive usage documentation
Result: ✅/⚠️/❌
```

**Example Quality Validation**
```
Validation: Practical, working examples
Check: Examples help users succeed
Standard: High-quality example documentation
Result: ✅/⚠️/❌
```

**Help Integration Validation**
```
Validation: Integrated help system
Check: Help available and useful within command
Standard: Contextual help system
Result: ✅/⚠️/❌
```

## Validation Execution

I'll use the specialized validator subagent for comprehensive standards validation:

**Activating validation specialist for comprehensive standards assessment...**

The validator will systematically assess:
- Claude Code standards compliance
- Industry best practices adherence
- Security posture validation
- Performance standards compliance
- Documentation quality assessment

## Validation Report Format

```json
{
  "validation_phase": "standards_compliance",
  "command_validated": "[command-name]",
  "validation_timestamp": "2025-01-XX",
  "baseline_metrics": {
    "tool_test_score": "X/100",
    "security_assessment": "strong/adequate/weak",
    "performance_rating": "excellent/good/poor",
    "integration_quality": "seamless/good/problematic"
  },
  "claude_code_compliance": {
    "overall_score": "X/100",
    "compliance_status": "compliant/needs_improvement/non_compliant",
    "frontmatter_validation": {
      "status": "✅/⚠️/❌",
      "structure": "valid/invalid",
      "required_fields": "complete/missing",
      "tool_permissions": "appropriate/excessive/insufficient"
    },
    "content_standards": {
      "status": "✅/⚠️/❌",
      "markdown_structure": "excellent/good/poor",
      "arguments_usage": "correct/incorrect",
      "integration_patterns": "standard/non_standard"
    }
  },
  "industry_best_practices": {
    "overall_score": "X/100",
    "compliance_status": "excellent/good/needs_improvement",
    "command_design": {
      "single_responsibility": "✅/⚠️/❌",
      "user_experience": "excellent/good/poor",
      "error_handling": "comprehensive/adequate/insufficient"
    },
    "performance_standards": {
      "response_time": "fast/adequate/slow",
      "resource_efficiency": "excellent/good/poor",
      "scalability": "excellent/good/limited"
    }
  },
  "security_validation": {
    "overall_score": "X/100",
    "security_posture": "strong/adequate/weak",
    "input_validation": {
      "status": "✅/⚠️/❌",
      "comprehensiveness": "complete/partial/insufficient",
      "sanitization": "robust/adequate/weak"
    },
    "permission_security": {
      "status": "✅/⚠️/❌",
      "least_privilege": "followed/mostly/violated",
      "risk_assessment": "low/medium/high"
    },
    "output_safety": {
      "status": "✅/⚠️/❌",
      "information_disclosure": "safe/concerns/unsafe",
      "sanitization": "complete/partial/missing"
    }
  },
  "documentation_validation": {
    "overall_score": "X/100",
    "completeness": "comprehensive/adequate/insufficient",
    "usage_documentation": "excellent/good/poor",
    "example_quality": "excellent/good/poor",
    "help_integration": "seamless/adequate/missing"
  },
  "validation_summary": {
    "total_checks": 0,
    "passed": 0,
    "warnings": 0,
    "failures": 0,
    "critical_issues": [],
    "major_recommendations": [],
    "minor_improvements": []
  },
  "certification_assessment": {
    "overall_grade": "A/B/C/D/F",
    "production_readiness": "ready/conditional/not_ready",
    "certification_level": "excellent/good/basic/needs_work",
    "deployment_recommendation": "immediate/after_fixes/major_work_needed"
  },
  "next_phase_guidance": {
    "optimization_priorities": [],
    "enhancement_opportunities": [],
    "critical_fixes_required": []
  }
}
```

## Validation Criteria

### Certification Levels
- **Excellent (90-100)**: Exceeds standards, ready for community sharing
- **Good (75-89)**: Meets all standards, production-ready
- **Basic (60-74)**: Functional but needs improvements
- **Needs Work (<60)**: Significant issues, requires fixes

### Critical Requirements (Must Pass)
- YAML frontmatter is valid and complete
- Core functionality works reliably
- No security vulnerabilities
- Tool permissions are appropriate
- Basic documentation is present

### Major Requirements (Should Pass)
- Follows Claude Code best practices
- Industry standards compliance
- Comprehensive error handling
- Good user experience design
- Performance meets expectations

### Minor Requirements (Nice to Have)
- Exceptional documentation quality
- Advanced feature implementation
- Superior performance characteristics
- Outstanding user experience

## Quality Gates

### Compliance Gate
- Claude Code standards: 100% compliance required
- Industry best practices: 90%+ compliance expected
- Security standards: No critical vulnerabilities allowed
- Documentation standards: Complete and accurate

### Performance Gate
- Response time: Meets or exceeds targets
- Resource usage: Efficient and optimized
- Error rate: <1% under normal conditions
- User satisfaction: Positive experience confirmed

## Usage

### Standalone Validation
```
/cmd-builder:06-validate [tool-test-results-json]
```

### As Part of Chain
This command receives tool test results from step 05 and outputs validation results for step 07 (optimization).

## Success Criteria

- Comprehensive standards assessment completed
- All critical requirements satisfied
- Major compliance issues identified and prioritized
- Security posture validated and acceptable
- Documentation quality confirmed
- Clear guidance for optimization phase
- Certification level determined

The validation phase ensures the command meets all necessary standards and is ready for optimization and enhancement phases.