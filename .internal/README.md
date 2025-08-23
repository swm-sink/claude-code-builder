# .internal Directory - Working Documents

> ⚠️ **Internal Use Only**: Files in this directory are working documents, reports, and checklists not intended for direct user consumption.

## Directory Structure

### 📊 reports/
Analysis reports, test results, and performance metrics generated during development:
- `COMPREHENSIVE_TEST_REPORT.md` - Full test suite results
- `NATIVE_COMPLETION_REPORT.md` - Native command conversion status
- `SCRIPT_DEPENDENCY_MAP.md` - Script dependency analysis

### ✅ checklists/
Validation and verification checklists for development processes:
- `PRE_PUSH_CHECKLIST.md` - 50-step validation before pushing to GitHub
- `CONVERSION_VALIDATION_CHECKLIST.md` - Validation for pattern conversions
- `CONVERSION_PRIORITY_ORDER.md` - Priority ordering for conversions

### 📝 drafts/
Work-in-progress documents and version drafts:
- `CLAUDE_v2.md` - Draft version of CLAUDE.md updates
- `QUICK_START_NATIVE.md` - Draft native command quick start guide

## Usage Guidelines

1. **Do not reference these files** in user-facing documentation
2. **Do not link to these files** from README or main docs
3. **Use for internal development** tracking and validation only
4. **Files may change or be removed** without notice

## Why This Structure?

- **Clean root directory**: Keeps the main project root professional and navigable
- **Clear separation**: Distinguishes internal work from user-facing content
- **Easy maintenance**: Allows working documents without cluttering the project
- **Professional appearance**: Presents a clean, organized repository to users

## For Contributors

When creating new internal documents:
1. Place reports in `reports/`
2. Place checklists in `checklists/`
3. Place drafts in `drafts/`
4. Never place internal docs in the root directory

Run `./scripts/enforce-directory-structure.sh` to validate structure.