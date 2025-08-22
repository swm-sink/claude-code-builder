# Testing Pattern - AI Instructions

> **AI guidance for working with the testing pattern in Claude Code Builder**

## Pattern Purpose

The testing pattern provides intelligent test execution with automatic framework detection for multiple project types. It serves as the validation foundation for all development workflows, ensuring code quality and reliability across different programming languages and frameworks.

## Core Capabilities

### Automatic Framework Detection
- **Node.js**: package.json with test scripts → npm test
- **Python**: requirements.txt/pyproject.toml → pytest or unittest
- **Go**: go.mod → go test ./...
- **Rust**: Cargo.toml → cargo test  
- **Make**: Makefile with test target → make test
- **Generic**: tests/ directory → guidance and reporting

### Native Command Usage
```bash
# Automatic detection and execution
/test-runner "."

# Specific framework testing
/test-runner "nodejs"
/test-runner "python" 
/test-runner "golang"
/test-runner "rust"
/test-runner "make"

# Test availability checking (no execution)
/test-runner "check"

# Project type detection only
/test-runner "detect"
```

## AI Assistant Guidelines

### When to Recommend Testing Pattern
1. **Any development workflow** - Testing should be part of every project
2. **User asks about test automation** - Point to this pattern for intelligent execution
3. **CI/CD setup questions** - Essential component for continuous integration
4. **Code quality discussions** - Testing validates quality improvements
5. **Multi-language projects** - Handles diverse tech stacks automatically

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive status reporting
- **Quality Gates**: Provides test results for quality validation pipeline
- **Git Hooks**: Automates pre-commit and pre-push testing
- **Project Validation**: Validates test coverage and framework setup
- **Documentation**: Generates test documentation and coverage reports

### Usage Patterns to Recommend

#### Standard Development Workflow
```bash
# Daily development testing
/test-runner "."                    # Run all tests
/test-runner "check"               # Verify tests exist
/test-runner "quick"               # Fast subset for rapid iteration

# Pre-commit validation
/test-runner "changed"             # Test only changed code
/test-runner "coverage"            # Include coverage analysis
```

#### Multi-Framework Projects
```bash
# Projects with multiple tech stacks
/test-runner "multi"               # Detect and run all frameworks
/test-runner "nodejs" "python"     # Specific framework combination
/test-runner "detect" "verbose"    # Detailed framework analysis
```

#### CI/CD Integration
```bash
# Continuous integration pipeline
/error-handler "info" "Starting CI test execution"
/test-runner "coverage"            # Full test suite with coverage
/test-runner "parallel"            # Parallel execution for speed
/error-handler "info" "Test execution completed"
```

#### Project Setup and Validation
```bash
# New project setup
/test-runner "detect"              # Understand current test state
/test-runner "check"               # Verify test configuration
/test-runner "setup"               # Guidance for test setup
```

### Best Practices to Teach

#### Framework-Specific Guidance
- **Node.js**: Ensure package.json has "test" script, use Jest/Mocha patterns
- **Python**: Prefer pytest over unittest, use virtual environments
- **Go**: Follow go test conventions, use table-driven tests
- **Rust**: Leverage cargo test features, separate unit/integration tests
- **Make**: Create consistent test targets, handle dependencies

#### Test Organization
- **Directory structure**: tests/, test/, spec/ conventions
- **Naming patterns**: *_test.*, test_*.*, *.spec.* files
- **Coverage goals**: Aim for meaningful coverage, not just numbers
- **Test categories**: Unit, integration, end-to-end separation

#### Performance Optimization
- **Parallel execution**: Use when tests are independent
- **Test filtering**: Run subset during development
- **Coverage analysis**: Include in CI, optional in development
- **Quick feedback**: Fast tests for rapid iteration

### Code Examples for AI

#### Basic Test Execution
```bash
# Standard test workflow
/error-handler "info" "Starting test execution"

# Detect project and run appropriate tests
if /test-runner "."; then
    /error-handler "info" "All tests passed successfully"
else
    /error-handler "error" "Tests failed, review output"
    /error-handler "handle-error" "$LINENO" "Test execution failed"
fi
```

#### Framework-Specific Testing
```bash
# Node.js project testing
if /test-runner "check" "nodejs"; then
    /error-handler "info" "Running Node.js tests"
    /test-runner "nodejs"
else
    /error-handler "warn" "No Node.js tests configured"
    /error-handler "info" "Add 'test' script to package.json"
fi
```

#### Multi-Framework Handling
```bash
# Detect and handle multiple frameworks
PROJECT_TYPES=$(/test-runner "detect")
/error-handler "info" "Detected frameworks: $PROJECT_TYPES"

# Run tests for each detected framework
for framework in $PROJECT_TYPES; do
    /error-handler "info" "Testing $framework"
    /test-runner "$framework"
done
```

#### Coverage and Quality Integration
```bash
# Comprehensive quality validation
/error-handler "info" "Running comprehensive test validation"

# Execute tests with coverage
if /test-runner "coverage"; then
    /error-handler "info" "Tests passed with coverage analysis"
    
    # Continue with quality gates
    /quality-check "."
else
    /error-handler "error" "Tests or coverage failed"
    /error-handler "handle-error" "$LINENO" "Quality gate blocked"
fi
```

