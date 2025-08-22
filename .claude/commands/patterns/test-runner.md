---
allowed-tools: Read, Glob, Bash(npm:*), Bash(pytest:*), Bash(python:*), Bash(go:*), Bash(cargo:*), Bash(make:*)
argument-hint: [project-path] or [test-type] or [check-only]
description: Smart test runner with automatic framework detection and execution
category: patterns
---

# Test Runner

Smart test execution with automatic project type detection: **$ARGUMENTS**

## Test Execution System

I'll provide comprehensive test running capabilities with automatic framework detection and intelligent test execution.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining test operation and project path]
Mode: [run/check/detect/all/specific]
Path: [Current directory or specified path]
```

### Project Type Detection

#### Automatic Detection Process
```markdown
**🔍 Project Analysis**

Analyzing project structure to determine test framework...
- Scanning for framework indicator files
- Detecting multiple framework presence
- Determining execution strategy
- Preparing appropriate test commands
```

#### Supported Project Types

##### Node.js Projects
```markdown
**📦 Node.js/npm Project Detected**

Indicators: package.json file present
Test Strategy:
- Check for "test" script in package.json
- Execute: npm test
- Handle missing test scripts gracefully
- Report test results and coverage

Usage: /test-runner "nodejs" or auto-detected
```

##### Python Projects
```markdown
**🐍 Python Project Detected**

Indicators: requirements.txt, pyproject.toml, setup.py, or .py files
Test Strategy:
- Prefer pytest if available
- Fallback to unittest discovery
- Handle virtual environments
- Support pytest configuration files

Test Commands Tried:
1. pytest (preferred)
2. python -m pytest
3. python -m unittest discover

Usage: /test-runner "python" or auto-detected
```

##### Go Projects
```markdown
**🔷 Go Project Detected**

Indicators: go.mod, go.sum, or .go files
Test Strategy:
- Execute: go test ./...
- Include all packages recursively
- Handle module-aware testing
- Report test coverage if requested

Usage: /test-runner "golang" or auto-detected
```

##### Rust Projects
```markdown
**🦀 Rust Project Detected**

Indicators: Cargo.toml file present
Test Strategy:
- Execute: cargo test
- Include integration and unit tests
- Handle workspace projects
- Support test filtering

Usage: /test-runner "rust" or auto-detected
```

##### Make Projects
```markdown
**🔨 Make Project Detected**

Indicators: Makefile with test target
Test Strategy:
- Execute: make test
- Check for test target existence
- Handle makefile dependencies
- Support custom test targets

Usage: /test-runner "make" or auto-detected
```

##### Generic Projects
```markdown
**📁 Generic Project Detected**

Indicators: tests/ or test/ directory present
Test Strategy:
- Scan for test directories
- Report test structure
- Provide guidance for setup
- Suggest framework adoption

Usage: /test-runner "generic" or auto-detected
```

### Test Execution Modes

#### Full Test Execution
```bash
# Run all tests with detection
/test-runner "."

# Run tests for specific project type
/test-runner "nodejs"
/test-runner "python"
/test-runner "golang"
/test-runner "rust"
/test-runner "make"
```

**Execution Process**:
1. **Detection**: Analyze project structure
2. **Validation**: Confirm test setup exists
3. **Execution**: Run appropriate test command
4. **Reporting**: Provide results and status
5. **Error Handling**: Graceful failure management

#### Test Availability Check
```bash
# Check if project has tests (no execution)
/test-runner "check"

# Check specific project type
/test-runner "check" "nodejs"
```

**Check Process**:
- Scans for test indicators
- Validates test configuration
- Reports test readiness
- No actual test execution

#### Project Type Detection Only
```bash
# Detect project type without running tests
/test-runner "detect"

# Detect with detailed analysis
/test-runner "detect" "verbose"
```

### Advanced Features

#### Multi-Framework Projects
```bash
# Handle projects with multiple frameworks
/test-runner "multi"
# Detects: Node.js + Python, Go + Make, etc.
# Runs tests for all detected frameworks
```

#### Coverage Reporting
```bash
# Run tests with coverage
/test-runner "coverage"

# Framework-specific coverage
/test-runner "nodejs" "coverage"
/test-runner "python" "coverage"
```

#### Parallel Test Execution
```bash
# Run tests in parallel (when supported)
/test-runner "parallel"

# Specify parallel job count
/test-runner "parallel" "4"
```

#### Test Filtering
```bash
# Run specific test patterns
/test-runner "filter" "auth"

# Framework-specific filtering
/test-runner "nodejs" "filter" "*.test.js"
/test-runner "python" "filter" "test_api"
```

### Framework-Specific Implementations

#### Node.js Test Execution
```markdown
**Detection Process**:
1. Look for package.json
2. Check for "test" script in scripts section
3. Verify npm/yarn availability
4. Handle missing dependencies

**Execution Strategy**:
- Primary: npm test
- Alternative: yarn test (if yarn.lock present)
- Fallback: Direct test runner execution

