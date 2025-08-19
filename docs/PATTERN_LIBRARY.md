# Claude Code Builder Pattern Library

> Complete catalog of reusable bash patterns designed for Claude AI comprehension and developer productivity

## Overview

The Claude Code Builder pattern library consists of 10 carefully crafted bash patterns, each designed to be:
- **Concise**: Under 50 lines of code
- **Readable**: Optimized for Claude AI understanding
- **Composable**: Can be combined with other patterns
- **Educational**: Includes Technical/Simple/Connection explanations

## Pattern Catalog

### 🔧 Core Infrastructure Patterns

#### 1. Logging Pattern
**File:** `patterns/logging/simple-logging.sh`  
**Size:** 50 lines  
**Claude Readability Score:** 75/100 (Excellent)

**Purpose:** Standardized logging system with severity levels and color coding.

**Key Functions:**
- `log_info()` - Information messages
- `log_warn()` - Warning messages  
- `log_error()` - Error messages
- `log_debug()` - Debug messages (when DEBUG=1)
- `log_success()` - Success messages

**Features:**
- Color-coded output with emoji indicators
- Configurable color mode (`LOG_COLOR` environment variable)
- Conditional debug logging
- Proper stderr/stdout routing

**Usage Example:**
```bash
source patterns/logging/simple-logging.sh
log_info "Application starting"
log_warn "Configuration file not found"
LOG_COLOR=false log_error "Database connection failed"
```

**Best Practices:**
- Use `log_info` for status updates
- Use `log_warn` for recoverable issues
- Use `log_error` for serious problems
- Enable debug logging only in development

---

#### 2. Error Handling Pattern
**File:** `patterns/error-handling/simple-error-handling.sh`  
**Size:** 44 lines  
**Claude Readability Score:** 70/100 (Good)

**Purpose:** Structured error handling with context and graceful failure.

**Key Functions:**
- `handle_error()` - Exit with error context
- `check_command_exists()` - Check command availability
- `test_error_handling()` - Feature demonstration

**Features:**
- Line number tracking for error location
- Command existence validation
- Colored error messages
- Graceful script termination

**Usage Example:**
```bash
source patterns/error-handling/simple-error-handling.sh
check_command_exists "git" || handle_error $LINENO "Git is required"
cp "$source" "$dest" || handle_error $LINENO "File copy failed"
```

**Integration with Logging:**
```bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

# Error handling automatically uses log_error function if available
```

---

#### 3. Configuration Pattern
**File:** `patterns/configuration/config-reader.sh`  
**Size:** 59 lines  
**Claude Readability Score:** 68/100 (Good)

**Purpose:** Universal configuration file parser with security validation.

**Key Functions:**
- `get_config()` - Get config with environment fallback
- `read_config()` - Read from multiple file formats
- `has_config()` - Check file existence
- `validate_config()` - Validate file format

**Supported Formats:**
- JSON (`.json`)
- YAML (`.yaml`, `.yml`)
- Environment variables (`.env`)

**Security Features:**
- Input validation to prevent injection
- Safe parameter parsing
- No eval or command substitution

**Usage Example:**
```bash
source patterns/configuration/config-reader.sh

# Get config with fallbacks
db_url=$(get_config "DATABASE_URL" ".env" "sqlite://local.db")
port=$(get_config "PORT" "config.yaml" "8080")

# Validate before use
if validate_config "settings.json"; then
    api_key=$(read_config "settings.json" "api_key")
fi
```

---

### 🧪 Quality Assurance Patterns

#### 4. Testing Pattern
**File:** `patterns/testing/simple-test-runner.sh`  
**Size:** 48 lines  
**Claude Readability Score:** 72/100 (Good)

**Purpose:** Lightweight testing framework for bash scripts.

**Key Functions:**
- `run_test()` - Execute test with reporting
- `assert_equals()` - Value equality assertion
- `assert_contains()` - String containment assertion
- `run_all_tests()` - Execute test suite

