---
allowed-tools: Read
argument-hint: [chain-type] or [overview]
description: Get help with chain commands and workflows
category: utils
---

# Chain Help

Get help with Claude Code Builder chains and workflows: **$ARGUMENTS**

## Available Chains

### 🤖 Agent Builder Chain
**Purpose**: Create specialized Claude Code agents
**Duration**: 15-45 minutes depending on mode
**Output**: Production-ready agent with documentation

**Start**: `/agent-builder:chain-master "agent-type"`

**Steps Overview**:
1. Research current best practices
2. Design agent architecture  
3. Create prototype implementation
4. Test basic functionality
5. Test advanced scenarios
6. Validate against standards
7. Optimize for performance
8. Enhance with advanced features
9. Create comprehensive documentation
10. Finalize for production

### 🛠️ Command Builder Chain  
**Purpose**: Create custom Claude Code slash commands
**Duration**: 10-30 minutes depending on mode
**Output**: Ready-to-use command with documentation

**Start**: `/cmd-builder:chain-master "command-purpose"`

**Steps Overview**:
1. Analyze requirements and patterns
2. Design command interface
3. Create implementation
4. Test argument handling
5. Test tool permissions
6. Validate standards compliance
7. Optimize for simplicity
8. Add essential enhancements
9. Create minimal documentation
10. Package for distribution

## Chain Modes

### Quick Mode (⚡)
- **Time**: 10-15 minutes
- **Steps**: Essential steps only
- **Best for**: Simple tools, learning, prototyping

### Standard Mode (🎯)
- **Time**: 20-30 minutes  
- **Steps**: All steps with standard validation
- **Best for**: Production use, team sharing

### Excellence Mode (🏆)
- **Time**: 30-45 minutes
- **Steps**: All steps with enhanced validation
- **Best for**: Community sharing, critical tools

## Getting Help

### Chain-Specific Help

**Agent Builder Help**:
```
/agent-builder:chain-master --help
```

**Command Builder Help**:
```
/cmd-builder:chain-master --help
```

### Step-Specific Help

**Individual Step Help**:
```
/agent-builder:01-research --help
/cmd-builder:03-create --help
```

### Workflow Help

**Session Management**:
```
/session-start "project-name"    # Start tracking
/session-status "project-name"   # Check progress
/chain-help "overview"          # This help
```

## Common Workflows

### Creating Your First Agent
```bash
# Start session for organization
/session-start "my-first-agent"

# Choose quick mode for learning
/agent-builder:chain-master "code-reviewer --mode=quick"

# Follow the guided process
```

### Creating a Simple Command
```bash
# Start session
/session-start "format-command"

# Use minimal mode for simplicity
/cmd-builder:chain-master "format-code --mode=minimal"

# Follow the streamlined process
```

### Running Individual Steps
```bash
# Research phase only
/agent-builder:01-research "documentation-agent"

# Then design phase
/agent-builder:02-design [research-results]

# Continue as needed...
```

## Troubleshooting

### Chain Interruption
**Problem**: Chain was interrupted
**Solution**: Use session management to resume
```
/session-status "your-session"
# Follow suggested next command
```

### Step Failed
**Problem**: Individual step failed
**Solution**: Review error and retry or skip
```
# Check what went wrong
# Fix the issue
# Retry the step or continue to next
```

### Tool Permissions
**Problem**: Tool permission errors
**Solution**: Check CLAUDE.md configuration
```
# Ensure .env file is properly configured
# Check tool permissions in Claude Code settings
```

### Output Quality
**Problem**: Results don't meet expectations
**Solution**: Use higher quality mode or optimize manually
```
# Try standard or excellence mode
# Use optimization commands
/agent-builder:07-optimize [current-results]
```

## Best Practices

### Session Management
- Start sessions for organization
- Use descriptive session names
- Check status regularly
- Save important sessions

### Mode Selection
- **Learning**: Use Quick mode
- **Production**: Use Standard mode  
- **Community**: Use Excellence mode
- **Simple tools**: Use Minimal mode

### Chain Usage
- Read help before starting
- Follow suggested workflows
- Don't skip validation steps
- Test results thoroughly

## Quick Reference

### Essential Commands
```bash
# Start new work
/session-start "project-name"

# Build agent
/agent-builder:chain-master "agent-type"

# Build command  
/cmd-builder:chain-master "command-purpose"

# Check progress
/session-status "project-name"

# Get help
/chain-help "overview"
```

### Validation Specialists
```bash
# Available subagents for quality assurance
# - validator: Standards compliance
# - tester: Comprehensive testing  
# - optimizer: Performance and simplicity
```

## Support

### Documentation
- Each chain has integrated help
- Step-by-step guidance provided
- Examples included in commands

### Quality Assurance
- Built-in validation at each step
- Specialized subagents for testing
- Standards compliance checking

### Community
- Share results with team
- Contribute to community collections
- Learn from existing patterns

**🔗 Choose your chain and start building amazing Claude Code tools!**