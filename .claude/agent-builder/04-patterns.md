---
allowed-tools: Read, Bash(source:*), Bash(find patterns:*), Grep
description: Pattern selection and composition using multi-prompt validation
argument-hint: [capability-set] [--optimize] [--test-composition]
category: agent-builder
version: 1.0.0
---

# 📚 PATTERN SELECTION & COMPOSITION

Selecting and composing Claude Code Builder patterns using research-validated approaches.

## Pattern Composition Framework

### Capability Requirements:
```yaml
$CAPABILITY_SET_FROM_PREVIOUS_STEP
```

## Step 1: Available Pattern Analysis

### Discovering Available Patterns:
```bash
# Map all available patterns
find patterns -name "*.sh" -type f | sort
```

### Pattern Capability Matrix:
| Pattern | Primary Function | Lines | Capabilities |
|---------|-----------------|-------|-------------|
| error-handling | Core Infrastructure | ~40 | Error handling, logging |
| logging | Core Infrastructure | ~49 | Structured logging, debugging |
| testing | Quality Assurance | ~50 | Test automation, validation |
| security | Security & Compliance | ~49 | Security scanning, validation |
| quality-gates | Code Quality | ~48 | Quality checks, standards |
| configuration | System Config | ~58 | Config reading, validation |
| dependencies | Dependency Mgmt | ~50 | Dependency checking |
| git-hooks | Git Integration | ~46 | Git workflow automation |
| project-validation | Project Health | ~49 | Project structure validation |
| documentation | Documentation | ~50 | Auto-documentation generation |

## Step 2: Pattern Selection Strategy

### Core Patterns (Always Required):
✅ `error-handling/simple-error-handling.sh` - Foundation pattern
✅ `logging/simple-logging.sh` - Essential for debugging

### Purpose-Based Pattern Selection:

**For Analysis Agents ($PRIMARY_FUNCTION = analysis):**
- ✅ quality-gates/quality-check.sh (analysis capabilities)
- ☐ security/security-basics.sh (security analysis)
- ☐ project-validation/project-validator.sh (structure analysis)

**For Generation Agents ($PRIMARY_FUNCTION = generation):**
- ✅ documentation/docs-generator.sh (content generation)
- ☐ testing/simple-test-runner.sh (generated code testing)
- ☐ configuration/config-reader.sh (template configs)

**For Transformation Agents ($PRIMARY_FUNCTION = transformation):**
- ✅ testing/simple-test-runner.sh (validate transforms)
- ☐ configuration/config-reader.sh (transform configs)
- ☐ dependencies/dependency-checker.sh (dependency updates)

**For Automation Agents ($PRIMARY_FUNCTION = automation):**
- ✅ git-hooks/git-hooks-setup.sh (git automation)
- ✅ testing/simple-test-runner.sh (automated testing)
- ☐ dependencies/dependency-checker.sh (dependency automation)

### Interactive Pattern Selection:
**Select additional patterns** (y/n for each):

1. **testing/simple-test-runner.sh** - Automated testing capability
   Purpose: Run tests, validate functionality
   > (y/n): [WAIT FOR INPUT]

2. **security/security-basics.sh** - Security scanning
   Purpose: Security validation, vulnerability detection  
   > (y/n): [WAIT FOR INPUT]

3. **quality-gates/quality-check.sh** - Code quality analysis
   Purpose: Quality metrics, standards compliance
   > (y/n): [WAIT FOR INPUT]

4. **configuration/config-reader.sh** - Configuration management
   Purpose: Read configs, environment variables
   > (y/n): [WAIT FOR INPUT]

5. **dependencies/dependency-checker.sh** - Dependency management
   Purpose: Check dependencies, validate versions
   > (y/n): [WAIT FOR INPUT]

## Step 3: Multi-Prompt Pattern Composition

### Generating 5 Composition Variations:

**Variation 1: Minimal Composition (5th percentile)**
```bash
# Bare minimum patterns
source patterns/error-handling/simple-error-handling.sh
source patterns/logging/simple-logging.sh
```

**Variation 2: Conservative Composition (25th percentile)**
```bash
# Core + essential for purpose
source patterns/error-handling/simple-error-handling.sh
source patterns/logging/simple-logging.sh
source patterns/$PURPOSE_ESSENTIAL_PATTERN.sh
```

