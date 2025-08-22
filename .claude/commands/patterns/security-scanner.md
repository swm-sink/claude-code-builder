---
allowed-tools: Read, Glob, Grep, Bash(find:*), Bash(grep:*), Bash(awk:*), Bash(wc:*), Bash(npm:*), Bash(pip:*), Bash(cargo:*)
argument-hint: [project-path] or [scan-type] or [vulnerability-check]
description: Comprehensive security scanning with secret detection and vulnerability assessment
category: patterns
---

# Security Scanner

Intelligent security scanning with automatic threat detection: **$ARGUMENTS**

## Security Scanning System

I'll provide comprehensive security scanning capabilities with automatic secret detection, vulnerability assessment, and actionable security recommendations across multiple project types.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining security operation and scope]
Mode: [secrets/vulnerabilities/full/quick/deep]
Target: [Current directory or specified path]
Severity: [critical/high/medium/low/all]
```

### Security Threat Detection

#### Automatic Security Scanning Process
```markdown
**🔍 Security Analysis**

Analyzing project for security threats and vulnerabilities...
- Scanning for hardcoded secrets and credentials
- Detecting security anti-patterns and vulnerabilities
- Checking dependency security status
- Identifying configuration security issues
- Preparing comprehensive security assessment
```

### Secret Detection Categories

#### Credential Pattern Detection
```markdown
**🔑 Secret Detection System**

Advanced pattern matching for sensitive data:

**Passwords and Credentials**:
- Hardcoded passwords in source code
- Database connection strings with credentials
- Authentication tokens and session keys
- Service account credentials

**API Keys and Tokens**:
- REST API keys and authentication tokens
- Cloud service access keys (AWS, Azure, GCP)
- Third-party service API keys
- OAuth tokens and refresh tokens

**Cryptographic Material**:
- Private keys (RSA, EC, DSA)
- SSL/TLS certificates and keys
- SSH private keys
- PGP/GPG private keys

**Configuration Secrets**:
- Environment variable secrets
- Configuration file credentials
- Docker secrets and sensitive build args
- CI/CD pipeline secrets

Usage: /security-scanner "secrets" or auto-detected in full scan
```

#### Pattern Matching Implementation
```bash
# High-accuracy secret detection patterns
SECRET_PATTERNS=(
    "password\s*[=:]\s*['\"][^'\"]{6,}['\"]"           # Password assignments
    "api[_-]?key\s*[=:]\s*['\"][^'\"]{10,}['\"]"      # API key assignments
    "secret[_-]?key\s*[=:]\s*['\"][^'\"]{8,}['\"]"    # Secret key assignments
    "access[_-]?token\s*[=:]\s*['\"][^'\"]{10,}['\"]" # Access tokens
    "-----BEGIN [A-Z ]+-----"                         # PEM format keys
    "AKIA[0-9A-Z]{16}"                                # AWS access keys
    "sk_live_[0-9a-zA-Z]{24}"                         # Stripe live keys
    "xox[baprs]-([0-9a-zA-Z]{10,48})"                 # Slack tokens
    "ghp_[0-9a-zA-Z]{36}"                             # GitHub personal tokens
)
```

### Project-Specific Security Scanning

#### Node.js Security Assessment
```markdown
**📦 Node.js Security Validation**

Detection: package.json, node_modules, .npmrc files
Security Tools:
- npm audit: Dependency vulnerability scanning
- retire.js: Known vulnerable library detection
- ESLint security plugin: Security anti-pattern detection
- Dependency security analysis

Security Checks:
1. Dependency vulnerability assessment
2. Package.json security configuration validation
3. Environment variable exposure detection
4. Prototype pollution vulnerability scanning
5. XSS and injection vulnerability patterns
6. Insecure random number generation detection

Usage: /security-scanner "nodejs" or auto-detected
```

#### Python Security Assessment
```markdown
**🐍 Python Security Validation**

