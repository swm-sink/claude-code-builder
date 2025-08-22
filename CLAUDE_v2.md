# CLAUDE.md - Claude Code Builder Native Guide 🚀

> **Native Claude Code patterns for elegant agent and command creation**

## 🎯 Native Claude Code Architecture

**Philosophy**: Leverage Claude Code's built-in features for maximum elegance and simplicity.

### Core Native Features
- **Subagents** (`.claude/agents/`): Specialized AI assistants with isolated context
- **Slash Commands** (`.claude/commands/`): Reusable prompt templates with $ARGUMENTS
- **CLAUDE.md**: Project context and guidance
- **$ARGUMENTS**: Dynamic parameter passing between commands
- **Native Tools**: Read, Write, Bash, WebSearch, WebFetch
- **Hooks**: Automated validation and workflow triggers

## 🚀 Native Builder Chains

### Agent Builder Chain
**Location**: `.claude/commands/agent-builder/`
**Purpose**: Create production-ready Claude Code agents
**Usage**: `/agent-builder:chain-master "agent-type"`

**10-Step Process**:
1. **Research** - Current best practices and patterns
2. **Design** - Architecture and specifications
3. **Prototype** - Initial implementation
4. **Test Basic** - Core functionality validation
5. **Test Advanced** - Edge cases and stress testing
6. **Validate** - Standards compliance verification
7. **Optimize** - Performance and efficiency improvements
8. **Enhance** - Advanced features and capabilities
9. **Document** - Comprehensive documentation creation
10. **Finalize** - Production packaging and deployment

### Command Builder Chain
**Location**: `.claude/commands/cmd-builder/`
**Purpose**: Create elegant slash commands
**Usage**: `/cmd-builder:chain-master "command-purpose"`

**10-Step Process**:
1. **Analyze** - Requirements and pattern research
2. **Design** - Interface and architecture
3. **Create** - Minimal viable implementation
4. **Test Args** - Parameter handling validation
5. **Test Tools** - Permission and usage verification
6. **Validate** - Standards and security compliance
7. **Optimize** - Elegant simplicity achievement
8. **Enhance** - Essential value additions
9. **Document** - Minimal essential documentation
10. **Package** - Ready-to-use distribution

## 🎛️ Native Validation System

### Specialized Subagents
**Location**: `.claude/agents/`

- **validator.md**: Standards compliance and best practices validation
- **tester.md**: Comprehensive functionality and edge case testing
- **optimizer.md**: Performance optimization and simplicity enhancement

### Quality Gates
- **Research Gate**: Current best practices integrated
- **Standards Gate**: Claude Code compliance verified
- **Performance Gate**: Optimization improvements applied
- **Simplicity Gate**: Elegant simplicity achieved

## 🔧 Native Tools Integration

### Tool Permission Philosophy
**Principle**: Least privilege with security-first approach

**Standard Patterns**:
```yaml
# Minimal permissions
allowed-tools: Read, Write

# Specific bash commands
allowed-tools: Bash(git:*), Bash(test:*)

# Research capabilities
allowed-tools: WebSearch, WebFetch

# Validation with subagents
allowed-tools: Task(subagent_type:validator)
```

### $ARGUMENTS Usage Patterns

**Simple Parameter Passing**:
```markdown
# Basic usage
/command-name "parameter"
# $ARGUMENTS = "parameter"

# Multiple parameters
/command-name "param1" "param2"
# $ARGUMENTS = "param1" "param2"
```

**Chain Context Passing**:
```markdown
# Step 1 outputs JSON
{"result": "data", "next_step": "requirements"}

# Step 2 receives via $ARGUMENTS
# Parse and process the JSON context
```

## 🎨 Elegant Simplicity Principles

### Design Philosophy
- **Minimum Viable Complexity**: Do exactly what's needed, no more
- **Native First**: Use Claude Code features before custom solutions
- **Copy and Go**: Works immediately after copying
- **Zero Configuration**: No setup required

### Code Quality Standards
- **<50 lines per function**: Optimized for AI comprehension
- **<100 lines per command**: Maintain readability and focus
- **Clear naming**: Intuitive function and variable names
- **Essential documentation**: Quick start in <60 seconds