**Features:**
- Colored pass/fail indicators
- Test result aggregation
- Assertion helpers
- Simple test discovery

**Usage Example:**
```bash
source patterns/testing/simple-test-runner.sh

test_math() {
    local result=$((2 + 2))
    assert_equals "4" "$result" "Basic addition"
}

test_string_contains() {
    assert_contains "hello world" "world" "String should contain substring"
}

run_test "Math operations" test_math
run_test "String operations" test_string_contains
```

---

#### 5. Security Pattern
**File:** `patterns/security/security-basics.sh`  
**Size:** 47 lines  
**Claude Readability Score:** 71/100 (Good)

**Purpose:** Basic security validation and input sanitization.

**Key Functions:**
- `basic_security_scan()` - Scan for common vulnerabilities
- `validate_input()` - Input validation with regex
- `check_permissions()` - File permission validation

**Security Checks:**
- Dangerous commands (eval, exec)
- Unquoted variables
- Hardcoded credentials
- File permission issues
- Input validation

**Usage Example:**
```bash
source patterns/security/security-basics.sh

# Validate user input
if validate_input "$username" "^[a-zA-Z0-9_]+$" 32; then
    log_info "Username is valid"
fi

# Run security scan
if basic_security_scan; then
    log_success "Security scan passed"
fi
```

---

#### 6. Quality Gates Pattern
**File:** `patterns/quality-gates/quality-check.sh`  
**Size:** 45 lines  
**Claude Readability Score:** 69/100 (Good)

**Purpose:** Comprehensive quality validation pipeline.

**Key Functions:**
- `run_quality_checks()` - Execute all quality gates
- `check_code_style()` - Code formatting validation
- `check_security()` - Security compliance
- `check_tests()` - Test coverage validation

**Quality Gates:**
1. Code formatting and style
2. Security vulnerability scan
3. Test coverage requirements
4. Documentation completeness

**Usage Example:**
```bash
source patterns/quality-gates/quality-check.sh

if run_quality_checks; then
    log_success "All quality gates passed"
    # Proceed with deployment
else
    log_error "Quality gates failed"
    exit 1
fi
```

---

### 🔍 Analysis & Validation Patterns

#### 7. Project Validation Pattern
**File:** `patterns/project-validation/project-validator.sh`  
**Size:** 46 lines  
**Claude Readability Score:** 67/100 (Good)

**Purpose:** Intelligent project type detection and validation.

**Key Functions:**
- `detect_project_type()` - Auto-detect project technology
- `has_tests()` - Check for test files
- `check_dependencies()` - Validate dependencies

**Supported Project Types:**
- Node.js (package.json)
- Python (requirements.txt, setup.py)
- Go (go.mod)
- Shell/Bash scripts
- Generic projects

**Usage Example:**
```bash
source patterns/project-validation/project-validator.sh

project_type=$(detect_project_type)
log_info "Detected project type: $project_type"

if has_tests; then
    log_info "Tests found"
else
    log_warn "No tests detected"
fi
```

---

#### 8. Dependency Checker Pattern
**File:** `patterns/dependencies/dependency-checker.sh`  
**Size:** 43 lines  
**Claude Readability Score:** 66/100 (Good)

**Purpose:** Comprehensive dependency validation and verification.

**Key Functions:**
- `check_dependencies()` - Validate all dependencies
- `check_command()` - Check single command
- `install_missing()` - Suggest installation commands

**Validation Types:**
- System commands
- Package managers
- Runtime environments
- Required files

**Usage Example:**
```bash
source patterns/dependencies/dependency-checker.sh

if check_dependencies; then
    log_success "All dependencies satisfied"
else
    log_error "Missing dependencies detected"
fi
```

---

### 📚 Documentation & Automation Patterns

#### 9. Documentation Pattern
**File:** `patterns/documentation/docs-generator.sh`  
**Size:** 41 lines  
**Claude Readability Score:** 65/100 (Good)

**Purpose:** Automated documentation generation from code.

