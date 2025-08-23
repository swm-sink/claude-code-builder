# CLAUDE.md - Claude Code Builder AI Assistant Guide 🤖

> **This file optimizes Claude Code's understanding and assistance with claude-code-builder patterns**

## 🚫 META-PROMPTING ENFORCEMENT - MANDATORY WORKFLOW

**CRITICAL:** This project requires strict adherence to the meta-prompting development process. **NO CODE SHALL BE WRITTEN WITHOUT COMPLETING /plan FIRST.**

### 10-Step Execution Process (MANDATORY)

1. **Think & Analyze** - Deep analysis of current state and requirements
2. **Identify Impacts** - Second and third order consequences assessment
3. **Research & Validate** - Use `/research` if needed for knowledge gaps
4. **Plan & Design** - Use `/plan` (MANDATORY before any code)
5. **Decompose** - Use `/decompose` for complex tasks
6. **Implement with TDD** - Use `/implement-tdd` following RED-GREEN-REFACTOR
7. **Assess Quality** - Use `/assess` before any commits
8. **Validate Integration** - Use `/validate` for production readiness
9. **Commit Changes** - Use `/commit` with structured messages
10. **Retrospect & Learn** - Use `/retrospect` to capture insights

### Blocking Conditions
- 🚫 **Cannot write code without completing `/plan`**
- 🚫 **Cannot commit without `/assess` quality validation**
- 🚫 **Cannot deploy without `/validate` integration testing**
- 🚫 **Must think hard and prioritize accuracy throughout**
- 🚫 **Must assess second and third order impacts holistically**

### Enforcement Protocol
This aligns with the CLAUDE.md mandatory workflow while incorporating the user's emphasis on thorough thinking and impact analysis. All development work MUST follow this structured approach to ensure high quality, well-considered changes rather than superficial modifications.

## 🔒 MANDATORY PRE-PUSH VALIDATION - 50 STEPS

**ABSOLUTELY CRITICAL:** Before ANY git push to GitHub, ALL 50 validation steps in `.internal/checklists/PRE_PUSH_CHECKLIST.md` MUST be completed and verified.

### 🚫 BLOCKING CONDITIONS FOR GIT PUSH

- 🚫 **CANNOT PUSH without completing all 50 validation steps**
- 🚫 **CANNOT PUSH without running automated validation script**
- 🚫 **CANNOT PUSH if any validation check fails**
- 🚫 **CANNOT PUSH without documenting validation completion**
- 🚫 **CANNOT PUSH without PAT authentication from .env file**
- 🚫 **CANNOT use CLI git auth - MUST use .env PAT token**
- 🚫 **NO EXCEPTIONS** - Emergency fixes must follow emergency override protocol

## 🔐 MANDATORY PAT AUTHENTICATION - CRITICAL ENFORCEMENT

**ABSOLUTELY CRITICAL:** ALL GitHub operations MUST use Personal Access Token from .env file. CLI authentication is FORBIDDEN.

### 🚫 PAT ENFORCEMENT PROTOCOL

**BLOCKING CONDITIONS:**
- 🚫 **CANNOT perform git push without sourcing .env PAT**
- 🚫 **CANNOT use `git push` directly - MUST use PAT authentication**
- 🚫 **CANNOT rely on CLI git credentials**
- 🚫 **MUST verify PAT is loaded before ANY GitHub operation**

**MANDATORY PAT USAGE:**
```bash
# REQUIRED before ANY git operation
source .env
# Verify PAT is loaded
echo "Using PAT: ${GITHUB_TOKEN:0:8}..."
# Use PAT for authenticated operations
git remote set-url origin https://${GITHUB_TOKEN}@github.com/swm-sink/claude-code-builder.git
git push origin main
```

**ENFORCEMENT CONSEQUENCES:**
- 🚫 **ANY GitHub operation without PAT is FORBIDDEN**
- 🚫 **Must halt and demand PAT setup if .env missing**
- 🚫 **No fallback to CLI authentication permitted**

### 50-Step Validation Requirements

