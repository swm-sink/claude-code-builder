---
allowed-tools: Read, Write, WebSearch, WebFetch, Bash(git:*), Task(subagent_type:tester), Task(subagent_type:validator), Task(subagent_type:optimizer)
argument-hint: [agent-type] [--mode=quick|standard|excellence]
description: Complete 10-step agent creation with comprehensive validation
category: agent-builder
---

# 🚀 Agent Builder Chain Master

Create a complete, production-ready Claude Code agent using the comprehensive 10-step validation chain.

**Building agent: $ARGUMENTS**

## Chain Overview

I'll guide you through the complete agent creation process with research-backed validation:

### 10-Step Process
1. **🔬 Research** - Current best practices and patterns
2. **📐 Design** - Architecture and specifications  
3. **🛠️ Prototype** - Initial implementation
4. **✅ Test Basic** - Core functionality validation
5. **🧪 Test Advanced** - Edge cases and stress testing
6. **🎯 Validate** - Standards compliance verification
7. **⚡ Optimize** - Performance and efficiency improvements
8. **🚀 Enhance** - Advanced features and capabilities
9. **📚 Document** - Comprehensive documentation creation
10. **🎉 Finalize** - Production packaging and deployment

### Mode Selection

**Choose your build mode:**

a) 🏃 **Quick Mode** (15 minutes) - Essential steps only
   - Steps: 1 → 2 → 3 → 4 → 9 → 10
   - Best for: Simple agents, prototyping, learning

b) 🎯 **Standard Mode** (30 minutes) - Comprehensive validation
   - Steps: All 10 steps with standard validation
   - Best for: Production agents, team use

c) 🏆 **Excellence Mode** (45 minutes) - Maximum quality assurance
   - Steps: All 10 steps with enhanced validation
   - Best for: Critical agents, community sharing

**Your choice (a/b/c):** > [WAIT FOR USER INPUT]

## Chain Execution

### Phase 1: Research & Design (Steps 1-2)

**Step 1/10: Research Phase**
Researching current best practices for: $ARGUMENTS

I'll search for:
- 2024-2025 agent development patterns
- Claude Code integration best practices
- Domain-specific requirements
- Community examples and patterns

/agent-builder:01-research $ARGUMENTS

---

**Step 2/10: Design Phase** 
Designing architecture based on research findings...

Creating comprehensive design specification:
- Agent identity and capabilities
- Technical requirements
- Integration patterns
- Performance targets

/agent-builder:02-design [research-results]

---

### Phase 2: Implementation & Basic Testing (Steps 3-4)

**Step 3/10: Prototype Phase**
Creating working prototype from design...

Implementing:
- YAML frontmatter structure
- System prompt optimization
- Core functionality
- Integration patterns

/agent-builder:03-prototype [design-spec]

---

**Step 4/10: Basic Testing Phase**
Testing core functionality...

Validating:
- File structure correctness
- Basic functionality
- Tool permissions
- Input/output handling

/agent-builder:04-test-basic [prototype-info]

---

### Phase 3: Advanced Validation (Steps 5-6)

**Step 5/10: Advanced Testing Phase**
Testing edge cases and error handling...

Comprehensive testing:
- Edge case scenarios
- Error recovery
- Performance stress testing
- Security validation

/agent-builder:05-test-advanced [basic-test-results]

---

**Step 6/10: Validation Phase**
Validating against Claude Code standards...

Standards compliance:
- Claude Code requirements
- Industry best practices
- Security standards
- Integration compatibility

/agent-builder:06-validate [advanced-test-results]

---

### Phase 4: Optimization & Enhancement (Steps 7-8)

**Step 7/10: Optimization Phase**
Optimizing performance and efficiency...

Improvements:
- Token efficiency optimization
- Response time improvement
- User experience enhancement
- Integration optimization

/agent-builder:07-optimize [validation-results]

---