**Key Functions:**
- `generate_docs()` - Generate complete documentation
- `update_readme()` - Update README with current info
- `extract_functions()` - Extract function documentation

**Features:**
- Automatic function discovery
- Comment-based documentation
- README synchronization
- API reference generation

**Usage Example:**
```bash
source patterns/documentation/docs-generator.sh

generate_docs
log_success "Documentation updated"
```

---

#### 10. Git Hooks Pattern
**File:** `patterns/git-hooks/git-hooks-setup.sh`  
**Size:** 42 lines  
**Claude Readability Score:** 64/100 (Good)

**Purpose:** Automated git hooks setup for quality enforcement.

**Key Functions:**
- `setup_git_hooks()` - Install quality gate hooks
- `validate_commit_message()` - Enforce commit format
- `pre_commit_check()` - Pre-commit quality validation

**Hooks Installed:**
- pre-commit: Quality checks
- commit-msg: Message validation
- pre-push: Final validation

**Usage Example:**
```bash
source patterns/git-hooks/git-hooks-setup.sh

setup_git_hooks
log_success "Git hooks installed"
```

---

## Pattern Composition Guide

### Basic Composition

**Minimal Setup:**
```bash
# Essential patterns for any script
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
```

**Standard Setup:**
```bash
# Recommended pattern combination
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/testing/simple-test-runner.sh
```

**Full Stack Setup:**
```bash
# Complete pattern integration
for pattern in patterns/*/simple-*.sh; do
    [[ -f "$pattern" ]] && source "$pattern"
done
```

### Advanced Compositions

#### Development Workflow
```bash
#!/bin/bash
# Development-focused pattern stack

source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/testing/simple-test-runner.sh
source patterns/quality-gates/quality-check.sh

log_info "Starting development workflow"

# Run quality checks first
run_quality_checks || handle_error $LINENO "Quality checks failed"

# Run tests
run_all_tests

log_success "Development workflow completed"
```

#### Production Deployment
```bash
#!/bin/bash
# Production-ready pattern stack

source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/security/security-basics.sh
source patterns/quality-gates/quality-check.sh
source patterns/project-validation/project-validator.sh

log_info "Starting production deployment"

# Security validation
basic_security_scan || handle_error $LINENO "Security scan failed"

# Project validation
detect_project_type
check_dependencies || handle_error $LINENO "Dependencies not satisfied"

# Quality gates
run_quality_checks || handle_error $LINENO "Quality gates failed"

log_success "Production deployment validated"
```

#### CI/CD Pipeline
```bash
#!/bin/bash
# CI/CD-optimized pattern stack

source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/testing/simple-test-runner.sh
source patterns/security/security-basics.sh
source patterns/quality-gates/quality-check.sh
source patterns/documentation/docs-generator.sh

# Disable colors in CI
export LOG_COLOR=false

log_info "CI/CD Pipeline starting"

# Run comprehensive validation
run_all_tests || handle_error $LINENO "Tests failed"
basic_security_scan || handle_error $LINENO "Security scan failed"
run_quality_checks || handle_error $LINENO "Quality checks failed"

# Generate documentation
generate_docs

log_success "CI/CD Pipeline completed successfully"
```

## Pattern Compatibility Matrix

| Pattern | Logging | Error | Config | Testing | Security | Quality | Project | Deps | Docs | Git |
|---------|---------|-------|--------|---------|----------|---------|---------|------|------|-----|
| **Logging** | ✅ | 🔗 | ✅ | 🔗 | ✅ | 🔗 | ✅ | ✅ | ✅ | ✅ |
| **Error** | 🔗 | ✅ | ✅ | ✅ | ✅ | 🔗 | ✅ | ✅ | ✅ | ✅ |
| **Config** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **Testing** | 🔗 | ✅ | ✅ | ✅ | ✅ | 🔗 | ✅ | ✅ | ✅ | ✅ |
| **Security** | ✅ | ✅ | ✅ | ✅ | ✅ | 🔗 | ✅ | ✅ | ✅ | 🔗 |
| **Quality** | 🔗 | 🔗 | ✅ | 🔗 | 🔗 | ✅ | ✅ | ✅ | 🔗 | 🔗 |
| **Project** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | 🔗 | ✅ | ✅ |
| **Deps** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | 🔗 | ✅ | ✅ | ✅ |
| **Docs** | ✅ | ✅ | ✅ | ✅ | ✅ | 🔗 | ✅ | ✅ | ✅ | ✅ |
| **Git** | ✅ | ✅ | ✅ | ✅ | 🔗 | 🔗 | ✅ | ✅ | ✅ | ✅ |

