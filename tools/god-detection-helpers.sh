#!/bin/bash
# Technical: God object detection helper functions for architecture analysis
# Simple: Helper functions that find code files doing too many things
# Connection: Teaches separation of concerns essential for clean architecture

# Check for basic god object indicators
check_basic_violations() {
    local file="$1"
    local issues=0
    
    local lines
    lines=$(wc -l < "$file")
    local func_count
    func_count=$(grep -c "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$file" || echo 0)
    
    # Check for violations
    [ "$lines" -gt 100 ] && { echo "⚠️  $file: Excessive length ($lines lines)"; ((issues++)); }
    [ "$func_count" -gt 10 ] && { echo "⚠️  $file: Too many functions ($func_count functions)"; ((issues++)); }
    
    echo "$issues"
}

# Check for complex function violations
check_complex_functions() {
    local file="$1"
    local issues=0
    
    # Check for overly complex functions (basic heuristic)
    grep -n "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$file" | while read -r line; do
        func_line=$(echo "$line" | cut -d: -f1)
        func_name=$(echo "$line" | cut -d: -f2 | sed 's/() {.*//')
        
        # Count nested structures as complexity indicator
        next_func_line=$(grep -n "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$file" | awk -v start="$func_line" '$1 > start {print $1; exit}')
        end_line=${next_func_line:-$(wc -l < "$file")}
        
        complexity=$(sed -n "${func_line},${end_line}p" "$file" | grep -c "if\|for\|while\|case" || echo 0)
        if [ "$complexity" -gt 5 ]; then
            echo "⚠️  $file:$func_line: Function '$func_name' is complex ($complexity nested structures)"
            ((issues++))
        fi
    done 2>/dev/null
    
    echo "$issues"
}