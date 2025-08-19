# Performance Tuning Guide

> Simple strategies for optimizing Claude Code Builder pattern performance

## Performance Overview

**Current Performance:**
- Pattern loading: 112-122ms per pattern
- Function execution: <1ms average
- Memory usage: <10MB total
- Target: Production-ready performance

**Performance Grades:**
- **Excellent**: <100ms
- **Good**: 100-150ms ✅ (Current)
- **Acceptable**: 150-300ms
- **Poor**: >300ms

## Quick Optimization

### 1. Load Only Required Patterns

**Slow (1150ms total):**
```bash
# Loading all 10 patterns
for pattern in patterns/*/simple-*.sh; do
    source "$pattern"
done
```

**Fast (230ms total):**
```bash
# Load only essentials
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
```

### 2. Cache Pattern Loading

**Before:**
```bash
# Loads patterns every time
function my_script() {
    source patterns/logging/simple-logging.sh
    log_info "Message"
}
```

**After:**
```bash
# Cache in environment
if [[ -z "$PATTERNS_LOADED" ]]; then
    source patterns/logging/simple-logging.sh
    export PATTERNS_LOADED=true
fi

function my_script() {
    log_info "Message"  # Pattern already loaded
}
```

### 3. Conditional Loading

**Smart Loading:**
```bash
# Load patterns based on need
load_patterns() {
    local needs="$1"
    
    case "$needs" in
        "basic")
            source patterns/logging/simple-logging.sh
            source patterns/error-handling/simple-error-handling.sh
            ;;
        "config")
            load_patterns "basic"
            source patterns/configuration/config-reader.sh
            ;;
        "testing")
            load_patterns "config"
            source patterns/testing/simple-test-runner.sh
            ;;
    esac
}

# Usage
load_patterns "basic"    # 230ms
load_patterns "config"   # 352ms
load_patterns "testing"  # 467ms
```

## Pattern-Specific Optimization

### Logging Pattern Optimization

**Current Performance:** 112ms

**Optimization 1: Disable Colors in Production**
```bash
# Set in production environment
export LOG_COLOR=false

# Or conditionally
if [[ "$ENVIRONMENT" == "production" ]]; then
    export LOG_COLOR=false
fi
```

**Optimization 2: Batch Log Messages**
```bash
# Instead of multiple calls
log_info "Step 1 complete"
log_info "Step 2 complete"
log_info "Step 3 complete"

# Use batch logging
log_info "Steps 1, 2, 3 complete"
```

### Configuration Pattern Optimization

**Current Performance:** 122ms

**Optimization 1: Cache Configuration**
```bash
# Slow: Read config file every time
get_config "DATABASE_URL" ".env" "default"
get_config "API_KEY" ".env" ""
get_config "DEBUG" ".env" "false"

# Fast: Cache in variables
if [[ -z "$CONFIG_LOADED" ]]; then
    DATABASE_URL=$(get_config "DATABASE_URL" ".env" "default")
    API_KEY=$(get_config "API_KEY" ".env" "")
    DEBUG=$(get_config "DEBUG" ".env" "false")
    readonly DATABASE_URL API_KEY DEBUG
    export CONFIG_LOADED=true
fi
```

**Optimization 2: Use Environment Variables**
```bash
# Slow: File-based config
database_url=$(get_config "DATABASE_URL" ".env" "default")

# Fast: Environment-first
database_url="${DATABASE_URL:-$(get_config "DATABASE_URL" ".env" "default")}"
```

### Testing Pattern Optimization

**Current Performance:** 115ms

**Optimization 1: Parallel Test Execution**
```bash
# Slow: Sequential tests
run_test "Test 1" test_function_1
run_test "Test 2" test_function_2
run_test "Test 3" test_function_3

# Fast: Parallel tests (for independent tests)
run_test "Test 1" test_function_1 &
run_test "Test 2" test_function_2 &
run_test "Test 3" test_function_3 &
wait
```