Detection: requirements.txt, setup.py, .py files
Security Tools:
- bandit: Python security issue detection
- safety: Known security vulnerability database
- pip-audit: Dependency vulnerability scanning
- semgrep: Advanced static analysis

Security Checks:
1. Code injection vulnerability detection
2. SQL injection pattern identification
3. Cross-site scripting (XSS) vulnerability scanning
4. Insecure deserialization detection
5. Cryptographic weakness identification
6. Path traversal vulnerability assessment
7. Command injection detection

Usage: /security-scanner "python" or auto-detected
```

#### Go Security Assessment
```markdown
**🔷 Go Security Validation**

Detection: go.mod, .go files
Security Tools:
- gosec: Go security analyzer
- nancy: Dependency vulnerability scanner
- govulncheck: Official Go vulnerability checker

Security Checks:
1. SQL injection vulnerability detection
2. Command injection pattern identification
3. Cryptographic implementation review
4. File system security validation
5. Network security assessment
6. Concurrency security issues
7. Memory safety validation

Usage: /security-scanner "golang" or auto-detected
```

#### Rust Security Assessment
```markdown
**🦀 Rust Security Validation**

Detection: Cargo.toml, src/ directory
Security Tools:
- cargo audit: Rust vulnerability database
- cargo deny: Security policy enforcement
- clippy security lints: Security-focused linting

Security Checks:
1. Dependency vulnerability scanning
2. Unsafe code block review
3. Memory safety validation
4. Cryptographic implementation assessment
5. Network security configuration
6. Concurrency safety verification

Usage: /security-scanner "rust" or auto-detected
```

#### Generic Security Assessment
```markdown
**📁 Universal Security Validation**

Detection: Configuration files, scripts, documentation
Security Tools:
- File permission analysis
- Configuration security validation
- Documentation security review
- Infrastructure as Code security

Security Checks:
1. File permission security assessment
2. Configuration exposure detection
3. Infrastructure security validation
4. Documentation security review
5. Build script security analysis
6. CI/CD pipeline security validation

Usage: /security-scanner "generic" or auto-detected
```

### Security Scanning Modes

#### Comprehensive Security Scan
```bash
# Full security assessment
/security-scanner "."
/security-scanner "full"

# Specific project type security scan
/security-scanner "nodejs"
/security-scanner "python"
/security-scanner "golang"
/security-scanner "rust"
```

**Full Scan Process**:
1. **Secret Detection**: Comprehensive secret pattern matching
2. **Vulnerability Assessment**: Language-specific vulnerability scanning
3. **Dependency Analysis**: Security vulnerability in dependencies
4. **Configuration Review**: Security configuration validation
5. **Anti-Pattern Detection**: Common security anti-pattern identification
6. **Report Generation**: Actionable security recommendations

#### Targeted Security Scanning

##### Secret Detection Focus
```bash
# Focus on secret and credential detection
/security-scanner "secrets"

# Specific secret types
/security-scanner "secrets" "api-keys"
/security-scanner "secrets" "passwords"
/security-scanner "secrets" "certificates"
```

##### Vulnerability Assessment Focus
```bash
# Focus on known vulnerabilities
/security-scanner "vulnerabilities"

# Specific vulnerability categories
/security-scanner "vulnerabilities" "dependencies"
/security-scanner "vulnerabilities" "code"
```

##### Quick Security Check
```bash
# Fast security validation
/security-scanner "quick"

# Security status check
/security-scanner "status"
```

### Advanced Security Features

#### Multi-Project Security Assessment
```bash
# Handle projects with multiple security contexts
/security-scanner "multi"
# Scans: Frontend + Backend + Infrastructure + Documentation
# Provides unified security assessment
```

#### Security Compliance Checking
```bash
# Check security compliance standards
/security-scanner "compliance"

# Specific compliance frameworks
/security-scanner "compliance" "owasp"
/security-scanner "compliance" "cis"
```

#### Security Remediation Guidance
```bash
# Generate security fix recommendations
/security-scanner "remediation"

# Export security findings
/security-scanner "export" "json"
/security-scanner "report" "detailed"
```

### Integration with Error Handling

#### Comprehensive Security Reporting
```bash
# All security operations use error handling pattern
/error-handler "info" "Starting security scan for $project_type"

# Security issues found
/error-handler "error" "Critical security vulnerabilities detected: $critical_count"
/error-handler "warn" "Security issues found: $issue_count"

# Security validation passed
/error-handler "info" "No security issues detected"

# Fatal security errors
/error-handler "handle-error" "$LINENO" "Security scanning tool not available"
```

#### Detailed Security Issue Reporting
```bash
# Issue categorization by severity
/error-handler "error" "Critical issues: $critical_count (immediate action required)"
/error-handler "warn" "High severity issues: $high_count (fix before deployment)"
/error-handler "info" "Medium severity issues: $medium_count (address in current cycle)"

# Actionable security recommendations
/error-handler "info" "Run: $fix_command to resolve critical issues"
/error-handler "info" "Update dependencies: $update_command"
/error-handler "info" "Review configuration: $config_files"
```

### Security Detection Implementation

#### Secret Pattern Matching
```markdown
**Advanced Secret Detection**:

**Pattern Categories**:
1. **Structured Secrets**: JSON/YAML embedded credentials
2. **Environment Variables**: Exposed sensitive environment values
3. **Connection Strings**: Database and service connection strings
4. **Cryptographic Keys**: Private keys and certificates
5. **API Credentials**: Service-specific API keys and tokens

**Detection Accuracy**:
- **High Precision**: Minimize false positives with context-aware matching
- **Comprehensive Coverage**: Detect secrets across all major formats
- **Language Awareness**: Language-specific secret detection patterns
- **Configuration Context**: Respect .gitignore and security configuration
```

#### Vulnerability Database Integration
```markdown
**Vulnerability Detection**:

**Data Sources**:
- **CVE Database**: Common Vulnerabilities and Exposures
- **Language-Specific DBs**: npm audit, PyPI vulnerabilities, Go vulndb
- **Security Advisories**: GitHub, vendor security notifications
- **Community Intelligence**: Security community vulnerability reports

**Assessment Categories**:
- **Critical**: Immediate security threat requiring urgent action
- **High**: Significant security risk requiring prompt attention
- **Medium**: Moderate security concern for current development cycle
- **Low**: Minor security improvement opportunity
```

### Output Formatting

#### Standard Security Results
```
🔍 Security Scan: nodejs project
🛡️  Security Tools: npm audit, ESLint security
⚡ Scan Status: Running...

🚨 Security Results:
  ❌ Critical: 2 vulnerabilities (immediate action required)
  ⚠️  High: 1 vulnerability (fix before deployment)
  ℹ️  Medium: 3 issues (address in current cycle)
  ✅ Secrets: No hardcoded secrets detected

⏱️  Scan Time: 3.2 seconds
🛡️  Security Score: 65/100 (target: 85+)
```

#### Detailed Security Findings
```
🚨 Critical Security Issues (2):

🔴 CVE-2023-12345: Remote Code Execution
  • Package: express@4.15.0
  • Severity: Critical (CVSS 9.8)
  • Fix: Update to express@4.18.2
  • Command: npm update express

🔴 Hardcoded API Key Detected
  • File: src/config.js:23
  • Pattern: AWS Access Key
  • Recommendation: Move to environment variables
  • Command: Use process.env.AWS_ACCESS_KEY

🟡 High Severity Issues (1):
  • SQL Injection vulnerability in user input handler
  • Recommendation: Use parameterized queries
```

#### Security Remediation Report
```
🛡️  Security Remediation Plan:

🚨 Immediate Actions (Critical):
  1. Update express package: npm update express
  2. Remove hardcoded API key from src/config.js
  
⚠️  Before Deployment (High):
  1. Fix SQL injection in user handler
  2. Implement input validation
  
📋 Development Cycle (Medium):
  1. Add Content Security Policy headers
  2. Update security dependencies
  3. Review file permissions

🔧 Recommended Tools:
  • Pre-commit: git hooks for security scanning
  • CI/CD: Automated security validation
  • Monitoring: Runtime security monitoring
```

### Performance Optimization

#### Fast Security Scanning
- **Pattern caching**: <20ms for repeated secret pattern checks
- **Incremental scanning**: Only scan changed files
- **Parallel execution**: Multiple security tools simultaneously
- **Smart file filtering**: Skip binary and irrelevant files

#### Efficient Resource Usage
- **Memory management**: Minimal overhead during scanning
- **Process optimization**: Efficient security tool orchestration
- **Output streaming**: Real-time security findings
- **Selective scanning**: Focus on high-risk areas first

### Security Considerations

#### Safe Security Tool Execution
- **Controlled scanning**: Only approved security tools and patterns
- **Path validation**: Validate all file path inputs for security
- **Output sanitization**: Clean security tool output for safe display
- **Data protection**: Secure handling of detected secrets and vulnerabilities

#### Privacy Protection
- **Secret masking**: Never display full secrets in output
- **Data isolation**: Prevent security data leakage between scans
- **Audit logging**: Secure logging of security scan activities
- **Access control**: Controlled access to security scan results

### Integration Patterns

#### With Quality Gates Pattern
```bash
# Security as part of quality validation
/quality-check "security"     # Quality-focused security checks
/security-scanner "."         # Dedicated comprehensive security scan
# Combined security assessment from both patterns
```

#### With Testing Pattern
```bash
# Security validation before testing
/security-scanner "quick"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Security validation passed, proceeding with tests"
    /test-runner "."
else
    /error-handler "error" "Security issues block testing pipeline"
fi
```

#### With Error Handling Pattern
```bash
# Comprehensive security workflow
/error-handler "info" "Starting security validation pipeline"
/security-scanner "."
/error-handler "info" "Security validation completed"
```

### Configuration Options

#### Environment Variables
```bash
SECURITY_STRICT=true          # Strict security enforcement
SECURITY_QUICK_SCAN=false     # Disable quick scan mode
SECURITY_REPORT_FORMAT="detailed"  # Security report format
SECURITY_FAIL_ON_HIGH=true    # Fail on high severity issues
SECURITY_MASK_SECRETS=true    # Mask detected secrets in output
```

#### Project Configuration
```bash
# .securityrc configuration file support
SECURITY_EXCLUDE_PATTERNS="node_modules/**,*.min.js"
SECURITY_INCLUDE_PATTERNS="src/**,config/**"
SECURITY_SECRET_PATTERNS_FILE=".security-patterns"
SECURITY_WHITELIST_FILE=".security-whitelist"
```

#### Tool Configuration Integration
```bash
# Respect existing security configurations
- .bandit (Python security configuration)
- .eslintrc-security (Node.js security rules)
- .gosec.json (Go security configuration)
- .security.yml (Universal security config)
```

## Success Indicators

- ✅ **Accurate Detection**: High-precision secret and vulnerability detection
- ✅ **Comprehensive Coverage**: Multi-language security assessment
- ✅ **Actionable Reports**: Clear issue identification with specific remediation steps
- ✅ **Tool Integration**: Seamless security tool orchestration
- ✅ **Performance**: Fast scanning with efficient resource usage
- ✅ **Privacy Protection**: Safe handling of sensitive security data
- ✅ **Integration**: Works well with quality gates and development workflows

The security scanner provides intelligent, comprehensive security validation that protects against common vulnerabilities and credential exposure while offering clear guidance for security improvement across multiple programming languages and project types.