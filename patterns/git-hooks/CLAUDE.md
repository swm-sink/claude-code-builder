# Git Hooks Pattern - AI Instructions

> **AI guidance for working with the git hooks pattern in Claude Code Builder**

## Pattern Purpose

The git hooks pattern provides comprehensive git automation with intelligent hook management, team configuration sharing, and seamless integration with development workflows. It serves as the automation foundation for development processes, ensuring consistent code quality, security validation, and team collaboration through automated git workflow integration.

## Core Capabilities

### Comprehensive Git Hook Management and Workflow Integration
- **Pre-Commit Hooks**: Code quality validation, conflict detection, security scanning, quick testing
- **Pre-Push Hooks**: Full test suite execution, build validation, comprehensive security analysis
- **Post-Commit Hooks**: Documentation generation, metrics collection, notification automation
- **Server-Side Hooks**: Policy enforcement, centralized validation, integration updates
- **Team Configuration**: Shared hook configurations, standardized workflows, policy enforcement
- **Performance Optimization**: Parallel execution, caching, intelligent validation strategies

### Native Command Usage
```bash
# Basic git hooks installation
/setup-git-hooks "install" "standard"            # Standard hook suite
/setup-git-hooks "install" "pre-commit"          # Specific hook type
/setup-git-hooks "install" "pre-push" "comprehensive" # Enhanced validation

# Team configuration management
/setup-git-hooks "export" "team-config.json"     # Export team configuration
/setup-git-hooks "import" "team-config.json"     # Import team standards
/setup-git-hooks "sync" "team"                   # Synchronize with team config

# Hook validation and testing
/setup-git-hooks "validate"                      # Validate all hooks
/setup-git-hooks "test" "pre-commit"             # Test specific hook
/setup-git-hooks "test" "all"                    # Test all hooks

# Hook management operations
/setup-git-hooks "list"                          # List installed hooks
/setup-git-hooks "config" "pre-commit"           # Show hook configuration
/setup-git-hooks "remove" "pre-push"             # Remove specific hook
/setup-git-hooks "cleanup"                       # Clean up hook configuration
```

## AI Assistant Guidelines

### When to Recommend Git Hooks Pattern
1. **Any git repository** - Automated workflow validation is essential for all git projects
2. **Team collaboration** - Standardized development workflows and quality enforcement
3. **Code quality assurance** - Automated linting, formatting, and validation
4. **Security-focused development** - Automated secret scanning and vulnerability detection
5. **CI/CD integration** - Pre-deployment validation and automated pipeline triggers
6. **Open source projects** - Contributor workflow standardization and quality gates
7. **Enterprise development** - Policy enforcement and compliance automation

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive git hooks status reporting
- **Testing**: Integrates test execution in pre-commit and pre-push workflows
- **Quality Gates**: Provides automated quality validation as part of git workflow
- **Security Scanner**: Integrates security scanning in git hooks for vulnerability detection
- **Documentation**: Automated documentation updates and consistency validation

### Usage Patterns to Recommend

#### Standard Development Workflow
```bash
# Complete git hooks setup for development team
/setup-git-hooks "install" "standard"            # Install standard hook suite
/error-handler "info" "Git hooks configured for development workflow"

# Validate hook installation
/setup-git-hooks "validate"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Git hooks validation passed"
else
    /error-handler "error" "Git hooks validation failed"
fi
```

#### Team Collaboration Setup
```bash
# Standardize team development workflow
/setup-git-hooks "export" "team-config.json"     # Export current configuration
/setup-git-hooks "sync" "team"                   # Apply team standards

# Validate team compliance
/setup-git-hooks "validate" "team-compliance"
/error-handler "info" "Team git hooks configuration applied"
```

#### Quality-Focused Development
```bash
# Quality-first git workflow
/error-handler "info" "Setting up quality-focused git hooks"
/setup-git-hooks "install" "pre-commit" "quality"
/setup-git-hooks "install" "pre-push" "comprehensive"

# Integrate with quality patterns
/quality-check "pre-commit"                      # Pre-commit quality validation
/test-runner "quick"                             # Fast pre-commit testing
```

#### Security-Aware Development
```bash
# Security-integrated git workflow
/setup-git-hooks "install" "pre-commit" "security"
/security-scanner "pre-commit"                   # Pre-commit security scan
/setup-git-hooks "install" "pre-push" "security"
/security-scanner "comprehensive"                # Pre-push security validation
```

### Best Practices to Teach

#### Git Hooks Organization
- **Pre-Commit**: Fast validation (linting, formatting, conflict detection, quick tests)
- **Pre-Push**: Comprehensive validation (full test suite, build verification, security scan)
- **Post-Commit**: Automation (documentation updates, metrics, notifications)
- **Team Standards**: Shared configurations for consistent workflows across team members