**Optimization 2: Skip Tests in Production**
```bash
# Conditional testing
if [[ "$ENVIRONMENT" != "production" ]]; then
    source patterns/testing/simple-test-runner.sh
    run_all_tests
fi
```

## Memory Optimization

### Memory Usage Monitoring

**Monitor Memory:**
```bash
# Check memory usage
monitor_memory() {
    echo "Memory usage: $(ps -o rss= -p $$) KB"
}

monitor_memory  # Before loading patterns
source patterns/logging/simple-logging.sh
monitor_memory  # After loading patterns
```

### Memory Optimization Strategies

**Strategy 1: Unset Large Variables**
```bash
# After processing large data
process_large_file() {
    local large_content
    large_content=$(cat large_file.txt)
    
    # Process content
    echo "$large_content" | process_data
    
    # Free memory
    unset large_content
}
```

**Strategy 2: Use Local Variables**
```bash
# Good: Local variables are cleaned up
process_data() {
    local temp_data="$1"
    local result
    result=$(transform "$temp_data")
    echo "$result"
}

# Bad: Global variables persist
process_data() {
    TEMP_DATA="$1"  # Global variable
    RESULT=$(transform "$TEMP_DATA")
    echo "$RESULT"
}
```

**Strategy 3: Clean Up Temporary Files**
```bash
# Set up cleanup
cleanup() {
    [[ -d "$TEMP_DIR" ]] && rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

# Create temporary directory
TEMP_DIR=$(mktemp -d)
```

## CPU Optimization

### Reduce Subprocess Calls

**Slow: Multiple subprocess calls**
```bash
# Each command creates new process
check_files() {
    [[ -f "file1.txt" ]] && echo "File 1 exists"
    [[ -f "file2.txt" ]] && echo "File 2 exists"
    [[ -f "file3.txt" ]] && echo "File 3 exists"
}
```

**Fast: Batch operations**
```bash
# Single operation
check_files() {
    local files=("file1.txt" "file2.txt" "file3.txt")
    for file in "${files[@]}"; do
        [[ -f "$file" ]] && echo "$file exists"
    done
}
```

### Optimize String Operations

**Slow: External commands**
```bash
# Using external grep
find_pattern() {
    echo "$data" | grep "pattern"
}
```

**Fast: Bash built-ins**
```bash
# Using bash pattern matching
find_pattern() {
    [[ "$data" == *"pattern"* ]] && echo "Found"
}
```

### Avoid Unnecessary Loops

**Slow: Nested loops**
```bash
# O(n²) complexity
find_duplicates() {
    for item1 in "${array1[@]}"; do
        for item2 in "${array2[@]}"; do
            [[ "$item1" == "$item2" ]] && echo "Duplicate: $item1"
        done
    done
}
```

**Fast: Hash table approach**
```bash
# O(n) complexity
find_duplicates() {
    declare -A seen
    for item in "${array1[@]}"; do
        seen["$item"]=1
    done
    for item in "${array2[@]}"; do
        [[ "${seen[$item]}" ]] && echo "Duplicate: $item"
    done
}
```

## I/O Optimization

### File Reading Optimization

**Slow: Reading file multiple times**
```bash
# Reads file for each config
get_database_url() {
    grep "DATABASE_URL" .env | cut -d'=' -f2
}
get_api_key() {
    grep "API_KEY" .env | cut -d'=' -f2
}
```

**Fast: Read once, parse multiple**
```bash
# Read file once
load_all_config() {
    local config_content
    config_content=$(cat .env)
    
    DATABASE_URL=$(echo "$config_content" | grep "DATABASE_URL" | cut -d'=' -f2)
    API_KEY=$(echo "$config_content" | grep "API_KEY" | cut -d'=' -f2)
}
```

### Reduce Disk I/O

**Strategy 1: Use memory for temporary data**
```bash
# Instead of temporary files
temp_file=$(mktemp)
echo "$data" > "$temp_file"
process_file "$temp_file"
rm "$temp_file"

# Use variables
process_data "$data"
```

