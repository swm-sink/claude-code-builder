# Project Validation Patterns

**Technical:** Project structure analysis and validation system with architecture detection, health scoring, and compliance checking for development best practices.

**Simple:** Like having a quality inspector that looks at your project and tells you if everything is organized properly and follows good practices.

**Connection:** These patterns teach project architecture analysis concepts essential for maintaining large codebases, onboarding new team members, and ensuring project health.

## 📊 Available Patterns

### project-validator.sh

**Purpose:** Comprehensive project structure validation and health assessment

**Functions:**
- `validate_project_structure()` - Core validation with health scoring (0-5 scale)
- `detect_project_architecture()` - Identifies project type (nodejs, python, golang, rust, etc.)
- `project_health_check()` - User-friendly health assessment with color-coded results
- `has_good_structure()` - Boolean check for automation workflows

**Validation Criteria:**
- **README Presence** - Documentation entry point (README.md)
- **Version Control** - Git repository initialization (.git directory)
- **Dependency Management** - Language-specific dependency files (package.json, requirements.txt, go.mod)
- **Source Organization** - Proper source code structure (src/, lib/ directories)
- **Testing Infrastructure** - Test directory presence (test/, tests/ directories)

**Health Scoring:**
- **🟢 Excellent (0-1 missing)** - Professional project structure
- **🟡 Good (2-3 missing)** - Acceptable with room for improvement
- **🔴 Needs Improvement (4+ missing)** - Requires structural attention

**Line Count:** 49 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/project-validation/project-validator.sh

# Run full project validation
validate_project_structure .

# Quick health check
project_health_check .

# Check project architecture
project_type=$(detect_project_architecture .)
echo "Project type: $project_type"

# Boolean check for automation
if has_good_structure .; then
    echo "✅ Project structure meets standards"
else
    echo "❌ Project structure needs improvement"
    validate_project_structure .  # Show detailed issues
fi
```

## 🔧 Pattern Composition

### With Quality Gates
```bash
source patterns/project-validation/project-validator.sh
source patterns/quality-gates/quality-check.sh

comprehensive_project_audit() {
    echo "🔍 Running comprehensive project audit..."
    
    # Structure validation first
    if ! has_good_structure .; then
        echo "❌ Project structure validation failed"
        validate_project_structure .
        return 1
    fi
    
    # Then code quality
    run_quality_checks || return 1
    
    echo "✅ Project audit completed successfully"
}
```

### With Security Scanning
```bash
source patterns/project-validation/project-validator.sh
source patterns/security/security-basics.sh

secure_project_validation() {
    echo "🛡️ Running secure project validation..."
    
    # Check structure
    project_health_check .
    
    # Check security
    basic_security_scan .
    
    echo "✅ Secure validation completed"
}
```

### CI/CD Integration
```bash
source patterns/project-validation/project-validator.sh

ci_project_validation() {
    echo "🚀 CI/CD Project Validation"
    
    if ! has_good_structure .; then
        echo "::error::Project structure validation failed"
        validate_project_structure .
        exit 1
    fi
    
    echo "::notice::Project structure validation passed"
    project_health_check .
}
```

## 🛡️ Security Considerations

- **Safe File Operations:** Only reads files and directories, never modifies
- **Path Validation:** Secure handling of directory paths and file checks
- **No Code Execution:** Purely structural analysis without code evaluation
- **Resource Bounded:** Limited directory traversal depth for performance

## 🎓 Educational Value

### Concepts Taught
- **Project Architecture:** Understanding standard project layouts across languages
- **Development Standards:** Industry best practices for project organization
- **Quality Assessment:** Systematic approach to evaluating project health
- **Automation Integration:** Building validation into development workflows
- **Cross-Language Patterns:** Universal project organization principles

### Transferable Skills
- **Code Review Skills:** Systematic approach to evaluating project quality
- **Team Onboarding:** Helping new developers understand project structure
- **Process Automation:** Integrating validation into CI/CD pipelines
- **Quality Management:** Establishing and maintaining development standards

## 🧪 Testing Examples

### Node.js Project Validation
```bash
# Create Node.js project structure
mkdir nodejs-test && cd nodejs-test
echo '{"name": "test"}' > package.json
echo "# Test Project" > README.md
mkdir src tests
git init

source patterns/project-validation/project-validator.sh
validate_project_structure .
# Expected: 5/5 score (Excellent)
```

### Python Project Validation
```bash
# Create Python project structure
mkdir python-test && cd python-test
echo "flask==2.0.0" > requirements.txt
echo "# Python Test" > README.md
mkdir src tests
git init

source patterns/project-validation/project-validator.sh
project_health_check .
# Expected: 🟢 Excellent project structure
```

### Incomplete Project Test
```bash
# Create minimal project
mkdir minimal-test && cd minimal-test
touch app.py

