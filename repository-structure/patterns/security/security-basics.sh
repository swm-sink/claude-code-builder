#!/bin/bash
# Technical: Secret detection and basic security scanning with pattern matching for credentials and sensitive data
# Simple: Security guard that automatically finds passwords, keys, and secrets hiding in your code files
# Connection: Teaches security automation patterns essential for preventing credential leaks and data breaches

# Detect common secret patterns in files
detect_secrets() {
    local target_dir="${1:-.}"
    find "$target_dir" -type f \( -name "*.js" -o -name "*.py" -o -name "*.sh" -o -name "*.yaml" -o -name "*.json" \) 2>/dev/null | \
    head -10 | xargs grep -l "password\s*[=:]\s*['\"][^'\"]{6,}['\"]" 2>/dev/null | head -3
    find "$target_dir" -type f \( -name "*.js" -o -name "*.py" -o -name "*.sh" -o -name "*.yaml" -o -name "*.json" \) 2>/dev/null | \
    head -10 | xargs grep -l "api[_-]?key\s*[=:]\s*['\"][^'\"]{10,}['\"]" 2>/dev/null | head -3
    find "$target_dir" -type f \( -name "*.js" -o -name "*.py" -o -name "*.sh" -o -name "*.yaml" -o -name "*.json" \) 2>/dev/null | \
    head -10 | xargs grep -l "-----BEGIN [A-Z ]+-----" 2>/dev/null | head -3
}

# Check for hardcoded credentials in environment files
check_env_files() {
    [[ -f ".env" ]] && echo "⚠️ Found .env file"
    [[ -f ".env.local" ]] && echo "⚠️ Found .env.local file"
    [[ -f "config.json" ]] && echo "⚠️ Found config.json file"
    [[ -f "secrets.yaml" ]] && echo "⚠️ Found secrets.yaml file"
}

# Scan for common security issues
basic_security_scan() {
    local target="${1:-.}"
    echo "🔍 Running basic security scan on: $target"
    
    # Check for secrets
    local secrets_found
    secrets_found=$(detect_secrets "$target")
    [[ -n "$secrets_found" ]] && echo "🚨 Potential secrets detected in files"
    
    # Check environment files
    check_env_files
    
    # Check for private key files
    find "$target" -name "*.key" -o -name "*.pem" -o -name "id_rsa" 2>/dev/null | head -3 | \
    while read -r file; do echo "🔑 Private key file: $file"; done
    
    echo "✅ Basic security scan completed"
}

# Quick security validation
has_security_issues() {
    local secrets_count
    secrets_count=$(detect_secrets | wc -l)
    [[ $secrets_count -gt 0 ]]
}