**Legend:**
- ✅ Compatible
- 🔗 Synergistic (enhanced functionality when combined)

## Performance Characteristics

| Pattern | Load Time | Memory Usage | Execution Speed | Complexity |
|---------|-----------|--------------|-----------------|------------|
| Logging | 112ms | Low | Fast | Simple |
| Error Handling | 118ms | Low | Fast | Simple |
| Configuration | 122ms | Medium | Medium | Medium |
| Testing | 115ms | Medium | Medium | Simple |
| Security | 119ms | Medium | Slow | Complex |
| Quality Gates | 121ms | High | Slow | Complex |
| Project Validation | 116ms | Medium | Medium | Medium |
| Dependencies | 114ms | Low | Fast | Simple |
| Documentation | 117ms | Medium | Medium | Medium |
| Git Hooks | 113ms | Low | Fast | Simple |

**Performance Grades:**
- All patterns: **Good** (100-150ms load time)
- Target: <200ms for production use
- Actual: 112-122ms average

## Pattern Evolution

### Version History

| Version | Patterns Added | Major Changes |
|---------|----------------|---------------|
| 1.0.0 | All 10 patterns | Initial release |
| 1.1.0 | - | Security enhancements |
| 1.2.0 | - | Performance optimizations |

### Planned Enhancements

#### Version 1.3.0 (Next Release)
- Enhanced error recovery
- Advanced configuration merging
- Improved test assertions
- Extended security validation

#### Version 2.0.0 (Major Update)
- Pattern plugin system
- Advanced composition engine
- Interactive pattern selection
- Cloud integration patterns

## Best Practices

### Pattern Selection

**For Small Scripts:**
- Logging + Error Handling

**For Medium Projects:**
- Logging + Error Handling + Configuration + Testing

**For Large Projects:**
- All patterns for comprehensive coverage

### Performance Optimization

1. **Load Only Required Patterns:** Don't source all patterns unless needed
2. **Use Pattern Composition:** Combine related patterns for synergy
3. **Cache Pattern Loading:** Source patterns once per session
4. **Monitor Memory Usage:** Watch resource consumption in loops

### Security Considerations

1. **Always Use Security Pattern:** For any user-facing scripts
2. **Validate All Inputs:** Use configuration pattern safely
3. **Regular Security Scans:** Run basic_security_scan regularly
4. **Keep Patterns Updated:** Monitor for security patches

---

## Quick Reference

### Loading Patterns
```bash
# Single pattern
source patterns/logging/simple-logging.sh

# Multiple patterns
source patterns/{logging,error-handling}/simple-*.sh

# All patterns
for p in patterns/*/simple-*.sh; do source "$p"; done
```

### Common Functions
```bash
# Logging
log_info "message"
log_error "error"

# Error handling
handle_error $LINENO "description"
check_command_exists "command"

# Configuration
get_config "KEY" ".env" "default"

# Testing
run_test "name" test_function
assert_equals "expected" "actual"

# Security
basic_security_scan
validate_input "$input" "pattern" 100

# Quality
run_quality_checks
```

### Environment Variables
```bash
export LOG_COLOR=false    # Disable colors
export DEBUG=1           # Enable debug logging
export SECURITY_STRICT=1 # Strict security mode
```

For detailed API documentation, see [API_REFERENCE.md](API_REFERENCE.md).