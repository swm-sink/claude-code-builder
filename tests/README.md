# Tests Directory

## Overview

This directory contains comprehensive testing infrastructure for the dev-platform project, ensuring pattern quality, security, and compatibility across different environments and use cases.

## Testing Structure

### `/pattern-tests/`
**Unit tests for individual patterns**  
Tests each pattern in isolation to verify functionality, security, and compliance.

### `/integration-tests/`
**Integration tests for pattern combinations**  
Tests how patterns work together and interact in real-world scenarios.

### `/security-tests/`
**Security validation and vulnerability testing**  
Comprehensive security testing to ensure patterns are hardened against common threats.

### `/performance-tests/`
**Performance benchmarking and regression testing**  
Validates performance requirements and detects performance regressions.

### `/compatibility-tests/`
**Cross-platform and version compatibility testing**  
Ensures patterns work across different operating systems and bash versions.

### `/example-tests/`
**Example validation testing**  
Validates that all examples in the examples/ directory work correctly.

## Pattern Tests

### Unit Testing Framework

#### Test Structure
Each pattern has a corresponding test file:

```
tests/pattern-tests/
├── error-handling/
│   ├── test-simple-error-handling.sh
│   ├── test-advanced-error-handling.sh
│   └── test-error-recovery.sh
├── testing/
│   ├── test-simple-test-runner.sh
│   ├── test-pattern-validator.sh
│   └── test-integration-tester.sh
└── quality-gates/
    ├── test-quality-check.sh
    ├── test-code-standards.sh
    └── test-dependency-audit.sh
```

#### Test File Template
```bash
#!/bin/bash
# Test: simple-error-handling.sh
# Purpose: Validate error handling pattern functionality

# Test framework setup
TEST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$TEST_DIR/test-framework.sh"

# Set test context
set_test_context "error-handling/simple-error-handling"

# Test 1: Basic function availability
test_function_exists() {
    source "$PATTERN_DIR/error-handling/simple-error-handling.sh"
    
    assert_function_exists "log_info" "log_info function should exist"
    assert_function_exists "log_warn" "log_warn function should exist"
    assert_function_exists "log_error" "log_error function should exist"
    assert_function_exists "handle_error" "handle_error function should exist"
}

# Test 2: Logging output format
test_logging_output() {
    source "$PATTERN_DIR/error-handling/simple-error-handling.sh"
    
    output=$(log_info "test message" 2>&1)
    assert_contains "$output" "[INFO]" "Should include [INFO] prefix"
    assert_contains "$output" "test message" "Should include message text"
}

# Test 3: Error handling behavior
test_error_handling() {
    local test_script=$(mktemp)
    cat > "$test_script" << 'EOF'
#!/bin/bash
source ./patterns/error-handling/simple-error-handling.sh
false  # Command that fails
EOF
    
    chmod +x "$test_script"
    
    # Should exit with non-zero code due to error handling
    assert_command_fails "$test_script" "Script should fail on error"
    
    rm -f "$test_script"
}

# Run all tests
run_test "test_function_exists"
run_test "test_logging_output"
run_test "test_error_handling"

# Generate test summary
test_summary
```

### Test Execution
```bash
# Run all pattern tests
./tests/run-pattern-tests.sh

# Run specific pattern tests
./tests/run-pattern-tests.sh error-handling

# Run with verbose output
./tests/run-pattern-tests.sh --verbose error-handling

# Run with coverage analysis
./tests/run-pattern-tests.sh --coverage
```

## Integration Tests

### Integration Test Categories

#### Pattern Combination Tests
Test how patterns work together:

```bash
# Test: error-handling + testing patterns
test_error_handling_with_testing() {
    # Setup both patterns
    source "$PATTERN_DIR/error-handling/simple-error-handling.sh"
    source "$PATTERN_DIR/testing/simple-test-runner.sh"
    
    # Test combined functionality
    if run_tests; then
        log_info "Tests completed successfully"
    else
        log_error "Tests failed"
        return 1
    fi
}
```

#### Workflow Integration Tests
Test complete development workflows:

```bash
# Test: Complete project setup workflow
test_project_setup_workflow() {
    local test_project=$(mktemp -d)
    cd "$test_project"
    
    # Initialize project
    git init
    
    # Install patterns
    assert_command_succeeds \
        "$SCRIPT_DIR/install-patterns.sh error-handling testing quality-gates" \
        "Pattern installation should succeed"
    
    # Setup git hooks
    assert_command_succeeds \
        "$PATTERN_DIR/git-hooks/git-hooks-setup.sh" \
        "Git hooks setup should succeed"
    
    # Test commit workflow
    echo "test file" > test.txt
    git add test.txt
    assert_command_succeeds \
        "git commit -m 'Test commit'" \
        "Commit with hooks should succeed"
    
    cd - && rm -rf "$test_project"
}
```

