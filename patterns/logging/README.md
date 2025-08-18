# Logging Patterns

**Technical:** Standardized logging system with severity levels, color coding, structured output formatting, and configurable display options for consistent message presentation across all development patterns.

**Simple:** Like having a consistent voice for all your tools that speaks clearly and uses the same words for the same things, making it easy to understand what's happening.

**Connection:** These patterns teach logging standardization concepts essential for debugging, monitoring, maintaining complex systems, and establishing consistent communication protocols.

## 📝 Available Patterns

### simple-logging.sh

**Purpose:** Unified logging system with color-coded severity levels and consistent formatting

**Functions:**
- `log_info()` - Informational messages with green 🟢 [INFO] prefix
- `log_warn()` - Warning messages with yellow 🟡 [WARN] prefix (stderr)
- `log_error()` - Error messages with red 🔴 [ERROR] prefix (stderr)
- `log_debug()` - Debug messages with blue 🔵 [DEBUG] prefix (conditional)
- `log_success()` - Success messages with green ✅ [SUCCESS] prefix

**Configuration:**
- `LOG_COLOR` - Enable/disable color output (default: "true")
- `DEBUG` - Enable debug logging when set to "1" (default: "0")

**Output Streams:**
- **Info/Success** - stdout for normal program flow
- **Warn/Error/Debug** - stderr for diagnostic information

**Line Count:** 49 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/logging/simple-logging.sh

# Basic logging
log_info "Starting application"
log_warn "Configuration file not found, using defaults"
log_error "Database connection failed"
log_success "Process completed successfully"

# Debug logging (only shows when DEBUG=1)
DEBUG=1 log_debug "Variable value: $variable"

# Disable colors for CI/CD
LOG_COLOR=false log_info "Running in CI environment"
```

## 🔧 Pattern Composition

### Standardizing Existing Patterns

**Error Handling Integration:**
```bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

# Enhance error handling with consistent logging
handle_error() {
    local line_number=${1:-"unknown"}
    local error_message=${2:-"Unknown error occurred"}
    log_error "Script failed at line $line_number: $error_message"
    exit 1
}

# Enhanced info logging
log_info() {
    [[ "$LOG_COLOR" == "true" ]] && echo -e "🟢 \033[32m[INFO]\033[0m $*" >&1 || echo "[INFO] $*" >&1
}
```

**Security Scanning Integration:**
```bash
source patterns/logging/simple-logging.sh
source patterns/security/security-basics.sh

secure_scan_with_logging() {
    log_info "Starting security scan"
    
    if has_security_issues; then
        log_error "Security vulnerabilities detected"
        basic_security_scan
        return 1
    fi
    
    log_success "Security scan completed - no issues found"
}
```

**Testing Integration:**
```bash
source patterns/logging/simple-logging.sh
source patterns/testing/simple-test-runner.sh

test_with_logging() {
    log_info "Starting test suite execution"
    
    if has_tests; then
        log_info "Running detected tests..."
        if run_all_tests; then
            log_success "All tests passed"
        else
            log_error "Test failures detected"
            return 1
        fi
    else
        log_warn "No tests found in project"
    fi
}
```

## 🛡️ Security Considerations

- **Safe Output Handling:** Proper stdout/stderr separation for log aggregation
- **No Information Leakage:** Debug logs only enabled when explicitly requested
- **Color Code Safety:** ANSI escape sequences are standard and safe
- **Input Sanitization:** Messages are safely passed through echo without evaluation

## 🎓 Educational Value

### Concepts Taught
- **Logging Standards:** Consistent message formatting and severity levels
- **Output Stream Management:** Proper use of stdout vs stderr
- **Configuration Management:** Environment variable-based configuration
- **Color Terminal Support:** ANSI escape sequences for enhanced readability
- **Conditional Logging:** Debug-level logging with runtime controls

### Transferable Skills
- **System Administration:** Understanding log file organization and analysis
- **DevOps Practices:** Structured logging for automated monitoring
- **Application Development:** Implementing logging frameworks and standards
- **Debugging Techniques:** Systematic approach to diagnostic information

## 🧪 Testing Examples

### Basic Logging Test
```bash
source patterns/logging/simple-logging.sh

echo "=== Testing all log levels ==="
log_info "This is an informational message"
log_warn "This is a warning message"
log_error "This is an error message"
log_success "This is a success message"

# Debug logging (won't show unless DEBUG=1)
log_debug "This debug message is hidden"
DEBUG=1 log_debug "This debug message is visible"
```

### Color Configuration Test
```bash
source patterns/logging/simple-logging.sh

echo "=== Testing with colors ==="
LOG_COLOR=true
log_info "Colored info message"
log_error "Colored error message"