### Common User Questions & AI Responses

**Q: "How do I run tests for my project?"**
A: Use `/test-runner "."` to automatically detect your project type and run the appropriate tests. The test runner supports Node.js, Python, Go, Rust, and Make projects.

**Q: "My tests aren't being detected"**
A: Run `/test-runner "detect"` to see what project type is detected, then `/test-runner "check"` to verify test configuration. You may need to add test scripts or install test frameworks.

**Q: "How do I set up testing for a new project?"**
A: First run `/test-runner "detect"` to see your project type, then follow the framework-specific setup guidance. The test runner will provide specific instructions for your tech stack.

**Q: "Can I run tests for multiple frameworks?"**
A: Yes! Use `/test-runner "multi"` for projects with multiple tech stacks, or specify frameworks individually like `/test-runner "nodejs" "python"`.

**Q: "How do I integrate testing into CI/CD?"**
A: Use `/test-runner "coverage"` for comprehensive testing with coverage analysis, `/test-runner "parallel"` for faster execution, and integrate with error handling for proper status reporting.

### Troubleshooting Guide for AI

#### Common Issues
- **Tests not detected**: Check for proper project structure and indicator files
- **Framework not found**: Verify test tools are installed (npm, pytest, go, cargo)
- **Tests fail to run**: Check test script configuration and dependencies
- **Slow test execution**: Consider parallel execution or test filtering
- **Coverage issues**: Verify coverage tools are installed and configured

#### Validation Steps
1. **Detection validation**: `/test-runner "detect"` shows correct project type
2. **Configuration check**: `/test-runner "check"` confirms tests are ready
3. **Framework availability**: Required tools are installed and accessible
4. **Test structure**: Test files follow framework conventions
5. **Dependencies**: All test dependencies are installed

#### Framework-Specific Troubleshooting

##### Node.js Issues
- **Missing test script**: Add `"test": "jest"` or similar to package.json
- **Dependencies not installed**: Run `npm install` or `yarn install`
- **Test files not found**: Check test file naming and location

##### Python Issues
- **pytest not found**: Install with `pip install pytest`
- **Virtual environment**: Activate venv before running tests
- **Import errors**: Check PYTHONPATH and module structure

##### Go Issues
- **Module not initialized**: Run `go mod init` first
- **Test files missing**: Create *_test.go files
- **Build errors**: Fix compilation issues before testing

##### Rust Issues
- **Cargo not found**: Install Rust toolchain
- **Test dependencies**: Add test dependencies to Cargo.toml
- **Build errors**: Fix compilation issues before testing

### Advanced Usage Patterns

#### Performance Testing
```bash
# Fast development feedback
/test-runner "quick"               # Run fast subset
/test-runner "unit"                # Unit tests only
/test-runner "changed"             # Test changed files only
```

#### Comprehensive Validation
```bash
# Full validation pipeline
/test-runner "coverage"            # Tests with coverage
/test-runner "integration"         # Integration tests
/test-runner "e2e"                 # End-to-end tests
```

#### Custom Test Commands
```bash
# Framework-specific options
/test-runner "nodejs" "watch"      # Watch mode for development
/test-runner "python" "verbose"    # Verbose output
/test-runner "golang" "bench"      # Benchmark tests
/test-runner "rust" "doc"          # Documentation tests
```

### Integration Examples

#### With Git Hooks
```bash
# Pre-commit hook
/error-handler "info" "Running pre-commit tests"
if ! /test-runner "quick"; then
    /error-handler "error" "Pre-commit tests failed"
    exit 1
fi
```

#### With Quality Gates
```bash
# Quality validation pipeline
/test-runner "coverage"
/quality-check "test-results"
/security-scanner "."
```

#### With Documentation
```bash
# Generate test documentation
/test-runner "coverage"
/generate-docs "test-coverage"
```

## AI Development Guidelines

### When Helping Users
1. **Start with detection** - Always begin with `/test-runner "detect"`
2. **Explain the automation** - Highlight automatic framework detection
3. **Show progressive complexity** - Start simple, add advanced features
4. **Integrate with workflows** - Connect to CI/CD and quality processes
5. **Provide framework guidance** - Offer specific setup help

### Pattern Recognition
- If user mentions testing, CI/CD, or quality → recommend this pattern
- If user has multiple tech stacks → highlight multi-framework support
- If user asks about automation → demonstrate intelligent detection
- If user needs validation → show integration with quality gates

### Quality Assurance
- Ensure test commands are appropriate for detected project types
- Verify framework-specific best practices are followed
- Check that error handling provides useful feedback
- Confirm integration patterns work with other Claude Code Builder patterns

### Error Recovery Guidance
- Help users set up missing test frameworks
- Guide configuration of test scripts and dependencies
- Provide framework-specific troubleshooting steps
- Suggest alternative approaches when primary methods fail

This testing pattern provides intelligent, automated test execution that adapts to any project type while integrating seamlessly with the broader Claude Code Builder quality assurance ecosystem.