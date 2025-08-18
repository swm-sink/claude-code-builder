# Testing Patterns

**Technical:** Automated test detection and execution patterns that identify project types and run appropriate test commands with cross-platform compatibility.

**Simple:** Like having a smart assistant that looks at your project and automatically knows how to run the right tests for any type of codebase.

**Connection:** These patterns teach test automation concepts essential for CI/CD pipelines and demonstrate project introspection techniques used in DevOps tooling.

## 🧪 Available Patterns

### simple-test-runner.sh

**Purpose:** Intelligent test runner with automatic project type detection

**Functions:**
- `detect_project_type()` - Identifies project type (nodejs, python, golang, rust, make, generic)
- `run_project_tests()` - Executes appropriate test command for detected project type
- `run_all_tests()` - Main function with status reporting and error handling
- `has_tests()` - Checks if project has tests without running them

**Supported Project Types:**
- **Node.js** - Detects `package.json`, runs `npm test`
- **Python** - Detects `requirements.txt`/`pyproject.toml`, runs `pytest` or `unittest`
- **Go** - Detects `go.mod`, runs `go test ./...`
- **Rust** - Detects `Cargo.toml`, runs `cargo test`
- **Make** - Detects `Makefile`, runs `make test`
- **Generic** - Falls back to checking for `tests/` or `test/` directories

**Line Count:** 50 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/testing/simple-test-runner.sh

# Check what type of project this is
project_type=$(detect_project_type)
echo "Project type: $project_type"

# Check if tests exist
if has_tests; then
    echo "Tests found in project"
else
    echo "No tests detected"
fi

# Run all tests
if run_all_tests; then
    echo "All tests passed! ✅"
else
    echo "Tests failed ❌"
    exit 1
fi
```

## 🔧 Pattern Composition

### With Error Handling
```bash
source patterns/error-handling/simple-error-handling.sh
source patterns/testing/simple-test-runner.sh

validate_with_tests() {
    log_info "Starting test validation"
    
    if ! has_tests; then
        log_warn "No tests found in project"
        return 0
    fi
    
    if run_all_tests; then
        log_info "All tests passed ✅"
    else
        handle_error $LINENO "Test suite failed"
    fi
}
```

### With Quality Gates
```bash
source patterns/testing/simple-test-runner.sh
source patterns/quality-gates/quality-check.sh

full_validation() {
    echo "Running comprehensive validation..."
    
    # First run tests
    run_all_tests || return 1
    
    # Then run quality checks
    run_quality_checks || return 1
    
    echo "✅ All validation passed"
}
```

## 🛡️ Security Considerations

- **Command Validation:** Only executes known, safe test commands
- **Input Sanitization:** File detection uses safe bash patterns
- **Error Handling:** Proper stderr redirection prevents information leakage
- **No Dynamic Execution:** No `eval` or dynamic command construction

## 🎓 Educational Value

### Concepts Taught
- **Project Introspection:** How to detect project types programmatically
- **Test Automation:** Standardized approaches to running tests
- **Cross-Platform Development:** Supporting multiple languages and tools
- **Error Handling:** Proper exit codes and status reporting
- **CI/CD Patterns:** Foundation concepts for pipeline automation

### Transferable Skills
- **DevOps Tooling:** Understanding how tools like GitHub Actions detect projects
- **Polyglot Development:** Working with multiple programming languages
- **Test Strategy:** Consistent testing approaches across tech stacks
- **Automation Design:** Building intelligent, self-configuring tools

## 🧪 Testing Examples

### Node.js Project
```bash
# Create a Node.js project
echo '{"scripts":{"test":"jest"}}' > package.json

source patterns/testing/simple-test-runner.sh
detect_project_type  # Returns: nodejs
has_tests           # Returns: true
run_all_tests       # Runs: npm test
```

### Python Project
```bash
# Create a Python project
echo "pytest>=6.0" > requirements.txt
mkdir tests

source patterns/testing/simple-test-runner.sh
detect_project_type  # Returns: python
has_tests           # Returns: true
run_all_tests       # Runs: pytest
```

### Go Project
```bash
# Create a Go project
echo "module test" > go.mod

source patterns/testing/simple-test-runner.sh
detect_project_type  # Returns: golang
has_tests           # Returns: true
run_all_tests       # Runs: go test ./...
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Tests detected but command fails
**Solution:** Ensure test framework is installed (pytest, jest, etc.)

**Issue:** Wrong project type detected
**Solution:** Check file presence - pattern uses first match priority

**Issue:** Tests exist but not detected
**Solution:** Ensure standard project structure (`tests/` directory or framework files)

### Best Practices

- Use standard project structures for better detection
- Include test scripts in `package.json` for Node.js projects
- Place tests in `tests/` or `test/` directories
- Use standard test commands (`make test`, `npm test`, etc.)

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with safe command execution  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

## 🔄 Integration Examples

### CI/CD Pipeline
```bash
#!/bin/bash
# ci-validation.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/testing/simple-test-runner.sh

log_info "Starting CI validation"

if has_tests; then
    log_info "Running test suite..."
    run_all_tests || handle_error $LINENO "Tests failed"
else
    log_warn "No tests found - consider adding tests"
fi

log_info "CI validation complete ✅"
```

### Pre-commit Hook
```bash
#!/bin/bash
# .git/hooks/pre-commit
source patterns/testing/simple-test-runner.sh

if has_tests; then
    echo "Running tests before commit..."
    run_all_tests || {
        echo "❌ Tests failed - commit rejected"
        exit 1
    }
fi
```

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux)  
**Dependencies:** Project-specific test tools (npm, pytest, go, cargo, make)  
**Line Count:** 50 lines  
**Claude Comprehension:** Optimized ✅