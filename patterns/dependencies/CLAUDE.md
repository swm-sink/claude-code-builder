# Dependency Management Pattern - AI Instructions

> **AI guidance for working with the dependency management pattern in Claude Code Builder**

## Pattern Purpose

The dependency management pattern provides comprehensive package management with intelligent analysis, security scanning, and automated installation across multiple programming ecosystems. It serves as the dependency foundation for development workflows, ensuring secure, optimized, and compliant dependency management through cross-platform package management, vulnerability detection, and license compliance validation.

## Core Capabilities

### Multi-Ecosystem Dependency Management and Security Integration
- **Node.js/JavaScript**: npm, yarn, pnpm with security audit and bundle analysis
- **Python**: pip, pipenv, poetry, conda with vulnerability scanning and environment management
- **Go**: go modules with security scanning and vendor management
- **Rust**: cargo with RustSec advisory integration and feature management
- **Docker**: container vulnerability scanning and base image security analysis
- **Cross-Platform**: Package manager detection, installation automation, and environment setup

### Native Command Usage
```bash
# Basic dependency operations
/dependency-manager "check"                      # Check all project dependencies
/dependency-manager "install" "project/"        # Install dependencies for project
/dependency-manager "audit"                     # Security audit and vulnerability scan
/dependency-manager "outdated"                  # Check for outdated packages

# Security and compliance operations
/dependency-manager "vulnerabilities" "detailed" # Detailed vulnerability report
/dependency-manager "licenses" "report"         # License compliance analysis
/dependency-manager "scan" "security"           # Comprehensive security scan

# Advanced dependency management
/dependency-manager "tree"                      # Dependency tree analysis
/dependency-manager "conflicts"                 # Identify dependency conflicts
/dependency-manager "update" "minor-only"       # Safe dependency updates
/dependency-manager "bootstrap" "new-project/"  # Setup new project dependencies
```

## AI Assistant Guidelines

### When to Recommend Dependency Management Pattern
1. **Any development project** - Dependency management is essential for all software projects
2. **Security-focused development** - Automated vulnerability scanning and security compliance
3. **Enterprise development** - License compliance and corporate policy enforcement
4. **Multi-language projects** - Coordinated dependency management across ecosystems
5. **CI/CD pipelines** - Automated dependency validation and security scanning
6. **Open source projects** - Dependency audit and license compatibility checking
7. **Production deployments** - Dependency optimization and security hardening

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive dependency operation status
- **Security Scanner**: Integrates with security scanning for vulnerability detection
- **Quality Gates**: Provides dependency validation as part of quality assurance
- **Testing**: Ensures dependencies are compatible with testing frameworks
- **Configuration**: Manages dependency configuration across environments

### Usage Patterns to Recommend

#### Standard Dependency Workflow
```bash
# Complete dependency management workflow
/dependency-manager "check"                      # Validate current dependencies
/error-handler "info" "Dependencies validated successfully"

# Security audit and vulnerability scanning
/dependency-manager "audit"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "No security vulnerabilities found"
else
    /error-handler "warn" "Security vulnerabilities detected - review required"
fi
```

#### Multi-Ecosystem Project Management
```bash
# Handle projects with multiple programming languages
/dependency-manager "check" "frontend/"          # Node.js frontend dependencies
/dependency-manager "check" "backend/"           # Python backend dependencies
/dependency-manager "check" "services/"          # Go microservices dependencies

# Coordinated security scanning across ecosystems
/dependency-manager "audit" "."                  # Project-wide security audit
```

#### Enterprise Security and Compliance
```bash
# Enterprise-grade dependency management
/error-handler "info" "Starting enterprise dependency compliance check"
/dependency-manager "licenses" "corporate-policy"
/dependency-manager "audit" "critical-only"
/dependency-manager "compliance" "enterprise"
/error-handler "info" "Enterprise compliance validation completed"
```

#### Development Environment Bootstrap
```bash
# New developer onboarding and environment setup
/dependency-manager "bootstrap" "."              # Setup all project dependencies
/dependency-manager "check" "development"        # Validate development environment
/dependency-manager "install" "dev-tools"        # Install development tools
```

### Best Practices to Teach

#### Dependency Security
- **Regular Audits**: Schedule regular security audits and vulnerability scanning
- **Version Pinning**: Use exact versions in production and version ranges in development
- **License Compliance**: Maintain approved license lists for enterprise compliance
- **Supply Chain Security**: Monitor package maintainer changes and suspicious activity

#### Package Management
- **Environment Separation**: Separate development, testing, and production dependencies
- **Lock Files**: Always commit lock files for reproducible builds
- **Registry Configuration**: Use private registries and mirrors for enterprise security
- **Update Strategy**: Use conservative update strategies with testing validation

