# Security Pattern - AI Instructions

> **AI guidance for working with the security pattern in Claude Code Builder**

## Pattern Purpose

The security pattern provides comprehensive security scanning with automatic threat detection across multiple programming ecosystems. It serves as the security enforcement foundation for development workflows, ensuring code is protected against common vulnerabilities, credential exposure, and security anti-patterns through intelligent scanning and actionable remediation guidance.

## Core Capabilities

### Automatic Security Detection and Assessment
- **Secret Detection**: Hardcoded passwords, API keys, tokens, certificates, connection strings
- **Vulnerability Scanning**: Known CVEs, security advisories, dependency vulnerabilities
- **Security Anti-Patterns**: Injection vulnerabilities, insecure configurations, cryptographic weaknesses
- **Compliance Checking**: OWASP, CIS, and security best practice validation
- **Multi-Language Support**: Node.js, Python, Go, Rust, and generic project security

### Native Command Usage
```bash
# Comprehensive security scanning
/security-scanner "."

# Language-specific security assessment
/security-scanner "nodejs"
/security-scanner "python"
/security-scanner "golang"
/security-scanner "rust"
/security-scanner "generic"

# Targeted security scanning
/security-scanner "secrets"        # Secret and credential detection
/security-scanner "vulnerabilities" # Known vulnerability assessment
/security-scanner "quick"          # Fast security validation
/security-scanner "compliance"     # Security compliance checking

# Security reporting and remediation
/security-scanner "report"         # Detailed security assessment
/security-scanner "remediation"    # Actionable fix recommendations
/security-scanner "export" "json"  # Machine-readable security data
```

## AI Assistant Guidelines

### When to Recommend Security Pattern
1. **Any development workflow** - Security should be integral to all projects from day one
2. **Pre-commit validation** - Prevent secrets and vulnerabilities from entering version control
3. **CI/CD pipeline integration** - Essential component for automated security assurance
4. **Security incident response** - Rapid assessment of potential security issues
5. **Compliance requirements** - Meet security standards and regulatory requirements
6. **Legacy code assessment** - Evaluate existing code for security vulnerabilities
7. **Third-party integration** - Validate security when integrating external dependencies

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive security status reporting and critical issue alerts
- **Quality Gates**: Provides security assessment as part of quality validation pipeline
- **Testing**: Security validation before test execution in secure development workflows
- **Git Hooks**: Automates pre-commit and pre-push security validation to prevent issues
- **Documentation**: Security-focused documentation generation and compliance reporting

### Usage Patterns to Recommend

#### Standard Security Workflow
```bash
# Daily development security checking
/security-scanner "."                  # Comprehensive security assessment
/security-scanner "secrets"            # Quick secret detection for rapid iteration
/security-scanner "quick"              # Fast security validation

# Pre-commit security validation
/error-handler "info" "Running pre-commit security checks"
/security-scanner "secrets"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "No security issues detected"
else
    /error-handler "error" "Security issues found, fix before commit"
    /security-scanner "remediation"
fi
```

#### Multi-Language Project Security
```bash
# Projects with multiple tech stacks
/security-scanner "multi"             # Detect and scan all languages
/security-scanner "nodejs" "python"   # Specific language combination
/security-scanner "report"            # Comprehensive security assessment
```

#### CI/CD Security Integration
```bash
# Continuous integration security pipeline
/error-handler "info" "Starting CI security validation"
/security-scanner "vulnerabilities"   # Known vulnerability assessment
/security-scanner "compliance"        # Compliance framework validation
/security-scanner "full"              # Comprehensive security suite
/error-handler "info" "Security validation completed"
```

#### Security Incident Response
```bash
# Rapid security assessment workflow
/security-scanner "critical"          # Focus on critical security issues
/security-scanner "secrets" "urgent"  # Emergency secret detection
/security-scanner "remediation"       # Immediate fix recommendations
```

### Best Practices to Teach

#### Secret Management
- **Environment Variables**: Move hardcoded secrets to environment variables
- **Secret Management Services**: Use vault services (AWS Secrets Manager, Azure Key Vault, etc.)
- **Configuration Security**: Secure configuration file management and access control
- **Development Practices**: Never commit secrets, use .gitignore for sensitive files

#### Vulnerability Management
- **Dependency Updates**: Regular dependency security updates and monitoring
- **Security Patches**: Prompt application of security patches and updates
- **Vulnerability Databases**: Understanding CVE, CWE, and security advisory systems
- **Risk Assessment**: Prioritizing security issues based on severity and exploitability

