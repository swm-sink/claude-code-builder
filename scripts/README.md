# Scripts Directory

## Overview

This directory contains utility and automation scripts for managing the dev-platform patterns. These scripts help with installation, validation, migration, and maintenance tasks.

## Core Scripts

### Installation & Setup

#### `install-patterns.sh`
Installs selected patterns into a target project.

```bash
# Install specific patterns
./scripts/install-patterns.sh error-handling testing quality-gates

# Install all patterns
./scripts/install-patterns.sh --all

# Install with custom target directory
./scripts/install-patterns.sh --target ./dev-tools error-handling
```

#### `setup-project.sh`
Complete project setup with recommended patterns and configuration.

```bash
# Auto-detect project type and install appropriate patterns
./scripts/setup-project.sh

# Setup with specific project type
./scripts/setup-project.sh --type nodejs
./scripts/setup-project.sh --type python
./scripts/setup-project.sh --type go
```

### Validation & Testing

#### `validate-patterns.sh`
Validates all patterns meet quality and security standards.

```bash
# Validate all patterns
./scripts/validate-patterns.sh

# Validate specific patterns
./scripts/validate-patterns.sh error-handling testing

# Detailed validation report
./scripts/validate-patterns.sh --detailed --output report.md
```

#### `test-patterns.sh`
Runs comprehensive test suite for patterns.

```bash
# Run all pattern tests
./scripts/test-patterns.sh

# Test specific patterns
./scripts/test-patterns.sh error-handling

# Cross-platform testing
./scripts/test-patterns.sh --platforms macos,linux

# Performance benchmarking
./scripts/test-patterns.sh --benchmark
```

### Migration & Upgrade

#### `migrate-from-level1-dev.sh`
Migrates existing Level-1-Dev installations to dev-platform patterns.

```bash
# Analyze current Level-1-Dev setup
./scripts/migrate-from-level1-dev.sh --analyze

# Perform migration with backup
./scripts/migrate-from-level1-dev.sh --migrate --backup

# Rollback migration
./scripts/migrate-from-level1-dev.sh --rollback
```

#### `upgrade-patterns.sh`
Updates patterns to latest versions.

```bash
# Check for pattern updates
./scripts/upgrade-patterns.sh --check

# Upgrade all patterns
./scripts/upgrade-patterns.sh

# Upgrade specific patterns
./scripts/upgrade-patterns.sh error-handling testing
```

### Development & Maintenance

#### `create-pattern.sh`
Scaffolds new pattern development.

```bash
# Create new pattern
./scripts/create-pattern.sh --name my-pattern --category testing

# Create pattern with template
./scripts/create-pattern.sh --name my-pattern --template advanced
```

#### `security-scan.sh`
Performs security scanning on all patterns.

```bash
# Basic security scan
./scripts/security-scan.sh

# Detailed security report
./scripts/security-scan.sh --detailed --format json

# Scan specific patterns
./scripts/security-scan.sh error-handling quality-gates
```

## Script Structure

### Standard Script Format
All scripts follow this structure:

```bash
#!/bin/bash
set -euo pipefail

# Script metadata
SCRIPT_NAME="$(basename "$0")"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Source common utilities
source "$PROJECT_ROOT/patterns/error-handling/simple-error-handling.sh"

# Script-specific functions
function main() {
    # Main script logic
}

# Execute main function if script is run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
```

### Common Features
- **Error handling** - All scripts use robust error handling
- **Logging** - Consistent logging with colors and levels
- **Help text** - Comprehensive help and usage information
- **Validation** - Input validation and sanity checks
- **Configuration** - Support for configuration files and environment variables

## Configuration

### Global Configuration
Scripts can be configured via:

1. **Environment variables**
   ```bash
   export DEV_PLATFORM_TARGET_DIR="./tools"
   export DEV_PLATFORM_BACKUP_DIR="./backups"
   ```

2. **Configuration file** (`.devplatform.yml`)
   ```yaml
   target_dir: "./tools"
   backup_dir: "./backups"
   patterns:
     - error-handling
     - testing
     - quality-gates
   ```

3. **Command line options**
   ```bash
   ./scripts/install-patterns.sh --target ./tools --backup ./backups
   ```

### Script-Specific Configuration
Each script may have additional configuration options documented in its help text:

```bash
./scripts/script-name.sh --help
```

## Usage Examples

### New Project Setup
```bash
# Complete new project setup
cd my-new-project
git clone https://github.com/swm-sink/dev-platform.git
./dev-platform/scripts/setup-project.sh --type nodejs
```

### Existing Project Integration
```bash
# Add quality gates to existing project
./dev-platform/scripts/install-patterns.sh quality-gates git-hooks
./dev-platform/scripts/setup-git-hooks.sh
```

### Pattern Development
```bash
# Create and test new pattern
./scripts/create-pattern.sh --name my-pattern --category testing
# ... develop pattern ...
./scripts/validate-patterns.sh my-pattern
./scripts/test-patterns.sh my-pattern
```

### Migration from Level-1-Dev
```bash
# Safe migration with rollback capability
./scripts/migrate-from-level1-dev.sh --analyze
./scripts/migrate-from-level1-dev.sh --migrate --backup
# ... test functionality ...
# If issues: ./scripts/migrate-from-level1-dev.sh --rollback
```

## Error Handling and Debugging

### Debug Mode
Enable debug mode for detailed output:

```bash
DEBUG=1 ./scripts/script-name.sh
```

### Dry Run Mode
Most scripts support dry-run mode:

```bash
./scripts/install-patterns.sh --dry-run error-handling
```

### Verbose Output
Enable verbose logging:

```bash
./scripts/script-name.sh --verbose
```

## Dependencies

### Required Tools
Scripts require these standard Unix tools:
- `bash` (3.2+)
- `grep`
- `sed`
- `awk`
- `find`
- `tar`
- `curl` (for updates)

### Optional Tools
Enhanced functionality with:
- `git` (for version control integration)
- `jq` (for JSON processing)
- `yamllint` (for YAML validation)
- `shellcheck` (for script analysis)

## Testing Scripts

### Unit Tests
Test individual script functions:

```bash
./tests/scripts/test-install-patterns.sh
./tests/scripts/test-validate-patterns.sh
```

### Integration Tests
Test script combinations:

```bash
./tests/integration/test-setup-workflow.sh
```

### Cross-Platform Tests
Test on multiple platforms:

```bash
./tests/matrix/test-all-platforms.sh
```

## Contributing

### Adding New Scripts
1. Follow standard script structure
2. Include comprehensive help text
3. Add error handling and validation
4. Create tests for all functionality
5. Update this README

### Script Review Checklist
- [ ] Follows standard structure
- [ ] Includes help text (`--help`)
- [ ] Has error handling
- [ ] Input validation implemented
- [ ] Tests created and passing
- [ ] Documentation updated
- [ ] Cross-platform compatible

---

**Scripts Version:** 1.0.0  
**Last Updated:** 2025-08-16  
**Total Scripts:** 8 core utilities  
**Bash Compatibility:** 3.2+ (macOS compatible)