# Patterns Directory

AI-native development patterns optimized for Claude Code integration. Each pattern is <50 lines for instant comprehension.

## Available Patterns

### 🚨 Error Handling
- `simple-error-handling.sh` - Structured logging with severity levels

### 🧪 Testing  
- `simple-test-runner.sh` - Universal test runner with project detection

### ✅ Quality Gates
- `quality-check.sh` - Multi-language quality validation

### 🔒 Security
- `security-basics.sh` - Secret detection and vulnerability scanning

### 🪝 Git Hooks
- `git-hooks-setup.sh` - Automated git workflow quality gates

### 📚 Documentation
- `docs-generator.sh` - Automated documentation generation

### ⚙️ Configuration
- `config-reader.sh` - Environment and JSON configuration handling

### 📊 Validation
- `project-validator.sh` - Project structure and health validation

### 🔧 Dependencies  
- `dependency-checker.sh` - Cross-platform dependency detection

### 📝 Logging
- `simple-logging.sh` - Structured logging utilities

## Quick Usage

```bash
# Source any pattern
source patterns/error-handling/simple-error-handling.sh

# Use pattern functions
log_info "Process starting..."
```

## Pattern Composition

```bash
# Combine patterns for workflows
source patterns/error-handling/simple-error-handling.sh
source patterns/testing/simple-test-runner.sh

log_info "Running tests..."
run_all_tests && log_info "✅ Tests passed"
```