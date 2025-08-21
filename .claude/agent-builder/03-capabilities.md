---
allowed-tools: Read, Bash(find:*), Grep
description: Map agent capabilities using research-backed capability assessment
argument-hint: [agent-profile] [--validate] [--optimize]
category: agent-builder
version: 1.0.0
---

# 🔧 CAPABILITY MAPPING & VALIDATION

Mapping agent capabilities using current best practices and multi-dimensional assessment.

## Capability Assessment Framework

### Agent Profile:
```yaml
$AGENT_PROFILE_FROM_PREVIOUS_STEP
```

## Step 1: Core Capability Identification

### Based on Research Findings:

**For $PRIMARY_FUNCTION agents, current best practices require:**

#### Analysis Agents Need:
- File reading capabilities
- Pattern recognition
- Data aggregation
- Report generation
- Caching for performance

#### Generation Agents Need:
- Template processing
- Content creation
- Validation logic
- Output formatting
- Version control integration

#### Transformation Agents Need:
- Input parsing
- Processing pipelines
- Error recovery
- State management
- Progress tracking

#### Automation Agents Need:
- Command execution
- Workflow orchestration
- Dependency management
- Health monitoring
- Rollback capabilities

## Step 2: Capability Requirements Matrix

### Auto-Detected Requirements:

**CORE (Always Required):**
✅ Error handling (simple-error-handling.sh)
✅ Logging (simple-logging.sh)
✅ Input validation
✅ Output formatting

**PURPOSE-SPECIFIC (Based on $PRIMARY_FUNCTION):**
$AUTO_DETECTED_CAPABILITIES

**INTEGRATION-SPECIFIC (Based on $EXTERNAL_INTEGRATIONS):**
$INTEGRATION_CAPABILITIES

## Step 3: Three-Judge Capability Validation

### Judge 1: Technical Feasibility
**Assessment Criteria:**
- Are required tools available?
- Can performance requirements be met?
- Are security constraints satisfiable?

**Technical Evaluation:**
```bash
# Check available patterns
find patterns -name "*.sh" -type f

# Verify tool availability  
command -v git curl node python

# Check system constraints
echo "Memory: $(free -h 2>/dev/null || echo 'Unknown')"
echo "CPU: $(nproc 2>/dev/null || echo 'Unknown')"
```

**Judge 1 Score:** [AUTO-CALCULATED] /100

### Judge 2: User Experience
**Assessment Criteria:**
- Is interface intuitive for $TARGET_USERS?
- Are error messages helpful?
- Is response time acceptable?

**UX Evaluation:**
- Command complexity: $COMPLEXITY_SCORE/10
- Error clarity: $ERROR_SCORE/10  
- Performance: $PERF_SCORE/10

**Judge 2 Score:** [AUTO-CALCULATED] /100

### Judge 3: Best Practices Compliance
**Assessment Criteria:**
- Follows 2024 security standards?
- Uses recommended patterns?
- Implements proper testing?

**Compliance Checklist:**
☐ Input sanitization implemented
☐ Output validation included
☐ Error paths handled
☐ Logging comprehensive
☐ Testing strategy defined

**Judge 3 Score:** [AUTO-CALCULATED] /100

## Step 4: Capability Optimization

### Consensus Score: [AVERAGE] /100

**Required Minimum:** 80/100

### If Score < 80:
**Optimization Recommendations:**
- $OPTIMIZATION_1
- $OPTIMIZATION_2  
- $OPTIMIZATION_3

**Apply optimizations?** (y/n) > [WAIT FOR INPUT]

### If Score ≥ 80:
✅ Capability assessment passed

## Step 5: Capability Finalization

### Final Capability Set:
```yaml
core_capabilities:
  - error_handling
  - logging
  - input_validation
  - output_formatting

domain_capabilities:
  $DOMAIN_SPECIFIC_CAPS

integration_capabilities:
  $INTEGRATION_CAPS

tools_required:
  $TOOLS_LIST

patterns_used:
  $PATTERNS_LIST

performance_targets:
  response_time: $TARGET_MS ms
  memory_usage: $TARGET_MB MB
  cpu_usage: $TARGET_PCT %
```

### Validation Gates Passed:
✅ Technical feasibility confirmed
✅ User experience validated
✅ Best practices compliance verified
✅ Performance targets achievable

## Next Phase

Capabilities mapped and validated using multi-judge assessment.

**Continue to: /agent-builder/04-patterns** with validated capability set.