# Quick Start: Claude Code Builder Native Edition ⚡

> **Get started with native Claude Code patterns in under 5 minutes**

## 🚀 Instant Setup

### Prerequisites
- Claude Code CLI installed
- Basic familiarity with slash commands

### Zero-Configuration Start
```bash
# 1. Copy the repository patterns
git clone https://github.com/swm-sink/claude-code-builder.git
cd claude-code-builder

# 2. Copy commands to your Claude Code directory
cp -r .claude/commands/* ~/.claude/commands/
cp -r .claude/agents/* ~/.claude/agents/

# 3. Start using immediately!
/chain-help "overview"
```

## 🎯 30-Second Examples

### Create Your First Command
```bash
# Start a session for organization
/session-start "my-first-command"

# Build a simple command (15 minutes)
/cmd-builder:chain-master "hello-world --mode=quick"

# Use your new command
/hello-world "Claude Code Builder"
```

### Create Your First Agent
```bash
# Start tracking your work
/session-start "my-first-agent"

# Build a code reviewer agent (20 minutes)
/agent-builder:chain-master "code-reviewer --mode=standard"

# Use via subagent calls
/task "Review this code for best practices" --subagent-type=code-reviewer
```

## 🛠️ Core Patterns

### 1. Session Management
```bash
# Always start with a session
/session-start "project-name"

# Check your progress
/session-status "project-name"

# Get help anytime
/chain-help "overview"
```

### 2. Command Building (10 Steps)
```bash
# Full chain execution
/cmd-builder:chain-master "format-code --mode=standard"

# Individual steps
/cmd-builder:01-analyze "format-code"
/cmd-builder:02-design [analysis-results]
# ... continue chain
```

### 3. Agent Building (10 Steps)
```bash
# Full chain execution  
/agent-builder:chain-master "documentation-generator --mode=standard"

# Individual steps
/agent-builder:01-research "documentation-generator"
/agent-builder:02-design [research-results]
# ... continue chain
```

## 🎨 Quality Modes

### Quick Mode (⚡ 10-15 min)
- **Best for**: Learning, prototyping, simple tools
- **Steps**: Essential validation only
- **Output**: Working but basic implementation

### Standard Mode (🎯 20-30 min)
- **Best for**: Production use, team sharing
- **Steps**: Complete validation pipeline
- **Output**: Professional-quality tools

### Excellence Mode (🏆 30-45 min)
- **Best for**: Community sharing, critical tools
- **Steps**: Enhanced quality assurance
- **Output**: Showcase-quality implementations

### Minimal Mode (🎨 15 min)
- **Best for**: Ultra-simple commands, teaching
- **Steps**: Maximum simplicity focus
- **Output**: Elegantly minimal solutions

## 🔧 Real-World Examples

### Example 1: Format Code Command
```bash
# Goal: Create a command that formats code files
/session-start "format-command"
/cmd-builder:chain-master "format-code --mode=standard"

# Result: /format-code "file.js" 
# - Detects language automatically
# - Uses appropriate formatter
# - Handles errors gracefully
```

### Example 2: Code Review Agent
```bash
# Goal: Create an agent that reviews code for best practices
/session-start "review-agent"
/agent-builder:chain-master "code-reviewer --mode=excellence"

# Result: Subagent available for:
# - Best practice validation
# - Security issue detection
# - Performance optimization suggestions
```

### Example 3: Documentation Generator
```bash
# Goal: Auto-generate project documentation
/session-start "docs-generator"
/cmd-builder:chain-master "generate-docs --mode=standard"

# Result: /generate-docs
# - Scans codebase
# - Generates README sections
# - Creates API documentation
```

## 📊 Workflow Patterns

### Development Workflow
```bash
# 1. Plan your tool
/session-start "new-feature-tool"

# 2. Build with quality
/cmd-builder:chain-master "feature-tool --mode=standard"

# 3. Validate thoroughly
# (Built into the chain process)

# 4. Use immediately
/feature-tool "parameters"
```

### Learning Workflow
```bash
# 1. Start simple
/session-start "learning-session"

# 2. Quick build to understand
/cmd-builder:chain-master "simple-tool --mode=quick"

# 3. Study the output
# Review generated command structure

# 4. Try variations
/cmd-builder:01-analyze "different-tool"
```