### Integration Test Execution
```bash
# Run all integration tests
./tests/run-integration-tests.sh

# Run specific workflow tests
./tests/run-integration-tests.sh --workflow project-setup

# Run pattern combination tests
./tests/run-integration-tests.sh --combinations error-handling,testing
```

## Security Tests

### Security Testing Framework

#### Vulnerability Detection
```bash
# Test: Command injection vulnerability detection
test_command_injection_prevention() {
    local pattern_file="$PATTERN_DIR/quality-gates/quality-check.sh"
    
    # Check for unsafe command execution patterns
    assert_not_contains_pattern "$pattern_file" \
        'eval.*\$' \
        "Pattern should not use eval with variables"
    
    assert_not_contains_pattern "$pattern_file" \
        '\$\(.*\$.*\)' \
        "Pattern should validate before command substitution"
}

# Test: Input validation
test_input_validation() {
    source "$PATTERN_DIR/testing/simple-test-runner.sh"
    
    # Test with malicious input
    local malicious_input="../../../etc/passwd"
    
    assert_command_fails \
        "run_test '$malicious_input'" \
        "Should reject path traversal attempts"
}
```

#### Security Compliance
```bash
# Test: File permission security
test_file_permissions() {
    local pattern_file="$PATTERN_DIR/security/security-basics.sh"
    
    # Check file permissions are secure
    local perms=$(stat -c %a "$pattern_file" 2>/dev/null || stat -f %A "$pattern_file")
    assert_equals "$perms" "644" "Pattern file should have secure permissions"
}
```

### Security Test Execution
```bash
# Run all security tests
./tests/run-security-tests.sh

# Run vulnerability detection
./tests/run-security-tests.sh --vulnerabilities

# Run compliance tests
./tests/run-security-tests.sh --compliance

# Generate security report
./tests/run-security-tests.sh --report security-report.json
```

## Performance Tests

### Performance Testing Framework

#### Benchmark Tests
```bash
# Test: Pattern loading performance
test_pattern_loading_performance() {
    local pattern_file="$PATTERN_DIR/error-handling/simple-error-handling.sh"
    
    # Measure loading time
    local start_time=$(date +%s%N)
    source "$pattern_file"
    local end_time=$(date +%s%N)
    
    local duration=$(( (end_time - start_time) / 1000000 ))  # Convert to milliseconds
    
    # Should load in under 10ms
    assert_less_than "$duration" 10 "Pattern should load quickly"
    
    log_info "Pattern loading time: ${duration}ms"
}

# Test: Pattern execution performance
test_pattern_execution_performance() {
    source "$PATTERN_DIR/error-handling/simple-error-handling.sh"
    
    # Measure function execution time
    local start_time=$(date +%s%N)
    for i in {1..100}; do
        log_info "Performance test $i" >/dev/null
    done
    local end_time=$(date +%s%N)
    
    local duration=$(( (end_time - start_time) / 1000000 ))
    local per_call=$(( duration / 100 ))
    
    # Should execute quickly
    assert_less_than "$per_call" 1 "Each function call should be under 1ms"
}
```

#### Memory Usage Tests
```bash
# Test: Memory consumption
test_memory_usage() {
    local before_memory=$(get_memory_usage)
    
    # Load all patterns
    for pattern in "$PATTERN_DIR"/*/*.sh; do
        source "$pattern"
    done
    
    local after_memory=$(get_memory_usage)
    local memory_diff=$(( after_memory - before_memory ))
    
    # Should use less than 10MB
    assert_less_than "$memory_diff" 10240 "Memory usage should be minimal"
}
```

### Performance Test Execution
```bash
# Run all performance tests
./tests/run-performance-tests.sh

# Run benchmark tests only
./tests/run-performance-tests.sh --benchmarks

# Generate performance report
./tests/run-performance-tests.sh --report performance-report.json

# Compare with baseline
./tests/run-performance-tests.sh --compare-baseline
```

## Compatibility Tests

### Cross-Platform Testing

#### Operating System Compatibility
```bash
# Test: macOS compatibility
test_macos_compatibility() {
    # Test bash 3.x compatibility (macOS default)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        assert_bash_version_compatible "3.2"
        test_pattern_functionality_on_macos
    fi
}

# Test: Linux compatibility
test_linux_compatibility() {
    if [[ "$OSTYPE" == "linux"* ]]; then
        test_pattern_functionality_on_linux
        test_container_compatibility
    fi
}
```

#### Shell Version Compatibility
```bash
# Test: bash version compatibility
test_bash_version_compatibility() {
    local bash_version=$(bash --version | head -1 | grep -o '[0-9]\+\.[0-9]\+')
    
    # Test with different bash versions
    for version in "3.2" "4.0" "4.4" "5.0"; do
        if version_greater_equal "$bash_version" "$version"; then
            test_patterns_with_bash_version "$version"
        fi
    done
}
```

