---
allowed-tools: Read, Write, Bash(npm:*), Bash(pip:*), Bash(go:*), Bash(cargo:*), Bash(brew:*), Bash(apt:*), Bash(command:*), Bash(which:*), Bash(curl:*), Bash(wget:*), Bash(git:*), Bash(find:*), Bash(grep:*), Bash(jq:*), Bash(yq:*)
argument-hint: [operation] or [package-name] or [project-path]
description: Comprehensive dependency management with security scanning, version analysis, and automated installation
category: patterns
---

# Dependency Manager

Intelligent dependency management with comprehensive analysis and automation: **$ARGUMENTS**

## Dependency Management System

I'll provide comprehensive dependency management capabilities with intelligent project analysis, security scanning, automated installation, and cross-platform package management across multiple programming ecosystems and development environments.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining dependency operation and scope]
Mode: [check/install/update/audit/analyze/bootstrap]
Target: [project directory, specific package, or dependency file]
Scope: [development/production/all/security/outdated]
```

### Dependency Analysis Process

#### Intelligent Project Detection and Ecosystem Analysis
```markdown
**🔍 Project Analysis**

Analyzing project dependencies and ecosystem requirements...
- Detecting project type, package managers, and dependency configurations
- Identifying security vulnerabilities, outdated packages, and license issues
- Analyzing dependency trees, conflicts, and optimization opportunities
- Preparing comprehensive dependency management and automation strategies
```

#### Multi-Ecosystem Package Management Support

##### Node.js/JavaScript Ecosystem
```markdown
**📦 Node.js Dependency Management**

Detection: package.json, package-lock.json, yarn.lock, node_modules/
Package Managers: npm, yarn, pnpm with version and feature detection
Security: npm audit, Snyk integration, vulnerability database scanning

Dependency Analysis:
```
├── package.json              # Primary dependency specification
├── package-lock.json         # Exact version lock for npm
├── yarn.lock                 # Exact version lock for yarn
├── node_modules/            # Installed packages directory
├── .nvmrc                   # Node.js version specification
└── .npmrc                   # npm configuration settings
```

Management Operations:
- **Installation**: npm install, yarn install, pnpm install with optimization
- **Security Audit**: npm audit, yarn audit with vulnerability reporting
- **Outdated Analysis**: npm outdated, yarn outdated with upgrade recommendations
- **License Scanning**: license-checker integration for compliance analysis
- **Bundle Analysis**: webpack-bundle-analyzer for size optimization

Usage: /dependency-manager "check" "nodejs-project/"
```

##### Python Ecosystem
```markdown
**🐍 Python Dependency Management**

Detection: requirements.txt, setup.py, pyproject.toml, Pipfile, poetry.lock
Package Managers: pip, pipenv, poetry, conda with environment management
Security: safety, bandit integration with CVE database scanning

Dependency Analysis:
```
├── requirements.txt         # Basic dependency specification
├── requirements-dev.txt     # Development dependencies
├── setup.py                # Package configuration and dependencies
├── pyproject.toml          # Modern Python project configuration
├── Pipfile                 # Pipenv dependency specification
├── poetry.lock             # Poetry exact version lock
├── environment.yml         # Conda environment specification
└── .python-version         # Python version specification
```

Management Operations:
- **Installation**: pip install, pipenv install, poetry install with virtual environments
- **Security Audit**: safety check, pip-audit with vulnerability scanning
- **Outdated Analysis**: pip list --outdated, poetry show --outdated
- **License Scanning**: pip-licenses for compliance analysis
- **Environment Management**: virtualenv, pipenv, poetry, conda environment handling

Usage: /dependency-manager "audit" "python-project/"
```

##### Go Module Ecosystem
```markdown
**🔧 Go Module Management**

Detection: go.mod, go.sum, vendor/ directory
Package Manager: go modules with version management and vendoring
Security: govulncheck, nancy with Go vulnerability database

Dependency Analysis:
```
├── go.mod                   # Module definition and dependencies
├── go.sum                   # Cryptographic checksums for dependencies
├── vendor/                  # Vendored dependencies (optional)
├── .go-version             # Go version specification
└── tools.go                # Tool dependencies
```

Management Operations:
- **Installation**: go mod download, go mod tidy with module management
- **Security Audit**: govulncheck, nancy with Go vulnerability scanning
- **Outdated Analysis**: go list -u -m all for upgrade detection
- **License Analysis**: go-licenses for compliance scanning
- **Vendor Management**: go mod vendor for dependency bundling

