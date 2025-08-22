---
allowed-tools: Read, Write, Grep, Bash(grep:*), Bash(sed:*), Bash(awk:*), Bash(cut:*), Bash(jq:*), Bash(yq:*)
argument-hint: [config-key] or [config-file] or [operation]
description: Comprehensive configuration management with secure multi-format parsing and validation
category: patterns
---

# Config Manager

Intelligent configuration management with secure multi-format support: **$ARGUMENTS**

## Configuration Management System

I'll provide comprehensive configuration management capabilities with secure multi-format parsing, validation, and intelligent configuration handling across multiple project types and configuration formats.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining configuration operation and scope]
Mode: [get/set/validate/list/format/migrate]
Source: [file path, environment variable, or default]
Format: [json/yaml/env/toml/ini/auto-detect]
```

### Configuration Format Support

#### Automatic Format Detection Process
```markdown
**🔍 Configuration Analysis**

Analyzing configuration sources and formats...
- Detecting configuration file formats and structures
- Validating configuration syntax and security
- Identifying configuration patterns and dependencies
- Preparing secure configuration access and management
```

#### Supported Configuration Formats

##### Environment Files (.env)
```markdown
**📄 Environment Configuration**

Detection: .env, .env.local, .env.production, .env.development files
Format: KEY=value pairs with optional quotes and comments
Security: Input validation, injection prevention, secure parsing

Configuration Examples:
```
# Database configuration
DATABASE_URL=postgresql://user:pass@localhost:5432/dbname
DATABASE_POOL_SIZE=10
DATABASE_TIMEOUT=30

# Application settings
APP_NAME=MyApplication
APP_VERSION=1.0.0
APP_DEBUG=false
APP_PORT=3000

# API configuration
API_KEY=your-secret-api-key
API_TIMEOUT=5000
API_BASE_URL=https://api.example.com
```

