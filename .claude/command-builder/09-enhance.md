---
allowed-tools: WebSearch, WebFetch, Write, Read, Bash(curl:*)
description: RAG enhancement for command knowledge integration and current best practices
argument-hint: [enhance-config] [--knowledge-domains domain1,domain2] [--cache-offline]
category: command-builder
version: 1.0.0
---

# 📚 COMMAND RAG ENHANCEMENT

Retrieval-Augmented Generation for command knowledge integration and current best practices.

## Enhancement Framework

### Optimization Results:
```yaml
$OPTIMIZATION_RESULTS_FROM_PREVIOUS_STEP
```

### Research Foundation Applied:
- ✅ RAG methodology for command enhancement
- ✅ Knowledge domain specialization
- ✅ Current best practices integration
- ✅ Offline knowledge caching for reliability

## Step 1: Command Knowledge Domain Analysis

### Knowledge Requirements Assessment:

**Command-Specific Knowledge Needs:**
```yaml
command_analysis:
  name: $COMMAND_NAME
  category: $COMMAND_CATEGORY
  complexity: $COMMAND_COMPLEXITY
  current_score: $FINAL_CONSENSUS_SCORE/100
  
knowledge_domains_required:
  primary_domain: $PRIMARY_KNOWLEDGE_DOMAIN
  secondary_domains: $SECONDARY_KNOWLEDGE_DOMAINS
  technical_specializations: $TECHNICAL_SPECIALIZATIONS
```

**Knowledge Gap Analysis:**
```bash
${COMMAND_NAME}_analyze_knowledge_gaps() {
    echo "Analyzing knowledge gaps for command enhancement..."
    
    local knowledge_gaps=()
    
    # Gap 1: Current Command Best Practices
    if [[ $FINAL_CONSENSUS_SCORE -lt 90 ]]; then
        knowledge_gaps+=("Current best practices for $COMMAND_CATEGORY commands")
    fi
    
    # Gap 2: Latest Technology Standards
    knowledge_gaps+=("2024-2025 standards for $TECHNICAL_DOMAIN")
    
    # Gap 3: Security Best Practices
    if grep -q "security.*score.*[0-6]" <<< "$JUDGE1_DETAILED_SCORES"; then
        knowledge_gaps+=("Current security standards for CLI tools")
    fi
    
    # Gap 4: Performance Optimization
    if [[ "$PERFORMANCE_STABILITY" != "stable" ]]; then
        knowledge_gaps+=("Performance optimization techniques")
    fi
    
    # Gap 5: User Experience Patterns
    if [[ $JUDGE2_TOTAL_SCORE -lt 80 ]]; then
        knowledge_gaps+=("Modern UX patterns for command-line interfaces")
    fi
    
    # Gap 6: Integration Patterns
    knowledge_gaps+=("Claude Code Builder integration best practices")
    
    echo "Identified Knowledge Gaps:"
    printf '  - %s\n' "${knowledge_gaps[@]}"
    
    export COMMAND_KNOWLEDGE_GAPS="$(IFS=';'; echo "${knowledge_gaps[*]}")"
    export KNOWLEDGE_GAP_COUNT="${#knowledge_gaps[@]}"
    
    return 0
}

${COMMAND_NAME}_analyze_knowledge_gaps
```

### Knowledge Source Strategy:

**Prioritized Knowledge Sources:**

1. **Official Documentation** (Highest Authority)
   - Claude Code official documentation
   - Language/framework official docs
   - Security standards organizations

2. **Recent Research & Standards** (High Authority)
   - 2024-2025 research papers
   - Industry best practice reports
   - Security vulnerability databases

3. **Community Best Practices** (Medium Authority)
   - High-quality GitHub repositories
   - Technical blogs from recognized experts
   - Stack Overflow patterns and solutions

4. **Performance & Optimization** (Medium Authority)
   - Benchmarking studies
   - Performance optimization guides
   - Resource management best practices

## Step 2: Knowledge Retrieval & Integration

### Systematic Knowledge Gathering:

