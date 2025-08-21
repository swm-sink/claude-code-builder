---
allowed-tools: Write, Read, Bash(find patterns:*), WebFetch
description: Claude Code frontmatter and metadata generation with compliance validation
argument-hint: [build-config] [--validate-tools] [--check-compliance]
category: command-builder
version: 1.0.0
---

# 📋 CLAUDE CODE FRONTMATTER & METADATA

Generate compliant Claude Code command frontmatter based on current standards and research findings.

## Frontmatter Generation Framework

### Build Configuration:
```yaml
$BUILD_CONFIG_FROM_MASTER
```

### Research Foundation Applied:
- ✅ Claude Code documentation requirements
- ✅ Current frontmatter best practices
- ✅ Tool permission standards
- ✅ Metadata optimization for discovery

## Step 1: Command Metadata Definition

### Basic Metadata Collection:

**Command Name Validation:**
Current name: `$COMMAND_NAME`

**Name Check Results:**
- ✅ Valid characters (a-z, 0-9, hyphens)
- ✅ Length appropriate (3-30 characters)
- ✅ No reserved keywords
- ✅ Descriptive and clear

**Command Category Selection:**

Based on research findings, select the most appropriate category:

1. **build** - Commands that create, generate, or construct
   - Examples: build-agent, build-docs, build-package
   - Best for: Generation and creation tasks

2. **test** - Commands that validate, verify, or check
   - Examples: test-security, test-performance, test-integration
   - Best for: Testing and validation tasks

3. **analyze** - Commands that examine, review, or assess
   - Examples: analyze-code, analyze-dependencies, analyze-performance
   - Best for: Analysis and inspection tasks

4. **fix** - Commands that repair, correct, or improve
   - Examples: fix-security, fix-formatting, fix-errors
   - Best for: Remediation and correction tasks

5. **workflow** - Commands that orchestrate, manage, or automate
   - Examples: workflow-deploy, workflow-release, workflow-ci
   - Best for: Process automation and orchestration

6. **custom** - Specialized commands not fitting other categories
   - Examples: domain-specific commands
   - Best for: Unique or specialized functionality

**Auto-detected category for "$COMMAND_NAME":** $AUTO_DETECTED_CATEGORY

**Confirm category or select different (1-6):** > [WAIT FOR INPUT]

### Description Optimization:

**Current description:** $INITIAL_DESCRIPTION

**Description Enhancement Using Best Practices:**

Based on research findings, an optimal description should:
- Be 1-2 lines maximum
- Start with action verb
- Clearly state the outcome
- Include key context
- Be discoverable in search

**Enhanced Description Options:**

**Option A (Concise):** $CONCISE_DESCRIPTION
**Option B (Detailed):** $DETAILED_DESCRIPTION  
**Option C (Action-Focused):** $ACTION_FOCUSED_DESCRIPTION

**Select description (A/B/C) or provide custom:** > [WAIT FOR INPUT]

## Step 2: Tool Permissions Configuration

### Tool Requirements Analysis:

Based on command purpose and current security best practices:

**Auto-Detected Tool Requirements:**
```yaml
detected_tools:
  essential: $ESSENTIAL_TOOLS
  optional: $OPTIONAL_TOOLS
  security_level: $SECURITY_LEVEL
```

### Tool Permission Builder:

**Core Tools Assessment:**

**Bash Commands:**
Your command will likely need bash execution. Specify patterns:

1. **Full Bash Access** (⚠️ High Security Risk)
   ```yaml
   allowed-tools: Bash(*)
   ```

2. **Pattern-Restricted Bash** (✅ Recommended)
   ```yaml
   allowed-tools: Bash(git status:*), Bash(npm test:*), Bash(docker build:*)
   ```

3. **No Bash Access** (🔒 Maximum Security)
   ```yaml
   # Bash not included in allowed-tools
   ```

**For your command "$COMMAND_NAME", recommend:** $BASH_RECOMMENDATION

**Specify bash patterns needed:** > [WAIT FOR INPUT]
Examples: "git status:*", "npm test:*", "find . -name:*"

**File System Tools:**
Does your command need file system access?

- **Read**: Read files and directories
- **Write**: Create and modify files  
- **Glob**: Pattern-based file discovery
- **LS**: Directory listings

**Select needed file tools (Read/Write/Glob/LS/None):** > [WAIT FOR INPUT]

**Network Tools:**
Does your command need network access?

- **WebSearch**: Search the web for information
- **WebFetch**: Fetch content from URLs
- **Curl**: Direct HTTP requests

**Select needed network tools (WebSearch/WebFetch/Curl/None):** > [WAIT FOR INPUT]

**Code Analysis Tools:**
Does your command analyze or work with code?

- **Grep**: Pattern searching in files
- **Edit**: Code modification capabilities
- **MultiEdit**: Multiple file editing

**Select needed code tools (Grep/Edit/MultiEdit/None):** > [WAIT FOR INPUT]

### Tool Permission Validation:

**Generated Tool Configuration:**
```yaml
allowed-tools: $GENERATED_TOOL_LIST
```

**Security Assessment:**
- **Risk Level**: $RISK_LEVEL (Low/Medium/High)
- **Justification**: $RISK_JUSTIFICATION
- **Recommendations**: $SECURITY_RECOMMENDATIONS

**Security Compliance Check:**
- ✅ Principle of least privilege applied
- ✅ No unnecessary permissions granted
- ✅ Pattern restrictions where applicable
- ✅ Documented security rationale

## Step 3: Argument Specification

### Argument Hint Optimization:

**Purpose:** Help users understand command usage at a glance

**Argument Pattern Analysis:**
Based on command purpose, detect likely argument patterns:

