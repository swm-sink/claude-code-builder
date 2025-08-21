---
allowed-tools: Write, Read, Bash(cp:*), Bash(chmod:*), Bash(tar:*)
description: Agent finalization, packaging, and deployment preparation
argument-hint: [agent-path] [--package] [--deploy] [--documentation]
category: agent-builder
version: 1.0.0
---

# 🎯 AGENT FINALIZATION & DEPLOYMENT

Final agent packaging, documentation, and deployment preparation.

## Finalization Framework

### Agent Completion Status:
```yaml
$RAG_ENHANCED_AGENT_STATUS_FROM_PREVIOUS_STEP
```

### Quality Gates Achieved:
- ✅ Research Phase: Current best practices integrated
- ✅ Multi-Prompt Validation: $MULTI_PROMPT_SUCCESS_RATE% success rate
- ✅ Three-Judge Evaluation: $CONSENSUS_SCORE/50 consensus score
- ✅ Meta-Prompt Optimization: $OPTIMIZATION_ITERATIONS iterations completed
- ✅ RAG Enhancement: Current knowledge integrated

## Step 1: Final Agent Validation

### Comprehensive Final Testing:

```bash
# Complete agent validation suite
final_validation_suite() {
    local agent_path=".claude/agents/$AGENT_NAME"
    local validation_results=()
    
    echo "=== FINAL AGENT VALIDATION SUITE ==="
    
    # Test 1: Basic Functionality
    echo "Testing basic functionality..."
    source "$agent_path/agent.md"
    if ${AGENT_NAME}_main --help >/dev/null 2>&1; then
        validation_results+=("✅ Basic functionality")
    else
        validation_results+=("❌ Basic functionality")
    fi
    
    # Test 2: Pattern Integration
    echo "Testing pattern integration..."
    if declare -f log_info handle_error >/dev/null 2>&1; then
        validation_results+=("✅ Pattern integration")
    else
        validation_results+=("❌ Pattern integration")
    fi
    
    # Test 3: Error Handling
    echo "Testing error handling..."
    if ${AGENT_NAME}_main invalid_args 2>&1 | grep -q "ERROR"; then
        validation_results+=("✅ Error handling")
    else
        validation_results+=("❌ Error handling")
    fi
    
    # Test 4: Performance
    echo "Testing performance..."
    local start_time=$(date +%s%N)
    ${AGENT_NAME}_main $PERFORMANCE_TEST_ARGS >/dev/null 2>&1
    local end_time=$(date +%s%N)
    local duration=$((($end_time - $start_time) / 1000000))
    
    if [[ $duration -le $TARGET_RESPONSE_TIME ]]; then
        validation_results+=("✅ Performance ($duration ms)")
    else
        validation_results+=("❌ Performance ($duration ms > $TARGET_RESPONSE_TIME ms)")
    fi
    
    # Test 5: Knowledge Integration
    echo "Testing RAG knowledge integration..."
    if ${AGENT_NAME}_load_current_knowledge >/dev/null 2>&1; then
        validation_results+=("✅ Knowledge integration")
    else
        validation_results+=("❌ Knowledge integration")
    fi
    
    # Report results
    echo "=== VALIDATION RESULTS ==="
    printf '%s\n' "${validation_results[@]}"
    
    # Calculate pass rate
    local passed=$(printf '%s\n' "${validation_results[@]}" | grep -c "✅")
    local total=${#validation_results[@]}
    local pass_rate=$((passed * 100 / total))
    
    echo "Pass Rate: $pass_rate% ($passed/$total)"
    
    if [[ $pass_rate -ge 80 ]]; then
        echo "✅ Final validation PASSED"
        return 0
    else
        echo "❌ Final validation FAILED"
        return 1
    fi
}

final_validation_suite
```

### Validation Results:
$FINAL_VALIDATION_RESULTS

## Step 2: Agent Documentation Generation

### Complete Documentation Suite:

**README.md Generation:**
```markdown
# $AGENT_NAME

$AGENT_DESCRIPTION

## Overview

$DETAILED_OVERVIEW

## Features

- ✅ **Current Best Practices**: Integrated 2024+ standards
- ✅ **Security Hardened**: Latest security measures implemented
- ✅ **Performance Optimized**: $TARGET_RESPONSE_TIME ms target response time
- ✅ **RAG Enhanced**: Current knowledge integration
- ✅ **Pattern Based**: Uses Claude Code Builder patterns
- ✅ **Well Tested**: $MULTI_PROMPT_SUCCESS_RATE% success rate across usage scenarios

## Installation

\`\`\`bash
# Copy agent to your project
cp -r .claude/agents/$AGENT_NAME /your/project/.claude/agents/

# Or install via Claude Code Builder
source patterns/agent-builder/agent-installer.sh
install_agent "$AGENT_NAME"
\`\`\`

## Quick Start

\`\`\`bash
# Source the agent
source .claude/agents/$AGENT_NAME/agent.md

# Basic usage
${AGENT_NAME}_main [arguments]

# With help
${AGENT_NAME}_main --help

# Advanced usage with monitoring
${AGENT_NAME}_monitor_performance ${AGENT_NAME}_main [arguments]
\`\`\`

## Usage Examples

### Basic Example
\`\`\`bash
${AGENT_NAME}_main $BASIC_EXAMPLE_ARGS
\`\`\`

### Advanced Example
\`\`\`bash
${AGENT_NAME}_main $ADVANCED_EXAMPLE_ARGS
\`\`\`

### With Configuration
\`\`\`bash
export ${AGENT_NAME}_CONFIG="custom_value"
${AGENT_NAME}_main $CONFIG_EXAMPLE_ARGS
\`\`\`

## Configuration

### Environment Variables
- \`${AGENT_NAME}_DEBUG\`: Enable debug logging (0/1)
- \`${AGENT_NAME}_TIMEOUT\`: Operation timeout in seconds
- \`${AGENT_NAME}_OUTPUT_FORMAT\`: Output format (json/text/verbose)

### Configuration File
Create \`.claude/agents/$AGENT_NAME/config.local.json\` for custom configuration:

\`\`\`json
{
  "timeout": 30,
  "output_format": "verbose",
  "enable_monitoring": true,
  "knowledge_refresh_interval": "7d"
}
\`\`\`

## API Reference

### Main Functions

#### \`${AGENT_NAME}_main(args...)\`
Main agent entry point.

**Parameters:**
- \`args...\`: Command arguments

**Returns:**
- \`0\`: Success
- \`1\`: General error
- \`2\`: Invalid arguments
- \`3\`: Execution failed

#### \`${AGENT_NAME}_validate_inputs(inputs)\`
Validate input arguments.

#### \`${AGENT_NAME}_load_current_knowledge()\`
Load current best practices and knowledge.

#### \`${AGENT_NAME}_monitor_performance(command)\`
Execute command with performance monitoring.

### Configuration Functions

#### \`${AGENT_NAME}_get_config(key, default)\`
Get configuration value.

#### \`${AGENT_NAME}_set_config(key, value)\`
Set configuration value.

## Troubleshooting

### Common Issues

**Issue: Agent not found**
\`\`\`bash
# Ensure agent is properly sourced
source .claude/agents/$AGENT_NAME/agent.md
\`\`\`

**Issue: Permission denied**
\`\`\`bash
# Check file permissions
chmod +x .claude/agents/$AGENT_NAME/agent.md
\`\`\`

**Issue: Pattern not found**
\`\`\`bash
# Verify Claude Code Builder patterns are available
ls patterns/*/
\`\`\`

### Debug Mode

Enable debug mode for detailed logging:
\`\`\`bash
export ${AGENT_NAME}_DEBUG=1
${AGENT_NAME}_main [arguments]
\`\`\`

## Performance

### Benchmarks
- **Response Time**: ~$AVERAGE_RESPONSE_TIME ms
- **Memory Usage**: ~$AVERAGE_MEMORY_USAGE MB
- **Success Rate**: $SUCCESS_RATE%

### Optimization Tips
1. Use caching for repeated operations
2. Enable knowledge cache for offline usage
3. Configure appropriate timeouts
4. Use monitoring for performance insights

## Security

### Security Features
- ✅ Input validation and sanitization
- ✅ Output security and escaping
- ✅ Secure defaults
- ✅ Audit logging
- ✅ Current security standards compliance

### Security Configuration
\`\`\`bash
# Enable strict security mode
export ${AGENT_NAME}_SECURITY_STRICT=1

# Configure audit logging
export ${AGENT_NAME}_AUDIT_LOG="/path/to/audit.log"
\`\`\`

## Contributing

### Development Setup
\`\`\`bash
# Clone and setup development environment
git clone [repository]
cd claude-code-builder
source patterns/error-handling/simple-error-handling.sh
source patterns/logging/simple-logging.sh
\`\`\`

### Running Tests
\`\`\`bash
# Run test suite
.claude/agents/$AGENT_NAME/tests/run_all_tests.sh

# Run specific test
.claude/agents/$AGENT_NAME/tests/basic.sh
\`\`\`

### Code Standards
- Follow bash best practices
- Maintain <50 lines per function
- Include comprehensive error handling
- Add appropriate logging
- Update tests for new features

## License

$LICENSE_INFORMATION

## Support

- **Documentation**: [docs/](.claude/agents/$AGENT_NAME/docs/)
- **Issues**: [Create an issue](repository_url/issues)
- **Discussions**: [Community discussions](repository_url/discussions)

---

**Generated by Claude Code Builder** - Version $VERSION
**Agent Version**: $AGENT_VERSION
**Created**: $CREATION_DATE
**Last Updated**: $LAST_UPDATED
```

