# Pattern Composition Guide 🧩

**Technical:** Comprehensive guide for combining Claude Code Builder patterns into powerful, integrated workflows with best practices for pattern orchestration and anti-pattern avoidance.

**Simple:** Like learning to combine LEGO blocks - each pattern is a building block that works great alone, but when you connect them thoughtfully, you create something much more powerful.

**Connection:** Teaches modular design and composition patterns essential for building maintainable, scalable development workflows.

---

## 🎯 Composition Principles

### Core Composition Rules
1. **Load Order Independence**: Patterns should work regardless of loading order
2. **No Global Pollution**: Each pattern manages its own namespace  
3. **Graceful Degradation**: Missing patterns shouldn't break workflows
4. **Minimal Coupling**: Patterns interact through well-defined interfaces

### Pattern Compatibility Matrix

| Pattern | Error | Logging | Testing | Security | Git | Quality | Config | Deps |
|---------|-------|---------|---------|----------|-----|---------|--------|------|
| **Error** | ✅ | 🔗 | 🔗 | 🔗 | 🔗 | 🔗 | ⚠️ | ✅ |
| **Logging** | 🔗 | ✅ | 🔗 | 🔗 | 🔗 | 🔗 | ⚠️ | ✅ |
| **Testing** | 🔗 | 🔗 | ✅ | 🔗 | ⚠️ | 🔗 | ✅ | 🔗 |
| **Security** | 🔗 | 🔗 | 🔗 | ✅ | 🔗 | 🔗 | ⚠️ | ✅ |
| **Git** | 🔗 | 🔗 | ⚠️ | 🔗 | ✅ | 🔗 | ✅ | ✅ |
| **Quality** | 🔗 | 🔗 | 🔗 | 🔗 | 🔗 | ✅ | ✅ | 🔗 |
| **Config** | ⚠️ | ⚠️ | ✅ | ⚠️ | ✅ | ✅ | ✅ | ✅ |
| **Deps** | ✅ | ✅ | 🔗 | ✅ | ✅ | ✅ | ✅ | ✅ |

**Legend**: ✅ Perfect harmony | 🔗 Enhanced together | ⚠️ Use with care

---

## 🏗️ Common Composition Patterns

### 1. Foundation Stack (Error + Logging)
**Use Case**: Basic development workflow with proper error handling and logging

```bash
#!/bin/bash
# Load foundation patterns
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh

# Enhanced error handling with logging
enhanced_error() {
    local line_number=$1
    local error_message="${2:-Unknown error}"
    
    log_error "Error on line $line_number: $error_message"
    handle_error $line_number
}

# Usage example
main() {
    log_info "Starting deployment process..."
    
    if ! deploy_application; then
        enhanced_error $LINENO "Deployment failed"
    fi
    
    log_info "Deployment completed successfully"
}
```

### 2. Quality Assurance Stack (Testing + Quality + Security)
**Use Case**: Comprehensive code validation before commits

```bash
#!/bin/bash
# Load quality patterns
source ./patterns/testing/simple-test-runner.sh
source ./patterns/quality-gates/quality-check.sh
source ./patterns/security/security-basics.sh
source ./patterns/error-handling/simple-error-handling.sh

# Comprehensive quality check
full_quality_check() {
    log_info "🔍 Running comprehensive quality checks..."
    
    local issues=0
    
    # Run tests
    if run_all_tests; then
        log_info "✅ All tests passed"
    else
        log_error "❌ Tests failed"
        ((issues++))
    fi
    
    # Check code quality
    if run_quality_checks; then
        log_info "✅ Quality checks passed"
    else
        log_error "❌ Quality issues found"
        ((issues++))
    fi
    
    # Security scan
    if basic_security_scan .; then
        log_info "✅ Security scan passed"
    else
        log_error "❌ Security issues found"
        ((issues++))
    fi
    
    if [ $issues -eq 0 ]; then
        log_info "🎉 All quality checks passed - ready for commit!"
        return 0
    else
        log_error "💥 $issues issue(s) found - please fix before committing"
        return 1
    fi
}
```

### 3. Development Setup Stack (Deps + Config + Project Validation)
**Use Case**: Intelligent project setup and environment validation

