# Claude Code Builder Troubleshooting Guide

> Comprehensive troubleshooting guide for resolving common issues with Claude Code Builder patterns

## Table of Contents

- [Quick Diagnostics](#quick-diagnostics)
- [Installation Issues](#installation-issues)
- [Pattern Loading Issues](#pattern-loading-issues)
- [Function Not Found Errors](#function-not-found-errors)
- [Permission Issues](#permission-issues)
- [Performance Issues](#performance-issues)
- [Configuration Issues](#configuration-issues)
- [Testing Issues](#testing-issues)
- [Security Issues](#security-issues)
- [CI/CD Issues](#cicd-issues)
- [Platform-Specific Issues](#platform-specific-issues)
- [Advanced Debugging](#advanced-debugging)
- [Getting Help](#getting-help)

---

## Quick Diagnostics

### Run the Diagnostic Script

First, run our comprehensive diagnostic script:

```bash
#!/bin/bash
# Quick diagnostic script
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/diagnose.sh | bash
```

### Manual Quick Check

If the diagnostic script isn't available, run these quick checks:

```bash
# Check if patterns directory exists
echo "=== Pattern Directory Check ==="
if [[ -d "patterns" ]]; then
    echo "✅ Patterns directory found"
    echo "Available patterns:"
    ls -la patterns/*/simple-*.sh | head -5
else
    echo "❌ Patterns directory not found"
    echo "Run: curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash"
fi

# Check shell version
echo "=== Shell Environment ==="
echo "Shell: $BASH_VERSION"
echo "Platform: $(uname -s)"
echo "Working directory: $(pwd)"

# Test basic pattern loading
echo "=== Pattern Loading Test ==="
if source patterns/logging/simple-logging.sh 2>/dev/null; then
    echo "✅ Basic pattern loading works"
    log_info "Logging pattern loaded successfully"
else
    echo "❌ Pattern loading failed"
fi
```

---

## Installation Issues

### Issue: Installation Script Fails

**Symptoms:**
```bash
curl: command not found
# or
Permission denied
# or
Network error
```

**Solutions:**

**For missing curl:**
```bash
# Ubuntu/Debian
sudo apt-get update && sudo apt-get install curl

# CentOS/RHEL
sudo yum install curl

# macOS (if Homebrew available)
brew install curl

# Alternative: use wget
wget -O- https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
```

**For permission issues:**
```bash
# Option 1: Run with explicit bash
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash

# Option 2: Download and run manually
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh -o install.sh
chmod +x install.sh
./install.sh

# Option 3: Manual installation
mkdir -p patterns
cd patterns
curl -sSL https://github.com/smenssink/claude-code-builder/archive/main.zip -o patterns.zip
unzip patterns.zip "*/patterns/*" -j
rm patterns.zip
```

**For network issues:**
```bash
# Check connectivity
ping github.com

# Try with verbose output
curl -v https://github.com/smenssink/claude-code-builder

# Use alternative installation method
git clone https://github.com/smenssink/claude-code-builder.git
cp -r claude-code-builder/patterns .
rm -rf claude-code-builder
```

### Issue: Git Clone Fails

**Symptoms:**
```bash
fatal: unable to access 'https://github.com/smenssink/claude-code-builder.git/': SSL certificate problem
```

**Solutions:**
```bash
# Option 1: Use HTTP instead of HTTPS (less secure)
git clone http://github.com/smenssink/claude-code-builder.git

# Option 2: Configure git to skip SSL verification (temporary)
git config --global http.sslVerify false
git clone https://github.com/smenssink/claude-code-builder.git
git config --global http.sslVerify true

# Option 3: Use SSH if configured
git clone git@github.com:smenssink/claude-code-builder.git

# Option 4: Direct download
curl -L https://github.com/smenssink/claude-code-builder/archive/main.zip -o main.zip
unzip main.zip
mv claude-code-builder-main/patterns .
rm -rf claude-code-builder-main main.zip
```

---

## Pattern Loading Issues

### Issue: "No such file or directory"

**Symptoms:**
```bash
bash: patterns/logging/simple-logging.sh: No such file or directory
```

**Diagnosis:**
```bash
# Check current directory
pwd
ls -la

# Check if patterns directory exists
ls -la patterns/

# Check specific pattern
ls -la patterns/logging/simple-logging.sh
```

**Solutions:**

**Solution 1: Verify pattern path**
```bash
# Use absolute path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/patterns/logging/simple-logging.sh"

# Or relative to script location
PATTERN_DIR="${BASH_SOURCE%/*}/patterns"
source "$PATTERN_DIR/logging/simple-logging.sh"
```

**Solution 2: Check and fix directory structure**
```bash
# Expected structure
patterns/
├── logging/
│   └── simple-logging.sh
├── error-handling/
│   └── simple-error-handling.sh
└── ...

# Fix if patterns are in wrong location
find . -name "simple-logging.sh" -type f
# Move to correct location if needed
```

**Solution 3: Reinstall patterns**
```bash
# Remove existing patterns
rm -rf patterns/

# Reinstall
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
```

### Issue: Pattern Loads but Functions Not Available

**Symptoms:**
```bash
# Pattern loads without error but functions don't work
source patterns/logging/simple-logging.sh
log_info "test"
bash: log_info: command not found
```

**Diagnosis:**
```bash
# Check if functions are defined
declare -F | grep log_info

# Check pattern content
cat patterns/logging/simple-logging.sh | head -10

# Check for shell compatibility
echo $BASH_VERSION
```

**Solutions:**

**Solution 1: Verify function definitions**
```bash
# Debug pattern loading
set -x
source patterns/logging/simple-logging.sh
set +x

# Check function availability
type log_info
```

**Solution 2: Shell compatibility fix**
```bash
# For older bash versions
if [[ ${BASH_VERSION%%.*} -lt 4 ]]; then
    echo "Warning: Bash version $BASH_VERSION may have compatibility issues"
fi

# Force bash execution
bash -c "source patterns/logging/simple-logging.sh && log_info 'test'"
```

**Solution 3: Check for syntax errors**
```bash
# Validate pattern syntax
bash -n patterns/logging/simple-logging.sh

# If errors found, reinstall
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
```

---

## Function Not Found Errors

### Issue: "command not found" for Pattern Functions

**Symptoms:**
```bash
log_info "Starting application"
bash: log_info: command not found

handle_error $LINENO "Something failed"
bash: handle_error: command not found
```

**Common Causes and Solutions:**

**Cause 1: Pattern not sourced**
```bash
# Problem: Forgot to source pattern
log_info "test"  # Fails

# Solution: Source the pattern first
source patterns/logging/simple-logging.sh
log_info "test"  # Works
```

**Cause 2: Sourcing in subshell**
```bash
# Problem: Sourcing in subshell (functions not available in parent)
(source patterns/logging/simple-logging.sh)
log_info "test"  # Fails

# Solution: Source in current shell
source patterns/logging/simple-logging.sh
log_info "test"  # Works
```

**Cause 3: Function name conflicts**
```bash
# Problem: Function redefined or conflicts
log_info() { echo "custom function"; }
source patterns/logging/simple-logging.sh
log_info "test"  # May use custom function

# Solution: Check function definitions
type log_info
declare -F log_info
```

**Debugging Function Availability:**
```bash
# List all available functions
declare -F

# Check specific function
declare -F log_info

# Show function definition
type log_info

# Test function in clean environment
bash -c "source patterns/logging/simple-logging.sh && declare -F log_info"
```

---

## Permission Issues

### Issue: Permission Denied on Pattern Files

**Symptoms:**
```bash
bash: ./patterns/logging/simple-logging.sh: Permission denied
```

**Solutions:**

**Solution 1: Fix file permissions**
```bash
# Make pattern files readable
chmod +r patterns/*/simple-*.sh

# Or make them executable (though not required for sourcing)
chmod +x patterns/*/simple-*.sh

# Fix directory permissions
chmod +x patterns/*/
```

**Solution 2: Use source instead of execute**
```bash
# Don't execute the file directly
./patterns/logging/simple-logging.sh  # Wrong

# Source the file instead
source patterns/logging/simple-logging.sh  # Correct
```

**Solution 3: Check ownership**
```bash
# Check file ownership
ls -la patterns/logging/simple-logging.sh

# Fix ownership if needed (use carefully)
sudo chown $USER:$USER patterns/*/simple-*.sh
```

### Issue: Permission Denied Writing Config Files

**Symptoms:**
```bash
echo "TEST=value" > .env
bash: .env: Permission denied
```

**Solutions:**
```bash
# Check directory permissions
ls -la .

# Check file permissions
ls -la .env

# Fix file permissions
chmod 644 .env

# Fix directory permissions
chmod 755 .

# Create file with proper permissions
touch .env
chmod 600 .env  # Secure permissions for config files
echo "TEST=value" > .env
```

---

## Performance Issues

### Issue: Slow Pattern Loading

**Symptoms:**
- Script startup takes several seconds
- Pattern loading appears to hang

**Diagnosis:**
```bash
# Time pattern loading
time source patterns/logging/simple-logging.sh

# Time all patterns
time for pattern in patterns/*/simple-*.sh; do
    source "$pattern"
done

# Check system load
top
df -h
```

**Solutions:**

**Solution 1: Load only required patterns**
```bash
# Instead of loading all patterns
for pattern in patterns/*/simple-*.sh; do
    source "$pattern"
done

# Load only what you need
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
```

**Solution 2: Cache pattern loading**
```bash
# Cache patterns in environment
if [[ -z "$PATTERNS_LOADED" ]]; then
    source patterns/logging/simple-logging.sh
    source patterns/error-handling/simple-error-handling.sh
    export PATTERNS_LOADED=true
fi
```

**Solution 3: Profile pattern loading**
```bash
# Profile each pattern
for pattern in patterns/*/simple-*.sh; do
    echo "Loading $pattern..."
    time source "$pattern"
done
```

### Issue: High Memory Usage

**Symptoms:**
- System becomes slow when using patterns
- Out of memory errors

**Solutions:**
```bash
# Monitor memory usage
ps aux | grep bash
free -m

# Use lighter patterns
source patterns/logging/simple-logging.sh  # Lightweight
# Avoid loading all patterns unless necessary

# Clear unused variables
unset large_variable

# Use readonly for constants
readonly CONFIG_FILE=".env"
```

---

## Configuration Issues

### Issue: Configuration Values Not Found

**Symptoms:**
```bash
database_url=$(get_config "DATABASE_URL" ".env" "default")
echo "$database_url"  # Shows "default" instead of actual value
```

**Diagnosis:**
```bash
# Check if config file exists
ls -la .env

# Check config file format
cat .env

# Check config function availability
declare -F get_config

# Test config reading manually
grep "DATABASE_URL" .env
```

**Solutions:**

**Solution 1: Fix config file format**
```bash
# Correct format (.env file)
DATABASE_URL=postgresql://localhost:5432/mydb
API_KEY=abc123
DEBUG=true

# Incorrect formats to avoid
DATABASE_URL: postgresql://localhost:5432/mydb  # YAML format
"DATABASE_URL"="value"  # Quoted key
DATABASE_URL = value  # Spaces around equals
```

**Solution 2: Check file permissions**
```bash
# Make config file readable
chmod 600 .env  # Secure but readable
```

**Solution 3: Debug config loading**
```bash
# Debug config function
source patterns/configuration/config-reader.sh

# Test manually
get_config "DATABASE_URL" ".env" "debug-default"

# Check line-by-line
while IFS='=' read -r key value; do
    echo "Key: $key, Value: $value"
done < .env
```

### Issue: Configuration Format Not Recognized

**Symptoms:**
```bash
# JSON config not working
get_config "database.url" "config.json" "default"
# Returns "default" instead of JSON value
```

**Solutions:**

**For JSON files:**
```bash
# Ensure proper JSON format
{
  "database": {
    "url": "postgresql://localhost:5432/mydb"
  },
  "api_key": "abc123"
}

# Use correct key format for nested values
database_url=$(get_config "database.url" "config.json" "default")
```

**For YAML files:**
```bash
# Ensure proper YAML format
database:
  url: postgresql://localhost:5432/mydb
api_key: abc123

# Use correct key format
database_url=$(get_config "database.url" "config.yaml" "default")
```

---

## Testing Issues

### Issue: Tests Fail to Run

**Symptoms:**
```bash
run_test "Sample test" test_function
bash: run_test: command not found
```

**Solutions:**
```bash
# Load testing pattern first
source patterns/testing/simple-test-runner.sh

# Verify function availability
declare -F run_test

# Run diagnostic
bash -c "source patterns/testing/simple-test-runner.sh && declare -F"
```

### Issue: Test Environment Pollution

**Symptoms:**
- Tests pass individually but fail when run together
- Inconsistent test results

**Solutions:**

**Solution 1: Isolate test environment**
```bash
# Create isolated test function
run_isolated_test() {
    local test_name="$1"
    local test_function="$2"
    
    # Run in subshell for isolation
    (
        # Set up clean environment
        cd "$(mktemp -d)"
        unset CONFIG_VAR
        
        # Run the test
        "$test_function"
    )
    
    echo "Test $test_name: $(if [[ $? -eq 0 ]]; then echo PASS; else echo FAIL; fi)"
}
```

**Solution 2: Clean up after tests**
```bash
test_with_cleanup() {
    # Save original values
    local original_config="$CONFIG_VAR"
    
    # Run test
    your_test_function
    local test_result=$?
    
    # Restore original values
    CONFIG_VAR="$original_config"
    
    return $test_result
}
```

---

## Security Issues

### Issue: Security Scan Fails

**Symptoms:**
```bash
basic_security_scan
# Returns non-zero exit code or shows security violations
```

**Diagnosis:**
```bash
# Run security scan with verbose output
DEBUG=1 basic_security_scan

# Check for common security issues
grep -r "eval" patterns/
grep -r "exec" patterns/
grep -r '\$[A-Z_]*' patterns/ | grep -v '\$[0-9]'
```

**Solutions:**

**Solution 1: Fix eval/exec usage**
```bash
# Bad: Using eval
eval "$user_input"

# Good: Validate and use safely
case "$user_input" in
    "start"|"stop"|"restart")
        "$user_input"_service
        ;;
    *)
        handle_error $LINENO "Invalid command: $user_input"
        ;;
esac
```

**Solution 2: Fix unquoted variables**
```bash
# Bad: Unquoted variables
if [ $var = "value" ]; then

# Good: Quoted variables
if [[ "$var" == "value" ]]; then
```

**Solution 3: Remove hardcoded secrets**
```bash
# Bad: Hardcoded secret
API_KEY="abc123"

# Good: Load from environment or config
API_KEY=$(get_config "API_KEY" ".env" "")
[[ -n "$API_KEY" ]] || handle_error $LINENO "API_KEY is required"
```

---

## CI/CD Issues

### Issue: Patterns Not Available in CI

**Symptoms:**
```bash
# In CI pipeline
source patterns/logging/simple-logging.sh
# No such file or directory
```

**Solutions:**

**Solution 1: Install patterns in CI**
```yaml
# GitHub Actions
- name: Install Claude Patterns
  run: |
    curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash

# GitLab CI
install_patterns:
  script:
    - curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
```

**Solution 2: Use Docker with patterns pre-installed**
```dockerfile
FROM ubuntu:20.04
RUN curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
COPY . /app
WORKDIR /app
```

**Solution 3: Cache patterns between builds**
```yaml
# GitHub Actions
- name: Cache Patterns
  uses: actions/cache@v3
  with:
    path: patterns/
    key: claude-patterns-${{ hashFiles('**/patterns/**') }}

- name: Install Patterns if Not Cached
  run: |
    if [[ ! -d "patterns" ]]; then
      curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
    fi
```

### Issue: CI Environment Variables

**Symptoms:**
```bash
# Config not loaded in CI
database_url=$(get_config "DATABASE_URL" ".env" "default")
# Always returns "default"
```

**Solutions:**
```yaml
# GitHub Actions - Set environment variables
env:
  DATABASE_URL: ${{ secrets.DATABASE_URL }}
  API_KEY: ${{ secrets.API_KEY }}

# Or create .env file in CI
- name: Create Config
  run: |
    echo "DATABASE_URL=${{ secrets.DATABASE_URL }}" > .env
    echo "API_KEY=${{ secrets.API_KEY }}" >> .env
```

---

## Platform-Specific Issues

### macOS Issues

**Issue: BSD vs GNU utilities**
```bash
# GNU sed syntax doesn't work on macOS
sed -i 's/old/new/' file  # Fails on macOS
```

**Solutions:**
```bash
# Portable sed usage
if [[ "$(uname)" == "Darwin" ]]; then
    sed -i '' 's/old/new/' file  # macOS
else
    sed -i 's/old/new/' file     # Linux
fi

# Or use patterns that handle this
source patterns/configuration/config-reader.sh  # Already handles platform differences
```

**Issue: Missing dependencies**
```bash
# Common missing tools on macOS
bash: realpath: command not found
```

**Solutions:**
```bash
# Install missing tools
brew install coreutils

# Or use built-in alternatives
# Instead of realpath
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
```

### Windows (WSL/Git Bash) Issues

**Issue: Line ending problems**
```bash
# Windows line endings cause issues
source patterns/logging/simple-logging.sh
# Syntax errors due to \r\n endings
```

**Solutions:**
```bash
# Convert line endings
dos2unix patterns/*/simple-*.sh

# Or use git to handle automatically
git config --global core.autocrlf true
```

**Issue: Path separator issues**
```bash
# Windows path separators
source patterns\logging\simple-logging.sh  # Fails
```

**Solutions:**
```bash
# Always use forward slashes
source patterns/logging/simple-logging.sh

# Or use portable path construction
source "${patterns_dir}/logging/simple-logging.sh"
```

---

## Advanced Debugging

### Enable Debug Mode

**Global debugging:**
```bash
# Enable debug for all patterns
export DEBUG=1

# Enable bash debugging
set -x
source patterns/logging/simple-logging.sh
set +x
```

**Pattern-specific debugging:**
```bash
# Debug pattern loading
debug_pattern_load() {
    local pattern="$1"
    echo "Loading pattern: $pattern"
    
    if [[ -f "$pattern" ]]; then
        echo "File exists, checking syntax..."
        if bash -n "$pattern"; then
            echo "Syntax OK, sourcing..."
            source "$pattern"
            echo "Pattern loaded successfully"
        else
            echo "Syntax error in pattern"
            return 1
        fi
    else
        echo "Pattern file not found: $pattern"
        return 1
    fi
}

# Usage
debug_pattern_load "patterns/logging/simple-logging.sh"
```

### Function Tracing

**Trace function calls:**
```bash
# Trace all function calls
set -o functrace
trap 'echo "Calling: $BASH_COMMAND"' DEBUG

# Load and test pattern
source patterns/logging/simple-logging.sh
log_info "Test message"

# Disable tracing
trap - DEBUG
set +o functrace
```

### Environment Inspection

**Check environment state:**
```bash
# Show all variables
set

# Show all functions
declare -F

# Show specific pattern functions
declare -F | grep -E "(log_|handle_|get_config)"

# Show environment variables
env | grep -E "(DEBUG|LOG_|CLAUDE_)"
```

### Memory and Performance Profiling

**Profile script execution:**
```bash
# Time individual operations
profile_operation() {
    local operation="$1"
    shift
    
    local start_time=$(date +%s%N)
    "$@"
    local end_time=$(date +%s%N)
    
    local duration=$(( (end_time - start_time) / 1000000 ))
    echo "Operation '$operation' took ${duration}ms"
}

# Usage
profile_operation "Pattern loading" source patterns/logging/simple-logging.sh
profile_operation "Log message" log_info "Test message"
```

**Memory usage monitoring:**
```bash
# Monitor memory during execution
monitor_memory() {
    while true; do
        ps -o pid,vsz,rss,comm -p $$ | tail -1
        sleep 1
    done &
    local monitor_pid=$!
    
    # Run your code here
    source patterns/logging/simple-logging.sh
    log_info "Testing memory usage"
    
    # Stop monitoring
    kill $monitor_pid 2>/dev/null
}
```

---

## Getting Help

### Collect Diagnostic Information

Before asking for help, collect this information:

```bash
#!/bin/bash
# Diagnostic information collector

echo "=== System Information ==="
echo "Platform: $(uname -a)"
echo "Shell: $BASH_VERSION"
echo "User: $(whoami)"
echo "Working directory: $(pwd)"
echo "Date: $(date)"

echo
echo "=== Pattern Information ==="
echo "Patterns directory exists: $(if [[ -d patterns ]]; then echo "YES"; else echo "NO"; fi)"
if [[ -d patterns ]]; then
    echo "Pattern files:"
    find patterns -name "simple-*.sh" -type f | head -10
fi

echo
echo "=== Environment Variables ==="
env | grep -E "(DEBUG|LOG_|CLAUDE_|BASH_)" | sort

echo
echo "=== Available Functions ==="
declare -F | grep -E "(log_|handle_|get_|run_)" | head -10

echo
echo "=== Recent Errors ==="
# Show last few commands from history if available
if [[ -f ~/.bash_history ]]; then
    tail -20 ~/.bash_history | grep -E "(source|log_|error)"
fi
```

### Community Support

**GitHub Issues:**
1. Go to: https://github.com/smenssink/claude-code-builder/issues
2. Search existing issues first
3. Create new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Diagnostic information (from script above)
   - Your environment details

**Issue Template:**
```markdown
## Problem Description
Brief description of what's not working

## Steps to Reproduce
1. Step one
2. Step two
3. Step three

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: (e.g., Ubuntu 20.04, macOS 12.1)
- Shell: (e.g., bash 5.1.8)
- Pattern version: (e.g., v1.0.0)

## Diagnostic Output
```
(Paste output from diagnostic script)
```

## Additional Context
Any other relevant information
```

### Self-Help Resources

**Documentation:**
- [API Reference](API_REFERENCE.md) - Complete function documentation
- [Best Practices](BEST_PRACTICES.md) - Usage guidelines
- [Integration Guide](INTEGRATION_GUIDE.md) - Integration examples

**Testing your fix:**
1. Make minimal test case
2. Test in clean environment
3. Verify solution works
4. Document what you learned

**Contributing back:**
If you find and fix an issue, consider contributing:
1. Fork the repository
2. Create feature branch
3. Add your fix
4. Test thoroughly
5. Submit pull request

---

## Common Error Messages and Solutions

| Error Message | Common Cause | Solution |
|---------------|--------------|----------|
| `No such file or directory` | Pattern path incorrect | Check path, reinstall patterns |
| `command not found` | Pattern not sourced | Source pattern first |
| `Permission denied` | File permissions | Fix with chmod, use source |
| `Syntax error` | Corrupted pattern file | Reinstall patterns |
| `Function already defined` | Pattern loaded twice | Check for duplicate sourcing |
| `Invalid configuration` | Config file format | Fix config file format |
| `Security scan failed` | Security violation | Fix security issues in code |
| `Tests failed` | Test environment issue | Isolate test environment |
| `Network error` | Connection problem | Check network, use alternative |
| `Memory error` | Resource exhaustion | Use fewer patterns, check memory |

Remember: Most issues are solved by reinstalling patterns or checking file paths. When in doubt, start with the diagnostic script and work from there.