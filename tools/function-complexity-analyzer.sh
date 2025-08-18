#!/bin/bash
# Technical: Function complexity analysis with cyclomatic complexity estimation
# Simple: Analyzer that measures how complicated your functions are
# Connection: Teaches complexity management essential for readable code

# Load complexity helpers
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/complexity-helpers.sh" 2>/dev/null

# Analyze function complexity across project
analyze_complexity() {
    local total_functions=0
    local complex_functions=0
    
    echo "📊 Running function complexity analysis..."
    
    find . -name "*.sh" -not -path "./archive/*" | while read -r file; do
        echo "Analyzing: $file"
        
        # Extract function names and analyze each
        grep -n "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$file" | while read -r line; do
            ((total_functions++))
            func_line=$(echo "$line" | cut -d: -f1)
            func_name=$(echo "$line" | cut -d: -f2 | sed 's/() {.*//')
            
            # Find function boundaries and calculate complexity
            end_line=$(find_next_function "$file" "$func_line")
            complexity=$(calculate_complexity "$func_line" "$end_line" "$file")
            
            # Report complexity level
            if ! report_complexity "$func_name" "$complexity"; then
                ((complex_functions++))
            fi
        done 2>/dev/null
    done
    
    echo "📈 Summary: $total_functions functions, $complex_functions high complexity"
    [ "$complex_functions" -eq 0 ] && echo "🎉 All functions manageable!" || echo "💡 Consider refactoring"
    return 0
}

# Run analysis
analyze_complexity