# Examples Directory - AI Context Guide

> **Practical examples and templates demonstrating Claude Code Builder patterns in action**

## 📝 Examples Overview

This directory contains real-world examples demonstrating how to use Claude Code Builder patterns in various scenarios, from basic usage to advanced compositions.

## 🔗 Example Categories

### Basic Examples
- `basic-commands/` - Simple command examples
- `hello-world.sh` - Minimal pattern usage
- `error-handling-demo.sh` - Error handling examples
- `logging-examples.sh` - Logging pattern demonstrations

### Pattern Compositions
- `composition-examples.sh` - Pattern combination strategies
- `development-workflow.sh` - Complete dev workflow example
- `ci-cd-integration.sh` - CI/CD pipeline examples
- `security-workflow.sh` - Security-focused workflows

### Project Templates
- `nodejs-project/` - Node.js project template
- `python-project/` - Python project template
- `go-project/` - Go project template
- `multi-language/` - Multi-language project example

### Advanced Usage
- `custom-patterns/` - Creating custom patterns
- `agent-development/` - Claude Code agent examples
- `slash-commands/` - Custom slash command examples
- `automation-workflows/` - Complex automation examples

## 🎯 Example Principles

### Clarity
- Self-contained examples
- Clear documentation
- Progressive complexity
- Practical use cases

### Best Practices
- Follows all pattern guidelines
- Demonstrates proper error handling
- Shows testing integration
- Includes security considerations

### Learning Path
1. Start with basic examples
2. Progress to compositions
3. Explore project templates
4. Study advanced usage

## 🔄 Common Example Patterns

### Basic Pattern Usage
```bash
# Source pattern
source ../patterns/error-handling/simple-error-handling.sh

# Use pattern functions
log_info "Starting example"
log_error "Example error"
```

### Pattern Composition
```bash
# Load multiple patterns
source ../patterns/error-handling/simple-error-handling.sh
source ../patterns/testing/simple-test-runner.sh

# Compose functionality
log_info "Running tests"
run_all_tests || handle_error $LINENO
```

### Project Integration
```bash
# Complete project setup
./examples/nodejs-project/setup.sh
./examples/nodejs-project/run-tests.sh
./examples/nodejs-project/deploy.sh
```

## 📖 Additional Resources

- @file README.md - Examples documentation
- @file ../CLAUDE.md - Main project context
- @file ../patterns/CLAUDE.md - Pattern library
- @file ../docs/CLAUDE.md - Documentation hub

## 🤖 AI Assistant Guidelines

When working with examples:
1. **Start simple** - Begin with basic examples
2. **Explain concepts** - Clarify what examples demonstrate
3. **Show progression** - Guide through increasing complexity
4. **Encourage experimentation** - Help users modify examples

## Example Types

### 🎓 Learning Examples
Simple demonstrations for understanding patterns.

### 🔧 Integration Examples
Shows how to integrate with existing projects.

### 📦 Template Examples
Complete project templates ready to use.

### 🚀 Advanced Examples
Complex scenarios and custom implementations.

---

**Context Type**: Examples Hub  
**Purpose**: Practical demonstrations and templates  
**Learning Path**: Basic → Composition → Templates → Advanced