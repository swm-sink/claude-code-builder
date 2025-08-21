---
allowed-tools: Write, Read, Bash(mkdir:*)
description: Generate initial agent prototype with research-backed implementation
argument-hint: [composition-config] [--template template-name] [--test]
category: agent-builder
version: 1.0.0
---

# 🚀 AGENT PROTOTYPE GENERATION

Generating initial agent implementation using validated patterns and current best practices.

## Prototype Generation Framework

### Configuration Input:
```yaml
$COMPOSITION_CONFIG_FROM_PREVIOUS_STEP
```

## Step 1: Agent Structure Generation

### Creating Agent Directory:
```bash
mkdir -p .claude/agents/$AGENT_NAME
mkdir -p .claude/agents/$AGENT_NAME/tests
mkdir -p .claude/agents/$AGENT_NAME/docs
```

### Agent File Structure:
```
.claude/agents/$AGENT_NAME/
├── agent.md           # Main agent implementation
├── config.json        # Agent configuration
├── README.md          # Agent documentation
├── tests/
│   ├── basic.sh       # Basic functionality tests
│   ├── integration.sh # Integration tests
│   └── performance.sh # Performance tests
└── docs/
    ├── usage.md       # Usage examples
    └── api.md         # API reference
```

## Step 2: Core Agent Implementation

### Generated Agent Template:

```markdown
---
allowed-tools: $ALLOWED_TOOLS_LIST
description: $AGENT_DESCRIPTION
argument-hint: $ARGUMENT_HINT
category: custom-agent
version: 1.0.0
agent-type: $PRIMARY_FUNCTION
patterns: $SELECTED_PATTERNS
---

# $AGENT_NAME - $AGENT_DESCRIPTION

$DETAILED_DESCRIPTION_BASED_ON_RESEARCH

## Implementation

### Pattern Integration
```bash
# Load required patterns in optimized order
$PATTERN_LOADING_SEQUENCE
```

### Core Functions

#### Main Agent Function
```bash
${AGENT_NAME}_main() {
    local args="$@"
    
    # Initialize logging
    log_info "Starting $AGENT_NAME with args: $args"
    
    # Validate inputs (research-backed validation)
    if ! ${AGENT_NAME}_validate_inputs "$args"; then
        log_error "Input validation failed"
        handle_error $LINENO
        return 1
    fi
    
    # Execute core logic
    ${AGENT_NAME}_execute "$args"
    
    # Validate outputs
    if ! ${AGENT_NAME}_validate_outputs; then
        log_error "Output validation failed"
        handle_error $LINENO
        return 1
    fi
    
    log_info "$AGENT_NAME completed successfully"
}
```

#### Input Validation (Security Best Practice)
```bash
${AGENT_NAME}_validate_inputs() {
    local inputs="$1"
    
    # Input sanitization based on 2024 security standards
    $INPUT_VALIDATION_LOGIC
    
    return 0
}
```

#### Core Execution Logic
```bash
${AGENT_NAME}_execute() {
    local args="$1"
    
    # Main agent logic based on $PRIMARY_FUNCTION
    $CORE_EXECUTION_LOGIC
    
    return 0
}
```

#### Output Validation
```bash
${AGENT_NAME}_validate_outputs() {
    # Output validation and sanitization
    $OUTPUT_VALIDATION_LOGIC
    
    return 0
}
```

### Error Handling Strategy
```bash
${AGENT_NAME}_handle_error() {
    local line_number="$1"
    local error_message="$2"
    
    log_error "Error in $AGENT_NAME at line $line_number: $error_message"
    
    # Cleanup logic
    ${AGENT_NAME}_cleanup
    
    # Error reporting based on research findings
    $ERROR_REPORTING_LOGIC
}
```

### Performance Monitoring
```bash
${AGENT_NAME}_monitor_performance() {
    local start_time=$(date +%s%N)
    
    # Execute with monitoring
    "$@"
    local exit_code=$?
    
    local end_time=$(date +%s%N)
    local duration=$((($end_time - $start_time) / 1000000))
    
    log_info "Execution time: ${duration}ms"
    
    return $exit_code
}
```

## Usage Examples

### Basic Usage
```bash
# Source the agent
source .claude/agents/$AGENT_NAME/agent.md

# Execute main function
${AGENT_NAME}_main $EXAMPLE_ARGS
```

### Advanced Usage
```bash
# With performance monitoring
${AGENT_NAME}_monitor_performance ${AGENT_NAME}_main $ADVANCED_ARGS
```

## Error Codes
- 0: Success
- 1: Input validation failed
- 2: Execution failed
- 3: Output validation failed
- 4: Permission denied
- 5: Resource unavailable

$ADDITIONAL_AGENT_CONTENT
```

## Step 3: Configuration Generation

