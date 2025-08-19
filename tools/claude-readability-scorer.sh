#!/bin/bash
# Technical: Automated scoring algorithm that evaluates pattern readability and comprehension for Claude AI using multiple objective metrics
# Simple: Like a teacher grading papers - checks if code is clear, well-organized, and easy for AI to understand
# Connection: Teaches code quality assessment and automated validation essential for AI-assisted development workflows

set -e

# Load dependencies
if [[ -f "./patterns/error-handling/simple-error-handling.sh" ]]; then
    source ./patterns/error-handling/simple-error-handling.sh
fi

if [[ -f "./patterns/logging/simple-logging.sh" ]]; then
    source ./patterns/logging/simple-logging.sh
fi

# Claude readability scoring metrics
calculate_readability_score() {
    local file_path="$1"
    local total_score=0
    local max_score=100
    
    if [[ ! -f "$file_path" ]]; then
        echo "0"
        return 1
    fi
    
    # Metric 1: Line count (15 points max)
    local line_count=$(wc -l < "$file_path")
    local non_empty_lines=$(grep -v '^[[:space:]]*$' "$file_path" | wc -l)
    if [ $non_empty_lines -le 50 ]; then
        total_score=$((total_score + 15))
    elif [ $non_empty_lines -le 75 ]; then
        total_score=$((total_score + 10))
    elif [ $non_empty_lines -le 100 ]; then
        total_score=$((total_score + 5))
    fi
    
    # Metric 2: Function naming clarity (15 points max)
    local function_count=$(grep -c '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*()' "$file_path" 2>/dev/null || echo "0")
    local descriptive_functions=$(grep '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*()' "$file_path" 2>/dev/null | grep -E '(check|get|set|run|load|validate|handle|process|create)' | wc -l || echo "0")
    descriptive_functions=$(echo "$descriptive_functions" | tr -d '\n')
    
    if [[ $function_count -gt 0 ]]; then
        local naming_ratio=$((descriptive_functions * 100 / function_count))
        if [[ $naming_ratio -ge 80 ]]; then
            total_score=$((total_score + 15))
        elif [[ $naming_ratio -ge 60 ]]; then
            total_score=$((total_score + 10))
        elif [[ $naming_ratio -ge 40 ]]; then
            total_score=$((total_score + 5))
        fi
    fi
    
    # Metric 3: Comment quality (10 points max)
    local comment_lines=$(grep -c '^[[:space:]]*#' "$file_path" 2>/dev/null || echo "0")
    local triple_explanation=$(grep -c '^# Technical:\|^# Simple:\|^# Connection:' "$file_path" 2>/dev/null || echo "0")
    
    if [[ $triple_explanation -eq 3 ]]; then
        total_score=$((total_score + 10))
    elif [[ $comment_lines -gt 5 ]]; then
        total_score=$((total_score + 5))
    fi
    
    # Metric 4: Error handling presence (10 points max)
    local error_handling=$(grep -c 'handle_error\|exit 1\|return 1\|\|\|&&' "$file_path" 2>/dev/null || echo "0")
    error_handling=$(echo "$error_handling" | head -1 | tr -d '\n')
    if [[ $error_handling -gt 3 ]]; then
        total_score=$((total_score + 10))
    elif [[ $error_handling -gt 1 ]]; then
        total_score=$((total_score + 5))
    fi
    
    # Metric 5: Security practices (10 points max)
    local dangerous_patterns=$(grep -c 'eval\|exec\|\$(\s*cat\|rm -rf /\|chmod 777' "$file_path" 2>/dev/null || echo "0")
    dangerous_patterns=$(echo "$dangerous_patterns" | head -1 | tr -d '\n')
    local safe_practices=$(grep -c 'set -e\|local \|readonly\|\[\[.*\]\]' "$file_path" 2>/dev/null || echo "0")
    safe_practices=$(echo "$safe_practices" | head -1 | tr -d '\n')
    
    if [[ $dangerous_patterns -eq 0 ]] && [[ $safe_practices -gt 2 ]]; then
        total_score=$((total_score + 10))
    elif [[ $dangerous_patterns -eq 0 ]]; then
        total_score=$((total_score + 5))
    fi
    
    # Metric 6: Structure and organization (15 points max)
    local has_shebang=$(grep -c '^#!/bin/bash' "$file_path" 2>/dev/null || echo "0")
    has_shebang=$(echo "$has_shebang" | head -1 | tr -d '\n')
    local has_set_flags=$(grep -c '^set -e' "$file_path" 2>/dev/null || echo "0")
    has_set_flags=$(echo "$has_set_flags" | head -1 | tr -d '\n')
    local logical_sections=$(grep -c '^[[:space:]]*#.*:$' "$file_path" 2>/dev/null || echo "0")
    logical_sections=$(echo "$logical_sections" | head -1 | tr -d '\n')
    
    local structure_score=0
    [[ $has_shebang -gt 0 ]] && structure_score=$((structure_score + 5))
    [[ $has_set_flags -gt 0 ]] && structure_score=$((structure_score + 5))
    [[ $logical_sections -gt 2 ]] && structure_score=$((structure_score + 5))
    
    total_score=$((total_score + structure_score))
    
    # Metric 7: Bash best practices (15 points max)
    local quoted_variables=$(grep -c '\"\$[a-zA-Z_]' "$file_path" 2>/dev/null || echo "0")
    quoted_variables=$(echo "$quoted_variables" | head -1 | tr -d '\n')
    local local_variables=$(grep -c 'local [a-zA-Z_]' "$file_path" 2>/dev/null || echo "0")
    local_variables=$(echo "$local_variables" | head -1 | tr -d '\n')
    local conditional_style=$(grep -c '\[\[.*\]\]' "$file_path" 2>/dev/null || echo "0")
    conditional_style=$(echo "$conditional_style" | head -1 | tr -d '\n')
    
    local practices_score=0
    [[ $quoted_variables -gt 3 ]] && practices_score=$((practices_score + 5))
    [[ $local_variables -gt 2 ]] && practices_score=$((practices_score + 5))
    [[ $conditional_style -gt 1 ]] && practices_score=$((practices_score + 5))
    
    total_score=$((total_score + practices_score))
    
    # Metric 8: Readability factors (10 points max)
    local long_lines=$(awk 'length > 120' "$file_path" 2>/dev/null | wc -l || echo "0")
    local complex_expressions=$(grep -c '|.*|.*|' "$file_path" 2>/dev/null || echo "0")
    long_lines=$(echo "$long_lines" | tr -d '\n')
    complex_expressions=$(echo "$complex_expressions" | tr -d '\n')
    
    if [[ $long_lines -eq 0 ]] && [[ $complex_expressions -le 2 ]]; then
        total_score=$((total_score + 10))
    elif [[ $long_lines -le 3 ]]; then
        total_score=$((total_score + 5))
    fi
    
    echo $total_score
}

