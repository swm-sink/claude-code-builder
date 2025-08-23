# Contributing to Claude Code Builder

We love your input! We want to make contributing to Claude Code Builder as easy and transparent as possible.

## Quick Start for Contributors

1. **Fork and clone** the repository
2. **Run the quick start**: `./scripts/quick-start.sh --mode=test`
3. **Test your changes**: `./tests/simple-pattern-test.sh`
4. **Check architecture**: `./tools/architectural-dashboard.sh`

## Development Principles

### 🎯 Pattern Design Rules
- **<50 lines per file** - for instant Claude comprehension  
- **Single responsibility** - one pattern, one purpose
- **Dual explanations** - Technical + Simple + Connection format
- **Modular composition** - patterns work together seamlessly

### 🧪 Testing Requirements
- All patterns must pass `./tests/simple-pattern-test.sh`
- New patterns need corresponding test cases
- Architecture compliance: `./tools/architectural-dashboard.sh`

### 📝 Documentation Standards
- Follow the **Technical/Simple/Connection** pattern in all files
- Include usage examples in pattern README files
- Update main README.md if adding new categories

## How to Contribute

### 🐛 Bug Reports
Use our [issue template](https://github.com/swm-sink/claude-code-builder/issues/new?template=bug_report.yml)

### ✨ Feature Requests  
Use our [feature template](https://github.com/swm-sink/claude-code-builder/issues/new?template=feature_request.yml)

### 🔧 Code Contributions

1. **Create a branch**: `git checkout -b feature/your-feature-name`
2. **Make changes** following our architectural principles
3. **Test thoroughly**: Run all validation tools
4. **Commit with style**: Use our commit message format
5. **Open a PR**: We'll review quickly!

#### Commit Message Format
```
Brief description of change

SPECIFIC IMPROVEMENTS:
- ✅ What was improved and how
- ✅ Impact on functionality  
- ✅ Architecture compliance notes

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## File Organization Guidelines

### Where to Place Files
- **Patterns**: `patterns/{category}/simple-{name}.sh` (must be <50 lines)
- **Tests**: `tests/` for integration tests, `tests/native-commands/` for command tests
- **Tools**: `tools/` for analysis and utility scripts
- **Documentation**: `docs/` for user-facing docs
- **Reports/Analysis**: `.internal/reports/` (not for direct use)
- **Checklists**: `.internal/checklists/` (internal validation)
- **Working Drafts**: `.internal/drafts/` (work in progress)

### Root Directory Rules
- Maximum 12 files in root directory
- No test files in root (use `tests/`)
- No temporary files or reports in root
- Run `./scripts/enforce-directory-structure.sh` before committing

## Code Review Process

1. **Automated checks** run on every PR
2. **Architecture validation** ensures <50 line compliance
3. **Directory structure** validation
4. **Manual review** by maintainers
5. **Merge** after approval

## Questions?

- 💬 [GitHub Discussions](https://github.com/swm-sink/claude-code-builder/discussions)
- 📧 Email: support@claude-code-builder.org
- 📖 [Documentation](./docs/)

---

By contributing, you agree to abide by our [Code of Conduct](./docs/governance/GOVERNANCE.md).