source patterns/project-validation/project-validator.sh
validate_project_structure .
# Expected: Low score, missing README, Git, dependencies, structure
```

## 🚀 Advanced Usage

### Custom Validation Rules
```bash
# Extend validation for specific requirements
validate_enterprise_project() {
    local project_dir="${1:-.}"
    
    # Standard validation
    has_good_structure "$project_dir" || return 1
    
    # Enterprise-specific checks
    [[ -f "$project_dir/CHANGELOG.md" ]] || { echo "❌ Missing CHANGELOG.md"; return 1; }
    [[ -f "$project_dir/CONTRIBUTING.md" ]] || { echo "❌ Missing CONTRIBUTING.md"; return 1; }
    [[ -d "$project_dir/.github" ]] || { echo "❌ Missing GitHub templates"; return 1; }
    
    echo "✅ Enterprise validation passed"
}
```

### Team Standards Enforcement
```bash
# Team-specific project standards
validate_team_standards() {
    local project_dir="${1:-.}"
    local team_score=0
    
    echo "👥 Validating team standards..."
    
    # Core structure (use existing function)
    validate_project_structure "$project_dir" >/dev/null
    local core_score=$((5 - $?))
    
    # Team-specific requirements
    [[ -f "$project_dir/.eslintrc" || -f "$project_dir/.flake8" ]] && ((team_score++)) && echo "✅ Linting config found"
    [[ -f "$project_dir/.prettierrc" || -f "$project_dir/.editorconfig" ]] && ((team_score++)) && echo "✅ Formatting config found"
    [[ -d "$project_dir/.vscode" ]] && ((team_score++)) && echo "✅ VS Code settings found"
    
    local total_score=$((core_score + team_score))
    echo "📊 Team standards score: $total_score/8"
}
```

### Multi-Project Validation
```bash
# Validate multiple projects
validate_workspace() {
    local workspace_dir="${1:-.}"
    echo "🏢 Validating workspace: $workspace_dir"
    
    find "$workspace_dir" -maxdepth 2 -name "package.json" -o -name "requirements.txt" -o -name "go.mod" | \
    while read -r manifest; do
        local project_dir
        project_dir=$(dirname "$manifest")
        echo "📁 Validating: $project_dir"
        project_health_check "$project_dir"
        echo "---"
    done
}
```

## 🔧 Customization

### Project Type Extensions
```bash
# Add support for new project types
detect_extended_architecture() {
    local project_dir="${1:-.}"
    
    # Use existing detection first
    local arch
    arch=$(detect_project_architecture "$project_dir")
    [[ "$arch" != "unknown" ]] && echo "$arch" && return
    
    # Extended detection
    [[ -f "$project_dir/composer.json" ]] && echo "php" && return
    [[ -f "$project_dir/Gemfile" ]] && echo "ruby" && return
    [[ -f "$project_dir/mix.exs" ]] && echo "elixir" && return
    [[ -f "$project_dir/pubspec.yaml" ]] && echo "dart" && return
    echo "unknown"
}
```

### Custom Scoring Weights
```bash
# Weighted scoring for different project types
calculate_weighted_score() {
    local project_dir="${1:-.}"
    local project_type
    project_type=$(detect_project_architecture "$project_dir")
    
    local weights=""
    case "$project_type" in
        "nodejs") weights="2 2 3 2 1" ;;  # Heavy weight on dependencies
        "python") weights="2 1 3 2 2" ;;  # Heavy weight on dependencies
        "golang") weights="1 2 2 3 2" ;;  # Heavy weight on source structure
        *) weights="2 2 2 2 2" ;;         # Equal weights
    esac
    
    echo "Weighted scoring for $project_type: $weights"
}
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Project type not detected
**Solution:** Add project-specific files (package.json, requirements.txt, etc.)

**Issue:** False negatives on source directories
**Solution:** Use standard directory names (src/, lib/, app/)

**Issue:** Low scores on valid projects
**Solution:** Review validation criteria and add missing standard files

### Validation Debugging
```bash
# Debug validation step by step
debug_validation() {
    local project_dir="${1:-.}"
    echo "🐛 Debug validation for: $project_dir"
    
    echo "📁 Directory contents:"
    ls -la "$project_dir"
    
    echo "🔍 Architecture detection:"
    detect_project_architecture "$project_dir"
    
    echo "📊 Detailed validation:"
    validate_project_structure "$project_dir"
}
```

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with safe file operations  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

## 🎯 Project Health Metrics

### Structure Quality Indicators
- **Documentation Presence** - README for project understanding
- **Version Control** - Git for change tracking and collaboration
- **Dependency Management** - Proper package management
- **Source Organization** - Logical code organization
- **Testing Infrastructure** - Quality assurance setup

### Best Practices Enforced
- **Consistent Structure** - Predictable project layout
- **Documentation Standards** - Clear project communication
- **Development Workflow** - Proper tooling setup
- **Quality Assurance** - Testing infrastructure
- **Team Collaboration** - Version control and standards

### Integration Benefits
- **Faster Onboarding** - New developers understand projects quickly
- **Consistent Quality** - Standardized project organization
- **Automated Validation** - CI/CD integration for quality gates
- **Technical Debt Prevention** - Early detection of structural issues

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux)  
**Dependencies:** Standard Unix tools (find, ls)  
**Line Count:** 49 lines  
**Claude Comprehension:** Optimized ✅