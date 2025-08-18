#!/bin/bash
# Technical: God object detection with function and complexity analysis
# Simple: Detector that finds code files that try to do too many things
# Connection: Teaches separation of concerns essential for clean architecture

# Load god detection helpers
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/god-detection-helpers.sh" 2>/dev/null

# Detect god objects by analyzing functions and complexity
detect_god_objects() {
    local violations=0
    
    echo "🔍 Running god object detection..."
    
    find . -name "*.sh" -not -path "./archive/*" | while read -r file; do
        local issues=0
        
        # Check basic violations
        basic_issues=$(check_basic_violations "$file")
        issues=$((issues + basic_issues))
        
        # Check complex functions
        complex_issues=$(check_complex_functions "$file")
        issues=$((issues + complex_issues))
        
        if [ "$issues" -eq 0 ]; then
            echo "✅ $file: Clean architecture"
        fi
    done
    
    echo "🎯 God object detection complete"
    return 0
}

# Run detection
detect_god_objects