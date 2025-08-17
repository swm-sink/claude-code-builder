#!/bin/bash

# Simple Error Handling Pattern for Claude Code Projects
# Copy this into your scripts for basic error handling and logging

set -e  # Exit on any command failure

# Colors for output (works in terminals)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Simple logging functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Basic error handler
handle_error() {
    local exit_code=$?
    local line_number=$1
    log_error "Script failed at line $line_number with exit code $exit_code"
    exit $exit_code
}

# Set up error handling
trap 'handle_error $LINENO' ERR

# Example usage:
# log_info "Starting process..."
# if ! some_command; then
#     log_error "Command failed"
#     exit 1
# fi
# log_info "Process completed successfully"