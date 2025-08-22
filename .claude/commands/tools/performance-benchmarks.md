---
allowed-tools: Read, Write, Bash(find:*), Bash(grep:*), Bash(wc:*), Bash(date:*), Bash(time:*), Bash(ps:*), Bash(top:*), Bash(vmstat:*), Bash(iostat:*), Bash(awk:*), Bash(sed:*), Bash(head:*), Bash(tail:*), Bash(sort:*), Bash(uniq:*), Bash(jq:*), Bash(bc:*), Bash(timeout:*), Bash(python3:*), Bash(node:*), Bash(go:*), Bash(cargo:*), Bash(npm:*), Bash(pip:*)
argument-hint: [benchmark-type] or [target-path] or [iterations]
description: Comprehensive performance benchmarking suite with advanced metrics analysis, regression testing, and optimization recommendations
---

# Performance Benchmarking and Analysis Suite

Advanced performance benchmarking system providing comprehensive analysis of code execution speed, memory usage, resource consumption, and scalability characteristics with intelligent optimization recommendations, regression testing capabilities, and enterprise-grade performance monitoring across multiple programming languages and environments.

## Quick Usage

```bash
# Benchmark all patterns with default settings
/performance-benchmarks

# Comprehensive single file benchmark
/performance-benchmarks benchmark-file /path/to/code.sh

# Advanced multi-metric analysis
/performance-benchmarks comprehensive /path/to/project

# Performance regression testing
/performance-benchmarks regression-test

# Resource consumption analysis
/performance-benchmarks resource-analysis /path/to/code

# Generate performance report
/performance-benchmarks performance-report /path/to/project json
```

## Core Benchmarking Operations

