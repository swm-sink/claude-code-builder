# Contributing to Claude Code Builder

> Simple guidelines for contributing to the Claude Code Builder pattern library

## Quick Start

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/my-pattern`
3. **Make** your changes following our [standards](#pattern-standards)
4. **Test** your changes: `./scripts/test.sh`
5. **Submit** a pull request

## Pattern Standards

### Core Principles

**Keep it Simple:**
- Maximum 50 lines per pattern
- Clear function names
- Minimal dependencies

**Make it Readable:**
- Triple explanation format (Technical/Simple/Connection)
- Self-documenting code
- Consistent naming

**Ensure Quality:**
- All patterns must pass security scan
- Include usage examples
- Add appropriate tests

### Pattern Template

```bash
#!/bin/bash
# Technical: [What this pattern does technically]
# Simple: [What this pattern does in simple terms]
# Connection: [How this connects to broader programming concepts]

# Main function with clear purpose
function_name() {
    local parameter="$1"
    
    # Implementation with error handling
    [[ -n "$parameter" ]] || {
        echo "Error: parameter required" >&2
        return 1
    }
    
    # Clear, simple logic
    echo "Result: $parameter"
}

# Usage example in comments
# function_name "example"
```

## Contribution Types

### 1. New Patterns

**Requirements:**
- Solves a common problem
- Follows pattern template
- Under 50 lines
- Includes tests

**Process:**
1. Create pattern file in `patterns/category/simple-name.sh`
2. Add README in pattern directory
3. Add tests in `tests/`
4. Update documentation

### 2. Bug Fixes

**Requirements:**
- Clear problem description
- Minimal fix scope
- Includes test for the bug

**Process:**
1. Identify the issue
2. Create failing test
3. Fix the issue
4. Verify test passes

### 3. Documentation

**Requirements:**
- Clear, concise writing
- Practical examples
- Proper formatting

**Process:**
1. Identify documentation gap
2. Write clear content
3. Include examples
4. Review for accuracy

## Development Setup

### Prerequisites

```bash
# Required tools
- bash 4.0+
- git
- curl

# Optional but recommended
- shellcheck (for linting)
- shfmt (for formatting)
```

### Local Setup

```bash
# Clone repository
git clone https://github.com/yourusername/claude-code-builder.git
cd claude-code-builder

# Install patterns locally
./scripts/install.sh

# Run tests
./scripts/test.sh

# Run quality checks
source patterns/quality-gates/quality-check.sh
run_quality_checks
```

## Pattern Development

### Creating a New Pattern

**Step 1: Plan the Pattern**
```bash
# Define the purpose
Purpose: "Validate user input safely"
Category: "validation"
Functions: ["validate_input", "sanitize_input"]
```

**Step 2: Create Pattern File**
```bash
# Create directory structure
mkdir -p patterns/validation
touch patterns/validation/simple-input-validator.sh
touch patterns/validation/README.md
```

**Step 3: Implement Pattern**
```bash
#!/bin/bash
# Technical: Input validation with regex patterns and length limits
# Simple: Check if user input matches expected format and size
# Connection: Teaches input validation essential for secure applications