**API Reference (docs/api.md):**
```markdown
# $AGENT_NAME API Reference

Complete API documentation for $AGENT_NAME.

## Function Reference

$COMPLETE_API_DOCUMENTATION

## Error Codes

$ERROR_CODE_DOCUMENTATION

## Configuration Reference

$CONFIGURATION_DOCUMENTATION

## Examples

$API_EXAMPLES
```

**Troubleshooting Guide (docs/troubleshooting.md):**
```markdown
# $AGENT_NAME Troubleshooting Guide

$TROUBLESHOOTING_DOCUMENTATION
```

## Step 3: Agent Packaging

### Package Structure Creation:

```bash
# Create distribution package
create_agent_package() {
    local package_dir=".claude/agents/$AGENT_NAME/dist"
    local package_name="${AGENT_NAME}-v${AGENT_VERSION}"
    
    # Create package directory
    mkdir -p "$package_dir"
    
    # Copy core files
    cp .claude/agents/$AGENT_NAME/agent.md "$package_dir/"
    cp .claude/agents/$AGENT_NAME/config.json "$package_dir/"
    cp .claude/agents/$AGENT_NAME/README.md "$package_dir/"
    
    # Copy documentation
    cp -r .claude/agents/$AGENT_NAME/docs "$package_dir/"
    
    # Copy tests
    cp -r .claude/agents/$AGENT_NAME/tests "$package_dir/"
    
    # Copy knowledge cache
    cp -r .claude/agents/$AGENT_NAME/knowledge_cache "$package_dir/"
    
    # Create installation script
    cat > "$package_dir/install.sh" << 'EOF'
#!/bin/bash
# Installation script for $AGENT_NAME

set -euo pipefail

echo "Installing $AGENT_NAME..."

# Check prerequisites
if ! command -v bash >/dev/null 2>&1; then
    echo "Error: bash is required"
    exit 1
fi

# Create target directory
mkdir -p .claude/agents/$AGENT_NAME

# Copy files
cp -r ./* .claude/agents/$AGENT_NAME/

# Set permissions
chmod +x .claude/agents/$AGENT_NAME/agent.md
chmod +x .claude/agents/$AGENT_NAME/tests/*.sh

echo "✅ $AGENT_NAME installed successfully"
echo "Usage: source .claude/agents/$AGENT_NAME/agent.md"
EOF
    
    chmod +x "$package_dir/install.sh"
    
    # Create package metadata
    cat > "$package_dir/package.json" << EOF
{
  "name": "$AGENT_NAME",
  "version": "$AGENT_VERSION",
  "description": "$AGENT_DESCRIPTION",
  "author": "$AGENT_AUTHOR",
  "license": "$AGENT_LICENSE",
  "keywords": $AGENT_KEYWORDS,
  "claude_code_builder_version": "$CCB_VERSION",
  "created": "$CREATION_DATE",
  "packaged": "$(date -Iseconds)",
  "dependencies": {
    "patterns": $PATTERN_DEPENDENCIES,
    "tools": $TOOL_DEPENDENCIES
  },
  "compatibility": {
    "bash_version": ">=3.0",
    "os": ["linux", "macos"],
    "claude_code": ">=1.0"
  },
  "quality_metrics": {
    "consensus_score": "$CONSENSUS_SCORE/50",
    "multi_prompt_success_rate": "$MULTI_PROMPT_SUCCESS_RATE%",
    "optimization_iterations": $OPTIMIZATION_ITERATIONS,
    "test_coverage": "$TEST_COVERAGE%"
  }
}
EOF
    
    # Create package archive
    cd "$package_dir/.."
    tar -czf "${package_name}.tar.gz" dist/
    
    echo "Package created: .claude/agents/$AGENT_NAME/${package_name}.tar.gz"
}

create_agent_package
```