### Single File Benchmarking
```bash
# Parse arguments from $ARGUMENTS
IFS=' ' read -ra ARGS <<< "$ARGUMENTS"
benchmark_type="${ARGS[0]:-benchmark-all}"
target_path="${ARGS[1]:-.}"
iterations="${ARGS[2]:-10}"

# Comprehensive single file performance analysis
if [[ "$benchmark_type" == "benchmark-file" ]]; then
    file_path="$target_path"
    benchmark_iterations="$iterations"
    
    /error-handler "info" "Starting comprehensive performance benchmark: $file_path"
    
    if [[ ! -f "$file_path" ]]; then
        /error-handler "error" "File not found: $file_path"
        exit 1
    fi
    
    # Initialize performance metrics
    declare -A performance_metrics=(
        ["loading_time"]=0
        ["execution_time"]=0
        ["memory_usage"]=0
        ["cpu_usage"]=0
        ["io_operations"]=0
        ["scalability"]=0
        ["resource_efficiency"]=0
        ["optimization_score"]=0
    )
    
    declare -A benchmark_details
    benchmark_start_time=$(get_high_precision_timestamp)
    
    # Detect file type and language for appropriate benchmarking
    file_language=$(detect_file_language "$file_path")
    benchmark_details["language"]="📋 Language detected: $file_language"
    
    echo "⚡ Performance Benchmarking Suite"
    echo "================================"
    echo "File: $file_path"
    echo "Language: $file_language"
    echo "Iterations: $benchmark_iterations"
    echo ""
    
    # Core loading time analysis
    echo "🚀 Analyzing loading performance..."
    loading_score=$(analyze_loading_performance "$file_path" "$file_language" "$benchmark_iterations")
    performance_metrics["loading_time"]=$loading_score
    
    # Execution time analysis
    echo "⚡ Analyzing execution performance..."
    execution_score=$(analyze_execution_performance "$file_path" "$file_language" "$benchmark_iterations")
    performance_metrics["execution_time"]=$execution_score
    
    # Memory usage analysis
    echo "💾 Analyzing memory consumption..."
    memory_score=$(analyze_memory_consumption "$file_path" "$file_language")
    performance_metrics["memory_usage"]=$memory_score
    
    # CPU usage analysis
    echo "🔥 Analyzing CPU utilization..."
    cpu_score=$(analyze_cpu_utilization "$file_path" "$file_language")
    performance_metrics["cpu_usage"]=$cpu_score
    
    # I/O operations analysis
    echo "💿 Analyzing I/O operations..."
    io_score=$(analyze_io_operations "$file_path" "$file_language")
    performance_metrics["io_operations"]=$io_score
    
    # Scalability analysis
    echo "📈 Analyzing scalability characteristics..."
    scalability_score=$(analyze_scalability_patterns "$file_path" "$file_language")
    performance_metrics["scalability"]=$scalability_score
    
    # Resource efficiency analysis
    echo "♻️ Analyzing resource efficiency..."
    efficiency_score=$(analyze_resource_efficiency "$file_path" "$file_language")
    performance_metrics["resource_efficiency"]=$efficiency_score
    
    # Optimization potential analysis
    echo "🎯 Analyzing optimization opportunities..."
    optimization_score=$(analyze_optimization_potential "$file_path" "$file_language")
    performance_metrics["optimization_score"]=$optimization_score
    
    # Calculate overall performance score
    total_weighted_score=0
    total_weight=0
    
    # Performance category weights
    declare -A metric_weights=(
        ["loading_time"]=20
        ["execution_time"]=25
        ["memory_usage"]=15
        ["cpu_usage"]=15
        ["io_operations"]=10
        ["scalability"]=10
        ["resource_efficiency"]=15
        ["optimization_score"]=10
    )
    
    for metric in "${!performance_metrics[@]}"; do
        score=${performance_metrics[$metric]}
        weight=${metric_weights[$metric]}
        
        total_weighted_score=$((total_weighted_score + (score * weight)))
        total_weight=$((total_weight + weight))
    done
    
    overall_score=$((total_weighted_score / total_weight))
    
    # Generate comprehensive performance report
    benchmark_end_time=$(get_high_precision_timestamp)
    benchmark_duration=$((benchmark_end_time - benchmark_start_time))
    
    echo ""
    echo "📊 Performance Analysis Report"
    echo "============================="
    echo "File: $file_path"
    echo "Language: $file_language"
    echo "Benchmark Time: ${benchmark_duration}ms"
    echo ""
    echo "🎯 Overall Performance Score: $overall_score/100"
    
    # Performance grade assessment
    if [[ $overall_score -ge 95 ]]; then
        echo "🏆 Grade: A+ (Exceptional performance)"
        grade="A+"
    elif [[ $overall_score -ge 90 ]]; then
        echo "🟢 Grade: A (Excellent performance)"
        grade="A"
    elif [[ $overall_score -ge 80 ]]; then
        echo "🟡 Grade: B (Very good performance)"
        grade="B"
    elif [[ $overall_score -ge 70 ]]; then
        echo "🟠 Grade: C (Good performance)"
        grade="C"
    elif [[ $overall_score -ge 60 ]]; then
        echo "🔴 Grade: D (Acceptable performance)"
        grade="D"
    else
        echo "🚫 Grade: F (Poor performance - optimization required)"
        grade="F"
    fi
    
    echo ""
    echo "📋 Detailed Performance Metrics:"
    for metric in "${!performance_metrics[@]}"; do
        score=${performance_metrics[$metric]}
        weight=${metric_weights[$metric]}
        echo "  ⚡ $metric: $score/100 (weight: $weight%)"
    done
    
    echo ""
    echo "🔍 Performance Findings:"
    for detail in "${!benchmark_details[@]}"; do
        echo "  ${benchmark_details[$detail]}"
    done
    
    # Generate optimization recommendations
    echo ""
    echo "💡 Performance Optimization Recommendations:"
    generate_performance_recommendations "$file_path" "$file_language" performance_metrics
    
    /error-handler "info" "Single file benchmark completed: $grade grade ($overall_score%)"
    
    # Return appropriate exit code based on grade
    case "$grade" in
        "A+"|"A") exit 0 ;;
        "B") exit 1 ;;
        "C") exit 2 ;;
        "D") exit 3 ;;
        "F") exit 4 ;;
    esac
fi
```

