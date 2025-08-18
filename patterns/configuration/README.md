# Configuration Patterns

**Technical:** Configuration file parsing system with secure handling of multiple formats (JSON, YAML, ENV), environment variable integration, and format validation for flexible application configuration management.

**Simple:** Like having a universal translator that can read different types of configuration files safely and extract the settings your applications need.

**Connection:** These patterns teach configuration management concepts essential for building flexible, maintainable applications that can adapt to different environments and deployment scenarios.

## ⚙️ Available Patterns

### config-reader.sh

**Purpose:** Universal configuration file reader with multi-format support and security validation

**Functions:**
- `read_config()` - Read value from any supported config format with fallback
- `read_env_config()` - Specialized reader for environment-style files (.env, .conf)
- `has_config()` - Check if configuration file exists and is readable
- `get_config()` - Read with environment variable fallback (env vars take precedence)
- `validate_config()` - Validate configuration file format and syntax

**Supported Formats:**
- **JSON** - `{"key": "value"}` format detection and parsing
- **YAML** - `key: value` format with basic parsing
- **Environment** - `KEY=value` format (default for unknown extensions)

**Security Features:**
- **No Code Execution** - Pure parsing without eval or source
- **Input Validation** - Regex validation for safe key names
- **File Existence Checks** - Safe handling of missing files
- **Quote Stripping** - Automatic removal of surrounding quotes

**Line Count:** 48 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/configuration/config-reader.sh

# Read from different config formats
value=$(read_config "config.json" "database_url" "localhost")
port=$(read_config "app.yaml" "port" "3000")
secret=$(read_config ".env" "API_SECRET" "default-secret")

# Check if config exists
if has_config ".env"; then
    echo "Environment configuration found"
    database_url=$(read_config ".env" "DATABASE_URL")
fi

# Get config with environment variable fallback
# Checks environment first, then file, then default
api_key=$(get_config "API_KEY" "config.env" "development-key")

# Validate configuration format
if validate_config "app.yaml"; then
    echo "✅ Configuration format is valid"
else
    echo "❌ Configuration format is invalid"
fi
```

## 🔧 Pattern Composition

### With Logging Integration
```bash
source patterns/configuration/config-reader.sh
source patterns/logging/simple-logging.sh

load_app_config() {
    local config_file="${1:-app.conf}"
    
    if ! has_config "$config_file"; then
        log_warn "Configuration file not found: $config_file"
        return 1
    fi
    
    if ! validate_config "$config_file"; then
        log_error "Invalid configuration format: $config_file"
        return 1
    fi
    
    log_info "Loading configuration from: $config_file"
    
    # Load application settings
    APP_PORT=$(read_config "$config_file" "port" "8080")
    APP_HOST=$(read_config "$config_file" "host" "localhost")
    
    log_success "Configuration loaded successfully"
}
```

### With Security Validation
```bash
source patterns/configuration/config-reader.sh
source patterns/security/security-basics.sh

secure_config_load() {
    local config_file="$1"
    
    # Security check for config file
    if detect_secrets "$config_file" | grep -q "$config_file"; then
        log_error "Configuration file contains potential secrets: $config_file"
        return 1
    fi
    
    # Safe config loading
    DATABASE_URL=$(get_config "DATABASE_URL" "$config_file")
    API_KEY=$(get_config "API_KEY" "$config_file")
    
    # Validate required configs are present
    [[ -n "$DATABASE_URL" ]] || { log_error "DATABASE_URL not configured"; return 1; }
}
```

### With Project Validation
```bash
source patterns/configuration/config-reader.sh
source patterns/project-validation/project-validator.sh

