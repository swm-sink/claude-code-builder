# Claude Code Builder Examples 📚

> **Real-world examples of native Claude Code patterns in action**

## 🎯 Example Categories

### Basic Commands
Simple, single-purpose commands demonstrating core patterns:
- `hello-world` - Your first command
- `format-code` - File formatting utility  
- `count-lines` - Code analysis tool

### Advanced Commands  
Complex commands with multiple features:
- `project-analyzer` - Comprehensive project analysis
- `test-runner` - Smart test execution
- `code-generator` - Template-based code generation

### Specialized Agents
Domain-specific agents for specialized tasks:
- `code-reviewer` - Code quality and best practices
- `documentation-generator` - Auto-documentation creation
- `security-scanner` - Security vulnerability detection

## 🚀 Quick Start Examples

### Example 1: Hello World Command (2 minutes)

```bash
# Start session
/session-start "hello-world-example"

# Build command (quick mode)
/cmd-builder:chain-master "hello-world --mode=quick"

# Use your new command
/hello-world "Claude Code Builder"
```

### Example 2: Code Review Agent (25 minutes)

```bash  
# Start session
/session-start "code-reviewer-example"

# Build with excellence quality
/agent-builder:chain-master "code-reviewer --mode=excellence"

# Use via subagent
/task "Review this code" --subagent-type=code-reviewer
```

## 📖 Example Patterns

### Command Pattern
```yaml
---
allowed-tools: Read, Write
argument-hint: [input]
description: Simple utility function
---

# Process input: $ARGUMENTS
# - Validate input
# - Perform operation  
# - Return result
```

### Agent Pattern
```yaml
---
name: analyzer
description: Analyzes code for patterns
tools: Read, WebSearch, Write
---

You are a specialized analysis agent focused on:
- Pattern recognition
- Issue identification  
- Improvement recommendations
```

## 🔧 Building Examples

1. **Plan**: Choose utility, processor, or agent type
2. **Build**: Use appropriate chain and quality mode
3. **Document**: Create clear usage examples
4. **Share**: Add to examples collection

---

**🎉 Start exploring and building your own examples!**