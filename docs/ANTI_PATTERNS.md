# Anti-Patterns Guide 🚫

**Technical:** Comprehensive documentation of common mistakes, bad practices, and anti-patterns when using Claude Code Builder patterns, with corrective solutions and impact analysis.

**Simple:** Like a "what NOT to do" guide - learn from common mistakes others have made so you don't have to make them yourself.

**Connection:** Teaches defensive programming and design pattern best practices essential for maintainable software architecture.

---

## 🎯 Why Anti-Patterns Matter

Understanding anti-patterns is crucial for:
- **Preventing common mistakes** that lead to fragile code
- **Maintaining pattern integrity** and architectural consistency
- **Ensuring security** by avoiding dangerous practices
- **Optimizing performance** by avoiding inefficient patterns
- **Improving maintainability** by following best practices

---

## 🚨 Critical Anti-Patterns

### 1. Pattern Modification Anti-Pattern
**The Problem:** Directly modifying pattern files or overriding pattern functions

#### ❌ **WRONG: Direct Pattern Modification**
```bash
# DON'T modify pattern files directly
# File: patterns/error-handling/simple-error-handling.sh
log_info() {
    # Modified the original function - BAD!
    echo "CUSTOM: $*" | tee -a custom.log
}
```

#### ❌ **WRONG: Function Override**
```bash
source ./patterns/error-handling/simple-error-handling.sh

# Overriding pattern function - BAD!
log_info() {
    echo "MY VERSION: $*"
}
```

#### ✅ **RIGHT: Wrapper Functions**
```bash
source ./patterns/error-handling/simple-error-handling.sh

# Create wrapper functions instead
custom_log_info() {
    log_info "CUSTOM: $*"
    echo "$*" >> custom.log
}

enhanced_log_info() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    log_info "[$timestamp] $*"
}
```

**Impact:** Direct modification breaks pattern updates and violates encapsulation
**Solution:** Always use composition and wrapper functions

---

### 2. Global State Pollution Anti-Pattern
**The Problem:** Setting global variables that interfere with pattern behavior

#### ❌ **WRONG: Global Variable Conflicts**
```bash
# These globals can break patterns
DEBUG=1          # Conflicts with logging pattern
TEST_MODE=true   # Conflicts with testing pattern
LOG_COLOR=false  # Might override pattern settings

source ./patterns/logging/simple-logging.sh
source ./patterns/testing/simple-test-runner.sh
```

#### ❌ **WRONG: Environment Pollution**
```bash
# Polluting environment before loading patterns
export PATH="/custom/path:$PATH"
export HOME="/tmp"  # This can break patterns!

source ./patterns/dependencies/dependency-checker.sh
```

#### ✅ **RIGHT: Pattern-Specific Configuration**
```bash
# Load patterns first
source ./patterns/logging/simple-logging.sh
source ./patterns/testing/simple-test-runner.sh

# Then configure pattern-specific settings
LOG_COLOR=${LOG_COLOR:-true}    # Use pattern's variable
TEST_MODE=${TEST_MODE:-false}   # Respect existing setting

# Use local scope for custom variables
setup_custom_env() {
    local custom_debug=1
    local custom_path="/my/custom/path"
    # Use locally scoped variables
}
```

**Impact:** Global pollution causes unpredictable behavior and pattern conflicts
**Solution:** Use pattern-specific variables and local scope

---

### 3. Order Dependency Anti-Pattern
**The Problem:** Creating code that breaks when patterns are loaded in different orders

#### ❌ **WRONG: Order-Dependent Code**
```bash
# This only works if error-handling loads first
log_error "This might not work"

# Loading order matters - BAD!
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh

# This breaks if logging wasn't loaded
log_info "This might fail"
```

#### ❌ **WRONG: Immediate Function Calls**
```bash
source ./patterns/error-handling/simple-error-handling.sh
log_info "Loading complete"  # log_info might not exist yet!

source ./patterns/logging/simple-logging.sh
```

