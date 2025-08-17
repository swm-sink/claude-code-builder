# Git Hooks Patterns

**Technical:** Automated Git hooks installation and management system with pre-commit and pre-push validation, conflict detection, and easy setup for development teams.

**Simple:** Like having an assistant that automatically sets up quality checks to run every time you save or share your code changes.

**Connection:** These patterns teach Git automation concepts essential for maintaining code quality, implementing continuous integration workflows, and establishing development standards.

## 🪝 Available Patterns

### git-hooks-setup.sh

**Purpose:** Easy installation and management of Git hooks for quality assurance

**Functions:**
- `install_pre_commit_hook()` - Sets up pre-commit validation (conflict markers, large files)
- `install_pre_push_hook()` - Sets up pre-push validation (branch protection warnings)
- `setup_git_hooks()` - Complete hooks installation in one command
- `has_git_hooks()` - Check if hooks are already installed
- `remove_git_hooks()` - Clean removal of installed hooks

**Pre-commit Validations:**
- **Merge Conflict Detection** - Blocks commits with unresolved conflict markers
- **Large File Detection** - Warns about files >1MB that might slow down repository
- **Basic Validation** - Ensures commit integrity before submission

**Pre-push Validations:**
- **Protected Branch Warnings** - Alerts when pushing to main/master branches
- **Push Safety** - Basic validation before code reaches remote repository

**Line Count:** 46 lines (Claude-optimized)

## 🎯 Quick Start

```bash
# Source the pattern
source patterns/git-hooks/git-hooks-setup.sh

# Set up all hooks in one command
setup_git_hooks

# Or install hooks individually
install_pre_commit_hook
install_pre_push_hook

# Check if hooks are installed
if has_git_hooks; then
    echo "✅ Git hooks are active"
else
    echo "❌ No git hooks found"
fi

# Remove hooks if needed
remove_git_hooks
```

## 🔧 Pattern Composition

### With Security Scanning
```bash
source patterns/git-hooks/git-hooks-setup.sh
source patterns/security/security-basics.sh

# Enhanced pre-commit with security
install_secure_pre_commit() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    echo '#!/bin/bash
source patterns/security/security-basics.sh
echo "🔍 Running security pre-commit validation..."
has_security_issues && echo "🚨 Security issues detected" && exit 1
echo "✅ Security validation passed"' > "$git_dir/hooks/pre-commit"
    
    chmod +x "$git_dir/hooks/pre-commit"
}
```

### With Quality Gates
```bash
source patterns/git-hooks/git-hooks-setup.sh
source patterns/quality-gates/quality-check.sh

# Enhanced pre-commit with quality checks
install_quality_pre_commit() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    echo '#!/bin/bash
source patterns/quality-gates/quality-check.sh
echo "🔍 Running quality pre-commit validation..."
run_quality_checks || exit 1
echo "✅ Quality validation passed"' > "$git_dir/hooks/pre-commit"
    
    chmod +x "$git_dir/hooks/pre-commit"
}
```

### With Testing
```bash
source patterns/git-hooks/git-hooks-setup.sh
source patterns/testing/simple-test-runner.sh

# Enhanced pre-push with testing
install_test_pre_push() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    echo '#!/bin/bash
source patterns/testing/simple-test-runner.sh
echo "🧪 Running tests before push..."
has_tests && run_all_tests || echo "⚠️ No tests found"
echo "✅ Test validation completed"' > "$git_dir/hooks/pre-push"
    
    chmod +x "$git_dir/hooks/pre-push"
}
```

## 🛡️ Security Considerations

- **Safe Hook Installation:** Only writes to `.git/hooks/` directory
- **Permission Management:** Properly sets executable permissions
- **Repository Validation:** Ensures running in valid Git repository
- **Clean Removal:** Safe hook removal without repository damage
- **No Code Injection:** Static hook content with no dynamic evaluation

## 🎓 Educational Value

### Concepts Taught
- **Git Hooks Automation:** Understanding Git's hook system and lifecycle
- **Quality Gate Implementation:** Preventing problematic code from entering repository
- **Development Workflow:** Establishing consistent team development practices
- **Conflict Prevention:** Early detection of merge conflicts and issues
- **CI/CD Foundation:** Building blocks for continuous integration pipelines

### Transferable Skills
- **DevOps Pipeline Design:** Foundation for automated testing and deployment
- **Team Collaboration:** Establishing shared code quality standards
- **Process Automation:** Reducing manual validation and human error
- **Git Workflow Management:** Advanced Git usage and repository management

## 🧪 Testing Examples

### Basic Installation Test
```bash
# Test in a Git repository
cd /path/to/git/repo
source patterns/git-hooks/git-hooks-setup.sh

# Install and verify
setup_git_hooks
has_git_hooks && echo "✅ Installation successful"

# Check hook files exist
ls -la .git/hooks/pre-*
```

### Pre-commit Hook Testing
```bash
# Create a file with conflict markers
echo "<<<<<<< HEAD" > conflict-test.txt
echo "some content" >> conflict-test.txt
echo "=======" >> conflict-test.txt
echo "other content" >> conflict-test.txt
echo ">>>>>>> branch" >> conflict-test.txt

# Try to commit (should fail)
git add conflict-test.txt
git commit -m "test conflict detection"
# Expected: ❌ Merge conflict markers detected
```

### Large File Detection Test
```bash
# Create a large test file
dd if=/dev/zero of=large-file.bin bs=1M count=2

# Try to commit (should warn)
git add large-file.bin
git commit -m "test large file detection"
# Expected: ⚠️ Large file: large-file.bin
```