Usage: /dependency-manager "update" "go-project/"
```

##### Rust Cargo Ecosystem
```markdown
**⚙️ Rust Cargo Management**

Detection: Cargo.toml, Cargo.lock, target/ directory
Package Manager: cargo with feature management and workspace support
Security: cargo-audit with RustSec advisory database

Dependency Analysis:
```
├── Cargo.toml               # Package configuration and dependencies
├── Cargo.lock               # Exact version lock file
├── target/                  # Build artifacts and dependencies
├── rust-toolchain.toml      # Rust toolchain specification
└── .cargo/config.toml       # Cargo configuration
```

Management Operations:
- **Installation**: cargo build, cargo fetch with dependency resolution
- **Security Audit**: cargo audit with RustSec advisory scanning
- **Outdated Analysis**: cargo outdated for upgrade recommendations
- **License Analysis**: cargo license for compliance checking
- **Feature Management**: cargo features for conditional compilation

Usage: /dependency-manager "bootstrap" "rust-project/"
```

##### Docker Container Ecosystem
```markdown
**🐳 Container Dependency Management**

Detection: Dockerfile, docker-compose.yml, .dockerignore
Package Managers: Various (apt, yum, apk) within container images
Security: docker scan, trivy, clair with container vulnerability scanning

Container Analysis:
```
├── Dockerfile               # Container build specification
├── docker-compose.yml       # Multi-container application
├── .dockerignore           # Build context exclusions
├── docker-compose.override.yml # Environment-specific overrides
└── requirements/           # Multi-stage dependency files
```

Management Operations:
- **Image Analysis**: docker scan, trivy for vulnerability scanning
- **Base Image Updates**: automated base image update recommendations
- **Multi-stage Optimization**: dependency layer optimization analysis
- **Security Hardening**: container security best practices validation
- **Size Optimization**: image size reduction recommendations

Usage: /dependency-manager "scan" "docker-project/"
```

### Dependency Management Operations

#### Comprehensive Dependency Checking
```bash
# Check all project dependencies
/dependency-manager "check"
/dependency-manager "check" "project-directory/"
/dependency-manager "check" "package.json"

# Project-specific dependency validation
/dependency-manager "check" "nodejs"
/dependency-manager "check" "python" "production"
/dependency-manager "check" "go" "development"
```

**Checking Process**:
1. **Project Detection**: Identify project type and package manager configuration
2. **Dependency Analysis**: Parse dependency files and installed packages
3. **Version Validation**: Check installed vs. required versions
4. **Security Scanning**: Identify known vulnerabilities and security issues
5. **License Compliance**: Validate license compatibility and restrictions

#### Automated Dependency Installation
```bash
# Install project dependencies
/dependency-manager "install"
/dependency-manager "install" "project-directory/"
/dependency-manager "install" "express@4.18.0"

# Environment-specific installation
/dependency-manager "install" "development"
/dependency-manager "install" "production" "--only-prod"
/dependency-manager "bootstrap" "new-project/"
```

#### Security Audit and Vulnerability Scanning
```bash
# Comprehensive security audit
/dependency-manager "audit"
/dependency-manager "audit" "project/" "critical-only"
/dependency-manager "scan" "security"

# Vulnerability reporting and remediation
/dependency-manager "vulnerabilities" "detailed"
/dependency-manager "fix" "security-issues"
```

#### Dependency Update and Upgrade Management
```bash
# Check for outdated dependencies
/dependency-manager "outdated"
/dependency-manager "outdated" "major-versions"

# Update dependencies with safety checks
/dependency-manager "update" "minor-only"
/dependency-manager "upgrade" "package-name"
/dependency-manager "update" "all" "--test-after"
```

### Advanced Dependency Features

#### Dependency Tree Analysis and Conflict Resolution
```bash
# Analyze dependency relationships
/dependency-manager "tree"
/dependency-manager "tree" "package-name"
/dependency-manager "conflicts"

# Resolve dependency conflicts
/dependency-manager "resolve" "conflicts"
/dependency-manager "dedupe"
```

#### License Compliance and Analysis
```bash
# License compliance checking
/dependency-manager "licenses"
/dependency-manager "licenses" "report"
/dependency-manager "compliance" "corporate-policy"

# License risk assessment
/dependency-manager "license-audit"
```

#### Performance and Bundle Analysis
```bash
# Bundle size and performance analysis
/dependency-manager "analyze" "bundle-size"
/dependency-manager "optimize" "production"
/dependency-manager "performance" "report"
```

### Integration with Error Handling

#### Comprehensive Dependency Status Reporting
```bash
# All dependency operations use error handling pattern
/error-handler "info" "Starting dependency analysis for $project_type project"