**Strategy 2: Buffer output**
```bash
# Slow: Write line by line
for line in "${lines[@]}"; do
    echo "$line" >> output.txt
done

# Fast: Buffer and write once
output=""
for line in "${lines[@]}"; do
    output+="$line\n"
done
echo -e "$output" > output.txt
```

## Network Optimization

### Reduce HTTP Requests

**Slow: Multiple API calls**
```bash
get_user_data() {
    curl "api/users/$1"
    curl "api/users/$1/profile"
    curl "api/users/$1/settings"
}
```

**Fast: Batch API call**
```bash
get_user_data() {
    curl "api/users/$1?include=profile,settings"
}
```

### Cache Network Responses

**Caching Strategy:**
```bash
# Simple cache implementation
get_with_cache() {
    local url="$1"
    local cache_file="cache/$(echo "$url" | md5sum | cut -d' ' -f1)"
    
    # Check cache age (5 minutes = 300 seconds)
    if [[ -f "$cache_file" ]] && [[ $(($(date +%s) - $(stat -c %Y "$cache_file"))) -lt 300 ]]; then
        cat "$cache_file"
    else
        curl "$url" | tee "$cache_file"
    fi
}
```

## Pattern Loading Optimization

### Selective Pattern Loading

**Load Patterns by Environment:**
```bash
load_environment_patterns() {
    local env="${ENVIRONMENT:-development}"
    
    # Always load core patterns
    source patterns/logging/simple-logging.sh
    source patterns/error-handling/simple-error-handling.sh
    
    case "$env" in
        "development")
            source patterns/testing/simple-test-runner.sh
            export DEBUG=1
            ;;
        "staging")
            source patterns/quality-gates/quality-check.sh
            source patterns/testing/simple-test-runner.sh
            ;;
        "production")
            source patterns/security/security-basics.sh
            source patterns/quality-gates/quality-check.sh
            export LOG_COLOR=false
            ;;
    esac
}
```

### Pattern Loading Profiler

**Measure Loading Time:**
```bash
profile_pattern_loading() {
    local patterns=("$@")
    
    for pattern in "${patterns[@]}"; do
        local start_time=$(date +%s%N)
        
        if source "patterns/$pattern/simple-$pattern.sh" 2>/dev/null; then
            local end_time=$(date +%s%N)
            local duration=$(( (end_time - start_time) / 1000000 ))
            log_info "Pattern $pattern loaded in ${duration}ms"
        else
            log_error "Failed to load pattern: $pattern"
        fi
    done
}

# Usage
profile_pattern_loading "logging" "error-handling" "configuration"
```

## Performance Monitoring

### Real-time Performance Tracking

**Performance Monitor:**
```bash
# Performance tracking function
track_performance() {
    local operation="$1"
    shift
    
    local start_time=$(date +%s%N)
    local start_memory=$(ps -o rss= -p $$)
    
    # Execute operation
    "$@"
    local exit_code=$?
    
    local end_time=$(date +%s%N)
    local end_memory=$(ps -o rss= -p $$)
    
    local duration=$(( (end_time - start_time) / 1000000 ))
    local memory_diff=$((end_memory - start_memory))
    
    log_info "Performance: $operation took ${duration}ms, memory change: ${memory_diff}KB"
    
    return $exit_code
}

# Usage
track_performance "Pattern loading" source patterns/logging/simple-logging.sh
track_performance "Configuration loading" load_all_config
```

### Performance Benchmarking