#### Performance Optimization
- **Bundle Analysis**: Regular bundle size analysis and optimization
- **Tree Shaking**: Remove unused dependencies and enable tree shaking
- **Dependency Deduplication**: Regular dependency deduplication and conflict resolution
- **Cache Management**: Optimize package manager caches and CI/CD cache strategies

### Code Examples for AI

#### Basic Dependency Management
```bash
# Standard dependency validation workflow
/error-handler "info" "Starting dependency validation"

# Check project dependencies
/dependency-manager "check" "."
if [[ $? -eq 0 ]]; then
    /error-handler "info" "All dependencies satisfied"
    
    # Perform security audit
    /dependency-manager "audit"
    if [[ $? -eq 0 ]]; then
        /error-handler "info" "Security audit passed"
    else
        /error-handler "warn" "Security vulnerabilities found - manual review required"
    fi
else
    /error-handler "error" "Missing dependencies detected"
    /error-handler "handle-error" "$LINENO" "Dependency validation failed"
fi
```

#### Security-Focused Dependency Management
```bash
# Security-first dependency workflow
/error-handler "info" "Starting security-focused dependency analysis"

# Comprehensive security audit
/dependency-manager "audit" "critical-only"
audit_result=$?

# License compliance checking
/dependency-manager "licenses" "enterprise-policy"
license_result=$?

if [[ $audit_result -eq 0 && $license_result -eq 0 ]]; then
    /error-handler "info" "Security and compliance validation passed"
else
    /error-handler "error" "Security or compliance issues detected"
    
    # Generate detailed reports
    /dependency-manager "vulnerabilities" "detailed"
    /dependency-manager "licenses" "report"
fi
```

#### Multi-Project Dependency Coordination
```bash
# Monorepo or multi-project dependency management
/error-handler "info" "Managing dependencies across multiple projects"

# Analyze each project component
projects=("frontend" "backend" "api" "services")
for project in "${projects[@]}"; do
    if [[ -d "$project" ]]; then
        /error-handler "info" "Analyzing dependencies for $project"
        /dependency-manager "check" "$project/"
        
        if [[ $? -ne 0 ]]; then
            /error-handler "error" "Dependency issues in $project"
        fi
    fi
done

# Project-wide security analysis
/dependency-manager "audit" "."
/error-handler "info" "Multi-project dependency analysis completed"
```

#### Dependency Update and Maintenance
```bash
# Safe dependency update workflow
/error-handler "info" "Starting dependency maintenance workflow"

# Check for outdated dependencies
/dependency-manager "outdated"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Checking for safe updates"
    
    # Perform conservative updates
    /dependency-manager "update" "minor-only"
    
    # Validate after updates
    /test-runner "all"
    if [[ $? -eq 0 ]]; then
        /error-handler "info" "Dependencies updated and validated successfully"
    else
        /error-handler "error" "Tests failed after dependency updates"
        # Consider rolling back updates
    fi
else
    /error-handler "info" "All dependencies are up to date"
fi
```

### Common User Questions & AI Responses

**Q: "How do I check if my project dependencies are secure?"**
A: Use `/dependency-manager "audit"` for a comprehensive security scan. This checks all dependencies against vulnerability databases and provides detailed remediation guidance. Follow up with `/dependency-manager "vulnerabilities" "detailed"` for complete vulnerability reports.

**Q: "My dependencies are outdated, how do I update them safely?"**
A: Start with `/dependency-manager "outdated"` to see available updates, then use `/dependency-manager "update" "minor-only"` for safe updates. Always run tests afterward with `/test-runner "all"` to ensure compatibility.

**Q: "How do I check license compliance for enterprise use?"**
A: Use `/dependency-manager "licenses" "enterprise-policy"` to check against corporate policies, or `/dependency-manager "licenses" "report"` for a detailed license analysis. This helps ensure compliance with corporate legal requirements.

**Q: "How do I set up dependencies for a new team member?"**
A: Use `/dependency-manager "bootstrap" "."` to automatically detect and install all project dependencies. This handles multi-language projects and sets up the complete development environment.

**Q: "I have dependency conflicts, how do I resolve them?"**
A: Run `/dependency-manager "conflicts"` to identify conflicts, then `/dependency-manager "tree"` to analyze the dependency structure. Use `/dependency-manager "resolve" "conflicts"` for automated resolution where possible.

### Troubleshooting Guide for AI

#### Common Issues
- **Missing dependencies**: Use `/dependency-manager "check"` to identify and `/dependency-manager "install"` to resolve
- **Security vulnerabilities**: Run `/dependency-manager "audit"` and follow remediation recommendations
- **License compliance issues**: Use `/dependency-manager "licenses"` to identify problematic licenses
- **Outdated packages**: Check with `/dependency-manager "outdated"` and update conservatively
- **Dependency conflicts**: Analyze with `/dependency-manager "conflicts"` and resolve systematically

