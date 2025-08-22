---
allowed-tools: Read, Task(subagent_type:validator), WebSearch
argument-hint: [advanced-test-results-json] or [agent-name]
description: Validate agent against Claude Code standards and best practices
category: agent-builder
---

# Agent Validation Phase

Validate agent against Claude Code standards and best practices: **$ARGUMENTS**

## Validation Process

I'll conduct comprehensive validation to ensure the agent meets all Claude Code standards and industry best practices:

### 1. Parse Test Results
Review advanced test results to understand:
- Current agent performance
- Identified issues and strengths
- Areas requiring validation focus
- Performance and security baselines

### 2. Standards Compliance Validation

#### Claude Code Standards
Validate against official Claude Code requirements:

**Frontmatter Compliance**
- YAML structure correctness
- Required field presence (name, description)
- Tool permission appropriateness
- Metadata completeness

**File Structure Standards**
- Proper markdown formatting
- Clear section organization
- Consistent styling
- Documentation quality

**Integration Requirements**
- Native feature utilization
- Ecosystem compatibility
- Standard pattern compliance
- Chain-friendly design

#### Industry Best Practices
Validate against current industry standards:

**Prompt Engineering Standards**
- Clear role definition
- Effective instruction structure
- Appropriate specificity level
- Token efficiency optimization

**Security Best Practices**
- Least privilege principle
- Input validation awareness
- Safe default behaviors
- Privacy protection measures

**Performance Standards**
- Response time optimization
- Resource efficiency
- Scalability considerations
- Error handling robustness

### 3. Architecture Validation

#### Design Consistency
```
Validation: Design specification adherence
Check: Implementation matches original design
Standard: 95%+ specification compliance
```

#### Single Responsibility
```
Validation: Purpose focus assessment
Check: Agent maintains single, clear purpose
Standard: No scope creep or responsibility overlap
```

#### Maintainability
```
Validation: Code quality and maintainability
Check: Clear, readable, well-structured
Standard: Easy to understand and modify
```

### 4. Functional Validation

#### Capability Assessment
```
Validation: Claimed vs actual capabilities
Check: Agent delivers on promised functionality
Standard: 100% core capability delivery
```

#### Output Quality
```
Validation: Output consistency and quality
Check: Responses are helpful, accurate, appropriate
Standard: High-quality outputs in all scenarios
```

#### Error Behavior
```
Validation: Error handling appropriateness
Check: Graceful failure and recovery
Standard: No unexpected failures or poor UX
```

### 5. Security Validation

#### Permission Appropriateness
```
Validation: Tool permission necessity
Check: No excessive or unnecessary permissions
Standard: Minimal required permissions only
```

#### Input Safety
```
Validation: Input handling security
Check: Proper validation and sanitization
Standard: Resistant to injection and abuse
```

#### Data Protection
```
Validation: Privacy and data handling
Check: Appropriate data protection measures
Standard: No unauthorized data exposure
```

## Validation Execution

I'll use the specialized validator subagent for comprehensive standards validation:

**Activating validation specialist for comprehensive compliance checking...**

The validator will assess:
- Structure and format compliance
- Content quality and appropriateness
- Security posture and safety
- Performance characteristics
- Integration compatibility

## Validation Report Format

```json
{
  "validation_phase": "standards_compliance",
  "agent_validated": "[agent-name]",
  "validation_timestamp": "2025-01-XX",
  "validation_summary": {
    "overall_score": "X/100",
    "compliance_status": "compliant/needs_improvement/non_compliant",
    "critical_issues": 0,
    "major_issues": 0,
    "minor_issues": 0,
    "recommendations": 0
  },
  "standards_validation": {
    "claude_code_compliance": {
      "score": "X/100",
      "status": "✅/⚠️/❌",
      "frontmatter": "compliant/issues_found",
      "structure": "compliant/issues_found",
      "integration": "compliant/issues_found",
      "issues": []
    },
    "industry_best_practices": {
      "score": "X/100",
      "status": "✅/⚠️/❌",
      "prompt_engineering": "excellent/good/needs_work",
      "security": "secure/adequate/vulnerable",
      "performance": "optimized/adequate/poor",
      "issues": []
    }
  },
  "architecture_validation": {
    "design_consistency": {
      "score": "X/100",
      "status": "✅/⚠️/❌",
      "specification_compliance": "X%",
      "deviations": []
    },
    "single_responsibility": {
      "status": "✅/⚠️/❌",
      "focus_assessment": "focused/moderate/scattered",
      "scope_creep": "none/minor/major"
    },
    "maintainability": {
      "score": "X/100",
      "status": "✅/⚠️/❌",
      "readability": "excellent/good/poor",
      "structure": "clear/adequate/confusing"
    }
  },
  "functional_validation": {
    "capability_delivery": {
      "score": "X/100",
      "status": "✅/⚠️/❌",
      "promised_vs_actual": "X% match",
      "gaps": []
    },
    "output_quality": {
      "score": "X/100",
      "status": "✅/⚠️/❌",
      "consistency": "high/medium/low",
      "accuracy": "high/medium/low",
      "helpfulness": "high/medium/low"
    }
  },
  "security_validation": {
    "permission_assessment": {
      "status": "✅/⚠️/❌",
      "principle_compliance": "strict/adequate/excessive",
      "unnecessary_permissions": []
    },
    "input_safety": {
      "status": "✅/⚠️/❌",
      "validation_quality": "robust/adequate/weak",
      "vulnerabilities": []
    },
    "data_protection": {
      "status": "✅/⚠️/❌",
      "privacy_compliance": "strong/adequate/weak",
      "concerns": []
    }
  },
  "critical_findings": [],
  "major_recommendations": [],
  "minor_improvements": [],
  "certification_status": "certified/conditional/rejected",
  "next_phase_readiness": "ready/needs_work/not_ready"
}
```

## Validation Criteria

### Certification Levels
- **Certified (90-100)**: Fully compliant, production-ready
- **Conditional (70-89)**: Minor issues, ready with improvements
- **Rejected (<70)**: Major issues, requires significant work

### Critical Requirements (Must Pass)
- YAML frontmatter is valid and complete
- Core functionality works correctly
- No security vulnerabilities
- Meets basic Claude Code standards
- No data safety issues

### Major Requirements (Should Pass)
- Follows industry best practices
- Performance meets benchmarks
- Error handling is robust
- Documentation is complete
- Integration is seamless

### Minor Requirements (Nice to Have)
- Optimized for efficiency
- Excellent user experience
- Advanced features work well
- Comprehensive edge case handling

## Usage

### Standalone Validation
```
/agent-builder:06-validate [advanced-test-results-json]
```

### As Part of Chain
This command receives test results from step 05 and outputs validation results for step 07 (optimization).

## Success Criteria

- Comprehensive standards assessment complete
- All critical requirements met
- Major issues identified and prioritized
- Clear path to certification established
- Ready for optimization phase

The validation phase ensures the agent meets all necessary standards before optimization and finalization.