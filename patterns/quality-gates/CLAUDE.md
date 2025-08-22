# Quality Gates Pattern - AI Instructions

> **AI guidance for working with the quality gates pattern in Claude Code Builder**

## Pattern Purpose

The quality gates pattern provides comprehensive code quality validation with automatic language detection across multiple programming ecosystems. It serves as the quality assurance foundation for development workflows, ensuring code meets professional standards through linting, formatting, security scanning, and best practice validation.

## Core Capabilities

### Automatic Language Detection and Quality Tools
- **Node.js**: package.json + .eslintrc → ESLint, Prettier, security scanning
- **Python**: requirements.txt/pyproject.toml → flake8, black, pylint, bandit
- **Go**: go.mod → go fmt, go vet, golint, staticcheck
- **Rust**: Cargo.toml → rustfmt, clippy, cargo audit
- **Generic**: .editorconfig → Universal quality standards, documentation checks

### Native Command Usage
```bash
# Comprehensive quality validation
/quality-check "."

# Language-specific quality checks
/quality-check "nodejs"
/quality-check "python" 
/quality-check "golang"
/quality-check "rust"
/quality-check "generic"

# Quality category focus
/quality-check "lint"          # Code style and standards
/quality-check "format"        # Code formatting validation
/quality-check "security"      # Security vulnerability scanning
/quality-check "performance"   # Performance anti-pattern detection

# Multi-language projects
/quality-check "multi"         # Handle multiple languages
/quality-check "report"        # Generate comprehensive quality report
```

## AI Assistant Guidelines

### When to Recommend Quality Gates Pattern
1. **Any professional development workflow** - Quality should be integral to all projects
2. **Code review preparation** - Validate quality before human review
3. **CI/CD pipeline integration** - Essential component for automated quality assurance
4. **Team collaboration setup** - Ensure consistent code standards across team members
5. **Legacy code improvement** - Systematically improve existing codebase quality
6. **Multi-language projects** - Unified quality standards across different tech stacks

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive quality status reporting
- **Testing**: Quality validation before test execution in development workflows
- **Security**: Integrates security scanning as part of quality assessment
- **Git Hooks**: Automates pre-commit and pre-push quality validation
- **Documentation**: Validates documentation quality and completeness

### Usage Patterns to Recommend

#### Standard Development Workflow
```bash
# Daily development quality checking
/quality-check "."                    # Full quality validation
/quality-check "lint"                 # Quick style check for rapid iteration
/quality-check "changed"              # Only validate changed files

# Pre-commit validation
/error-handler "info" "Running pre-commit quality checks"
/quality-check "lint"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Quality checks passed"
else
    /error-handler "error" "Quality issues found, fix before commit"
fi
```

#### Multi-Language Project Quality
```bash
# Projects with multiple tech stacks
/quality-check "multi"               # Detect and validate all languages
/quality-check "nodejs" "python"     # Specific language combination
/quality-check "report"              # Comprehensive quality assessment
```

#### CI/CD Integration
```bash
# Continuous integration quality pipeline
/error-handler "info" "Starting CI quality validation"
/quality-check "security"            # Security-focused validation
/quality-check "performance"         # Performance quality checks
/quality-check "full"                # Comprehensive quality suite
/error-handler "info" "Quality validation completed"
```

#### Quality Improvement Workflow
```bash
# Legacy code improvement process
/quality-check "."                   # Baseline quality assessment
/quality-check "report"              # Detailed quality metrics
/quality-check "lint" "fix"          # Automated quality improvements
/quality-check "security"            # Security vulnerability remediation
```

### Best Practices to Teach

#### Language-Specific Quality Standards
- **Node.js**: ESLint configuration, Prettier formatting, dependency security scanning
- **Python**: PEP 8 compliance, black formatting, type hint validation, security scanning
- **Go**: Official go fmt, go vet static analysis, idiomatic Go patterns
- **Rust**: rustfmt formatting, clippy linting, security auditing
- **Generic**: EditorConfig compliance, documentation standards, configuration validation