**Pattern 1: File/Path Arguments**
```
[file-path] [--options]
```

**Pattern 2: Action Arguments**  
```
[action] [target] [--flags]
```

**Pattern 3: Configuration Arguments**
```
[--config key=value] [--verbose]
```

**Pattern 4: No Arguments**
```
(no arguments required)
```

**Auto-detected pattern for "$COMMAND_NAME":** $DETECTED_PATTERN

**Customize argument hint:** > [WAIT FOR INPUT]
Current: `$CURRENT_ARGUMENT_HINT`

### Advanced Metadata Options:

**Version Strategy:**
- **Semantic Versioning** (1.0.0) - Recommended for most commands
- **Date Versioning** (2024.01) - For time-based commands
- **Simple Versioning** (v1) - For simple commands

**Select versioning (semantic/date/simple):** > [WAIT FOR INPUT]

**Additional Metadata (Optional):**

**Author Information:**
- Author: > [OPTIONAL INPUT]
- Contact: > [OPTIONAL INPUT]

**Keywords for Discovery:**
- Keywords: > [OPTIONAL INPUT - comma separated]

**Dependencies:**
- Required patterns: > [AUTO-DETECTED + MANUAL INPUT]
- Min bash version: > [DEFAULT: 3.0]

## Step 4: Frontmatter Generation

### Complete Frontmatter Assembly:

```yaml
---
allowed-tools: $FINAL_TOOL_LIST
description: $FINAL_DESCRIPTION
argument-hint: $FINAL_ARGUMENT_HINT
category: $FINAL_CATEGORY
version: $FINAL_VERSION
author: $AUTHOR_INFO
keywords: $KEYWORDS_LIST
dependencies:
  patterns: $PATTERN_DEPENDENCIES
  bash_version: $MIN_BASH_VERSION
created: $(date -Iseconds)
security_level: $SECURITY_LEVEL
complexity: $COMPLEXITY_LEVEL
build_mode: $BUILD_MODE
research_date: $(date -Iseconds)
---
```

### Frontmatter Validation:

**Compliance Check:**
```bash
# Validate frontmatter against Claude Code standards
validate_frontmatter() {
    local frontmatter="$1"
    
    # Required fields check
    local required_fields=("allowed-tools" "description" "argument-hint" "category" "version")
    for field in "${required_fields[@]}"; do
        if ! echo "$frontmatter" | grep -q "^$field:"; then
            echo "❌ Missing required field: $field"
            return 1
        fi
    done
    
    # Tool format validation
    if echo "$frontmatter" | grep -q "allowed-tools:.*Bash(\*)" && [[ "$SECURITY_LEVEL" != "development" ]]; then
        echo "⚠️ Unrestricted Bash access detected"
    fi
    
    # Description length check
    local desc_length=$(echo "$frontmatter" | grep "^description:" | wc -c)
    if [[ $desc_length -gt 100 ]]; then
        echo "⚠️ Description may be too long ($desc_length chars)"
    fi
    
    echo "✅ Frontmatter validation passed"
    return 0
}

validate_frontmatter "$GENERATED_FRONTMATTER"
```

**Validation Results:**
$FRONTMATTER_VALIDATION_RESULTS

### Best Practices Compliance:

**Research-Based Optimizations Applied:**
- ✅ Tool permissions follow principle of least privilege
- ✅ Description optimized for discoverability
- ✅ Argument hint provides clear usage guidance
- ✅ Category alignment with Claude Code standards
- ✅ Version strategy appropriate for command type
- ✅ Security metadata included for assessment
- ✅ Build metadata preserved for maintenance

### Quality Score Assessment:

**Frontmatter Quality Score:** $FRONTMATTER_QUALITY_SCORE/100

**Scoring Breakdown:**
- **Completeness** (25pts): $COMPLETENESS_SCORE/25
- **Security** (25pts): $SECURITY_SCORE/25
- **Discoverability** (25pts): $DISCOVERABILITY_SCORE/25
- **Compliance** (25pts): $COMPLIANCE_SCORE/25

**Quality Gate:** $QUALITY_GATE_STATUS ✅/❌ (Minimum: 70/100)

## Step 5: Frontmatter Finalization

### Final Frontmatter Review:

```yaml
$COMPLETE_FINAL_FRONTMATTER
```

**Approve frontmatter?** (y/n) > [WAIT FOR APPROVAL]

### If Improvements Needed:

**Optimization Suggestions:**
$OPTIMIZATION_SUGGESTIONS

**Apply optimizations?** (y/n) > [WAIT FOR INPUT IF NEEDED]

### Frontmatter Storage:

```bash
# Store frontmatter for next phase
cat > ".claude/command-builder/build_state.yaml" << EOF
command_name: $COMMAND_NAME
frontmatter: |
$FINAL_FRONTMATTER
build_config: $BUILD_CONFIG
phase_completed: frontmatter
next_phase: actions
quality_score: $FRONTMATTER_QUALITY_SCORE
validation_status: $VALIDATION_STATUS
EOF
```

## Frontmatter Phase Complete

### Phase Summary:
- ✅ **Command metadata defined** with research-backed optimization
- ✅ **Tool permissions configured** following security best practices
- ✅ **Frontmatter generated** in compliance with Claude Code standards
- ✅ **Quality validated** with $FRONTMATTER_QUALITY_SCORE/100 score
- ✅ **Security assessed** at $SECURITY_LEVEL level

### Next Phase:

**Continue to:** `/command-builder/03-actions` for command action definition.

Your frontmatter is ready and will be included in the final command implementation.

**Ready to proceed to action definition?** (y/n) > [WAIT FOR CONFIRMATION]