Features:
- Automatic quote handling (single, double, none)
- Comment support (# prefix)
- Environment variable expansion
- Secure key validation and sanitization

Usage: /config-manager "DATABASE_URL" ".env"
```

##### JSON Configuration
```markdown
**📊 JSON Configuration**

Detection: .json, config.json, package.json files
Format: Standard JSON with nested object support
Security: JSON syntax validation, safe parsing, injection prevention

Configuration Examples:
```json
{
  "database": {
    "host": "localhost",
    "port": 5432,
    "name": "myapp",
    "ssl": true
  },
  "api": {
    "baseUrl": "https://api.example.com",
    "timeout": 5000,
    "retries": 3
  },
  "features": {
    "authentication": true,
    "logging": "debug",
    "cache": {
      "enabled": true,
      "ttl": 3600
    }
  }
}
```

Features:
- Nested object navigation with dot notation
- Type preservation (string, number, boolean, null)
- Array and object support
- Schema validation capabilities

Usage: /config-manager "database.host" "config.json"
```

##### YAML Configuration
```markdown
**📋 YAML Configuration**

Detection: .yaml, .yml, docker-compose.yml files
Format: YAML 1.2 standard with nested structures
Security: YAML syntax validation, safe loading, anchor resolution

Configuration Examples:
```yaml
database:
  host: localhost
  port: 5432
  credentials:
    username: myuser
    password: ${DATABASE_PASSWORD}
  options:
    ssl: true
    pool_size: 10

application:
  name: MyApp
  version: "1.0.0"
  environment: production
  features:
    - authentication
    - logging
    - monitoring

logging:
  level: info
  outputs:
    - console
    - file
  file_path: /var/log/myapp.log
```

Features:
- Multi-document YAML support
- Reference and anchor resolution
- Environment variable substitution
- Complex data structure support

Usage: /config-manager "database.host" "config.yml"
```

##### TOML Configuration
```markdown
**⚙️ TOML Configuration**

Detection: .toml, Cargo.toml, pyproject.toml files
Format: TOML v1.0.0 specification
Security: TOML syntax validation, secure parsing, type safety

Configuration Examples:
```toml
[database]
host = "localhost"
port = 5432
ssl = true

[database.credentials]
username = "myuser"
password = "secure-password"

[api]
base_url = "https://api.example.com"
timeout = 5000
retries = 3

[[services]]
name = "auth"
enabled = true
priority = 1

[[services]]
name = "cache"
enabled = false
priority = 2

[logging]
level = "info"
format = "json"
outputs = ["console", "file"]
```

Features:
- Table and array of tables support
- Strong typing with validation
- Nested section support
- Date/time and numeric type handling

Usage: /config-manager "database.host" "config.toml"
```

##### INI Configuration
```markdown
**📝 INI Configuration**

Detection: .ini, .cfg, setup.cfg files
Format: Traditional INI format with sections
Security: Section and key validation, secure parsing

Configuration Examples:
```ini
[database]
host = localhost
port = 5432
ssl = true
username = myuser
password = secure-password

[api]
base_url = https://api.example.com
timeout = 5000
retries = 3

[logging]
level = info
format = json
file_path = /var/log/myapp.log

[features]
authentication = true
caching = false
monitoring = true
```

Features:
- Section-based organization
- Key-value pair support
- Comment handling (# and ;)
- Case-insensitive sections and keys

Usage: /config-manager "database.host" "config.ini"
```

### Configuration Operations

#### Configuration Value Retrieval
```bash
# Get configuration value with automatic format detection
/config-manager "DATABASE_URL"

# Get value from specific file
/config-manager "database.host" "config.json"

# Get value with default fallback
/config-manager "API_TIMEOUT" "config.yml" "5000"

# Get value with environment variable priority
/config-manager "PORT" ".env" "3000"
```

**Retrieval Process**:
1. **Environment Variables**: Check environment first (highest priority)
2. **Configuration File**: Parse specified or auto-detected config file
3. **Default Value**: Return provided default or empty string
4. **Validation**: Validate key format and prevent injection attacks
5. **Type Conversion**: Convert values to appropriate types when possible

#### Configuration Value Setting
```bash
# Set configuration value in file
/config-manager "set" "DATABASE_URL" "postgresql://localhost:5432/mydb" ".env"

# Set nested JSON configuration
/config-manager "set" "database.host" "localhost" "config.json"

# Set YAML configuration with type preservation
/config-manager "set" "api.timeout" "5000" "config.yml"
```

#### Configuration Validation
```bash
# Validate configuration file format and syntax
/config-manager "validate" "config.json"

# Validate specific configuration key
/config-manager "validate" "DATABASE_URL" ".env"

# Comprehensive configuration validation
/config-manager "validate" "."
```

#### Configuration Listing and Discovery
```bash
# List all configuration keys in file
/config-manager "list" "config.json"

# List configuration files in project
/config-manager "discover"

# Show configuration structure
/config-manager "structure" "config.yml"
```

### Advanced Configuration Features

#### Multi-Source Configuration
```bash
# Handle configuration from multiple sources with precedence
/config-manager "multi" "DATABASE_URL"
# Checks: environment variables → .env.local → .env → config.json → defaults
```

#### Configuration Migration
```bash
# Convert between configuration formats
/config-manager "migrate" "config.json" "config.yml"

# Migrate environment file to JSON
/config-manager "migrate" ".env" "config.json"
```

#### Configuration Validation and Schema
```bash
# Validate configuration against schema
/config-manager "schema" "config.json" "schema.json"

# Generate configuration schema
/config-manager "generate-schema" "config.json"
```

#### Configuration Security Analysis
```bash
# Scan for security issues in configuration
/config-manager "security" "config.json"

# Check for exposed secrets
/config-manager "secrets" ".env"
```

### Integration with Error Handling

#### Comprehensive Configuration Status Reporting
```bash
# All configuration operations use error handling pattern
/error-handler "info" "Reading configuration from $config_file"

# Configuration errors
/error-handler "error" "Configuration file not found: $config_file"
/error-handler "warn" "Configuration key not found: $key"

# Configuration validation
/error-handler "info" "Configuration validation passed"

# Security issues
/error-handler "error" "Invalid key format prevents injection attack"
/error-handler "handle-error" "$LINENO" "Configuration parsing failed"
```

#### Detailed Configuration Reporting
```bash
# Configuration source reporting
/error-handler "info" "Configuration loaded from environment variable: $key"
/error-handler "info" "Configuration loaded from file: $config_file"
/error-handler "info" "Using default value for: $key"

# Format-specific feedback
/error-handler "info" "Detected JSON configuration format"
/error-handler "info" "Detected YAML configuration format"
/error-handler "warn" "Configuration format auto-detection failed"
```

### Configuration Implementation

#### Secure Configuration Parsing
```markdown
**Security-First Configuration Management**:

**Input Validation**:
- Key format validation to prevent injection attacks
- Configuration file path validation
- Value sanitization and type checking
- Environment variable name validation

**Safe Parsing**:
- JSON: Safe JSON parsing without eval()
- YAML: Safe YAML loading without code execution
- Environment: Secure environment variable access
- File Access: Read-only access with permission checking
```

#### Multi-Format Parser Engine
```markdown
**Unified Configuration Access**:

**Format Detection**:
1. **File Extension**: .json, .yml, .yaml, .toml, .ini, .env
2. **Content Analysis**: Syntax pattern recognition
3. **Magic Bytes**: File header analysis for format identification
4. **Fallback Strategy**: Default to environment format for unknown files

**Parser Selection**:
- **JSON**: Native JSON parsing with syntax validation
- **YAML**: YAML parser with safe loading
- **TOML**: TOML parser with type preservation
- **Environment**: Custom parser with quote handling
- **INI**: Section-aware INI parser
```

### Output Formatting

#### Standard Configuration Results
```
🔍 Configuration: DATABASE_URL
📄 Source: .env file
⚡ Status: Found

💾 Configuration Result:
  Key: DATABASE_URL
  Value: postgresql://localhost:5432/myapp
  Source: .env (line 3)
  Type: string

⏱️  Access Time: 15ms
🔒 Security: Validated and safe
```

#### Multi-Source Configuration Results
```
🔍 Configuration: API_TIMEOUT
📊 Sources: environment → .env → config.json

💾 Configuration Resolution:
  🌍 Environment: API_TIMEOUT (not set)
  📄 .env: API_TIMEOUT=5000 ✓
  📊 config.json: api.timeout=3000
  
✅ Final Value: 5000 (from .env)
🔄 Precedence: environment > .env > config files
```

#### Configuration Structure Display
```
🏗️  Configuration Structure: config.json

📊 Configuration Layout:
├── database/
│   ├── host: "localhost"
│   ├── port: 5432
│   └── ssl: true
├── api/
│   ├── baseUrl: "https://api.example.com"
│   ├── timeout: 5000
│   └── retries: 3
└── features/
    ├── authentication: true
    └── logging: "debug"

📈 Statistics: 9 keys, 3 sections, 2 levels deep
```

#### Configuration Validation Results
```
✅ Configuration Validation: config.json

📋 Validation Results:
  ✅ Syntax: Valid JSON format
  ✅ Structure: Well-formed nested objects
  ✅ Security: No suspicious patterns detected
  ✅ Types: Consistent type usage
  
🔍 Recommendations:
  • Consider using environment variables for sensitive data
  • Add schema validation for production environments
  
📊 Validation Score: 95/100
```

### Performance Optimization

#### Fast Configuration Access
- **Caching**: Configuration file parsing results caching
- **Environment Priority**: Fast environment variable access first
- **Lazy Loading**: Parse configuration files only when needed
- **Format Detection**: Efficient format detection algorithms

#### Efficient Resource Usage
- **Memory Management**: Minimal memory footprint for configuration data
- **File Access**: Read-only access with efficient file handling
- **Parser Selection**: Use most efficient parser for each format
- **Validation Caching**: Cache validation results for repeated access

### Security Considerations

#### Safe Configuration Handling
- **Input Validation**: Comprehensive key and value validation
- **Injection Prevention**: Prevent configuration injection attacks
- **File Access Control**: Secure file access with permission checking
- **Environment Security**: Safe environment variable access

#### Configuration Security Features
- **Secret Detection**: Identify potentially sensitive configuration values
- **Permission Validation**: Check file permissions before access
- **Path Traversal Prevention**: Prevent directory traversal attacks
- **Safe Parsing**: Use secure parsers that don't execute code

### Integration Patterns

#### With Error Handling Pattern
```bash
# Configuration workflow with comprehensive error handling
/error-handler "info" "Loading application configuration"
/config-manager "DATABASE_URL" ".env"
/error-handler "info" "Configuration loaded successfully"
```

#### With Security Scanner
```bash
# Security-aware configuration management
/config-manager "secrets" ".env"      # Check for exposed secrets
/security-scanner "config"            # Scan configuration security
```

#### With Quality Gates
```bash
# Configuration quality validation
/config-manager "validate" "config.json"
/quality-check "configuration"
```

### Configuration Options

#### Environment Variables
```bash
CONFIG_DEFAULT_FILE=".env"           # Default configuration file
CONFIG_SEARCH_PATHS=".:config:etc"   # Configuration search paths
CONFIG_FORMAT_PREFERENCE="env,json,yaml" # Format preference order
CONFIG_CACHE_ENABLED=true            # Enable configuration caching
CONFIG_VALIDATION_STRICT=false       # Strict validation mode
```

#### Project Configuration
```bash
# .configrc configuration file support
CONFIG_FILES=".env,config.json,config.yml"
CONFIG_PRECEDENCE="env,file,default"
CONFIG_SECURITY_SCAN=true
CONFIG_AUTO_MIGRATE=false
```

## Success Indicators

- ✅ **Multi-Format Support**: Seamless handling of JSON, YAML, TOML, INI, and environment formats
- ✅ **Security-First**: Input validation, injection prevention, and safe parsing
- ✅ **Intelligent Detection**: Automatic format detection and configuration discovery
- ✅ **Performance**: Fast configuration access with caching and optimization
- ✅ **Integration**: Works seamlessly with other Claude Code Builder patterns
- ✅ **Flexibility**: Support for complex nested configurations and multi-source precedence

The config manager provides intelligent, secure configuration management that handles multiple formats while offering comprehensive validation and seamless integration with development workflows.