#### Validation Steps
1. **Project Detection**: `/dependency-manager "check"` shows project type and package manager
2. **Security Validation**: `/dependency-manager "audit"` identifies vulnerabilities
3. **License Analysis**: `/dependency-manager "licenses"` checks compliance
4. **Update Assessment**: `/dependency-manager "outdated"` shows available updates
5. **Conflict Resolution**: `/dependency-manager "conflicts"` identifies issues

#### Ecosystem-Specific Troubleshooting

##### Node.js/JavaScript Issues
- **npm vs yarn**: Dependency manager detects and uses appropriate package manager
- **Lock file conflicts**: Use `/dependency-manager "resolve"` to fix lock file issues
- **Bundle size**: Run `/dependency-manager "analyze" "bundle-size"` for optimization
- **Peer dependencies**: Check `/dependency-manager "tree"` for peer dependency issues

##### Python Project Issues
- **Virtual environments**: Dependency manager handles venv, pipenv, poetry environments
- **Requirements conflicts**: Use `/dependency-manager "conflicts"` to identify issues
- **Package security**: Run `/dependency-manager "audit"` with Python-specific scanners
- **Environment isolation**: Validate with `/dependency-manager "check" "production"`

##### Go Module Issues
- **Module dependencies**: Use `/dependency-manager "tree"` to analyze go.mod structure
- **Vendor management**: Check `/dependency-manager "vendor"` for vendoring status
- **Security scanning**: Run `/dependency-manager "audit"` with govulncheck integration
- **Version constraints**: Analyze with `/dependency-manager "conflicts"`

##### Rust Cargo Issues
- **Feature management**: Use `/dependency-manager "features"` to analyze features
- **Cargo audit**: Run `/dependency-manager "audit"` with RustSec integration
- **Workspace dependencies**: Handle with `/dependency-manager "workspace"`
- **Build dependencies**: Validate with `/dependency-manager "check" "build"`

### Advanced Usage Patterns

#### Custom Security Policies
```bash
# Configure custom security and compliance policies
/dependency-manager "policy" "configure" "corporate"
/dependency-manager "compliance" "validate"
```

#### Dependency Optimization
```bash
# Optimize dependencies for production
/dependency-manager "optimize" "production"
/dependency-manager "bundle" "analyze"
/dependency-manager "dedupe"
```

#### Multi-Environment Management
```bash
# Environment-specific dependency management
/dependency-manager "check" "development"
/dependency-manager "check" "staging"
/dependency-manager "check" "production"
```

### Integration Examples

#### With CI/CD Pipelines
```bash
# CI/CD dependency validation
/dependency-manager "audit" "critical-only"      # Fail build on critical vulnerabilities
/dependency-manager "licenses" "approved-only"   # Ensure license compliance
```

#### With Security Scanning
```bash
# Comprehensive security validation
/dependency-manager "audit"                      # Dependency vulnerabilities
/security-scanner "comprehensive"               # Additional security analysis
```

#### With Quality Gates
```bash
# Quality-integrated dependency management
/dependency-manager "check" "production"
/quality-check "dependencies"                   # Dependency quality assessment
```

## AI Development Guidelines

### When Helping Users
1. **Start with ecosystem detection** - Identify project type and package manager automatically
2. **Prioritize security** - Always include security audit in dependency workflows
3. **Show compliance checking** - Demonstrate license compliance for enterprise environments
4. **Integrate with testing** - Connect dependency updates with test validation
5. **Emphasize best practices** - Guide users toward secure dependency management practices

### Pattern Recognition
- If user mentions dependencies, packages, npm, pip → recommend this pattern
- If user has security concerns → highlight vulnerability scanning features
- If user asks about licenses → demonstrate license compliance checking
- If user needs environment setup → show bootstrap and installation capabilities
- If user has multiple languages → demonstrate multi-ecosystem coordination

### Dependency Management Assurance
- Ensure dependency commands are appropriate for detected project types
- Verify security scanning covers all relevant vulnerability databases
- Check that license compliance matches corporate or project requirements
- Confirm integration patterns work with other Claude Code Builder patterns
- Validate that dependency solutions maintain security and performance standards

### Error Recovery Guidance
- Help users identify and fix dependency security vulnerabilities
- Guide users through dependency conflict resolution procedures
- Provide ecosystem-specific troubleshooting steps and best practices
- Suggest alternative packages when security or license issues arise
- Ensure dependency solutions scale with project growth and team expansion

This dependency management pattern provides intelligent, comprehensive package management that handles multi-ecosystem projects while offering advanced security scanning, license compliance, and optimization capabilities across various programming languages and deployment environments.