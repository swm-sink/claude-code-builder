---
allowed-tools: WebSearch, WebFetch, Write, Read, Bash(curl:*)
description: RAG enhancement for knowledge cutoff mitigation and current best practices
argument-hint: [agent-path] [--knowledge-domains domain1,domain2] [--cache-offline]
category: agent-builder
version: 1.0.0
---

# 📚 RAG ENHANCEMENT & KNOWLEDGE AUGMENTATION

Retrieval-Augmented Generation implementation to overcome knowledge cutoff limitations.

## RAG Enhancement Framework

### Research Foundation:
- **Problem**: Knowledge cutoff limits agent effectiveness with current best practices
- **Solution**: RAG integration provides real-time access to current information
- **Implementation**: Hybrid approach with live retrieval and offline caching

### Agent Enhancement Target:
```yaml
$OPTIMIZED_AGENT_CONFIG_FROM_PREVIOUS_STEP
```

### Knowledge Domains for Enhancement:
Based on agent purpose "$AGENT_PURPOSE":
- **Primary Domain**: $PRIMARY_KNOWLEDGE_DOMAIN
- **Secondary Domains**: $SECONDARY_KNOWLEDGE_DOMAINS
- **Technical Domains**: $TECHNICAL_KNOWLEDGE_DOMAINS

## Step 1: Knowledge Gap Analysis

### Current Knowledge Assessment:

**Agent-Specific Knowledge Needs:**
```yaml
agent_purpose: $AGENT_PURPOSE
primary_function: $PRIMARY_FUNCTION
target_users: $TARGET_USERS

knowledge_requirements:
  current_practices: $CURRENT_PRACTICES_NEEDED
  security_standards: $SECURITY_STANDARDS_NEEDED
  performance_benchmarks: $PERFORMANCE_BENCHMARKS_NEEDED
  integration_patterns: $INTEGRATION_PATTERNS_NEEDED
  compliance_requirements: $COMPLIANCE_REQUIREMENTS_NEEDED
```

### Identified Knowledge Gaps:

**Gap 1: Current Best Practices**
- **Issue**: Implementation may not follow 2024+ best practices
- **Impact**: Suboptimal performance, security vulnerabilities
- **Priority**: High

**Gap 2: Latest Security Standards**
- **Issue**: Security measures may be outdated
- **Impact**: Potential vulnerabilities, compliance failures
- **Priority**: Critical

**Gap 3: Performance Optimizations**
- **Issue**: Missing latest optimization techniques
- **Impact**: Poor performance, resource inefficiency
- **Priority**: Medium

**Gap 4: Integration Patterns**
- **Issue**: Integration approaches may be deprecated
- **Impact**: Compatibility issues, maintenance problems
- **Priority**: Medium

## Step 2: Knowledge Source Identification & Retrieval

### Knowledge Source Strategy:

**Primary Sources (High Authority):**
1. **Official Documentation**
   - Claude Code official docs
   - Framework documentation
   - Security guidelines

2. **Academic/Research Sources**
   - Recent research papers
   - Industry reports
   - Best practice studies

3. **Community/Industry Sources**
   - GitHub repositories
   - Stack Overflow insights
   - Industry blogs

### Active Knowledge Retrieval:

**Domain 1: Current Best Practices**
```bash
# Search for latest best practices
knowledge_search_1() {
    local query="$AGENT_PURPOSE best practices 2024 2025 latest"
    echo "Searching for: $query"
    
    # WebSearch for current best practices
    # Results will be integrated into agent context
}

knowledge_search_1
```

**Search Results Summary:**
$BEST_PRACTICES_SEARCH_RESULTS

**Domain 2: Security Standards**
```bash
# Search for current security standards
knowledge_search_2() {
    local query="$DOMAIN_SPECIFIC_SECURITY security standards 2024 2025 vulnerabilities"
    echo "Searching for: $query"
    
    # WebSearch for security standards
    # Results inform security implementation
}

knowledge_search_2
```

**Search Results Summary:**
$SECURITY_SEARCH_RESULTS