### Agent Configuration (config.json):
```json
{
  "name": "$AGENT_NAME",
  "version": "1.0.0",
  "description": "$AGENT_DESCRIPTION",
  "category": "$CATEGORY",
  "primary_function": "$PRIMARY_FUNCTION",
  "target_users": $TARGET_USERS_ARRAY,
  "patterns": $PATTERNS_ARRAY,
  "tools": $TOOLS_ARRAY,
  "performance": {
    "target_response_time_ms": $TARGET_RESPONSE_TIME,
    "max_memory_mb": $MAX_MEMORY,
    "max_cpu_percent": $MAX_CPU
  },
  "security": {
    "input_validation": true,
    "output_sanitization": true,
    "audit_logging": true,
    "permission_required": $PERMISSION_LEVEL
  },
  "testing": {
    "unit_tests": true,
    "integration_tests": true,
    "performance_tests": true,
    "security_tests": true
  },
  "created": "$(date -Iseconds)",
  "research_date": "$(date -Iseconds)",
  "best_practices_version": "2024.1"
}
```

## Step 4: Test Suite Generation

### Basic Test (tests/basic.sh):
```bash
#!/bin/bash
# Basic functionality tests for $AGENT_NAME

source ../agent.md

test_basic_functionality() {
    echo "Testing basic functionality..."
    
    # Test with valid inputs
    if ${AGENT_NAME}_main $TEST_VALID_ARGS; then
        echo "✅ Basic functionality test passed"
        return 0
    else
        echo "❌ Basic functionality test failed"
        return 1
    fi
}

test_input_validation() {
    echo "Testing input validation..."
    
    # Test with invalid inputs
    if ! ${AGENT_NAME}_main $TEST_INVALID_ARGS; then
        echo "✅ Input validation test passed"
        return 0
    else
        echo "❌ Input validation test failed"
        return 1
    fi
}

# Run tests
test_basic_functionality
test_input_validation
```

### Performance Test (tests/performance.sh):
```bash
#!/bin/bash
# Performance tests for $AGENT_NAME

source ../agent.md

test_response_time() {
    echo "Testing response time..."
    
    local start_time=$(date +%s%N)
    ${AGENT_NAME}_main $PERFORMANCE_TEST_ARGS
    local end_time=$(date +%s%N)
    
    local duration=$((($end_time - $start_time) / 1000000))
    
    if [ $duration -le $TARGET_RESPONSE_TIME ]; then
        echo "✅ Response time test passed: ${duration}ms"
        return 0
    else
        echo "❌ Response time test failed: ${duration}ms > $TARGET_RESPONSE_TIME ms"
        return 1
    fi
}

test_memory_usage() {
    echo "Testing memory usage..."
    
    # Memory testing logic
    $MEMORY_TEST_LOGIC
    
    return 0
}

# Run performance tests
test_response_time
test_memory_usage
```

## Step 5: Documentation Generation

### Usage Documentation (docs/usage.md):
```markdown
# $AGENT_NAME Usage Guide

## Overview
$AGENT_DESCRIPTION

## Installation
\`\`\`bash
# Clone or copy the agent
cp -r .claude/agents/$AGENT_NAME /your/project/.claude/agents/
\`\`\`

## Basic Usage
\`\`\`bash
source .claude/agents/$AGENT_NAME/agent.md
${AGENT_NAME}_main [arguments]
\`\`\`

## Examples
$USAGE_EXAMPLES

## Troubleshooting
$TROUBLESHOOTING_GUIDE
```

## Step 6: Prototype Validation

### Self-Test Execution:
```bash
# Test agent loading
echo "Testing agent loading..."
source .claude/agents/$AGENT_NAME/agent.md

# Verify functions are available
if declare -f ${AGENT_NAME}_main >/dev/null; then
    echo "✅ Agent functions loaded successfully"
else
    echo "❌ Agent function loading failed"
    exit 1
fi

# Test basic execution
echo "Testing basic execution..."
if ${AGENT_NAME}_main --help; then
    echo "✅ Basic execution test passed"
else
    echo "❌ Basic execution test failed"
    exit 1
fi
```

### Prototype Quality Assessment:
- **Pattern Integration:** ✅ $PATTERNS_LOADED patterns loaded
- **Function Count:** $FUNCTION_COUNT functions defined
- **Documentation:** ✅ Complete with examples
- **Tests:** ✅ Basic test suite generated
- **Configuration:** ✅ Valid config.json created

## Prototype Complete

### Generated Files:
- ✅ `.claude/agents/$AGENT_NAME/agent.md` - Main implementation
- ✅ `.claude/agents/$AGENT_NAME/config.json` - Configuration
- ✅ `.claude/agents/$AGENT_NAME/README.md` - Documentation
- ✅ `.claude/agents/$AGENT_NAME/tests/` - Test suite
- ✅ `.claude/agents/$AGENT_NAME/docs/` - Usage guides

### Prototype Status:
**Ready for multi-prompt validation and optimization**

## Next Phase

Prototype generated with research-backed best practices.

**Continue to: /agent-builder/06-multi-prompt** for robustness testing.