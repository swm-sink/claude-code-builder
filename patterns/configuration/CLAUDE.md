# Configuration Pattern - AI Instructions

> **AI guidance for working with the configuration pattern in Claude Code Builder**

## Pattern Purpose

The configuration pattern provides comprehensive configuration management with secure multi-format parsing across multiple programming ecosystems. It serves as the configuration foundation for development workflows, ensuring secure, flexible, and maintainable configuration handling through intelligent format detection, validation, and multi-source configuration management.

## Core Capabilities

### Automatic Format Detection and Multi-Source Configuration
- **Environment Files**: .env, .env.local, .env.production with secure key=value parsing
- **JSON Configuration**: config.json, package.json with nested object navigation
- **YAML Configuration**: config.yml, docker-compose.yml with complex structure support
- **TOML Configuration**: Cargo.toml, pyproject.toml with strong typing
- **INI Configuration**: config.ini, setup.cfg with section-based organization
- **Multi-Source Precedence**: environment variables → .env files → config files → defaults

### Native Command Usage
```bash
# Configuration value retrieval
/config-manager "DATABASE_URL"                    # Auto-detect format and source
/config-manager "database.host" "config.json"    # Specific file and nested key
/config-manager "API_TIMEOUT" ".env" "5000"      # With default value

# Configuration management operations
/config-manager "set" "PORT" "3000" ".env"       # Set configuration value
/config-manager "validate" "config.json"         # Validate configuration format
/config-manager "list" "config.yml"              # List all configuration keys
/config-manager "discover"                       # Find all configuration files

# Advanced configuration operations
/config-manager "multi" "DATABASE_URL"           # Multi-source resolution
/config-manager "migrate" "config.json" "config.yml"  # Format conversion
/config-manager "security" ".env"                # Security analysis
/config-manager "schema" "config.json"           # Schema validation
```

## AI Assistant Guidelines

### When to Recommend Configuration Pattern
1. **Any development project** - Configuration management is essential for all applications
2. **Environment-specific deployments** - Different configurations for dev/staging/production
3. **Multi-format configuration needs** - Projects with JSON, YAML, TOML, or mixed formats
4. **Security-sensitive applications** - Secure configuration handling and validation
5. **Team collaboration projects** - Standardized configuration management across team
6. **Docker and containerized applications** - Configuration injection and environment management
7. **CI/CD pipeline configuration** - Environment-specific configuration management

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive configuration status reporting
- **Security Scanner**: Integrates with security scanning for configuration vulnerability assessment
- **Quality Gates**: Provides configuration validation as part of quality assurance
- **Testing**: Configuration management for test environments and test data
- **Documentation**: Configuration documentation generation and schema validation

### Usage Patterns to Recommend

#### Standard Configuration Workflow
```bash
# Daily development configuration management
/config-manager "DATABASE_URL"                   # Get database connection string
/config-manager "API_KEY" ".env.local"          # Get local development API key
/config-manager "PORT" ".env" "3000"            # Get application port with default

# Configuration validation
/error-handler "info" "Validating application configuration"
/config-manager "validate" "config.json"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Configuration validation passed"
else
    /error-handler "error" "Configuration validation failed"
fi
```

#### Multi-Environment Configuration
```bash
# Environment-specific configuration management
/config-manager "multi" "DATABASE_URL"          # Multi-source resolution
/config-manager "DATABASE_URL" ".env.production" # Production-specific config
/config-manager "DATABASE_URL" ".env.development" # Development-specific config
/config-manager "DATABASE_URL" ".env.test"      # Test-specific config
```

#### Configuration Security and Validation
```bash
# Security-focused configuration management
/error-handler "info" "Starting configuration security validation"
/config-manager "security" ".env"               # Check for exposed secrets
/security-scanner "config"                      # Comprehensive security scan
/config-manager "validate" "config.json"        # Format and structure validation
/error-handler "info" "Configuration security validation completed"
```

#### Configuration Migration and Format Conversion
```bash
# Configuration format migration
/config-manager "migrate" ".env" "config.json"  # Environment to JSON
/config-manager "migrate" "config.json" "config.yml" # JSON to YAML
/config-manager "validate" "config.yml"         # Validate migrated configuration
```

### Best Practices to Teach

#### Configuration Organization
- **Environment Variables**: Use for secrets, deployment-specific values, and overrides
- **Configuration Files**: Use for application structure, feature flags, and complex settings
- **Multi-Environment**: Separate configuration files for different environments
- **Sensitive Data**: Never commit secrets to version control, use environment variables