### User Experience Focus
- **30-second value**: Users see benefits immediately
- **Self-contained**: Everything needed is included
- **Error recovery**: Clear guidance when things go wrong
- **Progressive disclosure**: Basic → advanced information flow

## 🔗 Native Chain Orchestration

### Session Management
**Location**: `.claude/commands/utils/`

- **session-start.md**: Initialize workflow tracking
- **session-status.md**: Check progress and resume capability
- **chain-help.md**: Comprehensive guidance system

### Chain Modes
- **Quick Mode**: Essential steps only (10-15 minutes)
- **Standard Mode**: Full validation (20-30 minutes)
- **Excellence Mode**: Enhanced quality assurance (30-45 minutes)
- **Minimal Mode**: Maximum simplicity focus (15 minutes)

## 📦 Native Distribution

### Package Structure
```
command-name/
├── command-name.md    # Native Claude Code command
├── README.md          # Essential documentation
└── metadata.json      # Package information
```

### Installation
```bash
# Copy to Claude Code commands directory
cp command-name.md ~/.claude/commands/

# Use immediately
/command-name "example"
```

## 🔄 Native Workflow Patterns

### Agent Creation Workflow
```bash
# Start session for tracking
/session-start "my-agent-project"

# Create agent with validation
/agent-builder:chain-master "code-reviewer --mode=standard"

# Result: Production-ready agent in .claude/agents/
```

### Command Creation Workflow
```bash
# Start session
/session-start "format-command"

# Create command with simplicity focus
/cmd-builder:chain-master "format-code --mode=minimal"

# Result: Ready-to-use command in .claude/commands/
```

### Individual Step Usage
```bash
# Research phase only
/agent-builder:01-research "documentation-agent"

# Design phase with results
/agent-builder:02-design [research-results]

# Continue chain or skip to specific steps
```

## 🛡️ Native Security Model

### Security Principles
- **Principle of Least Privilege**: Minimal required permissions
- **Input Validation**: Comprehensive parameter checking
- **Safe Defaults**: Secure behaviors by default
- **Output Sanitization**: Clean, safe output generation

### PAT Integration
```bash
# Source environment for GitHub operations
source .env
echo "Using PAT: ${GITHUB_TOKEN:0:8}..."
git remote set-url origin https://${GITHUB_TOKEN}@github.com/swm-sink/claude-code-builder.git
```

## 📖 Native Documentation

### Built-in Help System
Every command includes:
- Integrated help via `--help`
- Usage examples and patterns
- Error recovery guidance
- Progressive disclosure of complexity

### Community Sharing
- **Git-ready**: Standard repository structure
- **Self-contained**: No external dependencies
- **Documentation**: Essential information included
- **Examples**: Working code demonstrations

## 🎓 Learning Path

### Beginner
1. Start with `/chain-help "overview"`
2. Create first command: `/cmd-builder:chain-master "hello-world --mode=quick"`
3. Learn session management: `/session-start` and `/session-status`

### Intermediate
1. Create agent: `/agent-builder:chain-master "code-reviewer --mode=standard"`
2. Use individual steps for customization
3. Explore optimization and enhancement phases

### Advanced
1. Use excellence mode for community-ready tools
2. Contribute patterns to community collections
3. Create custom validation and optimization approaches

## 🚀 Next-Generation Features

### Native AI Integration
- **Context-Aware Defaults**: Smart parameter suggestions
- **Intelligent Error Recovery**: AI-powered troubleshooting
- **Adaptive Optimization**: Performance tuning based on usage
- **Community Learning**: Patterns that improve over time

### Ecosystem Integration
- **MCP Compatibility**: Model Context Protocol support
- **Cross-Platform**: Works on macOS, Linux, Windows
- **IDE Integration**: VS Code, JetBrains compatibility
- **CI/CD Ready**: GitHub Actions and automation support

---

**Claude Code Builder Version**: 2.0 Native  
**Native Compatibility**: Claude Code 1.0+  
**Update Frequency**: Continuous improvement  
**Community**: Open source and extensible