```bash
#!/bin/bash
# Load setup patterns
source ./patterns/dependencies/dependency-checker.sh
source ./patterns/configuration/config-reader.sh
source ./patterns/project-validation/project-validator.sh
source ./patterns/error-handling/simple-error-handling.sh

# Smart project setup
smart_setup() {
    local project_dir="${1:-.}"
    
    log_info "🔧 Setting up development environment..."
    
    # Detect project type
    local project_type=$(detect_project_type "$project_dir")
    log_info "📋 Detected project type: $project_type"
    
    # Check dependencies
    if check_dependencies "$project_dir"; then
        log_info "✅ All dependencies satisfied"
    else
        log_warn "⚠️  Missing dependencies detected"
        local install_cmd=$(get_install_cmd "$project_dir")
        log_info "💡 Install with: $install_cmd"
    fi
    
    # Validate project health
    if project_health_check "$project_dir"; then
        log_info "✅ Project structure looks good"
    else
        log_warn "⚠️  Project structure could be improved"
    fi
    
    # Load project configuration
    if has_config "$project_dir/.env"; then
        log_info "✅ Configuration file found"
        local env_mode=$(get_config "NODE_ENV" "$project_dir/.env" "development")
        log_info "📋 Environment: $env_mode"
    fi
}
```

### 4. Git Workflow Stack (Git + Error + Quality)
**Use Case**: Automated git hooks with quality gates

```bash
#!/bin/bash
# Load git workflow patterns
source ./patterns/git-hooks/git-hooks-setup.sh
source ./patterns/quality-gates/quality-check.sh
source ./patterns/error-handling/simple-error-handling.sh

# Pre-commit validation
pre_commit_validation() {
    log_info "🔍 Running pre-commit validation..."
    
    # Check for staged changes
    if ! git diff --cached --quiet; then
        log_info "📝 Staged changes detected"
        
        # Run quality checks on staged files
        if run_quality_checks; then
            log_info "✅ Quality checks passed"
            return 0
        else
            log_error "❌ Quality checks failed - commit blocked"
            return 1
        fi
    else
        log_warn "⚠️  No staged changes found"
        return 1
    fi
}
```

---

## ⚠️ Anti-Patterns to Avoid

### 1. Pattern Pollution
**❌ Wrong:**
```bash
# Don't modify patterns directly
source ./patterns/error-handling/simple-error-handling.sh
log_info() {
    # Overriding pattern function - BAD!
    echo "CUSTOM: $*"
}
```

**✅ Right:**
```bash
# Create your own wrapper functions
source ./patterns/error-handling/simple-error-handling.sh
custom_log() {
    log_info "CUSTOM: $*"
}
```

### 2. Tight Coupling
**❌ Wrong:**
```bash
# Pattern A depending on Pattern B's internals
source ./patterns/testing/simple-test-runner.sh
my_function() {
    # Directly accessing internal variables - BAD!
    echo "Tests run: $tests_run"
}
```

**✅ Right:**
```bash
# Use public interfaces only
source ./patterns/testing/simple-test-runner.sh
my_function() {
    if run_all_tests; then
        echo "Tests completed successfully"
    fi
}
```

### 3. Order Dependencies
**❌ Wrong:**
```bash
# Functions that only work with specific loading order
source ./patterns/error-handling/simple-error-handling.sh
# This breaks if logging is loaded after error handling
log_error "This might not work"
source ./patterns/logging/simple-logging.sh
```

**✅ Right:**
```bash
# Load all patterns first, then use
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh

main() {
    log_error "This always works"
}
```

### 4. Global State Pollution
**❌ Wrong:**
```bash
# Setting global variables that conflict
DEBUG=1  # This might break other patterns
source ./patterns/logging/simple-logging.sh
```

**✅ Right:**
```bash
# Use pattern-specific configuration
source ./patterns/logging/simple-logging.sh
LOG_COLOR=false  # Pattern-specific setting
```

---

## 🎯 Best Practices

### 1. Loading Patterns
```bash
# Best practice loading with error handling
load_pattern() {
    local pattern="$1"
    if source "./patterns/$pattern" 2>/dev/null; then
        echo "✅ Loaded: $pattern"
    else
        echo "⚠️  Failed to load: $pattern"
        return 1
    fi
}

# Load patterns with validation
load_pattern "error-handling/simple-error-handling.sh"
load_pattern "logging/simple-logging.sh"
```