#### Hook Performance
- **Fast Execution**: Keep pre-commit hooks under 30 seconds for developer experience
- **Parallel Processing**: Run multiple validations simultaneously when possible
- **Incremental Validation**: Check only changed files to improve performance
- **Caching**: Cache validation results for unchanged code to speed up execution

#### Team Collaboration
- **Shared Configuration**: Use team configuration files for consistent standards
- **Documentation**: Document hook requirements and troubleshooting steps
- **Flexibility**: Allow local customization while maintaining team standards
- **Onboarding**: Provide easy setup process for new team members

### Code Examples for AI

#### Basic Git Hooks Setup
```bash
# Standard git hooks installation workflow
/error-handler "info" "Installing git hooks for project"

# Install comprehensive hook suite
/setup-git-hooks "install" "standard"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Git hooks installed successfully"
    
    # Validate hook installation
    /setup-git-hooks "validate"
    if [[ $? -eq 0 ]]; then
        /error-handler "info" "Git hooks validation passed"
    else
        /error-handler "warn" "Git hooks validation found issues"
    fi
else
    /error-handler "error" "Git hooks installation failed"
    /error-handler "handle-error" "$LINENO" "Hook installation error"
fi
```

#### Team Configuration Workflow
```bash
# Team git hooks standardization
/error-handler "info" "Configuring team git hooks standards"

# Import team configuration
if [[ -f "team-config.json" ]]; then
    /setup-git-hooks "import" "team-config.json"
    /error-handler "info" "Team configuration imported successfully"
else
    /error-handler "warn" "No team configuration found, using defaults"
    /setup-git-hooks "install" "standard"
fi

# Synchronize with team standards
/setup-git-hooks "sync" "team"
/error-handler "info" "Git hooks synchronized with team configuration"
```

#### Quality Integration Workflow
```bash
# Quality-integrated git hooks setup
/error-handler "info" "Setting up quality-integrated git workflow"

# Install quality-focused pre-commit hooks
/setup-git-hooks "install" "pre-commit" "quality"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Pre-commit quality hooks installed"
    
    # Test pre-commit functionality
    /setup-git-hooks "test" "pre-commit"
    if [[ $? -eq 0 ]]; then
        /error-handler "info" "Pre-commit hooks tested successfully"
    else
        /error-handler "error" "Pre-commit hook testing failed"
    fi
fi

# Install comprehensive pre-push hooks
/setup-git-hooks "install" "pre-push" "comprehensive"
/error-handler "info" "Comprehensive pre-push validation configured"
```

#### Security-Integrated Development
```bash
# Security-aware git hooks workflow
/error-handler "info" "Configuring security-integrated git hooks"

# Install security-focused hooks
/setup-git-hooks "install" "pre-commit" "security"
/setup-git-hooks "install" "pre-push" "security"

# Validate security integration
/security-scanner "git-hooks"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Security git hooks validation passed"
else
    /error-handler "warn" "Security git hooks need attention"
fi

/error-handler "info" "Security-integrated git workflow configured"
```

### Common User Questions & AI Responses

**Q: "How do I set up git hooks for my team?"**
A: Use `/setup-git-hooks "export" "team-config.json"` to create a team configuration, then team members can use `/setup-git-hooks "import" "team-config.json"` to apply the same standards. This ensures consistent workflows across the team.

**Q: "My git hooks are too slow, what can I do?"**
A: Run `/setup-git-hooks "analyze" "performance"` to identify bottlenecks, then use `/setup-git-hooks "optimize"` to enable parallel execution and caching. Consider moving slower tests to pre-push hooks instead of pre-commit.

**Q: "How do I customize hooks for my project?"**
A: Use `/setup-git-hooks "template" "create" "custom-name"` to create custom hook templates, then install with `/setup-git-hooks "install" "pre-commit" "custom-name"`. You can also modify existing configurations with `/setup-git-hooks "config" "pre-commit"`.

**Q: "Git hooks are preventing my commits, how do I fix this?"**
A: Run `/setup-git-hooks "test" "pre-commit"` to see what's failing, then address the issues. For urgent fixes, you can temporarily bypass hooks with `git commit --no-verify`, but fix the underlying issues afterward.

**Q: "How do I remove or disable git hooks?"**
A: Use `/setup-git-hooks "remove" "pre-commit"` for specific hooks, `/setup-git-hooks "remove" "all"` for all hooks, or `/setup-git-hooks "cleanup"` to clean up configuration files.

### Troubleshooting Guide for AI