**Domain 3: Performance Optimization**
```bash
# Search for performance optimization techniques
knowledge_search_3() {
    local query="$TECHNICAL_DOMAIN performance optimization 2024 benchmarks"
    echo "Searching for: $query"
    
    # WebSearch for performance techniques
    # Results guide optimization approach
}

knowledge_search_3
```

**Search Results Summary:**
$PERFORMANCE_SEARCH_RESULTS

### Documentation Retrieval:

**Official Documentation Fetch:**
```bash
# Fetch current Claude Code documentation
if [[ -n "$CLAUDE_CODE_DOCS_URL" ]]; then
    echo "Fetching Claude Code documentation..."
    # WebFetch current documentation
    # Extract relevant sections for agent type
fi

# Fetch framework-specific documentation
if [[ -n "$FRAMEWORK_DOCS_URL" ]]; then
    echo "Fetching framework documentation..."
    # WebFetch framework docs
    # Extract integration patterns
fi
```

**Documentation Analysis:**
$DOCUMENTATION_ANALYSIS_RESULTS

## Step 3: Knowledge Integration Strategy

### RAG Integration Approaches:

**Approach 1: Context Enhancement**
```bash
# Enhance agent context with retrieved knowledge
${AGENT_NAME}_enhanced_context() {
    cat << 'EOF'
# Current Best Practices (Retrieved: $(date -Iseconds))
$RETRIEVED_BEST_PRACTICES

# Security Standards (Retrieved: $(date -Iseconds))
$RETRIEVED_SECURITY_STANDARDS

# Performance Guidelines (Retrieved: $(date -Iseconds))
$RETRIEVED_PERFORMANCE_GUIDELINES
EOF
}
```

**Approach 2: Dynamic Knowledge Functions**
```bash
# Dynamic knowledge lookup functions
${AGENT_NAME}_get_current_practices() {
    local topic="$1"
    
    # Return cached knowledge or fetch if expired
    local cache_file=".claude/agents/$AGENT_NAME/knowledge_cache/${topic}.json"
    local cache_age=$(($(date +%s) - $(stat -c %Y "$cache_file" 2>/dev/null || echo 0)))
    
    if [[ $cache_age -gt 86400 ]]; then # 24 hours
        # Refresh knowledge
        ${AGENT_NAME}_refresh_knowledge "$topic"
    fi
    
    cat "$cache_file" 2>/dev/null || echo "No current knowledge available for: $topic"
}
```

**Approach 3: Offline Knowledge Cache**
```bash
# Create offline knowledge cache for reliability
${AGENT_NAME}_create_knowledge_cache() {
    local cache_dir=".claude/agents/$AGENT_NAME/knowledge_cache"
    mkdir -p "$cache_dir"
    
    # Cache current best practices
    cat > "$cache_dir/best_practices.md" << 'EOF'
$CACHED_BEST_PRACTICES
EOF
    
    # Cache security standards
    cat > "$cache_dir/security_standards.md" << 'EOF'
$CACHED_SECURITY_STANDARDS
EOF
    
    # Cache performance guidelines
    cat > "$cache_dir/performance_guidelines.md" << 'EOF'
$CACHED_PERFORMANCE_GUIDELINES
EOF
    
    echo "Knowledge cache created: $(date -Iseconds)"
}
```

## Step 4: Enhanced Agent Implementation

### RAG-Enhanced Agent Structure:

```bash
# RAG-Enhanced Agent Implementation
${AGENT_NAME}_rag_main() {
    local args="$@"
    
    # Load current knowledge context
    ${AGENT_NAME}_load_current_knowledge
    
    # Apply current best practices
    ${AGENT_NAME}_apply_current_practices "$args"
    
    # Execute with enhanced context
    ${AGENT_NAME}_enhanced_execute "$args"
    
    # Validate against current standards
    ${AGENT_NAME}_validate_current_standards
}

# Knowledge loading function
${AGENT_NAME}_load_current_knowledge() {
    log_info "Loading current knowledge context..."
    
    # Load cached knowledge
    source .claude/agents/$AGENT_NAME/knowledge_cache/best_practices.md
    source .claude/agents/$AGENT_NAME/knowledge_cache/security_standards.md
    source .claude/agents/$AGENT_NAME/knowledge_cache/performance_guidelines.md
    
    # Verify knowledge freshness
    local knowledge_age=$(${AGENT_NAME}_check_knowledge_age)
    if [[ $knowledge_age -gt 604800 ]]; then # 7 days
        log_warn "Knowledge cache is $((knowledge_age / 86400)) days old. Consider refreshing."
    fi
}

# Current practices application
${AGENT_NAME}_apply_current_practices() {
    local args="$1"
    
    # Apply 2024+ best practices from retrieved knowledge
    $CURRENT_PRACTICES_APPLICATION
    
    # Apply current security standards
    $CURRENT_SECURITY_APPLICATION
    
    # Apply current performance optimizations
    $CURRENT_PERFORMANCE_APPLICATION
}

# Enhanced execution with current context
${AGENT_NAME}_enhanced_execute() {
    local args="$1"
    
    # Execute with current best practices context
    log_info "Executing with current best practices context"
    
    # Original execution logic enhanced with current knowledge
    $ENHANCED_EXECUTION_LOGIC
}

# Current standards validation
${AGENT_NAME}_validate_current_standards() {
    log_info "Validating against current standards..."
    
    # Validate against current security standards
    if ! ${AGENT_NAME}_validate_current_security; then
        log_warn "Security validation against current standards failed"
    fi
    
    # Validate against current performance benchmarks
    if ! ${AGENT_NAME}_validate_current_performance; then
        log_warn "Performance validation against current benchmarks failed"
    fi
    
    # Validate against current compliance requirements
    if ! ${AGENT_NAME}_validate_current_compliance; then
        log_warn "Compliance validation against current requirements failed"
    fi
}
```

### Knowledge Refresh Mechanism:

```bash
# Automatic knowledge refresh
${AGENT_NAME}_refresh_knowledge() {
    local domain="$1"
    
    log_info "Refreshing knowledge for domain: $domain"
    
    case "$domain" in
        "best_practices")
            # Refresh best practices knowledge
            $REFRESH_BEST_PRACTICES_LOGIC
            ;;
        "security")
            # Refresh security knowledge
            $REFRESH_SECURITY_LOGIC
            ;;
        "performance")
            # Refresh performance knowledge
            $REFRESH_PERFORMANCE_LOGIC
            ;;
        *)
            log_error "Unknown knowledge domain: $domain"
            return 1
            ;;
    esac
    
    # Update cache timestamp
    touch ".claude/agents/$AGENT_NAME/knowledge_cache/${domain}.last_updated"
}
```

## Step 5: Knowledge Validation & Quality Assurance

### Knowledge Quality Assessment:

**Source Credibility Check:**
```bash
# Validate knowledge source credibility
${AGENT_NAME}_validate_knowledge_sources() {
    local sources_file=".claude/agents/$AGENT_NAME/knowledge_cache/sources.json"
    
    # Check source authority
    local high_authority_count=$(jq '.sources[] | select(.authority=="high") | length' "$sources_file")
    local total_sources=$(jq '.sources | length' "$sources_file")
    local authority_ratio=$((high_authority_count * 100 / total_sources))
    
    if [[ $authority_ratio -lt 70 ]]; then
        log_warn "Low authority source ratio: $authority_ratio% (recommended: >70%)"
    fi
    
    # Check recency
    local recent_sources=$(jq '.sources[] | select(.date >= "'$(date -d '6 months ago' +%Y-%m-%d)'") | length' "$sources_file")
    local recency_ratio=$((recent_sources * 100 / total_sources))
    
    if [[ $recency_ratio -lt 80 ]]; then
        log_warn "Low recency ratio: $recency_ratio% (recommended: >80%)"
    fi
}
```

**Knowledge Consistency Check:**
```bash
# Check for conflicting information
${AGENT_NAME}_check_knowledge_consistency() {
    local consistency_issues=0
    
    # Check for conflicting best practices
    $CONSISTENCY_CHECK_LOGIC
    
    # Report consistency status
    if [[ $consistency_issues -eq 0 ]]; then
        log_info "Knowledge consistency check passed"
    else
        log_warn "Found $consistency_issues knowledge consistency issues"
    fi
}
```

