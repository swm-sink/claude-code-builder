---
allowed-tools: Read, Write, Bash(find:*), Bash(grep:*), Bash(wc:*), Bash(awk:*), Bash(sed:*), Bash(head:*), Bash(tail:*), Bash(sort:*), Bash(uniq:*), Bash(cut:*), Bash(tr:*), Bash(file:*), Bash(stat:*), Bash(cloc:*), Bash(sloccount:*), Bash(tokei:*), Bash(jq:*), Bash(yq:*), Bash(tree:*), Bash(python3:*), Bash(node:*), Bash(go:*), Bash(rust:*), Bash(java:*), Bash(dotnet:*), Bash(ruby:*), Bash(php:*), Bash(git:*)
argument-hint: [analysis-mode] or [project-path] or [architecture-style]
description: Enterprise-grade architectural compliance dashboard providing comprehensive architecture validation, design pattern detection, dependency analysis, layered architecture verification, microservices assessment, and automated architecture documentation generation across multiple programming paradigms
---

# Architectural Dashboard Native Command

```bash
#!/bin/bash

# Parse arguments from $ARGUMENTS
IFS=' ' read -ra ARGS <<< "$ARGUMENTS"
analysis_mode="${ARGS[0]:-comprehensive}"
project_path="${ARGS[1]:-.}"
architecture_style="${ARGS[2]:-auto-detect}"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Architecture validation configuration
declare -A ARCHITECTURE_WEIGHTS=(
    ["layering"]=20           # Layered architecture compliance (20% weight)
    ["coupling"]=15            # Low coupling between modules (15% weight)
    ["cohesion"]=15            # High cohesion within modules (15% weight)
    ["patterns"]=10            # Design pattern usage (10% weight)
    ["dependencies"]=10        # Dependency management (10% weight)
    ["modularity"]=10          # Module organization (10% weight)
    ["naming"]=10              # Naming conventions (10% weight)
    ["documentation"]=10       # Architecture documentation (10% weight)
)

# Architecture style definitions
declare -A ARCHITECTURE_STYLES=(
    ["layered"]="presentation|business|data|infrastructure"
    ["hexagonal"]="domain|application|infrastructure|adapters|ports"
    ["clean"]="entities|usecases|interfaces|frameworks|drivers"
    ["mvc"]="model|view|controller|service|repository"
    ["mvvm"]="model|view|viewmodel|service|repository"
    ["microservices"]="api|service|gateway|registry|config"
    ["serverless"]="functions|handlers|events|triggers|storage"
    ["event-driven"]="events|handlers|publishers|subscribers|bus"
    ["ddd"]="domain|application|infrastructure|presentation"
)

# Design pattern detection patterns
declare -A DESIGN_PATTERNS=(
    ["singleton"]="getInstance|shared.*Instance|singleton"
    ["factory"]="create.*Factory|.*Factory.*create|makeInstance"
    ["builder"]=".*Builder|with.*|build\(\)"
    ["observer"]="subscribe|notify|observe|listener|emit"
    ["strategy"]=".*Strategy|.*Algorithm|.*Policy"
    ["adapter"]=".*Adapter|.*Wrapper|adapt"
    ["decorator"]=".*Decorator|wrap|enhance"
    ["proxy"]=".*Proxy|.*Surrogate"
    ["command"]=".*Command|execute|undo|redo"
    ["iterator"]=".*Iterator|next|hasNext|iterate"
    ["template"]=".*Template|.*Algorithm.*step"
    ["facade"]=".*Facade|.*SimplifiedInterface"
    ["repository"]=".*Repository|.*DAO|findBy|save|delete"
    ["dependency-injection"]="inject|@Autowired|@Inject|container"
)

# Anti-pattern detection patterns
declare -A ANTI_PATTERNS=(
    ["god-object"]="class.*\{([^}]{3000,})\}"  # Classes over 3000 chars
    ["spaghetti-code"]="goto|GOTO"
    ["copy-paste"]="TODO.*copy|FIXME.*duplicate|XXX.*same"
    ["magic-numbers"]="[^a-zA-Z0-9_]([0-9]{2,})[^0-9]"
    ["long-method"]="function.*\{([^}]{1000,})\}"  # Functions over 1000 chars
    ["feature-envy"]="\..*\..*\..*\."  # Deep method chaining
    ["inappropriate-intimacy"]="friend class|@friend"
    ["lazy-class"]="class.*\{[^}]{0,50}\}"  # Classes under 50 chars
    ["dead-code"]="if.*false|if.*0.*then|//.*unused|/\*.*deprecated"
    ["circular-dependency"]="import.*circular|require.*circular"
)

# Detect project architecture style
detect_architecture_style() {
    local project_path="$1"
    local detected_style="unknown"
    local max_score=0
    
    # Check directory structure for architecture patterns
    for style in "${!ARCHITECTURE_STYLES[@]}"; do
        local pattern="${ARCHITECTURE_STYLES[$style]}"
        local score=0
        
        # Count matching directories
        while IFS='|' read -r dir_pattern; do
            if find "$project_path" -type d -name "*${dir_pattern}*" 2>/dev/null | head -1 | grep -q .; then
                ((score++))
            fi
        done <<< "${pattern//|/$'\n'}"
        
        if [ $score -gt $max_score ]; then
            max_score=$score
            detected_style="$style"
        fi
    done
    
    echo "$detected_style"
}

# Analyze layered architecture compliance
analyze_layered_architecture() {
    local project_path="$1"
    local style="${2:-layered}"
    
    echo -e "${CYAN}🏗️  Layered Architecture Analysis${NC}"
    echo -e "${CYAN}──────────────────────────────────${NC}"
    
    local layers="${ARCHITECTURE_STYLES[$style]}"
    local layer_violations=0
    local total_dependencies=0
    
    # Check each layer
    while IFS='|' read -r layer; do
        echo -e "${BLUE}Layer:${NC} $layer"
        
        # Find files in this layer
        local layer_files=$(find "$project_path" -type f \( -path "*/${layer}/*" -o -path "*${layer}*" \) -name "*.py" -o -name "*.js" -o -name "*.java" -o -name "*.go" 2>/dev/null | wc -l)
        echo "  Files: $layer_files"
        
        # Check for improper dependencies (simplified)
        local upward_deps=$(find "$project_path" -path "*/${layer}/*" -type f -exec grep -l "import.*presentation\|require.*presentation" {} \; 2>/dev/null | wc -l)
        if [ "$layer" = "data" ] || [ "$layer" = "infrastructure" ]; then
            if [ $upward_deps -gt 0 ]; then
                echo -e "  ${RED}⚠️  Upward dependencies detected: $upward_deps${NC}"
                layer_violations=$((layer_violations + upward_deps))
            fi
        fi
        
        total_dependencies=$((total_dependencies + layer_files))
    done <<< "${layers//|/$'\n'}"
    
    # Calculate compliance score
    local compliance_score=100
    if [ $total_dependencies -gt 0 ]; then
        compliance_score=$((100 - (layer_violations * 100 / total_dependencies)))
    fi
    
    echo -e "\n${WHITE}Layer Compliance Score: ${compliance_score}%${NC}"
    
    if [ $compliance_score -ge 90 ]; then
        echo -e "${GREEN}✅ Excellent layered architecture${NC}"
    elif [ $compliance_score -ge 70 ]; then
        echo -e "${YELLOW}📝 Good layered architecture with minor issues${NC}"
    else
        echo -e "${RED}⚠️  Significant layering violations detected${NC}"
    fi
    
    return $((100 - compliance_score))
}

# Analyze coupling and cohesion metrics
analyze_coupling_cohesion() {
    local project_path="$1"
    
    echo -e "\n${CYAN}🔗 Coupling and Cohesion Analysis${NC}"
    echo -e "${CYAN}──────────────────────────────────${NC}"
    
    local total_modules=0
    local high_coupling_modules=0
    local low_cohesion_modules=0
    
    # Analyze each major directory as a module
    for module_dir in $(find "$project_path" -type d -maxdepth 2 -not -path "*/\.*" -not -path "*/node_modules" -not -path "*/vendor" 2>/dev/null); do
        [ "$module_dir" = "$project_path" ] && continue
        ((total_modules++))
        
        local module_name=$(basename "$module_dir")
        echo -e "\n${BLUE}Module:${NC} $module_name"
        
        # Count internal files
        local internal_files=$(find "$module_dir" -type f \( -name "*.py" -o -name "*.js" -o -name "*.java" -o -name "*.go" \) 2>/dev/null | wc -l)
        
        # Count external dependencies (imports from other modules)
        local external_deps=$(find "$module_dir" -type f \( -name "*.py" -o -name "*.js" -o -name "*.java" -o -name "*.go" \) -exec grep -h "import\|require" {} \; 2>/dev/null | grep -v "$module_name" | sort -u | wc -l)
        
        # Count internal dependencies (imports within module)
        local internal_deps=$(find "$module_dir" -type f \( -name "*.py" -o -name "*.js" -o -name "*.java" -o -name "*.go" \) -exec grep -h "import\|require" {} \; 2>/dev/null | grep "$module_name" | sort -u | wc -l)
        
        # Calculate coupling (external dependencies / internal files)
        local coupling_ratio=0
        if [ $internal_files -gt 0 ]; then
            coupling_ratio=$((external_deps * 100 / internal_files))
        fi
        
        # Calculate cohesion (internal dependencies / internal files)
        local cohesion_ratio=0
        if [ $internal_files -gt 0 ]; then
            cohesion_ratio=$((internal_deps * 100 / internal_files))
        fi
        
        echo "  Files: $internal_files"
        echo "  External Dependencies: $external_deps"
        echo "  Internal Dependencies: $internal_deps"
        echo "  Coupling Ratio: ${coupling_ratio}%"
        echo "  Cohesion Ratio: ${cohesion_ratio}%"
        
        # Evaluate metrics
        if [ $coupling_ratio -gt 50 ]; then
            echo -e "  ${YELLOW}⚠️  High coupling detected${NC}"
            ((high_coupling_modules++))
        fi
        
        if [ $cohesion_ratio -lt 30 ] && [ $internal_files -gt 5 ]; then
            echo -e "  ${YELLOW}⚠️  Low cohesion detected${NC}"
            ((low_cohesion_modules++))
        fi
    done
    
    # Summary
    echo -e "\n${WHITE}Coupling/Cohesion Summary:${NC}"
    echo "Total Modules: $total_modules"
    echo "High Coupling Modules: $high_coupling_modules"
    echo "Low Cohesion Modules: $low_cohesion_modules"
    
    local quality_score=$((100 - (high_coupling_modules + low_cohesion_modules) * 10))
    [ $quality_score -lt 0 ] && quality_score=0
    
    echo -e "${WHITE}Quality Score: ${quality_score}%${NC}"
    
    return $((100 - quality_score))
}

# Detect design patterns in codebase
detect_design_patterns() {
    local project_path="$1"
    
    echo -e "\n${CYAN}🎨 Design Pattern Detection${NC}"
    echo -e "${CYAN}──────────────────────────────${NC}"
    
    local patterns_found=0
    local total_patterns=${#DESIGN_PATTERNS[@]}
    
    echo -e "${WHITE}Scanning for design patterns...${NC}"
    
    for pattern_name in "${!DESIGN_PATTERNS[@]}"; do
        local pattern="${DESIGN_PATTERNS[$pattern_name]}"
        local occurrences=$(grep -r -E "$pattern" "$project_path" --include="*.py" --include="*.js" --include="*.java" --include="*.go" --include="*.cs" 2>/dev/null | wc -l)
        
        if [ $occurrences -gt 0 ]; then
            echo -e "${GREEN}✅ ${pattern_name^} Pattern${NC} - $occurrences occurrences"
            ((patterns_found++))
        fi
    done
    
    if [ $patterns_found -eq 0 ]; then
        echo -e "${YELLOW}⚠️  No standard design patterns detected${NC}"
    fi
    
    echo -e "\n${WHITE}Design Patterns Found: $patterns_found/$total_patterns${NC}"
    
    # Pattern usage score
    local pattern_score=$((patterns_found * 100 / total_patterns))
    if [ $pattern_score -gt 50 ]; then
        echo -e "${GREEN}✅ Excellent design pattern usage${NC}"
    elif [ $pattern_score -gt 20 ]; then
        echo -e "${YELLOW}📝 Moderate design pattern usage${NC}"
    else
        echo -e "${RED}⚠️  Limited design pattern usage${NC}"
    fi
    
    return $((100 - pattern_score))
}

# Detect anti-patterns in codebase
detect_anti_patterns() {
    local project_path="$1"
    
    echo -e "\n${CYAN}⚠️  Anti-Pattern Detection${NC}"
    echo -e "${CYAN}──────────────────────────────${NC}"
    
    local anti_patterns_found=0
    local critical_issues=0
    
    echo -e "${WHITE}Scanning for anti-patterns...${NC}"
    
    for pattern_name in "${!ANTI_PATTERNS[@]}"; do
        local pattern="${ANTI_PATTERNS[$pattern_name]}"
        local occurrences=$(grep -r -E "$pattern" "$project_path" --include="*.py" --include="*.js" --include="*.java" --include="*.go" --include="*.cs" 2>/dev/null | wc -l)
        
        if [ $occurrences -gt 0 ]; then
            echo -e "${RED}❌ ${pattern_name^} Anti-Pattern${NC} - $occurrences occurrences"
            ((anti_patterns_found++))
            
            # Critical anti-patterns
            if [[ "$pattern_name" == "god-object" ]] || [[ "$pattern_name" == "spaghetti-code" ]] || [[ "$pattern_name" == "circular-dependency" ]]; then
                ((critical_issues++))
            fi
        fi
    done
    
    if [ $anti_patterns_found -eq 0 ]; then
        echo -e "${GREEN}✅ No anti-patterns detected${NC}"
    else
        echo -e "\n${WHITE}Anti-Patterns Found: $anti_patterns_found${NC}"
        echo -e "${WHITE}Critical Issues: $critical_issues${NC}"
    fi
    
    # Anti-pattern penalty score
    local penalty_score=$((anti_patterns_found * 10 + critical_issues * 20))
    [ $penalty_score -gt 100 ] && penalty_score=100
    
    return $penalty_score
}

# Analyze dependency graph
analyze_dependencies() {
    local project_path="$1"
    
    echo -e "\n${CYAN}📦 Dependency Analysis${NC}"
    echo -e "${CYAN}──────────────────────────────${NC}"
    
    local circular_deps=0
    local external_deps=0
    local unused_deps=0
    
    # Check for package management files
    if [ -f "$project_path/package.json" ]; then
        echo -e "${BLUE}Node.js Project Detected${NC}"
        external_deps=$(jq '.dependencies | length' "$project_path/package.json" 2>/dev/null || echo 0)
        echo "  Production Dependencies: $external_deps"
        
        local dev_deps=$(jq '.devDependencies | length' "$project_path/package.json" 2>/dev/null || echo 0)
        echo "  Dev Dependencies: $dev_deps"
        
        # Check for unused dependencies (simplified)
        if [ -f "$project_path/package-lock.json" ]; then
            unused_deps=$(jq '.dependencies | keys[]' "$project_path/package.json" 2>/dev/null | while read -r dep; do
                dep=$(echo "$dep" | tr -d '"')
                if ! grep -r "$dep" "$project_path" --include="*.js" --include="*.ts" --exclude-dir=node_modules 2>/dev/null | grep -q .; then
                    echo "$dep"
                fi
            done | wc -l)
            echo "  Potentially Unused: $unused_deps"
        fi
    elif [ -f "$project_path/requirements.txt" ]; then
        echo -e "${BLUE}Python Project Detected${NC}"
        external_deps=$(wc -l < "$project_path/requirements.txt")
        echo "  Dependencies: $external_deps"
    elif [ -f "$project_path/go.mod" ]; then
        echo -e "${BLUE}Go Project Detected${NC}"
        external_deps=$(grep -c "require" "$project_path/go.mod" 2>/dev/null || echo 0)
        echo "  Dependencies: $external_deps"
    elif [ -f "$project_path/Cargo.toml" ]; then
        echo -e "${BLUE}Rust Project Detected${NC}"
        external_deps=$(grep -c "^\[dependencies\]" -A 100 "$project_path/Cargo.toml" 2>/dev/null | tail -n +2 | grep -c "=" || echo 0)
        echo "  Dependencies: $external_deps"
    elif [ -f "$project_path/pom.xml" ]; then
        echo -e "${BLUE}Maven Project Detected${NC}"
        external_deps=$(grep -c "<dependency>" "$project_path/pom.xml" 2>/dev/null || echo 0)
        echo "  Dependencies: $external_deps"
    fi
    
    # Check for circular dependencies (simplified)
    echo -e "\n${WHITE}Checking for circular dependencies...${NC}"
    
    # Look for import cycles in Python
    if find "$project_path" -name "*.py" -type f 2>/dev/null | head -1 | grep -q .; then
        circular_deps=$(find "$project_path" -name "*.py" -type f -exec grep -l "import.*from.*import" {} \; 2>/dev/null | wc -l)
        if [ $circular_deps -gt 0 ]; then
            echo -e "${YELLOW}⚠️  Potential circular imports detected: $circular_deps files${NC}"
        fi
    fi
    
    # Dependency health score
    local dep_score=100
    dep_score=$((dep_score - unused_deps * 5))
    dep_score=$((dep_score - circular_deps * 10))
    [ $dep_score -lt 0 ] && dep_score=0
    
    echo -e "\n${WHITE}Dependency Health Score: ${dep_score}%${NC}"
    
    return $((100 - dep_score))
}

# Analyze modularity and boundaries
analyze_modularity() {
    local project_path="$1"
    
    echo -e "\n${CYAN}📐 Modularity Analysis${NC}"
    echo -e "${CYAN}──────────────────────────────${NC}"
    
    # Count modules/packages
    local modules=$(find "$project_path" -type d -maxdepth 2 -not -path "*/\.*" -not -path "*/node_modules" -not -path "*/vendor" 2>/dev/null | wc -l)
    echo "Total Modules/Packages: $modules"
    
    # Calculate average module size
    local total_files=$(find "$project_path" -type f \( -name "*.py" -o -name "*.js" -o -name "*.java" -o -name "*.go" -o -name "*.cs" \) 2>/dev/null | wc -l)
    local avg_module_size=0
    if [ $modules -gt 0 ]; then
        avg_module_size=$((total_files / modules))
    fi
    echo "Average Module Size: $avg_module_size files"
    
    # Check for proper module boundaries
    local boundary_violations=0
    
    # Check for cross-module direct file access
    boundary_violations=$(find "$project_path" -type f \( -name "*.py" -o -name "*.js" -o -name "*.java" \) -exec grep -E "\.\./\.\.|../../.." {} \; 2>/dev/null | wc -l)
    
    if [ $boundary_violations -gt 0 ]; then
        echo -e "${YELLOW}⚠️  Module boundary violations: $boundary_violations${NC}"
    else
        echo -e "${GREEN}✅ Clean module boundaries${NC}"
    fi
    
    # Module quality assessment
    local modularity_score=100
    
    if [ $avg_module_size -gt 50 ]; then
        echo -e "${YELLOW}⚠️  Large modules detected (>50 files average)${NC}"
        modularity_score=$((modularity_score - 20))
    elif [ $avg_module_size -lt 5 ] && [ $modules -gt 10 ]; then
        echo -e "${YELLOW}⚠️  Over-modularization detected (<5 files average)${NC}"
        modularity_score=$((modularity_score - 15))
    fi
    
    modularity_score=$((modularity_score - boundary_violations * 5))
    [ $modularity_score -lt 0 ] && modularity_score=0
    
    echo -e "\n${WHITE}Modularity Score: ${modularity_score}%${NC}"
    
    return $((100 - modularity_score))
}

# Check naming conventions
check_naming_conventions() {
    local project_path="$1"
    
    echo -e "\n${CYAN}📝 Naming Convention Analysis${NC}"
    echo -e "${CYAN}──────────────────────────────${NC}"
    
    local naming_issues=0
    local total_items=0
    
    # Check file naming
    echo -e "${WHITE}Checking file naming conventions...${NC}"
    
    # Check for inconsistent file naming
    local snake_case_files=$(find "$project_path" -type f -name "*_*.py" -o -name "*_*.js" 2>/dev/null | wc -l)
    local camel_case_files=$(find "$project_path" -type f -name "*[a-z][A-Z]*.js" -o -name "*[a-z][A-Z]*.java" 2>/dev/null | wc -l)
    local kebab_case_files=$(find "$project_path" -type f -name "*-*.js" -o -name "*-*.css" 2>/dev/null | wc -l)
    
    echo "  Snake case files: $snake_case_files"
    echo "  Camel case files: $camel_case_files"
    echo "  Kebab case files: $kebab_case_files"
    
    # Check for mixed conventions in same directory
    for dir in $(find "$project_path" -type d -not -path "*/\.*" -not -path "*/node_modules" 2>/dev/null); do
        local dir_snake=$(find "$dir" -maxdepth 1 -type f -name "*_*" 2>/dev/null | wc -l)
        local dir_camel=$(find "$dir" -maxdepth 1 -type f -name "*[a-z][A-Z]*" 2>/dev/null | wc -l)
        
        if [ $dir_snake -gt 0 ] && [ $dir_camel -gt 0 ]; then
            echo -e "${YELLOW}⚠️  Mixed naming in: $(basename "$dir")${NC}"
            ((naming_issues++))
        fi
        ((total_items++))
    done
    
    # Check class/function naming in code
    echo -e "\n${WHITE}Checking code naming conventions...${NC}"
    
    # Check for non-conventional class names (should be PascalCase)
    local bad_class_names=$(grep -r "class [a-z]" "$project_path" --include="*.py" --include="*.java" --include="*.cs" 2>/dev/null | wc -l)
    if [ $bad_class_names -gt 0 ]; then
        echo -e "${YELLOW}⚠️  Non-PascalCase class names: $bad_class_names${NC}"
        naming_issues=$((naming_issues + bad_class_names))
    fi
    
    # Check for non-conventional function names (should be snake_case or camelCase)
    local bad_function_names=$(grep -r "def [A-Z]" "$project_path" --include="*.py" 2>/dev/null | wc -l)
    if [ $bad_function_names -gt 0 ]; then
        echo -e "${YELLOW}⚠️  Non-snake_case Python functions: $bad_function_names${NC}"
        naming_issues=$((naming_issues + bad_function_names))
    fi
    
    # Naming convention score
    local naming_score=100
    if [ $total_items -gt 0 ]; then
        naming_score=$((100 - (naming_issues * 100 / total_items)))
        [ $naming_score -lt 0 ] && naming_score=0
    fi
    
    echo -e "\n${WHITE}Naming Convention Score: ${naming_score}%${NC}"
    
    return $((100 - naming_score))
}

# Check architecture documentation
check_architecture_documentation() {
    local project_path="$1"
    
    echo -e "\n${CYAN}📚 Architecture Documentation Check${NC}"
    echo -e "${CYAN}──────────────────────────────────${NC}"
    
    local doc_score=0
    local max_score=100
    
    # Check for architecture documentation files
    if [ -f "$project_path/ARCHITECTURE.md" ] || [ -f "$project_path/docs/ARCHITECTURE.md" ]; then
        echo -e "${GREEN}✅ Architecture documentation found${NC}"
        doc_score=$((doc_score + 25))
    else
        echo -e "${YELLOW}⚠️  No ARCHITECTURE.md file${NC}"
    fi
    
    if [ -f "$project_path/README.md" ]; then
        if grep -q -i "architecture\|design\|structure" "$project_path/README.md"; then
            echo -e "${GREEN}✅ Architecture mentioned in README${NC}"
            doc_score=$((doc_score + 15))
        else
            echo -e "${YELLOW}⚠️  No architecture section in README${NC}"
        fi
    fi
    
    # Check for API documentation
    if [ -f "$project_path/API.md" ] || [ -f "$project_path/docs/API.md" ] || [ -d "$project_path/api-docs" ]; then
        echo -e "${GREEN}✅ API documentation found${NC}"
        doc_score=$((doc_score + 20))
    else
        echo -e "${YELLOW}⚠️  No API documentation${NC}"
    fi
    
    # Check for design decision records
    if [ -d "$project_path/docs/adr" ] || [ -d "$project_path/architecture/decisions" ]; then
        echo -e "${GREEN}✅ Architecture Decision Records (ADR) found${NC}"
        doc_score=$((doc_score + 20))
    else
        echo -e "${YELLOW}⚠️  No Architecture Decision Records${NC}"
    fi
    
    # Check for diagrams
    if find "$project_path" -name "*.puml" -o -name "*.drawio" -o -name "*.mermaid" 2>/dev/null | head -1 | grep -q .; then
        echo -e "${GREEN}✅ Architecture diagrams found${NC}"
        doc_score=$((doc_score + 20))
    else
        echo -e "${YELLOW}⚠️  No architecture diagrams${NC}"
    fi
    
    echo -e "\n${WHITE}Documentation Score: ${doc_score}%${NC}"
    
    return $((100 - doc_score))
}

# Generate architecture report
generate_architecture_report() {
    local project_path="$1"
    local output_format="${2:-text}"
    
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}📊 Architecture Compliance Report${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local architecture_style=$(detect_architecture_style "$project_path")
    
    echo -e "${BLUE}Project:${NC} $project_path"
    echo -e "${BLUE}Timestamp:${NC} $timestamp"
    echo -e "${BLUE}Detected Architecture:${NC} $architecture_style"
    echo -e "${CYAN}───────────────────────────────────────────────────────────────${NC}"
    
    # Collect all metrics
    declare -A scores
    
    # Run all analyses and collect scores
    analyze_layered_architecture "$project_path" "$architecture_style"
    scores["layering"]=$?
    
    analyze_coupling_cohesion "$project_path"
    scores["coupling"]=$?
    
    detect_design_patterns "$project_path"
    scores["patterns"]=$?
    
    detect_anti_patterns "$project_path"
    scores["anti_patterns"]=$?
    
    analyze_dependencies "$project_path"
    scores["dependencies"]=$?
    
    analyze_modularity "$project_path"
    scores["modularity"]=$?
    
    check_naming_conventions "$project_path"
    scores["naming"]=$?
    
    check_architecture_documentation "$project_path"
    scores["documentation"]=$?
    
    # Calculate overall architecture health score
    local total_score=0
    local weight_sum=0
    
    for metric in "${!ARCHITECTURE_WEIGHTS[@]}"; do
        local weight=${ARCHITECTURE_WEIGHTS[$metric]}
        local metric_score=$((100 - ${scores[$metric]:-0}))
        total_score=$((total_score + (metric_score * weight)))
        weight_sum=$((weight_sum + weight))
    done
    
    local overall_score=$((total_score / weight_sum))
    
    # Adjust for anti-patterns
    overall_score=$((overall_score - ${scores["anti_patterns"]:-0} / 2))
    [ $overall_score -lt 0 ] && overall_score=0
    
    echo -e "\n${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}🎯 Overall Architecture Health Score: ${overall_score}%${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${NC}"
    
    # Grade assignment
    local grade=""
    local assessment=""
    
    if [ $overall_score -ge 90 ]; then
        grade="A+"
        assessment="${GREEN}EXCELLENT - World-class architecture${NC}"
    elif [ $overall_score -ge 80 ]; then
        grade="A"
        assessment="${GREEN}VERY GOOD - Strong architectural foundation${NC}"
    elif [ $overall_score -ge 70 ]; then
        grade="B"
        assessment="${YELLOW}GOOD - Solid architecture with room for improvement${NC}"
    elif [ $overall_score -ge 60 ]; then
        grade="C"
        assessment="${YELLOW}FAIR - Architecture needs attention${NC}"
    elif [ $overall_score -ge 50 ]; then
        grade="D"
        assessment="${RED}POOR - Significant architectural issues${NC}"
    else
        grade="F"
        assessment="${RED}CRITICAL - Architecture requires immediate refactoring${NC}"
    fi
    
    echo -e "${WHITE}Grade: $grade${NC}"
    echo -e "$assessment"
    
    # Recommendations
    echo -e "\n${CYAN}📋 Recommendations:${NC}"
    echo -e "${CYAN}───────────────────────────────${NC}"
    
    if [ ${scores["layering"]:-0} -gt 20 ]; then
        echo -e "• ${YELLOW}Improve layer separation and reduce cross-layer dependencies${NC}"
    fi
    
    if [ ${scores["coupling"]:-0} -gt 30 ]; then
        echo -e "• ${YELLOW}Reduce coupling between modules${NC}"
    fi
    
    if [ ${scores["patterns"]:-0} -gt 50 ]; then
        echo -e "• ${YELLOW}Consider implementing more design patterns${NC}"
    fi
    
    if [ ${scores["anti_patterns"]:-0} -gt 0 ]; then
        echo -e "• ${RED}Address detected anti-patterns immediately${NC}"
    fi
    
    if [ ${scores["dependencies"]:-0} -gt 20 ]; then
        echo -e "• ${YELLOW}Review and optimize dependency management${NC}"
    fi
    
    if [ ${scores["documentation"]:-0} -gt 30 ]; then
        echo -e "• ${YELLOW}Improve architecture documentation${NC}"
    fi
    
    # Save report
    if [ "$output_format" = "json" ]; then
        local report_file="architecture-report-$(date +%Y%m%d-%H%M%S).json"
        cat > "$report_file" << EOF
{
  "timestamp": "$timestamp",
  "project": "$project_path",
  "architecture_style": "$architecture_style",
  "overall_score": $overall_score,
  "grade": "$grade",
  "metrics": {
    "layering": $((100 - ${scores["layering"]:-0})),
    "coupling": $((100 - ${scores["coupling"]:-0})),
    "patterns": $((100 - ${scores["patterns"]:-0})),
    "anti_patterns": ${scores["anti_patterns"]:-0},
    "dependencies": $((100 - ${scores["dependencies"]:-0})),
    "modularity": $((100 - ${scores["modularity"]:-0})),
    "naming": $((100 - ${scores["naming"]:-0})),
    "documentation": $((100 - ${scores["documentation"]:-0}))
  }
}
EOF
        echo -e "\n${GREEN}✅ Report saved to: $report_file${NC}"
    fi
}

# Main command execution
case "$analysis_mode" in
    "layering")
        analyze_layered_architecture "$project_path" "$architecture_style"
        ;;
    "coupling")
        analyze_coupling_cohesion "$project_path"
        ;;
    "patterns")
        detect_design_patterns "$project_path"
        ;;
    "anti-patterns")
        detect_anti_patterns "$project_path"
        ;;
    "dependencies")
        analyze_dependencies "$project_path"
        ;;
    "modularity")
        analyze_modularity "$project_path"
        ;;
    "naming")
        check_naming_conventions "$project_path"
        ;;
    "documentation")
        check_architecture_documentation "$project_path"
        ;;
    "comprehensive")
        generate_architecture_report "$project_path" "${ARGS[3]:-text}"
        ;;
    "report")
        generate_architecture_report "$project_path" "json"
        ;;
    *)
        # Default: comprehensive analysis
        generate_architecture_report "$project_path" "text"
        ;;
esac
```