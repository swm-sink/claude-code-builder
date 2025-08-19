#!/bin/bash
# Technical: Comprehensive performance benchmark suite for measuring pattern loading time, execution speed, and memory usage
# Simple: Like a stopwatch for your code - measures how fast each pattern loads and runs to ensure everything stays snappy
# Connection: Teaches performance optimization and measurement essential for scalable software development

set -e

# Load dependencies
if [[ -f "./patterns/error-handling/simple-error-handling.sh" ]]; then
    source ./patterns/error-handling/simple-error-handling.sh
fi

if [[ -f "./patterns/logging/simple-logging.sh" ]]; then
    source ./patterns/logging/simple-logging.sh
fi

# Performance measurement utilities
get_timestamp_ms() {
    if command -v gdate >/dev/null 2>&1; then
        # macOS with GNU coreutils
        gdate +%s%3N
    elif date --version 2>/dev/null | grep -q GNU; then
        # GNU date (Linux)
        date +%s%3N
    else
        # Fallback for macOS built-in date
        python3 -c "import time; print(int(time.time() * 1000))" 2>/dev/null || echo "$(date +%s)000"
    fi
}

# Measure pattern loading time
benchmark_pattern_loading() {
    local pattern_file="$1"
    local iterations="${2:-10}"
    local total_time=0
    local quiet="${3:-false}"
    
    if [[ "$quiet" != "true" ]]; then
        echo "📊 Benchmarking pattern loading: $(basename "$pattern_file")"
    fi
    
    for ((i=1; i<=iterations; i++)); do
        local start_time=$(get_timestamp_ms)
        
        # Load pattern in subshell to avoid conflicts
        (source "$pattern_file" >/dev/null 2>&1) || true
        
        local end_time=$(get_timestamp_ms)
        local duration=$((end_time - start_time))
        total_time=$((total_time + duration))
        
        if [[ "$quiet" != "true" ]]; then
            echo "  Iteration $i: ${duration}ms"
        fi
    done
    
    local avg_time=$((total_time / iterations))
    if [[ "$quiet" != "true" ]]; then
        echo "  📈 Average loading time: ${avg_time}ms"
        echo "  🎯 Performance grade: $(get_performance_grade "$avg_time")"
        echo ""
    fi
    
    echo "$avg_time"
}

# Get performance grade based on loading time
get_performance_grade() {
    local time_ms="$1"
    
    if [[ $time_ms -le 50 ]]; then
        echo "A+ (Excellent - ≤50ms)"
    elif [[ $time_ms -le 100 ]]; then
        echo "A (Very Good - ≤100ms)"
    elif [[ $time_ms -le 200 ]]; then
        echo "B (Good - ≤200ms)"
    elif [[ $time_ms -le 500 ]]; then
        echo "C (Acceptable - ≤500ms)"
    else
        echo "D (Needs Optimization - >500ms)"
    fi
}

# Benchmark function execution
benchmark_function_execution() {
    local pattern_file="$1"
    local function_name="$2"
    local iterations="${3:-100}"
    
    echo "🚀 Benchmarking function execution: $function_name"
    
    # Load pattern
    source "$pattern_file" >/dev/null 2>&1 || {
        echo "❌ Failed to load pattern: $pattern_file"
        return 1
    }
    
    # Check if function exists
    if ! command -v "$function_name" >/dev/null 2>&1; then
        echo "❌ Function not found: $function_name"
        return 1
    fi
    
    local total_time=0
    local successful_runs=0
    
    for ((i=1; i<=iterations; i++)); do
        local start_time=$(get_timestamp_ms)
        
        # Execute function with minimal args
        if "$function_name" >/dev/null 2>&1; then
            successful_runs=$((successful_runs + 1))
        fi
        
        local end_time=$(get_timestamp_ms)
        local duration=$((end_time - start_time))
        total_time=$((total_time + duration))
    done
    
    local avg_time=$((total_time / iterations))
    local success_rate=$((successful_runs * 100 / iterations))
    
    echo "  📊 Iterations: $iterations"
    echo "  ✅ Success rate: ${success_rate}%"
    echo "  📈 Average execution time: ${avg_time}ms"
    echo "  🎯 Performance grade: $(get_performance_grade "$avg_time")"
    echo ""
}

