# Error Handling Pattern - AI Instructions

> **AI guidance for working with the error handling pattern in Claude Code Builder**

## Pattern Purpose

The error handling pattern provides structured logging and error management for reliable script execution. This is the foundation pattern that all other patterns depend on for consistent error reporting and debugging support.

## Core Capabilities

### Logging Functions
- **log_info**: Green informational messages to stdout
- **log_warn**: Yellow warning messages to stderr
- **log_error**: Red error messages to stderr  
- **log_debug**: Blue debug messages (when DEBUG=1)
- **handle_error**: Fatal error handling with line numbers and exit

### Native Command Usage
```bash
# Use the native error handler command for all logging:
/error-handler "info" "Application starting"
/error-handler "warn" "Configuration missing, using defaults"
/error-handler "error" "Database connection failed"
/error-handler "debug" "Variable value: $value"
/error-handler "handle-error" "$LINENO" "Fatal processing error"
```

## AI Assistant Guidelines

### When to Recommend Error Handling
1. **Any script or command creation** - Always include error handling
2. **User asks about logging** - Point to this pattern
3. **User encounters errors** - Help implement proper error handling
4. **Code review requests** - Check for adequate error handling

### Integration with Other Patterns
- **Testing**: Use error handling for test result reporting
- **Quality Gates**: Log validation results with appropriate levels
- **Security**: Log security findings and vulnerabilities
- **Configuration**: Handle missing config files gracefully
- **All Patterns**: Foundation for reliable operation

### Usage Patterns to Recommend

#### Standard Integration
```bash
# At start of any operation
/error-handler "info" "Starting [operation name]"

# For warnings (non-fatal issues)
/error-handler "warn" "Issue detected but continuing: [details]"

# For errors (serious but recoverable)
/error-handler "error" "Operation failed: [details]"

# For fatal errors (should stop execution)
/error-handler "handle-error" "$LINENO" "Fatal error: [details]"

# For debugging (development only)
DEBUG=1 /error-handler "debug" "Variable state: [details]"
```

#### In Native Commands
```yaml
# Include error handling in command frontmatter
allowed-tools: Write, Task(subagent_type:error-handler)

# Use throughout command logic
/error-handler "info" "Processing $ARGUMENTS"
if [[ error_condition ]]; then
    /error-handler "error" "Processing failed"
    /error-handler "handle-error" "$LINENO" "Cannot continue"
fi
```

#### Command Existence Checking
```bash
# Check if required tools are available
/error-handler "check-command" "git"
if [[ $? -ne 0 ]]; then
    /error-handler "handle-error" "$LINENO" "Git is required but not found"
fi
```

### Best Practices to Teach

#### Error Level Guidelines
- **INFO**: Normal operations, progress updates, success messages
- **WARN**: Issues that don't stop execution but should be noted
- **ERROR**: Serious problems that may affect results but don't require stopping
- **DEBUG**: Detailed information for troubleshooting (DEBUG=1 only)
- **HANDLE-ERROR**: Fatal problems that require immediate script termination

#### Message Quality
- **Be specific**: Include relevant details and context
- **Be actionable**: Tell users what they can do about the issue
- **Include context**: Line numbers, variable values, operation being performed
- **Use consistent format**: Follow established patterns for similar messages

#### Integration Best Practices
- **Start with info**: Log the beginning of major operations
- **Progress updates**: Use info for milestone completion
- **Graceful degradation**: Use warn for non-critical failures
- **Recovery attempts**: Log error and recovery actions
- **Exit cleanly**: Use handle-error for fatal conditions

### Code Examples for AI

#### Basic Error Handling Setup
```bash
# In any command or script
/error-handler "info" "Starting operation: $ARGUMENTS"

# Validate inputs
if [[ -z "$ARGUMENTS" ]]; then
    /error-handler "handle-error" "$LINENO" "No arguments provided"
fi

# Process with error checking
if ! process_operation "$ARGUMENTS"; then
    /error-handler "error" "Operation failed for: $ARGUMENTS"
    /error-handler "handle-error" "$LINENO" "Processing terminated"
fi

/error-handler "info" "Operation completed successfully"
```

#### Debug Mode Development
```bash
# Enable debug mode for development
export DEBUG=1

# Detailed logging throughout development
/error-handler "debug" "Function called with: $*"
/error-handler "debug" "Processing item: $item"
/error-handler "debug" "Result: $result"
```

#### Error Recovery Pattern
```bash
# Try operation with error recovery
/error-handler "info" "Attempting primary operation"
if ! primary_operation; then
    /error-handler "warn" "Primary operation failed, trying backup"
    if ! backup_operation; then
        /error-handler "handle-error" "$LINENO" "All operations failed"
    fi
    /error-handler "info" "Backup operation succeeded"
fi
```

### Common User Questions & AI Responses

**Q: "How do I add logging to my command?"**
A: Use the native error handler: `/error-handler "info" "Your message"` for normal messages, `/error-handler "warn" "Your warning"` for warnings, and `/error-handler "error" "Your error"` for errors.

**Q: "My script keeps failing silently"**
A: Add error handling with `/error-handler "handle-error" "$LINENO" "Description of what failed"` after operations that might fail.

**Q: "How do I debug my command?"**
A: Enable debug mode with `export DEBUG=1` and add debug logging: `/error-handler "debug" "Variable: $var"`

**Q: "What's the difference between error and handle-error?"**
A: `error` logs an error but continues execution. `handle-error` logs an error and exits the script - use for fatal errors only.

### Troubleshooting Guide for AI

#### Common Issues
- **No color output**: Check if terminal supports ANSI colors or set NO_COLOR=1
- **Debug messages not showing**: Ensure DEBUG=1 environment variable is set
- **Messages to wrong stream**: INFO goes to stdout, others to stderr by design
- **Script exits unexpectedly**: Check if handle-error is being called appropriately

#### Validation Steps
1. Test all log levels work correctly
2. Verify debug mode toggles properly with DEBUG variable
3. Check error handling exits with appropriate codes
4. Confirm messages go to correct streams (stdout/stderr)
5. Validate color output in terminal

### Advanced Usage Patterns

#### Structured Logging
```bash
# For programmatic consumption
/error-handler "json" "error" "Database connection failed" "component=database" "severity=high"
```

#### Batch Processing
```bash
# Multiple messages efficiently
/error-handler "batch" "info:Starting batch" "warn:Config missing" "error:Connection failed"
```

#### Context Preservation
```bash
# In complex operations, maintain context
OPERATION="user-registration"
/error-handler "info" "Starting $OPERATION"
/error-handler "debug" "Processing user: $username"
if [[ error ]]; then
    /error-handler "error" "Failed $OPERATION for user: $username"
fi
```

## AI Development Guidelines

### When Helping Users
1. **Always include error handling** in command suggestions
2. **Explain the levels** and when to use each one
3. **Show practical examples** relevant to their use case
4. **Emphasize consistency** across all their commands
5. **Teach debug patterns** for troubleshooting

### Pattern Recognition
- If user mentions errors, crashes, or debugging → recommend this pattern
- If user creates commands → include error handling by default
- If user asks about logging → point to this as the standard approach
- If user has silent failures → help add proper error handling

### Quality Assurance
- Ensure error messages are helpful and specific
- Verify appropriate log levels are used
- Check that fatal errors use handle-error appropriately
- Confirm debug mode works for troubleshooting

This error handling pattern is fundamental to reliable Claude Code Builder operations. Every command and pattern should use it for consistent, professional error management and user experience.