# GitHub Repository Configuration Guide

## Overview

This document provides step-by-step instructions for configuring the `swm-sink/dev-platform` repository with security-first settings, branch protection, and community features.

**Technical:** Comprehensive repository configuration implementing defense-in-depth security, automated quality gates, and community-driven development workflows.

**Simple:** Like setting up a well-organized workspace with proper security, clear rules, and tools that help everyone work together effectively.

**Connection:** This teaches you how to configure professional open source repositories that balance security, collaboration, and community growth.

## 🚀 Initial Repository Setup

### 1. Repository Creation
**Location:** https://github.com/swm-sink/dev-platform

**Settings:**
```yaml
Repository Name: dev-platform
Description: "Claude Code native development patterns for project automation and quality gates"
Visibility: Public
Initialize with:
  - README: No (using custom README.md)
  - .gitignore: No (using custom .gitignore)
  - License: No (using custom LICENSE)
```

### 2. Repository Topics
Add these topics for discoverability:
```
claude-code, development-patterns, automation, quality-gates, 
bash-scripts, devops, security-first, ai-native, testing, 
git-hooks, claude-ai, developer-tools
```

### 3. Repository Description
```
🚀 Claude Code native development patterns that reduce complexity, improve security, and accelerate workflows. < 50 line patterns designed for AI comprehension with dual explanations for learning.
```

## 🔒 Security Configuration

### Core Security Settings

#### 1. Security & Analysis
**Location:** Settings → Security & analysis

```yaml
Dependency Graph: Enabled
Dependabot Alerts: Enabled
Dependabot Security Updates: Enabled
Dependabot Version Updates: Enabled (with configuration)
Code Scanning: Enabled
Secret Scanning: Enabled
Secret Scanning Push Protection: Enabled
```

#### 2. Private Vulnerability Reporting
**Location:** Settings → Security & analysis → Private vulnerability reporting

```yaml
Private Vulnerability Reporting: Enabled
```

**Configuration:**
- **Contact:** security@dev-platform.org
- **Policy:** Reference SECURITY.md
- **Response Time:** 24 hours acknowledgment

#### 3. Repository Security Advisories
**Location:** Settings → Security & analysis → Security advisories

```yaml
Security Advisories: Enabled
Coordinated Disclosure: Enabled
```

### Dependabot Configuration

#### 1. Create .github/dependabot.yml
```yaml
version: 2
updates:
  # GitHub Actions dependencies
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "09:00"
    open-pull-requests-limit: 5
    reviewers:
      - "swm-sink"
    assignees:
      - "swm-sink"
    commit-message:
      prefix: "chore"
      include: "scope"

  # NPM dependencies (if any JavaScript tooling)
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "09:00"
    open-pull-requests-limit: 5
    ignore:
      - dependency-name: "*"
        update-types: ["version-update:semver-major"]
    reviewers:
      - "swm-sink"
    assignees:
      - "swm-sink"
    commit-message:
      prefix: "chore"
      include: "scope"
```

## 🛡️ Branch Protection Rules

### Main Branch Protection
**Location:** Settings → Branches → Add rule

#### Rule Configuration
```yaml
Branch Name Pattern: main
Protect Matching Branches: ✓

Restrictions:
  Restrict pushes that create files larger than 100MB: ✓
  
Required Status Checks:
  Require status checks to pass before merging: ✓
  Require branches to be up to date before merging: ✓
  Status Checks Required:
    - security-scan
    - pattern-validation
    - dco-check
    - documentation-check
    - performance-test

Pull Request Requirements:
  Require a pull request before merging: ✓
  Require approvals: ✓
  Required number of reviews before merging: 1
  Dismiss stale reviews when new commits are pushed: ✓
  Require review from code owners: ✓
  Restrict reviews to users with read access: ✓
  Allow specified actors to bypass required pull requests: ✗
  Require approval of the most recent reviewable push: ✓

Additional Restrictions:
  Require signed commits: ✓
  Require linear history: ✓
  Include administrators: ✓
  Allow force pushes: ✗
  Allow deletions: ✗
```

### Development Branch Protection
**Location:** Settings → Branches → Add rule

#### Rule Configuration for dev/*
```yaml
Branch Name Pattern: dev/*
Protect Matching Branches: ✓

Required Status Checks:
  Require status checks to pass before merging: ✓
  Status Checks Required:
    - basic-validation
    - security-scan

Pull Request Requirements:
  Require a pull request before merging: ✓
  Required number of reviews before merging: 1
  Dismiss stale reviews when new commits are pushed: ✓

Additional Restrictions:
  Require signed commits: ✓
  Include administrators: ✗
  Allow force pushes: ✓ (for development)
  Allow deletions: ✓ (for development)
```

## 👥 Access Control & Permissions

