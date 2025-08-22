---
allowed-tools: Read, Write, Bash(git:*), Bash(chmod:*), Bash(find:*), Bash(grep:*), Bash(sed:*), Bash(mkdir:*), Bash(rm:*), Bash(cp:*), Bash(test:*)
argument-hint: [hook-type] or [operation] or [config]
description: Comprehensive git hooks management with automation, validation, and team configuration
category: patterns
---

# Git Hooks Manager

Intelligent git hooks management with comprehensive automation and validation: **$ARGUMENTS**

## Git Hooks Management System

I'll provide comprehensive git hooks management capabilities with intelligent hook generation, team configuration sharing, customizable validation workflows, and seamless integration with development and CI/CD processes.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining git hooks operation and scope]
Mode: [install/remove/validate/configure/list/test]
Hook Type: [pre-commit/pre-push/post-commit/pre-receive/post-receive]
Configuration: [standard/custom/team/project-specific]
```

### Git Hooks Analysis Process

#### Intelligent Repository Detection
```markdown
**🔍 Repository Analysis**

Analyzing git repository and configuring comprehensive hook management...
- Detecting git repository structure and branching strategy
- Identifying project type, languages, and development workflow
- Analyzing existing hooks, configuration, and team requirements
- Preparing intelligent hook installation and validation automation
```

#### Git Hook Types and Configurations

##### Pre-Commit Hooks
```markdown
**🔍 Pre-Commit Validation**

Detection: Client-side hook triggered before commit creation
Purpose: Code quality validation, formatting, and conflict detection
Integration: Testing, linting, security scanning, and documentation

Pre-Commit Workflow:
```
Pre-Commit Triggered
├── Conflict Detection     # Merge conflict markers
├── Code Quality          # Linting, formatting, standards
├── Security Scanning     # Secret detection, vulnerability scan
├── Testing              # Unit tests, quick validation
├── Documentation        # Documentation updates, consistency
└── Size Validation      # File size limits, binary detection
```

Hook Configuration:
- **Conflict Detection**: Merge conflict markers, unresolved conflicts
- **Code Quality**: ESLint, Prettier, Black, gofmt, rustfmt integration
- **Security Checks**: Secret scanning, dependency vulnerability checks
- **Test Execution**: Fast unit tests, smoke tests, critical path validation
- **Documentation**: README updates, API doc consistency, changelog maintenance

Usage: /setup-git-hooks "pre-commit" "standard"
```

##### Pre-Push Hooks
```markdown
**🚀 Pre-Push Validation**

Detection: Client-side hook triggered before push to remote
Purpose: Comprehensive validation, build verification, and deployment checks
Integration: Full test suite, security validation, quality gates

Pre-Push Workflow:
```
Pre-Push Triggered
├── Branch Protection     # Main/master branch warnings
├── Full Test Suite      # Comprehensive test execution
├── Build Verification   # Build success, compilation checks
├── Security Validation  # Complete security scan
├── Quality Gates        # Code quality, coverage thresholds
└── Deployment Checks    # Configuration, environment validation
```

Hook Configuration:
- **Branch Protection**: Prevent direct pushes to protected branches
- **Test Execution**: Full test suite, integration tests, end-to-end tests
- **Build Validation**: Compilation success, bundle generation, optimization
- **Security Assessment**: Complete security scan, dependency audit
- **Quality Metrics**: Code coverage, complexity analysis, documentation coverage

Usage: /setup-git-hooks "pre-push" "comprehensive"
```

##### Post-Commit Hooks
```markdown
**📝 Post-Commit Automation**

Detection: Client-side hook triggered after successful commit
Purpose: Automation, notification, and workflow integration
Integration: Documentation generation, metrics collection, notification systems

Post-Commit Workflow:
```
Post-Commit Triggered
├── Documentation Update  # Auto-generated docs, changelog
├── Metrics Collection   # Code metrics, commit analysis
├── Notification System  # Team notifications, integration updates
├── Automation Trigger  # CI/CD pipeline triggers, webhooks
└── Backup Operations    # Automated backups, synchronization
```