#### ✅ **RIGHT: Defer Function Calls**
```bash
# Load all patterns first
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh
source ./patterns/testing/simple-test-runner.sh

# Then use functions in main workflow
main() {
    log_info "All patterns loaded successfully"
    
    if run_all_tests; then
        log_info "Tests passed"
    else
        log_error "Tests failed"
    fi
}

# Call main after all loading is complete
main "$@"
```

#### ✅ **RIGHT: Defensive Loading**
```bash
# Check function availability before use
safe_log() {
    if command -v log_info >/dev/null 2>&1; then
        log_info "$*"
    else
        echo "[INFO] $*"
    fi
}

source ./patterns/error-handling/simple-error-handling.sh
safe_log "Error handling loaded"

source ./patterns/logging/simple-logging.sh
safe_log "Logging loaded"
```

**Impact:** Order dependencies make code fragile and hard to maintain
**Solution:** Load all patterns first, then use functions; implement defensive checks

---

### 4. Security Anti-Pattern
**The Problem:** Using patterns in ways that introduce security vulnerabilities

#### ❌ **WRONG: Unsafe Input Handling**
```bash
source ./patterns/error-handling/simple-error-handling.sh

# Using user input directly in logging - DANGEROUS!
log_info "User input: $(cat $1)"  # Command injection risk!

# Unsafe error handling
handle_user_error() {
    eval "log_error $1"  # Never use eval with user input!
}
```

#### ❌ **WRONG: Secrets in Logs**
```bash
source ./patterns/logging/simple-logging.sh

# Logging sensitive information - BAD!
DATABASE_PASSWORD="secret123"
log_info "Connecting with password: $DATABASE_PASSWORD"

# Error messages revealing sensitive paths
log_error "Failed to read /home/user/.ssh/id_rsa"
```

#### ✅ **RIGHT: Safe Input Handling**
```bash
source ./patterns/error-handling/simple-error-handling.sh

# Sanitize inputs
safe_log_user_input() {
    local user_input="$1"
    # Sanitize input by removing special characters
    local safe_input=$(echo "$user_input" | tr -cd '[:alnum:][:space:].-_')
    log_info "User input: $safe_input"
}

# Safe error handling
handle_user_error() {
    local error_message="$1"
    log_error "User error: ${error_message//[^[:alnum:][:space:].-_]/}"
}
```

#### ✅ **RIGHT: Secrets Management**
```bash
source ./patterns/logging/simple-logging.sh
source ./patterns/configuration/config-reader.sh

# Safe secrets handling
connect_database() {
    local db_user=$(get_config "DB_USER" ".env" "")
    local db_host=$(get_config "DB_HOST" ".env" "localhost")
    
    # Never log passwords
    log_info "Connecting to database as $db_user@$db_host"
    
    # Use environment variables for secrets
    local db_password="${DB_PASSWORD}"  # From environment, not logged
    
    if [[ -z "$db_password" ]]; then
        log_error "Database password not found in environment"
        return 1
    fi
}
```

**Impact:** Security anti-patterns can lead to data breaches and system compromise
**Solution:** Always sanitize inputs, never log secrets, validate all user data

---

### 5. Performance Anti-Pattern
**The Problem:** Using patterns inefficiently, causing performance degradation

#### ❌ **WRONG: Inefficient Pattern Loading**
```bash
# Loading patterns in loops - VERY BAD!
for file in *.txt; do
    source ./patterns/error-handling/simple-error-handling.sh  # Reloaded every time!
    log_info "Processing $file"
done
```

#### ❌ **WRONG: Nested Pattern Calls**
```bash
source ./patterns/testing/simple-test-runner.sh

# Calling expensive operations repeatedly
validate_all_files() {
    for file in *.js; do
        run_all_tests  # This runs ALL tests for each file!
    done
}
```

