# Patterns Directory

## Overview

This directory contains the core Claude Code native development patterns. Each pattern is designed to be:

- **< 50 lines** for easy Claude comprehension
- **Self-contained** with minimal dependencies  
- **Cross-platform** compatible (macOS/Linux)
- **Security-hardened** with no known vulnerabilities
- **Well-documented** with inline examples

## Pattern Categories

### `/error-handling/`
Robust error handling patterns for shell scripts and automation.

**Core Patterns:**
- `simple-error-handling.sh` - Basic error handling and logging functions
- `advanced-error-handling.sh` - Enhanced error handling with context
- `error-recovery.sh` - Automatic error recovery patterns

### `/testing/`
Testing and validation patterns for development workflows.

**Core Patterns:**
- `simple-test-runner.sh` - Universal test runner with project detection
- `pattern-validator.sh` - Validate pattern compliance and quality
- `integration-tester.sh` - Test pattern combinations

### `/quality-gates/`
Quality assurance and compliance checking patterns.

**Core Patterns:**
- `quality-check.sh` - Multi-language quality gate runner
- `code-standards.sh` - Enforce coding standards
- `dependency-audit.sh` - Security and license checking

### `/security/`
Security scanning and hardening patterns.

**Core Patterns:**
- `security-basics.sh` - Essential security checks
- `secret-detector.sh` - Find exposed secrets and credentials
- `vulnerability-scanner.sh` - Basic vulnerability detection

### `/git-hooks/`
Git workflow automation and quality enforcement.

**Core Patterns:**
- `git-hooks-setup.sh` - Easy git hooks installation
- `pre-commit-quality.sh` - Pre-commit quality gates
- `commit-standards.sh` - Enforce commit message standards

## Pattern Structure

Each pattern follows this structure:

```
pattern-name/
├── pattern-name.sh          # Main pattern script
├── README.md               # Pattern documentation
├── examples/               # Usage examples
│   ├── basic-usage.sh     # Simple usage example
│   └── advanced-usage.sh  # Complex usage example
└── tests/                 # Pattern tests
    ├── test-pattern.sh    # Pattern validation tests
    └── test-examples.sh   # Example validation tests
```

## Pattern Standards

### Code Quality
- Maximum 50 lines per pattern
- Bash 3.x compatibility (macOS default)
- No external dependencies beyond core Unix tools
- Comprehensive error handling
- Clear, descriptive variable names

### Documentation
- Inline comments explaining complex logic
- Usage examples in comments
- README.md with full documentation
- Claude-friendly explanation style

### Security
- Input validation for all user inputs
- No command injection vulnerabilities
- Secure file handling practices
- Principle of least privilege

### Testing
- Unit tests for all pattern functions
- Integration tests for pattern combinations
- Example validation tests
- Cross-platform compatibility tests

## Using Patterns

### Quick Usage
```bash
# Source a pattern directly
source patterns/error-handling/simple-error-handling.sh

# Use pattern functions
log_info "Starting process..."
if ! some_command; then
    log_error "Process failed"
    exit 1
fi
log_info "Process completed successfully"
```

### Installation Script
```bash
# Install patterns to local project
./scripts/install-patterns.sh error-handling testing quality-gates

# Install all patterns
./scripts/install-patterns.sh --all
```

### Pattern Composition
```bash
# Combine multiple patterns
source patterns/error-handling/simple-error-handling.sh
source patterns/testing/simple-test-runner.sh
source patterns/quality-gates/quality-check.sh

# Use combined functionality
log_info "Running quality gates..."
if run_quality_checks; then
    log_info "Quality gates passed"
else
    log_error "Quality gates failed"
    exit 1
fi
```

## Contributing Patterns

### Pattern Development Process
1. **Design** - Follow pattern standards and security guidelines
2. **Implement** - Create pattern with tests and documentation
3. **Validate** - Run pattern validator and security checks
4. **Test** - Verify cross-platform compatibility
5. **Document** - Complete README and examples
6. **Submit** - Create pull request with pattern review checklist

### Pattern Review Criteria
- [ ] Under 50 lines
- [ ] Bash 3.x compatible
- [ ] Security audit passed
- [ ] Tests comprehensive
- [ ] Documentation complete
- [ ] Examples functional
- [ ] Claude readability score 8+

## Pattern Lifecycle

### Development Stages
1. **Draft** - Initial implementation
2. **Review** - Community and maintainer review
3. **Testing** - Comprehensive validation
4. **Stable** - Production ready
5. **Deprecated** - Marked for removal

### Versioning
Patterns use semantic versioning:
- **Major** - Breaking changes
- **Minor** - New features, backward compatible
- **Patch** - Bug fixes, no new features

## Support and Issues

### Getting Help
- Check pattern README.md for usage guidance
- Review examples/ directory for common use cases
- Search existing GitHub issues
- Create new issue with pattern-specific template

### Reporting Issues
- Use `type: pattern` label
- Include pattern name and version
- Provide minimal reproduction case
- Include system information (OS, bash version)

---

**Pattern Library Version:** 1.0.0  
**Last Updated:** 2025-08-16  
**Patterns Count:** 15 patterns across 5 categories  
**Total Lines:** < 750 lines (96% reduction from Level-1-Dev)