### Comprehensive Batch Benchmarking
```bash
# Benchmark all patterns with advanced analytics
if [[ "$benchmark_type" == "benchmark-all" ]]; then
    patterns_dir="$target_path"
    batch_iterations="$iterations"
    
    /error-handler "info" "Starting comprehensive batch benchmarking: $patterns_dir"
    
    echo "🎯 Comprehensive Performance Benchmark Suite"
    echo "============================================"
    echo "Directory: $patterns_dir"
    echo "Iterations per test: $batch_iterations"
    echo ""
    
    declare -a benchmark_results=()
    declare -a performance_grades=()
    declare -A category_totals=(
        ["excellent"]=0
        ["good"]=0
        ["fair"]=0
        ["poor"]=0
    )
    
    total_files=0
    total_performance_score=0
    
    # Find and benchmark all supported files
    while IFS= read -r -d '' file_path; do
        if [[ -f "$file_path" ]]; then
            file_extension="${file_path##*.}"
            
            # Check if file type is supported for benchmarking
            if is_supported_benchmark_file "$file_path"; then
                ((total_files++))
                
                echo "⚡ Benchmarking: $(basename "$file_path")"
                
                # Perform optimized batch analysis
                file_score=$(perform_batch_benchmark "$file_path" "$batch_iterations")
                total_performance_score=$((total_performance_score + file_score))
                
                relative_path=$(realpath --relative-to="$patterns_dir" "$file_path" 2>/dev/null || echo "$file_path")
                
                # Categorize performance
                if [[ $file_score -ge 90 ]]; then
                    echo "  🟢 Score: $file_score/100 (EXCELLENT)"
                    ((category_totals["excellent"]++))
                    performance_grade="excellent"
                elif [[ $file_score -ge 75 ]]; then
                    echo "  🟡 Score: $file_score/100 (GOOD)"
                    ((category_totals["good"]++))
                    performance_grade="good"
                elif [[ $file_score -ge 60 ]]; then
                    echo "  🟠 Score: $file_score/100 (FAIR)"
                    ((category_totals["fair"]++))
                    performance_grade="fair"
                else
                    echo "  🔴 Score: $file_score/100 (POOR)"
                    ((category_totals["poor"]++))
                    performance_grade="poor"
                fi
                
                benchmark_results+=("$relative_path:$file_score:$performance_grade")
                echo ""
            fi
        fi
    done < <(find "$patterns_dir" -type f \( -name "*.sh" -o -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.go" -o -name "*.rs" \) -print0 2>/dev/null)
    
    echo ""
    echo "📈 Batch Performance Summary"
    echo "=========================="
    echo "Total files benchmarked: $total_files"
    echo "Excellent performance (90+): ${category_totals["excellent"]}"
    echo "Good performance (75-89): ${category_totals["good"]}"
    echo "Fair performance (60-74): ${category_totals["fair"]}"
    echo "Poor performance (<60): ${category_totals["poor"]}"
    
    if [[ $total_files -gt 0 ]]; then
        average_score=$((total_performance_score / total_files))
        echo "Average performance: $average_score/100"
        
        # Calculate excellence percentage
        excellent_percentage=$((category_totals["excellent"] * 100 / total_files))
        echo "Excellence rate: $excellent_percentage%"
        
        # Overall assessment
        if [[ $excellent_percentage -ge 80 ]]; then
            echo "🏆 Overall Grade: A+ (Exceptional project performance)"
        elif [[ $excellent_percentage -ge 60 ]]; then
            echo "🟢 Overall Grade: A (Excellent project performance)"
        elif [[ $excellent_percentage -ge 40 ]]; then
            echo "🟡 Overall Grade: B (Good project performance)"
        elif [[ $excellent_percentage -ge 20 ]]; then
            echo "🟠 Overall Grade: C (Fair project performance)"
        else
            echo "🔴 Overall Grade: D (Project needs performance optimization)"
        fi
    fi
    
    echo ""
    
    # Display performance leaders and laggards
    if [[ ${#benchmark_results[@]} -gt 0 ]]; then
        echo "🏆 Performance Leaders:"
        printf '%s\n' "${benchmark_results[@]}" | sort -t: -k2 -nr | head -5 | while IFS=: read -r file score grade; do
            echo "  🥇 $file: $score/100 ($grade)"
        done
        
        echo ""
        echo "⚠️ Performance Improvement Opportunities:"
        printf '%s\n' "${benchmark_results[@]}" | sort -t: -k2 -n | head -5 | while IFS=: read -r file score grade; do
            if [[ $score -lt 75 ]]; then
                echo "  🔧 $file: $score/100 ($grade)"
            fi
        done
    fi
    
    /error-handler "info" "Batch benchmarking completed: $total_files files analyzed"
    exit $((excellent_percentage >= 60 ? 0 : 1))
fi
```

