# Directory Structure Migration Guide

## 📋 Overview

On August 22, 2024, claude-code-builder underwent a significant directory reorganization to improve clarity, maintainability, and professional appearance.

## 🔄 What Changed

### Files Moved from Root Directory

#### Test Files → `tests/native-commands/`
All `test-*.sh` files have been moved:
- `test-architectural-dashboard.sh`
- `test-chain-orchestration.sh`
- `test-claude-readability-scorer.sh`
- `test-config-manager.sh`
- `test-dependency-manager.sh`
- `test-error-handler.sh`
- `test-function-complexity-analyzer.sh`
- `test-generate-docs.sh`
- `test-log-manager.sh`
- `test-native-patterns.sh`
- `test-performance-benchmarks.sh`
- `test-quality-check.sh`
- `test-security-scanner.sh`
- `test-setup-git-hooks.sh`
- `test-test-runner.sh`
- `test-validate-project.sh`

#### Reports → `.internal/reports/`
- `COMPREHENSIVE_TEST_REPORT.md`
- `NATIVE_COMPLETION_REPORT.md`
- `SCRIPT_DEPENDENCY_MAP.md`

#### Checklists → `.system/checklists/`
- `PRE_PUSH_CHECKLIST.md`
- `CONVERSION_VALIDATION_CHECKLIST.md`
- `CONVERSION_PRIORITY_ORDER.md`

#### Working Documents → `.internal/drafts/`
- `CLAUDE_v2.md`
- `QUICK_START_NATIVE.md`

## 🔧 How to Update Your Code

### If you reference test files:
```bash
# Old:
./test-error-handler.sh

# New:
./tests/native-commands/test-error-handler.sh
```

### If you reference checklists:
```bash
# Old:
cat PRE_PUSH_CHECKLIST.md

# New:
cat .system/checklists/PRE_PUSH_CHECKLIST.md
```

### If you reference reports:
```bash
# Old:
view COMPREHENSIVE_TEST_REPORT.md

# New:
view .internal/reports/COMPREHENSIVE_TEST_REPORT.md
```

## 🚀 CI/CD Updates

The GitHub Actions workflow has been updated to handle the new structure. No action needed for automated workflows.

## ✅ Benefits

1. **Cleaner root directory**: Only 6 essential files remain in root
2. **Better organization**: Clear separation of concerns
3. **Professional appearance**: Industry-standard structure
4. **AI-friendly**: Optimized for Claude Code comprehension
5. **Enforced standards**: Automatic structure validation

## 🛡️ Enforcement

A new enforcement script ensures the structure is maintained:
```bash
./scripts/enforce-directory-structure.sh
```

This script:
- Validates root directory file count (max 12)
- Moves misplaced files automatically
- Ensures compliance with CLAUDE.md requirements

## 📝 New Rules

Per CLAUDE.md, the following rules are now enforced:

1. **Maximum 12 files in root directory**
2. **No test files in root** - Use `tests/` subdirectories
3. **No reports in root** - Use `.internal/reports/`
4. **No working docs in root** - Use `.internal/drafts/`
5. **No temporary files in root** - Use `.internal/` or delete

## 🆘 Troubleshooting

### "File not found" errors
Check if the file was moved to a new location using:
```bash
find . -name "filename.sh" -type f
```

### Test execution issues
Tests should be run from the project root:
```bash
# From project root:
bash tests/native-commands/test-error-handler.sh
```

### CI/CD failures
Ensure you're using the latest version of the repository with updated workflows.

## 📚 Documentation

- Main structure documentation: See README.md § Project Structure
- Internal files explanation: See `.internal/README.md`
- Test organization: See `tests/native-commands/README.md`
- Contributing guidelines: See CONTRIBUTING.md § File Organization

## ❓ Questions?

If you encounter issues with the new structure:
1. Run `./scripts/enforce-directory-structure.sh` to auto-fix
2. Check this migration guide
3. Open an issue on GitHub

---

This reorganization improves the long-term maintainability and professional appearance of claude-code-builder while maintaining all functionality.