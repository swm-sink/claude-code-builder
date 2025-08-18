#!/bin/bash
# Technical: Complexity analysis helper functions for code quality assessment
# Simple: Helper functions that measure how complicated your functions are
# Connection: Teaches complexity measurement essential for maintainable code

# Calculate complexity score for a function
calculate_complexity() {
    local func_line="$1"
    local end_line="$2"
    local file="$3"
    
    local func_lines=$((end_line - func_line))
    local branches=$(sed -n "${func_line},${end_line}p" "$file" | grep -c "if\|elif\|case\|&&\|\|\|for\|while" || echo 0)
    local nesting=$(sed -n "${func_line},${end_line}p" "$file" | grep -o "{" | wc -l || echo 0)
    
    # Complexity scoring (basic heuristic)
    echo $((func_lines / 10 + branches + nesting / 2))
}

# Report complexity level for a function
report_complexity() {
    local func_name="$1"
    local complexity="$2"
    
    if [ "$complexity" -gt 8 ]; then
        echo "⚠️  $func_name: High complexity ($complexity points)"
        return 1
    elif [ "$complexity" -gt 5 ]; then
        echo "📝 $func_name: Medium complexity ($complexity points)"
        return 0
    else
        echo "✅ $func_name: Low complexity ($complexity points)"
        return 0
    fi
}

# Find next function line in file
find_next_function() {
    local file="$1"
    local start_line="$2"
    
    local next_func_line
    next_func_line=$(grep -n "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$file" | awk -v start="$start_line" 'NR>1 && $1 > start {print $1; exit}')
    echo "${next_func_line:-$(wc -l < "$file")}"
}