### Comprehensive Project Analysis
```bash
# Multi-faceted project performance analysis
if [[ "$benchmark_type" == "comprehensive" ]]; then
    project_path="$target_path"
    
    /error-handler "info" "Starting comprehensive project performance analysis: $project_path"
    
    echo "🔬 Comprehensive Project Performance Analysis"
    echo "============================================="
    echo "Project: $project_path"
    echo ""
    
    # Project structure analysis
    echo "🏗️ Analyzing project structure performance..."
    analyze_project_structure_performance "$project_path"
    
    # Language-specific performance analysis
    echo "🌐 Analyzing multi-language performance..."
    analyze_multilanguage_performance "$project_path"
    
    # Dependency performance analysis
    echo "📦 Analyzing dependency performance impact..."
    analyze_dependency_performance "$project_path"
    
    # Build and deployment performance
    echo "🚀 Analyzing build and deployment performance..."
    analyze_build_deployment_performance "$project_path"
    
    # Resource scaling analysis
    echo "📈 Analyzing resource scaling characteristics..."
    analyze_resource_scaling "$project_path"
    
    /error-handler "info" "Comprehensive project analysis completed"
fi
```

### Performance Regression Testing
```bash
# Advanced regression testing with trend analysis
if [[ "$benchmark_type" == "regression-test" ]]; then
    regression_target="$target_path"
    baseline_file="${ARGS[2]:-./performance-baseline.json}"
    
    /error-handler "info" "Starting performance regression testing: $regression_target"
    
    echo "🔍 Performance Regression Analysis"
    echo "================================="
    echo "Target: $regression_target"
    echo "Baseline: $baseline_file"
    echo ""
    
    if [[ ! -f "$baseline_file" ]]; then
        echo "📝 Creating performance baseline..."
        create_performance_baseline "$regression_target" "$baseline_file"
        /error-handler "info" "Performance baseline created: $baseline_file"
        exit 0
    fi
    
    # Load baseline data
    echo "📊 Loading performance baseline..."
    load_performance_baseline "$baseline_file"
    
    # Execute regression tests
    echo "🔬 Executing regression analysis..."
    
    declare -A regression_results
    declare -a regressions_detected=()
    declare -a improvements_detected=()
    
    # Test each file against baseline
    while IFS= read -r -d '' file_path; do
        if [[ -f "$file_path" ]] && is_supported_benchmark_file "$file_path"; then
            relative_path=$(realpath --relative-to="$regression_target" "$file_path" 2>/dev/null || echo "$file_path")
            
            # Get current performance
            current_score=$(perform_batch_benchmark "$file_path" 5)
            
            # Compare with baseline
            baseline_score=$(get_baseline_score "$relative_path")
            
            if [[ -n "$baseline_score" ]]; then
                score_diff=$((current_score - baseline_score))
                regression_results["$relative_path"]="$current_score:$baseline_score:$score_diff"
                
                # Detect significant changes (>5% threshold)
                threshold=$((baseline_score * 5 / 100))
                
                if [[ $score_diff -lt -$threshold ]]; then
                    regressions_detected+=("$relative_path: $score_diff points regression ($baseline_score → $current_score)")
                elif [[ $score_diff -gt $threshold ]]; then
                    improvements_detected+=("$relative_path: +$score_diff points improvement ($baseline_score → $current_score)")
                fi
            fi
        fi
    done < <(find "$regression_target" -type f \( -name "*.sh" -o -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.go" -o -name "*.rs" \) -print0 2>/dev/null)
    
    # Generate regression report
    echo ""
    echo "📋 Regression Test Results"
    echo "========================="
    
    if [[ ${#regressions_detected[@]} -gt 0 ]]; then
        echo "⚠️ Performance Regressions Detected:"
        for regression in "${regressions_detected[@]}"; do
            echo "  🔴 $regression"
        done
        echo ""
    fi
    
    if [[ ${#improvements_detected[@]} -gt 0 ]]; then
        echo "✅ Performance Improvements Detected:"
        for improvement in "${improvements_detected[@]}"; do
            echo "  🟢 $improvement"
        done
        echo ""
    fi
    
    if [[ ${#regressions_detected[@]} -eq 0 && ${#improvements_detected[@]} -eq 0 ]]; then
        echo "✅ No significant performance changes detected"
    fi
    
    # Update baseline if requested
    if [[ "${ARGS[3]}" == "--update-baseline" ]]; then
        echo "📝 Updating performance baseline..."
        create_performance_baseline "$regression_target" "$baseline_file"
    fi
    
    /error-handler "info" "Regression testing completed: ${#regressions_detected[@]} regressions, ${#improvements_detected[@]} improvements"
    
    # Exit with error if regressions detected
    exit $((${#regressions_detected[@]} > 0 ? 1 : 0))
fi
```