Hook Configuration:
- **Documentation**: Automatic README updates, API documentation generation
- **Metrics**: Code complexity metrics, commit frequency analysis
- **Notifications**: Slack, email, or webhook notifications for team updates
- **Integration**: Trigger CI/CD pipelines, update project management tools

Usage: /setup-git-hooks "post-commit" "automation"
```

##### Server-Side Hooks (Pre-Receive/Post-Receive)
```markdown
**🌐 Server-Side Validation**

Detection: Server-side hooks triggered on git server/repository host
Purpose: Centralized validation, policy enforcement, and integration
Integration: Team policies, compliance checking, automated workflows

Server-Side Workflow:
```
Server-Side Triggered
├── Policy Enforcement   # Team standards, compliance requirements
├── Centralized Testing  # Server-side test execution
├── Security Validation  # Enterprise security policies
├── Integration Updates  # Issue tracking, project management
└── Deployment Trigger   # Automated deployment, environment updates
```

Hook Configuration:
- **Policy Enforcement**: Commit message standards, branch naming conventions
- **Centralized Validation**: Server-side testing, security compliance
- **Integration**: JIRA, GitHub Issues, project management tool updates
- **Deployment**: Automatic deployment triggers, environment management

Usage: /setup-git-hooks "server-side" "enterprise"
```

### Git Hooks Operations

#### Hook Installation and Configuration
```bash
# Install standard git hooks suite
/setup-git-hooks "install" "standard"

# Install specific hook type
/setup-git-hooks "install" "pre-commit"
/setup-git-hooks "install" "pre-push"

# Install with custom configuration
/setup-git-hooks "install" "pre-commit" "custom"

# Install team-wide configuration
/setup-git-hooks "install" "team-config"
```

**Installation Process**:
1. **Repository Validation**: Verify git repository and permissions
2. **Configuration Analysis**: Detect project type and requirements
3. **Hook Generation**: Create appropriate hooks for project context
4. **Permission Setup**: Set executable permissions and validate installation
5. **Integration**: Connect with existing development tools and workflows

#### Hook Validation and Testing
```bash
# Validate existing hooks
/setup-git-hooks "validate"

# Test specific hook
/setup-git-hooks "test" "pre-commit"

# Comprehensive hook testing
/setup-git-hooks "test" "all"
```

#### Hook Configuration Management
```bash
# List installed hooks
/setup-git-hooks "list"

# Show hook configuration
/setup-git-hooks "config" "pre-commit"

# Update hook configuration
/setup-git-hooks "update" "pre-push" "enhanced"
```

#### Hook Removal and Cleanup
```bash
# Remove specific hook
/setup-git-hooks "remove" "pre-commit"

# Remove all hooks
/setup-git-hooks "remove" "all"

# Clean up hook configuration
/setup-git-hooks "cleanup"
```

### Advanced Git Hooks Features

#### Team Configuration Sharing
```bash
# Export team hook configuration
/setup-git-hooks "export" "team-config.json"

# Import team hook configuration
/setup-git-hooks "import" "team-config.json"

# Synchronize team hooks
/setup-git-hooks "sync" "team"
```

#### Custom Hook Templates
```bash
# Create custom hook template
/setup-git-hooks "template" "create" "custom-pre-commit"

# Use custom template
/setup-git-hooks "install" "pre-commit" "custom-template"

# Share hook templates
/setup-git-hooks "template" "share" "team-templates"
```

#### Hook Performance Optimization
```bash
# Optimize hook performance
/setup-git-hooks "optimize" "pre-commit"

# Analyze hook execution time
/setup-git-hooks "analyze" "performance"

# Configure parallel execution
/setup-git-hooks "parallel" "enable"
```

### Integration with Error Handling

#### Comprehensive Git Hooks Status Reporting
```bash
# All git hooks operations use error handling pattern
/error-handler "info" "Installing git hooks for $project_type project"

# Hook installation progress
/error-handler "info" "Installing pre-commit hook with $validation_count validations"
/error-handler "info" "Configuring pre-push hook with $test_suite integration"