#### Quality Tool Configuration
- **Configuration files**: Respect existing tool configurations (.eslintrc, .flake8, etc.)
- **Team standards**: Establish consistent quality rules across team members
- **Incremental adoption**: Gradually improve quality standards without overwhelming teams
- **Tool integration**: Seamless integration with popular development tools and IDEs

#### Quality Assessment Strategy
- **Comprehensive validation**: Multiple quality dimensions (style, security, performance)
- **Actionable feedback**: Clear issue identification with specific fix recommendations
- **Quality metrics**: Measurable quality improvements over time
- **Automation**: Integrate quality checks into development workflow automation

### Code Examples for AI

#### Basic Quality Validation
```bash
# Standard quality workflow
/error-handler "info" "Starting quality validation"

# Run comprehensive quality checks
if /quality-check "."; then
    /error-handler "info" "All quality checks passed successfully"
else
    /error-handler "warn" "Quality issues found, review recommendations"
    /quality-check "report"  # Show detailed issue breakdown
fi
```

#### Language-Specific Quality Checking
```bash
# Node.js project quality validation
if /quality-check "nodejs"; then
    /error-handler "info" "Node.js quality standards met"
    
    # Continue with testing if quality passes
    /test-runner "nodejs"
else
    /error-handler "error" "Node.js quality issues detected"
    /error-handler "info" "Run: npm run lint --fix to auto-fix issues"
fi
```

#### Multi-Category Quality Assessment
```bash
# Comprehensive quality pipeline
/error-handler "info" "Running multi-category quality assessment"

# Security quality check
if /quality-check "security"; then
    /error-handler "info" "Security quality: PASS"
else
    /error-handler "error" "Security vulnerabilities detected"
    /error-handler "handle-error" "$LINENO" "Security quality gate failed"
fi

# Performance quality check  
if /quality-check "performance"; then
    /error-handler "info" "Performance quality: PASS"
else
    /error-handler "warn" "Performance optimization opportunities found"
fi

# Style and formatting quality
if /quality-check "lint"; then
    /error-handler "info" "Code style quality: PASS"
else
    /error-handler "warn" "Code style issues found"
    /error-handler "info" "Run format command to fix style issues"
fi
```

#### Quality Integration with Testing
```bash
# Quality-first development workflow
/error-handler "info" "Starting quality-first validation pipeline"

# Quality validation before testing
if /quality-check "."; then
    /error-handler "info" "Quality validation passed, proceeding with tests"
    
    # Run tests only if quality is acceptable
    if /test-runner "."; then
        /error-handler "info" "Quality and testing validation complete"
    else
        /error-handler "error" "Tests failed after quality validation"
    fi
else
    /error-handler "error" "Quality issues block testing pipeline"
    /error-handler "info" "Fix quality issues before running tests"
fi
```

### Common User Questions & AI Responses

**Q: "How do I check code quality for my project?"**
A: Use `/quality-check "."` to automatically detect your project type and run appropriate quality checks. The quality checker supports Node.js, Python, Go, Rust, and generic projects with comprehensive validation.

**Q: "My code quality checks are failing, what should I do?"**
A: Run `/quality-check "report"` to get detailed information about quality issues, then use the suggested fix commands. Many issues can be auto-fixed with language-specific formatting tools.

**Q: "How do I set up quality checks for a team project?"**
A: Start with `/quality-check "."` to assess current quality, then establish team standards with configuration files (.eslintrc, .flake8, etc.). Integrate with git hooks for automated validation.

**Q: "Can I check quality for projects with multiple programming languages?"**
A: Yes! Use `/quality-check "multi"` for projects with multiple tech stacks. The quality checker automatically detects and validates all supported languages in your project.

**Q: "How do I integrate quality checks into CI/CD?"**
A: Use `/quality-check "full"` for comprehensive CI validation, `/quality-check "security"` for security-focused pipelines, and integrate with error handling for proper status reporting and pipeline control.

### Troubleshooting Guide for AI

#### Common Issues
- **Quality tools not found**: Check for tool installation (eslint, flake8, go, cargo, etc.)
- **Configuration conflicts**: Verify quality tool configuration files are properly set up
- **Performance issues**: Use incremental checking (`/quality-check "changed"`) for large projects
- **False positives**: Review and customize quality tool configurations for project needs
- **Integration failures**: Ensure proper error handling integration for workflow control

