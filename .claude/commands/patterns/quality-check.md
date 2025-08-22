---
allowed-tools: Read, Glob, Bash(eslint:*), Bash(flake8:*), Bash(go:*), Bash(cargo:*), Bash(rustfmt:*), Bash(find:*), Bash(grep:*), Bash(awk:*), Bash(wc:*)
argument-hint: [project-path] or [check-type] or [language]
description: Comprehensive quality validation with linting, formatting, and standards checking
category: patterns
---

# Quality Check

Multi-language quality validation with automatic detection: **$ARGUMENTS**

## Quality Validation System

I'll provide comprehensive quality checking capabilities with automatic language detection, professional standards validation, and actionable improvement recommendations.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining quality operation and scope]
Mode: [full/lint/format/security/performance]
Language: [auto-detect or specified]
Path: [Current directory or specified path]
```

### Project Type Detection

#### Automatic Quality Detection Process
```markdown
**🔍 Quality Analysis**

Analyzing project structure for quality validation...
- Scanning for language-specific quality tools
- Detecting configuration files and standards
- Identifying quality validation opportunities
- Preparing comprehensive quality assessment
```

#### Supported Language Quality Checks

##### Node.js/JavaScript Quality
```markdown
**📦 Node.js Quality Validation**

Indicators: package.json, .eslintrc, .prettierrc files
Quality Tools:
- ESLint: Code quality and style checking
- Prettier: Code formatting validation
- JSHint: Alternative JavaScript linting
- TSLint: TypeScript-specific validation

Quality Checks:
1. ESLint configuration and execution
2. Code formatting consistency
3. Dependency security scanning
4. Package.json validation
5. Import/export validation

Usage: /quality-check "nodejs" or auto-detected
```

##### Python Quality
```markdown
**🐍 Python Quality Validation**

Indicators: requirements.txt, pyproject.toml, setup.py, .py files
Quality Tools:
- flake8: Style guide enforcement (PEP 8)
- black: Code formatting validation
- pylint: Comprehensive code analysis
- mypy: Static type checking
- bandit: Security vulnerability scanning

Quality Checks:
1. PEP 8 compliance validation
2. Code formatting consistency (black)
3. Import organization (isort)
4. Docstring compliance
5. Security vulnerability scanning
6. Type hint validation

Usage: /quality-check "python" or auto-detected
```

##### Go Quality
```markdown
**🔷 Go Quality Validation**

Indicators: go.mod, go.sum, .go files
Quality Tools:
- go fmt: Official Go formatting
- go vet: Go static analysis
- golint: Go style checking
- goimports: Import organization
- staticcheck: Advanced static analysis

Quality Checks:
1. Official Go formatting (go fmt)
2. Static analysis (go vet)
3. Style compliance (golint)
4. Import organization
5. Unused code detection
6. Performance anti-patterns

Usage: /quality-check "golang" or auto-detected
```

##### Rust Quality
```markdown
**🦀 Rust Quality Validation**

Indicators: Cargo.toml file present
Quality Tools:
- rustfmt: Official Rust formatting
- clippy: Rust linting and suggestions
- cargo check: Fast compilation checking
- cargo audit: Security vulnerability scanning

Quality Checks:
1. Official Rust formatting (rustfmt)
2. Idiomatic Rust patterns (clippy)
3. Compilation validation
4. Security vulnerability scanning
5. Performance optimization suggestions
6. Documentation completeness

Usage: /quality-check "rust" or auto-detected
```

##### Generic Project Quality
```markdown
**📁 Generic Quality Validation**

Indicators: .editorconfig, .gitignore, README files
Quality Tools:
- EditorConfig: Consistent coding styles
- Shell script validation (shellcheck)
- Markdown linting (markdownlint)
- YAML validation
- JSON validation

Quality Checks:
1. EditorConfig compliance
2. File encoding consistency
3. Line ending normalization
4. Documentation completeness
5. Configuration file validation
6. Common anti-patterns detection

Usage: /quality-check "generic" or auto-detected
```

### Quality Check Categories

#### Comprehensive Quality Validation
```bash
# Run all available quality checks
/quality-check "."

# Run quality checks for specific language
/quality-check "nodejs"
/quality-check "python"
/quality-check "golang"
/quality-check "rust"
```

**Full Validation Process**:
1. **Language Detection**: Automatically identify project type
2. **Tool Availability**: Check for required quality tools
3. **Configuration Validation**: Verify quality tool setup
4. **Code Analysis**: Execute language-specific quality checks
5. **Common Issues**: Check for universal code quality problems
6. **Report Generation**: Provide actionable improvement recommendations

#### Specific Quality Categories

##### Linting Validation
```bash
# Focus on code style and standards
/quality-check "lint"