**Knowledge Domain 1: Current Best Practices**
```bash
${COMMAND_NAME}_retrieve_best_practices() {
    echo "Retrieving current best practices for $COMMAND_CATEGORY commands..."
    
    # Search for recent best practices
    local search_query="${COMMAND_CATEGORY} command best practices 2024 2025 CLI tools"
    echo "Searching: $search_query"
    
    # This would trigger WebSearch for current best practices
    # Results stored for integration
    
    # Expected knowledge areas:
    local best_practices_areas=(
        "argument_parsing_patterns"
        "output_formatting_standards"
        "error_handling_approaches"
        "configuration_management"
        "user_feedback_mechanisms"
        "performance_optimization"
        "security_considerations"
        "testing_strategies"
    )
    
    echo "Best practices areas to research:"
    printf '  - %s\n' "${best_practices_areas[@]}"
    
    # Store for later integration
    export BEST_PRACTICES_AREAS="$(IFS=';'; echo "${best_practices_areas[*]}")"
}

${COMMAND_NAME}_retrieve_best_practices
```

**Knowledge Domain 2: Security Standards**
```bash
${COMMAND_NAME}_retrieve_security_standards() {
    echo "Retrieving current security standards for CLI tools..."
    
    local security_query="CLI command security best practices 2024 input validation"
    echo "Searching: $security_query"
    
    # Security knowledge areas
    local security_areas=(
        "input_validation_patterns"
        "output_sanitization"
        "privilege_escalation_prevention"
        "secure_file_handling"
        "environment_variable_security"
        "command_injection_prevention"
        "path_traversal_protection"
        "secure_communication"
    )
    
    echo "Security areas to research:"
    printf '  - %s\n' "${security_areas[@]}"
    
    export SECURITY_AREAS="$(IFS=';'; echo "${security_areas[*]}")"
}

${COMMAND_NAME}_retrieve_security_standards
```

**Knowledge Domain 3: Performance Optimization**
```bash
${COMMAND_NAME}_retrieve_performance_knowledge() {
    echo "Retrieving performance optimization knowledge..."
    
    local performance_query="bash script performance optimization 2024 CLI tools speed"
    echo "Searching: $performance_query"
    
    local performance_areas=(
        "memory_optimization_techniques"
        "cpu_usage_optimization"
        "io_operation_efficiency"
        "parallel_processing_patterns"
        "caching_strategies"
        "resource_management"
        "profiling_techniques"
        "bottleneck_identification"
    )
    
    echo "Performance areas to research:"
    printf '  - %s\n' "${performance_areas[@]}"
    
    export PERFORMANCE_AREAS="$(IFS=';'; echo "${performance_areas[*]}")"
}

${COMMAND_NAME}_retrieve_performance_knowledge
```

### Knowledge Integration Framework:

**Enhanced Command Implementation:**
```bash
${COMMAND_NAME}_integrate_retrieved_knowledge() {
    echo "Integrating retrieved knowledge into command implementation..."
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local integration_areas=()
    
    # Integration 1: Best Practices Implementation
    ${COMMAND_NAME}_integrate_best_practices "$command_path"
    integration_areas+=("Best practices integrated")
    
    # Integration 2: Security Enhancements
    ${COMMAND_NAME}_integrate_security_knowledge "$command_path"
    integration_areas+=("Security knowledge integrated")
    
    # Integration 3: Performance Optimizations
    ${COMMAND_NAME}_integrate_performance_knowledge "$command_path"
    integration_areas+=("Performance knowledge integrated")
    
    # Integration 4: UX Improvements
    ${COMMAND_NAME}_integrate_ux_knowledge "$command_path"
    integration_areas+=("UX knowledge integrated")
    
    echo "Knowledge integration completed:"
    printf '  - %s\n' "${integration_areas[@]}"
    
    export KNOWLEDGE_INTEGRATION_AREAS="$(IFS=';'; echo "${integration_areas[*]}")"
    
    return 0
}

${COMMAND_NAME}_integrate_best_practices() {
    local command_path="$1"
    
    echo "Integrating current best practices..."
    
    # Create enhanced best practices module
    cat > "$command_path/enhanced_practices.sh" << 'EOF'
#!/bin/bash
# Enhanced best practices based on 2024-2025 research

# Modern argument parsing with validation
${COMMAND_NAME}_parse_arguments_enhanced() {
    local args=("$@")
    local parsed_options=()
    
    # Use modern getopts pattern with long options support
    while [[ $# -gt 0 ]]; do
        case $1 in
            --help|-h)
                ${COMMAND_NAME}_show_contextual_help
                exit 0
                ;;
            --verbose|-v)
                export ${COMMAND_NAME}_VERBOSE=1
                ;;
            --quiet|-q)
                export ${COMMAND_NAME}_QUIET=1
                ;;
            --format=*)
                export ${COMMAND_NAME}_FORMAT="${1#*=}"
                ${COMMAND_NAME}_validate_format "$${COMMAND_NAME}_FORMAT"
                ;;
            --config=*)
                export ${COMMAND_NAME}_CONFIG="${1#*=}"
                ${COMMAND_NAME}_validate_config_file "$${COMMAND_NAME}_CONFIG"
                ;;
            --dry-run)
                export ${COMMAND_NAME}_DRY_RUN=1
                ;;
            --no-color)
                export NO_COLOR=1
                ;;
            --)
                shift
                break
                ;;
            -*)
                log_error "Unknown option: $1"
                ${COMMAND_NAME}_show_usage
                return 1
                ;;
            *)
                parsed_options+=("$1")
                ;;
        esac
        shift
    done
    
    # Store remaining arguments
    export ${COMMAND_NAME}_POSITIONAL_ARGS=("${parsed_options[@]}" "$@")
}

# Enhanced configuration management
${COMMAND_NAME}_load_configuration_enhanced() {
    local config_sources=(
        "/etc/${COMMAND_NAME}/config.yaml"
        "$HOME/.config/${COMMAND_NAME}/config.yaml"
        "$PWD/.${COMMAND_NAME}.yaml"
        "${${COMMAND_NAME}_CONFIG:-}"
    )
    
    for config_file in "${config_sources[@]}"; do
        if [[ -f "$config_file" ]]; then
            log_info "Loading configuration from: $config_file"
            ${COMMAND_NAME}_parse_config "$config_file"
        fi
    done
}

# Modern output formatting with accessibility
${COMMAND_NAME}_format_output_enhanced() {
    local content="$1"
    local format="${${COMMAND_NAME}_FORMAT:-auto}"
    
    # Auto-detect terminal capabilities
    if [[ "$format" == "auto" ]]; then
        if [[ -t 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
            format="colored"
        else
            format="plain"
        fi
    fi
    
    case "$format" in
        "json")
            echo "$content" | jq . 2>/dev/null || echo "$content"
            ;;
        "yaml")
            echo "$content" | yq . 2>/dev/null || echo "$content"
            ;;
        "colored")
            echo "$content" | ${COMMAND_NAME}_apply_colors
            ;;
        "plain"|*)
            echo "$content"
            ;;
    esac
}
EOF

    echo "✅ Enhanced best practices integrated"
}

${COMMAND_NAME}_integrate_security_knowledge() {
    local command_path="$1"
    
    echo "Integrating current security knowledge..."
    
    cat > "$command_path/enhanced_security.sh" << 'EOF'
#!/bin/bash
# Enhanced security based on current standards

# Comprehensive input validation
${COMMAND_NAME}_validate_input_secure() {
    local input="$1"
    local input_type="${2:-generic}"
    
    # Basic security checks
    if [[ -z "$input" ]]; then
        log_error "Empty input not allowed"
        return 1
    fi
    
    # Length validation
    if [[ ${#input} -gt 1000 ]]; then
        log_error "Input too long (max 1000 characters)"
        return 1
    fi
    
    # Type-specific validation
    case "$input_type" in
        "file_path")
            ${COMMAND_NAME}_validate_file_path "$input"
            ;;
        "url")
            ${COMMAND_NAME}_validate_url "$input"
            ;;
        "email")
            ${COMMAND_NAME}_validate_email "$input"
            ;;
        "number")
            ${COMMAND_NAME}_validate_number "$input"
            ;;
        *)
            ${COMMAND_NAME}_validate_generic "$input"
            ;;
    esac
}

# Secure file operations
${COMMAND_NAME}_secure_file_operation() {
    local operation="$1"
    local file_path="$2"
    
    # Canonicalize path to prevent traversal
    local canonical_path
    canonical_path=$(realpath "$file_path" 2>/dev/null) || {
        log_error "Invalid file path: $file_path"
        return 1
    }
    
    # Check if path is within allowed directory
    local allowed_dir="${${COMMAND_NAME}_ALLOWED_DIR:-$PWD}"
    if [[ "$canonical_path" != "$allowed_dir"* ]]; then
        log_error "File access outside allowed directory: $canonical_path"
        return 1
    fi
    
    # Perform operation based on type
    case "$operation" in
        "read")
            [[ -r "$canonical_path" ]] || {
                log_error "File not readable: $canonical_path"
                return 1
            }
            ;;
        "write")
            local dir=$(dirname "$canonical_path")
            [[ -w "$dir" ]] || {
                log_error "Directory not writable: $dir"
                return 1
            }
            ;;
    esac
    
    echo "$canonical_path"
}

# Secure environment handling
${COMMAND_NAME}_secure_environment() {
    # Clear potentially dangerous environment variables
    unset IFS
    unset PATH_SEPARATOR
    
    # Set secure PATH
    export PATH="/usr/local/bin:/usr/bin:/bin"
    
    # Set secure umask
    umask 022
    
    # Disable core dumps
    ulimit -c 0
    
    # Set resource limits
    ulimit -f 100000  # 100MB file size limit
    ulimit -t 300     # 5 minute CPU time limit
}
EOF

    echo "✅ Enhanced security knowledge integrated"
}

${COMMAND_NAME}_integrate_performance_knowledge() {
    local command_path="$1"
    
    echo "Integrating performance optimization knowledge..."
    
    cat > "$command_path/enhanced_performance.sh" << 'EOF'
#!/bin/bash
# Enhanced performance based on current optimization techniques

# Smart caching system
${COMMAND_NAME}_cache_manager() {
    local cache_key="$1"
    local cache_value="$2"
    local operation="${3:-get}"
    
    local cache_dir="/tmp/.${COMMAND_NAME}_cache"
    local cache_file="$cache_dir/${cache_key//\//_}"
    
    case "$operation" in
        "set")
            mkdir -p "$cache_dir"
            echo "$cache_value" > "$cache_file"
            echo "$(date +%s)" > "${cache_file}.timestamp"
            ;;
        "get")
            if [[ -f "$cache_file" ]]; then
                local timestamp=$(cat "${cache_file}.timestamp" 2>/dev/null || echo 0)
                local current_time=$(date +%s)
                local age=$((current_time - timestamp))
                
                # Cache valid for 1 hour
                if [[ $age -lt 3600 ]]; then
                    cat "$cache_file"
                    return 0
                fi
            fi
            return 1
            ;;
        "clear")
            rm -rf "$cache_dir"
            ;;
    esac
}

# Parallel processing framework
${COMMAND_NAME}_parallel_processor() {
    local items=("$@")
    local max_jobs="${${COMMAND_NAME}_MAX_JOBS:-4}"
    local job_count=0
    local results=()
    
    for item in "${items[@]}"; do
        # Wait if we've hit the job limit
        if [[ $job_count -ge $max_jobs ]]; then
            wait -n  # Wait for any job to complete
            ((job_count--))
        fi
        
        # Start background job
        {
            ${COMMAND_NAME}_process_item "$item"
            echo $? > "/tmp/${COMMAND_NAME}_job_$$_$job_count.result"
        } &
        
        ((job_count++))
    done
    
    # Wait for all remaining jobs
    wait
    
    # Collect results
    for ((i=0; i<job_count; i++)); do
        if [[ -f "/tmp/${COMMAND_NAME}_job_$$_$i.result" ]]; then
            results[i]=$(cat "/tmp/${COMMAND_NAME}_job_$$_$i.result")
            rm "/tmp/${COMMAND_NAME}_job_$$_$i.result"
        fi
    done
    
    printf '%s\n' "${results[@]}"
}

# Memory-efficient processing
${COMMAND_NAME}_memory_efficient_processor() {
    local input_file="$1"
    local chunk_size="${2:-1000}"
    
    # Process file in chunks to manage memory
    local line_count=0
    local chunk_buffer=()
    
    while IFS= read -r line; do
        chunk_buffer+=("$line")
        ((line_count++))
        
        if [[ $line_count -ge $chunk_size ]]; then
            ${COMMAND_NAME}_process_chunk "${chunk_buffer[@]}"
            chunk_buffer=()
            line_count=0
        fi
    done < "$input_file"
    
    # Process remaining lines
    if [[ ${#chunk_buffer[@]} -gt 0 ]]; then
        ${COMMAND_NAME}_process_chunk "${chunk_buffer[@]}"
    fi
}
EOF

    echo "✅ Enhanced performance knowledge integrated"
}
```

