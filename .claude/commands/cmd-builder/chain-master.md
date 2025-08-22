---
allowed-tools: Read, Write, WebSearch, WebFetch, Bash(cp:*), Task(subagent_type:tester), Task(subagent_type:validator), Task(subagent_type:optimizer)
argument-hint: [command-purpose] [--mode=quick|standard|minimal]
description: Complete 10-step command creation with elegant simplicity focus
category: cmd-builder
---

# 🛠️ Command Builder Chain Master

Create elegant, simple Claude Code commands using the comprehensive 10-step process.

**Building command: $ARGUMENTS**

## Chain Overview: Elegant Simplicity

I'll guide you through creating a command that embodies **minimum viable complexity**:

### 10-Step Process (Optimized for Simplicity)
1. **🔍 Analyze** - Understand requirements clearly
2. **📐 Design** - Plan simple, effective interface
3. **🛠️ Create** - Build minimal viable implementation
4. **🧪 Test Args** - Validate parameter handling
5. **🔧 Test Tools** - Verify tool permissions
6. **✅ Validate** - Ensure standards compliance
7. **⚡ Optimize** - Achieve elegant simplicity
8. **✨ Enhance** - Add only essential value
9. **📝 Document** - Create minimal, useful docs
10. **📦 Package** - Ready for immediate use

### Mode Selection (Optimized for Simplicity)

**Choose your approach:**

a) ⚡ **Quick Mode** (10 minutes) - Essential steps only
   - Steps: 1 → 2 → 3 → 7 → 10
   - Best for: Simple utilities, rapid prototyping

b) 🎯 **Standard Mode** (20 minutes) - Balanced approach
   - Steps: All 10 with efficiency focus
   - Best for: Production commands, team use

c) 🎨 **Minimal Mode** (15 minutes) - Maximum simplicity
   - Steps: All 10 with aggressive simplification
   - Best for: Ultra-simple commands, learning

**Your choice (a/b/c):** > [WAIT FOR USER INPUT]

## Chain Execution (Simplicity-Focused)

### Phase 1: Foundation (Steps 1-3)

**Step 1/10: Requirements Analysis**
Understanding what you need: $ARGUMENTS

Analyzing:
- Core purpose and value
- Essential functionality only
- Simple interface requirements
- Minimal complexity approach

/cmd-builder:01-analyze $ARGUMENTS

---

**Step 2/10: Simple Design**
Designing for elegant simplicity...

Creating:
- Clean, intuitive interface
- Minimal tool requirements
- Straightforward logic flow
- User-friendly experience

/cmd-builder:02-design [analysis-results]

---

**Step 3/10: Minimal Implementation**
Building the simplest effective version...

Implementing:
- Core functionality only
- Clean, readable code
- Essential error handling
- Immediate usability

/cmd-builder:03-create [design-spec]

---

### Phase 2: Validation (Steps 4-6)

**Step 4/10: Argument Testing**
Testing parameter handling...

Validating:
- $ARGUMENTS processing
- Input validation
- Error messages
- User experience

/cmd-builder:04-test-args [implementation-details]

---

**Step 5/10: Tool Testing**
Verifying tool permissions...

Checking:
- Minimal permissions work
- Security boundaries
- Integration quality
- Performance impact

/cmd-builder:05-test-tools [arg-test-results]

---

**Step 6/10: Standards Validation**
Ensuring Claude Code compliance...

Validating:
- Frontmatter correctness
- Best practices adherence
- Security standards
- Integration compatibility

/cmd-builder:06-validate [tool-test-results]

---

### Phase 3: Refinement (Steps 7-10)

**Step 7/10: Elegant Optimization**
Achieving maximum simplicity...

Optimizing:
- Remove unnecessary complexity
- Improve performance
- Enhance user experience
- Maintain functionality

/cmd-builder:07-optimize [validation-results]

---

**Step 8/10: Essential Enhancement**
Adding only valuable features...

Enhancing:
- Smart defaults
- Error recovery
- Essential feedback
- Quality improvements

/cmd-builder:08-enhance [optimization-results]

---

**Step 9/10: Minimal Documentation**
Creating essential documentation...

Documenting:
- Quick start guide
- Working examples
- Essential troubleshooting
- Integrated help

/cmd-builder:09-document [enhancement-results]

---

**Step 10/10: Ready-to-Use Package**
Packaging for immediate use...

Packaging:
- Self-contained command
- Simple installation
- Zero configuration
- Community-ready

/cmd-builder:10-package [documentation-results]

---

## Chain Progress Tracking

```
Command Builder Progress: $COMMAND_NAME

[▓▓▓▓▓▓▓▓▓▓] 100% Complete

✅ Phase 1: Foundation (Steps 1-3) - Requirements → Design → Implementation
✅ Phase 2: Validation (Steps 4-6) - Args → Tools → Standards  
✅ Phase 3: Refinement (Steps 7-10) - Optimize → Enhance → Document → Package
```

## Simplicity Quality Gates

- ✅ **Clarity Gate**: Purpose is immediately clear
- ✅ **Simplicity Gate**: Minimum viable complexity achieved
- ✅ **Usability Gate**: Easy to use and understand
- ✅ **Performance Gate**: Fast and efficient
- ✅ **Quality Gate**: Reliable and well-tested
- ✅ **Documentation Gate**: Essential info provided
- ✅ **Distribution Gate**: Ready to share and use

## Final Command Summary

```yaml
command_creation_complete:
  name: $COMMAND_NAME
  approach: elegant_simplicity
  complexity: minimal
  lines_of_code: <80
  
  quality_metrics:
    functionality: complete
    simplicity: elegant
    usability: excellent
    performance: optimized
    reliability: tested
    documentation: essential
    
  ready_to_use:
    installation: copy_one_file
    configuration: none_needed
    time_to_value: <30_seconds
    sharing: git_ready
```

## Command Location & Usage

**Command File**: `.claude/commands/$COMMAND_NAME.md`
**Package**: `commands/$COMMAND_NAME/`
**Usage**: Copy to your `.claude/commands/` and use immediately

### Instant Usage
```bash
# Copy and use
cp commands/[command-name]/[command-name].md ~/.claude/commands/
/[command-name] "your-input"
```

## Chain Results: Elegant Simplicity Achieved

🎉 **Command creation completed with elegant simplicity!**

Your command embodies:
- **Minimum Viable Complexity**: Does exactly what's needed, no more
- **Elegant Design**: Beautiful in its simplicity
- **Immediate Usability**: Works perfectly out of the box
- **Easy Sharing**: Ready for team and community use
- **Zero Configuration**: Copy file and use
- **Essential Documentation**: Quick start in 30 seconds

## Usage Patterns

### Quick Individual Steps
```bash
/cmd-builder:01-analyze "format-code"
/cmd-builder:07-optimize [results]
```

### Full Chain Execution
```bash
/cmd-builder:chain-master "format-code --mode=minimal"
```

### Resume from Any Step
```bash
/cmd-builder:05-test-tools [previous-results]
```

**🛠️ Your elegantly simple command is ready to enhance workflows!**

The command builder creates tools that are powerful in their simplicity, immediate in their usability, and beautiful in their elegant design.