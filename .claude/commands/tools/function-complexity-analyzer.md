---
allowed-tools: Read, Write, Bash(find:*), Bash(grep:*), Bash(wc:*), Bash(awk:*), Bash(sed:*), Bash(head:*), Bash(tail:*), Bash(sort:*), Bash(uniq:*), Bash(cut:*), Bash(tr:*), Bash(file:*), Bash(stat:*), Bash(cloc:*), Bash(sloccount:*), Bash(tokei:*), Bash(jq:*), Bash(yq:*), Bash(python3:*), Bash(node:*), Bash(go:*), Bash(rust:*), Bash(java:*), Bash(dotnet:*), Bash(ruby:*), Bash(php:*)
argument-hint: [analysis-mode] or [file-path] or [threshold]
description: Advanced function complexity analysis with cyclomatic complexity calculation, cognitive complexity assessment, maintainability index computation, and comprehensive refactoring recommendations across multiple programming languages
---

# Function Complexity Analyzer Native Command

```bash
#!/bin/bash

# Parse arguments from $ARGUMENTS  
IFS=' ' read -ra ARGS <<< "$ARGUMENTS"
analysis_mode="${ARGS[0]:-analyze-file}"
target_path="${ARGS[1]:-.}"
complexity_threshold="${ARGS[2]:-10}"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Advanced complexity analysis configuration
declare -A COMPLEXITY_WEIGHTS=(
    ["cyclomatic"]=30       # McCabe cyclomatic complexity (30% weight)
    ["cognitive"]=25        # Cognitive complexity (25% weight)
    ["halstead"]=15         # Halstead complexity metrics (15% weight)
    ["nesting"]=10          # Nesting depth (10% weight)
    ["lines"]=10            # Lines of code (10% weight)
    ["parameters"]=5        # Parameter count (5% weight)
    ["dependencies"]=5      # Dependency complexity (5% weight)
)

# Language-specific complexity detection patterns
declare -A LANGUAGE_PATTERNS=(
    ["bash"]="^[a-zA-Z_][a-zA-Z0-9_]*\(\) \{|^function [a-zA-Z_][a-zA-Z0-9_]*"
    ["python"]="^def [a-zA-Z_][a-zA-Z0-9_]*\(|^async def [a-zA-Z_][a-zA-Z0-9_]*\("
    ["javascript"]="function [a-zA-Z_][a-zA-Z0-9_]*\(|const [a-zA-Z_][a-zA-Z0-9_]* = \(|[a-zA-Z_][a-zA-Z0-9_]*: function\(|[a-zA-Z_][a-zA-Z0-9_]*\([^)]*\) \{"
    ["typescript"]="function [a-zA-Z_][a-zA-Z0-9_]*\(|const [a-zA-Z_][a-zA-Z0-9_]* = \(|[a-zA-Z_][a-zA-Z0-9_]*: function\(|[a-zA-Z_][a-zA-Z0-9_]*\([^)]*\): [^ ]* \{"
    ["go"]="^func [a-zA-Z_][a-zA-Z0-9_]*\(|^func \([^)]*\) [a-zA-Z_][a-zA-Z0-9_]*\("
    ["rust"]="^fn [a-zA-Z_][a-zA-Z0-9_]*\(|^pub fn [a-zA-Z_][a-zA-Z0-9_]*\(|^async fn [a-zA-Z_][a-zA-Z0-9_]*\("
    ["java"]="(public|private|protected|static|final|abstract|synchronized|native) .* [a-zA-Z_][a-zA-Z0-9_]*\("
    ["cpp"]="[a-zA-Z_][a-zA-Z0-9_]* [a-zA-Z_][a-zA-Z0-9_]*\([^)]*\) \{|[a-zA-Z_][a-zA-Z0-9_]*::[a-zA-Z_][a-zA-Z0-9_]*\([^)]*\) \{"
    ["c"]="[a-zA-Z_][a-zA-Z0-9_]* [a-zA-Z_][a-zA-Z0-9_]*\([^)]*\) \{"
    ["php"]="function [a-zA-Z_][a-zA-Z0-9_]*\(|(public|private|protected|static|final|abstract) function [a-zA-Z_][a-zA-Z0-9_]*\("
    ["ruby"]="^def [a-zA-Z_][a-zA-Z0-9_?!]*|^class [A-Z][a-zA-Z0-9_]*"
    ["csharp"]="(public|private|protected|internal|static|virtual|override|abstract|sealed|async) .* [a-zA-Z_][a-zA-Z0-9_]*\("
)

# Control flow complexity patterns for different languages
declare -A CONTROL_FLOW_PATTERNS=(
    ["bash"]="if |elif |else|case |for |while |until |&&|\|\||function "
    ["python"]="if |elif |else:|for |while |try:|except:|finally:|with |and |or |lambda |def |async def |yield |await "
    ["javascript"]="if\(|else if\(|else|switch\(|case |for\(|while\(|do\{|&&|\|\||function |async |await |\.then\(|\.catch\(|try\{|catch\("
    ["typescript"]="if\(|else if\(|else|switch\(|case |for\(|while\(|do\{|&&|\|\||function |async |await |\.then\(|\.catch\(|try\{|catch\("
    ["go"]="if |else if |else|switch |case |for |select |go |defer |&&|\|\||func "
    ["rust"]="if |else if |else|match |for |while |loop |&&|\|\||fn |async |await |unwrap\(|expect\("
    ["java"]="if\(|else if\(|else|switch\(|case |for\(|while\(|do\{|&&|\|\||try\{|catch\(|finally\{|synchronized\("
    ["cpp"]="if\(|else if\(|else|switch\(|case |for\(|while\(|do\{|&&|\|\||try\{|catch\(|throw "
    ["c"]="if\(|else if\(|else|switch\(|case |for\(|while\(|do\{|&&|\|\||goto "
)

# Calculate cyclomatic complexity for a function
calculate_cyclomatic_complexity() {
    local file_path="$1"
    local start_line="$2"
    local end_line="$3"
    local language="$4"
    
    # Extract function content
    local function_content
    function_content=$(sed -n "${start_line},${end_line}p" "$file_path" 2>/dev/null)
    
    # Get control flow pattern for language
    local pattern="${CONTROL_FLOW_PATTERNS[$language]:-${CONTROL_FLOW_PATTERNS[bash]}}"
    
    # Count decision points (each adds 1 to complexity)
    local decision_points=0
    while IFS= read -r line; do
        # Count occurrences of control flow keywords
        local matches=$(echo "$line" | grep -oE "$pattern" | wc -l)
        decision_points=$((decision_points + matches))
    done <<< "$function_content"
    
    # Cyclomatic complexity = decision points + 1
    echo $((decision_points + 1))
}

# Calculate cognitive complexity (more sophisticated than cyclomatic)
calculate_cognitive_complexity() {
    local file_path="$1"
    local start_line="$2"
    local end_line="$3"
    local language="$4"
    
    local cognitive_score=0
    local nesting_level=0
    local function_content
    function_content=$(sed -n "${start_line},${end_line}p" "$file_path" 2>/dev/null)
    
    while IFS= read -r line; do
        # Count opening braces/indentation for nesting
        local opens=$(echo "$line" | grep -o "{" | wc -l)
        local closes=$(echo "$line" | grep -o "}" | wc -l)
        
        # Check for control flow structures
        if echo "$line" | grep -qE "if |for |while |switch |case "; then
            # Add base complexity + nesting penalty
            cognitive_score=$((cognitive_score + 1 + nesting_level))
        fi
        
        # Update nesting level
        nesting_level=$((nesting_level + opens - closes))
        [ $nesting_level -lt 0 ] && nesting_level=0
        
        # Additional complexity for logical operators
        local logical_ops=$(echo "$line" | grep -o "&&\|\|\|" | wc -l)
        cognitive_score=$((cognitive_score + logical_ops))
        
        # Penalty for recursion
        if echo "$line" | grep -q "$(basename "$file_path" | cut -d. -f1)"; then
            cognitive_score=$((cognitive_score + 3))
        fi
    done <<< "$function_content"
    
    echo "$cognitive_score"
}

# Calculate Halstead complexity metrics
calculate_halstead_complexity() {
    local file_path="$1"
    local start_line="$2"
    local end_line="$3"
    
    local function_content
    function_content=$(sed -n "${start_line},${end_line}p" "$file_path" 2>/dev/null)
    
    # Count unique operators and operands (simplified)
    local unique_operators=$(echo "$function_content" | grep -oE '[\+\-\*/=%<>!&|^~]|<<|>>|&&|\|\||==|!=|<=|>=' | sort -u | wc -l)
    local unique_operands=$(echo "$function_content" | grep -oE '\b[a-zA-Z_][a-zA-Z0-9_]*\b|[0-9]+' | sort -u | wc -l)
    local total_operators=$(echo "$function_content" | grep -oE '[\+\-\*/=%<>!&|^~]|<<|>>|&&|\|\||==|!=|<=|>=' | wc -l)
    local total_operands=$(echo "$function_content" | grep -oE '\b[a-zA-Z_][a-zA-Z0-9_]*\b|[0-9]+' | wc -l)
    
    # Calculate Halstead metrics
    local n1=$unique_operators
    local n2=$unique_operands
    local N1=$total_operators
    local N2=$total_operands
    local n=$((n1 + n2))
    local N=$((N1 + N2))
    
    # Volume = N * log2(n)
    local volume=0
    if [ $n -gt 0 ]; then
        # Approximate log2 calculation
        volume=$((N * ($(echo "l($n)/l(2)" | bc -l | cut -d. -f1) + 1)))
    fi
    
    # Difficulty = (n1 / 2) * (N2 / n2)
    local difficulty=0
    if [ $n2 -gt 0 ]; then
        difficulty=$(((n1 * N2) / (2 * n2)))
    fi
    
    # Effort = Volume * Difficulty
    local effort=$((volume * difficulty / 100))
    
    # Return normalized complexity score (0-100 scale)
    [ $effort -gt 100 ] && effort=100
    echo "$effort"
}

# Calculate maintainability index
calculate_maintainability_index() {
    local cyclomatic="$1"
    local halstead_volume="$2"
    local lines_of_code="$3"
    local comment_percentage="$4"
    
    # Microsoft's Maintainability Index formula (simplified)
    # MI = 171 - 5.2 * ln(HV) - 0.23 * CC - 16.2 * ln(LOC) + 50 * sin(sqrt(2.4 * CM))
    
    local mi=171
    
    # Halstead Volume component
    if [ "$halstead_volume" -gt 0 ]; then
        local hv_component=$(echo "5.2 * l($halstead_volume)" | bc -l | cut -d. -f1)
        mi=$((mi - hv_component))
    fi
    
    # Cyclomatic Complexity component
    mi=$((mi - (cyclomatic * 23 / 100)))
    
    # Lines of Code component
    if [ "$lines_of_code" -gt 0 ]; then
        local loc_component=$(echo "16.2 * l($lines_of_code)" | bc -l | cut -d. -f1)
        mi=$((mi - loc_component))
    fi
    
    # Comment component (bonus for good documentation)
    mi=$((mi + comment_percentage / 2))
    
    # Normalize to 0-100 scale
    [ $mi -lt 0 ] && mi=0
    [ $mi -gt 100 ] && mi=100
    
    echo "$mi"
}

# Detect programming language from file extension
detect_language() {
    local file_path="$1"
    local extension="${file_path##*.}"
    
    case "$extension" in
        "sh"|"bash") echo "bash" ;;
        "py") echo "python" ;;
        "js"|"mjs") echo "javascript" ;;
        "ts"|"tsx") echo "typescript" ;;
        "go") echo "go" ;;
        "rs") echo "rust" ;;
        "java") echo "java" ;;
        "cpp"|"cc"|"cxx") echo "cpp" ;;
        "c"|"h") echo "c" ;;
        "php") echo "php" ;;
        "rb") echo "ruby" ;;
        "cs") echo "csharp" ;;
        *) 
            # Try to detect from shebang
            local first_line=$(head -1 "$file_path" 2>/dev/null)
            if echo "$first_line" | grep -q "#!/.*bash\|#!/.*sh"; then
                echo "bash"
            elif echo "$first_line" | grep -q "#!/.*python"; then
                echo "python"
            elif echo "$first_line" | grep -q "#!/.*node\|#!/.*deno"; then
                echo "javascript"
            elif echo "$first_line" | grep -q "#!/.*ruby"; then
                echo "ruby"
            else
                echo "unknown"
            fi
            ;;
    esac
}

# Analyze single file complexity
analyze_file_complexity() {
    local file_path="$1"
    local threshold="${2:-10}"
    
    if [ ! -f "$file_path" ]; then
        echo -e "${RED}❌ Error: File not found: $file_path${NC}"
        return 1
    fi
    
    local language=$(detect_language "$file_path")
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}📊 Function Complexity Analysis Report${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}📁 File:${NC} $file_path"
    echo -e "${BLUE}🔤 Language:${NC} $language"
    echo -e "${BLUE}🎯 Complexity Threshold:${NC} $threshold"
    echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
    
    local pattern="${LANGUAGE_PATTERNS[$language]:-${LANGUAGE_PATTERNS[bash]}}"
    local total_functions=0
    local complex_functions=0
    local total_complexity=0
    local highest_complexity=0
    local highest_complexity_function=""
    
    # Find all functions in the file
    while IFS=: read -r line_num function_line; do
        ((total_functions++))
        
        # Extract function name
        local func_name=$(echo "$function_line" | sed -E 's/^(async |pub |private |public |protected |static |final |abstract |synchronized |native |virtual |override |sealed )*//g' | sed -E 's/(function |def |fn |func )//' | sed -E 's/\(.*//g' | sed 's/:.*//' | tr -d ' ')
        
        # Find function end (simplified - looks for next function or end of file)
        local next_func_line=$(grep -nE "$pattern" "$file_path" | grep -A1 "^$line_num:" | tail -1 | cut -d: -f1)
        local end_line
        if [ "$next_func_line" != "$line_num" ] && [ -n "$next_func_line" ]; then
            end_line=$((next_func_line - 1))
        else
            end_line=$(wc -l < "$file_path")
        fi
        
        # Calculate various complexity metrics
        local cyclomatic=$(calculate_cyclomatic_complexity "$file_path" "$line_num" "$end_line" "$language")
        local cognitive=$(calculate_cognitive_complexity "$file_path" "$line_num" "$end_line" "$language")
        local halstead=$(calculate_halstead_complexity "$file_path" "$line_num" "$end_line")
        
        # Calculate additional metrics
        local lines=$((end_line - line_num + 1))
        local nesting_depth=$(sed -n "${line_num},${end_line}p" "$file_path" | grep -o "{" | wc -l)
        local parameters=$(echo "$function_line" | tr ',' '\n' | wc -l)
        
        # Calculate weighted complexity score
        local weighted_score=$(( 
            (cyclomatic * ${COMPLEXITY_WEIGHTS[cyclomatic]} / 100) +
            (cognitive * ${COMPLEXITY_WEIGHTS[cognitive]} / 100) +
            (halstead * ${COMPLEXITY_WEIGHTS[halstead]} / 100) +
            (nesting_depth * ${COMPLEXITY_WEIGHTS[nesting]} / 100) +
            ((lines / 10) * ${COMPLEXITY_WEIGHTS[lines]} / 100) +
            (parameters * ${COMPLEXITY_WEIGHTS[parameters]} / 100)
        ))
        
        total_complexity=$((total_complexity + weighted_score))
        
        # Track highest complexity
        if [ $weighted_score -gt $highest_complexity ]; then
            highest_complexity=$weighted_score
            highest_complexity_function="$func_name"
        fi
        
        # Display function analysis
        echo -e "\n${PURPLE}Function:${NC} $func_name (line $line_num)"
        echo -e "  ${BLUE}├─ Cyclomatic Complexity:${NC} $cyclomatic"
        echo -e "  ${BLUE}├─ Cognitive Complexity:${NC} $cognitive"
        echo -e "  ${BLUE}├─ Halstead Complexity:${NC} $halstead"
        echo -e "  ${BLUE}├─ Lines of Code:${NC} $lines"
        echo -e "  ${BLUE}├─ Nesting Depth:${NC} $nesting_depth"
        echo -e "  ${BLUE}├─ Parameters:${NC} $parameters"
        echo -e "  ${BLUE}└─ Overall Score:${NC} $weighted_score"
        
        # Complexity assessment
        if [ $weighted_score -gt $threshold ]; then
            echo -e "  ${RED}⚠️  HIGH COMPLEXITY - Refactoring recommended${NC}"
            ((complex_functions++))
            
            # Provide refactoring suggestions
            echo -e "  ${YELLOW}💡 Refactoring Suggestions:${NC}"
            
            if [ $cyclomatic -gt 10 ]; then
                echo -e "    • Reduce conditional complexity - extract conditions to functions"
            fi
            
            if [ $cognitive -gt 15 ]; then
                echo -e "    • Simplify control flow - reduce nested conditions"
            fi
            
            if [ $lines -gt 50 ]; then
                echo -e "    • Extract sub-functions - function is too long"
            fi
            
            if [ $nesting_depth -gt 4 ]; then
                echo -e "    • Flatten nesting - use early returns or extract methods"
            fi
            
            if [ $parameters -gt 5 ]; then
                echo -e "    • Reduce parameters - use objects or configuration patterns"
            fi
        elif [ $weighted_score -gt $((threshold * 75 / 100)) ]; then
            echo -e "  ${YELLOW}📝 MEDIUM COMPLEXITY - Monitor for changes${NC}"
        else
            echo -e "  ${GREEN}✅ LOW COMPLEXITY - Well-structured${NC}"
        fi
    done < <(grep -nE "$pattern" "$file_path" 2>/dev/null)
    
    # Calculate file-level metrics
    local average_complexity=0
    if [ $total_functions -gt 0 ]; then
        average_complexity=$((total_complexity / total_functions))
    fi
    
    # Summary section
    echo -e "\n${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}📈 Analysis Summary${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}Total Functions:${NC} $total_functions"
    echo -e "${BLUE}Complex Functions:${NC} $complex_functions"
    echo -e "${BLUE}Average Complexity:${NC} $average_complexity"
    echo -e "${BLUE}Highest Complexity:${NC} $highest_complexity_function ($highest_complexity)"
    
    # Overall assessment
    echo -e "\n${WHITE}🎯 Overall Assessment:${NC}"
    if [ $complex_functions -eq 0 ]; then
        echo -e "${GREEN}🎉 EXCELLENT - All functions have manageable complexity${NC}"
        return 0
    elif [ $complex_functions -le $((total_functions / 4)) ]; then
        echo -e "${YELLOW}📝 GOOD - Most functions are well-structured${NC}"
        return 1
    elif [ $complex_functions -le $((total_functions / 2)) ]; then
        echo -e "${YELLOW}⚠️  FAIR - Several functions need refactoring${NC}"
        return 2
    else
        echo -e "${RED}❌ POOR - Significant refactoring needed${NC}"
        return 3
    fi
}

# Analyze entire project complexity
analyze_project_complexity() {
    local project_path="${1:-.}"
    local threshold="${2:-10}"
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}🏗️  Project-Wide Complexity Analysis${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}📁 Project Path:${NC} $project_path"
    echo -e "${BLUE}🎯 Complexity Threshold:${NC} $threshold"
    echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
    
    local total_files=0
    local total_functions=0
    local complex_functions=0
    local files_with_complexity=0
    
    # Analyze each supported file type
    for ext in sh py js ts go rs java cpp c php rb cs; do
        while IFS= read -r file; do
            ((total_files++))
            echo -e "\n${BLUE}Analyzing:${NC} $file"
            
            local language=$(detect_language "$file")
            local pattern="${LANGUAGE_PATTERNS[$language]:-${LANGUAGE_PATTERNS[bash]}}"
            local file_has_complexity=false
            
            # Count functions in this file
            while IFS=: read -r line_num function_line; do
                ((total_functions++))
                
                # Similar analysis as single file but summarized
                local next_func_line=$(grep -nE "$pattern" "$file" | grep -A1 "^$line_num:" | tail -1 | cut -d: -f1)
                local end_line
                if [ "$next_func_line" != "$line_num" ] && [ -n "$next_func_line" ]; then
                    end_line=$((next_func_line - 1))
                else
                    end_line=$(wc -l < "$file")
                fi
                
                local cyclomatic=$(calculate_cyclomatic_complexity "$file" "$line_num" "$end_line" "$language")
                
                if [ $cyclomatic -gt $threshold ]; then
                    ((complex_functions++))
                    file_has_complexity=true
                    local func_name=$(echo "$function_line" | sed -E 's/^(async |pub |private |public |protected |static |final |abstract |synchronized |native |virtual |override |sealed )*//g' | sed -E 's/(function |def |fn |func )//' | sed -E 's/\(.*//g' | tr -d ' ')
                    echo -e "  ${YELLOW}⚠️  Complex function: $func_name (complexity: $cyclomatic)${NC}"
                fi
            done < <(grep -nE "$pattern" "$file" 2>/dev/null)
            
            [ "$file_has_complexity" = true ] && ((files_with_complexity++))
        done < <(find "$project_path" -type f -name "*.$ext" -not -path "*/node_modules/*" -not -path "*/.git/*" -not -path "*/vendor/*" -not -path "*/target/*" -not -path "*/build/*" -not -path "*/dist/*" 2>/dev/null)
    done
    
    # Project summary
    echo -e "\n${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}📊 Project Complexity Summary${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}Total Files Analyzed:${NC} $total_files"
    echo -e "${BLUE}Total Functions:${NC} $total_functions"
    echo -e "${BLUE}Complex Functions:${NC} $complex_functions"
    echo -e "${BLUE}Files with Complexity Issues:${NC} $files_with_complexity"
    
    # Calculate complexity percentage
    local complexity_percentage=0
    if [ $total_functions -gt 0 ]; then
        complexity_percentage=$(((complex_functions * 100) / total_functions))
    fi
    
    echo -e "${BLUE}Complexity Percentage:${NC} ${complexity_percentage}%"
    
    # Project health assessment
    echo -e "\n${WHITE}🏥 Project Health Assessment:${NC}"
    if [ $complexity_percentage -le 10 ]; then
        echo -e "${GREEN}🎉 EXCELLENT - Very low complexity across the project${NC}"
        echo -e "   Project is highly maintainable and well-structured"
        return 0
    elif [ $complexity_percentage -le 25 ]; then
        echo -e "${GREEN}✅ GOOD - Manageable complexity levels${NC}"
        echo -e "   Most code is clean, with some areas for improvement"
        return 1
    elif [ $complexity_percentage -le 40 ]; then
        echo -e "${YELLOW}📝 FAIR - Moderate complexity detected${NC}"
        echo -e "   Consider refactoring complex functions to improve maintainability"
        return 2
    else
        echo -e "${RED}⚠️  POOR - High complexity levels${NC}"
        echo -e "   Significant refactoring recommended to improve code quality"
        return 3
    fi
}

# Generate detailed complexity report
generate_complexity_report() {
    local target_path="${1:-.}"
    local output_format="${2:-text}"
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}📋 Generating Complexity Report${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    
    # Collect all complexity data
    local report_data=""
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    if [ "$output_format" = "json" ]; then
        report_data='{"timestamp":"'$timestamp'","files":['
    else
        report_data="Function Complexity Report\n"
        report_data+="Generated: $timestamp\n"
        report_data+="="$(printf '%.0s' {1..60})"\n\n"
    fi
    
    # Process each file and collect metrics
    local first_file=true
    for file in $(find "$target_path" -type f \( -name "*.sh" -o -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.go" -o -name "*.rs" -o -name "*.java" -o -name "*.cpp" -o -name "*.c" \) -not -path "*/node_modules/*" -not -path "*/.git/*" 2>/dev/null); do
        
        local language=$(detect_language "$file")
        local pattern="${LANGUAGE_PATTERNS[$language]:-${LANGUAGE_PATTERNS[bash]}}"
        
        if [ "$output_format" = "json" ]; then
            [ "$first_file" = false ] && report_data+=","
            report_data+='{"file":"'$file'","language":"'$language'","functions":['
            first_file=false
        else
            report_data+="File: $file\n"
            report_data+="Language: $language\n"
            report_data+="-"$(printf '%.0s' {1..40})"\n"
        fi
        
        local first_func=true
        while IFS=: read -r line_num function_line; do
            local func_name=$(echo "$function_line" | sed -E 's/^(async |pub |private |public |protected |static |final |abstract |synchronized |native |virtual |override |sealed )*//g' | sed -E 's/(function |def |fn |func )//' | sed -E 's/\(.*//g' | tr -d ' ')
            
            # Calculate end line
            local next_func_line=$(grep -nE "$pattern" "$file" | grep -A1 "^$line_num:" | tail -1 | cut -d: -f1)
            local end_line
            if [ "$next_func_line" != "$line_num" ] && [ -n "$next_func_line" ]; then
                end_line=$((next_func_line - 1))
            else
                end_line=$(wc -l < "$file")
            fi
            
            # Calculate metrics
            local cyclomatic=$(calculate_cyclomatic_complexity "$file" "$line_num" "$end_line" "$language")
            local cognitive=$(calculate_cognitive_complexity "$file" "$line_num" "$end_line" "$language")
            local lines=$((end_line - line_num + 1))
            
            if [ "$output_format" = "json" ]; then
                [ "$first_func" = false ] && report_data+=","
                report_data+='{"name":"'$func_name'","line":'$line_num',"cyclomatic":'$cyclomatic',"cognitive":'$cognitive',"lines":'$lines'}'
                first_func=false
            else
                report_data+="  Function: $func_name (line $line_num)\n"
                report_data+="    Cyclomatic: $cyclomatic\n"
                report_data+="    Cognitive: $cognitive\n"
                report_data+="    Lines: $lines\n"
            fi
        done < <(grep -nE "$pattern" "$file" 2>/dev/null)
        
        if [ "$output_format" = "json" ]; then
            report_data+=']}'
        else
            report_data+="\n"
        fi
    done
    
    if [ "$output_format" = "json" ]; then
        report_data+=']}'
    fi
    
    # Output report
    echo -e "$report_data"
    
    # Save report to file
    local report_file="complexity-report-$(date +%Y%m%d-%H%M%S).$output_format"
    echo -e "$report_data" > "$report_file"
    echo -e "\n${GREEN}✅ Report saved to: $report_file${NC}"
}

# Identify complexity hotspots
identify_hotspots() {
    local project_path="${1:-.}"
    local top_n="${2:-10}"
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}🔥 Complexity Hotspots Analysis${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}📁 Project Path:${NC} $project_path"
    echo -e "${BLUE}🔝 Top Functions:${NC} $top_n"
    echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
    
    # Temporary file to store all function complexities
    local temp_file="/tmp/complexity_hotspots_$$.txt"
    > "$temp_file"
    
    # Collect complexity data for all functions
    for file in $(find "$project_path" -type f \( -name "*.sh" -o -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.go" -o -name "*.rs" -o -name "*.java" -o -name "*.cpp" -o -name "*.c" \) -not -path "*/node_modules/*" -not -path "*/.git/*" 2>/dev/null); do
        
        local language=$(detect_language "$file")
        local pattern="${LANGUAGE_PATTERNS[$language]:-${LANGUAGE_PATTERNS[bash]}}"
        
        while IFS=: read -r line_num function_line; do
            local func_name=$(echo "$function_line" | sed -E 's/^(async |pub |private |public |protected |static |final |abstract |synchronized |native |virtual |override |sealed )*//g' | sed -E 's/(function |def |fn |func )//' | sed -E 's/\(.*//g' | tr -d ' ')
            
            # Calculate end line
            local next_func_line=$(grep -nE "$pattern" "$file" | grep -A1 "^$line_num:" | tail -1 | cut -d: -f1)
            local end_line
            if [ "$next_func_line" != "$line_num" ] && [ -n "$next_func_line" ]; then
                end_line=$((next_func_line - 1))
            else
                end_line=$(wc -l < "$file")
            fi
            
            # Calculate complexity
            local cyclomatic=$(calculate_cyclomatic_complexity "$file" "$line_num" "$end_line" "$language")
            
            # Store in temp file
            echo "$cyclomatic|$func_name|$file:$line_num" >> "$temp_file"
        done < <(grep -nE "$pattern" "$file" 2>/dev/null)
    done
    
    # Sort and display top hotspots
    echo -e "\n${WHITE}🔥 Top $top_n Complexity Hotspots:${NC}"
    echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
    
    local rank=1
    while IFS='|' read -r complexity func_name location; do
        # Determine severity color
        local color="$GREEN"
        local emoji="✅"
        if [ "$complexity" -gt 20 ]; then
            color="$RED"
            emoji="🔴"
        elif [ "$complexity" -gt 15 ]; then
            color="$YELLOW"
            emoji="🟡"
        elif [ "$complexity" -gt 10 ]; then
            color="$YELLOW"
            emoji="🟠"
        fi
        
        echo -e "${WHITE}#$rank${NC} ${color}$emoji Complexity: $complexity${NC}"
        echo -e "   ${PURPLE}Function:${NC} $func_name"
        echo -e "   ${BLUE}Location:${NC} $location"
        
        # Provide specific refactoring advice for high complexity
        if [ "$complexity" -gt 15 ]; then
            echo -e "   ${YELLOW}💡 Refactoring Priority: HIGH${NC}"
            echo -e "   ${CYAN}Suggestions:${NC}"
            echo -e "     • Break down into smaller functions"
            echo -e "     • Extract complex conditions"
            echo -e "     • Consider design pattern application"
        fi
        
        echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
        
        ((rank++))
        [ $rank -gt $top_n ] && break
    done < <(sort -t'|' -k1 -rn "$temp_file")
    
    # Cleanup
    rm -f "$temp_file"
    
    # Summary statistics
    local total_hotspots=$(wc -l < "$temp_file" 2>/dev/null || echo 0)
    echo -e "\n${WHITE}📊 Hotspot Statistics:${NC}"
    echo -e "${BLUE}Total Functions Analyzed:${NC} $total_hotspots"
    echo -e "${BLUE}Functions Above Threshold (>10):${NC} $(awk -F'|' '$1 > 10' "$temp_file" 2>/dev/null | wc -l || echo 0)"
    echo -e "${BLUE}Critical Complexity (>20):${NC} $(awk -F'|' '$1 > 20' "$temp_file" 2>/dev/null | wc -l || echo 0)"
}

# Main command execution
case "$analysis_mode" in
    "analyze-file")
        analyze_file_complexity "$target_path" "$complexity_threshold"
        ;;
    "analyze-project")
        analyze_project_complexity "$target_path" "$complexity_threshold"
        ;;
    "report")
        generate_complexity_report "$target_path" "${ARGS[3]:-text}"
        ;;
    "hotspots")
        identify_hotspots "$target_path" "${complexity_threshold:-10}"
        ;;
    "comprehensive")
        # Run all analyses
        echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
        echo -e "${WHITE}🔧 Comprehensive Complexity Analysis${NC}"
        echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
        
        analyze_project_complexity "$target_path" "$complexity_threshold"
        echo ""
        identify_hotspots "$target_path" 5
        echo ""
        generate_complexity_report "$target_path" "json"
        ;;
    *)
        # Default: analyze single file or project based on target
        if [ -f "$analysis_mode" ]; then
            analyze_file_complexity "$analysis_mode" "${target_path:-10}"
        elif [ -d "$analysis_mode" ]; then
            analyze_project_complexity "$analysis_mode" "${target_path:-10}"
        else
            echo -e "${RED}❌ Error: Invalid analysis mode or target${NC}"
            echo "Usage: /function-complexity-analyzer [analyze-file|analyze-project|report|hotspots|comprehensive] [target] [threshold]"
            exit 1
        fi
        ;;
esac
```