# Hook validation results
/error-handler "info" "Git hooks validation completed successfully"

# Hook execution reporting
/error-handler "warn" "Pre-commit hook found $issue_count issues"
/error-handler "error" "Pre-push validation failed: $failure_reason"
/error-handler "handle-error" "$LINENO" "Git hooks installation failed"
```

#### Detailed Hook Operation Reporting
```bash
# Hook configuration feedback
/error-handler "info" "Installed $hook_count git hooks"
/error-handler "info" "Hook configuration: $config_type"
/error-handler "warn" "Consider enabling additional validations"

# Hook execution feedback
/error-handler "info" "Pre-commit validation passed in $execution_time"
/error-handler "info" "Pre-push testing completed: $test_results"
/error-handler "error" "Hook execution failed: $error_details"
```

### Git Hooks Implementation

#### Intelligent Hook Generation
```markdown
**Smart Hook Creation**:

**Project Analysis**:
- Language detection and framework identification
- Development workflow analysis and tool integration
- Team configuration and policy requirements
- Existing hook analysis and configuration preservation

**Hook Customization**:
- Template-based hook generation with intelligent substitution
- Project-specific validation rules and integration points
- Performance optimization and parallel execution capabilities
- Team-wide configuration sharing and synchronization
```

#### Multi-Language Project Integration
```markdown
**Language-Specific Hook Integration**:

**JavaScript/Node.js**:
- ESLint, Prettier integration for code quality
- Jest, Mocha test execution for validation
- npm audit for security vulnerability scanning
- Package.json validation and dependency checking

**Python**:
- Black, isort formatting integration
- pytest, unittest execution for validation
- bandit security scanning integration
- requirements.txt validation and dependency analysis

**Go**:
- gofmt, golint integration for code formatting
- go test execution for validation
- gosec security scanning integration
- go.mod validation and module dependency checking

**Rust**:
- rustfmt, clippy integration for code quality
- cargo test execution for validation
- cargo audit security scanning integration
- Cargo.toml validation and dependency management
```

### Output Formatting

#### Standard Git Hooks Results
```
🔧 Git Hooks: Installation Complete
🏗️ Project Type: Node.js Application
⚡ Status: 4 hooks installed

💾 Hook Installation Summary:
  Pre-Commit: ✅ Code quality, security, conflict detection
  Pre-Push: ✅ Full testing, build validation, security scan
  Post-Commit: ✅ Documentation, metrics, notifications
  Post-Receive: ✅ Integration updates, deployment triggers
  
📊 Hook Configuration:
  ├── Validation Rules: 12 active checks
  ├── Integration Points: 6 tools connected
  ├── Performance Mode: Parallel execution enabled
  └── Team Sync: Configured for team-config.json

⏱️  Installation Time: 2.1s
🎯 Hook Coverage: 95/100
```

#### Hook Validation Results
```
✅ Git Hooks Validation: Repository Hooks

📋 Validation Results:
  ✅ Pre-Commit: All validations active and functional
  ✅ Pre-Push: Test integration working correctly
  ✅ Post-Commit: Automation triggers configured properly
  ✅ Permissions: All hooks executable and accessible
  
🔍 Hook Performance Analysis:
  • Pre-Commit Execution: 1.2s average
  • Pre-Push Execution: 15.3s average (full test suite)
  • Integration Response: 0.8s average
  • Overall Efficiency: 92/100
  
📝 Recommendations:
  • Consider parallel test execution for faster pre-push
  • Add code coverage threshold validation
  • Enable automatic documentation updates
  
📊 Hook Quality Score: 89/100
```

#### Team Configuration Sync Results
```
🔄 Team Configuration Sync: Git Hooks

🌐 Synchronization Results:
  📄 Team Config: team-config.json loaded successfully
  🔧 Hooks Updated: 4 hooks synchronized with team standards
  ✅ Validation: All team policies applied correctly
  🎯 Compliance: 100% team standard adherence
  