**Categories (5 checks each):**
1. **Pattern Integrity** - Size, format, naming, syntax, documentation
2. **Security Validation** - No dangerous commands, secrets, input validation
3. **Testing Coverage** - Pattern tests, integration, error recovery, load, edge cases
4. **Documentation** - README, API docs, changelogs, links
5. **Performance** - Loading speed, memory, execution, benchmarks
6. **Code Quality** - Readability scores, anti-patterns, shellcheck, style
7. **Error Handling** - Error paths, messages, line numbers, recovery
8. **Configuration** - No hardcoded values, environment docs, validation
9. **CI/CD Readiness** - Workflows, tests, Docker, cross-platform
10. **Project Hygiene** - No temp files, gitignore, conflicts, commits

### Validation Execution Protocol

**Step 1: Manual Review**
```bash
# Open and review .internal/checklists/PRE_PUSH_CHECKLIST.md
# Complete each of the 50 checks manually
# Document any issues found and resolved
```

**Step 2: Automated Validation**
```bash
# Run comprehensive validation script
./scripts/validate-pre-push.sh --verbose --strict

# Must return: "✅ ALL 50 CHECKS PASSED - READY FOR PUSH"
```

**Step 3: Final Verification**
```bash
# Confirm all checks passed
echo "Pre-push validation completed: $(date)" >> .validation-log
git add .validation-log
```

**Step 4: Authorized Push**
```bash
# Only after ALL validations pass
git push origin main
```

### Emergency Override Protocol

**ONLY for critical production fixes:**

1. Document override reason in commit message
2. Use format: `EMERGENCY OVERRIDE: [critical issue] - validation bypassed`
3. Create immediate follow-up issue to complete validation
4. Schedule emergency review within 24 hours

### Enforcement Consequences

**Violation of pre-push validation:**
- 🚫 Immediate rollback of changes
- 🚫 Requirement to complete full validation
- 🚫 Documentation of violation and remediation
- 🚫 Process review and strengthening

**This pre-push validation ensures:**
- Project integrity and quality
- Security and performance standards
- Documentation completeness
- Testing coverage
- Production readiness

## 📝 MANDATORY DOCUMENTATION UPDATE - PRE-PUSH ENFORCEMENT

**ABSOLUTELY CRITICAL:** When user says "push to github", the following documentation update workflow MUST be executed automatically.

### 🚫 Documentation Update Blocking Conditions

- 🚫 **CANNOT PUSH without running documentation update workflow**
- 🚫 **CANNOT PUSH if documentation is outdated or inaccurate**
- 🚫 **CANNOT PUSH without updating CHANGELOG.md**
- 🚫 **CANNOT PUSH if CLAUDE.md files are missing from any directory**
- 🚫 **CANNOT PUSH without validating all @file links work**

### Documentation Update Workflow (MANDATORY)

When user requests "push to github", execute these steps:

1. **Change Detection Phase**
   ```bash
   # Detect all changes since last commit
   git diff --name-only HEAD~1
   # Categorize changes: patterns, tools, scripts, docs
   # Identify affected documentation
   ```

2. **Documentation Update Phase**
   - **README.md** - Update if patterns/tools/major features changed
   - **CHANGELOG.md** - ALWAYS update with all changes
   - **Pattern READMEs** - Update if specific patterns modified
   - **ARCHITECTURE.md** - Update if structure changed
   - **Directory CLAUDE.md** - Update context for changed directories
   - **Migration guides** - Update if breaking changes

3. **CLAUDE.md Validation Phase**
   - Verify CLAUDE.md exists in every directory
   - Validate all @file links resolve correctly
   - Ensure context is complete and accurate
   - Check cross-references between CLAUDE.md files

4. **Report Generation Phase**
   ```bash
   # Generate validation report in JSON
   {
     "timestamp": "ISO-8601",
     "changes_detected": [...],
     "docs_updated": [...],
     "validation_status": "pass/fail",
     "claude_context": "complete/incomplete"
   }
   # Store in .system/reports/push-validation.json
   ```

5. **Final Push Execution**
   - Only proceed if all documentation updated
   - Include documentation updates in commit
   - Push with validation report

### Documentation Automation Commands

```bash
# These commands are invoked automatically on "push to github"
/detect-changes      # Identify what changed
/update-docs        # Update affected documentation
/validate-context   # Validate CLAUDE.md files
/generate-report    # Create validation report
/push-to-github    # Execute validated push
```

## 📄 MANDATORY FILE FORMAT ENFORCEMENT

**ABSOLUTELY CRITICAL:** File formats MUST be enforced to prevent MD proliferation and maintain clear data/documentation separation.

### 🚫 File Format Blocking Conditions