### Compatibility Test Execution
```bash
# Run all compatibility tests
./tests/run-compatibility-tests.sh

# Test specific platform
./tests/run-compatibility-tests.sh --platform macos
./tests/run-compatibility-tests.sh --platform linux

# Test specific bash version
./tests/run-compatibility-tests.sh --bash-version 3.2

# Matrix testing (multiple platforms/versions)
./tests/run-compatibility-tests.sh --matrix
```

## Example Tests

### Example Validation Framework

#### Example Functionality Tests
```bash
# Test: Node.js basic example
test_nodejs_basic_example() {
    local example_dir="$PROJECT_ROOT/examples/nodejs/basic-app"
    
    cd "$example_dir"
    
    # Test setup script
    assert_command_succeeds \
        "./setup-dev-platform.sh" \
        "Example setup should succeed"
    
    # Test npm integration
    if [[ -f "package.json" ]]; then
        assert_command_succeeds \
            "npm test" \
            "Example tests should pass"
    fi
    
    # Test git hooks
    assert_file_exists ".git/hooks/pre-commit" "Pre-commit hook should be installed"
    
    cd "$OLDPWD"
}
```

#### Example Documentation Tests
```bash
# Test: Example documentation accuracy
test_example_documentation() {
    local example_dir="$1"
    
    # Check required documentation files
    assert_file_exists "$example_dir/README.md" "Example should have README"
    assert_file_exists "$example_dir/setup-dev-platform.sh" "Example should have setup script"
    
    # Validate links in documentation
    validate_links_in_file "$example_dir/README.md"
}
```

### Example Test Execution
```bash
# Run all example tests
./tests/run-example-tests.sh

# Test specific project type examples
./tests/run-example-tests.sh --type nodejs
./tests/run-example-tests.sh --type python

# Test example documentation
./tests/run-example-tests.sh --documentation
```

## Test Framework and Utilities

### Core Test Framework

#### `test-framework.sh`
Core testing utilities and assertion functions:

```bash
# Assertion functions
assert_equals() { ... }
assert_not_equals() { ... }
assert_contains() { ... }
assert_not_contains() { ... }
assert_file_exists() { ... }
assert_command_succeeds() { ... }
assert_command_fails() { ... }
assert_function_exists() { ... }

# Test execution functions
run_test() { ... }
test_summary() { ... }
set_test_context() { ... }
```

#### Test Configuration
```bash
# Test configuration file: tests/config.yml
test_timeout: 300
parallel_execution: true
coverage_enabled: true
report_format: json
output_directory: ./test-results
```

### Test Execution Scripts

#### Master Test Runner
```bash
# Run all tests
./tests/run-all-tests.sh

# Run with specific configuration
./tests/run-all-tests.sh --config ./tests/ci-config.yml

# Run with coverage
./tests/run-all-tests.sh --coverage

# Generate comprehensive report
./tests/run-all-tests.sh --report-format html --output ./test-results/
```

## Continuous Integration

### CI/CD Integration

#### GitHub Actions Integration
```yaml
# .github/workflows/test.yml
name: Test Suite
on: [push, pull_request]
jobs:
  test:
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest]
        bash-version: ['3.2', '4.0', '5.0']
    runs-on: ${{ matrix.os }}
    steps:
      - uses: actions/checkout@v3
      - name: Setup Bash
        run: |
          if [[ "${{ matrix.bash-version }}" == "3.2" && "${{ matrix.os }}" == "macos-latest" ]]; then
            # Use system bash on macOS (3.2)
            echo "Using system bash"
          else
            # Install specific bash version
            ./scripts/install-bash-version.sh ${{ matrix.bash-version }}
          fi
      - name: Run Tests
        run: ./tests/run-all-tests.sh --ci
```

### Test Reporting

#### Test Reports
- **HTML Reports** - Visual test results with details
- **JSON Reports** - Machine-readable test data
- **Coverage Reports** - Code coverage analysis
- **Performance Reports** - Benchmark and performance data

#### Report Generation
```bash
# Generate comprehensive test report
./tests/generate-report.sh --format html --output ./reports/

# Generate CI report
./tests/generate-report.sh --format json --ci

# Generate coverage report
./tests/generate-coverage-report.sh --output ./coverage/
```

## Contributing to Tests

### Test Contribution Process
1. **Identify Testing Gap** - Find untested functionality
2. **Write Tests** - Follow testing standards and patterns
3. **Validate Tests** - Ensure tests are reliable and fast
4. **Document Tests** - Add documentation for complex tests
5. **Submit** - Create pull request with test review

### Test Review Criteria
- [ ] Tests are reliable and deterministic
- [ ] Tests are fast and efficient
- [ ] Tests have clear purpose and scope
- [ ] Tests follow naming conventions
- [ ] Tests include error cases
- [ ] Tests are well-documented
- [ ] Tests are platform-compatible

---

**Test Suite Version:** 1.0.0  
**Last Updated:** 2025-08-16  
**Total Tests:** 200+ comprehensive tests  
**Coverage Target:** 90%+ code coverage  
**Platform Support:** macOS, Linux, Windows (WSL)