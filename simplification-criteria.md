# Simplification Criteria: What Makes a Good Claude Code Pattern

## Pattern Value Matrix

### HIGH VALUE (Extract & Simplify)
Patterns that score high on:
- **Universality** - Useful across 80%+ of projects
- **Simplicity** - Can be reduced to < 50 lines
- **Immediate utility** - Solves obvious problem
- **Learning value** - Teaches useful concept

### MEDIUM VALUE (Extract Key Concepts)  
Patterns that have some value but need major simplification:
- **Niche utility** - Useful for specific project types
- **Complex but reducible** - Currently complex but core concept is simple
- **Good foundation** - Basis for simpler patterns

### LOW VALUE (Skip or Reference Only)
Patterns that are:
- **Over-engineered** - More complex than the problem they solve
- **Too specialized** - Only useful in rare cases
- **Podcast-specific** - Tied to specific project structure

## Evaluation Criteria

### 1. Universal Applicability (Weight: 40%)

#### ✅ HIGH (9-10 points)
- Works for any programming language
- Useful for any project size
- No domain-specific assumptions

**Examples:**
- Basic error handling
- Test execution
- Project structure validation
- Git hooks setup

#### 🟡 MEDIUM (5-8 points)  
- Useful for common project types
- Language-specific but widely applicable
- Solves common problems

**Examples:**
- Node.js dependency checking
- Python environment validation
- Docker container patterns

#### ❌ LOW (1-4 points)
- Very specific use cases
- Complex setup requirements
- Domain-specific knowledge required

**Examples:**
- Podcast episode generation
- Complex performance regression analysis
- Enterprise metrics collection

### 2. Simplification Potential (Weight: 30%)

#### ✅ HIGH (9-10 points)
- Current complex implementation can be reduced to < 50 lines
- No external dependencies
- Linear execution flow

**Current Example:**
```bash
# 659-line error-handling-template.sh
# Can be simplified to:
set -e
log_error() { echo "ERROR: $1" >&2; }
```

#### 🟡 MEDIUM (5-8 points)
- Can be simplified but still somewhat complex
- Minimal external dependencies
- Some complexity justified

**Current Example:**
```bash
# 800-line security-scanner.sh  
# Can be simplified to:
# 50-line basic secret detection
grep -r "password\|api_key" . --exclude-dir=.git
```

#### ❌ LOW (1-4 points)
- Irreducible complexity
- Many external dependencies
- Complex algorithms required

**Examples:**
- Performance baseline calculation
- Complex configuration parsing
- Advanced security vulnerability detection

### 3. Learning Value (Weight: 20%)

#### ✅ HIGH (9-10 points)
- Teaches fundamental development concept
- Pattern is reusable across contexts
- Claude can adapt to many situations

**Examples:**
- Error handling patterns
- Test automation concepts
- Code quality checking

#### 🟡 MEDIUM (5-8 points)
- Teaches useful but specific concept
- Some reusability
- Good reference material

**Examples:**
- Git workflow automation
- Build process optimization
- Documentation generation

#### ❌ LOW (1-4 points)
- Very specific implementation
- Little educational value
- Hard to generalize

**Examples:**
- Specific API integrations
- Complex data processing
- Domain-specific algorithms

### 4. Immediate Utility (Weight: 10%)

#### ✅ HIGH (9-10 points)
- Solves immediate, obvious problem
- Results visible immediately
- No setup required

**Examples:**
- Run tests with one command
- Check project structure
- Validate code quality

#### 🟡 MEDIUM (5-8 points)
- Useful but requires some setup
- Benefits clear but not immediate
- Some configuration needed

#### ❌ LOW (1-4 points)
- Benefits unclear
- Complex setup required
- Long-term value only

## Scoring Examples

### error-handling-template.sh
- **Universality:** 10/10 (every script needs error handling)
- **Simplification:** 10/10 (659 lines → 20 lines)
- **Learning Value:** 9/10 (fundamental programming concept)
- **Immediate Utility:** 8/10 (immediately improves scripts)
- **Total:** 9.3/10 ✅ **HIGH VALUE**

### security-scanner.sh  
- **Universality:** 7/10 (many projects need security checks)
- **Simplification:** 6/10 (800 lines → 50 lines possible)
- **Learning Value:** 7/10 (important security concepts)
- **Immediate Utility:** 8/10 (finds issues immediately)
- **Total:** 6.8/10 🟡 **MEDIUM VALUE**

### performance-regression-detector.sh
- **Universality:** 4/10 (specialized need)
- **Simplification:** 3/10 (complex algorithms)
- **Learning Value:** 5/10 (specialized knowledge)
- **Immediate Utility:** 3/10 (long-term value)
- **Total:** 3.8/10 ❌ **LOW VALUE**

## Decision Rules

### Extract as HIGH PRIORITY (Score > 8.0)
1. Create simplified version immediately
2. Include in core patterns collection
3. Document thoroughly with examples
4. Test with multiple project types

### Extract as MEDIUM PRIORITY (Score 5.0-8.0)
1. Extract key concepts only
2. Create simplified example
3. Include in specialized patterns
4. Basic documentation

### SKIP (Score < 5.0)
1. Don't extract
2. May reference in documentation
3. Not worth maintenance overhead

## Simplification Process

### Step 1: Identify Core Function
**What is the ONE thing this script actually does?**

Example:
- security-scanner.sh → "Find hardcoded secrets in code"
- quality-dashboard.sh → "Show project health summary"

### Step 2: Remove Enterprise Features
- Complex reporting (JSON, HTML, dashboards)
- Advanced configuration systems
- Performance optimization
- Error recovery mechanisms
- Metrics collection

### Step 3: Use Basic Tools Only
- Replace `yq` with `grep`
- Replace `jq` with basic text processing
- Remove complex package dependencies
- Use standard Unix tools

### Step 4: Linear Implementation
- Remove functions, classes, modules
- Write as simple top-to-bottom script
- Inline everything possible
- Remove abstraction layers

### Step 5: Test Simplification
- Must be < 50 lines
- Must work with basic tools only
- Must be readable by Claude in 30 seconds
- Must solve the core problem

## Pattern Template

Every simplified pattern should have:

```bash
#!/bin/bash

# [ONE LINE DESCRIPTION]
# Usage: ./script.sh [parameters]
# Requirements: [basic tools only]

set -e  # Exit on error

# Configuration (easy to modify)
SETTING1="default_value"
SETTING2="another_default"

# Simple logging
log_info() { echo "✅ $1"; }
log_error() { echo "❌ $1" >&2; }

# Main logic (linear, obvious)
log_info "Starting [action]..."

if [condition]; then
    log_info "Doing [thing]..."
    [simple_command]
else
    log_error "[Clear error message]"
    exit 1
fi

log_info "[Action] completed successfully"
```

This ensures every pattern meets Claude Code readability and utility standards.