# Language-specific linting
/quality-check "nodejs" "lint"
/quality-check "python" "lint"
```

**Linting Focus**:
- Code style compliance
- Language-specific best practices
- Error-prone pattern detection
- Consistency validation

##### Formatting Validation
```bash
# Focus on code formatting
/quality-check "format"

# Check formatting without fixing
/quality-check "format" "check"
```

**Formatting Focus**:
- Consistent indentation
- Line length compliance
- Whitespace normalization
- Import organization

##### Security Quality Checks
```bash
# Focus on security quality
/quality-check "security"

# Comprehensive security scanning
/quality-check "security" "full"
```

**Security Focus**:
- Vulnerability scanning
- Dependency security analysis
- Security anti-pattern detection
- Sensitive data exposure prevention

##### Performance Quality Checks
```bash
# Focus on performance quality
/quality-check "performance"

# Performance anti-pattern detection
/quality-check "performance" "analysis"
```

**Performance Focus**:
- Performance anti-pattern detection
- Resource usage optimization
- Algorithm efficiency analysis
- Memory usage validation

### Language-Specific Implementation

#### Node.js Quality Execution
```markdown
**Detection Process**:
1. Look for package.json file
2. Check for .eslintrc, .prettierrc configuration
3. Verify npm/yarn availability
4. Scan for JavaScript/TypeScript files

**Quality Execution Strategy**:
- Primary: ESLint with project configuration
- Secondary: Prettier for formatting validation
- Tertiary: Custom rule validation
- Fallback: Basic syntax validation

**Configuration Support**:
- .eslintrc.js, .eslintrc.json, .eslintrc.yml
- .prettierrc, prettier.config.js
- package.json eslint/prettier configuration
- TypeScript ESLint configuration
```

#### Python Quality Execution
```markdown
**Detection Process**:
1. Look for requirements.txt, pyproject.toml
2. Check for .flake8, pyproject.toml configuration
3. Verify Python tool availability
4. Scan for Python files and structure

**Quality Execution Strategy**:
- Primary: flake8 for PEP 8 compliance
- Secondary: black for formatting validation
- Tertiary: pylint for comprehensive analysis
- Additional: bandit for security scanning

**Configuration Support**:
- setup.cfg, .flake8, pyproject.toml
- .pylintrc, pylint configuration
- .bandit, bandit.yaml security rules
```

#### Go Quality Execution
```markdown
**Detection Process**:
1. Look for go.mod file
2. Check for Go files and package structure
3. Verify Go toolchain availability
4. Detect module configuration

**Quality Execution Strategy**:
- Primary: go fmt for official formatting
- Secondary: go vet for static analysis
- Tertiary: golint for style checking
- Advanced: staticcheck for deeper analysis

**Module Support**:
- Module-aware analysis
- Vendor directory handling
- Build constraint validation
```

### Advanced Quality Features

#### Multi-Language Project Support
```bash
# Handle projects with multiple languages
/quality-check "multi"
# Detects: Node.js + Python, Go + JavaScript, etc.
# Runs appropriate quality checks for each language
```

#### Quality Report Generation
```bash
# Generate comprehensive quality report
/quality-check "report"

# Export quality metrics
/quality-check "metrics"
```

#### Incremental Quality Checking
```bash
# Check only changed files
/quality-check "changed"

# Check specific file patterns
/quality-check "filter" "*.js"
/quality-check "filter" "src/**/*.py"
```

### Integration with Error Handling

#### Comprehensive Status Reporting
```bash
# All quality operations use error handling pattern
/error-handler "info" "Starting quality validation for $project_type"

# Quality issues found
/error-handler "warn" "Quality issues detected: $issue_count"

# Quality validation passed
/error-handler "info" "All quality checks passed successfully"

# Fatal quality errors
/error-handler "handle-error" "$LINENO" "Critical quality tool not available"
```

#### Detailed Issue Reporting
```bash
# Issue categorization
/error-handler "warn" "Linting issues: $lint_count"
/error-handler "warn" "Formatting issues: $format_count"
/error-handler "warn" "Security issues: $security_count"

# Actionable recommendations
/error-handler "info" "Run: $fix_command to resolve issues"
/error-handler "info" "Configuration: $config_file needs updates"
```

### Output Formatting

#### Standard Quality Results
```
🔍 Project Type Detection: nodejs
📋 Quality Tools: ESLint, Prettier
⚡ Validation Status: Running...