#### Configuration Security
- **Secret Management**: Use environment variables or external secret management systems
- **Input Validation**: Validate all configuration keys and values
- **File Permissions**: Secure configuration file permissions (600 for sensitive files)
- **Injection Prevention**: Validate configuration keys to prevent injection attacks

#### Configuration Structure
- **Nested Organization**: Use nested structures for related configuration groups
- **Naming Conventions**: Consistent naming patterns (SCREAMING_SNAKE_CASE for env, camelCase for JSON)
- **Documentation**: Comment configuration files and provide examples
- **Default Values**: Provide sensible defaults for optional configuration

### Code Examples for AI

#### Basic Configuration Access
```bash
# Standard configuration workflow
/error-handler "info" "Loading application configuration"

# Get database configuration with fallback
DATABASE_URL=$(/config-manager "DATABASE_URL" ".env" "sqlite://./default.db")
if [[ -n "$DATABASE_URL" ]]; then
    /error-handler "info" "Database URL configured: ${DATABASE_URL%%:*}://..."
else
    /error-handler "error" "Database URL not configured"
    /error-handler "handle-error" "$LINENO" "Missing required configuration"
fi
```

#### Multi-Format Configuration Handling
```bash
# Handle different configuration formats based on project
if /config-manager "validate" "config.json"; then
    /error-handler "info" "Using JSON configuration"
    API_KEY=$(/config-manager "api.key" "config.json")
elif /config-manager "validate" "config.yml"; then
    /error-handler "info" "Using YAML configuration"
    API_KEY=$(/config-manager "api.key" "config.yml")
else
    /error-handler "info" "Using environment configuration"
    API_KEY=$(/config-manager "API_KEY" ".env")
fi
```

#### Configuration-Driven Development Workflow
```bash
# Configuration-first development approach
/error-handler "info" "Starting configuration-driven application setup"

# Load all required configuration with validation
DATABASE_URL=$(/config-manager "DATABASE_URL")
API_KEY=$(/config-manager "API_KEY")
PORT=$(/config-manager "PORT" ".env" "3000")

# Validate all required configuration is present
if [[ -z "$DATABASE_URL" ]]; then
    /error-handler "error" "DATABASE_URL is required but not configured"
    /error-handler "info" "Add DATABASE_URL to .env file or environment variables"
    exit 1
fi

if [[ -z "$API_KEY" ]]; then
    /error-handler "error" "API_KEY is required but not configured"
    /error-handler "info" "Add API_KEY to .env file or environment variables"
    exit 1
fi

/error-handler "info" "Configuration validation complete"
/error-handler "info" "Starting application with PORT=$PORT"
```

#### Configuration Security Integration
```bash
# Security-aware configuration management
/error-handler "info" "Running configuration security validation"

# Check for security issues in configuration
if /config-manager "security" ".env"; then
    /error-handler "info" "Configuration security validation passed"
else
    /error-handler "warn" "Configuration security issues detected"
    /config-manager "security" ".env" "details"
fi

# Integrate with security scanner for comprehensive assessment
if /security-scanner "config"; then
    /error-handler "info" "Comprehensive security validation passed"
else
    /error-handler "error" "Security vulnerabilities detected in configuration"
fi
```

### Common User Questions & AI Responses

**Q: "How do I manage configuration for different environments?"**
A: Use `/config-manager "multi" "DATABASE_URL"` for multi-source resolution, or environment-specific files like `.env.production` and `.env.development`. The config manager automatically handles precedence: environment variables → .env.local → .env → config files.

**Q: "My configuration isn't loading, what should I check?"**
A: Run `/config-manager "discover"` to find all configuration files, then `/config-manager "validate" "your-config-file"` to check format. Use `/config-manager "list" "config.json"` to see all available keys.

**Q: "How do I securely handle API keys and secrets?"**
A: Use environment variables for secrets, never commit them to files. Run `/config-manager "security" ".env"` to check for exposed secrets, and `/security-scanner "config"` for comprehensive security validation.

**Q: "Can I convert between configuration formats?"**
A: Yes! Use `/config-manager "migrate" "config.json" "config.yml"` to convert between formats. The config manager supports JSON, YAML, TOML, INI, and environment formats with automatic conversion.

**Q: "How do I validate my configuration structure?"**
A: Use `/config-manager "validate" "config.json"` for format validation, `/config-manager "schema" "config.json"` for schema validation, and `/config-manager "structure" "config.yml"` to see configuration layout.

### Troubleshooting Guide for AI

