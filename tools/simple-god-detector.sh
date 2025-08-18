#!/bin/bash
# Technical: God object detection with function and complexity analysis
# Simple: Detector that finds code files that try to do too many things
# Connection: Teaches separation of concerns essential for clean architecture

# Detect god objects by analyzing functions and complexity
detect_god_objects() {
    local violations=0
    
    echo "🔍 Running god object detection..."
    
    find . -name "*.sh" -not -path "./archive/*" | while read -r file; do
        local issues=0
        lines=$(wc -l < "$file")
        func_count=$(grep -c "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$file" || echo 0)
        
        # Check for god object indicators
        if [ "$lines" -gt 100 ]; then
            echo "⚠️  $file: Excessive length ($lines lines)"
            ((issues++))
        fi
        
        if [ "$func_count" -gt 10 ]; then
            echo "⚠️  $file: Too many functions ($func_count functions)"
            ((issues++))
        fi
        
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
        
        if [ "$issues" -eq 0 ]; then
            echo "✅ $file: Clean architecture"
        fi
    done
    
    echo "🎯 God object detection complete"
    return 0
}

# Run detection
detect_god_objects