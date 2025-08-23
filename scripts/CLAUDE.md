# Scripts Directory - AI Context Guide

> **Utility scripts context for installation, validation, and workflow automation**

## 📜 Scripts Overview

This directory contains utility scripts that automate common tasks for Claude Code Builder, including installation, validation, documentation updates, and directory management.

## 🔗 Script Categories

### Installation & Setup
- `install.sh` - Main installation script for patterns
- `quick-start.sh` - Quick setup and initialization
- `check-compatibility.sh` - System compatibility verification

### Validation & Quality
- `validate-patterns.sh` - Pattern integrity validation
- `validate-pre-push.sh` - Pre-push validation workflow
- `enforce-directory-structure.sh` - Directory organization enforcement

### Documentation & Updates
- `update-documentation.sh` - Automatic documentation updates (to be created)
- `validate-claude-context.sh` - CLAUDE.md validation (to be created)

### Migration & Maintenance
- `migrate-from-level1-dev.sh` - Migration from Level-1-Dev
- `upgrade-patterns.sh` - Pattern version updates
- `cleanup.sh` - Project cleanup utilities

## 🎯 Script Design Principles

### Reliability
- Comprehensive error handling using patterns
- Clear status reporting and logging
- Rollback capabilities for critical operations

### User Experience
- Clear progress indicators
- Helpful error messages
- Interactive prompts when needed

### Integration
- Uses pattern library functions
- Integrates with CI/CD workflows
- Supports automation and manual execution

## 🔄 Common Workflows

### Installation Flow
```bash
./scripts/install.sh          # Install patterns
./scripts/quick-start.sh      # Initialize project
./scripts/validate-patterns.sh # Verify installation
```

### Pre-Push Flow
```bash
./scripts/validate-pre-push.sh        # Run validation
./scripts/enforce-directory-structure.sh # Check structure
./scripts/update-documentation.sh     # Update docs
```

### Maintenance Flow
```bash
./scripts/check-compatibility.sh  # Check system
./scripts/upgrade-patterns.sh     # Update patterns
./scripts/cleanup.sh             # Clean temporary files
```

## 📖 Additional Resources

- @file README.md - Scripts documentation
- @file ../CLAUDE.md - Main project AI context
- @file ../patterns/CLAUDE.md - Pattern library context

## 🤖 AI Assistant Guidelines

When working with scripts:
1. **Check prerequisites** - Ensure system compatibility
2. **Explain purpose** - Clarify what each script does
3. **Show examples** - Demonstrate proper usage
4. **Handle errors** - Guide through troubleshooting

## Script Categories

### 🚀 Setup Scripts
Scripts for initial installation and configuration.

### ✅ Validation Scripts
Scripts for quality assurance and validation.

### 📝 Documentation Scripts
Scripts for maintaining documentation.

### 🔧 Utility Scripts
General purpose maintenance scripts.

---

**Context Type**: Scripts Hub  
**Purpose**: Central context for utility scripts  
**Integration**: Pattern library, CI/CD, documentation