#### Common Issues
- **Configuration not found**: Check file paths and use `/config-manager "discover"` to find available files
- **Format validation errors**: Use `/config-manager "validate"` to identify syntax issues
- **Key not found**: Use `/config-manager "list"` to see available keys, check nested key syntax
- **Permission errors**: Check file permissions and ensure read access to configuration files
- **Environment variable conflicts**: Use `/config-manager "multi"` to see precedence resolution

#### Validation Steps
1. **File Discovery**: `/config-manager "discover"` shows all configuration files
2. **Format Validation**: `/config-manager "validate" "config-file"` checks syntax
3. **Key Listing**: `/config-manager "list" "config-file"` shows available keys
4. **Multi-Source Resolution**: `/config-manager "multi" "KEY"` shows precedence
5. **Security Check**: `/config-manager "security" "config-file"` identifies issues

#### Format-Specific Troubleshooting

##### JSON Configuration Issues
- **Syntax errors**: Use `/config-manager "validate" "config.json"` to identify JSON syntax issues
- **Nested access**: Use dot notation like `database.host` for nested object access
- **Type issues**: JSON maintains type information (string, number, boolean)

##### YAML Configuration Issues
- **Indentation errors**: YAML is indentation-sensitive, check spacing consistency
- **Complex structures**: Use `/config-manager "structure" "config.yml"` to visualize layout
- **Multi-document**: YAML supports multiple documents, ensure proper separation

##### Environment File Issues
- **Quote handling**: Environment files support quoted and unquoted values
- **Variable expansion**: Some tools support `${VAR}` expansion, check documentation
- **Comment syntax**: Use `#` for comments, ensure no trailing spaces

##### TOML Configuration Issues
- **Section syntax**: Use `[section]` for sections, `[[array]]` for array of tables
- **Type validation**: TOML has strong typing, ensure values match expected types
- **Date/time formats**: TOML supports ISO 8601 date/time formats

### Advanced Usage Patterns

#### Schema-Driven Configuration
```bash
# Generate and validate configuration schemas
/config-manager "generate-schema" "config.json"
/config-manager "schema" "config.json" "schema.json"
```

#### Configuration Template Management
```bash
# Configuration templating and generation
/config-manager "template" "config.template.json" "config.json"
/config-manager "substitute" "config.json" ".env"
```

#### Dynamic Configuration Management
```bash
# Runtime configuration updates and reloading
/config-manager "watch" "config.json"           # Watch for changes
/config-manager "reload" "config.json"          # Reload configuration
/config-manager "diff" "config.old.json" "config.json"  # Compare configurations
```

### Integration Examples

#### With Docker and Containers
```bash
# Container configuration management
/config-manager "PORT" ".env" "3000"            # Container port configuration
/config-manager "multi" "DATABASE_URL"          # Database connection with env override
```

#### With CI/CD Pipelines
```bash
# Pipeline configuration validation
/config-manager "validate" "config.production.json"
/config-manager "security" ".env.production"
```

#### With Testing Frameworks
```bash
# Test configuration management
/config-manager "DATABASE_URL" ".env.test" "sqlite://./test.db"
/config-manager "API_BASE_URL" ".env.test" "http://localhost:3001"
```

## AI Development Guidelines

### When Helping Users
1. **Start with discovery** - Always begin with `/config-manager "discover"` to understand available configuration
2. **Explain multi-source precedence** - Help users understand environment variables → files → defaults
3. **Show format flexibility** - Demonstrate support for multiple configuration formats
4. **Integrate with security** - Always consider security implications of configuration management
5. **Provide validation guidance** - Show how to validate configuration format and values

### Pattern Recognition
- If user mentions configuration, settings, environment variables → recommend this pattern
- If user has multiple environments → highlight multi-source and environment-specific features
- If user asks about JSON/YAML/TOML → demonstrate format conversion and validation
- If user needs secure configuration → show security features and integration with security scanner

### Configuration Assurance
- Ensure configuration commands are appropriate for detected project types and formats
- Verify configuration security best practices are followed and explained
- Check that error handling provides useful feedback about configuration issues
- Confirm integration patterns work with other Claude Code Builder patterns
- Validate that configuration recommendations follow security and maintainability principles

### Error Recovery Guidance
- Help users identify and fix configuration format and syntax issues
- Guide secure configuration management practices and secret handling
- Provide format-specific troubleshooting steps and validation techniques
- Suggest alternative configuration approaches when primary methods fail
- Ensure configuration solutions are maintainable and scalable

This configuration pattern provides intelligent, secure configuration management that handles multiple formats and sources while offering comprehensive validation and seamless integration with development workflows across various programming languages and deployment environments.