# Dependency checking progress
/error-handler "info" "Analyzing $dependency_count dependencies"
/error-handler "info" "Security scanning $package_count packages"

# Dependency validation results
/error-handler "info" "Dependency validation completed successfully"

# Security and vulnerability reporting
/error-handler "warn" "Found $vulnerability_count security vulnerabilities"
/error-handler "error" "Critical security vulnerabilities detected"
/error-handler "handle-error" "$LINENO" "Dependency management failed"
```

#### Detailed Dependency Operation Reporting
```bash
# Dependency installation feedback
/error-handler "info" "Installing $package_count dependencies"
/error-handler "info" "Dependency installation: $install_status"
/error-handler "warn" "Dependency conflicts detected: $conflict_details"

# Security scan results
/error-handler "info" "Security scan completed: $scan_results"
/error-handler "error" "Security audit failed: $security_issues"
/error-handler "info" "License compliance: $compliance_status"
```

### Dependency Management Implementation

#### Intelligent Package Manager Detection
```markdown
**Smart Package Manager Integration**:

**Ecosystem Detection**:
- File pattern analysis for project type identification
- Package manager configuration discovery and validation
- Version requirement analysis and compatibility checking
- Development vs. production dependency classification

**Package Manager Operations**:
- Native package manager command integration and optimization
- Cross-platform installation strategy with fallback mechanisms
- Package registry and mirror configuration for enterprise environments
- Parallel installation and dependency resolution optimization
```

#### Multi-Language Dependency Integration
```markdown
**Cross-Language Project Support**:

**Monorepo Management**:
- Multi-language project detection and dependency coordination
- Workspace and lerna integration for JavaScript/TypeScript projects
- Poetry workspace and pip-tools for Python monorepos
- Go workspaces and Rust cargo workspaces for compiled languages

**Package Manager Coordination**:
- Dependency synchronization across multiple package managers
- Version constraint coordination and conflict resolution
- Shared dependency optimization and deduplication strategies
- Cross-language security scanning and vulnerability aggregation
```

### Output Formatting

#### Standard Dependency Analysis Results
```
🔍 Dependency Analysis: Node.js Project
📦 Package Manager: npm (8.19.2)
⚡ Status: 156 dependencies analyzed

💾 Dependency Summary:
  Production: 24 packages
  Development: 132 packages
  Peer Dependencies: 3 packages
  Optional Dependencies: 2 packages
  
📊 Security Analysis:
  ✅ No critical vulnerabilities
  ⚠️  2 moderate vulnerabilities found
  📋 5 packages with available updates
  
📋 Recommendations:
  • Update lodash to 4.17.21 (security fix)
  • Consider replacing moment with date-fns (smaller bundle)
  • 3 packages have major version updates available

⏱️  Analysis Time: 4.2s
🎯 Dependency Health: 87/100
```

#### Security Audit Results
```
🔒 Security Audit: Python Project
🛡️ Scanner: safety + pip-audit
⚡ Status: 89 packages scanned

📊 Security Summary:
  🚨 Critical: 0 vulnerabilities
  ⚠️  High: 1 vulnerability found
  📋 Moderate: 3 vulnerabilities found
  ✅ Low: 2 vulnerabilities found
  
🔍 Vulnerability Details:
  📦 requests==2.25.1
     CVE-2023-32681: Moderate severity
     Fix: Upgrade to requests>=2.31.0
     
  📦 cryptography==3.4.8
     CVE-2023-23931: High severity
     Fix: Upgrade to cryptography>=39.0.1

📝 Remediation:
  • Run: pip install -U requests cryptography
  • Test application after upgrades
  • Review breaking changes in upgrade guide

🎯 Security Score: 76/100
```

#### Dependency Tree Visualization
```
🌳 Dependency Tree: express-app
📦 Root: express@4.18.2

📊 Dependency Structure:
express@4.18.2
├── accepts@1.3.8
│   ├── mime-types@2.1.35
│   └── negotiator@0.6.3
├── array-flatten@1.1.1
├── body-parser@1.20.1
│   ├── bytes@3.1.2
│   ├── content-type@1.0.4
│   └── raw-body@2.5.1
├── cookie-signature@1.0.6
├── debug@2.6.9
│   └── ms@2.0.0
└── depd@2.0.0

📈 Statistics:
  • Total Dependencies: 47 packages
  • Dependency Depth: 6 levels
  • Bundle Size Impact: 2.3MB
  • Duplicate Dependencies: 2 packages