#### Secure Development Practices
- **Input Validation**: Comprehensive input sanitization and validation
- **Output Encoding**: Proper output encoding to prevent injection attacks
- **Authentication**: Strong authentication and session management
- **Authorization**: Principle of least privilege and proper access controls

### Code Examples for AI

#### Basic Security Validation
```bash
# Standard security workflow
/error-handler "info" "Starting security validation"

# Run comprehensive security scan
if /security-scanner "."; then
    /error-handler "info" "Security validation passed"
else
    /error-handler "warn" "Security issues detected, review recommendations"
    /security-scanner "report"  # Show detailed security findings
fi
```

#### Language-Specific Security Checking
```bash
# Node.js project security validation
if /security-scanner "nodejs"; then
    /error-handler "info" "Node.js security standards met"
    
    # Continue with quality checks if security passes
    /quality-check "nodejs"
else
    /error-handler "error" "Node.js security vulnerabilities detected"
    /error-handler "info" "Run: npm audit fix to resolve dependency issues"
    /security-scanner "remediation"
fi
```

#### Critical Security Issue Handling
```bash
# High-priority security workflow
/error-handler "info" "Running critical security assessment"

# Check for critical vulnerabilities
if /security-scanner "vulnerabilities" "critical"; then
    /error-handler "error" "CRITICAL: Security vulnerabilities require immediate attention"
    /error-handler "handle-error" "$LINENO" "Critical security issues block deployment"
else
    /error-handler "info" "No critical security issues detected"
fi

# Always check for secrets regardless
if /security-scanner "secrets"; then
    /error-handler "info" "No hardcoded secrets detected"
else
    /error-handler "error" "Hardcoded secrets detected - immediate remediation required"
    /security-scanner "secrets" "details"
fi
```

#### Security Integration with Development Pipeline
```bash
# Security-first development workflow
/error-handler "info" "Starting security-first validation pipeline"

# Security validation before any other checks
if /security-scanner "."; then
    /error-handler "info" "Security validation passed, proceeding with development pipeline"
    
    # Run quality checks only if security is acceptable
    if /quality-check "."; then
        /error-handler "info" "Quality validation passed, proceeding with tests"
        
        # Run tests only if security and quality are acceptable
        if /test-runner "."; then
            /error-handler "info" "Security, quality, and testing validation complete"
        else
            /error-handler "error" "Tests failed after security and quality validation"
        fi
    else
        /error-handler "error" "Quality issues detected after security validation"
    fi
else
    /error-handler "error" "Security issues block entire development pipeline"
    /error-handler "info" "Fix security issues before proceeding with development"
    /security-scanner "remediation"
fi
```

### Common User Questions & AI Responses

**Q: "How do I check my code for security vulnerabilities?"**
A: Use `/security-scanner "."` to automatically detect your project type and run comprehensive security scanning including secret detection, vulnerability assessment, and security anti-pattern identification.

**Q: "I accidentally committed a password, how do I find it?"**
A: Run `/security-scanner "secrets"` to detect hardcoded credentials, then `/security-scanner "remediation"` for specific steps to remove them from your repository history and implement secure alternatives.

**Q: "How do I set up security scanning for my team?"**
A: Start with `/security-scanner "."` to assess current security posture, then integrate with git hooks using automated pre-commit security validation. Establish team security standards with configuration files.

**Q: "Can I scan for security issues in projects with multiple programming languages?"**
A: Yes! Use `/security-scanner "multi"` for projects with multiple tech stacks. The security scanner automatically detects and validates all supported languages with unified security reporting.

**Q: "How do I integrate security scanning into CI/CD?"**
A: Use `/security-scanner "vulnerabilities"` for dependency vulnerability checking, `/security-scanner "compliance"` for standards validation, and integrate with error handling for proper pipeline control and security gate enforcement.

### Troubleshooting Guide for AI

#### Common Issues
- **Security tools not found**: Check for tool installation (npm audit, bandit, gosec, cargo audit, etc.)
- **False positives**: Review and customize security patterns for project-specific needs
- **Performance issues**: Use incremental scanning (`/security-scanner "quick"`) for large projects
- **Configuration conflicts**: Verify security tool configuration files are properly set up
- **Compliance failures**: Ensure security policies match organizational requirements

