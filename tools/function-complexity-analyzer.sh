#!/bin/bash
# Technical: Function complexity analysis with cyclomatic complexity estimation
# Simple: Analyzer that measures how complicated your functions are
# Connection: Teaches complexity management essential for readable code

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
            
            # Find function end (next function or end of file)
            next_func_line=$(grep -n "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$file" | awk -v start="$func_line" 'NR>1 && $1 > start {print $1; exit}')
            end_line=${next_func_line:-$(wc -l < "$file")}
            
            # Calculate basic complexity metrics
            func_lines=$((end_line - func_line))
            branches=$(sed -n "${func_line},${end_line}p" "$file" | grep -c "if\|elif\|case\|&&\|\|\|for\|while" || echo 0)
            nesting=$(sed -n "${func_line},${end_line}p" "$file" | grep -o "{" | wc -l || echo 0)
            
            # Complexity scoring (basic heuristic)
            complexity=$((func_lines / 10 + branches + nesting / 2))
            
            if [ "$complexity" -gt 8 ]; then
                echo "⚠️  $func_name: High complexity ($complexity points)"
                ((complex_functions++))
            elif [ "$complexity" -gt 5 ]; then
                echo "📝 $func_name: Medium complexity ($complexity points)"
            else
                echo "✅ $func_name: Low complexity ($complexity points)"
            fi
        done 2>/dev/null
    done
    
    echo "📈 Complexity Analysis Summary:"
    echo "   Total functions analyzed: $total_functions"
    echo "   High complexity functions: $complex_functions"
    
    if [ "$complex_functions" -eq 0 ]; then
        echo "🎉 All functions have manageable complexity!"
    else
        echo "💡 Consider refactoring high-complexity functions"
    fi
    
    return 0
}

# Run analysis
analyze_complexity