**Benchmark Suite:**
```bash
run_performance_benchmark() {
    log_info "Running performance benchmark"
    
    # Test pattern loading
    benchmark_pattern_loading
    
    # Test function execution
    benchmark_function_execution
    
    # Test memory usage
    benchmark_memory_usage
    
    log_success "Performance benchmark completed"
}

benchmark_pattern_loading() {
    local patterns=("logging" "error-handling" "configuration" "testing")
    local total_time=0
    
    for pattern in "${patterns[@]}"; do
        local start=$(date +%s%N)
        source "patterns/$pattern/simple-$pattern.sh"
        local end=$(date +%s%N)
        local duration=$(( (end - start) / 1000000 ))
        
        total_time=$((total_time + duration))
        log_info "Pattern $pattern: ${duration}ms"
    done
    
    log_info "Total pattern loading time: ${total_time}ms"
}
```

## Production Optimization

### Production-Ready Configuration

**Optimized Production Setup:**
```bash
#!/bin/bash
# Production-optimized script

# Disable debugging
set +x
export DEBUG=0

# Optimize logging
export LOG_COLOR=false

# Load minimal patterns
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/security/security-basics.sh

# Cache configuration
load_production_config() {
    if [[ -z "$PRODUCTION_CONFIG_LOADED" ]]; then
        readonly DATABASE_URL="${DATABASE_URL:-$(get_config "DATABASE_URL" ".env")}"
        readonly API_KEY="${API_KEY:-$(get_config "API_KEY" ".env")}"
        export PRODUCTION_CONFIG_LOADED=true
    fi
}

# Main application logic
main() {
    load_production_config
    
    # Run security scan once
    basic_security_scan || handle_error $LINENO "Security scan failed"
    
    # Application logic here
    log_info "Production application started"
}

main "$@"
```

### Resource Limits

**Set Resource Constraints:**
```bash
# Limit memory usage (example: 100MB)
ulimit -v 102400

# Limit CPU time (example: 30 seconds)
ulimit -t 30

# Limit file descriptors
ulimit -n 1024
```

## Optimization Checklist

### Pre-Optimization Checklist

- [ ] Profile current performance
- [ ] Identify bottlenecks
- [ ] Set performance targets
- [ ] Choose optimization strategies

### Pattern Loading Optimization

- [ ] Load only required patterns
- [ ] Use environment-based loading
- [ ] Cache pattern loading results
- [ ] Profile pattern loading times

### Runtime Optimization

- [ ] Cache configuration values
- [ ] Use bash built-ins over external commands
- [ ] Minimize subprocess creation
- [ ] Optimize string operations

### Memory Optimization

- [ ] Use local variables
- [ ] Clean up temporary files
- [ ] Unset large variables
- [ ] Monitor memory usage

### I/O Optimization

- [ ] Reduce file reads
- [ ] Buffer output operations
- [ ] Cache network requests
- [ ] Use efficient data formats

### Post-Optimization Validation

- [ ] Verify functionality unchanged
- [ ] Measure performance improvement
- [ ] Test under production load
- [ ] Document optimization changes

## Performance Targets

### Target Metrics

**Pattern Loading:**
- Essential patterns (2): <250ms
- Standard patterns (4): <500ms
- All patterns (10): <1200ms

**Function Execution:**
- Simple functions: <1ms
- Complex functions: <10ms
- I/O operations: <100ms

**Memory Usage:**
- Base script: <5MB
- With patterns: <15MB
- Under load: <50MB

**Scalability:**
- Handle 100+ concurrent function calls
- Support 1000+ configuration keys
- Process files up to 100MB

## Troubleshooting Performance Issues

### Common Performance Problems

**Problem: Slow script startup**
```bash
# Diagnosis
time ./your-script.sh

# Solution: Profile pattern loading
profile_pattern_loading "logging" "error-handling"
```

**Problem: High memory usage**
```bash
# Diagnosis
ps -o pid,vsz,rss,comm -p $$

# Solution: Monitor memory during execution
track_performance "Memory test" your_function
```

**Problem: Slow function execution**
```bash
# Diagnosis
time log_info "Test message"

# Solution: Use simpler alternatives
echo "[INFO] Test message"  # If colors not needed
```

Remember: **Premature optimization is the root of all evil**. Always measure before optimizing, and focus on the biggest bottlenecks first.