### Pre-push Hook Testing
```bash
# Test push to main branch
git checkout main
echo "test" > test-file.txt
git add test-file.txt
git commit -m "test push protection"
git push origin main
# Expected: ⚠️ Pushing to: main
```

## 🚀 Advanced Usage

### Custom Hook Integration
```bash
# Add custom validation to existing hooks
enhance_pre_commit_hook() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    # Backup existing hook
    [[ -f "$git_dir/hooks/pre-commit" ]] && cp "$git_dir/hooks/pre-commit" "$git_dir/hooks/pre-commit.backup"
    
    # Add custom validation
    echo "# Custom validation" >> "$git_dir/hooks/pre-commit"
    echo "echo '🔧 Running custom checks...'" >> "$git_dir/hooks/pre-commit"
}
```

### Team Configuration
```bash
# Team-wide hook setup script
setup_team_hooks() {
    echo "🏢 Setting up team development hooks..."
    
    # Standard hooks
    setup_git_hooks
    
    # Team-specific validations
    install_secure_pre_commit
    install_quality_pre_commit
    install_test_pre_push
    
    echo "✅ Team hooks configured"
}
```

### CI/CD Integration
```bash
# Verify hooks in CI environment
validate_hooks_in_ci() {
    if ! has_git_hooks; then
        echo "❌ Git hooks not found in CI environment"
        echo "Please ensure hooks are committed or installed in CI setup"
        exit 1
    fi
    
    echo "✅ Git hooks validated in CI"
}
```

## 🔧 Customization

### Hook Templates
```bash
# Create custom hook templates
create_hook_template() {
    local hook_name="$1"
    local template_content="$2"
    
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    echo "#!/bin/bash" > "$git_dir/hooks/$hook_name"
    echo "# Custom $hook_name hook" >> "$git_dir/hooks/$hook_name"
    echo "$template_content" >> "$git_dir/hooks/$hook_name"
    chmod +x "$git_dir/hooks/$hook_name"
}

# Usage example
create_hook_template "commit-msg" 'echo "📝 Validating commit message..."'
```

### Project-Specific Configuration
```bash
# Load project-specific hook configuration
load_hook_config() {
    [[ -f ".git-hooks-config" ]] && source ".git-hooks-config"
    
    # Default settings
    ENABLE_LARGE_FILE_CHECK=${ENABLE_LARGE_FILE_CHECK:-true}
    LARGE_FILE_THRESHOLD=${LARGE_FILE_THRESHOLD:-1048576}
    PROTECTED_BRANCHES=${PROTECTED_BRANCHES:-"main master"}
}
```

### Hook Debugging
```bash
# Debug hook execution
debug_hook() {
    local hook_name="$1"
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    echo "🐛 Debugging $hook_name hook..."
    
    if [[ -x "$git_dir/hooks/$hook_name" ]]; then
        echo "✅ Hook exists and is executable"
        echo "📄 Hook content:"
        cat "$git_dir/hooks/$hook_name"
    else
        echo "❌ Hook not found or not executable"
    fi
}
```

## 🔍 Troubleshooting

### Common Issues

**Issue:** Hooks not executing
**Solution:** Ensure hooks are executable: `chmod +x .git/hooks/pre-commit`

**Issue:** Repository not detected
**Solution:** Run commands from within Git repository root

**Issue:** Existing hooks overwritten
**Solution:** Backup existing hooks before installation

**Issue:** Hooks too restrictive
**Solution:** Customize validation logic or temporarily disable specific checks

### Hook Management
```bash
# Backup existing hooks
backup_hooks() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    local backup_dir="$git_dir/hooks-backup-$(date +%Y%m%d)"
    mkdir -p "$backup_dir"
    cp "$git_dir/hooks/"* "$backup_dir/" 2>/dev/null || true
    echo "📦 Hooks backed up to: $backup_dir"
}

# Restore hooks from backup
restore_hooks() {
    local backup_dir="$1"
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    
    [[ -d "$backup_dir" ]] && cp "$backup_dir/"* "$git_dir/hooks/" && echo "✅ Hooks restored"
}
```

## 📋 Pattern Standards

✅ **Under 50 lines** for Claude comprehension  
✅ **Dual explanations** (Technical/Simple/Connection)  
✅ **Bash 3.x compatible** for macOS support  
✅ **Security validated** with safe file operations  
✅ **Educational focus** with transferable concepts  
✅ **Composition ready** for use with other patterns  

## 🎯 Git Workflow Integration

### Development Workflow
1. **Developer commits** → Pre-commit hook validates code quality
2. **Developer pushes** → Pre-push hook checks branch protection
3. **CI system receives** → Validated, high-quality code changes
4. **Team maintains** → Consistent code standards automatically

### Quality Assurance
- **Merge Conflict Prevention** - Catches conflicts before they reach remote
- **Large File Management** - Prevents repository bloat
- **Branch Protection** - Awareness of sensitive branch operations
- **Team Standards** - Automated enforcement of coding standards

### Continuous Integration
- **Pre-validation** - Issues caught before CI runs
- **Faster CI** - Fewer failed builds due to basic issues
- **Cost Reduction** - Less CI compute time on problematic code
- **Quality Metrics** - Consistent quality measurement

---

**Pattern Version:** 1.0  
**Compatibility:** Bash 3.2+ (macOS/Linux), Git 2.0+  
**Dependencies:** Git repository  
**Line Count:** 46 lines  
**Claude Comprehension:** Optimized ✅