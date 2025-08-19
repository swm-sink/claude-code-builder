#!/bin/bash
# Technical: Structured logging with severity levels, colored output, and error propagation for bash scripts
# Simple: Like having a voice that tells you what's happening and speaks up when things go wrong
# Connection: Teaches error handling patterns that apply to any programming language

# Log info message with green [INFO] prefix
log_info() { echo -e "\033[32m[INFO]\033[0m $*" >&1; }

# Log warning message with yellow [WARN] prefix  
log_warn() { echo -e "\033[33m[WARN]\033[0m $*" >&2; }

# Log error message with red [ERROR] prefix to stderr
log_error() { echo -e "\033[31m[ERROR]\033[0m $*" >&2; }

# Log debug message (only if DEBUG=1) with blue [DEBUG] prefix
log_debug() { [[ "${DEBUG:-0}" == "1" ]] && echo -e "\033[34m[DEBUG]\033[0m $*" >&2; }

# Handle error with context and exit
handle_error() {
    local line_number=${1:-"unknown"}
    local error_message=${2:-"Unknown error occurred"}
    log_error "Script failed at line $line_number: $error_message"
    exit 1
}

# Check if command exists
check_command_exists() { command -v "$1" >/dev/null 2>&1; }

# Demo function showing all logging levels
test_error_handling() {
    log_info "Starting error handling demo"
    log_warn "This is a warning message"
    log_error "This is an error (demo continues)"
    DEBUG=1 log_debug "Debug message (only when DEBUG=1)"
    check_command_exists "git" && log_info "Git available" || log_warn "Git not found"
    log_info "Demo completed successfully"
}

# Usage: source patterns/error-handling/simple-error-handling.sh
# log_info "Application starting"
# log_warn "Config not found, using defaults" 
# log_error "Database connection failed"
# handle_error $LINENO "Processing failed"
# DEBUG=1 log_debug "Variable: $var"