## Step 3: Knowledge Cache Management

### Offline Knowledge Caching:

**Knowledge Cache System:**
```bash
${COMMAND_NAME}_create_knowledge_cache() {
    echo "Creating comprehensive knowledge cache..."
    
    local cache_dir=".claude/commands/$COMMAND_NAME/knowledge_cache"
    mkdir -p "$cache_dir"
    
    # Cache 1: Best Practices Knowledge
    cat > "$cache_dir/best_practices.md" << 'EOF'
# Current Best Practices for CLI Commands

## Argument Parsing
- Use long options alongside short options
- Provide clear help messages
- Validate inputs early
- Support standard conventions (--help, --version, --verbose)

## Output Design
- Respect terminal capabilities
- Support multiple output formats
- Provide progress indicators for long operations
- Use colors judiciously with NO_COLOR support

## Error Handling
- Provide specific, actionable error messages
- Use appropriate exit codes
- Suggest corrections when possible
- Log errors to stderr, output to stdout

## Configuration Management
- Support multiple configuration sources
- Use standard configuration locations
- Validate configuration on load
- Provide configuration examples

## Security Considerations
- Validate all inputs
- Use secure file operations
- Avoid command injection vulnerabilities
- Follow principle of least privilege
EOF

    # Cache 2: Security Standards
    cat > "$cache_dir/security_standards.md" << 'EOF'
# Current Security Standards for CLI Tools

## Input Validation
- Sanitize all user inputs
- Validate file paths for traversal attacks
- Check input lengths and formats
- Escape special characters appropriately

## File Operations
- Use canonical paths
- Check permissions before operations
- Avoid race conditions in file access
- Set appropriate file permissions

## Environment Security
- Clear dangerous environment variables
- Set secure PATH
- Use appropriate umask
- Limit resource usage

## Output Security
- Sanitize output to prevent injection
- Remove sensitive information from logs
- Escape output for terminal safety
- Validate output encoding
EOF

    # Cache 3: Performance Guidelines
    cat > "$cache_dir/performance_guidelines.md" << 'EOF'
# Performance Optimization Guidelines

## Memory Management
- Process large files in chunks
- Clear unused variables
- Use efficient data structures
- Monitor memory usage

## CPU Optimization
- Use parallel processing when beneficial
- Cache expensive computations
- Optimize algorithms for common cases
- Profile to identify bottlenecks

## I/O Optimization
- Batch file operations
- Use efficient file reading methods
- Minimize disk access
- Use appropriate buffer sizes

## Scalability
- Design for variable input sizes
- Implement timeout mechanisms
- Provide progress feedback
- Handle resource limitations gracefully
EOF

    # Cache metadata
    cat > "$cache_dir/cache_metadata.json" << EOF
{
    "created": "$(date -Iseconds)",
    "version": "1.0.0",
    "knowledge_domains": [
        "best_practices",
        "security_standards", 
        "performance_guidelines"
    ],
    "cache_validity": "7d",
    "last_updated": "$(date -Iseconds)"
}
EOF

    echo "✅ Knowledge cache created with $(ls "$cache_dir" | wc -l) files"
    
    export KNOWLEDGE_CACHE_DIR="$cache_dir"
    export KNOWLEDGE_CACHE_CREATED="$(date -Iseconds)"
}

${COMMAND_NAME}_create_knowledge_cache
```

