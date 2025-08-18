# Security Patterns

**Technical:** Automated security scanning patterns that detect secrets, credentials, and sensitive data using regex pattern matching with configurable detection rules and severity levels.

**Simple:** Like having a security guard that automatically checks your code for passwords, API keys, and other secrets that shouldn't be there.

**Connection:** These patterns teach security automation concepts essential for preventing data breaches, implementing DevSecOps practices, and maintaining security compliance.

## 🛡️ Available Patterns

### security-basics.sh

**Purpose:** Basic security scanning with secret detection and credential analysis

**Functions:**
- `detect_secrets()` - Scans files for common secret patterns (passwords, API keys, tokens)
- `check_env_files()` - Identifies environment files that may contain secrets
- `basic_security_scan()` - Comprehensive security scan with reporting
- `has_security_issues()` - Quick validation check for security problems

**Detection Patterns:**
- **Passwords** - `password=`, `pwd=` with quoted values
- **API Keys** - `api_key=`, `apikey=` with 10+ character values
- **Private Keys** - PEM format detection (`-----BEGIN`)
- **Environment Files** - `.env`, `.env.local`, `config.json`, `secrets.yaml`
- **Key Files** - `*.key`, `*.pem`, `id_rsa` files

**Line Count:** 49 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/security/security-basics.sh

# Run basic security scan
basic_security_scan .

# Check specific directory
basic_security_scan "/path/to/project"

# Quick validation check
if has_security_issues; then
    echo "⚠️ Security issues found"
    basic_security_scan
else
    echo "✅ No obvious security issues detected"
fi

# Check just for secrets
secrets=$(detect_secrets)
if [[ -n "$secrets" ]]; then
    echo "🚨 Secrets detected:"
    echo "$secrets"
fi
```

## 🔧 Pattern Composition

### With Error Handling
```bash
source patterns/error-handling/simple-error-handling.sh
source patterns/security/security-basics.sh

secure_validation() {
    log_info "Starting security validation"
    
    if has_security_issues; then
        log_error "Security issues detected"
        basic_security_scan
        handle_error $LINENO "Security validation failed"
    else
        log_info "Security validation passed ✅"
    fi
}
```

### With Quality Gates
```bash
source patterns/security/security-basics.sh
source patterns/quality-gates/quality-check.sh

comprehensive_scan() {
    echo "Running comprehensive security and quality scan..."
    
    # Security first
    basic_security_scan || return 1
    
    # Then quality
    run_quality_checks || return 1
    
    echo "✅ All scans passed"
}
```

### Pre-commit Security Hook
```bash
#!/bin/bash
# .git/hooks/pre-commit
source patterns/security/security-basics.sh

if has_security_issues; then
    echo "🚨 Security issues detected - commit blocked"
    echo "Please review and fix the following issues:"
    basic_security_scan
    exit 1
fi

echo "✅ Security validation passed"
```

## 🛡️ Security Considerations

- **Safe Pattern Matching:** Uses safe regex patterns with bounded quantifiers
- **File System Safety:** Limits find operations and uses secure file handling
- **No Code Execution:** Never executes or evaluates found content
- **Resource Limits:** Bounded searches to prevent performance issues
- **Privacy Aware:** Doesn't store or transmit detected secrets

## 🎓 Educational Value

### Concepts Taught
- **Secret Detection:** Automated identification of credentials in source code
- **Security Scanning:** Systematic approach to finding security vulnerabilities
- **Regex Patterns:** Using regular expressions for security pattern matching
- **File System Security:** Secure file operations and permission checking
- **DevSecOps Integration:** Embedding security into development workflows

### Transferable Skills
- **CI/CD Security:** Foundation for automated security pipelines
- **Compliance Automation:** Meeting security standards and regulations
- **Threat Prevention:** Proactive security issue identification
- **Security Tooling:** Understanding commercial security tool patterns

## 🧪 Testing Examples

### Detecting Hardcoded Passwords
```bash
# Create test file with secrets
echo 'password="super_secret_123"' > test.js
echo 'api_key="sk-1234567890abcdef"' >> test.js

source patterns/security/security-basics.sh
detect_secrets .  # Should detect the test file
```

### Environment File Detection
```bash
# Create environment files
echo "DATABASE_PASSWORD=secret123" > .env
echo "API_KEY=abc123xyz" > .env.local

source patterns/security/security-basics.sh
check_env_files  # Should warn about .env files
```

### Private Key Detection
```bash
# Create mock private key
echo "-----BEGIN RSA PRIVATE KEY-----" > test.key
echo "MIIEowIBAAKCAQEA..." >> test.key

source patterns/security/security-basics.sh
basic_security_scan .  # Should detect the key file
```

## 🔍 Detection Accuracy

### Pattern Coverage
- **High Confidence:** Password patterns, API keys, private keys
- **Medium Confidence:** Generic secret patterns, token formats
- **Low Confidence:** Suspicious filenames, configuration files

### False Positives
- Comments containing pattern keywords
- Test files with mock credentials
- Documentation examples

### Mitigation Strategies
```bash
# Exclude test directories
detect_secrets() {
    find . -name "test*" -prune -o -type f \( -name "*.js" \) -print | \
    xargs grep -l "password=" 2>/dev/null
}

# Add allowlist for known safe files
check_allowlist() {
    local file="$1"
    [[ "$file" =~ test|example|mock ]] && return 0
    return 1
}
```

## 🚀 Advanced Usage

### Custom Secret Patterns
```bash
# Extend detect_secrets for custom patterns
detect_custom_secrets() {
    local target_dir="${1:-.}"
    
    # Custom company patterns
    find "$target_dir" -type f -name "*.js" | \
    xargs grep -l "COMPANY_SECRET=" 2>/dev/null
    
    # Database connection strings
    find "$target_dir" -type f -name "*.py" | \
    xargs grep -l "mysql://.*:.*@" 2>/dev/null
}
```

### Integration with Git Hooks
```bash
# Enhanced pre-commit hook
#!/bin/bash
source patterns/security/security-basics.sh

# Check only staged files
git diff --cached --name-only | while read -r file; do
    if [[ -f "$file" ]]; then
        if detect_secrets "$file" | grep -q "$file"; then
            echo "🚨 Secret detected in staged file: $file"
            exit 1
        fi
    fi
done
```

### CI/CD Pipeline Integration
```bash
# GitHub Actions / CI integration
security_gate() {
    local exit_code=0
    
    basic_security_scan . || exit_code=1
    
    if [[ $exit_code -eq 1 ]]; then
        echo "::error::Security issues detected"
        echo "::set-output name=security_passed::false"
    else
        echo "::set-output name=security_passed::true"
    fi
    
    return $exit_code
}
```

## 🔧 Customization

### Adjusting Detection Sensitivity
```bash
# Strict mode - detect shorter patterns
detect_secrets_strict() {
    find . -type f -name "*.js" | \
    xargs grep -l "password\s*[=:]\s*['\"][^'\"]{3,}['\"]" 2>/dev/null
}

# Lenient mode - require longer patterns
detect_secrets_lenient() {
    find . -type f -name "*.js" | \
    xargs grep -l "password\s*[=:]\s*['\"][^'\"]{12,}['\"]" 2>/dev/null
}
```

### Project-Specific Configuration
```bash
# Configuration file support
load_security_config() {
    [[ -f ".security-config" ]] && source ".security-config"
    
    # Default patterns if not configured
    SECRET_PATTERNS=${SECRET_PATTERNS:-"password api_key secret"}
    MIN_SECRET_LENGTH=${MIN_SECRET_LENGTH:-8}
    EXCLUDE_PATTERNS=${EXCLUDE_PATTERNS:-"test example mock"}
}
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Too many false positives
**Solution:** Add exclusion patterns for test files and documentation

**Issue:** Missing secrets in unusual formats
**Solution:** Extend patterns or use additional security tools

**Issue:** Performance issues on large codebases
**Solution:** Increase head limits or implement incremental scanning

### Performance Optimization
```bash
# Optimize for large repositories
detect_secrets_optimized() {
    # Only scan recent changes
    git diff --name-only HEAD~1 | grep -E '\.(js|py|sh)$' | \
    head -50 | xargs grep -l "password=" 2>/dev/null
}
```

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with safe pattern matching  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

## 🎯 Security Standards Enforced

### Secret Detection
- Password patterns in source code
- API key and token identification
- Private key file detection
- Environment variable scanning

### File Security
- Suspicious configuration files
- Overprivileged file permissions
- Backup files with potential secrets
- Temporary files with credentials

### Compliance Support
- GDPR data protection patterns
- PCI DSS credential security
- SOX financial data protection
- HIPAA sensitive data identification

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux)  
**Dependencies:** Standard Unix tools (find, grep, xargs)  
**Line Count:** 49 lines  
**Claude Comprehension:** Optimized ✅