```

#### License Compliance Report
```
📄 License Compliance: Enterprise Project
⚖️ Policy: Corporate License Policy v2.1
⚡ Status: 234 packages analyzed

📊 License Distribution:
  ✅ MIT: 156 packages (66.7%)
  ✅ Apache-2.0: 45 packages (19.2%)
  ✅ BSD-3-Clause: 23 packages (9.8%)
  ⚠️  ISC: 8 packages (3.4%)
  🚨 GPL-3.0: 2 packages (0.9%)
  
⚠️  License Issues:
  📦 package-a@1.2.3 (GPL-3.0)
     Risk: High - Copyleft license incompatible with proprietary software
     Action: Find alternative or obtain legal approval
     
  📦 package-b@2.1.0 (AGPL-3.0)
     Risk: Critical - Network copyleft license
     Action: Immediate replacement required

📝 Recommendations:
  • Replace GPL-licensed packages before production deployment
  • Review ISC license packages for enterprise compliance
  • Consider maintaining approved license whitelist

🎯 Compliance Score: 91/100
```

### Performance Optimization

#### Fast Dependency Operations
- **Parallel Processing**: Concurrent package installation and analysis
- **Caching Strategy**: Package metadata and security scan result caching
- **Incremental Analysis**: Analyze only changed dependencies when possible
- **Registry Optimization**: Use fastest available package registry mirrors

#### Efficient Resource Usage
- **Memory Management**: Optimize dependency tree analysis for large projects
- **Network Optimization**: Minimize package registry requests and downloads
- **Disk Usage**: Efficient package cache management and cleanup
- **Process Management**: Optimal subprocess handling for package managers

### Dependency Security

#### Safe Package Management
- **Input Validation**: Validate package names and versions for security
- **Registry Verification**: Verify package integrity and authenticity
- **Sandbox Execution**: Safe execution of package manager commands
- **Permission Management**: Minimal privilege execution for package operations

#### Advanced Security Features
- **Vulnerability Database**: Integration with multiple CVE and advisory databases
- **Supply Chain Analysis**: Detect suspicious packages and maintainer changes
- **License Risk Assessment**: Automated license compliance and risk evaluation
- **Dependency Pinning**: Secure dependency version management and lock files

### Integration Patterns

#### With Error Handling Pattern
```bash
# Dependency management with comprehensive error handling
/error-handler "info" "Starting comprehensive dependency analysis"
/dependency-manager "check" "project/"
/error-handler "info" "Dependency analysis completed successfully"
```

#### With Security Scanner
```bash
# Security-integrated dependency management
/dependency-manager "audit" "project/"
/security-scanner "dependencies"          # Additional security analysis
```

#### With Quality Gates
```bash
# Dependency quality validation
/dependency-manager "check" "production"
/quality-check "dependencies"            # Dependency quality assessment
```

#### With Testing Pattern
```bash
# Test-integrated dependency updates
/dependency-manager "update" "minor-only"
/test-runner "all"                       # Validate after updates
```

### Dependency Management Options

#### Configuration Settings
```bash
DEPENDENCY_AUDIT_LEVEL="moderate"        # Security audit severity threshold
DEPENDENCY_UPDATE_STRATEGY="conservative" # Update strategy (conservative/aggressive)
DEPENDENCY_CACHE_ENABLED=true           # Enable dependency analysis caching
DEPENDENCY_PARALLEL_JOBS=4              # Parallel operation configuration
DEPENDENCY_REGISTRY_TIMEOUT=30          # Package registry timeout (seconds)
```

#### Project Configuration
```bash
# .deprc configuration file support
ALLOWED_LICENSES="MIT,Apache-2.0,BSD-3-Clause"
SECURITY_POLICY="corporate-standard"
UPDATE_NOTIFICATIONS=true
VULNERABILITY_THRESHOLD="moderate"
```

## Success Indicators

- ✅ **Multi-Ecosystem Support**: Comprehensive Node.js, Python, Go, Rust, and Docker dependency management
- ✅ **Security Integration**: Automated vulnerability scanning and security advisory integration
- ✅ **License Compliance**: Corporate license policy enforcement and compliance reporting
- ✅ **Performance Optimization**: Parallel processing, caching, and efficient package management
- ✅ **Advanced Analysis**: Dependency tree analysis, conflict resolution, and optimization
- ✅ **Integration**: Seamless integration with error handling, security, quality, and testing patterns

The dependency manager provides intelligent, comprehensive package management that handles multi-ecosystem projects while offering advanced security scanning, license compliance, and optimization capabilities across various programming languages and deployment environments.