# Generate detailed scoring report
generate_scoring_report() {
    local file_path="$1"
    local score="$2"
    
    echo "📊 Claude Readability Score Report for: $(basename "$file_path")"
    echo "=================================================="
    echo "Overall Score: $score/100"
    
    if [[ $score -ge 90 ]]; then
        echo "Grade: A+ (Excellent Claude comprehension)"
    elif [[ $score -ge 80 ]]; then
        echo "Grade: A (Very good Claude comprehension)"
    elif [[ $score -ge 70 ]]; then
        echo "Grade: B (Good Claude comprehension)"
    elif [[ $score -ge 60 ]]; then
        echo "Grade: C (Acceptable Claude comprehension)"
    else
        echo "Grade: D (Needs improvement for Claude comprehension)"
    fi
    
    echo ""
    echo "Detailed Metrics:"
    
    # Line count analysis
    local non_empty_lines=$(grep -v '^[[:space:]]*$' "$file_path" | wc -l)
    echo "• Line Count: $non_empty_lines lines (Target: ≤50)"
    
    # Function analysis
    local function_count=$(grep -c '^[[:space:]]*[a-zA-Z_][a-zA-Z0-9_]*[[:space:]]*()' "$file_path" 2>/dev/null || echo "0")
    echo "• Functions: $function_count defined"
    
    # Comment analysis
    local triple_explanation=$(grep -c '^# Technical:\|^# Simple:\|^# Connection:' "$file_path" 2>/dev/null || echo "0")
    if [[ $triple_explanation -eq 3 ]]; then
        echo "• Triple Explanation: ✅ Complete"
    else
        echo "• Triple Explanation: ❌ Missing (found $triple_explanation/3)"
    fi
    
    # Security analysis
    local dangerous_patterns=$(grep -c 'eval\|exec\|\$(\s*cat\|rm -rf /\|chmod 777' "$file_path" 2>/dev/null || echo "0")
    dangerous_patterns=$(echo "$dangerous_patterns" | tr -d '\n' | head -1)
    if [[ $dangerous_patterns -eq 0 ]]; then
        echo "• Security: ✅ No dangerous patterns"
    else
        echo "• Security: ⚠️  $dangerous_patterns dangerous pattern(s) found"
    fi
    
    echo ""
}