### Repository Permissions

#### 1. Base Permissions
**Location:** Settings → Manage access

```yaml
Base Role: Read
```

#### 2. Team Structure

##### Core Team (Admin)
```yaml
Members: [To be defined]
Permissions: Admin
Responsibilities:
  - Repository settings management
  - Branch protection configuration
  - Security policy enforcement
  - Release management
```

##### Pattern Maintainers (Maintain)
```yaml
Members: [To be defined]
Permissions: Maintain
Responsibilities:
  - Pattern review and approval
  - Issue triage and management
  - Community support
  - Quality gate enforcement
```

##### Contributors (Write)
```yaml
Members: [Active contributors]
Permissions: Write
Responsibilities:
  - Pattern development
  - Documentation updates
  - Issue resolution
  - Code review participation
```

##### Community (Read)
```yaml
Members: Public
Permissions: Read
Responsibilities:
  - Pattern usage
  - Issue reporting
  - Discussion participation
  - Feature requests
```

### CODEOWNERS Configuration

#### Create .github/CODEOWNERS
```
# Global owners
* @swm-sink

# Pattern-specific ownership
/patterns/error-handling/ @swm-sink
/patterns/testing/ @swm-sink
/patterns/quality-gates/ @swm-sink
/patterns/security/ @swm-sink
/patterns/git-hooks/ @swm-sink

# Documentation ownership
/docs/ @swm-sink
*.md @swm-sink
/README.md @swm-sink
/CLAUDE.md @swm-sink

# Security-critical files
/SECURITY.md @swm-sink
/.github/workflows/ @swm-sink
/scripts/security/ @swm-sink

# Governance files
/GOVERNANCE.md @swm-sink
/AUTHORS.md @swm-sink
/DCO.md @swm-sink
/LICENSE @swm-sink

# Configuration files
/.github/ @swm-sink
/.gitignore @swm-sink
/.gitattributes @swm-sink
/.editorconfig @swm-sink
```

## 📋 Issue & Pull Request Configuration

### Issue Templates Setup
**Location:** Settings → Features → Issues

#### Configuration
```yaml
Issues: Enabled
Allow users to delete issues: ✗

Templates:
  - Bug Report
  - Feature Request
  - Pattern Request
  - Security Vulnerability
  - Documentation Issue
  - Question/Support
```

### Pull Request Settings
**Location:** Settings → General → Pull Requests

#### Configuration
```yaml
Allow merge commits: ✓
Allow squash merging: ✓ (Default)
Allow rebase merging: ✓

Default merge message:
  - Pull request title and description
  - Pull request title
  - Commit details

Automatically delete head branches: ✓
Allow auto-merge: ✓
Require contributors to sign off on web-based commits: ✓
```

### Pull Request Template

#### Create .github/pull_request_template.md
```markdown
## Description
Brief description of the changes in this PR.

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New pattern (adds new functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Security improvement

## Testing
- [ ] I have tested these changes locally
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] I have tested pattern combinations if applicable

## Security
- [ ] I have reviewed these changes for security implications
- [ ] No secrets or sensitive information are included
- [ ] Input validation is implemented where applicable
- [ ] Error handling doesn't expose sensitive information

## Documentation
- [ ] I have updated documentation as needed
- [ ] Code includes appropriate comments and dual explanations
- [ ] README.md updated if applicable
- [ ] CLAUDE.md updated if applicable

## DCO & Legal
- [ ] All commits are signed off with DCO
- [ ] Changes comply with project license
- [ ] No copyright issues with included code

## Quality Gates
- [ ] Code follows project style guidelines
- [ ] Patterns are under 50 lines for Claude comprehension
- [ ] All quality checks pass
- [ ] Performance impact considered

## Community
- [ ] Changes benefit the broader community
- [ ] Breaking changes are clearly documented
- [ ] Migration guide provided if needed
```

## 🚀 GitHub Features Configuration

### Discussions
**Location:** Settings → Features → Discussions

#### Configuration
```yaml
Discussions: Enabled

Categories:
  - General (Open discussion)
  - Ideas (Feature requests and improvements)
  - Q&A (Questions and help)
  - Show and Tell (Community showcases)
  - Announcements (Project announcements)
  - Pattern Requests (Requests for new patterns)
  - Claude Code Tips (AI assistance sharing)
```

### Wiki
**Location:** Settings → Features → Wiki

#### Configuration
```yaml
Wiki: Disabled
Reason: All documentation maintained in repository for version control
```

### Projects
**Location:** Settings → Features → Projects

#### Configuration
```yaml
Projects: Enabled
Reason: For roadmap and issue tracking
```

### Packages
**Location:** Settings → Features → Packages

#### Configuration
```yaml
Packages: Disabled
Reason: No packages distributed from this repository
```