configure_for_project() {
    local project_dir="${1:-.}"
    local project_type
    project_type=$(detect_project_architecture "$project_dir")
    
    case "$project_type" in
        "nodejs")
            CONFIG_FILE="$project_dir/package.json"
            APP_NAME=$(read_config "$CONFIG_FILE" "name" "unnamed-app")
            ;;
        "python")
            CONFIG_FILE="$project_dir/setup.cfg"
            [[ ! -f "$CONFIG_FILE" ]] && CONFIG_FILE="$project_dir/.env"
            ;;
        *)
            CONFIG_FILE="$project_dir/.env"
            ;;
    esac
    
    echo "Using configuration: $CONFIG_FILE"
}
```

## 🛡️ Security Considerations

- **No Code Execution** - Uses grep/sed parsing instead of eval or source
- **Input Sanitization** - Validates key names with regex patterns
- **Quote Handling** - Safely strips surrounding quotes without injection
- **File Permissions** - Checks file readability before parsing
- **Environment Isolation** - get_config() prioritizes environment variables safely

## 🎓 Educational Value

### Concepts Taught
- **Configuration Management** - External configuration vs hardcoded values
- **Multi-Format Parsing** - Handling different configuration file formats
- **Fallback Strategies** - Environment variables, files, and defaults
- **Input Validation** - Secure parsing without code execution
- **Error Handling** - Graceful handling of missing or invalid configurations

### Transferable Skills
- **Application Architecture** - Separation of configuration from code
- **DevOps Practices** - Environment-specific configuration management
- **Security Awareness** - Safe configuration parsing and secret management
- **Cross-Platform Development** - Universal configuration approaches

## 🧪 Testing Examples

### JSON Configuration Test
```bash
# Create JSON config
cat > test-config.json << 'EOF'
{
  "database_url": "postgresql://localhost:5432/myapp",
  "port": "3000",
  "debug": "true"
}
EOF

source patterns/configuration/config-reader.sh

# Test JSON parsing
echo "Database URL: $(read_config "test-config.json" "database_url")"
echo "Port: $(read_config "test-config.json" "port" "8080")"
echo "Missing key: $(read_config "test-config.json" "missing" "default")"
```

### YAML Configuration Test
```bash
# Create YAML config
cat > test-config.yaml << 'EOF'
database_url: postgresql://localhost:5432/myapp
port: 3000
debug: true
EOF

source patterns/configuration/config-reader.sh

# Test YAML parsing
echo "Database URL: $(read_config "test-config.yaml" "database_url")"
echo "Debug mode: $(read_config "test-config.yaml" "debug" "false")"
```

### Environment File Test
```bash
# Create .env file
cat > test.env << 'EOF'
DATABASE_URL=postgresql://localhost:5432/myapp
API_KEY="secret-key-123"
PORT=3000
# This is a comment
DEBUG=true
EOF

source patterns/configuration/config-reader.sh

# Test environment parsing
echo "Database: $(read_config "test.env" "DATABASE_URL")"
echo "API Key: $(read_config "test.env" "API_KEY")"
echo "Port: $(read_config "test.env" "PORT")"
```

### Environment Variable Fallback Test
```bash
source patterns/configuration/config-reader.sh

# Set environment variable
export TEST_KEY="environment-value"

# Create config file
echo 'TEST_KEY=file-value' > test.conf

# Test precedence (environment should win)
result=$(get_config "TEST_KEY" "test.conf" "default-value")
echo "Result: $result"  # Should be "environment-value"
```

## 🚀 Advanced Usage

### Configuration Merging
```bash
# Merge multiple configuration sources
merge_configs() {
    local env_file="$1"
    local json_file="$2"
    
    # Load from environment file first
    DATABASE_URL=$(read_config "$env_file" "DATABASE_URL")
    API_KEY=$(read_config "$env_file" "API_KEY")
    
    # Override with JSON values if present
    [[ -f "$json_file" ]] && {
        DATABASE_URL=$(read_config "$json_file" "database_url" "$DATABASE_URL")
        PORT=$(read_config "$json_file" "port" "3000")
    }
    
    echo "Final DATABASE_URL: $DATABASE_URL"
    echo "Final PORT: $PORT"
}
```

### Configuration Validation
```bash
# Validate required configuration keys
validate_required_config() {
    local config_file="$1"
    local required_keys=("DATABASE_URL" "API_KEY" "PORT")
    
    for key in "${required_keys[@]}"; do
        local value
        value=$(read_config "$config_file" "$key")
        if [[ -z "$value" ]]; then
            echo "❌ Required configuration missing: $key"
            return 1
        fi
    done
    
    echo "✅ All required configuration present"
}
```

### Dynamic Configuration Loading
```bash
# Load configuration based on environment
load_environment_config() {
    local environment="${NODE_ENV:-development}"
    local config_file="config/${environment}.json"
    
    if has_config "$config_file"; then
        echo "Loading configuration for: $environment"
        DATABASE_URL=$(read_config "$config_file" "database_url")
        API_BASE_URL=$(read_config "$config_file" "api_base_url")
    else
        echo "Using default configuration"
        DATABASE_URL="sqlite:///dev.db"
        API_BASE_URL="http://localhost:3000"
    fi
}
```

### Configuration Template Generation
```bash
# Generate configuration template
generate_config_template() {
    local format="${1:-env}"
    
    case "$format" in
        "json")
            cat > config.template.json << 'EOF'
{
  "database_url": "postgresql://user:pass@host:port/db",
  "api_key": "your-api-key-here",
  "port": "3000",
  "debug": "false"
}
EOF
            ;;
        "yaml")
            cat > config.template.yaml << 'EOF'
