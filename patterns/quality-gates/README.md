# Quality Gates Patterns

**Technical:** Multi-language code quality validation patterns that detect project types and run appropriate linting, formatting, and standards checking with configurable quality thresholds.

**Simple:** Like having a quality inspector that knows how to check different types of projects and ensures your code meets professional standards before it goes out.

**Connection:** These patterns teach code quality management concepts that are essential for maintaining large codebases, team collaboration, and professional software development.

## ✅ Available Patterns

### quality-check.sh

**Purpose:** Multi-language quality validation with automatic project detection

**Functions:**
- `detect_quality_project()` - Identifies project type (nodejs, python, golang, rust, generic)
- `run_language_quality()` - Executes language-specific quality tools
- `check_common_issues()` - Checks for universal quality issues (whitespace, file size)
- `run_quality_checks()` - Main function with comprehensive quality validation

**Supported Languages:**
- **Node.js** - Detects `package.json`/`.eslintrc`, runs ESLint
- **Python** - Detects `requirements.txt`/`pyproject.toml`, runs flake8
- **Go** - Detects `go.mod`, runs `go fmt`
- **Rust** - Detects `Cargo.toml`, runs `cargo fmt`
- **Generic** - Falls back to EditorConfig and common checks

**Quality Checks:**
- Language-specific linting and formatting
- Trailing whitespace detection
- Large file identification (>300 lines)
- Configuration file validation

**Line Count:** 48 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/quality-gates/quality-check.sh

# Check project type
project_type=$(detect_quality_project)
echo "Detected project type: $project_type"

# Run all quality checks
if run_quality_checks; then
    echo "Quality validation passed! ✅"
else
    echo "Quality issues need attention ❌"
    exit 1
fi

# Run specific quality functions
run_language_quality
check_common_issues
```

## 🔧 Pattern Composition

### With Error Handling
```bash
source patterns/error-handling/simple-error-handling.sh
source patterns/quality-gates/quality-check.sh

validate_code_quality() {
    log_info "Starting code quality validation"
    
    if run_quality_checks; then
        log_info "All quality checks passed ✅"
    else
        log_error "Quality validation failed"
        handle_error $LINENO "Code quality standards not met"
    fi
}
```

### With Testing
```bash
source patterns/testing/simple-test-runner.sh
source patterns/quality-gates/quality-check.sh

full_validation() {
    echo "Running comprehensive validation..."
    
    # First quality checks
    run_quality_checks || return 1
    
    # Then tests
    run_all_tests || return 1
    
    echo "✅ Full validation passed"
}
```

### Pre-commit Hook Integration
```bash
#!/bin/bash
# .git/hooks/pre-commit
source patterns/quality-gates/quality-check.sh

run_quality_checks || {
    echo "❌ Quality checks failed - commit rejected"
    echo "Fix quality issues and try again"
    exit 1
}
```

## 🛡️ Security Considerations

- **Safe Command Execution:** Only runs known, safe quality tools
- **Input Validation:** File operations use secure bash patterns
- **No Code Injection:** No dynamic command construction or eval usage
- **Tool Availability:** Graceful handling when quality tools are not installed

## 🎓 Educational Value

### Concepts Taught
- **Code Quality Management:** Systematic approach to maintaining code standards
- **Multi-Language Tooling:** Understanding different language ecosystems
- **Static Analysis:** Automated code review and issue detection
- **Development Standards:** Professional software development practices
- **Tool Integration:** Combining multiple quality tools into unified workflows

### Transferable Skills
- **CI/CD Pipelines:** Foundation for automated quality gates in pipelines
- **Team Development:** Establishing consistent standards across team members
- **Professional Standards:** Industry-standard quality practices
- **Tool Configuration:** Setting up and maintaining development tools

## 🧪 Testing Examples

### Node.js Project Quality
```bash
# Create Node.js project with quality issues
echo '{"scripts":{"lint":"eslint ."}}' > package.json
echo 'console.log("hello");   ' > app.js  # trailing whitespace

source patterns/quality-gates/quality-check.sh
detect_quality_project    # Returns: nodejs
run_quality_checks       # Detects issues and suggests fixes
```

### Python Project Quality
```bash
# Create Python project
echo "flake8" > requirements.txt
echo 'print("hello")   ' > main.py  # trailing whitespace

source patterns/quality-gates/quality-check.sh
detect_quality_project    # Returns: python
run_quality_checks       # Runs flake8 if available
```

### Generic Project Quality
```bash
# Any project with EditorConfig
echo "[*]" > .editorconfig
echo "indent_style = space" >> .editorconfig

source patterns/quality-gates/quality-check.sh
detect_quality_project    # Returns: generic
run_quality_checks       # Validates common issues
```

## 🔧 Customization

### Adding New Languages
To support additional languages, extend the detection and quality functions:

```bash
# In detect_quality_project()
[[ -f "composer.json" ]] && echo "php" && return

# In run_language_quality()
"php") command -v phpcs >/dev/null && phpcs . || echo "phpcs not available" ;;
```

### Custom Quality Thresholds
Modify quality checks for your team's standards:

```bash
# Adjust file size threshold
awk '$1 > 500 {print "⚠️ Large file: " $2}'  # 500 lines instead of 300

# Add custom checks
grep -r "TODO" . && echo "⚠️ TODO comments found"
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Quality tools not found
**Solution:** Install language-specific tools (eslint, flake8, etc.)

**Issue:** Too many warnings
**Solution:** Adjust thresholds or add configuration files

**Issue:** False positives
**Solution:** Add project-specific ignore patterns

### Tool Installation Guides

**Node.js:**
```bash
npm install -g eslint prettier
```

**Python:**
```bash
pip install flake8 black
```

**Go:**
```bash
go install golang.org/x/lint/golint@latest
```

**Rust:**
```bash
rustup component add rustfmt clippy
```

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with safe command execution  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

## 🎯 Quality Standards Enforced

### Code Formatting
- Consistent indentation and spacing
- Proper line endings
- No trailing whitespace

### Code Structure
- File size limits for maintainability
- Function complexity guidelines
- Import organization

### Language Standards
- Linting rules enforcement
- Style guide compliance
- Best practice validation

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux)  
**Dependencies:** Language-specific tools (optional)  
**Line Count:** 48 lines  
**Claude Comprehension:** Optimized ✅