### 2. Pattern Discovery
```bash
# Automatically discover and load compatible patterns
discover_patterns() {
    local pattern_dir="./patterns"
    local loaded_patterns=()
    
    for pattern_file in "$pattern_dir"/*/*.sh; do
        if [[ -f "$pattern_file" && "$pattern_file" =~ simple-.*\.sh$ ]]; then
            local pattern_name=$(basename "$(dirname "$pattern_file")")
            if load_pattern "$pattern_name/$(basename "$pattern_file")"; then
                loaded_patterns+=("$pattern_name")
            fi
        fi
    done
    
    echo "🎉 Loaded ${#loaded_patterns[@]} patterns: ${loaded_patterns[*]}"
}
```

### 3. Feature Detection
```bash
# Check if specific pattern functions are available
has_pattern_function() {
    local function_name="$1"
    command -v "$function_name" >/dev/null 2>&1
}

# Conditional feature usage
enhanced_workflow() {
    if has_pattern_function "log_info"; then
        log_info "Enhanced logging available"
    else
        echo "Basic logging: Enhanced logging available"
    fi
    
    if has_pattern_function "run_security_scan"; then
        run_security_scan .
    else
        echo "⚠️  Security scan not available"
    fi
}
```

---

## 📚 Real-World Examples

### Complete Development Workflow
```bash
#!/bin/bash
# Complete development workflow with all patterns

# Load all necessary patterns
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/logging/simple-logging.sh
source ./patterns/dependencies/dependency-checker.sh
source ./patterns/testing/simple-test-runner.sh
source ./patterns/quality-gates/quality-check.sh
source ./patterns/security/security-basics.sh

# Main development workflow
dev_workflow() {
    local project_dir="${1:-.}"
    
    log_info "🚀 Starting development workflow for: $project_dir"
    
    # 1. Environment setup
    if ! check_dependencies "$project_dir"; then
        log_error "❌ Dependencies not met"
        return 1
    fi
    
    # 2. Run tests
    if ! run_all_tests; then
        log_error "❌ Tests failed"
        return 1
    fi
    
    # 3. Quality checks
    if ! run_quality_checks; then
        log_error "❌ Quality checks failed"
        return 1
    fi
    
    # 4. Security scan
    if ! basic_security_scan "$project_dir"; then
        log_error "❌ Security issues found"
        return 1
    fi
    
    log_info "🎉 All checks passed - ready for deployment!"
    return 0
}

# Run the workflow
if ! dev_workflow "$@"; then
    handle_error $LINENO
fi
```

---

## 🔧 Debugging Compositions

### Pattern Health Check
```bash
# Check if all patterns are working correctly
pattern_health_check() {
    local patterns=("error-handling" "logging" "testing" "security")
    local healthy=0
    
    for pattern in "${patterns[@]}"; do
        if source "./patterns/$pattern/simple-$pattern.sh" 2>/dev/null; then
            echo "✅ $pattern: Healthy"
            ((healthy++))
        else
            echo "❌ $pattern: Failed to load"
        fi
    done
    
    echo "📊 Pattern Health: $healthy/${#patterns[@]} patterns healthy"
    [ $healthy -eq ${#patterns[@]} ]
}
```

### Composition Validation
```bash
# Validate pattern composition works correctly
validate_composition() {
    # Test basic composition
    if ! (source ./patterns/error-handling/simple-error-handling.sh && \
          source ./patterns/logging/simple-logging.sh && \
          log_info "Composition test"); then
        echo "❌ Basic composition failed"
        return 1
    fi
    
    echo "✅ Pattern composition working correctly"
    return 0
}
```

---

## 📖 Next Steps

1. **Start Simple**: Begin with Foundation Stack (Error + Logging)
2. **Add Gradually**: Introduce patterns one at a time
3. **Test Compositions**: Validate each combination works
4. **Document Usage**: Keep track of your successful patterns
5. **Share Discoveries**: Contribute your compositions back to the community

Happy composing! 🎼