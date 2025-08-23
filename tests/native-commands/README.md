# Native Command Tests

This directory contains test scripts for Claude Code Builder's native command implementations.

## Test Files

Each `test-*.sh` file validates a specific native command:

- `test-architectural-dashboard.sh` - Tests architectural analysis command
- `test-chain-orchestration.sh` - Tests command chaining functionality
- `test-claude-readability-scorer.sh` - Tests readability scoring
- `test-config-manager.sh` - Tests configuration management
- `test-dependency-manager.sh` - Tests dependency management
- `test-error-handler.sh` - Tests error handling patterns
- `test-function-complexity-analyzer.sh` - Tests complexity analysis
- `test-generate-docs.sh` - Tests documentation generation
- `test-log-manager.sh` - Tests logging management
- `test-native-patterns.sh` - Tests native pattern integration
- `test-performance-benchmarks.sh` - Tests performance benchmarking
- `test-quality-check.sh` - Tests quality validation
- `test-security-scanner.sh` - Tests security scanning
- `test-setup-git-hooks.sh` - Tests git hook setup
- `test-test-runner.sh` - Tests the test runner itself
- `test-validate-project.sh` - Tests project validation

## Running Tests

### Individual Test
```bash
./tests/native-commands/test-error-handler.sh
```

### All Native Command Tests
```bash
for test in tests/native-commands/test-*.sh; do
    echo "Running: $test"
    bash "$test"
done
```

### From Project Root
```bash
# Tests are designed to run from project root
bash tests/native-commands/test-config-manager.sh
```

## Test Structure

Each test follows this pattern:
1. Source required patterns
2. Set up test environment
3. Execute native command
4. Validate output
5. Clean up test artifacts

## Adding New Tests

When adding a native command, create a corresponding test:
1. Name it `test-{command-name}.sh`
2. Place it in this directory
3. Follow the existing test patterns
4. Ensure it runs from project root
5. Add it to CI/CD workflow if needed

## CI/CD Integration

These tests are automatically run in GitHub Actions on:
- Push to main branch
- Pull requests
- Scheduled daily runs

## Notes

- Tests assume they're run from the project root directory
- Each test is self-contained and idempotent
- Tests clean up after themselves
- Exit code 0 = success, non-zero = failure