### Resource Analysis
```bash
# Advanced resource consumption analysis
if [[ "$benchmark_type" == "resource-analysis" ]]; then
    resource_target="$target_path"
    
    /error-handler "info" "Starting resource consumption analysis: $resource_target"
    
    echo "💾 Resource Consumption Analysis"
    echo "==============================="
    echo "Target: $resource_target"
    echo ""
    
    # Memory analysis
    echo "🧠 Memory Usage Analysis..."
    analyze_memory_patterns "$resource_target"
    
    # CPU utilization analysis
    echo "🔥 CPU Utilization Analysis..."
    analyze_cpu_patterns "$resource_target"
    
    # I/O performance analysis
    echo "💿 I/O Performance Analysis..."
    analyze_io_patterns "$resource_target"
    
    # Network resource analysis
    echo "🌐 Network Resource Analysis..."
    analyze_network_patterns "$resource_target"
    
    # Resource efficiency recommendations
    echo "♻️ Resource Efficiency Recommendations..."
    generate_resource_optimization_recommendations "$resource_target"
    
    /error-handler "info" "Resource analysis completed"
fi
```

### Performance Report Generation
```bash
# Generate comprehensive performance reports
if [[ "$benchmark_type" == "performance-report" ]]; then
    report_target="$target_path"
    report_format="${ARGS[2]:-text}"
    
    /error-handler "info" "Generating performance report: $report_format format"
    
    case "$report_format" in
        "json")
            generate_json_performance_report "$report_target"
            ;;
        "xml")
            generate_xml_performance_report "$report_target"
            ;;
        "html")
            generate_html_performance_report "$report_target"
            ;;
        "text"|*)
            generate_text_performance_report "$report_target"
            ;;
    esac
    
    /error-handler "info" "Performance report generation completed"
fi
```

## Performance Analysis Helper Functions