**Step 8/10: Enhancement Phase**
Adding advanced features...

Enhancements:
- Intelligence improvements
- Capability expansion
- User experience upgrades
- Integration enhancements

/agent-builder:08-enhance [optimization-results]

---

### Phase 5: Documentation & Finalization (Steps 9-10)

**Step 9/10: Documentation Phase**
Creating comprehensive documentation...

Documentation:
- User guide and quick reference
- API reference and examples
- Troubleshooting guide
- Integration documentation

/agent-builder:09-document [enhancement-results]

---

**Step 10/10: Finalization Phase**
Finalizing for production deployment...

Final preparation:
- Production packaging
- Git integration
- Release preparation
- Deployment verification

/agent-builder:10-finalize [documentation-results]

---

## Chain Progress Tracking

```
Agent Builder Progress: $AGENT_NAME

[▓▓▓▓▓▓▓▓▓▓] 100% Complete

✅ Phase 1: Research & Design (Steps 1-2)
✅ Phase 2: Implementation & Testing (Steps 3-4) 
✅ Phase 3: Advanced Validation (Steps 5-6)
✅ Phase 4: Optimization & Enhancement (Steps 7-8)
✅ Phase 5: Documentation & Finalization (Steps 9-10)
```

## Quality Gates Achieved

- ✅ **Research Gate**: Current best practices integrated
- ✅ **Design Gate**: Comprehensive architecture created
- ✅ **Implementation Gate**: Working prototype built
- ✅ **Testing Gate**: Functionality and edge cases validated
- ✅ **Standards Gate**: Claude Code compliance verified
- ✅ **Performance Gate**: Optimization improvements applied
- ✅ **Feature Gate**: Advanced capabilities implemented
- ✅ **Documentation Gate**: Complete documentation created
- ✅ **Production Gate**: Deployment-ready package prepared

## Final Agent Summary

```yaml
agent_creation_complete:
  name: $AGENT_NAME
  version: 1.0.0
  build_mode: $SELECTED_MODE
  total_time: $TOTAL_DURATION
  
  quality_metrics:
    research_score: excellent
    design_quality: comprehensive
    implementation_score: X/100
    test_coverage: X%
    validation_score: X/100
    optimization_improvement: +X%
    enhancement_features: X added
    documentation_completeness: 100%
    
  production_readiness:
    functionality: ✅ verified
    performance: ✅ optimized
    security: ✅ validated
    integration: ✅ compatible
    documentation: ✅ complete
    deployment: ✅ ready
```

## Agent Location & Usage

**Agent File**: `.claude/agents/$AGENT_NAME.md`
**Documentation**: `docs/agents/$AGENT_NAME/`
**Usage**: Agent is ready for immediate use

### Quick Start
```bash
# The agent is now available for use
# It will be automatically recognized by Claude Code
# Usage depends on the specific agent created
```

## Chain Results

🎉 **Agent creation completed successfully!**

Your agent has been built using research-backed best practices with comprehensive validation:

- **Research-Validated**: Built using 2024-2025 best practices
- **Thoroughly Tested**: Comprehensive testing across all scenarios
- **Standards Compliant**: Meets all Claude Code requirements
- **Performance Optimized**: Enhanced for efficiency and speed
- **Feature Rich**: Advanced capabilities implemented
- **Well Documented**: Complete documentation package
- **Production Ready**: Fully prepared for deployment

The agent is ready for immediate use and can be shared with your team or the community.

## Usage Modes

### Individual Step Execution
You can also run individual steps:
```bash
/agent-builder:01-research "code-reviewer"
/agent-builder:02-design [research-results]
# ... continue as needed
```

### Resume Chain
If interrupted, resume from any step:
```bash
/agent-builder:05-test-advanced [previous-results]
```

### Custom Validation
Run specific validation:
```bash
/agent-builder:06-validate [agent-name]
```

**🚀 Your agent is ready to enhance your Claude Code workflow!**