echo "=== Testing without colors ==="
LOG_COLOR=false
log_info "Plain info message"
log_error "Plain error message"
```

### Stream Redirection Test
```bash
source patterns/logging/simple-logging.sh

# Test stdout vs stderr routing
log_info "Info to stdout" > info.log
log_error "Error to stderr" 2> error.log

# Check files
echo "Info log contains: $(cat info.log)"
echo "Error log contains: $(cat error.log)"
```

## 🚀 Advanced Usage

### Custom Log Formatting
```bash
# Add timestamps to existing functions
log_info_with_time() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    log_info "[$timestamp] $*"
}

# Add caller information
log_info_with_caller() {
    log_info "[${FUNCNAME[1]}:${BASH_LINENO[0]}] $*"
}
```

### Log Level Filtering
```bash
# Implement log level hierarchy
LOG_LEVEL=${LOG_LEVEL:-"INFO"}

should_log() {
    local level="$1"
    case "$LOG_LEVEL" in
        "DEBUG") return 0 ;;
        "INFO") [[ "$level" != "DEBUG" ]] ;;
        "WARN") [[ "$level" =~ ^(WARN|ERROR|SUCCESS)$ ]] ;;
        "ERROR") [[ "$level" =~ ^(ERROR|SUCCESS)$ ]] ;;
        *) return 0 ;;
    esac
}

log_info_filtered() {
    should_log "INFO" && log_info "$@"
}
```

### Structured Logging
```bash
# JSON-like structured logging
log_structured() {
    local level="$1"
    local component="$2"
    local message="$3"
    local timestamp=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
    
    echo "{\"timestamp\":\"$timestamp\",\"level\":\"$level\",\"component\":\"$component\",\"message\":\"$message\"}"
}

# Usage
log_structured "INFO" "auth" "User login successful"
log_structured "ERROR" "database" "Connection timeout"
```

### Log Aggregation Support
```bash
# Consistent format for log aggregation systems
log_for_aggregation() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local hostname=$(hostname)
    local pid=$$
    
    echo "[$timestamp] [$hostname] [$pid] [$level] $message"
}
```

## 🔧 Customization

### Environment Configuration
```bash
# Complete environment configuration
export LOG_COLOR=true          # Enable colored output
export DEBUG=1                 # Enable debug logging
export LOG_TIMESTAMP=true      # Add timestamps (if extended)
export LOG_LEVEL=INFO          # Set minimum log level
export LOG_FORMAT=standard     # Set output format
```

### Integration Patterns
```bash
# Pattern standardization across all tools
standardize_logging() {
    # Replace existing echo statements with structured logging
    alias echo_info='log_info'
    alias echo_warn='log_warn'
    alias echo_error='log_error'
    alias echo_success='log_success'
}

# CI/CD environment detection
configure_for_ci() {
    if [[ -n "$CI" ]]; then
        export LOG_COLOR=false
        export DEBUG=0
    fi
}
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Colors not displaying properly
**Solution:** Check terminal capabilities: `echo $TERM` and ensure ANSI support

**Issue:** Debug messages not showing
**Solution:** Ensure `DEBUG=1` is set: `DEBUG=1 your_script.sh`

**Issue:** Messages appearing in wrong order
**Solution:** Use explicit flushing: `log_info "message"; sync`

### Output Stream Debugging
```bash
# Test output stream routing
test_streams() {
    echo "=== Testing stream separation ==="
    
    # This should go to stdout
    log_info "Info message"
    log_success "Success message"
    
    # This should go to stderr
    log_warn "Warning message"
    log_error "Error message"
    log_debug "Debug message"
    
    echo "=== Check with redirection ==="
    echo "Run: your_script.sh 1>stdout.log 2>stderr.log"
}
```

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with safe output handling  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

## 🎯 Logging Standards Enforced

### Message Consistency
- **Severity Levels** - Clear hierarchy (INFO < WARN < ERROR)
- **Color Coding** - Visual distinction with emoji and ANSI colors
- **Stream Separation** - Proper stdout/stderr usage
- **Format Standardization** - Consistent [LEVEL] message structure

### Configuration Management
- **Environment Variables** - Standard configuration approach
- **Runtime Control** - Debug logging controlled at execution time
- **CI/CD Friendly** - Automatic color disable detection
- **Override Support** - All settings can be customized

### Integration Benefits
- **Unified Output** - All patterns use same logging format
- **Tool Consistency** - Same logging behavior across all tools
- **Debugging Support** - Consistent debug information format
- **Monitoring Ready** - Structured output for log aggregation

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux)  
**Dependencies:** Standard Unix tools (echo, date)  
**Line Count:** 49 lines  
**Claude Comprehension:** Optimized ✅