### Dynamic Knowledge Loading:

**Runtime Knowledge Integration:**
```bash
${COMMAND_NAME}_load_enhanced_knowledge() {
    echo "Loading enhanced knowledge for runtime use..."
    
    local cache_dir=".claude/commands/$COMMAND_NAME/knowledge_cache"
    
    # Check cache validity
    if [[ -f "$cache_dir/cache_metadata.json" ]]; then
        local cache_age
        cache_age=$(${COMMAND_NAME}_check_cache_age "$cache_dir/cache_metadata.json")
        
        if [[ $cache_age -gt 604800 ]]; then  # 7 days
            log_warn "Knowledge cache is $((cache_age / 86400)) days old"
            log_warn "Consider refreshing with: ${COMMAND_NAME} --refresh-knowledge"
        fi
    fi
    
    # Load knowledge modules
    if [[ -f "$cache_dir/best_practices.md" ]]; then
        export ${COMMAND_NAME}_BEST_PRACTICES_AVAILABLE=1
        log_info "✅ Best practices knowledge loaded"
    fi
    
    if [[ -f "$cache_dir/security_standards.md" ]]; then
        export ${COMMAND_NAME}_SECURITY_KNOWLEDGE_AVAILABLE=1
        log_info "✅ Security standards knowledge loaded"
    fi
    
    if [[ -f "$cache_dir/performance_guidelines.md" ]]; then
        export ${COMMAND_NAME}_PERFORMANCE_KNOWLEDGE_AVAILABLE=1
        log_info "✅ Performance guidelines knowledge loaded"
    fi
    
    # Source enhanced modules
    for module in enhanced_practices.sh enhanced_security.sh enhanced_performance.sh; do
        if [[ -f ".claude/commands/$COMMAND_NAME/$module" ]]; then
            source ".claude/commands/$COMMAND_NAME/$module"
        fi
    done
    
    log_info "Enhanced knowledge integration completed"
}

${COMMAND_NAME}_check_cache_age() {
    local metadata_file="$1"
    
    if [[ -f "$metadata_file" ]]; then
        local created_date
        created_date=$(jq -r '.created' "$metadata_file" 2>/dev/null || echo "")
        
        if [[ -n "$created_date" ]]; then
            local created_timestamp
            created_timestamp=$(date -d "$created_date" +%s 2>/dev/null || echo 0)
            local current_timestamp=$(date +%s)
            echo $((current_timestamp - created_timestamp))
        else
            echo 86400  # Default to 1 day if can't determine
        fi
    else
        echo 0
    fi
}
```