**Variation 3: Standard Composition (50th percentile)**
```bash
# Balanced pattern set
source patterns/error-handling/simple-error-handling.sh
source patterns/logging/simple-logging.sh
source patterns/$PURPOSE_PATTERN_1.sh
source patterns/$PURPOSE_PATTERN_2.sh
```

**Variation 4: Comprehensive Composition (75th percentile)**
```bash
# Full feature set
source patterns/error-handling/simple-error-handling.sh
source patterns/logging/simple-logging.sh
source patterns/$ALL_SELECTED_PATTERNS.sh
```

**Variation 5: Expert Composition (95th percentile)**
```bash
# Maximum capability with optimizations
source patterns/error-handling/simple-error-handling.sh
source patterns/logging/simple-logging.sh
source patterns/$ALL_PATTERNS_OPTIMIZED.sh
# Custom optimizations and integrations
```

## Step 4: Pattern Composition Testing

### Testing Each Variation:

**Load Test for Each Variation:**
```bash
# Test pattern loading time and compatibility
for variation in 1 2 3 4 5; do
    echo "Testing Variation $variation..."
    time source_patterns_variation_$variation
    echo "Functions available: $(declare -F | wc -l)"
    echo "Memory usage: $(ps -o rss= -p $$ | awk '{print $1/1024 " MB"}')"
done
```

### Composition Validation:

**Variation 1 Results:**
- Load time: ${LOAD_TIME_1}ms
- Function count: ${FUNC_COUNT_1}
- Memory usage: ${MEMORY_1}MB
- **Score: ${SCORE_1}/100**

**Variation 2 Results:**
- Load time: ${LOAD_TIME_2}ms  
- Function count: ${FUNC_COUNT_2}
- Memory usage: ${MEMORY_2}MB
- **Score: ${SCORE_2}/100**

**Variation 3 Results:**
- Load time: ${LOAD_TIME_3}ms
- Function count: ${FUNC_COUNT_3}
- Memory usage: ${MEMORY_3}MB
- **Score: ${SCORE_3}/100**

**Variation 4 Results:**
- Load time: ${LOAD_TIME_4}ms
- Function count: ${FUNC_COUNT_4}
- Memory usage: ${MEMORY_4}MB
- **Score: ${SCORE_4}/100**

**Variation 5 Results:**
- Load time: ${LOAD_TIME_5}ms
- Function count: ${FUNC_COUNT_5}
- Memory usage: ${MEMORY_5}MB
- **Score: ${SCORE_5}/100**

## Step 5: Optimal Composition Selection

### Performance Analysis:
- **Best Performance:** Variation ${BEST_PERF}
- **Best Balance:** Variation ${BEST_BALANCE}  
- **Most Features:** Variation ${MOST_FEATURES}

### Recommendation:
Based on $TARGET_USERS and $COMPLEXITY_LEVEL:
**Recommended Variation:** ${RECOMMENDED_VARIATION}

**Select composition** (1-5): > [WAIT FOR USER INPUT]

## Step 6: Pattern Integration Validation

### Selected Pattern Set:
```yaml
patterns:
  core:
    - error-handling/simple-error-handling.sh
    - logging/simple-logging.sh
  functional:
    $SELECTED_FUNCTIONAL_PATTERNS
  optional:
    $SELECTED_OPTIONAL_PATTERNS

loading_order:
  $OPTIMIZED_LOADING_ORDER

estimated_performance:
  load_time: ${ESTIMATED_LOAD}ms
  memory_usage: ${ESTIMATED_MEMORY}MB
  function_count: ${ESTIMATED_FUNCTIONS}
```

### Integration Test:
```bash
# Test actual pattern integration
source patterns/error-handling/simple-error-handling.sh
source patterns/logging/simple-logging.sh
$ADDITIONAL_PATTERN_SOURCES

# Verify all functions available
log_info "Pattern integration test"
handle_error "Test error handling"
```

✅ Pattern composition validated and optimized

## Next Phase

Pattern selection completed using multi-prompt validation approach.

**Continue to: /agent-builder/05-prototype** with optimized pattern composition.