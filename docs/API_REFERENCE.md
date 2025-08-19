# Claude Code Builder API Reference

> Complete reference documentation for all pattern functions, utilities, and integration points

## Table of Contents

- [Core Pattern APIs](#core-pattern-apis)
- [Logging API](#logging-api)
- [Error Handling API](#error-handling-api)
- [Configuration API](#configuration-api)
- [Testing API](#testing-api)
- [Security API](#security-api)
- [Validation API](#validation-api)
- [Documentation API](#documentation-api)
- [Git Hooks API](#git-hooks-api)
- [Quality Gates API](#quality-gates-api)
- [Utility Functions](#utility-functions)
- [Environment Variables](#environment-variables)
- [Return Codes](#return-codes)

---

## Core Pattern APIs

### Pattern Loading

```bash
# Load a single pattern
source patterns/logging/simple-logging.sh

# Load all patterns
for pattern in patterns/*/simple-*.sh; do
    [[ -f "$pattern" ]] && source "$pattern"
done
```

### Pattern Structure

All patterns follow a consistent structure:
- Header comment with Technical/Simple/Connection explanations
- Function definitions (3-8 functions per pattern)
- Usage examples in comments
- Maximum 50 lines per pattern file

---

## Logging API

**Pattern:** `patterns/logging/simple-logging.sh`

### Functions

#### `log_info(message...)`

Log informational messages to stdout.

**Parameters:**
- `message...` - One or more message parts to log

**Environment Variables:**
- `LOG_COLOR` - Set to "false" to disable colors (default: "true")

**Output:**
```bash
🟢 [INFO] Your message here
```

**Example:**
```bash
log_info "Application started successfully"
log_info "Processing file:" "$filename"
```

---

#### `log_warn(message...)`

Log warning messages to stderr.

**Parameters:**
- `message...` - One or more message parts to log

**Output:**
```bash
🟡 [WARN] Your warning message
```

**Example:**
```bash
log_warn "Configuration file not found, using defaults"
```

---

#### `log_error(message...)`

Log error messages to stderr.

**Parameters:**
- `message...` - One or more message parts to log

**Output:**
```bash
🔴 [ERROR] Your error message
```

**Example:**
```bash
log_error "Database connection failed"
```

---

#### `log_debug(message...)`

Log debug messages to stderr (only when DEBUG=1).

**Parameters:**
- `message...` - One or more message parts to log

**Environment Variables:**
- `DEBUG` - Set to "1" to enable debug logging (default: "0")

**Output:**
```bash
🔵 [DEBUG] Your debug message
```

**Example:**
```bash
DEBUG=1 log_debug "Variable value:" "$variable"
```

---

#### `log_success(message...)`

Log success messages to stdout.

**Parameters:**
- `message...` - One or more message parts to log

**Output:**
```bash
✅ [SUCCESS] Your success message
```

**Example:**
```bash
log_success "Build completed successfully"
```

---

## Error Handling API

**Pattern:** `patterns/error-handling/simple-error-handling.sh`

### Functions

#### `handle_error(line_number, error_message)`

Handle errors with context and exit the script.

**Parameters:**
- `line_number` - Line number where error occurred (use `$LINENO`)
- `error_message` - Description of the error

**Exit Code:** 1

**Example:**
```bash
command_that_might_fail || handle_error $LINENO "Command execution failed"
```

---

#### `check_command_exists(command_name)`

Check if a command exists in the system PATH.

**Parameters:**
- `command_name` - Name of the command to check

**Returns:**
- 0 if command exists
- 1 if command does not exist

**Example:**
```bash
if check_command_exists "git"; then
    log_info "Git is available"
else
    log_error "Git is required but not installed"
fi
```

---

#### `test_error_handling()`

Demonstrate all error handling features.

**Parameters:** None

**Example:**
```bash
test_error_handling
```

---

## Configuration API

**Pattern:** `patterns/configuration/config-reader.sh`

### Functions

#### `get_config(key, config_file, default_value)`

Get configuration value with environment variable fallback.

**Parameters:**
- `key` - Configuration key to retrieve
- `config_file` - Configuration file path (default: ".env")
- `default_value` - Default value if key not found (default: "")

**Returns:** Configuration value or default value

**Security:** Input validation prevents injection attacks

**Example:**
```bash
database_url=$(get_config "DATABASE_URL" ".env" "sqlite://local.db")
debug_mode=$(get_config "DEBUG" "config.yaml" "false")
```

---

#### `read_config(config_file, key, default_value)`

Read configuration value from file (supports JSON, YAML, ENV formats).

**Parameters:**
- `config_file` - Path to configuration file
- `key` - Configuration key to retrieve  
- `default_value` - Default value if key not found

**Supported Formats:**
- `.json` - JSON format
- `.yaml`, `.yml` - YAML format
- Other - Environment variable format (KEY=value)

**Example:**
```bash
api_key=$(read_config "config.json" "api_key" "")
port=$(read_config "settings.yaml" "port" "8080")
```

---

#### `read_env_config(config_file, key, default_value)`

Read from environment-style configuration file specifically.

**Parameters:**
- `config_file` - Path to .env style configuration file
- `key` - Configuration key to retrieve
- `default_value` - Default value if key not found

**Example:**
```bash
secret=$(read_env_config ".env" "SECRET_KEY" "")
```

---

#### `has_config(config_file)`

Check if configuration file exists and is readable.

**Parameters:**
- `config_file` - Path to configuration file

**Returns:**
- 0 if file exists and is readable
- 1 if file does not exist or is not readable

**Example:**
```bash
if has_config ".env"; then
    log_info "Configuration file found"
else
    log_warn "No configuration file found"
fi
```

---

#### `validate_config(config_file)`

Validate configuration file format.

**Parameters:**
- `config_file` - Path to configuration file

**Returns:**
- 0 if file format is valid
- 1 if file format is invalid or file doesn't exist

**Example:**
```bash
if validate_config "config.json"; then
    log_info "Configuration file is valid"
else
    log_error "Invalid configuration file format"
fi
```

---

## Testing API

**Pattern:** `patterns/testing/simple-test-runner.sh`

### Functions

#### `run_test(test_name, test_function)`

Run a single test with result reporting.

**Parameters:**
- `test_name` - Descriptive name for the test
- `test_function` - Function name to execute as test

**Example:**
```bash
test_addition() {
    local result=$((2 + 2))
    [[ $result -eq 4 ]]
}

run_test "Addition test" test_addition
```

---

#### `assert_equals(expected, actual, message)`

Assert that two values are equal.

**Parameters:**
- `expected` - Expected value
- `actual` - Actual value
- `message` - Optional error message

**Example:**
```bash
assert_equals "4" "$((2+2))" "Basic math should work"
```

---

#### `assert_contains(haystack, needle, message)`

Assert that a string contains a substring.

**Parameters:**
- `haystack` - String to search in
- `needle` - Substring to find
- `message` - Optional error message

**Example:**
```bash
assert_contains "hello world" "world" "String should contain substring"
```

---

## Security API

**Pattern:** `patterns/security/security-basics.sh`

### Functions

#### `basic_security_scan()`

Perform basic security validation on patterns and scripts.

**Returns:**
- 0 if no security issues found
- 1 if security issues detected

**Checks:**
- Dangerous commands (eval, exec)
- Unquoted variables
- Hardcoded credentials
- File permission issues

**Example:**
```bash
if basic_security_scan; then
    log_success "Security scan passed"
else
    log_error "Security issues detected"
fi
```

---

#### `validate_input(input, pattern, max_length)`

Validate user input against pattern and length constraints.

**Parameters:**
- `input` - Input string to validate
- `pattern` - Regex pattern for validation
- `max_length` - Maximum allowed length

**Example:**
```bash
if validate_input "$username" "^[a-zA-Z0-9_]+$" 32; then
    log_info "Username is valid"
else
    log_error "Invalid username format"
fi
```

---

## Validation API

**Pattern:** `patterns/project-validation/project-validator.sh`

### Functions

#### `detect_project_type()`

Detect the type of project in current directory.

**Returns:** Project type string (e.g., "node", "python", "go", "shell")

**Example:**
```bash
project_type=$(detect_project_type)
log_info "Detected project type: $project_type"
```

---

#### `has_tests()`

Check if project has test files.

**Returns:**
- 0 if tests are found
- 1 if no tests found

**Example:**
```bash
if has_tests; then
    log_info "Tests found in project"
else
    log_warn "No tests found"
fi
```

---

#### `check_dependencies()`

Check if all dependencies are available.

**Returns:**
- 0 if all dependencies are satisfied
- 1 if missing dependencies

**Example:**
```bash
if check_dependencies; then
    log_success "All dependencies satisfied"
else
    log_error "Missing dependencies"
fi
```

---

## Documentation API

**Pattern:** `patterns/documentation/docs-generator.sh`

### Functions

#### `generate_docs()`

Generate documentation from code comments and patterns.

**Parameters:** None (operates on current directory)

**Example:**
```bash
generate_docs
```

---

#### `update_readme()`

Update README.md with current project information.

**Example:**
```bash
update_readme
```

---

## Git Hooks API

**Pattern:** `patterns/git-hooks/git-hooks-setup.sh`

### Functions

#### `setup_git_hooks()`

Install git hooks for quality gates and validation.

**Example:**
```bash
setup_git_hooks
```

---

#### `validate_commit_message(message)`

Validate commit message format.

**Parameters:**
- `message` - Commit message to validate

**Returns:**
- 0 if message format is valid
- 1 if message format is invalid

**Example:**
```bash
if validate_commit_message "$commit_msg"; then
    log_success "Commit message format is valid"
fi
```

---

## Quality Gates API

**Pattern:** `patterns/quality-gates/quality-check.sh`

### Functions

#### `run_quality_checks()`

Run comprehensive quality checks on the codebase.

**Returns:**
- 0 if all quality checks pass
- 1 if quality checks fail

**Checks:**
- Code formatting
- Security scan
- Test coverage
- Documentation completeness

**Example:**
```bash
if run_quality_checks; then
    log_success "All quality checks passed"
else
    log_error "Quality checks failed"
fi
```

---

## Utility Functions

### Pattern Integration

#### `source_pattern(pattern_name)`

Safely source a pattern with error handling.

**Parameters:**
- `pattern_name` - Name of pattern directory

**Example:**
```bash
source_pattern "logging"
source_pattern "error-handling"
```

---

#### `list_patterns()`

List all available patterns.

**Returns:** List of pattern names

**Example:**
```bash
for pattern in $(list_patterns); do
    log_info "Available pattern: $pattern"
done
```

---

## Environment Variables

### Global Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `LOG_COLOR` | `"true"` | Enable/disable colored log output |
| `DEBUG` | `"0"` | Enable debug logging (set to "1") |
| `CLAUDE_CODE_PATTERNS_DIR` | `"patterns"` | Directory containing patterns |
| `CLAUDE_CODE_TEST_MODE` | `"false"` | Enable test mode for patterns |

### Pattern-Specific Variables

| Variable | Pattern | Description |
|----------|---------|-------------|
| `CONFIG_FILE` | configuration | Default configuration file path |
| `TEST_TIMEOUT` | testing | Timeout for test execution (seconds) |
| `SECURITY_STRICT` | security | Enable strict security validation |
| `DOCS_OUTPUT_DIR` | documentation | Output directory for generated docs |

---

## Return Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | General error |
| 2 | Misuse of shell builtins |
| 64 | Command line usage error |
| 65 | Data format error |
| 66 | Cannot open input |
| 67 | Unknown user |
| 68 | Unknown host |
| 69 | Service unavailable |
| 70 | Internal software error |
| 71 | System error (e.g., can't fork) |
| 72 | Critical OS file missing |
| 73 | Can't create output file |
| 74 | Input/output error |
| 75 | Temporary failure |
| 76 | Remote error in protocol |
| 77 | Permission denied |
| 78 | Configuration error |

---

## Usage Examples

### Basic Pattern Usage

```bash
#!/bin/bash

# Load required patterns
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh

# Use logging
log_info "Application starting"

# Use configuration
database_url=$(get_config "DATABASE_URL" ".env" "sqlite://local.db")
log_info "Using database: $database_url"

# Use error handling
check_command_exists "git" || handle_error $LINENO "Git is required"

log_success "Application initialized successfully"
```

### Advanced Integration

```bash
#!/bin/bash

# Load all patterns
for pattern in patterns/*/simple-*.sh; do
    [[ -f "$pattern" ]] && source "$pattern"
done

# Run quality checks before proceeding
if ! run_quality_checks; then
    handle_error $LINENO "Quality checks failed"
fi

# Detect project and configure accordingly
project_type=$(detect_project_type)
log_info "Working with $project_type project"

# Generate documentation
generate_docs

log_success "All operations completed successfully"
```

---

## API Evolution

This API follows semantic versioning:
- **Major** changes (breaking): Increment major version
- **Minor** changes (new features): Increment minor version  
- **Patch** changes (bug fixes): Increment patch version

Current API Version: **1.0.0**

For the latest API updates, see [CHANGELOG.md](../CHANGELOG.md).