## Step 4: Enhanced Command Testing

### Knowledge-Enhanced Validation:

**RAG-Enhanced Testing Framework:**
```bash
${COMMAND_NAME}_test_enhanced_command() {
    echo "Testing RAG-enhanced command implementation..."
    
    local test_results=()
    
    # Test 1: Enhanced functionality works
    if ${COMMAND_NAME}_test_enhanced_functionality; then
        test_results+=("✅ Enhanced functionality working")
    else
        test_results+=("❌ Enhanced functionality failed")
    fi
    
    # Test 2: Knowledge integration successful
    if ${COMMAND_NAME}_test_knowledge_integration; then
        test_results+=("✅ Knowledge integration successful")
    else
        test_results+=("❌ Knowledge integration failed")
    fi
    
    # Test 3: Performance improvements effective
    if ${COMMAND_NAME}_test_performance_improvements; then
        test_results+=("✅ Performance improvements effective")
    else
        test_results+=("❌ Performance improvements ineffective")
    fi
    
    # Test 4: Security enhancements working
    if ${COMMAND_NAME}_test_security_enhancements; then
        test_results+=("✅ Security enhancements working")
    else
        test_results+=("❌ Security enhancements failed")
    fi
    
    # Test 5: Knowledge cache functional
    if ${COMMAND_NAME}_test_knowledge_cache; then
        test_results+=("✅ Knowledge cache functional")
    else
        test_results+=("❌ Knowledge cache issues")
    fi
    
    echo "=== RAG ENHANCEMENT TEST RESULTS ==="
    printf '%s\n' "${test_results[@]}"
    
    local passed=$(printf '%s\n' "${test_results[@]}" | grep -c "✅")
    local total=${#test_results[@]}
    local pass_rate=$((passed * 100 / total))
    
    echo "Enhancement Test Pass Rate: $pass_rate% ($passed/$total)"
    
    if [[ $pass_rate -ge 80 ]]; then
        echo "✅ RAG enhancement testing PASSED"
        return 0
    else
        echo "❌ RAG enhancement testing FAILED"
        return 1
    fi
}

${COMMAND_NAME}_test_enhanced_functionality() {
    # Test enhanced argument parsing
    if ${COMMAND_NAME}_parse_arguments_enhanced --help >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

${COMMAND_NAME}_test_knowledge_integration() {
    # Test that knowledge modules are available
    if [[ "$${COMMAND_NAME}_BEST_PRACTICES_AVAILABLE" == "1" ]] && \
       [[ "$${COMMAND_NAME}_SECURITY_KNOWLEDGE_AVAILABLE" == "1" ]] && \
       [[ "$${COMMAND_NAME}_PERFORMANCE_KNOWLEDGE_AVAILABLE" == "1" ]]; then
        return 0
    else
        return 1
    fi
}
```