#### Validation Steps
1. **Tool availability**: `/security-scanner "status"` shows available security tools
2. **Pattern validation**: Verify secret detection patterns are appropriate for project
3. **Project structure**: Ensure project follows expected structure for security tools
4. **Incremental validation**: Test security scans on small file subsets first
5. **Remediation verification**: Validate that suggested fixes actually resolve security issues

#### Language-Specific Troubleshooting

##### Node.js Security Issues
- **npm audit not found**: Ensure npm is installed and project has package.json
- **Dependency conflicts**: Use `npm audit fix` carefully to avoid breaking changes
- **ESLint security missing**: Install `eslint-plugin-security` for enhanced security checking
- **Package vulnerabilities**: Check for alternative packages or security patches

##### Python Security Issues
- **bandit not found**: Install with `pip install bandit`
- **Virtual environment**: Ensure security tools are installed in active environment
- **Configuration override**: Check for competing security configuration files
- **Django/Flask specific**: Use framework-specific security scanning configurations

##### Go Security Issues
- **gosec missing**: Install with `go install github.com/securecodewarrior/gosec/v2/cmd/gosec@latest`
- **Module issues**: Ensure `go.mod` is properly initialized for dependency scanning
- **govulncheck missing**: Install official Go vulnerability checker

##### Rust Security Issues
- **cargo audit missing**: Install with `cargo install cargo-audit`
- **clippy security lints**: Ensure clippy is configured with security-focused lints
- **Workspace projects**: Handle multi-crate workspace security validation appropriately

### Advanced Usage Patterns

#### Security Metrics and Compliance
```bash
# Generate comprehensive security metrics
/security-scanner "metrics"           # Security score and trends
/security-scanner "compliance" "owasp" # OWASP compliance assessment
/security-scanner "export" "sarif"    # Standards-based security data export
```

#### Custom Security Workflows
```bash
# Focus on specific security aspects
/security-scanner "secrets" "strict"  # Enhanced secret detection
/security-scanner "vulnerabilities" "zero-tolerance" # No vulnerability tolerance
/security-scanner "compliance" "soc2" # SOC 2 compliance validation
```

#### Security Automation
```bash
# Automated security remediation
/security-scanner "remediation" "auto" # Automatic security fixes where safe
/security-scanner "dependencies" "update" # Security-focused dependency updates
/security-scanner "secrets" "migrate" # Migrate secrets to secure storage
```

### Integration Examples

#### With Git Hooks
```bash
# Pre-commit hook with security validation
/error-handler "info" "Running pre-commit security validation"
if ! /security-scanner "secrets"; then
    /error-handler "error" "Pre-commit security validation failed: secrets detected"
    exit 1
fi
```

#### With Quality Gates
```bash
# Security as part of quality pipeline
/security-scanner "."            # Comprehensive security scan
/quality-check "security"        # Quality-focused security assessment
# Combined security evaluation from both patterns
```

#### With Monitoring and Alerting
```bash
# Security monitoring integration
/security-scanner "continuous"   # Ongoing security monitoring
/security-scanner "alerts" "slack" # Security alert integration
```

## AI Development Guidelines

### When Helping Users
1. **Start with detection** - Always begin with `/security-scanner "."` for comprehensive assessment
2. **Explain the threats** - Help users understand security risks and their implications
3. **Show progressive remediation** - Start with critical issues, work toward comprehensive security
4. **Integrate with workflows** - Connect to CI/CD, quality gates, and development processes
5. **Provide actionable guidance** - Focus on specific fixes and security improvements

### Pattern Recognition
- If user mentions security, vulnerabilities, secrets → recommend this pattern
- If user has compliance requirements → highlight compliance checking features
- If user asks about CI/CD security → demonstrate comprehensive security pipeline
- If user needs incident response → show rapid security assessment capabilities

### Security Assurance
- Ensure security commands are appropriate for detected project types and risk levels
- Verify security best practices are followed and properly explained
- Check that error handling provides useful feedback about security issues
- Confirm integration patterns work with other Claude Code Builder patterns
- Validate that security recommendations are actionable and prioritized correctly

### Error Recovery Guidance
- Help users install and configure missing security tools
- Guide remediation of detected security issues with specific steps
- Provide language-specific security troubleshooting steps
- Suggest alternative approaches when primary security tools fail
- Ensure security fixes don't break functionality

This security pattern provides intelligent, comprehensive security validation that protects against common vulnerabilities and threats while offering clear guidance for security improvement across multiple programming languages and development workflows.