#### Validation Steps
1. **Tool availability**: `/quality-check "detect"` shows available quality tools
2. **Configuration check**: Verify tool configuration files exist and are valid
3. **Project structure**: Ensure project follows expected structure for quality tools
4. **Incremental validation**: Test quality checks on small file subsets first
5. **Fix verification**: Validate that suggested fixes actually resolve issues

#### Language-Specific Troubleshooting

##### Node.js Issues
- **ESLint not found**: Install with `npm install -g eslint` or use project-local installation
- **Configuration missing**: Create `.eslintrc.js` with team standards
- **Prettier conflicts**: Ensure ESLint and Prettier configurations are compatible
- **TypeScript support**: Install `@typescript-eslint/parser` and related packages

##### Python Issues
- **flake8 not found**: Install with `pip install flake8`
- **Virtual environment**: Ensure quality tools are installed in active environment
- **Configuration override**: Check for competing configuration files (setup.cfg, pyproject.toml)
- **Import errors**: Verify PYTHONPATH includes necessary modules

##### Go Issues
- **Module issues**: Ensure `go.mod` is properly initialized
- **Tool availability**: Verify Go toolchain is properly installed and in PATH
- **Vendor dependencies**: Handle vendor directory quality validation appropriately

##### Rust Issues
- **rustfmt not found**: Install with `rustup component add rustfmt`
- **clippy missing**: Install with `rustup component add clippy`
- **Workspace projects**: Handle multi-crate workspace quality validation

### Advanced Usage Patterns

#### Quality Metrics and Reporting
```bash
# Generate comprehensive quality metrics
/quality-check "metrics"              # Quality score and trends
/quality-check "report" "detailed"    # Detailed issue breakdown
/quality-check "export" "json"        # Machine-readable quality data
```

#### Custom Quality Workflows
```bash
# Focus on specific quality aspects
/quality-check "security" "strict"    # Enhanced security validation
/quality-check "performance" "deep"   # Comprehensive performance analysis
/quality-check "format" "enforce"     # Strict formatting compliance
```

#### Quality Automation
```bash
# Automated quality improvement
/quality-check "lint" "autofix"       # Automatic code style fixes
/quality-check "format" "apply"       # Apply formatting automatically
/quality-check "security" "update"    # Update security dependencies
```

### Integration Examples

#### With Git Hooks
```bash
# Pre-commit hook with quality validation
/error-handler "info" "Running pre-commit quality validation"
if ! /quality-check "lint"; then
    /error-handler "error" "Pre-commit quality validation failed"
    exit 1
fi
```

#### With Documentation Generation
```bash
# Quality validation with documentation
/quality-check "."
/generate-docs "quality-report"
```

#### With Security Scanning
```bash
# Comprehensive security and quality pipeline
/quality-check "security"
/security-scanner "."
/quality-check "performance"
```

## AI Development Guidelines

### When Helping Users
1. **Start with detection** - Always begin with `/quality-check "detect"` or `/quality-check "."`
2. **Explain the automation** - Highlight automatic language detection and tool orchestration
3. **Show progressive complexity** - Start with basic validation, add advanced features as needed
4. **Integrate with workflows** - Connect to CI/CD, testing, and development processes
5. **Provide actionable guidance** - Focus on specific fixes and improvements

### Pattern Recognition
- If user mentions code quality, standards, linting → recommend this pattern
- If user has multiple languages → highlight multi-language support
- If user asks about CI/CD quality → demonstrate comprehensive validation
- If user needs team consistency → show configuration and automation features

### Quality Assurance
- Ensure quality commands are appropriate for detected project types
- Verify language-specific best practices are followed
- Check that error handling provides useful feedback about quality issues
- Confirm integration patterns work with other Claude Code Builder patterns

### Error Recovery Guidance
- Help users install and configure missing quality tools
- Guide configuration of quality standards and tool settings
- Provide language-specific troubleshooting steps
- Suggest alternative approaches when primary quality tools fail

This quality gates pattern provides intelligent, comprehensive quality validation that maintains professional code standards while offering clear guidance for improvement across multiple programming languages and development workflows.