📊 Quality Results:
  ✅ Linting: 0 issues
  ⚠️  Formatting: 3 issues  
  ✅ Security: No vulnerabilities
  ⚠️  Performance: 1 optimization opportunity

⏱️  Execution Time: 1.8 seconds
📈 Quality Score: 85/100
```

#### Multi-Language Results
```
🔍 Multi-Language Project Detected:
  📦 Node.js: ESLint, Prettier
  🐍 Python: flake8, black
  
📊 Node.js Results:
  ✅ ESLint: 0 issues
  ⚠️  Prettier: 2 formatting issues
  
📊 Python Results:
  ✅ flake8: 0 style issues
  ✅ black: Formatting compliant
  
📈 Overall Quality Score: 92/100
```

#### Issue Details and Fixes
```
❌ Quality Issues Found:

📋 Linting Issues (3):
  • line 15: Missing semicolon
  • line 28: Unused variable 'temp'
  • line 42: Inconsistent indentation

🎨 Formatting Issues (2):
  • line 8: Line too long (95 > 80 characters)
  • line 33: Missing trailing comma

🔧 Suggested Fixes:
  • Run: npm run lint -- --fix
  • Run: npm run format
  • Configure: .eslintrc.js max-len rule
```

### Performance Optimization

#### Fast Quality Checking
- **Tool availability caching**: <20ms per tool check
- **File pattern optimization**: Smart file discovery
- **Parallel execution**: Multiple quality tools simultaneously
- **Incremental checking**: Only changed files

#### Efficient Resource Usage
- **Memory management**: Minimal overhead during execution
- **Process optimization**: Efficient tool invocation
- **Output streaming**: Real-time quality feedback
- **Selective scanning**: Focus on relevant files only

### Security Considerations

#### Safe Quality Tool Execution
- **Controlled commands**: Only allow approved quality tools
- **Path validation**: Validate all file path inputs
- **Configuration safety**: Secure quality tool configuration
- **Output sanitization**: Clean tool output for display

#### Quality Tool Verification
- **Tool authentication**: Verify quality tool signatures
- **Version validation**: Ensure compatible tool versions
- **Configuration validation**: Validate tool configuration files
- **Safe defaults**: Secure fallback behaviors

### Integration Patterns

#### With Testing Pattern
```bash
# Quality validation before testing
/quality-check "."
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Quality checks passed, running tests"
    /test-runner "."
else
    /error-handler "error" "Quality issues found, fix before testing"
fi
```

#### With Error Handling Pattern
```bash
# Comprehensive validation workflow
/error-handler "info" "Starting comprehensive validation"
/quality-check "."
/test-runner "."
/error-handler "info" "Validation workflow completed"
```

#### With CI/CD Integration
```bash
# In automated pipelines
/error-handler "info" "Starting CI quality validation"
/quality-check "full"
/error-handler "info" "Quality validation completed"
```

### Configuration Options

#### Environment Variables
```bash
QUALITY_STRICT=true       # Strict quality enforcement
QUALITY_AUTO_FIX=false    # Disable automatic fixes
QUALITY_TIMEOUT=300       # Quality check timeout
QUALITY_PARALLEL=true     # Enable parallel execution
```

#### Project Configuration
```bash
# .qualityrc configuration file support
QUALITY_TOOLS="eslint,prettier"
QUALITY_EXCLUDE="node_modules/**,dist/**"
QUALITY_THRESHOLD=90
FORMAT_ON_SAVE=true
```

#### Tool Configuration Integration
```bash
# Respect existing tool configurations
- .eslintrc.js, .prettierrc (Node.js)
- .flake8, pyproject.toml (Python)
- .editorconfig (Generic)
- Cargo.toml [tool.rustfmt] (Rust)
```

## Success Indicators

- ✅ **Accurate Detection**: Correctly identifies project languages and tools
- ✅ **Comprehensive Validation**: Multi-faceted quality checking
- ✅ **Actionable Reports**: Clear issue identification and fix suggestions
- ✅ **Tool Integration**: Seamless quality tool orchestration
- ✅ **Performance**: Fast execution with efficient resource usage
- ✅ **Security**: Safe quality tool execution and configuration
- ✅ **Integration**: Works well with other development patterns

The quality checker provides intelligent, comprehensive quality validation that maintains professional code standards while offering clear guidance for improvement across multiple programming languages and project types.