database_url: postgresql://user:pass@host:port/db
api_key: your-api-key-here
port: 3000
debug: false
EOF
            ;;
        *)
            cat > .env.template << 'EOF'
# Database configuration
DATABASE_URL=postgresql://user:pass@host:port/db

# API configuration
API_KEY=your-api-key-here
PORT=3000

# Debug mode
DEBUG=false
EOF
            ;;
    esac
    
    echo "Configuration template created: config.template.$format"
}
```

## 🔧 Customization

### Custom Format Support
```bash
# Extend for custom formats
read_custom_config() {
    local config_file="$1"
    local key="$2"
    local default_value="${3:-}"
    
    case "$config_file" in
        *.ini)
            # Basic INI file support
            grep "^$key=" "$config_file" | cut -d'=' -f2
            ;;
        *.toml)
            # Basic TOML support
            grep "^$key =" "$config_file" | sed 's/^[^=]*= *//'
            ;;
        *)
            read_config "$config_file" "$key" "$default_value"
            ;;
    esac
}
```

### Configuration Encryption Support
```bash
# Basic configuration decryption support
read_encrypted_config() {
    local config_file="$1"
    local key="$2"
    local encryption_key="${CONFIG_ENCRYPTION_KEY:-}"
    
    if [[ -n "$encryption_key" && -f "${config_file}.enc" ]]; then
        # Decrypt and read (pseudo-code - use proper encryption)
        local decrypted_value
        decrypted_value=$(decrypt_value "$encryption_key" "$(read_config "${config_file}.enc" "$key")")
        echo "$decrypted_value"
    else
        read_config "$config_file" "$key"
    fi
}
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Configuration values not reading correctly
**Solution:** Check file format and key names - ensure exact case matching

**Issue:** JSON parsing fails
**Solution:** Validate JSON syntax and ensure proper quoting

**Issue:** Environment variables not taking precedence
**Solution:** Use `get_config()` instead of `read_config()` for env fallback

### Debugging Configuration Loading
```bash
# Debug configuration parsing
debug_config() {
    local config_file="$1"
    local key="$2"
    
    echo "=== Configuration Debug ==="
    echo "File: $config_file"
    echo "Key: $key"
    echo "File exists: $(has_config "$config_file" && echo "yes" || echo "no")"
    echo "File format valid: $(validate_config "$config_file" && echo "yes" || echo "no")"
    echo "Environment value: ${!key:-"(not set)"}"
    echo "File value: $(read_config "$config_file" "$key" "(not found)")"
    echo "Final value: $(get_config "$key" "$config_file" "(default)")"
}
```

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with safe parsing methods  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

## 🎯 Configuration Management Standards

### File Format Support
- **JSON** - JavaScript Object Notation with key-value extraction
- **YAML** - Human-readable data serialization with basic parsing
- **Environment** - Shell-style KEY=value format (most common)

### Security Standards
- **No Code Execution** - Parse-only approach without eval
- **Input Validation** - Safe key name patterns only
- **Quote Handling** - Automatic quote stripping without injection
- **Permission Checks** - File accessibility validation

### Integration Benefits
- **Environment Parity** - Same config interface across all patterns
- **Deployment Flexibility** - Multiple format support for different environments
- **Secret Management** - Safe handling of sensitive configuration
- **Development Workflow** - Easy configuration for different stages

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux)  
**Dependencies:** Standard Unix tools (grep, sed, cut)  
**Line Count:** 48 lines  
**Claude Comprehension:** Optimized ✅