# Memory usage estimation
estimate_memory_usage() {
    local pattern_file="$1"
    
    echo "💾 Estimating memory usage: $(basename "$pattern_file")"
    
    # Count functions and variables
    local function_count=$(grep -c '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*()' "$pattern_file" 2>/dev/null || echo "0")
    local variable_count=$(grep -c '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*=' "$pattern_file" 2>/dev/null || echo "0")
    local line_count=$(wc -l < "$pattern_file")
    
    # Rough memory estimation (very approximate)
    local estimated_kb=$((line_count / 10 + function_count * 2 + variable_count))
    
    echo "  📝 Lines of code: $line_count"
    echo "  🔧 Functions defined: $function_count"
    echo "  📊 Variables: $variable_count"
    echo "  💾 Estimated memory: ~${estimated_kb}KB"
    
    if [[ $estimated_kb -le 10 ]]; then
        echo "  🎯 Memory grade: A+ (Lightweight)"
    elif [[ $estimated_kb -le 25 ]]; then
        echo "  🎯 Memory grade: A (Efficient)"
    elif [[ $estimated_kb -le 50 ]]; then
        echo "  🎯 Memory grade: B (Moderate)"
    else
        echo "  🎯 Memory grade: C (Heavy)"
    fi
    echo ""
}

# Comprehensive pattern benchmark
benchmark_pattern() {
    local pattern_file="$1"
    local iterations="${2:-10}"
    
    echo "🔥 Comprehensive Pattern Benchmark"
    echo "=================================="
    echo "Pattern: $pattern_file"
    echo "Iterations: $iterations"
    echo ""
    
    # 1. Loading time benchmark
    local benchmark_output=$(benchmark_pattern_loading "$pattern_file" "$iterations")
    local load_time=$(echo "$benchmark_output" | tail -1)
    
    # 2. Memory usage estimation
    estimate_memory_usage "$pattern_file"
    
    # 3. Function execution benchmarks (if functions exist)
    local functions=($(grep '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*()' "$pattern_file" 2>/dev/null | sed 's/[[:space:]]*()[[:space:]]*{.*//' | sed 's/^[[:space:]]*//' || true))
    
    if [[ ${#functions[@]} -gt 0 ]]; then
        echo "🔧 Function Execution Benchmarks:"
        for func in "${functions[@]}"; do
            benchmark_function_execution "$pattern_file" "$func" 10
        done
    fi
    
    # Overall assessment
    echo "📋 Overall Assessment:"
    if [[ $load_time -le 100 ]]; then
        echo "  ✅ Pattern performance is excellent"
    elif [[ $load_time -le 300 ]]; then
        echo "  ⚠️  Pattern performance is acceptable but could be optimized"
    else
        echo "  ❌ Pattern performance needs significant optimization"
    fi
    echo ""
}

# Benchmark all patterns
benchmark_all_patterns() {
    local patterns_dir="${1:-./patterns}"
    local iterations="${2:-5}"
    
    echo "🎯 Benchmarking All Claude Code Builder Patterns"
    echo "==============================================="
    echo "Directory: $patterns_dir"
    echo "Iterations per test: $iterations"
    echo ""
    
    local total_patterns=0
    local excellent_patterns=0
    local good_patterns=0
    local slow_patterns=0
    
    # Find all pattern files
    while IFS= read -r -d '' pattern_file; do
        if [[ -f "$pattern_file" && "$pattern_file" =~ \.sh$ ]]; then
            total_patterns=$((total_patterns + 1))
            
            echo "🧩 Testing Pattern $total_patterns: $(basename "$pattern_file")"
            echo "----------------------------------------"
            
            local load_time=$(benchmark_pattern_loading "$pattern_file" "$iterations" "true")
            
            echo "⏱️  Average loading time: ${load_time}ms - $(get_performance_grade "$load_time")"
            echo ""
            
            if [[ $load_time -le 100 ]]; then
                excellent_patterns=$((excellent_patterns + 1))
            elif [[ $load_time -le 300 ]]; then
                good_patterns=$((good_patterns + 1))
            else
                slow_patterns=$((slow_patterns + 1))
            fi
        fi
    done < <(find "$patterns_dir" -name "*.sh" -print0 2>/dev/null)
    
    echo "📊 Performance Summary"
    echo "===================="
    echo "Total patterns tested: $total_patterns"
    echo "Excellent (≤100ms): $excellent_patterns"
    echo "Good (101-300ms): $good_patterns"
    echo "Needs optimization (>300ms): $slow_patterns"
    echo ""
    
    local excellent_percentage=$((excellent_patterns * 100 / total_patterns))
    echo "📈 Performance score: ${excellent_percentage}% excellent patterns"
    
    if [[ $excellent_percentage -ge 80 ]]; then
        echo "🎉 Overall performance grade: A+ (Excellent)"
    elif [[ $excellent_percentage -ge 60 ]]; then
        echo "✅ Overall performance grade: A (Very Good)"
    elif [[ $excellent_percentage -ge 40 ]]; then
        echo "⚠️  Overall performance grade: B (Good)"
    else
        echo "❌ Overall performance grade: C (Needs Improvement)"
    fi
}

# Performance regression test
performance_regression_test() {
    local patterns_dir="${1:-./patterns}"
    local baseline_file="${2:-./performance-baseline.json}"
    
    echo "🔍 Performance Regression Test"
    echo "============================="
    
    if [[ ! -f "$baseline_file" ]]; then
        echo "📝 Creating performance baseline..."
        create_performance_baseline "$patterns_dir" "$baseline_file"
        return 0
    fi
    
    echo "📊 Comparing against baseline: $baseline_file"
    
    # Simple baseline comparison (would be more sophisticated with actual JSON parsing)
    local current_avg=$(benchmark_pattern_loading "./patterns/error-handling/simple-error-handling.sh" 5)
    echo "Current performance: ${current_avg}ms"
    echo "✅ Regression test completed (baseline comparison not fully implemented in v1)"
}

# Create performance baseline
create_performance_baseline() {
    local patterns_dir="$1"
    local baseline_file="$2"
    
    echo "# Performance Baseline - $(date)" > "$baseline_file"
    echo "# Generated by Claude Code Builder Performance Benchmarks" >> "$baseline_file"
    echo "" >> "$baseline_file"
    
    while IFS= read -r -d '' pattern_file; do
        if [[ -f "$pattern_file" && "$pattern_file" =~ \.sh$ ]]; then
            local relative_path=$(echo "$pattern_file" | sed "s|^$patterns_dir/||")
            local load_time=$(benchmark_pattern_loading "$pattern_file" 5)
            echo "$relative_path:$load_time" >> "$baseline_file"
        fi
    done < <(find "$patterns_dir" -name "*.sh" -print0 2>/dev/null)
    
    echo "📝 Baseline saved to: $baseline_file"
}

# Main function
main() {
    case "${1:-benchmark-all}" in
        benchmark-all)
            benchmark_all_patterns "${2:-./patterns}" "${3:-5}"
            ;;
        benchmark-pattern)
            local pattern_file="$2"
            if [[ -z "$pattern_file" ]]; then
                echo "Usage: $0 benchmark-pattern <pattern_file> [iterations]"
                exit 1
            fi
            benchmark_pattern "$pattern_file" "${3:-10}"
            ;;
        regression-test)
            performance_regression_test "${2:-./patterns}" "${3:-./performance-baseline.json}"
            ;;
        create-baseline)
            create_performance_baseline "${2:-./patterns}" "${3:-./performance-baseline.json}"
            ;;
        help)
            echo "Claude Code Builder Performance Benchmarks"
            echo ""
            echo "Usage:"
            echo "  $0 benchmark-all [patterns_dir] [iterations]     # Benchmark all patterns"
            echo "  $0 benchmark-pattern <file> [iterations]         # Benchmark specific pattern"
            echo "  $0 regression-test [patterns_dir] [baseline]     # Run regression test"
            echo "  $0 create-baseline [patterns_dir] [baseline]     # Create performance baseline"
            echo "  $0 help                                          # Show this help"
            echo ""
            echo "Examples:"
            echo "  $0 benchmark-all                                 # Test all patterns"
            echo "  $0 benchmark-pattern ./pattern.sh 20            # Test specific pattern"
            echo "  $0 create-baseline                               # Create baseline"
            ;;
        *)
            echo "Unknown command: $1"
            echo "Run '$0 help' for usage information"
            exit 1
            ;;
    esac
}

# Run if called directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi