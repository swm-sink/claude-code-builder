---
allowed-tools: Read, Grep
description: Clarify agent intent and requirements with research-informed guidance
argument-hint: [agent-name] [--interactive] [--purpose "description"]
category: agent-builder
version: 1.0.0
---

# 🎯 AGENT INTENT CLARIFICATION

Building on research from previous phase. Using current best practices to guide intent clarification.

## Agent Definition Wizard

### Research Context Applied:
✅ Current best practices integrated
✅ Security requirements identified  
✅ Performance guidelines noted
✅ Domain-specific needs understood

## Step 1: Agent Purpose Refinement

**Initial Purpose:** $ARGUMENTS

Based on research findings, let's refine this:

### Purpose Analysis Questions:

1. **Primary Function** (choose one):
   a) 🔍 **Analysis** - Examine, review, assess
   b) 🛠️ **Generation** - Create, build, produce  
   c) 🔧 **Transformation** - Convert, modify, optimize
   d) 🚀 **Automation** - Execute, orchestrate, manage
   e) 🛡️ **Validation** - Test, verify, audit

   **Selection:** > [WAIT FOR USER INPUT]

2. **Scope** (choose complexity):
   a) **Simple** - Single task, minimal logic
   b) **Moderate** - Multi-step workflow
   c) **Complex** - Conditional logic, branching
   d) **Advanced** - Self-improving, adaptive

   **Selection:** > [WAIT FOR USER INPUT]

3. **Target Users**:
   a) **Developers** - Technical users, expects technical output
   b) **DevOps** - Operations focus, automation needs
   c) **Business** - Non-technical, simple interfaces
   d) **Mixed** - Multiple user types

   **Selection:** > [WAIT FOR USER INPUT]

## Step 2: Research-Informed Requirements

### Security Requirements (from research):
Based on 2024 best practices:
☐ Input validation required
☐ Output sanitization needed
☐ Secret handling considerations
☐ Permission restrictions
☐ Audit logging

**Apply security measures?** (y/n) > [WAIT FOR INPUT]

### Performance Requirements (from research):
Current standards expect:
☐ Response time < 2 seconds
☐ Memory usage < 100MB
☐ Graceful degradation
☐ Error recovery

**Apply performance standards?** (y/n) > [WAIT FOR INPUT]

## Step 3: Integration Requirements

### Claude Code Builder Patterns:
Available patterns for integration:
1. ✅ error-handling (always recommended)
2. ✅ logging (always recommended)  
3. ☐ testing/simple-test-runner
4. ☐ security/security-basics
5. ☐ quality-gates/quality-check
6. ☐ configuration/config-reader
7. ☐ dependencies/dependency-checker

**Select patterns** (numbers, comma-separated): > [WAIT FOR INPUT]

### External Integrations:
Does your agent need:
- **File system access?** (y/n) > [INPUT]
- **Network requests?** (y/n) > [INPUT]  
- **Git operations?** (y/n) > [INPUT]
- **Database access?** (y/n) > [INPUT]
- **API integrations?** (y/n) > [INPUT]

## Step 4: Intent Validation

### Generated Agent Profile:
```yaml
name: $AGENT_NAME
purpose: $REFINED_PURPOSE
function: $PRIMARY_FUNCTION
complexity: $SCOPE_LEVEL
target_users: $TARGET_USERS
security_level: $SECURITY_REQUIREMENTS
performance_tier: $PERFORMANCE_REQUIREMENTS
patterns: $SELECTED_PATTERNS
integrations: $EXTERNAL_INTEGRATIONS
```

### Validation Questions:
1. **Does this match your vision?** (y/n) > [INPUT]
2. **Missing any requirements?** > [INPUT]
3. **Over-engineered for needs?** (y/n) > [INPUT]

## Next Phase

Intent clarified and validated. 

**Continue to: /agent-builder/03-capabilities** with validated requirements.