### Environments
**Location:** Settings → Environments

#### Environment Configuration
```yaml
Environments:
  - production:
      Required reviewers: [Core Team]
      Wait timer: 0 minutes
      Deployment branches: main only
  - staging:
      Required reviewers: [Pattern Maintainers]
      Wait timer: 0 minutes
      Deployment branches: dev/* and main
```

## 🔗 Webhooks & Integrations

### Required Webhooks

#### 1. DCO Check
```yaml
URL: https://api.github.com/repos/swm-sink/dev-platform/hooks
Events:
  - pull_request
  - push
Configuration:
  - Validate DCO sign-off on all commits
  - Block PRs with missing DCO
  - Provide clear error messages
```

#### 2. Security Scanning
```yaml
URL: [To be configured with security service]
Events:
  - push
  - pull_request
Configuration:
  - Scan for secrets and vulnerabilities
  - Pattern security validation
  - Dependency vulnerability checks
```

#### 3. Pattern Validation
```yaml
URL: [To be configured with validation service]
Events:
  - pull_request
Configuration:
  - Validate pattern size (< 50 lines)
  - Check dual explanation format
  - Verify Claude readability
```

### GitHub Apps Integration

#### 1. Dependabot
```yaml
Status: Enabled
Configuration: Via .github/dependabot.yml
Permissions: 
  - Contents: Read
  - Metadata: Read
  - Pull requests: Write
```

#### 2. CodeQL
```yaml
Status: Enabled
Configuration: Via .github/workflows/codeql-analysis.yml
Permissions:
  - Actions: Read
  - Contents: Read
  - Security events: Write
```

## 📊 Repository Insights Configuration

### Community Profile
**Location:** Insights → Community

#### Required Files Status
```yaml
✓ Description
✓ README.md
✓ Code of conduct (in GOVERNANCE.md)
✓ Contributing guidelines (in GOVERNANCE.md)
✓ License
✓ Security policy (SECURITY.md)
✓ Issue templates
✓ Pull request template
```

### Traffic Analysis
**Location:** Settings → Analytics

#### Configuration
```yaml
Traffic Analytics: Enabled
Visitor Analytics: Enabled
Popular Content: Enabled
Referrer Tracking: Enabled
```

## 🏷️ Release Configuration

### Release Settings
**Location:** Releases

#### Configuration
```yaml
Release Creation: Manual
Release Notes: Auto-generated with custom template
Pre-release Testing: Required
Security Review: Required for all releases
```

### Release Template
```markdown
## What's Changed
<!-- Auto-generated changelog -->

## New Patterns
<!-- List new patterns added in this release -->

## Security Updates
<!-- List any security improvements -->

## Breaking Changes
<!-- List any breaking changes -->

## Migration Guide
<!-- Link to migration documentation if needed -->

## Performance Improvements
<!-- List performance enhancements -->

## Community Contributions
<!-- Highlight community contributions -->

## Full Changelog
**Full Changelog**: https://github.com/swm-sink/dev-platform/compare/v{previous}...v{current}
```

## 🎯 Repository Verification Checklist

### Security Verification
- [ ] Branch protection rules active
- [ ] Secret scanning enabled
- [ ] Dependabot configured
- [ ] Private vulnerability reporting active
- [ ] Security policy accessible
- [ ] DCO enforcement active

### Community Verification
- [ ] Issue templates functional
- [ ] PR template accessible
- [ ] CODEOWNERS file effective
- [ ] Discussions enabled
- [ ] Community guidelines clear
- [ ] Contribution process documented

### Quality Verification
- [ ] Status checks required
- [ ] Code review mandatory
- [ ] Signed commits enforced
- [ ] Linear history maintained
- [ ] Auto-deletion of merged branches
- [ ] Quality gates functional

### Access Verification
- [ ] Base permissions appropriate
- [ ] Team permissions correct
- [ ] Administrative settings secure
- [ ] Integration permissions minimal
- [ ] Webhook security validated

## 🔄 Ongoing Maintenance

### Monthly Tasks
- [ ] Review access permissions
- [ ] Update security settings
- [ ] Validate webhook functionality
- [ ] Check branch protection rules
- [ ] Review integration status

### Quarterly Tasks
- [ ] Security configuration audit
- [ ] Permission structure review
- [ ] Integration security assessment
- [ ] Community feature evaluation
- [ ] Performance setting optimization

### Annual Tasks
- [ ] Complete security review
- [ ] Access control restructuring
- [ ] Integration modernization
- [ ] Community feature expansion
- [ ] Repository setting optimization

---

**Configuration Version:** 1.0  
**Last Updated:** 2025-08-16  
**Next Review:** 2025-09-16  
**Maintained By:** Core Team  
**Security Level:** Maximum