## Step 5: Enhancement Quality Assessment

### Final Enhancement Evaluation:

**RAG Enhancement Quality Matrix:**
```bash
${COMMAND_NAME}_assess_enhancement_quality() {
    echo "Assessing RAG enhancement quality..."
    
    local enhancement_score=0
    local enhancement_report=()
    
    # Criterion 1: Knowledge Integration Completeness (25 points)
    local knowledge_completeness=0
    if [[ -n "$BEST_PRACTICES_AREAS" ]]; then ((knowledge_completeness += 8)); fi
    if [[ -n "$SECURITY_AREAS" ]]; then ((knowledge_completeness += 8)); fi
    if [[ -n "$PERFORMANCE_AREAS" ]]; then ((knowledge_completeness += 9)); fi
    
    enhancement_score=$((enhancement_score + knowledge_completeness))
    enhancement_report+=("Knowledge Integration: $knowledge_completeness/25")
    
    # Criterion 2: Cache System Quality (20 points)
    local cache_quality=0
    if [[ -d "$KNOWLEDGE_CACHE_DIR" ]]; then ((cache_quality += 10)); fi
    if [[ -f "$KNOWLEDGE_CACHE_DIR/cache_metadata.json" ]]; then ((cache_quality += 5)); fi
    if [[ $(ls "$KNOWLEDGE_CACHE_DIR"/*.md 2>/dev/null | wc -l) -ge 3 ]]; then ((cache_quality += 5)); fi
    
    enhancement_score=$((enhancement_score + cache_quality))
    enhancement_report+=("Cache System: $cache_quality/20")
    
    # Criterion 3: Enhanced Functionality (25 points)
    local functionality_enhancement=0
    if [[ -f ".claude/commands/$COMMAND_NAME/enhanced_practices.sh" ]]; then ((functionality_enhancement += 8)); fi
    if [[ -f ".claude/commands/$COMMAND_NAME/enhanced_security.sh" ]]; then ((functionality_enhancement += 8)); fi
    if [[ -f ".claude/commands/$COMMAND_NAME/enhanced_performance.sh" ]]; then ((functionality_enhancement += 9)); fi
    
    enhancement_score=$((enhancement_score + functionality_enhancement))
    enhancement_report+=("Enhanced Functionality: $functionality_enhancement/25")
    
    # Criterion 4: Knowledge Freshness (15 points)
    local knowledge_freshness=15
    local cache_age_days=$((${KNOWLEDGE_CACHE_AGE:-0} / 86400))
    if [[ $cache_age_days -gt 7 ]]; then ((knowledge_freshness -= 5)); fi
    if [[ $cache_age_days -gt 30 ]]; then ((knowledge_freshness -= 5)); fi
    
    enhancement_score=$((enhancement_score + knowledge_freshness))
    enhancement_report+=("Knowledge Freshness: $knowledge_freshness/15")
    
    # Criterion 5: Testing Coverage (15 points)
    local testing_coverage=0
    if ${COMMAND_NAME}_test_enhanced_command >/dev/null 2>&1; then
        testing_coverage=15
    else
        testing_coverage=5
    fi
    
    enhancement_score=$((enhancement_score + testing_coverage))
    enhancement_report+=("Testing Coverage: $testing_coverage/15")
    
    # Report enhancement quality
    echo "=== RAG ENHANCEMENT QUALITY ASSESSMENT ==="
    printf '%s\n' "${enhancement_report[@]}"
    echo "Total Enhancement Score: $enhancement_score/100"
    
    # Quality certification
    if [[ $enhancement_score -ge 85 ]]; then
        echo "🏆 EXCELLENT RAG enhancement"
        export ENHANCEMENT_QUALITY="excellent"
    elif [[ $enhancement_score -ge 70 ]]; then
        echo "✅ GOOD RAG enhancement" 
        export ENHANCEMENT_QUALITY="good"
    elif [[ $enhancement_score -ge 55 ]]; then
        echo "⚠️ ACCEPTABLE RAG enhancement"
        export ENHANCEMENT_QUALITY="acceptable"
    else
        echo "❌ POOR RAG enhancement"
        export ENHANCEMENT_QUALITY="poor"
        return 1
    fi
    
    export ENHANCEMENT_SCORE="$enhancement_score"
    return 0
}

${COMMAND_NAME}_assess_enhancement_quality
```