- 🚫 **CANNOT create MD files for reports, metrics, or data** - Use JSON
- 🚫 **CANNOT create MD files in .system/** - JSON only for system data
- 🚫 **CANNOT remove CLAUDE.md from any directory** - Required for context
- 🚫 **MUST convert existing MD reports to JSON** - Data belongs in JSON

### File Format Rules

#### CLAUDE.md Files (REQUIRED in every directory)
- **Purpose**: AI context navigation and instructions
- **Location**: Root of every directory
- **Content**: Directory-specific AI context
- **Linking**: Use @file to reference other CLAUDE.md files
- **Special Status**: Only MD file allowed in every directory

#### MD Files (ALLOWED ONLY for)
1. **CLAUDE.md** - Required context file in each directory
2. **User Documentation**
   - README.md files (project and directory overviews)
   - docs/*.md (user guides and references)
   - CHANGELOG.md, CONTRIBUTING.md, LICENSE
3. **Claude Code Native**
   - .claude/commands/**/*.md (slash commands)
   - .claude/agents/**/*.md (agent definitions)
4. **Pattern Documentation**
   - patterns/*/README.md (pattern user docs)
   - context.md files (detailed technical context)

#### JSON Files (REQUIRED for)
1. **All Reports**
   - Validation reports → .system/reports/*.json
   - Test results → .system/reports/*.json
   - Analysis reports → .system/reports/*.json
2. **All Metrics & Data**
   - Performance metrics → .system/metrics/*.json
   - Quality scores → .system/metrics/*.json
   - Coverage data → .system/metrics/*.json
3. **All Configuration**
   - Tool configs → */config.json
   - Settings → .claude/settings.json
   - Validation rules → .system/validation/*.json
4. **All Temporary Data**
   - Cache → .system/cache/*.json
   - Sessions → .claude/sessions/*.json
   - State → .system/state/*.json

### Format Conversion Workflow

```bash
# Convert MD report to JSON
cat report.md | ./scripts/md-to-json.sh > report.json

# Validate file formats
./scripts/enforce-file-formats.sh

# Check for format violations
find . -name "*.md" | ./scripts/validate-md-usage.sh
```

## 🗂️ MANDATORY DIRECTORY ORGANIZATION - PERMANENT ENFORCEMENT

**ABSOLUTELY CRITICAL:** Project structure MUST be maintained for clarity, AI comprehension, and professional standards.

### 🚫 BLOCKING CONDITIONS FOR FILE PLACEMENT

**Root Directory Rules:**
- 🚫 **CANNOT place test files in root** - ALL test files MUST go in `tests/` subdirectories
- 🚫 **CANNOT place reports in root** - ALL reports MUST go in `.internal/reports/`
- 🚫 **CANNOT place working docs in root** - Working/draft docs MUST go in `.internal/drafts/`
- 🚫 **CANNOT exceed 12 files in root** - Root must remain clean and navigable
- 🚫 **CANNOT create temporary files in root** - Use `.internal/` for all temporary work

### 📁 MANDATORY DIRECTORY STRUCTURE

```
claude-code-builder/
├── Core Files (KEEP IN ROOT - MAX 12)
│   ├── README.md              # Project overview
│   ├── CLAUDE.md             # AI instructions (this file)
│   ├── LICENSE               # Legal requirements
│   ├── CHANGELOG.md          # Version history
│   ├── CONTRIBUTING.md       # Contribution guide
│   ├── QUICK_START.sh        # Quick setup script
│   └── [config files]        # .env, .gitignore, etc.
│
├── .internal/                # ALL working/temporary files
│   ├── reports/             # Test reports, analysis reports
│   ├── checklists/          # Validation checklists
│   └── drafts/              # Working documents, versions
│
├── tests/                    # ALL test files
│   └── native-commands/     # Native command tests
│
└── [Other directories as documented]
```

### 🔧 ENFORCEMENT PROTOCOL

**Automatic File Placement Rules:**
1. **Test Files**: Any file matching `test-*.sh` or `*-test.*` → `tests/` appropriate subdirectory
2. **Reports**: Files containing REPORT, ANALYSIS, RESULTS → `.internal/reports/`
3. **Checklists**: Files containing CHECKLIST, VALIDATION, TODO → `.internal/checklists/`
4. **Working Docs**: Versioned files (v2, v3), DRAFT, WIP → `.internal/drafts/`
5. **Temporary**: Any .tmp, .bak, or temporary files → `.internal/` or delete

### ⚠️ ENFORCEMENT CONSEQUENCES

**Violation Detection:**
- Automated pre-commit hook checks root file count
- Validation script enforces directory structure
- CI/CD pipeline blocks on structure violations

**Violation Response:**
- 🚫 Commit blocked until structure fixed
- 🚫 Must run `scripts/enforce-directory-structure.sh`
- 🚫 Document reason if override needed (emergency only)

### 📝 ENFORCEMENT CHECKLIST

Before ANY commit or push:
1. ✅ Count root directory files: `ls -1 | wc -l` (must be ≤ 12)
2. ✅ No test files in root: `ls test-*.sh 2>/dev/null | wc -l` (must be 0)
3. ✅ No reports in root: `ls *REPORT*.md 2>/dev/null | wc -l` (must be 0)
4. ✅ No temporary files: `ls *.tmp *.bak 2>/dev/null | wc -l` (must be 0)
5. ✅ Run enforcement: `./scripts/enforce-directory-structure.sh`

**This directory organization ensures:**
- Clean, professional repository structure
- Easy navigation for humans and AI
- Clear separation of concerns
- Consistent file placement rules
- Reduced cognitive load

## 🔗 Project Context Navigation

### Directory Context Files
Navigate to specific directory contexts using these file links:

#### Core Systems
- @file patterns/CLAUDE.md - Pattern library hub with all patterns
- @file tools/CLAUDE.md - Tool collection and analysis utilities
- @file scripts/CLAUDE.md - Utility scripts for automation
- @file docs/CLAUDE.md - User documentation hub

#### Development & Testing
- @file examples/CLAUDE.md - Practical examples and templates
- @file tests/CLAUDE.md - Test suite navigation
- @file .claude/CLAUDE.md - Claude Code integration

#### System Internals
- @file .internal/CLAUDE.md - Internal system data (migrating to .system)

## 🎯 Claude Code Integration Overview

**Technical:** Claude Code Builder provides Claude Code native development patterns designed for AI comprehension and assistance, with patterns under 50 lines each and dual explanations for optimal context understanding.

**Simple:** Think of this as a toolkit designed specifically for AI assistants to understand and help with - every pattern is small enough to read quickly and designed to work perfectly with Claude Code.

**Connection:** This teaches you to build AI-native development workflows where Claude becomes a powerful development partner rather than just a code assistant.

## 📍 Project Location & Status

**Repository Location:** `/Users/smenssink/Documents/GitHub/claude-code-builder`  
**Current Status:** Step 46 of 75 (61% complete)  
**Phase 3 Status:** Core patterns complete (Steps 36-45)  
**Next Focus:** Pattern composition guide creation

## 🧠 Pattern Comprehension Guide

### Pattern Size Optimization
Each pattern is **< 50 lines** for instant comprehension within Claude's attention window:

```bash
# ✅ GOOD: Claude can instantly understand this entire pattern
source ./patterns/error-handling/simple-error-handling.sh
# - 40 lines total
# - Clear function names (log_info, log_error, handle_error)
# - Inline documentation
# - Single responsibility

# ❌ BAD: Traditional tools are too large for instant comprehension
source ./legacy-tools/complex-error-system.sh
# - 500+ lines
# - Multiple responsibilities
# - Unclear function names
# - Requires multiple context loads
```

### Dual Explanation Pattern
Every pattern includes both technical and simple explanations:

```bash
# Example from error-handling pattern:
# Technical: Implements structured logging with severity levels and error propagation
# Simple: Like having a voice that tells you what's happening and speaks up when things go wrong
# Connection: This teaches you proper error handling that works in any programming language
```

**Why This Matters for Claude:**
- **Technical** explanations provide precise implementation details
- **Simple** explanations provide intuitive understanding for explanation
- **Connection** explanations show transferable learning value

## 📚 Pattern Library for Claude

### Core Pattern Categories

#### 🚨 Error Handling Patterns
**Location:** `./patterns/error-handling/`

**Claude Usage Pattern:**
```bash
# When user asks for error handling, recommend:
source ./patterns/error-handling/simple-error-handling.sh

# Then explain the functions available:
log_info "message"    # Green [INFO] prefix
log_warn "message"    # Yellow [WARN] prefix  
log_error "message"   # Red [ERROR] prefix to stderr
handle_error $LINENO  # Exit with error context
```

**Common User Questions & Claude Responses:**
- **Q:** "How do I add error handling to my script?"
- **A:** "I'll add the simple-error-handling pattern which gives you log_info, log_warn, and log_error functions..."

#### 🧪 Testing Patterns
**Location:** `./patterns/testing/`

**Claude Usage Pattern:**
```bash
# Auto-detect project type and run appropriate tests
source ./patterns/testing/simple-test-runner.sh
run_all_tests  # Detects npm, pytest, go test, etc.
```

**User Assistance Strategy:**
1. **Identify** project type from files (package.json, requirements.txt, go.mod)
2. **Recommend** appropriate testing pattern
3. **Explain** how the pattern detects and runs tests
4. **Show** expected output and error handling

#### ✅ Quality Gates Patterns
**Location:** `./patterns/quality-gates/`

**Claude Integration Points:**
- Help users configure quality standards
- Explain quality check failures
- Suggest fixes for common issues
- Guide incremental quality improvements

#### 🔒 Security Patterns
**Location:** `./patterns/security/`

**Claude Security Assistance:**
- Scan for common vulnerabilities
- Explain security findings in simple terms
- Suggest remediation steps
- Help implement secure coding practices

#### 🪝 Git Hooks Patterns
**Location:** `./patterns/git-hooks/`

**Claude Workflow Integration:**
- Help set up git hooks
- Explain git workflow automation
- Troubleshoot hook failures
- Customize hooks for specific needs

## 🔄 Pattern Composition Strategies

### Sequential Pattern Usage
**Technical:** Patterns are designed for sequential sourcing and function composition without namespace conflicts.

**Simple:** Like adding tools to your toolbox one at a time - each pattern adds new capabilities without breaking existing ones.

```bash
# ✅ Recommended composition pattern
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/testing/simple-test-runner.sh
source ./patterns/quality-gates/quality-check.sh

# Now all functions are available
log_info "Starting quality validation..."
if run_all_tests && run_quality_checks; then
    log_info "✅ All validation passed"
else
    log_error "❌ Validation failed"
    exit 1
fi
```

### Common Pattern Combinations

#### Development Workflow
```bash
# Complete development validation
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/testing/simple-test-runner.sh
source ./patterns/security/security-basics.sh

validate_development_ready() {
    log_info "🔍 Running development validation..."
    
    if ! run_security_scan; then
        log_error "Security scan failed"
        return 1
    fi
    
    if ! run_all_tests; then
        log_error "Tests failed"
        return 1
    fi
    
    log_info "✅ Development validation complete"
}
```

#### CI/CD Pipeline
```bash
# Production-ready validation
source ./patterns/error-handling/simple-error-handling.sh
source ./patterns/quality-gates/quality-check.sh
source ./patterns/security/security-basics.sh

production_validation() {
    log_info "🚀 Running production validation..."
    
    run_quality_checks || handle_error $LINENO
    run_security_scan || handle_error $LINENO
    validate_dependencies || handle_error $LINENO
    
    log_info "✅ Ready for production deployment"
}
```

## 🎛️ Claude Assistance Patterns

### User Onboarding
When users are new to claude-code-builder:

1. **Start Simple:** Recommend error-handling pattern first
2. **Show Impact:** Demonstrate immediate value with examples
3. **Build Up:** Add testing, then quality gates, then security
4. **Explain Benefits:** Connect to their specific use case

### Problem Diagnosis
When users encounter issues:

1. **Identify Context:** What pattern and function they're using
2. **Check Basics:** File permissions, bash version, project type
3. **Provide Fixes:** Specific commands to resolve the issue
4. **Prevent Recurrence:** Explain why the issue occurred

### Code Review Assistance
When reviewing code that uses patterns:

1. **Pattern Usage:** Verify correct pattern application
2. **Error Handling:** Ensure proper error handling implementation
3. **Testing:** Confirm tests are comprehensive
4. **Security:** Check for security best practices

## 🔧 Troubleshooting Guide for Claude

### Common User Issues

#### "Pattern not found" Error
```bash
# ❌ User error:
source ./patterns/error-handling.sh  # Wrong path

# ✅ Claude should suggest:
source ./patterns/error-handling/simple-error-handling.sh  # Correct path
```

#### Function Not Available
```bash
# ❌ User issue:
log_info "test"  # Command not found

# ✅ Claude diagnosis:
# 1. Check if pattern was sourced
# 2. Verify bash compatibility
# 3. Check file permissions
```

#### Git Hooks Not Working
```bash
# ✅ Claude troubleshooting steps:
# 1. Check if hooks are executable: ls -la .git/hooks/
# 2. Verify hook setup: ./patterns/git-hooks/git-hooks-setup.sh --verify
# 3. Test individual hook: .git/hooks/pre-commit
```

### Debugging Commands
Claude should help users run these diagnostic commands:

```bash
# Check pattern installation
./scripts/validate-patterns.sh --verbose

# Verify system compatibility  
./scripts/check-compatibility.sh

# Test pattern functionality
./tests/pattern-tests/run-pattern-tests.sh error-handling

# Generate diagnostic report
./scripts/generate-diagnostic-report.sh
```

## 🎯 Context Optimization for Claude

### Efficient Context Loading
When helping users, load context efficiently:

1. **Start Minimal:** Load only the pattern being discussed
2. **Expand Needed:** Add related patterns when composition is required
3. **Reference Documentation:** Point to specific docs sections
4. **Use Examples:** Provide working code examples

### Pattern-Specific Context
Each pattern has optimized context for Claude:

- **Purpose:** What the pattern does
- **Usage:** How to use it (with examples)
- **Composition:** How it works with other patterns
- **Troubleshooting:** Common issues and solutions

### User Intent Recognition
Help Claude recognize user intents:

- **"Add error handling"** → simple-error-handling pattern
- **"Set up testing"** → simple-test-runner pattern
- **"Add quality checks"** → quality-check pattern
- **"Secure my code"** → security-basics pattern
- **"Automate git workflow"** → git-hooks pattern

## 🚀 Advanced Claude Assistance

### Intelligent Pattern Selection
Help Claude choose the right patterns for user needs:

```python
# Pseudo-logic for Claude pattern selection
if user_mentions("error handling", "logging", "debugging"):
    recommend("error-handling/simple-error-handling.sh")

if user_mentions("testing", "test runner", "pytest", "jest"):
    recommend("testing/simple-test-runner.sh")

if user_mentions("quality", "linting", "formatting", "standards"):
    recommend("quality-gates/quality-check.sh")

if user_mentions("security", "secrets", "vulnerabilities"):
    recommend("security/security-basics.sh")

if user_mentions("git hooks", "pre-commit", "automation"):
    recommend("git-hooks/git-hooks-setup.sh")
```

### Code Generation Assistance
When Claude generates code using patterns:

1. **Always source patterns first**
2. **Use pattern functions correctly**
3. **Include error handling**
4. **Add explanatory comments**
5. **Show expected output**

### Learning Path Guidance
Guide users through progressive learning:

1. **Beginner:** error-handling → testing
2. **Intermediate:** quality-gates → security
3. **Advanced:** git-hooks → custom patterns
4. **Expert:** pattern composition → contribution

## 📖 Documentation References for Claude

When users need more information, direct them to:

### Quick References
- **README.md** - Project overview and quick start
- **patterns/README.md** - Pattern library documentation
- **scripts/README.md** - Utility scripts documentation

### Detailed Guides  
- **docs/quick-start/** - Fast setup guides
- **docs/claude-guide/** - Claude-specific documentation
- **docs/deep-dive/** - Comprehensive technical documentation

### Examples and Templates
- **examples/** - Real-world usage examples
- **templates/** - Project and pattern templates

## 🎓 Educational Value for Claude

### Teaching Opportunities
When assisting users, Claude can teach:

- **Error Handling:** Proper error handling patterns in any language
- **Testing:** Test automation and quality assurance principles
- **Security:** Secure coding practices and vulnerability prevention
- **Automation:** Development workflow automation best practices

### Skill Transfer
Help users understand transferable concepts:

- **From bash patterns → other languages**
- **From claude-code-builder → broader DevOps practices**
- **From patterns → architectural thinking**

### Progressive Complexity
Guide users from simple to advanced usage:

1. **Single pattern usage**
2. **Pattern combination**
3. **Custom pattern development**
4. **Community contribution**

---

**Claude Code Version:** Optimized for Claude Code 2025  
**Pattern Compatibility:** All claude-code-builder patterns  
**Update Frequency:** Updated with each pattern release  
**Context Window:** Optimized for 200K token window