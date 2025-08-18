#!/bin/bash
# Technical: Configuration file parsing system with secure handling of multiple formats and validation
# Simple: Universal translator that can read different types of configuration files safely
# Connection: Teaches configuration management essential for building flexible, maintainable applications

# Read configuration value from file
read_config() {
    local config_file="$1" key="$2" default_value="${3:-}"
    [[ -f "$config_file" ]] || { echo "$default_value"; return 1; }
    
    case "$config_file" in
        *.json) grep "\"$key\"" "$config_file" 2>/dev/null | sed 's/.*"'"$key"'"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' | head -1 ;;
        *.yaml|*.yml) grep "^$key:" "$config_file" 2>/dev/null | sed 's/^'"$key"':[[:space:]]*\(.*\)$/\1/' | head -1 ;;
        *) grep "^$key=" "$config_file" 2>/dev/null | cut -d'=' -f2- | sed 's/^["'"'"']\(.*\)["'"'"']$/\1/' | head -1 ;;
    esac | { read value; echo "${value:-$default_value}"; }
}

# Read from environment-style configuration file (most common)
read_env_config() {
    local config_file="$1" key="$2" default_value="${3:-}"
    [[ -f "$config_file" ]] || { echo "$default_value"; return 1; }
    local value
    value=$(grep "^$key=" "$config_file" 2>/dev/null | cut -d'=' -f2- | sed 's/^["'"'"']\(.*\)["'"'"']$/\1/' | head -1)
    echo "${value:-$default_value}"
}

# Check if configuration file exists and is readable
has_config() {
    [[ -f "$1" && -r "$1" ]]
}

# Get configuration value with environment variable fallback
get_config() {
    local key="$1" config_file="${2:-.env}" default_value="${3:-}"
    
    # Validate key parameter to prevent injection attacks
    [[ "$key" =~ ^[A-Za-z_][A-Za-z0-9_]*(\.[A-Za-z_][A-Za-z0-9_]*)*$ ]] || {
        echo "❌ Invalid key format: $key" >&2
        echo "$default_value"
        return 1
    }
    
    # Safe environment variable access (bash/zsh compatible)
    local env_value
    env_value=$(printenv "$key" 2>/dev/null)
    [[ -n "$env_value" ]] && echo "$env_value" && return
    read_config "$config_file" "$key" "$default_value"
}

# Validate configuration file format
validate_config() {
    local config_file="$1"
    [[ -f "$config_file" ]] || return 1
    case "$config_file" in
        *.json) grep -q '".*"[[:space:]]*:' "$config_file" ;;
        *.yaml|*.yml) grep -q '^[a-zA-Z_][a-zA-Z0-9_]*:' "$config_file" ;;
        *) grep -q '^[A-Za-z_][A-Za-z0-9_]*=' "$config_file" ;;
    esac
}