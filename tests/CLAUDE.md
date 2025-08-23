# Tests Directory - AI Context Guide

> **Comprehensive test suite context for pattern validation, integration testing, and quality assurance**

## 🧪 Testing Overview

This directory contains the complete test suite for Claude Code Builder, including pattern tests, integration tests, native command tests, and comprehensive validation suites.

## 🔗 Test Navigation

### Core Test Suites
- `simple-pattern-test.sh` - Basic pattern functionality tests
- `integration-test-suite.sh` - Integration testing across patterns
- `pattern-functionality-test.sh` - Detailed pattern validation
- `pattern-compatibility-matrix.sh` - Compatibility testing

### Native Command Tests
- `native-commands/` - Tests for native Claude Code commands
  - `test-*.sh` - Individual command test files
  - @file native-commands/README.md - Native command test docs

### Specialized Tests
- `cross-platform-test.sh` - Cross-platform compatibility
- `error-recovery-test.sh` - Error handling validation
- `load-test-suite.sh` - Performance and load testing
- `edge-case-validation.sh` - Edge case testing
- `end-to-end-test.sh` - Complete workflow testing

### Installation & Workflow Tests
- `install-workflow-test.sh` - Installation process testing
- `simple-platform-test.sh` - Platform compatibility
- `pattern-test-suite.sh` - Pattern suite validation

## 🎯 Testing Principles

### Comprehensive Coverage
- Unit tests for individual functions
- Integration tests for pattern combinations
- End-to-end tests for workflows
- Performance and load testing

### Reliability
- Consistent test structure
- Clear pass/fail criteria
- Detailed error reporting
- Reproducible results

### Automation
- CI/CD integration ready
- Automated test execution
- Parallel test support
- Test result aggregation

## 🔄 Test Execution Patterns

### Running Individual Tests
```bash
./tests/simple-pattern-test.sh
./tests/native-commands/test-error-handler.sh
```

### Running Test Suites
```bash
./tests/integration-test-suite.sh    # All integration tests
./tests/pattern-test-suite.sh       # All pattern tests
./tests/run-all-tests.sh           # Complete test suite
```

### CI/CD Integration
```bash
# In CI pipeline
./tests/cross-platform-test.sh
./tests/load-test-suite.sh
./tests/end-to-end-test.sh
```

## 📊 Test Categories

### Unit Tests
Individual function and pattern testing.

### Integration Tests
Pattern interaction and composition testing.

### System Tests
Complete workflow and end-to-end testing.

### Performance Tests
Load, stress, and performance validation.

## 📖 Additional Resources

- @file README.md - Testing documentation
- @file ../CLAUDE.md - Main project context
- @file ../patterns/CLAUDE.md - Pattern library
- @file ../.github/workflows/ci.yml - CI/CD configuration

## 🤖 AI Assistant Guidelines

When working with tests:
1. **Run appropriate tests** - Choose relevant test suites
2. **Interpret results** - Explain test failures clearly
3. **Guide debugging** - Help diagnose test issues
4. **Suggest improvements** - Recommend test additions

## Test Types

### ✅ Validation Tests
Verify correct functionality.

### 🔄 Integration Tests
Test component interactions.

### 📈 Performance Tests
Measure and validate performance.

### 🛡️ Security Tests
Validate security measures.

---

**Context Type**: Testing Hub  
**Test Count**: 20+ test suites  
**Purpose**: Complete test suite navigation