# Validate input against pattern and length
validate_input() {
    local input="$1"
    local pattern="$2"
    local max_length="${3:-100}"
    
    # Check length
    [[ ${#input} -le $max_length ]] || return 1
    
    # Check pattern
    [[ "$input" =~ $pattern ]] || return 1
    
    return 0
}
```

**Step 4: Add Tests**
```bash
# tests/test-input-validator.sh
test_input_validation() {
    source patterns/validation/simple-input-validator.sh
    
    # Test valid input
    validate_input "user123" "^[a-zA-Z0-9]+$" 10
    assert_equals 0 $? "Valid input should pass"
    
    # Test invalid input
    validate_input "user@123" "^[a-zA-Z0-9]+$" 10
    assert_equals 1 $? "Invalid input should fail"
}
```

### Pattern Quality Checklist

Before submitting, ensure your pattern:

- [ ] **Functionality**: Solves a real problem
- [ ] **Size**: Under 50 lines
- [ ] **Format**: Follows template structure
- [ ] **Documentation**: Has Technical/Simple/Connection explanations
- [ ] **Error Handling**: Handles edge cases gracefully
- [ ] **Security**: Passes security scan
- [ ] **Testing**: Has comprehensive tests
- [ ] **Examples**: Includes usage examples
- [ ] **Compatibility**: Works on bash 4.0+

## Testing Guidelines

### Test Structure

```bash
# Simple test format
test_function_name() {
    # Setup
    source patterns/category/simple-pattern.sh
    
    # Execute
    result=$(pattern_function "input")
    
    # Verify
    assert_equals "expected" "$result" "Description"
}
```

### Running Tests

```bash
# Run all tests
./scripts/test.sh

# Run specific test
source patterns/testing/simple-test-runner.sh
run_test "Test name" test_function_name

# Run with debugging
DEBUG=1 ./scripts/test.sh
```

## Code Style

### Shell Script Standards

**Variable Naming:**
```bash
# Use descriptive names
local user_name="$1"          # Good
local un="$1"                 # Bad

# Use readonly for constants
readonly CONFIG_FILE=".env"   # Good
CONFIG_FILE=".env"            # Okay
```

**Function Naming:**
```bash
# Use verb_noun format
validate_input()              # Good
check_user_credentials()      # Good
input_validator()             # Bad (noun_verb)
```

**Error Handling:**
```bash
# Always handle errors
command || handle_error $LINENO "Command failed"  # Good
command                                           # Bad

# Check parameters
[[ -n "$param" ]] || {
    echo "Error: param required" >&2
    return 1
}
```

### Formatting Standards

```bash
# Use consistent indentation (4 spaces)
if [[ condition ]]; then
    do_something
    if [[ nested ]]; then
        do_nested
    fi
fi

# Quote variables
echo "$variable"               # Good
echo $variable                 # Bad

# Use [[ ]] for conditions
if [[ "$var" == "value" ]]; then  # Good
if [ "$var" = "value" ]; then     # Okay
```

## Pull Request Process

### Before Submitting

1. **Self-Review:**
   - Read through your changes
   - Check for typos and errors
   - Verify all tests pass

2. **Quality Check:**
   ```bash
   # Run full quality suite
   source patterns/quality-gates/quality-check.sh
   run_quality_checks
   
   # Security scan
   source patterns/security/security-basics.sh
   basic_security_scan
   ```

3. **Documentation:**
   - Update relevant documentation
   - Add examples if needed
   - Check formatting

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] New pattern
- [ ] Bug fix
- [ ] Documentation update
- [ ] Other (specify)

## Pattern Details (if applicable)
- **Category**: validation
- **Functions**: validate_input, sanitize_input
- **Lines of Code**: 45
- **Test Coverage**: 100%

## Testing
- [ ] All existing tests pass
- [ ] New tests added for new functionality
- [ ] Manual testing completed

## Quality Checks
- [ ] Security scan passes
- [ ] Pattern follows template
- [ ] Documentation updated
- [ ] Code formatted consistently

## Additional Notes
Any additional context or considerations
```

### Review Process

1. **Automated Checks:**
   - CI pipeline runs all tests
   - Security scan validates safety
   - Quality gates verify standards

2. **Manual Review:**
   - Code quality assessment
   - Pattern usefulness evaluation
   - Documentation completeness

3. **Feedback:**
   - Address reviewer comments
   - Update as requested
   - Re-run quality checks

## Community Guidelines

### Code of Conduct

**Be Respectful:**
- Use inclusive language
- Respect different perspectives
- Be constructive in feedback

**Be Helpful:**
- Help newcomers get started
- Share knowledge and resources
- Contribute to discussions

**Be Professional:**
- Keep discussions on-topic
- Avoid spam or self-promotion
- Respect maintainer decisions

### Getting Help

**For Questions:**
- Check existing documentation
- Search previous issues
- Ask in GitHub discussions

**For Issues:**
- Use issue templates
- Provide minimal reproduction
- Include diagnostic information

**For Ideas:**
- Start with GitHub discussion
- Gather community feedback
- Propose formal RFC if needed

## Advanced Contributing

### Pattern Categories

**Current Categories:**
- `logging` - Standardized logging
- `error-handling` - Error management
- `configuration` - Config reading
- `testing` - Test utilities
- `security` - Security validation
- `quality-gates` - Quality checks
- `project-validation` - Project analysis
- `dependencies` - Dependency checking
- `documentation` - Doc generation
- `git-hooks` - Git automation

**Adding New Categories:**
1. Propose category in discussion
2. Get community feedback
3. Create category structure
4. Add initial patterns
5. Update documentation

### Maintainer Guidelines

**Release Process:**
1. Update version numbers
2. Update CHANGELOG.md
3. Run full test suite
4. Tag release
5. Update documentation

**Issue Triage:**
- Label issues appropriately
- Assign to milestones
- Close duplicates/invalid
- Provide feedback quickly

## Recognition

### Contributors

All contributors are recognized in:
- AUTHORS.md file
- Release notes
- Documentation credits

### Contribution Types

**Code Contributors:**
- Pattern authors
- Bug fixers
- Test writers

**Documentation Contributors:**
- Guide writers
- Example creators
- Translation helpers

**Community Contributors:**
- Issue reporters
- Feature requesters
- Discussion participants

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License).

## Questions?

- **General Questions**: GitHub Discussions
- **Bug Reports**: GitHub Issues
- **Feature Requests**: GitHub Issues with feature template
- **Security Issues**: Email maintainers directly

Thank you for contributing to Claude Code Builder! 🚀