```bash
# High precision timestamp for accurate benchmarking
get_high_precision_timestamp() {
    if command -v python3 >/dev/null 2>&1; then
        python3 -c "import time; print(int(time.time() * 1000000))"
    elif command -v node >/dev/null 2>&1; then
        node -e "console.log(Math.floor(process.hrtime.bigint() / 1000000n))"
    elif command -v gdate >/dev/null 2>&1; then
        gdate +%s%6N | cut -c1-16
    else
        # Fallback to millisecond precision
        date +%s%3N | sed 's/$/000/'
    fi
}

# Advanced loading performance analysis
analyze_loading_performance() {
    local file_path="$1"
    local language="$2"
    local iterations="$3"
    
    local total_time=0
    local min_time=999999999
    local max_time=0
    local successful_loads=0
    
    echo "  🚀 Executing $iterations loading iterations..."
    
    for ((i=1; i<=iterations; i++)); do
        local start_time
        start_time=$(get_high_precision_timestamp)
        
        # Language-specific loading simulation
        case "$language" in
            "bash"|"shell")
                if (source "$file_path" >/dev/null 2>&1); then
                    ((successful_loads++))
                fi
                ;;
            "python")
                if python3 -c "import sys; sys.path.insert(0, '$(dirname "$file_path")'); __import__('$(basename "$file_path" .py)')" >/dev/null 2>&1; then
                    ((successful_loads++))
                fi
                ;;
            "javascript"|"typescript")
                if command -v node >/dev/null 2>&1 && node -e "require('$file_path')" >/dev/null 2>&1; then
                    ((successful_loads++))
                fi
                ;;
            *)
                # Generic file reading test
                if [[ -r "$file_path" ]]; then
                    cat "$file_path" >/dev/null 2>&1
                    ((successful_loads++))
                fi
                ;;
        esac
        
        local end_time
        end_time=$(get_high_precision_timestamp)
        local duration=$((end_time - start_time))
        
        total_time=$((total_time + duration))
        [[ $duration -lt $min_time ]] && min_time=$duration
        [[ $duration -gt $max_time ]] && max_time=$duration
    done
    
    local avg_time=$((total_time / iterations))
    local success_rate=$((successful_loads * 100 / iterations))
    
    # Convert microseconds to milliseconds for reporting
    avg_time=$((avg_time / 1000))
    min_time=$((min_time / 1000))
    max_time=$((max_time / 1000))
    
    record_benchmark_finding "loading_stats" "✅ Loading: avg ${avg_time}ms, min ${min_time}ms, max ${max_time}ms, success ${success_rate}%"
    
    # Score based on average loading time and success rate
    local time_score=100
    if [[ $avg_time -gt 1000 ]]; then
        time_score=20
    elif [[ $avg_time -gt 500 ]]; then
        time_score=40
    elif [[ $avg_time -gt 200 ]]; then
        time_score=60
    elif [[ $avg_time -gt 100 ]]; then
        time_score=80
    fi
    
    # Adjust for success rate
    local loading_score=$((time_score * success_rate / 100))
    
    echo "$loading_score"
}

# Advanced execution performance analysis
analyze_execution_performance() {
    local file_path="$1"
    local language="$2"
    local iterations="$3"
    
    echo "  ⚡ Analyzing execution performance..."
    
    # Extract functions/methods for execution testing
    local executable_functions
    executable_functions=$(extract_executable_functions "$file_path" "$language")
    
    if [[ -z "$executable_functions" ]]; then
        record_benchmark_finding "execution_performance" "⚠️ No executable functions found for performance testing"
        echo "75"  # Neutral score
        return
    fi
    
    local total_execution_score=0
    local function_count=0
    
    # Test each function performance
    while IFS= read -r function_name; do
        if [[ -n "$function_name" ]]; then
            ((function_count++))
            local func_score
            func_score=$(benchmark_function_execution "$file_path" "$function_name" "$language" 10)
            total_execution_score=$((total_execution_score + func_score))
        fi
    done <<< "$executable_functions"
    
    if [[ $function_count -gt 0 ]]; then
        local avg_execution_score=$((total_execution_score / function_count))
        record_benchmark_finding "execution_performance" "✅ Execution analysis: $function_count functions, avg score $avg_execution_score/100"
        echo "$avg_execution_score"
    else
        echo "75"
    fi
}

# Memory consumption analysis
analyze_memory_consumption() {
    local file_path="$1"
    local language="$2"
    
    echo "  💾 Analyzing memory consumption patterns..."
    
    # File size analysis
    local file_size
    file_size=$(stat -c%s "$file_path" 2>/dev/null || stat -f%z "$file_path" 2>/dev/null || echo "0")
    
    # Line count analysis
    local line_count
    line_count=$(wc -l < "$file_path")
    
    # Language-specific memory estimation
    local estimated_memory_kb
    case "$language" in
        "bash"|"shell")
            # Bash: ~1KB per 100 lines + function overhead
            local function_count
            function_count=$(grep -c '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*()' "$file_path" 2>/dev/null || echo "0")
            estimated_memory_kb=$(((line_count / 100) + (function_count * 2) + (file_size / 1024)))
            ;;
        "python")
            # Python: ~2KB per 100 lines + import overhead
            local import_count
            import_count=$(grep -c '^import\|^from.*import' "$file_path" 2>/dev/null || echo "0")
            estimated_memory_kb=$(((line_count / 50) + (import_count * 5) + (file_size / 1024)))
            ;;
        "javascript"|"typescript")
            # JavaScript: ~3KB per 100 lines + dependency overhead
            estimated_memory_kb=$(((line_count / 30) + (file_size / 1024)))
            ;;
        *)
            # Generic estimation
            estimated_memory_kb=$(((line_count / 75) + (file_size / 1024)))
            ;;
    esac
    
    # Score based on memory efficiency
    local memory_score=100
    if [[ $estimated_memory_kb -gt 1000 ]]; then
        memory_score=30
    elif [[ $estimated_memory_kb -gt 500 ]]; then
        memory_score=50
    elif [[ $estimated_memory_kb -gt 200 ]]; then
        memory_score=70
    elif [[ $estimated_memory_kb -gt 100 ]]; then
        memory_score=85
    fi
    
    record_benchmark_finding "memory_consumption" "✅ Memory analysis: ~${estimated_memory_kb}KB estimated (${line_count} lines, ${file_size} bytes)"
    
    echo "$memory_score"
}

# Generate performance optimization recommendations
generate_performance_recommendations() {
    local file_path="$1"
    local language="$2"
    local -n metrics_ref=$3
    
    local recommendations=()
    
    # Loading time improvements
    if [[ ${metrics_ref["loading_time"]} -lt 80 ]]; then
        recommendations+=("🚀 Optimize loading time: reduce file size, minimize dependencies, use lazy loading")
        recommendations+=("📦 Consider code splitting and modular architecture")
    fi
    
    # Execution time improvements
    if [[ ${metrics_ref["execution_time"]} -lt 80 ]]; then
        recommendations+=("⚡ Optimize execution performance: reduce algorithmic complexity, cache results")
        recommendations+=("🔄 Consider asynchronous processing for I/O operations")
    fi
    
    # Memory usage improvements
    if [[ ${metrics_ref["memory_usage"]} -lt 80 ]]; then
        recommendations+=("💾 Optimize memory usage: avoid memory leaks, use efficient data structures")
        recommendations+=("♻️ Implement proper resource cleanup and garbage collection")
    fi
    
    # CPU usage improvements
    if [[ ${metrics_ref["cpu_usage"]} -lt 80 ]]; then
        recommendations+=("🔥 Optimize CPU usage: reduce computational complexity, parallelize workloads")
        recommendations+=("⚙️ Profile CPU hotspots and optimize critical paths")
    fi
    
    # I/O improvements
    if [[ ${metrics_ref["io_operations"]} -lt 80 ]]; then
        recommendations+=("💿 Optimize I/O operations: batch requests, use efficient file formats")
        recommendations+=("📊 Implement caching strategies for frequently accessed data")
    fi
    
    # Language-specific recommendations
    case "$language" in
        "bash"|"shell")
            recommendations+=("🐚 Bash optimization: use built-in commands, avoid subshells, quote variables")
            ;;
        "python")
            recommendations+=("🐍 Python optimization: use list comprehensions, leverage NumPy for computations")
            ;;
        "javascript"|"typescript")
            recommendations+=("🟨 JavaScript optimization: minimize DOM manipulation, use Web Workers for heavy tasks")
            ;;
        "go"|"golang")
            recommendations+=("🐹 Go optimization: use goroutines efficiently, minimize allocations, leverage channels")
            ;;
        "rust"|"rs")
            recommendations+=("🦀 Rust optimization: leverage zero-cost abstractions, minimize heap allocations, use iterators")
            ;;
    esac
    
    # Display recommendations
    for i in "${!recommendations[@]}"; do
        echo "  $((i + 1)). ${recommendations[$i]}"
    done
    
    if [[ ${#recommendations[@]} -eq 0 ]]; then
        echo "  🎉 Performance is excellent - no specific optimizations needed!"
    fi
}

# Check if file is supported for benchmarking
is_supported_benchmark_file() {
    local file_path="$1"
    local extension="${file_path##*.}"
    
    case "$extension" in
        "sh"|"bash"|"py"|"js"|"ts"|"go"|"rs"|"java"|"cpp"|"c") return 0 ;;
        *) 
            # Check for executable files or scripts
            if [[ -x "$file_path" ]] || head -1 "$file_path" 2>/dev/null | grep -q "^#!"; then
                return 0
            else
                return 1
            fi
            ;;
    esac
}
```