### Team Workflow
```bash
# 1. Collaborative planning
/session-start "team-tool-project"

# 2. Standard quality build
/agent-builder:chain-master "team-agent --mode=standard"

# 3. Share results
# Copy .claude/agents/team-agent.md to team repo

# 4. Team uses consistently
# Everyone has the same agent available
```

## 🔍 Troubleshooting

### Common Issues

#### "Command not found"
```bash
# Check if commands are copied correctly
ls ~/.claude/commands/cmd-builder/

# Recopy if needed
cp -r .claude/commands/* ~/.claude/commands/
```

#### "Session not tracking"
```bash
# Check session directory exists
ls ~/.claude/sessions/

# Create if missing
mkdir -p ~/.claude/sessions/

# Start new session
/session-start "new-session"
```

#### "Chain step failed"
```bash
# Check session status
/session-status "your-session"

# Resume from last working step
/cmd-builder:05-test-tools [previous-results]
```

### Getting Help

#### Built-in Help
```bash
# Overall guidance
/chain-help "overview"

# Specific chain help
/cmd-builder:chain-master --help
/agent-builder:chain-master --help

# Individual step help
/cmd-builder:01-analyze --help
```

#### Session Recovery
```bash
# If chain was interrupted
/session-status "interrupted-session"

# Follow suggested next command
# Sessions remember where you left off
```

## 🎓 Learning Path

### Beginner (First 30 minutes)
1. **Setup**: Copy commands and agents
2. **First Command**: Use quick mode
3. **First Agent**: Try simple reviewer
4. **Session Management**: Learn to track work

### Intermediate (After first hour)
1. **Standard Builds**: Use standard mode consistently
2. **Individual Steps**: Learn step-by-step building
3. **Quality Focus**: Understand validation stages
4. **Customization**: Modify chains for specific needs

### Advanced (After first day)
1. **Excellence Mode**: Build community-ready tools
2. **Chain Composition**: Combine patterns effectively
3. **Team Integration**: Share and collaborate
4. **Community Contribution**: Create new patterns

## 🌟 Best Practices

### Planning
- Always start with a session
- Choose appropriate quality mode
- Understand requirements clearly
- Plan for team sharing if relevant

### Building
- Trust the chain process
- Don't skip validation steps
- Focus on elegant simplicity
- Test thoroughly at each stage

### Sharing
- Use standard or excellence mode
- Include clear documentation
- Test in clean environment
- Follow naming conventions

### Maintenance
- Keep sessions organized
- Update patterns regularly
- Learn from community examples
- Contribute improvements back

## ⚡ Speed Tips

### Fastest Path to Value
```bash
# 1. Copy setup (1 minute)
cp -r .claude/* ~/.claude/

# 2. Quick command (15 minutes)
/cmd-builder:chain-master "my-tool --mode=quick"

# 3. Use immediately
/my-tool "test"
```

### Production-Ready Path
```bash
# 1. Plan session (2 minutes)
/session-start "production-tool"

# 2. Standard build (25 minutes)
/cmd-builder:chain-master "production-tool --mode=standard"

# 3. Share with team
# Copy command file to team repository
```

### Learning Path
```bash
# 1. Overview (5 minutes)
/chain-help "overview"

# 2. Simple example (15 minutes)
/cmd-builder:chain-master "hello --mode=quick"

# 3. Understand structure
# Study generated files

# 4. Try variations
# Experiment with different modes
```

## 🎯 Success Metrics

After following this guide, you should be able to:

- ✅ Create working commands in under 20 minutes
- ✅ Build specialized agents for your workflow
- ✅ Manage development sessions effectively
- ✅ Share tools with team members
- ✅ Understand the chain validation process
- ✅ Choose appropriate quality modes
- ✅ Troubleshoot common issues
- ✅ Contribute to pattern improvements

## 🚀 Next Steps

### Immediate (Next 5 minutes)
- Try your first quick command build
- Explore the session management
- Read through CLAUDE_v2.md for deeper understanding

### Short-term (Next hour)
- Build a command for your actual workflow
- Try creating a simple agent
- Share a tool with a teammate

### Long-term (Next week)
- Create excellence-mode tools for community
- Contribute pattern improvements
- Build your team's standard toolkit

---

**🎉 Welcome to native Claude Code development! Build amazing tools with elegant simplicity.**

*For comprehensive documentation, see `CLAUDE_v2.md`*  
*For technical details, explore the `.claude/` directory*  
*For community patterns, visit the GitHub repository*