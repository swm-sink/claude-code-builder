# Migration Guide

> Simple strategies for migrating existing scripts to Claude Code Builder patterns

## Migration Overview

**Migration Strategy:**
- **Phase 1**: Add logging and error handling
- **Phase 2**: Add configuration management  
- **Phase 3**: Add testing and quality gates
- **Phase 4**: Optimize and refine

**Benefits:**
- Improved reliability and error handling
- Better observability and debugging
- Standardized configuration management
- Quality assurance and testing

## Before You Start

### Prerequisites

```bash
# Install Claude Code Builder
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash

# Verify installation
ls patterns/*/simple-*.sh
```

### Backup Your Scripts

```bash
# Create backup
cp -r scripts/ scripts-backup/
git add . && git commit -m "Backup before Claude Code Builder migration"
```

## Phase 1: Basic Migration (Essential Patterns)

### Step 1: Add Logging

**Before (Basic Echo):**
```bash
#!/bin/bash
echo "Starting backup process..."
cp /important/file /backup/
echo "Backup completed"
```

**After (Pattern-Based Logging):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh

log_info "Starting backup process..."
cp /important/file /backup/
log_success "Backup completed"
```

### Step 2: Add Error Handling

**Before (No Error Handling):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh

log_info "Starting backup process..."
cp /important/file /backup/
log_success "Backup completed"
```

**After (With Error Handling):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

log_info "Starting backup process..."
cp /important/file /backup/ || handle_error $LINENO "Backup failed"
log_success "Backup completed"
```

### Step 3: Add Prerequisites Check

**Enhanced Version:**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

# Check prerequisites
log_info "Checking prerequisites..."
check_command_exists "cp" || handle_error $LINENO "cp command not found"
[[ -f "/important/file" ]] || handle_error $LINENO "Source file not found"
[[ -d "/backup" ]] || handle_error $LINENO "Backup directory not found"

# Perform backup
log_info "Starting backup process..."
cp /important/file /backup/ || handle_error $LINENO "Backup failed"
log_success "Backup completed successfully"
```

## Phase 2: Configuration Migration

### Step 1: Externalize Configuration

**Before (Hardcoded Values):**
```bash
#!/bin/bash
DATABASE_HOST="localhost"
DATABASE_PORT="5432"
DATABASE_NAME="myapp"
API_KEY="abc123"
```

**After (Configuration Pattern):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh

# Load configuration
log_info "Loading configuration..."
DATABASE_HOST=$(get_config "DATABASE_HOST" ".env" "localhost")
DATABASE_PORT=$(get_config "DATABASE_PORT" ".env" "5432")
DATABASE_NAME=$(get_config "DATABASE_NAME" ".env" "myapp")
API_KEY=$(get_config "API_KEY" ".env" "")

# Validate required configuration
[[ -n "$API_KEY" ]] || handle_error $LINENO "API_KEY is required"

log_info "Configuration loaded successfully"
```

### Step 2: Create Configuration File

**Create .env file:**
```bash
# .env file
DATABASE_HOST=production-db.example.com
DATABASE_PORT=5432
DATABASE_NAME=myapp_prod
API_KEY=your-secret-api-key-here
DEBUG=false
LOG_LEVEL=INFO
```

**Set secure permissions:**
```bash
chmod 600 .env
```

## Phase 3: Testing Migration

### Step 1: Add Basic Tests

**Create test functions:**
```bash
#!/bin/bash
# test-script.sh
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/testing/simple-test-runner.sh

# Test configuration loading
test_config_loading() {
    local test_config="test.env"
    echo "TEST_VALUE=123" > "$test_config"
    
    local value
    value=$(get_config "TEST_VALUE" "$test_config" "")
    assert_equals "123" "$value" "Config should load correctly"
    
    rm -f "$test_config"
}

# Test file operations
test_file_operations() {
    local test_file="test_file.txt"
    echo "test content" > "$test_file"
    
    assert_contains "$(cat "$test_file")" "test content" "File should contain test content"
    
    rm -f "$test_file"
}

# Run tests
log_info "Running tests..."
run_test "Configuration loading" test_config_loading
run_test "File operations" test_file_operations
log_success "All tests completed"
```

## Phase 4: Quality Gates Migration

### Step 1: Add Quality Checks

**Enhanced script with quality gates:**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/quality-gates/quality-check.sh

# Run quality checks before main operation
log_info "Running quality checks..."
run_quality_checks || handle_error $LINENO "Quality checks failed"

# Main script logic here
log_info "Main operation starting..."
# Your application logic
log_success "Operation completed successfully"
```

## Common Migration Patterns