# Score all patterns in the repository
score_all_patterns() {
    local patterns_dir="${1:-./patterns}"
    local min_score="${2:-90}"
    local failing_patterns=()
    local total_patterns=0
    local passing_patterns=0
    
    echo "🎯 Scoring all Claude Code Builder patterns..."
    echo "Minimum required score: $min_score/100"
    echo ""
    
    # Find all pattern files
    while IFS= read -r -d '' pattern_file; do
        if [[ -f "$pattern_file" && "$pattern_file" =~ \.sh$ ]]; then
            total_patterns=$((total_patterns + 1))
            
            local score=$(calculate_readability_score "$pattern_file")
            local relative_path=$(echo "$pattern_file" | sed "s|^$patterns_dir/||")
            
            if [[ $score -ge $min_score ]]; then
                echo "✅ $relative_path: $score/100"
                passing_patterns=$((passing_patterns + 1))
            else
                echo "❌ $relative_path: $score/100 (BELOW THRESHOLD)"
                failing_patterns+=("$pattern_file")
            fi
        fi
    done < <(find "$patterns_dir" -name "*.sh" -print0 2>/dev/null)
    
    echo ""
    echo "📈 Summary:"
    echo "Total patterns: $total_patterns"
    echo "Passing ($min_score+): $passing_patterns"
    echo "Failing: $((total_patterns - passing_patterns))"
    
    if [[ ${#failing_patterns[@]} -gt 0 ]]; then
        echo ""
        echo "❌ Patterns requiring improvement:"
        for pattern in "${failing_patterns[@]}"; do
            echo "• $pattern"
            generate_scoring_report "$pattern" "$(calculate_readability_score "$pattern")"
            echo ""
        done
        return 1
    else
        echo ""
        echo "🎉 All patterns meet Claude readability standards!"
        return 0
    fi
}

# Main function
main() {
    case "${1:-score-all}" in
        score-all)
            score_all_patterns "${2:-./patterns}" "${3:-90}"
            ;;
        score-file)
            local file_path="$2"
            if [[ -z "$file_path" ]]; then
                echo "Usage: $0 score-file <file_path>"
                exit 1
            fi
            local score=$(calculate_readability_score "$file_path")
            generate_scoring_report "$file_path" "$score"
            ;;
        help)
            echo "Claude Readability Scorer - Validate patterns for AI comprehension"
            echo ""
            echo "Usage:"
            echo "  $0 score-all [patterns_dir] [min_score]  # Score all patterns (default: ./patterns, 90)"
            echo "  $0 score-file <file_path>                # Score specific file"
            echo "  $0 help                                  # Show this help"
            echo ""
            echo "Examples:"
            echo "  $0 score-all                            # Score all patterns with default threshold"
            echo "  $0 score-all ./patterns 95              # Score all patterns with 95% threshold"
            echo "  $0 score-file pattern.sh                # Score specific pattern file"
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