## RAG Enhancement Complete

### Enhancement Summary:
- ✅ **Knowledge Domains**: $KNOWLEDGE_GAP_COUNT domains analyzed and integrated
- ✅ **Best Practices**: Current 2024-2025 standards integrated
- ✅ **Security Knowledge**: Latest security standards applied
- ✅ **Performance Knowledge**: Optimization techniques implemented
- ✅ **Knowledge Cache**: Offline cache created with $KNOWLEDGE_CACHE_FILES files
- ✅ **Enhancement Quality**: $ENHANCEMENT_SCORE/100 ($ENHANCEMENT_QUALITY)

### Enhancement Configuration:
```yaml
rag_enhancement:
  knowledge_domains_integrated: $KNOWLEDGE_GAP_COUNT
  enhancement_score: $ENHANCEMENT_SCORE/100
  enhancement_quality: $ENHANCEMENT_QUALITY
  knowledge_cache_created: true
  cache_location: $KNOWLEDGE_CACHE_DIR
  cache_validity: 7 days
  
  enhanced_modules:
    best_practices: enhanced_practices.sh
    security: enhanced_security.sh
    performance: enhanced_performance.sh
    
  knowledge_areas:
    best_practices: $BEST_PRACTICES_AREAS
    security: $SECURITY_AREAS
    performance: $PERFORMANCE_AREAS
    
  ready_for_finalization: true
```

### Next Phase:

**Continue to:** `/command-builder/10-finalize` for final command packaging and deployment.

Your command has been enhanced with current knowledge and is ready for finalization.

**Ready to proceed to finalization phase?** (y/n) > [WAIT FOR CONFIRMATION]