### 1. Database Scripts

**Before:**
```bash
#!/bin/bash
echo "Connecting to database..."
mysql -h localhost -u root -p myapp < migration.sql
echo "Migration completed"
```

**After:**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh

# Load database configuration
DB_HOST=$(get_config "DB_HOST" ".env" "localhost")
DB_USER=$(get_config "DB_USER" ".env" "root")
DB_NAME=$(get_config "DB_NAME" ".env" "myapp")

# Validate required configuration
[[ -n "$DB_USER" ]] || handle_error $LINENO "DB_USER is required"
[[ -f "migration.sql" ]] || handle_error $LINENO "Migration file not found"

log_info "Connecting to database: $DB_HOST"
mysql -h "$DB_HOST" -u "$DB_USER" -p "$DB_NAME" < migration.sql || \
    handle_error $LINENO "Database migration failed"

log_success "Migration completed successfully"
```

### 2. Deployment Scripts

**Before:**
```bash
#!/bin/bash
echo "Deploying application..."
git pull origin main
npm install
npm run build
systemctl restart myapp
echo "Deployment completed"
```

**After:**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/quality-gates/quality-check.sh

# Check prerequisites
log_info "Checking deployment prerequisites..."
check_command_exists "git" || handle_error $LINENO "Git not available"
check_command_exists "npm" || handle_error $LINENO "npm not available"
check_command_exists "systemctl" || handle_error $LINENO "systemctl not available"

# Run quality checks
log_info "Running pre-deployment quality checks..."
run_quality_checks || handle_error $LINENO "Quality checks failed"

# Deployment steps
log_info "Updating code from repository..."
git pull origin main || handle_error $LINENO "Git pull failed"

log_info "Installing dependencies..."
npm install || handle_error $LINENO "npm install failed"

log_info "Building application..."
npm run build || handle_error $LINENO "Build failed"

log_info "Restarting service..."
systemctl restart myapp || handle_error $LINENO "Service restart failed"

log_success "Deployment completed successfully"
```

### 3. Backup Scripts

**Before:**
```bash
#!/bin/bash
DATE=$(date +%Y%m%d)
tar -czf backup_$DATE.tar.gz /important/data
cp backup_$DATE.tar.gz /backup/location/
echo "Backup completed"
```

**After:**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh

# Load configuration
BACKUP_SOURCE=$(get_config "BACKUP_SOURCE" ".env" "/important/data")
BACKUP_DEST=$(get_config "BACKUP_DEST" ".env" "/backup/location")

# Validate configuration
[[ -d "$BACKUP_SOURCE" ]] || handle_error $LINENO "Backup source not found: $BACKUP_SOURCE"
[[ -d "$BACKUP_DEST" ]] || handle_error $LINENO "Backup destination not found: $BACKUP_DEST"

# Create backup
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backup_$DATE.tar.gz"

log_info "Creating backup: $BACKUP_FILE"
tar -czf "$BACKUP_FILE" "$BACKUP_SOURCE" || \
    handle_error $LINENO "Failed to create backup archive"

log_info "Moving backup to destination..."
mv "$BACKUP_FILE" "$BACKUP_DEST/" || \
    handle_error $LINENO "Failed to move backup to destination"

log_success "Backup completed: $BACKUP_DEST/$BACKUP_FILE"
```

## Migration by Script Type

### System Administration Scripts

**Migration Priority:**
1. **Logging**: Essential for troubleshooting
2. **Error Handling**: Critical for system stability
3. **Configuration**: Important for flexibility
4. **Security**: Required for production systems

**Example Migration:**
```bash
# Original system admin script
#!/bin/bash
service nginx stop
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
cp new-nginx.conf /etc/nginx/nginx.conf
service nginx start

# Migrated version
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/security/security-basics.sh

# Security scan first
basic_security_scan || handle_error $LINENO "Security scan failed"

# Validate prerequisites
check_command_exists "nginx" || handle_error $LINENO "nginx not installed"
[[ -f "new-nginx.conf" ]] || handle_error $LINENO "New config file not found"

# Perform update with proper error handling
log_info "Stopping nginx service..."
systemctl stop nginx || handle_error $LINENO "Failed to stop nginx"

log_info "Backing up current configuration..."
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup || \
    handle_error $LINENO "Failed to backup config"

log_info "Installing new configuration..."
cp new-nginx.conf /etc/nginx/nginx.conf || \
    handle_error $LINENO "Failed to install new config"

log_info "Starting nginx service..."
systemctl start nginx || {
    log_error "Failed to start nginx, restoring backup..."
    cp /etc/nginx/nginx.conf.backup /etc/nginx/nginx.conf
    systemctl start nginx
    handle_error $LINENO "Failed to start nginx with new config"
}