### Package Validation:

```bash
# Validate package integrity
validate_package() {
    local package_file=".claude/agents/$AGENT_NAME/${AGENT_NAME}-v${AGENT_VERSION}.tar.gz"
    
    echo "Validating package: $package_file"
    
    # Check package exists
    if [[ ! -f "$package_file" ]]; then
        echo "❌ Package file not found"
        return 1
    fi
    
    # Check package contents
    local temp_dir=$(mktemp -d)
    tar -xzf "$package_file" -C "$temp_dir"
    
    # Validate required files
    local required_files=(
        "dist/agent.md"
        "dist/config.json"
        "dist/README.md"
        "dist/install.sh"
        "dist/package.json"
    )
    
    for file in "${required_files[@]}"; do
        if [[ -f "$temp_dir/$file" ]]; then
            echo "✅ $file"
        else
            echo "❌ $file missing"
            rm -rf "$temp_dir"
            return 1
        fi
    done
    
    # Test installation
    cd "$temp_dir/dist"
    if ./install.sh; then
        echo "✅ Installation test passed"
    else
        echo "❌ Installation test failed"
        rm -rf "$temp_dir"
        return 1
    fi
    
    # Cleanup
    rm -rf "$temp_dir"
    
    echo "✅ Package validation passed"
    return 0
}

validate_package
```

## Step 4: Deployment Preparation

### Deployment Checklist:

**Pre-Deployment Validation:**
☐ All tests pass (100% success rate)
☐ Documentation complete and accurate
☐ Package integrity validated
☐ Security scan clean
☐ Performance targets met
☐ Knowledge cache current
☐ Version information correct

**Deployment Options:**

**Option 1: Local Deployment**
```bash
# Deploy to current project
cp -r .claude/agents/$AGENT_NAME /target/project/.claude/agents/
```

**Option 2: Repository Deployment**
```bash
# Add to Claude Code Builder repository
cp -r .claude/agents/$AGENT_NAME .claude/agents/community/
git add .claude/agents/community/$AGENT_NAME
git commit -m "Add $AGENT_NAME community agent"
```

**Option 3: Package Distribution**
```bash
# Create distribution package
package_file=".claude/agents/$AGENT_NAME/${AGENT_NAME}-v${AGENT_VERSION}.tar.gz"
echo "Distribution package ready: $package_file"
```

### Registry Registration:

```bash
# Register agent in community registry
register_agent() {
    local registry_file=".claude/agents/registry.json"
    local agent_entry=$(cat << EOF
{
  "name": "$AGENT_NAME",
  "version": "$AGENT_VERSION",
  "description": "$AGENT_DESCRIPTION",
  "category": "$AGENT_CATEGORY",
  "author": "$AGENT_AUTHOR",
  "created": "$CREATION_DATE",
  "updated": "$(date -Iseconds)",
  "quality_score": "$CONSENSUS_SCORE/50",
  "download_url": "$PACKAGE_DOWNLOAD_URL",
  "documentation_url": "$DOCS_URL",
  "tags": $AGENT_TAGS
}
EOF
)
    
    # Add to registry
    jq ". += [$agent_entry]" "$registry_file" > "$registry_file.tmp"
    mv "$registry_file.tmp" "$registry_file"
    
    echo "✅ Agent registered in community registry"
}

register_agent
```

## Step 5: Final Quality Report

### Agent Quality Summary:

```yaml
agent_quality_report:
  name: $AGENT_NAME
  version: $AGENT_VERSION
  creation_date: $CREATION_DATE
  finalization_date: $(date -Iseconds)
  
  quality_metrics:
    consensus_score: $CONSENSUS_SCORE/50
    multi_prompt_success_rate: $MULTI_PROMPT_SUCCESS_RATE%
    optimization_iterations: $OPTIMIZATION_ITERATIONS
    final_validation_pass_rate: $FINAL_VALIDATION_PASS_RATE%
    
  capability_assessment:
    technical_correctness: $JUDGE1_FINAL_SCORE/50
    user_experience: $JUDGE2_FINAL_SCORE/50
    standards_compliance: $JUDGE3_FINAL_SCORE/50
    
  performance_metrics:
    average_response_time: $AVERAGE_RESPONSE_TIME ms
    memory_usage: $AVERAGE_MEMORY_USAGE MB
    success_rate: $SUCCESS_RATE%
    
  enhancement_status:
    research_conducted: ✅
    rag_enhanced: ✅
    current_knowledge: ✅ (age: $KNOWLEDGE_AGE days)
    optimization_applied: ✅
    
  deployment_readiness:
    package_created: ✅
    documentation_complete: ✅
    tests_passing: ✅
    security_validated: ✅
    performance_verified: ✅
    
  certification_level: $CERTIFICATION_LEVEL
  ready_for_production: $PRODUCTION_READY
```

### Certification Levels:
- **Bronze** (60-69%): Basic functionality, suitable for development
- **Silver** (70-84%): Good quality, suitable for team use  
- **Gold** (85-94%): High quality, suitable for production
- **Platinum** (95-100%): Excellence standard, suitable for critical use

**Agent Certification**: $CERTIFICATION_LEVEL 🏆

## Agent Finalization Complete

### Summary:
- ✅ **Agent Created**: $AGENT_NAME v$AGENT_VERSION
- ✅ **Quality Assured**: $CONSENSUS_SCORE/50 consensus score
- ✅ **Research Validated**: Current best practices integrated
- ✅ **Multi-Prompt Tested**: $MULTI_PROMPT_SUCCESS_RATE% success rate
- ✅ **Performance Optimized**: $OPTIMIZATION_ITERATIONS optimization iterations
- ✅ **Knowledge Enhanced**: RAG integration with current knowledge
- ✅ **Packaged**: Ready for distribution
- ✅ **Documented**: Complete documentation suite
- ✅ **Tested**: All validation tests passed

### Agent Location:
**Primary**: `.claude/agents/$AGENT_NAME/`
**Package**: `.claude/agents/$AGENT_NAME/${AGENT_NAME}-v${AGENT_VERSION}.tar.gz`
**Documentation**: `.claude/agents/$AGENT_NAME/docs/`

### Usage:
```bash
# Source and use the agent
source .claude/agents/$AGENT_NAME/agent.md
${AGENT_NAME}_main --help
```

**🎉 Agent creation completed successfully with research-backed validation and current best practices integration!**