# Error Handling Patterns

**Technical:** Structured logging and error management patterns that provide consistent, readable output with proper error propagation and debugging capabilities for bash scripts.

**Simple:** Like having a reliable way to tell users what's happening in your program and clearly communicate when something goes wrong.

**Connection:** These patterns teach fundamental error handling concepts that are essential in any programming language and critical for building maintainable, debuggable software.

## 🚨 Available Patterns

### simple-error-handling.sh

**Purpose:** Core logging functions with colored output and error handling

**Functions:**
- `log_info(message)` - Green [INFO] messages to stdout
- `log_warn(message)` - Yellow [WARN] messages to stderr  
- `log_error(message)` - Red [ERROR] messages to stderr
- `log_debug(message)` - Blue [DEBUG] messages (when DEBUG=1)
- `handle_error(line, message)` - Error with context and exit
- `check_command_exists(command)` - Check if command is available
- `test_error_handling()` - Demonstration of all functions

**Line Count:** 43 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/error-handling/simple-error-handling.sh

# Use logging functions
log_info "Application starting up"
log_warn "Configuration file not found, using defaults"

# Check dependencies
if ! check_command_exists "git"; then
    log_error "Git is required but not installed"
    exit 1
fi

# Handle errors with context
process_data() {
    local file="$1"
    [[ -f "$file" ]] || handle_error $LINENO "File not found: $file"
    # Process file...
}

# Enable debug mode
DEBUG=1 log_debug "Variable value: $important_var"
```

## 🔧 Pattern Composition

### With Testing Patterns
```bash
source patterns/error-handling/simple-error-handling.sh
source patterns/testing/simple-test-runner.sh

run_tests() {
    log_info "Starting test suite"
    if run_all_tests; then
        log_info "All tests passed ✅"
    else
        handle_error $LINENO "Test suite failed"
    fi
}
```

### With Quality Gates
```bash
source patterns/error-handling/simple-error-handling.sh
source patterns/quality-gates/quality-check.sh

validate_code_quality() {
    log_info "Running quality checks"
    run_quality_checks || handle_error $LINENO "Quality checks failed"
    log_info "Quality validation complete ✅"
}
```

## 🛡️ Security Considerations

- **Output Sanitization:** All functions properly handle special characters
- **Input Validation:** Functions validate parameters and handle edge cases
- **No Information Disclosure:** Error messages don't expose sensitive paths
- **Stderr Usage:** Errors and warnings go to stderr, info to stdout

## 🎓 Educational Value

### Concepts Taught
- **Structured Logging:** Consistent message formatting with severity levels
- **Error Propagation:** Proper error handling and script termination
- **Stream Redirection:** Understanding stdout vs stderr usage
- **Conditional Logic:** Environment-based behavior (DEBUG mode)
- **Function Design:** Single responsibility and reusable functions

### Transferable Skills
- **Any Language:** These logging concepts apply to Python, JavaScript, Go, etc.
- **Production Systems:** Professional logging practices for real applications
- **Debugging Techniques:** Systematic approach to troubleshooting
- **DevOps Practices:** Operational logging for monitoring and alerting

## 🧪 Testing

```bash
# Run the demo
source patterns/error-handling/simple-error-handling.sh
test_error_handling

# Test individual functions
log_info "Testing info logging"
log_warn "Testing warning logging"
log_error "Testing error logging"

# Test debug mode
DEBUG=1 log_debug "Debug mode active"
DEBUG=0 log_debug "This won't show"

# Test command checking
check_command_exists "git" && echo "Git available"
check_command_exists "fake_command" || echo "Command not found"
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Colors not showing
**Solution:** Ensure terminal supports ANSI colors or use `export TERM=xterm-256color`

**Issue:** Messages not appearing
**Solution:** Check if stdout/stderr are being redirected

**Issue:** Debug messages not showing
**Solution:** Set `DEBUG=1` environment variable

### Best Practices

- Always use `log_error` for actual errors
- Use `log_warn` for recoverable issues  
- Use `log_info` for normal operational messages
- Use `log_debug` for troubleshooting information
- Call `handle_error` with `$LINENO` for precise error location

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with input sanitization  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux)  
**Dependencies:** None (pure bash)  
**Line Count:** 43 lines  
**Claude Comprehension:** Optimized ✅