log_success "nginx configuration updated successfully"
```

### Data Processing Scripts

**Migration Priority:**
1. **Error Handling**: Data integrity protection
2. **Logging**: Processing visibility
3. **Testing**: Data validation
4. **Configuration**: Flexible processing parameters

### CI/CD Scripts

**Migration Priority:**
1. **Quality Gates**: Build validation
2. **Error Handling**: Pipeline reliability
3. **Testing**: Comprehensive validation
4. **Security**: Deployment safety

## Gradual Migration Strategy

### Week 1: Essential Patterns
- Add logging to all scripts
- Add basic error handling
- Test in development environment

### Week 2: Configuration
- Externalize hardcoded values
- Create configuration files
- Set up environment-specific configs

### Week 3: Testing
- Add basic tests for critical functions
- Set up automated test execution
- Validate test coverage

### Week 4: Quality & Security
- Add quality gates
- Run security scans
- Implement monitoring

## Migration Validation

### Validation Checklist

**Functionality:**
- [ ] All original functionality preserved
- [ ] Error conditions handled gracefully
- [ ] Configuration externalized properly
- [ ] Tests cover critical paths

**Quality:**
- [ ] Logging provides useful information
- [ ] Error messages are actionable
- [ ] Security scan passes
- [ ] Performance is acceptable

**Operations:**
- [ ] Scripts work in all environments
- [ ] Configuration is environment-specific
- [ ] Monitoring and alerting configured
- [ ] Documentation updated

### Testing Migration

**Test Plan:**
1. **Unit Testing**: Test individual functions
2. **Integration Testing**: Test pattern interactions
3. **System Testing**: Test in realistic environment
4. **Regression Testing**: Ensure no functionality lost

**Test Script Example:**
```bash
#!/bin/bash
# migration-validation.sh
source patterns/testing/simple-test-runner.sh

# Test migrated script functionality
test_migrated_script() {
    # Run migrated script in test mode
    TEST_MODE=true ./migrated-script.sh
    assert_equals 0 $? "Migrated script should execute successfully"
}

# Test configuration loading
test_configuration() {
    local config_value
    config_value=$(get_config "TEST_VALUE" "test.env" "default")
    assert_equals "expected" "$config_value" "Configuration should load correctly"
}

# Run validation tests
run_test "Migrated script functionality" test_migrated_script
run_test "Configuration loading" test_configuration
```

## Common Migration Issues

### Issue 1: Path Problems

**Problem:** Patterns not found after migration
```bash
source patterns/logging/simple-logging.sh
# bash: patterns/logging/simple-logging.sh: No such file or directory
```

**Solution:** Use absolute paths or verify working directory
```bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/patterns/logging/simple-logging.sh"
```

### Issue 2: Variable Conflicts

**Problem:** Pattern variables conflict with existing script variables
```bash
# Existing script uses DEBUG
DEBUG=1

# Pattern also uses DEBUG
source patterns/logging/simple-logging.sh
```

**Solution:** Rename conflicting variables
```bash
# Rename existing variable
SCRIPT_DEBUG=1

# Use pattern variable
source patterns/logging/simple-logging.sh
export DEBUG=1  # For pattern use
```

### Issue 3: Performance Impact

**Problem:** Scripts become slower after adding patterns
**Solution:** Load only required patterns and cache loading
```bash
# Instead of loading all patterns
if [[ -z "$PATTERNS_LOADED" ]]; then
    source patterns/logging/simple-logging.sh
    source patterns/error-handling/simple-error-handling.sh
    export PATTERNS_LOADED=true
fi
```

## Migration Tools

### Automated Migration Helper

**Simple migration script:**
```bash
#!/bin/bash
# migrate-script.sh

migrate_script() {
    local script_file="$1"
    local backup_file="${script_file}.pre-migration"
    
    # Create backup
    cp "$script_file" "$backup_file"
    
    # Add pattern loading at the top
    {
        echo "#!/bin/bash"
        echo "source patterns/logging/simple-logging.sh"
        echo "source patterns/error-handling/simple-error-handling.sh"
        echo ""
        tail -n +2 "$script_file"
    } > "${script_file}.new"
    
    # Replace original
    mv "${script_file}.new" "$script_file"
    
    echo "Migrated $script_file (backup: $backup_file)"
}

# Usage: ./migrate-script.sh your-script.sh
migrate_script "$1"
```

Remember: **Migration is an iterative process**. Start simple, test thoroughly, and gradually add more sophisticated patterns as you gain confidence with the system.