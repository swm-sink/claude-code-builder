# Hello World Example

> **Your first Claude Code Builder command - learn the basics in 2 minutes**

## Overview

This example demonstrates the fundamental patterns of Claude Code Builder through the simplest possible command: a personalized greeting.

## What You'll Learn

- **YAML Frontmatter Structure**: Command metadata and permissions
- **$ARGUMENTS Parameter Handling**: Dynamic input processing
- **Basic Command Flow**: Input validation → processing → output
- **Tool Permissions**: Minimal security approach
- **User Experience Patterns**: Clear, friendly feedback

## Quick Start

### 1. Build the Command (2 minutes)
```bash
# Start a learning session
/session-start "hello-world-learning"

# Build using quick mode
/cmd-builder:chain-master "hello-world --mode=quick"
```

### 2. Use Your Command
```bash
# Try different greetings
/hello-world "World"
/hello-world "Claude Code Builder"
/hello-world "Your Name"
```

### 3. Study the Result
```bash
# Look at the generated command
cat .claude/commands/hello-world.md

# Understand the structure
# - YAML frontmatter (lines 1-6)
# - Command logic (lines 8+)
# - $ARGUMENTS usage throughout
```

## Generated Command Structure

```yaml
---
allowed-tools: Write
argument-hint: [name] or [greeting-target]
description: Simple greeting command demonstrating basic Claude Code patterns
category: examples
---

# Hello World Command

A friendly greeting command: **$ARGUMENTS**
# ... rest of implementation
```

## Key Learning Points

### 1. YAML Frontmatter
```yaml
allowed-tools: Write          # Minimal permissions
argument-hint: [name]         # User guidance
description: Brief purpose    # Clear explanation
category: examples           # Organization
```

### 2. Parameter Handling
```markdown
# $ARGUMENTS is the core parameter variable
# It contains whatever the user passes to the command
A friendly greeting command: **$ARGUMENTS**
```

### 3. Tool Usage
```markdown
# The Write tool permission allows output generation
# This enables creating files, documentation, responses
```

### 4. User Experience
```markdown
# Clear headings and structure
# Friendly, encouraging tone
# Educational value emphasized
# Next steps provided
```

## Progressive Learning Path

### After Hello World
1. **Format Code Command** - File operations and language detection
2. **Code Analyzer** - Complex logic and multiple tools
3. **Review Agent** - Domain expertise and structured feedback

### Build Variations
```bash
# Try different approaches
/cmd-builder:chain-master "goodbye-world --mode=quick"
/cmd-builder:chain-master "time-greeting --mode=standard"
/cmd-builder:chain-master "multilingual-hello --mode=standard"
```

## Real-World Applications

This hello-world pattern extends to:
- **Status Commands**: Show system state with friendly formatting
- **Welcome Wizards**: Onboard new users or team members
- **Documentation Generators**: Create personalized documentation
- **Notification Systems**: Send formatted messages or alerts

## Architecture Insights

### Simplicity First
- Single responsibility (just greetings)
- Minimal tool permissions (only Write)
- Clear parameter structure
- Immediate value delivery

### Extensibility
The pattern scales to complex commands:
```markdown
# Complex command pattern
command: **$ARGUMENTS**
validation: [check inputs]
processing: [main logic]
output: [structured results]
help: [guidance for next steps]
```

### Quality Standards
Even simple commands follow quality practices:
- Input validation
- Clear error handling
- Helpful user guidance
- Educational documentation

## Testing Your Understanding

Try building these variations:

### Exercise 1: Custom Greeting
```bash
/cmd-builder:chain-master "custom-greeting --mode=quick"
# Add time-of-day awareness
# Include emoji customization
# Add language options
```

### Exercise 2: Information Display
```bash
/cmd-builder:chain-master "system-info --mode=quick"
# Show system status
# Display in friendly format
# Include helpful tips
```

### Exercise 3: Team Welcome
```bash
/cmd-builder:chain-master "team-welcome --mode=standard"
# Onboard new team members
# Show project information
# Provide getting-started links
```

## Success Metrics

After completing this example, you should:

- ✅ Understand YAML frontmatter structure
- ✅ Know how to use $ARGUMENTS for parameters
- ✅ Grasp the basic command flow pattern
- ✅ Appreciate tool permission minimalism
- ✅ See the value of user-friendly output
- ✅ Feel confident building your next command

## Troubleshooting

### Command Not Found
```bash
# Ensure the command was created
ls .claude/commands/hello-world.md

# Copy to your Claude Code directory
cp .claude/commands/hello-world.md ~/.claude/commands/
```

### Permission Errors
```bash
# Check tool permissions in frontmatter
# Ensure only necessary tools are listed
# Write tool should be sufficient for this example
```

### Parameter Issues
```bash
# Test with and without parameters
/hello-world "test"
/hello-world
# Both should work gracefully
```

## Next Steps

### Immediate (Next 5 minutes)
- Try the command with different inputs
- Study the generated YAML frontmatter
- Understand the $ARGUMENTS usage pattern

### Short-term (Next 30 minutes)
- Build a variation using different tools
- Try standard mode for more features
- Create a simple file-processing command

### Long-term (Next hour)
- Build an agent using similar patterns
- Explore complex command examples
- Contribute your own example variations

---

**🎓 Congratulations! You've learned the foundation of Claude Code Builder.**

*This simple pattern powers everything from basic utilities to complex AI agents.*

**Ready for the next level?** Try the [Format Code Example](../format-code/) to learn file operations and language detection.