#### ❌ **WRONG: Excessive Logging**
```bash
source ./patterns/logging/simple-logging.sh

# Logging in tight loops
process_large_file() {
    while IFS= read -r line; do
        log_info "Processing line: $line"  # Logs every line!
    done < large_file.txt
}
```

#### ✅ **RIGHT: Efficient Pattern Usage**
```bash
# Load patterns once, outside loops
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh

# Batch operations
process_files() {
    local file_count=0
    log_info "Starting file processing..."
    
    for file in *.txt; do
        # Process file (no logging in loop)
        ((file_count++))
    done
    
    log_info "Processed $file_count files successfully"
}
```

#### ✅ **RIGHT: Conditional Logging**
```bash
source ./patterns/logging/simple-logging.sh

# Use debug levels to control verbosity
VERBOSE=${VERBOSE:-false}

process_large_file() {
    local line_count=0
    
    while IFS= read -r line; do
        # Only log if verbose mode is enabled
        if [[ "$VERBOSE" == "true" ]]; then
            log_info "Line $((++line_count)): Processing..."
        fi
        # Process line
    done < large_file.txt
    
    log_info "Processed $line_count lines"
}
```

**Impact:** Performance anti-patterns cause slow execution and resource waste
**Solution:** Load patterns once, batch operations, use conditional logging

---

### 6. Testing Anti-Pattern
**The Problem:** Poor testing practices that don't validate pattern behavior

#### ❌ **WRONG: Testing Implementation Details**
```bash
# Testing internal variables - fragile!
test_logging_internals() {
    source ./patterns/logging/simple-logging.sh
    
    # Don't test internal variables
    if [[ "$LOG_COLOR" == "true" ]]; then
        echo "Test passed"
    fi
}
```

#### ❌ **WRONG: No Test Isolation**
```bash
# Tests affecting each other
test_error_handling() {
    source ./patterns/error-handling/simple-error-handling.sh
    DEBUG=1  # This affects other tests!
    log_error "test"
}

test_logging() {
    source ./patterns/logging/simple-logging.sh
    # DEBUG is still set from previous test!
    log_info "test"
}
```

#### ✅ **RIGHT: Test Behavior, Not Implementation**
```bash
# Test public interfaces only
test_logging_behavior() {
    source ./patterns/logging/simple-logging.sh
    
    # Test actual output behavior
    local output=$(log_info "test message" 2>&1)
    if [[ "$output" =~ "test message" ]]; then
        echo "✅ Logging test passed"
    else
        echo "❌ Logging test failed"
    fi
}
```

#### ✅ **RIGHT: Isolated Tests**
```bash
# Each test is isolated
run_isolated_test() {
    local test_name="$1"
    local test_function="$2"
    
    # Run in subshell for isolation
    (
        unset DEBUG LOG_COLOR TEST_MODE  # Clean environment
        eval "$test_function"
    )
}

run_isolated_test "error_handling" "test_error_handling"
run_isolated_test "logging" "test_logging"
```

**Impact:** Poor testing leads to fragile tests that break when implementation changes
**Solution:** Test behavior through public interfaces, isolate tests properly

---

## 🎯 Pattern-Specific Anti-Patterns

### Error Handling Anti-Patterns

#### ❌ **WRONG: Ignoring Error Codes**
```bash
source ./patterns/error-handling/simple-error-handling.sh

# Ignoring function return codes
some_command
log_info "Command completed"  # No error checking!
```

#### ✅ **RIGHT: Proper Error Checking**
```bash
source ./patterns/error-handling/simple-error-handling.sh

if some_command; then
    log_info "Command completed successfully"
else
    log_error "Command failed"
    handle_error $LINENO
fi
```

### Configuration Anti-Patterns

#### ❌ **WRONG: Hardcoded Values**
```bash
# Hardcoded configuration - BAD!
DATABASE_URL="postgres://user:pass@localhost/db"
API_KEY="sk-1234567890"
```

