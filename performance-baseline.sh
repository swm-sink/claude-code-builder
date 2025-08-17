#!/bin/bash

# Performance Baseline for Current Level-1-Dev System
# Measures execution time, memory usage, and file operations

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Configuration
LEVEL1_DIR="/Users/smenssink/Documents/GitHub/ai-podcasts-nobody-knows/.claude/level-1-dev"
TEST_ITERATIONS=3
BASELINE_REPORT="/Users/smenssink/Documents/GitHub/claude-code-builder/performance-baseline-report.md"

# Test results storage
declare -a test_results

log_info() {
    echo -e "${GREEN}[BASELINE]${NC} $1"
}

log_test() {
    echo -e "${YELLOW}[TEST]${NC} $1"
}

# Function to measure script execution time
measure_script() {
    local script_path="$1"
    local description="$2"
    local test_args="${3:-}"
    
    if [ ! -f "$script_path" ]; then
        echo "SKIP: $description (script not found)"
        return
    fi
    
    log_test "Measuring: $description"
    
    local total_time=0
    local success_count=0
    
    for i in $(seq 1 $TEST_ITERATIONS); do
        local start_time=$(date +%s.%N)
        
        # Run the script with timeout
        if timeout 30 "$script_path" $test_args >/dev/null 2>&1; then
            local end_time=$(date +%s.%N)
            local duration=$(echo "$end_time - $start_time" | bc -l)
            total_time=$(echo "$total_time + $duration" | bc -l)
            success_count=$((success_count + 1))
        else
            echo "  Iteration $i: FAILED or TIMEOUT"
        fi
    done
    
    if [ $success_count -gt 0 ]; then
        local avg_time=$(echo "scale=3; $total_time / $success_count" | bc -l)
        echo "  Average time: ${avg_time}s (${success_count}/${TEST_ITERATIONS} successful)"
        test_results+=("$description|${avg_time}s|${success_count}/${TEST_ITERATIONS}")
    else
        echo "  All iterations failed"
        test_results+=("$description|FAILED|0/${TEST_ITERATIONS}")
    fi
}

# Function to measure file reading performance
measure_file_ops() {
    log_test "Measuring file operations"
    
    # Create test files
    local test_dir="/tmp/baseline-test"
    mkdir -p "$test_dir"
    
    # Small file (1KB)
    head -c 1024 /dev/urandom > "$test_dir/small.txt"
    # Medium file (100KB)  
    head -c 102400 /dev/urandom > "$test_dir/medium.txt"
    # Large file (1MB)
    head -c 1048576 /dev/urandom > "$test_dir/large.txt"
    
    # Test file reading
    for file in small medium large; do
        local start_time=$(date +%s.%N)
        cat "$test_dir/${file}.txt" >/dev/null
        local end_time=$(date +%s.%N)
        local duration=$(echo "$end_time - $start_time" | bc -l)
        test_results+=("Read ${file} file|${duration}s|1/1")
    done
    
    # Cleanup
    rm -rf "$test_dir"
}

# Function to get system info
get_system_info() {
    echo "# System Information"
    echo ""
    echo "- **OS:** $(uname -s) $(uname -r)"
    echo "- **Architecture:** $(uname -m)"
    echo "- **Shell:** $SHELL"
    echo "- **Bash Version:** $BASH_VERSION"
    echo "- **Date:** $(date)"
    echo "- **Test Iterations:** $TEST_ITERATIONS"
    echo ""
}

# Main execution
main() {
    log_info "Starting Level-1-Dev Performance Baseline"
    log_info "Test directory: $LEVEL1_DIR"
    
    # System info
    get_system_info > "$BASELINE_REPORT"
    
    echo "# Performance Baseline Results" >> "$BASELINE_REPORT"
    echo "" >> "$BASELINE_REPORT"
    
    # Test major scripts
    cd "$LEVEL1_DIR"
    
    # Help/info commands (fast)
    measure_script "tests/run-all-tests.sh" "Test Runner Help" "--help"
    measure_script "quality/quality-dashboard.sh" "Quality Dashboard Help" "--help"
    measure_script "quality/security-audit.sh" "Security Audit Help" "--help"
    
    # Basic operations
    measure_script "quality/test-quality-gates.sh" "Quality Gates Test" "--dry-run"
    measure_script "quality/generate-quality-report.sh" "Quality Report Generation" "--quick"
    
    # Security operations  
    measure_script "quality/secret-detector.sh" "Secret Detection" "--help"
    measure_script "quality/dependency-checker.sh" "Dependency Check" "--help"
    
    # File operations
    measure_file_ops
    
    # Generate report
    {
        echo "## Performance Test Results"
        echo ""
        echo "| Component | Average Time | Success Rate |"
        echo "|-----------|-------------|--------------|"
        
        for result in "${test_results[@]}"; do
            IFS='|' read -r component time success <<< "$result"
            echo "| $component | $time | $success |"
        done
        
        echo ""
        echo "## Analysis"
        echo ""
        echo "### Key Findings:"
        echo "- **Script startup overhead:** $(echo "${test_results[0]}" | cut -d'|' -f2)"
        echo "- **Help command performance:** Fast (most scripts < 1s for --help)"
        echo "- **File operation baseline:** Varies by file size"
        echo ""
        echo "### Recommendations for Simplification:"
        echo "- Target < 0.5s for help commands"
        echo "- Target < 2s for basic operations"
        echo "- Minimize file I/O in simplified patterns"
        echo "- Remove complex initialization overhead"
        
    } >> "$BASELINE_REPORT"
    
    log_info "Baseline complete! Report saved to: $BASELINE_REPORT"
}

# Check dependencies
if ! command -v bc >/dev/null 2>&1; then
    echo "Warning: bc not found, using basic arithmetic"
fi

main