**Error Handling**:
- Missing test script: Provide setup guidance
- Dependency issues: Suggest npm install
- Test failures: Report specific failures
```

#### Python Test Execution
```markdown
**Detection Process**:
1. Look for requirements.txt, pyproject.toml, setup.py
2. Check for pytest installation
3. Scan for test files/directories
4. Detect virtual environment

**Execution Strategy**:
- Primary: pytest
- Secondary: python -m pytest
- Fallback: python -m unittest discover

**Configuration Support**:
- pytest.ini, pyproject.toml, setup.cfg
- Custom test directories
- Virtual environment activation
```

#### Go Test Execution
```markdown
**Detection Process**:
1. Look for go.mod file
2. Check for *_test.go files
3. Verify go command availability
4. Handle module mode

**Execution Strategy**:
- Standard: go test ./...
- Verbose: go test -v ./...
- Coverage: go test -cover ./...

**Module Support**:
- Module-aware testing
- Vendor directory handling
- Build constraints support
```

### Integration with Error Handling

#### Comprehensive Error Reporting
```bash
# All test operations use error handling pattern
/error-handler "info" "Starting test execution for $project_type"

# Test failures
/error-handler "error" "Tests failed with exit code $exit_code"

# Test success
/error-handler "info" "All tests passed successfully"

# Fatal errors
/error-handler "handle-error" "$LINENO" "Test framework not available"
```

#### Status Reporting
```bash
# Progress updates
/error-handler "info" "Detected project type: $type"
/error-handler "info" "Running tests with: $command"

# Warnings for issues
/error-handler "warn" "No test script found in package.json"
/error-handler "warn" "pytest not installed, using unittest"

# Debug information
DEBUG=1 /error-handler "debug" "Test command: $test_cmd"
DEBUG=1 /error-handler "debug" "Working directory: $pwd"
```

### Output Formatting

#### Standard Test Results
```
🔍 Project Type Detection: nodejs
📦 Test Framework: npm test
⚡ Execution Status: Running...

✅ Test Results: 15 tests passed
⏱️  Execution Time: 2.3 seconds
📊 Coverage: 87% (if available)
```

#### Multi-Framework Results
```
🔍 Multi-Framework Project Detected:
  📦 Node.js: npm test
  🐍 Python: pytest
  
✅ Node.js Results: 12 tests passed
✅ Python Results: 8 tests passed
📊 Overall Status: All tests passed
```

#### Error Reporting
```
❌ Test Execution Failed:
  Framework: nodejs
  Command: npm test
  Exit Code: 1
  
🔧 Suggested Actions:
  - Check test files for syntax errors
  - Verify dependencies are installed
  - Review test output for specific failures
```

### Performance Optimization

#### Fast Detection
- **File existence checks**: <10ms per project type
- **Package.json parsing**: <50ms for JSON analysis
- **Command availability**: <20ms per framework check

#### Efficient Execution
- **Command caching**: Avoid repeated framework detection
- **Parallel detection**: Check multiple indicators simultaneously
- **Smart fallbacks**: Quick alternatives when primary methods fail

#### Resource Management
- **Memory usage**: Minimal overhead during execution
- **Process cleanup**: Proper cleanup of test processes
- **Output streaming**: Real-time test output display

### Security Considerations

#### Safe Command Execution
- **Controlled commands**: Only allow specific test commands
- **Path validation**: Validate project path inputs
- **Environment isolation**: Prevent environment pollution
- **Input sanitization**: Clean all user inputs

#### Framework Verification
- **Command existence**: Verify test tools before execution
- **Permission checking**: Ensure file read permissions
- **Safe defaults**: Secure fallback behaviors
- **Output sanitization**: Clean test output for display

### Integration Patterns

#### With Quality Gates
```bash
# Test execution as part of quality checks
/test-runner "."
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Tests passed, proceeding with quality gates"
else
    /error-handler "error" "Tests failed, blocking quality gate"
fi
```

#### With CI/CD Workflows
```bash
# In automated pipelines
/error-handler "info" "Starting CI test execution"
/test-runner "coverage"
/error-handler "info" "Test execution completed"
```

#### With Development Workflow
```bash
# Pre-commit testing
/test-runner "quick"  # Fast test subset
/test-runner "changed"  # Only test changed files
```

### Configuration Options

#### Environment Variables
```bash
TEST_TIMEOUT=300      # Test timeout in seconds
TEST_PARALLEL=true    # Enable parallel execution
TEST_COVERAGE=true    # Include coverage reporting
TEST_VERBOSE=true     # Verbose test output
```

#### Project Configuration
```bash
# .testrunner configuration file support
TEST_COMMAND="custom test command"
TEST_PATTERN="tests/**/*.test.js"
TEST_EXCLUDE="integration/**"
```

## Success Indicators

- ✅ **Accurate Detection**: Correctly identifies project types
- ✅ **Reliable Execution**: Tests run consistently across frameworks
- ✅ **Clear Reporting**: Results are easy to understand
- ✅ **Error Handling**: Graceful failure management
- ✅ **Performance**: Fast detection and execution
- ✅ **Integration**: Works well with other patterns

The test runner provides intelligent, automated test execution that adapts to any project type while maintaining elegant simplicity and comprehensive error handling.