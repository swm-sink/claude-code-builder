---
allowed-tools: Write
argument-hint: [name] or [greeting-target]
description: Simple greeting command demonstrating basic Claude Code patterns
category: examples
---

# Hello World Command

A friendly greeting command: **$ARGUMENTS**

## Simple Greeting

I'll create a personalized greeting for: $ARGUMENTS

### Input Validation
```
Target: $ARGUMENTS
Status: [Checking if input provided...]
```

### Generate Greeting
```
Processing greeting for: $ARGUMENTS
Personalizing message...
Adding friendly touch...
```

### Greeting Output

**🌟 Hello, $ARGUMENTS! 👋**

Welcome to Claude Code Builder! You've successfully created and used your first native Claude Code command.

### What You've Learned
- ✅ **YAML Frontmatter**: Command metadata and tool permissions
- ✅ **$ARGUMENTS Usage**: Dynamic parameter handling
- ✅ **Basic Structure**: Simple input → process → output pattern
- ✅ **Tool Integration**: Using Write tool for output
- ✅ **User Experience**: Clear, friendly feedback

### Next Steps
Try these commands next:
```bash
# Create a more complex command
/cmd-builder:chain-master "format-code --mode=standard"

# Create your first agent
/agent-builder:chain-master "helper-agent --mode=quick"

# Get help with chains
/chain-help "overview"
```

### Command Details
```yaml
command_info:
  name: hello-world
  purpose: demonstrate_basic_patterns
  complexity: minimal
  learning_value: high
  time_to_create: 2_minutes
  time_to_understand: 30_seconds
```

**🎉 Congratulations! You've mastered the basics of Claude Code Builder!**

This simple command demonstrates the foundation patterns that power more complex tools. Every command and agent follows these same core principles of elegant simplicity.