### Enhanced Agent Testing:

**RAG-Enhanced Testing:**
```bash
# Test enhanced agent with current knowledge
test_rag_enhanced_agent() {
    echo "Testing RAG-enhanced agent..."
    
    # Test knowledge loading
    ${AGENT_NAME}_load_current_knowledge
    knowledge_load_result=$?
    
    # Test enhanced execution
    ${AGENT_NAME}_rag_main $TEST_ARGS
    enhanced_execution_result=$?
    
    # Test knowledge validation
    ${AGENT_NAME}_validate_current_standards
    validation_result=$?
    
    # Report results
    echo "Knowledge Loading: $([[ $knowledge_load_result -eq 0 ]] && echo "✅" || echo "❌")"
    echo "Enhanced Execution: $([[ $enhanced_execution_result -eq 0 ]] && echo "✅" || echo "❌")"
    echo "Standards Validation: $([[ $validation_result -eq 0 ]] && echo "✅" || echo "❌")"
}

test_rag_enhanced_agent
```

## Step 6: Knowledge Cache Management

### Cache Configuration:

```json
{
  "knowledge_cache": {
    "cache_directory": ".claude/agents/$AGENT_NAME/knowledge_cache",
    "refresh_interval": "7d",
    "max_cache_size": "10MB",
    "domains": {
      "best_practices": {
        "sources": $BEST_PRACTICES_SOURCES,
        "last_updated": "$TIMESTAMP",
        "authority_score": $AUTHORITY_SCORE
      },
      "security_standards": {
        "sources": $SECURITY_SOURCES,
        "last_updated": "$TIMESTAMP", 
        "authority_score": $AUTHORITY_SCORE
      },
      "performance_guidelines": {
        "sources": $PERFORMANCE_SOURCES,
        "last_updated": "$TIMESTAMP",
        "authority_score": $AUTHORITY_SCORE
      }
    }
  }
}
```

### Cache Maintenance:

```bash
# Automated cache maintenance
${AGENT_NAME}_maintain_cache() {
    local cache_dir=".claude/agents/$AGENT_NAME/knowledge_cache"
    
    # Check cache size
    local cache_size=$(du -sm "$cache_dir" | cut -f1)
    if [[ $cache_size -gt 10 ]]; then
        log_warn "Cache size ($cache_size MB) exceeds limit (10 MB)"
        ${AGENT_NAME}_cleanup_cache
    fi
    
    # Check cache age
    local oldest_file=$(find "$cache_dir" -type f -printf '%T@ %p\n' | sort -n | head -1 | cut -d' ' -f2-)
    local file_age=$(($(date +%s) - $(stat -c %Y "$oldest_file")))
    
    if [[ $file_age -gt 1209600 ]]; then # 14 days
        log_info "Refreshing aged cache entries"
        ${AGENT_NAME}_refresh_all_knowledge
    fi
}
```

## RAG Enhancement Complete

### Enhancement Summary:

**Knowledge Domains Integrated:**
- ✅ Current best practices (Authority: $BEST_PRACTICES_AUTHORITY)
- ✅ Security standards (Authority: $SECURITY_AUTHORITY)
- ✅ Performance guidelines (Authority: $PERFORMANCE_AUTHORITY)

**RAG Capabilities Added:**
- ✅ Dynamic knowledge loading
- ✅ Current standards validation
- ✅ Offline knowledge caching
- ✅ Automatic knowledge refresh
- ✅ Knowledge quality assurance

**Performance Impact:**
- Knowledge Load Time: $KNOWLEDGE_LOAD_TIME ms
- Cache Size: $CACHE_SIZE MB
- Refresh Frequency: Every $REFRESH_FREQUENCY days

### Agent Enhancement Status:
**RAG Integration**: ✅ Complete
**Knowledge Freshness**: ✅ Current (within $KNOWLEDGE_AGE days)
**Offline Capability**: ✅ Functional with cache
**Quality Assurance**: ✅ Validated sources

## Next Phase

RAG enhancement completed with current knowledge integration.

**Continue to: /agent-builder/11-finalize** for final agent packaging and deployment.