📊 Team Hook Configuration:
  ├── Code Quality: ESLint + Prettier (JavaScript)
  ├── Security: Secret scanning + dependency audit
  ├── Testing: Jest unit tests + integration tests
  └── Documentation: Auto-update README + changelog

🏆 Team Standards Compliance:
  • Commit Message Format: ✅ Conventional Commits
  • Branch Naming: ✅ feature/, bugfix/, hotfix/ prefixes
  • Code Quality: ✅ 90%+ test coverage required
  • Security: ✅ No secrets, all dependencies scanned
```

### Performance Optimization

#### Fast Hook Execution
- **Parallel Processing**: Run multiple validations simultaneously
- **Incremental Validation**: Check only changed files when possible
- **Caching**: Cache validation results for unchanged code
- **Smart Detection**: Skip unnecessary checks based on file changes

#### Efficient Resource Usage
- **Memory Management**: Optimize hook memory usage and cleanup
- **Process Management**: Efficient subprocess handling and cleanup
- **File Access**: Minimize file system operations and I/O
- **Network Optimization**: Efficient remote repository interaction

### Git Hooks Security

#### Safe Hook Execution
- **Input Validation**: Validate all git-provided inputs and parameters
- **Path Security**: Prevent path traversal and unauthorized file access
- **Command Injection**: Safe command construction and execution
- **Permission Management**: Proper file permissions and access control

#### Hook Security Features
- **Secret Scanning**: Detect and prevent secret commits
- **Dependency Validation**: Scan dependencies for known vulnerabilities
- **Code Analysis**: Static analysis for security issues
- **Access Control**: Team-based hook configuration and permissions

### Integration Patterns

#### With Error Handling Pattern
```bash
# Git hooks workflow with comprehensive error handling
/error-handler "info" "Setting up git hooks for development workflow"
/setup-git-hooks "install" "standard"
/error-handler "info" "Git hooks installation completed successfully"
```

#### With Testing Pattern
```bash
# Git hooks with testing integration
/setup-git-hooks "install" "pre-commit" "testing"
/test-runner "quick"                    # Pre-commit testing
/setup-git-hooks "install" "pre-push" "comprehensive"
/test-runner "all"                      # Pre-push full testing
```

#### With Quality Gates
```bash
# Git hooks with quality validation
/setup-git-hooks "install" "pre-commit" "quality"
/quality-check "pre-commit"             # Pre-commit quality checks
```

#### With Security Scanner
```bash
# Security-aware git hooks
/setup-git-hooks "install" "pre-commit" "security"
/security-scanner "pre-commit"          # Pre-commit security scan
```

### Git Hooks Options

#### Hook Configuration
```bash
GIT_HOOKS_CONFIG_PATH=".githooks"       # Custom hooks configuration directory
GIT_HOOKS_TEMPLATE_PATH="./templates"   # Hook template directory
GIT_HOOKS_PARALLEL_EXECUTION=true       # Enable parallel hook execution
GIT_HOOKS_PERFORMANCE_MODE=true         # Enable performance optimizations
GIT_HOOKS_TEAM_SYNC=true                # Enable team configuration sync
```

#### Project Configuration
```bash
# .githooksrc configuration file support
HOOK_TYPES="pre-commit,pre-push,post-commit"
VALIDATION_LEVELS="code-quality,security,testing"
TEAM_CONFIG_URL="https://team.example.com/githooks-config.json"
PERFORMANCE_OPTIMIZATION=true
```

## Success Indicators

- ✅ **Comprehensive Hook Support**: Pre-commit, pre-push, post-commit, and server-side hooks
- ✅ **Multi-Language Integration**: JavaScript, Python, Go, Rust with framework-specific validations
- ✅ **Team Configuration**: Shareable team configurations and standardized workflows
- ✅ **Performance Optimization**: Parallel execution, caching, and intelligent validation
- ✅ **Security Integration**: Secret scanning, dependency validation, and security policy enforcement
- ✅ **Quality Assurance**: Code quality, testing, and documentation validation integration

The git hooks manager provides intelligent, comprehensive git automation that integrates development workflows with quality assurance and team collaboration while maintaining elegant simplicity and reliable execution.