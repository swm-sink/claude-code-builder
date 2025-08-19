# Claude Code Builder Best Practices

> Essential guidelines for effective use of Claude Code Builder patterns in production environments

## Table of Contents

- [Core Principles](#core-principles)
- [Pattern Selection Guidelines](#pattern-selection-guidelines)
- [Code Organization](#code-organization)
- [Performance Best Practices](#performance-best-practices)
- [Security Best Practices](#security-best-practices)
- [Testing Best Practices](#testing-best-practices)
- [Documentation Best Practices](#documentation-best-practices)
- [CI/CD Best Practices](#cicd-best-practices)
- [Error Handling Best Practices](#error-handling-best-practices)
- [Configuration Management](#configuration-management)
- [Monitoring and Observability](#monitoring-and-observability)
- [Team Collaboration](#team-collaboration)

---

## Core Principles

### 1. Minimum Viable Complexity

**✅ DO:**
```bash
# Simple, direct pattern usage
source patterns/logging/simple-logging.sh
log_info "Application starting"
```

**❌ DON'T:**
```bash
# Over-engineered pattern loading
function load_pattern_with_retry() {
    local pattern="$1"
    local max_retries=3
    for ((i=1; i<=max_retries; i++)); do
        if source "$pattern" 2>/dev/null; then
            return 0
        fi
        sleep 1
    done
    return 1
}
```

### 2. Elegant Simplicity

**✅ DO:**
```bash
# Clear, readable pattern composition
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

log_info "Processing file: $filename"
process_file "$filename" || handle_error $LINENO "File processing failed"
```

**❌ DON'T:**
```bash
# Complex, nested function calls
source patterns/logging/simple-logging.sh && \
source patterns/error-handling/simple-error-handling.sh && \
log_info "Processing file: $filename" && \
(process_file "$filename" || (log_error "File processing failed" && exit 1))
```

### 3. Claude AI Optimization

**✅ DO:**
```bash
# Self-documenting code with clear intent
validate_prerequisites() {
    log_info "Validating system prerequisites"
    
    check_command_exists "git" || handle_error $LINENO "Git is required for version control"
    check_command_exists "curl" || handle_error $LINENO "Curl is required for downloads"
    
    log_success "Prerequisites validation completed"
}
```

**❌ DON'T:**
```bash
# Cryptic, unclear code
chk_prereq() {
    for c in git curl; do
        which $c >/dev/null || exit 1
    done
}
```

---

## Pattern Selection Guidelines

### Essential Patterns (Always Include)

**Logging + Error Handling:**
```bash
# Minimum viable pattern set
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

# Every script should have these two patterns
log_info "Script starting with essential patterns"
```

**Reasoning:** These provide basic observability and graceful failure handling.

### Standard Patterns (Most Projects)

**Logging + Error Handling + Configuration + Testing:**
```bash
# Standard pattern set for most projects
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/testing/simple-test-runner.sh

# This covers 80% of use cases
database_url=$(get_config "DATABASE_URL" ".env" "sqlite://local.db")
log_info "Using database: $database_url"
```

**Reasoning:** Adds configuration management and testing capabilities for robust applications.

### Enterprise Patterns (Production Systems)

**Full Pattern Suite:**
```bash
# Enterprise-grade pattern set
patterns_to_load=(
    "logging/simple-logging.sh"
    "error-handling/simple-error-handling.sh"
    "configuration/config-reader.sh"
    "testing/simple-test-runner.sh"
    "security/security-basics.sh"
    "quality-gates/quality-check.sh"
    "project-validation/project-validator.sh"
)

for pattern in "${patterns_to_load[@]}"; do
    source "patterns/$pattern"
done

log_info "Enterprise patterns loaded successfully"
```

**Reasoning:** Comprehensive coverage for production systems requiring security, quality, and validation.

### Pattern Selection Decision Tree

```
Start
├── Is this a simple utility script?
│   └── Yes → Use Essential Patterns (Logging + Error Handling)
├── Is this a development project?
│   └── Yes → Use Standard Patterns (+ Configuration + Testing)
├── Is this a production system?
│   └── Yes → Use Enterprise Patterns (+ Security + Quality Gates)
└── Is this a CI/CD pipeline?
    └── Yes → Use Full Pattern Suite
```

---

## Code Organization

### Project Structure

**✅ Recommended Structure:**
```
project/
├── patterns/                    # Claude Code Builder patterns
│   ├── logging/
│   ├── error-handling/
│   └── ...
├── scripts/                     # Project scripts using patterns
│   ├── setup.sh
│   ├── deploy.sh
│   └── test.sh
├── lib/                         # Custom functions
│   └── project-specific.sh
├── config/                      # Configuration files
│   ├── .env
│   └── settings.yaml
└── docs/                        # Documentation
    └── README.md
```

### Script Organization

**✅ Standard Script Template:**
```bash
#!/bin/bash
# Script: deploy.sh
# Purpose: Deploy application with quality gates
# Author: Team Name
# Version: 1.0.0

set -euo pipefail

# Load required patterns
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/quality-gates/quality-check.sh

# Script constants
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly APP_NAME=$(get_config "APP_NAME" ".env" "my-app")

# Main function
main() {
    log_info "Starting deployment for $APP_NAME"
    
    validate_environment
    run_quality_checks || handle_error $LINENO "Quality checks failed"
    deploy_application
    
    log_success "Deployment completed successfully"
}

# Helper functions
validate_environment() {
    log_info "Validating deployment environment"
    check_command_exists "docker" || handle_error $LINENO "Docker is required"
    # Additional validation logic
}

deploy_application() {
    log_info "Deploying application"
    # Deployment logic
}

# Execute main function if script is run directly
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
```

### Function Organization

**✅ Clear Function Structure:**
```bash
# Group related functions together
# ================================
# Configuration Functions
# ================================
load_configuration() {
    log_info "Loading configuration"
    # Configuration loading logic
}

validate_configuration() {
    log_info "Validating configuration"
    # Configuration validation logic
}

# ================================
# Deployment Functions
# ================================
prepare_deployment() {
    log_info "Preparing deployment"
    # Preparation logic
}

execute_deployment() {
    log_info "Executing deployment"
    # Execution logic
}
```

---

## Performance Best Practices

### Pattern Loading Optimization

**✅ Conditional Loading:**
```bash
# Load patterns only when needed
if [[ "${ENABLE_TESTING:-false}" == "true" ]]; then
    source patterns/testing/simple-test-runner.sh
    log_info "Testing patterns loaded"
fi

if [[ "${ENVIRONMENT:-development}" == "production" ]]; then
    source patterns/security/security-basics.sh
    source patterns/quality-gates/quality-check.sh
    log_info "Production patterns loaded"
fi
```

**✅ Caching Pattern Loading:**
```bash
# Cache pattern loading in environment
if [[ -z "${PATTERNS_LOADED:-}" ]]; then
    source patterns/logging/simple-logging.sh
    source patterns/error-handling/simple-error-handling.sh
    export PATTERNS_LOADED=true
    log_info "Patterns loaded and cached"
fi
```

### Performance Monitoring

**✅ Built-in Performance Tracking:**
```bash
# Wrap expensive operations with timing
time_operation() {
    local operation_name="$1"
    shift
    
    local start_time=$(date +%s%N)
    "$@"
    local end_time=$(date +%s%N)
    
    local duration=$(( (end_time - start_time) / 1000000 ))
    log_info "$operation_name completed in ${duration}ms"
    
    # Alert on slow operations
    if [[ $duration -gt 5000 ]]; then
        log_warn "$operation_name took longer than 5 seconds: ${duration}ms"
    fi
}

# Usage
time_operation "Database migration" run_migration
time_operation "Test suite" run_all_tests
```

### Memory Management

**✅ Cleanup Resources:**
```bash
# Clean up temporary files and resources
cleanup() {
    log_info "Cleaning up resources"
    [[ -d "$TEMP_DIR" ]] && rm -rf "$TEMP_DIR"
    [[ -f "$PID_FILE" ]] && rm -f "$PID_FILE"
}

# Set up cleanup trap
trap cleanup EXIT

# Create temporary directory
TEMP_DIR=$(mktemp -d)
log_info "Using temporary directory: $TEMP_DIR"
```

---

## Security Best Practices

### Input Validation

**✅ Always Validate User Input:**
```bash
source patterns/security/security-basics.sh

validate_user_input() {
    local username="$1"
    local email="$2"
    
    # Validate username format
    validate_input "$username" "^[a-zA-Z0-9_-]+$" 32 || \
        handle_error $LINENO "Invalid username format"
    
    # Validate email format
    validate_input "$email" "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 254 || \
        handle_error $LINENO "Invalid email format"
    
    log_info "User input validation passed"
}
```

### Secret Management

**✅ Secure Configuration Handling:**
```bash
# Never log sensitive configuration
load_secrets() {
    local api_key
    api_key=$(get_config "API_KEY" ".env" "")
    
    [[ -n "$api_key" ]] || handle_error $LINENO "API_KEY is required"
    
    # Don't log the actual key value
    log_info "API key loaded successfully (length: ${#api_key})"
    
    # Use readonly for sensitive variables
    readonly API_KEY="$api_key"
}

# ❌ DON'T DO THIS:
# log_info "Using API key: $API_KEY"  # Never log secrets!
```

### Security Scanning

**✅ Regular Security Validation:**
```bash
# Run security scan before deployment
validate_security() {
    log_info "Running security validation"
    
    basic_security_scan || handle_error $LINENO "Security scan failed"
    
    # Additional custom security checks
    check_file_permissions
    validate_dependencies
    
    log_success "Security validation completed"
}

check_file_permissions() {
    log_info "Checking file permissions"
    
    # Ensure sensitive files have correct permissions
    [[ -f ".env" ]] && chmod 600 .env
    [[ -f "private.key" ]] && chmod 600 private.key
}
```

---

## Testing Best Practices

### Test Organization

**✅ Structured Testing Approach:**
```bash
source patterns/testing/simple-test-runner.sh

# Group tests by functionality
run_unit_tests() {
    log_info "Running unit tests"
    
    run_test "Configuration loading" test_config_loading
    run_test "Input validation" test_input_validation
    run_test "Error handling" test_error_handling
}

run_integration_tests() {
    log_info "Running integration tests"
    
    run_test "Database connection" test_database_connection
    run_test "API endpoints" test_api_endpoints
    run_test "File operations" test_file_operations
}

# Individual test functions
test_config_loading() {
    local test_config="test.env"
    echo "TEST_VALUE=123" > "$test_config"
    
    local value
    value=$(get_config "TEST_VALUE" "$test_config" "")
    assert_equals "123" "$value" "Config value should be loaded correctly"
    
    rm -f "$test_config"
}
```

### Test Data Management

**✅ Clean Test Environment:**
```bash
# Set up clean test environment
setup_test_environment() {
    log_info "Setting up test environment"
    
    # Create temporary test directory
    TEST_DIR=$(mktemp -d)
    export TEST_CONFIG="$TEST_DIR/test.env"
    
    # Create test configuration
    cat > "$TEST_CONFIG" << EOF
DATABASE_URL=sqlite://test.db
LOG_LEVEL=DEBUG
ENVIRONMENT=test
EOF
    
    log_info "Test environment ready: $TEST_DIR"
}

# Clean up test environment
cleanup_test_environment() {
    log_info "Cleaning up test environment"
    [[ -d "$TEST_DIR" ]] && rm -rf "$TEST_DIR"
}

# Test lifecycle management
run_all_tests() {
    setup_test_environment
    trap cleanup_test_environment EXIT
    
    run_unit_tests
    run_integration_tests
    
    log_success "All tests completed"
}
```

### Assertion Best Practices

**✅ Descriptive Assertions:**
```bash
# Good: Descriptive assertion messages
test_user_creation() {
    local user_id
    user_id=$(create_user "testuser" "test@example.com")
    
    assert_equals "3" "$user_id" "User ID should be 3 for third user created"
    
    local user_email
    user_email=$(get_user_email "$user_id")
    assert_equals "test@example.com" "$user_email" "Email should match input"
    
    assert_contains "$user_email" "@" "Email should contain @ symbol"
}

# Test error conditions
test_user_creation_validation() {
    # Test should fail with invalid email
    if create_user "testuser" "invalid-email"; then
        handle_error $LINENO "Should have failed with invalid email"
    fi
    
    log_success "Email validation working correctly"
}
```

---

## Documentation Best Practices

### Code Documentation

**✅ Self-Documenting Code:**
```bash
# Function documentation follows standard format
# Purpose: Create user account with validation and logging
# Parameters:
#   $1: username (string, 3-32 chars, alphanumeric + underscore)
#   $2: email (string, valid email format)
# Returns: user_id (integer) or exits on error
# Example: user_id=$(create_user "john_doe" "john@example.com")
create_user() {
    local username="$1"
    local email="$2"
    
    log_info "Creating user account for: $username"
    
    # Validate inputs
    validate_input "$username" "^[a-zA-Z0-9_]+$" 32 || \
        handle_error $LINENO "Invalid username format"
    
    validate_input "$email" "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 254 || \
        handle_error $LINENO "Invalid email format"
    
    # Create user logic here
    local user_id="123"
    
    log_success "User created successfully with ID: $user_id"
    echo "$user_id"
}
```

### README Documentation

**✅ Comprehensive README Structure:**
```markdown
# Project Name

## Quick Start

```bash
# Install patterns
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash

# Run the application
./scripts/start.sh
```

## Usage Examples

### Basic Usage
```bash
# Load essential patterns
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

# Your code here
log_info "Application starting"
```

### Advanced Usage
```bash
# Load all patterns for full functionality
for pattern in patterns/*/simple-*.sh; do
    source "$pattern"
done

# Run quality checks
run_quality_checks || handle_error $LINENO "Quality checks failed"
```

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `DATABASE_URL` | `sqlite://local.db` | Database connection string |
| `LOG_LEVEL` | `INFO` | Logging verbosity level |
| `ENVIRONMENT` | `development` | Application environment |

## Testing

```bash
# Run all tests
./scripts/test.sh

# Run specific test suite
source patterns/testing/simple-test-runner.sh
run_test "Configuration" test_config_loading
```
```

---

## CI/CD Best Practices

### Pipeline Configuration

**✅ Staged Pipeline Approach:**
```yaml
# .github/workflows/ci.yml
name: CI/CD Pipeline

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Install Claude Patterns
      run: |
        curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
    - name: Cache Patterns
      uses: actions/cache@v3
      with:
        path: patterns/
        key: claude-patterns-${{ hashFiles('**/patterns/**') }}

  quality:
    needs: setup
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Restore Patterns Cache
      uses: actions/cache@v3
      with:
        path: patterns/
        key: claude-patterns-${{ hashFiles('**/patterns/**') }}
    - name: Run Quality Checks
      run: |
        source patterns/quality-gates/quality-check.sh
        export LOG_COLOR=false
        run_quality_checks

  security:
    needs: setup
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Restore Patterns Cache
      uses: actions/cache@v3
      with:
        path: patterns/
        key: claude-patterns-${{ hashFiles('**/patterns/**') }}
    - name: Security Scan
      run: |
        source patterns/security/security-basics.sh
        basic_security_scan

  test:
    needs: [quality, security]
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Restore Patterns Cache
      uses: actions/cache@v3
      with:
        path: patterns/
        key: claude-patterns-${{ hashFiles('**/patterns/**') }}
    - name: Run Tests
      run: |
        source patterns/testing/simple-test-runner.sh
        run_all_tests

  deploy:
    needs: [test]
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'
    steps:
    - uses: actions/checkout@v3
    - name: Deploy
      run: |
        source patterns/logging/simple-logging.sh
        log_info "Deploying to production"
        # Deployment logic here
```

### Environment-Specific Configuration

**✅ Environment Isolation:**
```bash
# Environment configuration
setup_environment() {
    local environment="${ENVIRONMENT:-development}"
    
    log_info "Setting up $environment environment"
    
    case "$environment" in
        "development")
            export DEBUG=1
            export LOG_LEVEL=DEBUG
            ;;
        "staging")
            export DEBUG=0
            export LOG_LEVEL=INFO
            source patterns/quality-gates/quality-check.sh
            ;;
        "production")
            export DEBUG=0
            export LOG_LEVEL=ERROR
            export LOG_COLOR=false
            source patterns/security/security-basics.sh
            source patterns/quality-gates/quality-check.sh
            basic_security_scan || handle_error $LINENO "Security scan failed"
            ;;
        *)
            handle_error $LINENO "Unknown environment: $environment"
            ;;
    esac
    
    log_success "Environment $environment configured successfully"
}
```

---

## Error Handling Best Practices

### Graceful Error Handling

**✅ Context-Rich Error Messages:**
```bash
# Provide context with error messages
process_file() {
    local file_path="$1"
    local operation="$2"
    
    log_info "Processing file: $file_path (operation: $operation)"
    
    # Check file exists
    [[ -f "$file_path" ]] || handle_error $LINENO "File not found: $file_path"
    
    # Check file is readable
    [[ -r "$file_path" ]] || handle_error $LINENO "File not readable: $file_path (check permissions)"
    
    # Perform operation with error context
    case "$operation" in
        "validate")
            validate_file_format "$file_path" || \
                handle_error $LINENO "File validation failed: $file_path (invalid format)"
            ;;
        "process")
            transform_file "$file_path" || \
                handle_error $LINENO "File processing failed: $file_path (transformation error)"
            ;;
        *)
            handle_error $LINENO "Unknown operation: $operation (supported: validate, process)"
            ;;
    esac
    
    log_success "File processed successfully: $file_path"
}
```

### Error Recovery

**✅ Retry Logic with Backoff:**
```bash
# Implement retry logic for transient failures
retry_with_backoff() {
    local max_attempts="$1"
    local delay="$2"
    local command="$3"
    shift 3
    
    local attempt=1
    while [[ $attempt -le $max_attempts ]]; do
        log_info "Attempt $attempt/$max_attempts: $command"
        
        if $command "$@"; then
            log_success "Command succeeded on attempt $attempt"
            return 0
        fi
        
        if [[ $attempt -eq $max_attempts ]]; then
            handle_error $LINENO "Command failed after $max_attempts attempts: $command"
        fi
        
        local wait_time=$((delay * attempt))
        log_warn "Command failed, retrying in ${wait_time}s..."
        sleep $wait_time
        
        ((attempt++))
    done
}

# Usage
retry_with_backoff 3 2 curl -f "https://api.example.com/health"
```

---

## Configuration Management

### Secure Configuration Loading

**✅ Environment-Based Configuration:**
```bash
# Load configuration with security and validation
load_application_config() {
    log_info "Loading application configuration"
    
    # Define required configuration keys
    local required_configs=(
        "DATABASE_URL"
        "API_KEY"
        "ENVIRONMENT"
    )
    
    # Load each required configuration
    for config_key in "${required_configs[@]}"; do
        local config_value
        config_value=$(get_config "$config_key" ".env" "")
        
        [[ -n "$config_value" ]] || \
            handle_error $LINENO "Required configuration missing: $config_key"
        
        # Don't log sensitive values
        if [[ "$config_key" =~ (KEY|SECRET|PASSWORD|TOKEN) ]]; then
            log_info "Loaded $config_key (length: ${#config_value})"
        else
            log_info "Loaded $config_key: $config_value"
        fi
        
        # Export to environment
        export "$config_key=$config_value"
    done
    
    log_success "Configuration loaded successfully"
}
```

### Configuration Validation

**✅ Validate Configuration Values:**
```bash
# Validate configuration after loading
validate_configuration() {
    log_info "Validating configuration"
    
    # Validate database URL format
    local db_url="$DATABASE_URL"
    if [[ ! "$db_url" =~ ^(sqlite|postgresql|mysql):// ]]; then
        handle_error $LINENO "Invalid DATABASE_URL format: $db_url"
    fi
    
    # Validate environment
    local env="$ENVIRONMENT"
    case "$env" in
        "development"|"staging"|"production")
            log_info "Environment validated: $env"
            ;;
        *)
            handle_error $LINENO "Invalid ENVIRONMENT: $env (must be: development, staging, production)"
            ;;
    esac
    
    # Validate API key length
    local api_key="$API_KEY"
    if [[ ${#api_key} -lt 20 ]]; then
        handle_error $LINENO "API_KEY appears too short (length: ${#api_key})"
    fi
    
    log_success "Configuration validation completed"
}
```

---

## Monitoring and Observability

### Structured Logging

**✅ Consistent Log Format:**
```bash
# Use structured logging for better observability
log_structured() {
    local level="$1"
    local component="$2"
    local message="$3"
    local extra="${4:-}"
    
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local structured_log="{\"timestamp\":\"$timestamp\",\"level\":\"$level\",\"component\":\"$component\",\"message\":\"$message\""
    
    if [[ -n "$extra" ]]; then
        structured_log+=",\"extra\":$extra"
    fi
    
    structured_log+="}"
    
    case "$level" in
        "INFO")
            echo "$structured_log" >&1
            ;;
        "WARN"|"ERROR")
            echo "$structured_log" >&2
            ;;
    esac
}

# Usage
log_structured "INFO" "auth" "User login successful" '{"user_id":"123","ip":"192.168.1.1"}'
log_structured "ERROR" "database" "Connection failed" '{"error":"timeout","duration_ms":5000}'
```

### Health Checks

**✅ Comprehensive Health Monitoring:**
```bash
# Application health check
health_check() {
    log_info "Performing health check"
    
    local health_status="healthy"
    local checks_passed=0
    local total_checks=0
    
    # Database connectivity check
    ((total_checks++))
    if check_database_connection; then
        log_info "✅ Database connection: OK"
        ((checks_passed++))
    else
        log_error "❌ Database connection: FAILED"
        health_status="unhealthy"
    fi
    
    # API endpoint check
    ((total_checks++))
    if check_api_endpoints; then
        log_info "✅ API endpoints: OK"
        ((checks_passed++))
    else
        log_error "❌ API endpoints: FAILED"
        health_status="unhealthy"
    fi
    
    # Disk space check
    ((total_checks++))
    if check_disk_space; then
        log_info "✅ Disk space: OK"
        ((checks_passed++))
    else
        log_warn "⚠️ Disk space: WARNING"
        health_status="degraded"
    fi
    
    # Report health status
    log_info "Health check completed: $health_status ($checks_passed/$total_checks checks passed)"
    
    case "$health_status" in
        "healthy")
            return 0
            ;;
        "degraded")
            return 1
            ;;
        "unhealthy")
            return 2
            ;;
    esac
}
```

---

## Team Collaboration

### Code Review Guidelines

**✅ Pattern Usage Review Checklist:**

1. **Pattern Selection:**
   - [ ] Appropriate patterns chosen for the use case
   - [ ] No over-engineering with unnecessary patterns
   - [ ] Performance impact considered

2. **Error Handling:**
   - [ ] All commands have appropriate error handling
   - [ ] Error messages provide useful context
   - [ ] Line numbers included in error reports

3. **Logging:**
   - [ ] Appropriate log levels used
   - [ ] No sensitive information logged
   - [ ] Log messages are clear and actionable

4. **Security:**
   - [ ] Input validation implemented
   - [ ] No hardcoded secrets
   - [ ] Security scan passes

5. **Testing:**
   - [ ] Tests cover main functionality
   - [ ] Error conditions tested
   - [ ] Test environment properly isolated

### Team Standards

**✅ Establish Team Conventions:**
```bash
# Team conventions file: lib/team-standards.sh

# Standard pattern loading for all team scripts
load_team_patterns() {
    log_info "Loading team standard patterns"
    
    source patterns/logging/simple-logging.sh
    source patterns/error-handling/simple-error-handling.sh
    source patterns/configuration/config-reader.sh
    
    # Set team-specific defaults
    export LOG_COLOR=${LOG_COLOR:-true}
    export DEBUG=${DEBUG:-0}
    
    log_info "Team patterns loaded successfully"
}

# Standard error handling wrapper
team_exec() {
    local description="$1"
    shift
    
    log_info "Executing: $description"
    
    if "$@"; then
        log_success "$description completed successfully"
    else
        handle_error $LINENO "$description failed"
    fi
}

# Usage in team scripts
# source lib/team-standards.sh
# load_team_patterns
# team_exec "Database migration" run_migration
```

### Knowledge Sharing

**✅ Pattern Documentation Templates:**
```bash
# Template for documenting custom patterns
# File: docs/custom-pattern-template.md

# Custom Pattern: [Pattern Name]

## Purpose
Brief description of what this pattern does and why it's needed.

## Usage
```bash
# Load the pattern
source patterns/custom/my-pattern.sh

# Use the pattern
my_pattern_function "parameter"
```

## Functions

### `my_pattern_function(parameter)`
- **Purpose:** What this function does
- **Parameters:** Description of parameters
- **Returns:** What it returns
- **Example:** Usage example

## Integration
How this pattern works with other Claude Code Builder patterns.

## Testing
How to test this pattern.

## Maintenance
Who maintains this pattern and how to report issues.
```

---

## Common Anti-Patterns to Avoid

### ❌ Performance Anti-Patterns

```bash
# DON'T: Load all patterns when only one is needed
for pattern in patterns/*/simple-*.sh; do
    source "$pattern"
done
log_info "Only need logging but loaded everything"

# DO: Load only what you need
source patterns/logging/simple-logging.sh
log_info "Efficient pattern loading"
```

### ❌ Security Anti-Patterns

```bash
# DON'T: Log sensitive information
log_info "User password: $password"
log_info "API key: $api_key"

# DO: Log safely
log_info "User authenticated successfully"
log_info "API key loaded (length: ${#api_key})"
```

### ❌ Error Handling Anti-Patterns

```bash
# DON'T: Silent failures
cp important-file backup/ 2>/dev/null

# DO: Proper error handling
cp important-file backup/ || handle_error $LINENO "Failed to backup important file"
```

### ❌ Testing Anti-Patterns

```bash
# DON'T: Tests that don't clean up
test_file_creation() {
    echo "test" > /tmp/test-file
    [[ -f /tmp/test-file ]]
    # File left behind!
}

# DO: Clean test environment
test_file_creation() {
    local temp_file=$(mktemp)
    echo "test" > "$temp_file"
    [[ -f "$temp_file" ]]
    rm -f "$temp_file"
}
```

---

## Quality Gates Checklist

### Pre-Commit Checklist

- [ ] Appropriate patterns loaded
- [ ] Error handling implemented
- [ ] Input validation added
- [ ] Logging messages clear
- [ ] No hardcoded secrets
- [ ] Tests written and passing
- [ ] Security scan clean
- [ ] Performance acceptable

### Code Review Checklist

- [ ] Pattern usage follows team standards
- [ ] Error messages provide useful context
- [ ] Configuration properly externalized
- [ ] Security best practices followed
- [ ] Documentation updated
- [ ] Tests cover new functionality

### Deployment Checklist

- [ ] All quality gates pass
- [ ] Security scan complete
- [ ] Performance benchmarks met
- [ ] Configuration validated
- [ ] Rollback plan prepared
- [ ] Monitoring configured

---

For more detailed information, see:
- [API Reference](API_REFERENCE.md)
- [Integration Guide](INTEGRATION_GUIDE.md)
- [Security Guidelines](SECURITY_GUIDELINES.md)
- [Troubleshooting Guide](TROUBLESHOOTING.md)