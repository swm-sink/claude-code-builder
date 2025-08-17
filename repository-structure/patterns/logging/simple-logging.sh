#!/bin/bash
# Technical: Standardized logging system with severity levels, color coding, and structured output formatting
# Simple: Consistent voice for all your tools that speaks clearly and uses the same words for the same things
# Connection: Teaches logging standardization essential for debugging, monitoring, and maintaining complex systems

# Global logging configuration
LOG_COLOR=${LOG_COLOR:-"true"}

# Log info message with green [INFO] prefix
log_info() {
    if [[ "$LOG_COLOR" == "true" ]]; then
        echo -e "🟢 \033[32m[INFO]\033[0m $*" >&1
    else
        echo "[INFO] $*" >&1
    fi
}

# Log warning message with yellow [WARN] prefix  
log_warn() {
    if [[ "$LOG_COLOR" == "true" ]]; then
        echo -e "🟡 \033[33m[WARN]\033[0m $*" >&2
    else
        echo "[WARN] $*" >&2
    fi
}

# Log error message with red [ERROR] prefix to stderr
log_error() {
    if [[ "$LOG_COLOR" == "true" ]]; then
        echo -e "🔴 \033[31m[ERROR]\033[0m $*" >&2
    else
        echo "[ERROR] $*" >&2
    fi
}

# Log debug message (only if DEBUG=1) with blue [DEBUG] prefix
log_debug() {
    [[ "${DEBUG:-0}" == "1" ]] || return 0
    if [[ "$LOG_COLOR" == "true" ]]; then
        echo -e "🔵 \033[34m[DEBUG]\033[0m $*" >&2
    else
        echo "[DEBUG] $*" >&2
    fi
}

# Log success message with green checkmark
log_success() {
    [[ "$LOG_COLOR" == "true" ]] && echo -e "✅ \033[32m[SUCCESS]\033[0m $*" >&1 || echo "[SUCCESS] $*" >&1
}