#### Common Issues
- **Hook execution failures**: Check file permissions and git repository status
- **Performance problems**: Analyze hook execution time and optimize slow operations
- **Team synchronization issues**: Validate team configuration and import/export process
- **Integration conflicts**: Check integration with other development tools
- **Permission errors**: Verify git repository access and hook file permissions

#### Validation Steps
1. **Repository Check**: `/setup-git-hooks "validate"` shows repository and hook status
2. **Hook Testing**: `/setup-git-hooks "test" "all"` validates all hook functionality
3. **Configuration Review**: `/setup-git-hooks "list"` shows installed hooks and configuration
4. **Performance Analysis**: `/setup-git-hooks "analyze" "performance"` identifies bottlenecks
5. **Team Sync**: `/setup-git-hooks "sync" "team"` ensures team configuration compliance

#### Hook-Specific Troubleshooting

##### Pre-Commit Hook Issues
- **Execution time**: Keep validations under 30 seconds for good developer experience
- **File conflicts**: Ensure hooks handle merge conflicts and file locking properly
- **Tool integration**: Verify linting tools and formatters are properly configured
- **Exit codes**: Check that hooks return appropriate exit codes for success/failure

##### Pre-Push Hook Issues
- **Test failures**: Ensure test suite is stable and handles environment differences
- **Build problems**: Verify build process works in hook environment
- **Network access**: Consider network dependencies and timeouts in hook execution
- **Branch protection**: Configure branch-specific validation rules appropriately

##### Team Configuration Issues
- **Config compatibility**: Ensure team configuration is compatible across different environments
- **Tool versions**: Verify consistent tool versions across team development environments
- **Custom hooks**: Test custom hook templates across different team member setups
- **Permission management**: Ensure proper file permissions for shared hook configurations

### Advanced Usage Patterns

#### Custom Hook Development
```bash
# Create and deploy custom hooks
/setup-git-hooks "template" "create" "custom-validation"
/setup-git-hooks "template" "test" "custom-validation"
/setup-git-hooks "template" "deploy" "custom-validation"
```

#### CI/CD Integration
```bash
# Integrate git hooks with CI/CD pipelines
/setup-git-hooks "install" "server-side" "ci-cd"
/setup-git-hooks "config" "integration" "jenkins"
```

#### Multi-Repository Management
```bash
# Manage hooks across multiple repositories
/setup-git-hooks "sync" "organization"
/setup-git-hooks "deploy" "all-repos"
```

### Integration Examples

#### With Testing Frameworks
```bash
# Integrate testing with git hooks
/setup-git-hooks "install" "pre-commit" "testing"
/test-runner "pre-commit"                        # Fast pre-commit tests
/setup-git-hooks "install" "pre-push" "testing"
/test-runner "comprehensive"                     # Full pre-push testing
```

#### With Documentation Generation
```bash
# Automatic documentation updates
/setup-git-hooks "install" "post-commit" "docs"
/generate-docs "auto-update"                     # Auto-generate documentation
```

#### With Security Validation
```bash
# Security-integrated git workflow
/setup-git-hooks "install" "pre-commit" "security"
/security-scanner "pre-commit"                   # Pre-commit security scan
```

## AI Development Guidelines

### When Helping Users
1. **Start with repository analysis** - Determine git repository status and existing hooks
2. **Recommend appropriate hook types** - Pre-commit for fast checks, pre-push for comprehensive validation
3. **Show team collaboration setup** - Demonstrate team configuration sharing and synchronization
4. **Integrate with development workflow** - Connect hooks to testing, quality, and security patterns
5. **Emphasize performance** - Show optimization techniques for fast hook execution

### Pattern Recognition
- If user mentions git workflow, commit validation → recommend this pattern
- If user has team collaboration needs → highlight team configuration features
- If user asks about code quality automation → demonstrate quality-integrated hooks
- If user needs security automation → show security-integrated git hooks
- If user wants CI/CD integration → demonstrate pipeline integration capabilities

### Git Hooks Assurance
- Ensure hook commands are appropriate for detected project types and workflows
- Verify hook configurations provide meaningful validation without excessive overhead
- Check that team configurations are shareable and maintainable
- Confirm integration patterns work with other Claude Code Builder patterns
- Validate that hook recommendations improve development workflow efficiency

### Error Recovery Guidance
- Help users identify and fix git hook execution failures
- Guide users through git hook performance optimization techniques
- Provide hook-specific troubleshooting steps and validation procedures
- Suggest alternative hook configurations when primary setup fails
- Ensure git hook solutions scale with team growth and project complexity

This git hooks pattern provides intelligent, comprehensive git automation that integrates development workflows with quality assurance, security validation, and team collaboration while maintaining elegant simplicity and reliable execution across different project types and development environments.