#### ✅ **RIGHT: Configuration Pattern Usage**
```bash
source ./patterns/configuration/config-reader.sh

DATABASE_URL=$(get_config "DATABASE_URL" ".env" "")
API_KEY=$(get_config "API_KEY" ".env" "")

if [[ -z "$DATABASE_URL" ]]; then
    log_error "DATABASE_URL not configured"
    exit 1
fi
```

### Dependencies Anti-Patterns

#### ❌ **WRONG: Assuming Dependencies**
```bash
# Assuming commands exist - BAD!
npm install
docker build .
kubectl apply -f config.yaml
```

#### ✅ **RIGHT: Dependency Validation**
```bash
source ./patterns/dependencies/dependency-checker.sh

if check_dependencies .; then
    log_info "All dependencies available"
    npm install
else
    log_error "Missing dependencies"
    exit 1
fi
```

---

## 🛡️ Prevention Strategies

### 1. Code Review Checklist
- [ ] No direct pattern modifications
- [ ] No global variable pollution
- [ ] Functions called only after pattern loading
- [ ] No secrets in logs or error messages
- [ ] Efficient pattern usage (not in loops)
- [ ] Proper error handling
- [ ] Test isolation maintained

### 2. Automated Detection
```bash
# Anti-pattern detection script
detect_anti_patterns() {
    local issues=0
    
    # Check for function overrides
    if grep -r "^log_info()\|^log_error()\|^handle_error()" --include="*.sh" .; then
        echo "❌ Function override detected"
        ((issues++))
    fi
    
    # Check for eval usage
    if grep -r "eval\s" --include="*.sh" .; then
        echo "❌ Dangerous eval usage detected"
        ((issues++))
    fi
    
    # Check for patterns loaded in loops
    if grep -A5 -B5 "for\|while" --include="*.sh" . | grep "source.*patterns"; then
        echo "❌ Pattern loading in loop detected"
        ((issues++))
    fi
    
    if [ $issues -eq 0 ]; then
        echo "✅ No anti-patterns detected"
    else
        echo "❌ $issues anti-pattern(s) found"
        return 1
    fi
}
```

### 3. Pattern Linting
```bash
# Pattern-specific linting
lint_pattern_usage() {
    local file="$1"
    local warnings=0
    
    # Check for order dependencies
    if grep -n "log_info\|log_error" "$file" | head -1 | grep -v "main()\|function"; then
        echo "⚠️  Possible order dependency in $file"
        ((warnings++))
    fi
    
    # Check for hardcoded values
    if grep -E "(password|secret|key).*=" "$file" | grep -v "get_config"; then
        echo "⚠️  Hardcoded secrets possible in $file"
        ((warnings++))
    fi
    
    echo "Pattern lint: $warnings warning(s) for $file"
    return $warnings
}
```

---

## 📚 Learning Resources

### 1. Pattern Examples
- ✅ **Good Examples**: See `/examples/composition-examples.sh`
- ❌ **Anti-Pattern Examples**: This document
- 🧪 **Test Cases**: See `/tests/pattern-functionality-test.sh`

### 2. Validation Tools
- **Pattern Health Check**: `./tools/architectural-dashboard.sh`
- **Security Scan**: `./patterns/security/security-basics.sh`
- **Composition Test**: `./examples/composition-examples.sh all`

### 3. Best Practices
- **Composition Guide**: `/patterns/COMPOSITION_GUIDE.md`
- **Security Guide**: `/docs/SECURITY.md`
- **Contributing Guide**: `/CONTRIBUTING.md`

---

## 🎯 Remember

**The Golden Rules:**
1. **Never modify patterns directly** - always compose
2. **Load patterns first** - use functions later
3. **Keep it secure** - never log secrets or use eval
4. **Test behavior** - not implementation details
5. **Stay efficient** - don't reload patterns unnecessarily

By avoiding these anti-patterns, you'll build more maintainable, secure, and performant systems with Claude Code Builder patterns! 🚀