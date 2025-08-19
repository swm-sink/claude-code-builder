# Version Strategy

> **Semantic versioning strategy for Claude Code Builder releases**

## Current Version

**Current Release:** v1.0.0  
**Release Date:** January 19, 2025  
**Status:** Production Ready ✅

## Semantic Versioning

Claude Code Builder follows [Semantic Versioning 2.0.0](https://semver.org/):

```
MAJOR.MINOR.PATCH
```

### Version Components

- **MAJOR** - Incompatible API changes or breaking changes
- **MINOR** - New functionality added in backward-compatible manner
- **PATCH** - Backward-compatible bug fixes

## Tagging Strategy

### Release Tags

- **Production Releases** - `v1.0.0`, `v1.1.0`, `v2.0.0`
- **Pre-release** - `v1.1.0-alpha.1`, `v1.1.0-beta.1`, `v1.1.0-rc.1`
- **Development** - Use branch names, not tags

### Tag Format

```bash
# Production release
git tag -a v1.0.0 -m "Claude Code Builder v1.0.0 - Production Ready"

# Pre-release
git tag -a v1.1.0-alpha.1 -m "Claude Code Builder v1.1.0 Alpha 1"

# Push tags
git push origin v1.0.0
git push origin --tags
```

## Version Lifecycle

### v1.0.0 (Current)
- **Status** - Production Ready
- **Features** - 10 core patterns, comprehensive documentation
- **Support** - Long-term support (LTS)
- **End of Life** - v3.0.0 release

### v1.x.x (Planned)
- **v1.1.0** - Additional patterns (Database, API, Monitoring)
- **v1.2.0** - Package manager support (npm, Homebrew)
- **v1.3.0** - GUI tools and visual composition
- **v1.4.0** - Cloud integration patterns

### v2.x.x (Future)
- **v2.0.0** - Major architecture updates (breaking changes possible)
- Advanced pattern composition
- Enterprise features
- Performance optimizations

## Breaking Changes Policy

### What Constitutes Breaking Changes

- **Pattern API Changes** - Function signature modifications
- **File Structure Changes** - Major reorganization
- **Dependency Changes** - New required dependencies
- **Platform Drops** - Removing platform support

### Breaking Change Process

1. **6-Month Notice** - Deprecation warnings in documentation
2. **Migration Guide** - Comprehensive migration documentation
3. **Community Input** - RFC process for major changes
4. **Backward Compatibility** - Where possible, maintain compatibility

## Release Process

### Version Planning

```bash
# Create version planning issue
# Plan features for next version
# Review breaking changes
# Set release timeline
```

### Pre-Release Testing

```bash
# Alpha Release (Internal testing)
git tag v1.1.0-alpha.1
# Community testing period
# Bug fixes and refinements

# Beta Release (Community testing) 
git tag v1.1.0-beta.1
# Wider community testing
# Final bug fixes

# Release Candidate (Final validation)
git tag v1.1.0-rc.1
# Production-level testing
# Documentation finalization
```

### Production Release

```bash
# Final quality validation
./scripts/validate-pre-push.sh --all

# Create release tag
git tag -a v1.1.0 -m "Claude Code Builder v1.1.0 - [Feature Summary]"

# Push release
git push origin v1.1.0

# Create GitHub release
gh release create v1.1.0 --title "v1.1.0" --notes-file RELEASE_NOTES.md
```

## Compatibility Matrix

### Supported Versions

| Version | Status | Support Level | End of Life |
|---------|--------|---------------|-------------|
| v1.0.0 | Current | Full Support | v3.0.0 |
| v1.x.x | Future | Full Support | v3.0.0 |
| v2.x.x | Planned | Full Support | TBD |

### Platform Compatibility

| Platform | v1.0.0 | v1.x.x | v2.x.x |
|----------|--------|--------|--------|
| macOS | ✅ | ✅ | ✅ |
| Linux | ✅ | ✅ | ✅ |
| Windows (WSL) | ✅ | ✅ | ✅ |
| Docker | ✅ | ✅ | ✅ |

## Branch Strategy

### Main Branches

- **main** - Production-ready code, tagged releases
- **develop** - Integration branch for new features
- **feature/**** - Feature development branches
- **release/**** - Release preparation branches
- **hotfix/**** - Critical bug fixes

### Release Branches

```bash
# Create release branch
git checkout -b release/v1.1.0 develop

# Finalize release
# Update version numbers
# Update documentation
# Run final tests

# Merge to main and tag
git checkout main
git merge --no-ff release/v1.1.0
git tag -a v1.1.0 -m "Release v1.1.0"
```

## Version Documentation

### Version Updates Required

When releasing new versions, update:

- **README.md** - Version badges and references
- **CHANGELOG.md** - Release notes and changes
- **package.json** - Version number (if applicable)
- **docs/** - Version-specific documentation
- **examples/** - Update examples for new features

### Documentation Versioning

- **Current Version** - Main documentation in docs/
- **Previous Versions** - Archived in docs/versions/
- **API Changes** - Documented in CHANGELOG.md
- **Migration Guides** - For breaking changes

## Support Policy

### Long-Term Support (LTS)

- **LTS Versions** - v1.0.0, every major version
- **Support Duration** - Until next major version + 1 year
- **Security Updates** - Critical security fixes
- **Bug Fixes** - Critical bug fixes only

### Community Support

- **GitHub Issues** - Bug reports and feature requests
- **Discussions** - Community questions and discussions
- **Security** - Security vulnerabilities via security advisories

## Deprecation Policy

### Deprecation Process

1. **Announcement** - 6 months before removal
2. **Documentation** - Clear deprecation warnings
3. **Migration Path** - Alternative solutions provided
4. **Removal** - Only in major version updates

### Deprecation Warnings

```bash
# Example deprecation warning
log_warn "Function 'old_function' is deprecated since v1.2.0"
log_warn "Use 'new_function' instead. See migration guide: docs/MIGRATION_v1.2.md"
log_warn "This function will be removed in v2.0.0"
```

## Emergency Releases

### Hotfix Process

```bash
# Critical security or bug fix
git checkout -b hotfix/v1.0.1 main

# Apply minimal fix
# Test thoroughly  
# Update patch version

# Merge and release immediately
git checkout main
git merge --no-ff hotfix/v1.0.1
git tag -a v1.0.1 -m "Hotfix v1.0.1 - Critical security fix"
git push origin v1.0.1
```

### Emergency Release Criteria

- **Security Vulnerabilities** - Critical or high severity
- **Data Loss Bugs** - Bugs causing data corruption
- **System Failures** - Complete system breakdown
- **Compliance Issues** - Legal or compliance violations

---

**This version strategy ensures stable, predictable releases while maintaining backward compatibility and community trust.**