## Integration Examples

### Error Handling Integration
```bash
# Performance benchmarking with comprehensive error handling
/error-handler "info" "Starting performance benchmarking workflow"

benchmark_result=$(/performance-benchmarks benchmark-file "$FILE_PATH")
benchmark_status=$?

case $benchmark_status in
    0) /error-handler "info" "Performance benchmark excellent: A+ grade achieved" ;;
    1) /error-handler "info" "Performance benchmark very good: B grade" ;;
    2) /error-handler "warn" "Performance benchmark good: C grade - optimizations recommended" ;;
    3) /error-handler "warn" "Performance benchmark fair: D grade - significant optimizations needed" ;;
    4) /error-handler "error" "Performance benchmark poor: F grade - major optimization required" ;;
esac

/error-handler "info" "Benchmark completed with status code $benchmark_status"
```

### Security Scanner Integration
```bash
# Combined performance and security analysis
performance_result=$(/performance-benchmarks comprehensive "$PROJECT_PATH")
security_scan=$(/security-scanner "performance-impact" "$PROJECT_PATH")

if [[ $performance_result -eq 0 && $security_scan -eq 0 ]]; then
    /error-handler "info" "Complete analysis passed: performance and security excellent"
else
    /error-handler "warn" "Analysis improvements needed"
    /error-handler "info" "Performance score: $performance_result"
    /error-handler "info" "Security scan result: $security_scan"
fi
```

### Quality Gates Integration
```bash
# Performance benchmarking as part of quality gates
performance_score=$(/performance-benchmarks benchmark-file "$FILE_PATH")
code_quality=$(/quality-check "comprehensive")
readability_score=$(/claude-readability-scorer score-file "$FILE_PATH")

if [[ $performance_score -le 1 && $code_quality -eq 0 && $readability_score -le 1 ]]; then
    /error-handler "info" "All quality gates passed: performance, code quality, and readability excellent"
else
    /error-handler "warn" "Quality improvements recommended"
    /error-handler "info" "Performance grade: $performance_score"
    /error-handler "info" "Code quality: $code_quality"
    /error-handler "info" "Readability: $readability_score"
fi
```

**Technical**: Comprehensive performance benchmarking suite with advanced metrics analysis, regression testing, and optimization recommendations  
**Simple**: Smart stopwatch that measures how fast your code runs and tells you exactly how to make it faster  
**Connection**: Teaches performance optimization and measurement essential for scalable software development and maintaining responsive applications