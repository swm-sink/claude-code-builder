# Claude Code Readability Standards

## Core Principle
**Code should be immediately understandable to Claude without complex analysis**

## 1. Length & Complexity

### ✅ Good
- **< 50 lines per script** - Claude can read and understand quickly
- **Single purpose** - One clear function per script
- **Linear flow** - Top to bottom execution, minimal jumping around

### ❌ Avoid
- **> 100 lines** - Too much context to hold in working memory
- **Multiple purposes** - Confusing what the script actually does
- **Complex control flow** - Nested functions, callbacks, complex state

### Example
```bash
# ✅ Good: Clear, linear, single purpose
#!/bin/bash
set -e

echo "Checking Node.js project..."
if [ -f "package.json" ]; then
    npm test
    echo "Tests passed!"
else
    echo "No package.json found"
fi
```

## 2. Variable Naming

### ✅ Good
- **Descriptive names** - `PROJECT_ROOT` not `PR`
- **UPPERCASE for constants** - `MAX_RETRIES=3`
- **lowercase for variables** - `test_file="test.js"`
- **Obvious purpose** - Names explain what they contain

### ❌ Avoid
- **Cryptic abbreviations** - `LGFMT`, `HNDLR`
- **Single letters** - `x`, `i` (except simple loops)
- **Misleading names** - `temp` for permanent values

### Example
```bash
# ✅ Good: Claude immediately understands
PROJECT_ROOT="$(pwd)"
test_files="$(find . -name '*.test.js')"
exit_code=0

# ❌ Bad: Requires mental translation
PR="$(pwd)"
tf="$(find . -name '*.test.js')"
ec=0
```

## 3. Comments & Documentation

### ✅ Good
- **Purpose at top** - What this script does
- **Usage examples** - How to use it
- **Key decisions** - Why specific choices were made
- **Variable explanations** - What non-obvious variables contain

### ❌ Avoid
- **Implementation details** - How bash syntax works
- **Obvious comments** - `# Set variable to 1`
- **Outdated comments** - Comments that don't match code

### Example
```bash
#!/bin/bash

# Simple Test Runner - Detects and runs tests for any project type
# Usage: ./test-runner.sh [directory]
# Supports: Node.js (npm test), Python (pytest), Go (go test)

# Find project root (current directory or git root)
PROJECT_ROOT="${1:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"

# Check for Node.js project
if [ -f "$PROJECT_ROOT/package.json" ]; then
    echo "Node.js project detected"
    npm test  # Will use scripts.test from package.json
fi
```

## 4. Function Structure

### ✅ Good
- **Simple functions** - Do one thing well
- **Clear inputs/outputs** - Obvious parameters and return values
- **Early returns** - Fail fast, reduce nesting

### ❌ Avoid
- **Complex functions** - Multiple responsibilities
- **Hidden dependencies** - Functions that rely on global state
- **Deep nesting** - if/else/for chains more than 2 levels

### Example
```bash
# ✅ Good: Simple, clear function
check_nodejs_project() {
    local project_dir="$1"
    
    if [ ! -f "$project_dir/package.json" ]; then
        return 1  # Not a Node.js project
    fi
    
    echo "Node.js project detected"
    return 0
}

# ❌ Bad: Complex, multiple responsibilities
check_project() {
    # This function does too many things...
    if [ -f "package.json" ]; then
        if command -v npm >/dev/null; then
            if npm test; then
                if npm run lint; then
                    echo "All good"
                else
                    echo "Lint failed"
                fi
            fi
        fi
    elif [ -f "requirements.txt" ]; then
        # More complexity...
    fi
}
```

## 5. Error Handling

### ✅ Good
- **set -e** at top - Fail on any error
- **Clear error messages** - Specific, actionable
- **Graceful degradation** - Continue when possible

### ❌ Avoid
- **Silent failures** - Errors that hide
- **Generic error messages** - "Something went wrong"
- **Complex error recovery** - Retry loops, complex handling

### Example
```bash
# ✅ Good: Clear error handling
#!/bin/bash
set -e  # Exit on any error

check_npm_available() {
    if ! command -v npm >/dev/null 2>&1; then
        echo "ERROR: npm not found. Please install Node.js" >&2
        return 1
    fi
}

# ❌ Bad: Silent failure
check_npm_available() {
    command -v npm >/dev/null 2>&1  # Silently continues if npm missing
}
```

## 6. Dependencies & Portability

### ✅ Good
- **Standard tools only** - bash, grep, find, etc.
- **Check before using** - Verify tools exist
- **Degrade gracefully** - Work even if optional tools missing

### ❌ Avoid
- **Complex dependencies** - Tools that need installation
- **Version-specific features** - Bash 4+ associative arrays
- **Platform-specific code** - Linux-only commands

### Example
```bash
# ✅ Good: Check dependencies, degrade gracefully
if command -v npm >/dev/null 2>&1; then
    npm test
else
    echo "npm not found, skipping Node.js tests"
fi

# ❌ Bad: Assumes dependency exists
npm test  # Fails if npm not installed
```

## 7. Output & Feedback

### ✅ Good
- **Clear status messages** - What's happening now
- **Consistent formatting** - Same style throughout
- **Progress indicators** - Show what's been done

### ❌ Avoid
- **Silent execution** - No feedback on progress
- **Inconsistent output** - Mixed styles and formats
- **Too verbose** - Overwhelming detail

### Example
```bash
# ✅ Good: Clear, consistent output
echo "🔍 Checking project structure..."
if [ -f "README.md" ]; then
    echo "✅ README.md found"
else
    echo "⚠️  README.md missing"
fi

echo "🧪 Running tests..."
if npm test; then
    echo "✅ Tests passed"
else
    echo "❌ Tests failed"
    exit 1
fi

# ❌ Bad: Unclear output
echo "Checking..."
[ -f "README.md" ] && echo "OK" || echo "MISSING"
npm test >/dev/null 2>&1 && echo "PASS" || echo "FAIL"
```

## 8. Adaptability

### ✅ Good
- **Easy to modify** - Change paths, add checks
- **Configuration at top** - Variables that might change
- **Modular structure** - Easy to copy parts

### ❌ Avoid
- **Hard-coded values** - Paths, URLs embedded in logic
- **Tightly coupled** - Changes require editing multiple places
- **Monolithic structure** - All-or-nothing approach

### Example
```bash
# ✅ Good: Easy for Claude to adapt
#!/bin/bash

# Configuration (easy to modify)
PROJECT_TYPES=("package.json" "requirements.txt" "go.mod")
TEST_COMMANDS=("npm test" "python -m pytest" "go test")

# Main logic (easy to understand and modify)
for i in "${!PROJECT_TYPES[@]}"; do
    if [ -f "${PROJECT_TYPES[$i]}" ]; then
        echo "Running: ${TEST_COMMANDS[$i]}"
        ${TEST_COMMANDS[$i]}
        break
    fi
done
```

## Summary Checklist

For each pattern, Claude should be able to:
- [ ] **Understand purpose** in under 30 seconds
- [ ] **Identify key variables** immediately  
- [ ] **Modify for different project** easily
- [ ] **Debug problems** by reading code
- [ ] **Extend functionality** without rewriting

This ensures maximum Claude Code compatibility and productivity.