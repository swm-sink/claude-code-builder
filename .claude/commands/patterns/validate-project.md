---
allowed-tools: Read, Write, Bash(find:*), Bash(grep:*), Bash(wc:*), Bash(file:*), Bash(stat:*), Bash(du:*), Bash(head:*), Bash(tail:*), Bash(awk:*), Bash(sed:*), Bash(sort:*), Bash(uniq:*), Bash(git:*), Bash(npm:*), Bash(pip:*), Bash(go:*), Bash(cargo:*), Bash(docker:*), Bash(jq:*), Bash(yq:*), Bash(tree:*), Bash(cloc:*), Bash(sloccount:*)
argument-hint: [validation-scope] or [project-path] or [report-format]
description: Comprehensive project validation with architecture analysis, security assessment, and enterprise compliance checking
---

# Project Validation and Architecture Analysis

Intelligent project validation system providing comprehensive architecture analysis, security assessment, code quality evaluation, and enterprise compliance checking with detailed reporting and automated improvement recommendations.

## Quick Usage

```bash
# Basic project validation
/validate-project

# Comprehensive validation with detailed analysis
/validate-project comprehensive /path/to/project

# Security-focused validation
/validate-project security

# Architecture analysis
/validate-project architecture

# Enterprise compliance validation
/validate-project compliance

# Generate detailed report
/validate-project report json > project-analysis.json
```

## Validation Operations

### Structure Validation
```bash
# Parse arguments from $ARGUMENTS
IFS=' ' read -ra ARGS <<< "$ARGUMENTS"
validation_scope="${ARGS[0]:-basic}"
project_path="${ARGS[1]:-.}"

# Basic project structure validation
if [[ "$validation_scope" == "structure" || "$validation_scope" == "basic" ]]; then
    
    /error-handler "info" "Starting project structure validation: $project_path"
    
    # Initialize validation metrics
    declare -A validation_scores=(
        ["structure"]=0
        ["documentation"]=0
        ["dependencies"]=0
        ["testing"]=0
        ["security"]=0
        ["ci_cd"]=0
        ["architecture"]=0
        ["compliance"]=0
    )
    
    declare -A validation_details
    validation_start_time=$(date +%s%3N)
    
    # Project structure validation
    echo "🔍 Analyzing project structure..."
    
    # Essential files validation
    if [[ -f "$project_path/README.md" ]]; then
        ((validation_scores["structure"]++))
        ((validation_scores["documentation"]++))
        validation_details["readme"]="✅ README.md found"
        
        # Analyze README quality
        readme_lines=$(wc -l < "$project_path/README.md")
        if [[ $readme_lines -gt 20 ]]; then
            ((validation_scores["documentation"]++))
            validation_details["readme_quality"]="✅ Comprehensive README ($readme_lines lines)"
        else
            validation_details["readme_quality"]="⚠️ Brief README ($readme_lines lines)"
        fi
    else
        validation_details["readme"]="❌ README.md missing"
    fi
    
    # Git repository validation
    if [[ -d "$project_path/.git" ]]; then
        ((validation_scores["structure"]++))
        validation_details["git"]="✅ Git repository detected"
        
        # Git history analysis
        if git -C "$project_path" log --oneline -n 1 >/dev/null 2>&1; then
            commit_count=$(git -C "$project_path" rev-list --count HEAD 2>/dev/null || echo "0")
            if [[ $commit_count -gt 10 ]]; then
                ((validation_scores["structure"]++))
                validation_details["git_history"]="✅ Active development ($commit_count commits)"
            else
                validation_details["git_history"]="⚠️ Limited history ($commit_count commits)"
            fi
            
            # Branch analysis
            branch_count=$(git -C "$project_path" branch -r | wc -l 2>/dev/null || echo "0")
            if [[ $branch_count -gt 1 ]]; then
                ((validation_scores["structure"]++))
                validation_details["git_branches"]="✅ Multi-branch workflow ($branch_count branches)"
            fi
        fi
    else
        validation_details["git"]="❌ No Git repository"
    fi
    
    # Project type and dependency detection
    echo "🔧 Detecting project architecture..."
    project_type=$(detect_enhanced_project_type "$project_path")
    validation_details["project_type"]="📋 Project type: $project_type"
    
    case "$project_type" in
        "nodejs")
            if [[ -f "$project_path/package.json" ]]; then
                ((validation_scores["dependencies"]++))
                validation_details["dependencies"]="✅ Node.js package.json found"
                
                # Analyze package.json quality
                if jq -e '.scripts.test' "$project_path/package.json" >/dev/null 2>&1; then
                    ((validation_scores["testing"]++))
                    validation_details["test_scripts"]="✅ Test scripts configured"
                fi
                
                if jq -e '.scripts.build' "$project_path/package.json" >/dev/null 2>&1; then
                    ((validation_scores["ci_cd"]++))
                    validation_details["build_scripts"]="✅ Build scripts configured"
                fi
                
                # Security dependency analysis
                if [[ -f "$project_path/package-lock.json" ]]; then
                    ((validation_scores["security"]++))
                    validation_details["dependency_lock"]="✅ Dependency lock file present"
                fi
            fi
            ;;
        "python")
            if [[ -f "$project_path/requirements.txt" ]]; then
                ((validation_scores["dependencies"]++))
                validation_details["dependencies"]="✅ Python requirements.txt found"
            fi
            
            if [[ -f "$project_path/setup.py" || -f "$project_path/pyproject.toml" ]]; then
                ((validation_scores["dependencies"]++))
                validation_details["python_packaging"]="✅ Python packaging configuration found"
            fi
            
            if [[ -f "$project_path/requirements-dev.txt" ]]; then
                ((validation_scores["testing"]++))
                validation_details["dev_dependencies"]="✅ Development dependencies configured"
            fi
            ;;
        "golang")
            if [[ -f "$project_path/go.mod" ]]; then
                ((validation_scores["dependencies"]++))
                validation_details["dependencies"]="✅ Go module configuration found"
                
                if [[ -f "$project_path/go.sum" ]]; then
                    ((validation_scores["security"]++))
                    validation_details["go_checksums"]="✅ Go dependency checksums present"
                fi
            fi
            ;;
        "rust")
            if [[ -f "$project_path/Cargo.toml" ]]; then
                ((validation_scores["dependencies"]++))
                validation_details["dependencies"]="✅ Rust Cargo configuration found"
                
                if [[ -f "$project_path/Cargo.lock" ]]; then
                    ((validation_scores["security"]++))
                    validation_details["cargo_lock"]="✅ Cargo lock file present"
                fi
            fi
            ;;
    esac
    
    # Source code structure validation
    echo "📁 Analyzing source code organization..."
    
    source_dirs=("src" "lib" "app" "source" "code")
    for dir in "${source_dirs[@]}"; do
        if [[ -d "$project_path/$dir" ]]; then
            ((validation_scores["structure"]++))
            validation_details["source_directory"]="✅ Source directory found: $dir"
            
            # Analyze source code organization
            source_file_count=$(find "$project_path/$dir" -type f \( -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.go" -o -name "*.rs" -o -name "*.java" -o -name "*.cpp" \) | wc -l)
            if [[ $source_file_count -gt 0 ]]; then
                ((validation_scores["architecture"]++))
                validation_details["source_files"]="✅ Source files found ($source_file_count files)"
            fi
            break
        fi
    done
    
    # Test directory validation
    test_dirs=("test" "tests" "__tests__" "spec" "specs")
    for dir in "${test_dirs[@]}"; do
        if [[ -d "$project_path/$dir" ]]; then
            ((validation_scores["testing"]++))
            validation_details["test_directory"]="✅ Test directory found: $dir"
            
            # Analyze test coverage
            test_file_count=$(find "$project_path/$dir" -type f \( -name "*test*" -o -name "*spec*" \) | wc -l)
            if [[ $test_file_count -gt 0 ]]; then
                ((validation_scores["testing"]++))
                validation_details["test_files"]="✅ Test files found ($test_file_count files)"
            fi
            break
        fi
    done
    
    # Documentation validation
    echo "📚 Analyzing documentation quality..."
    
    doc_dirs=("docs" "doc" "documentation")
    for dir in "${doc_dirs[@]}"; do
        if [[ -d "$project_path/$dir" ]]; then
            ((validation_scores["documentation"]++))
            validation_details["documentation_directory"]="✅ Documentation directory found: $dir"
            break
        fi
    done
    
    # License validation
    license_files=("LICENSE" "LICENSE.txt" "LICENSE.md" "COPYING")
    for file in "${license_files[@]}"; do
        if [[ -f "$project_path/$file" ]]; then
            ((validation_scores["compliance"]++))
            validation_details["license"]="✅ License file found: $file"
            break
        fi
    done
    
    # CI/CD configuration validation
    echo "🔄 Analyzing CI/CD configuration..."
    
    ci_configs=(".github/workflows" ".gitlab-ci.yml" ".travis.yml" "Jenkinsfile" ".circleci" "azure-pipelines.yml")
    for config in "${ci_configs[@]}"; do
        if [[ -f "$project_path/$config" || -d "$project_path/$config" ]]; then
            ((validation_scores["ci_cd"]++))
            validation_details["ci_cd"]="✅ CI/CD configuration found: $config"
            break
        fi
    done
    
    # Docker configuration validation
    if [[ -f "$project_path/Dockerfile" ]]; then
        ((validation_scores["ci_cd"]++))
        validation_details["docker"]="✅ Docker configuration found"
        
        if [[ -f "$project_path/docker-compose.yml" ]]; then
            ((validation_scores["architecture"]++))
            validation_details["docker_compose"]="✅ Docker Compose configuration found"
        fi
    fi
    
    # Generate validation report
    validation_end_time=$(date +%s%3N)
    validation_duration=$((validation_end_time - validation_start_time))
    
    echo ""
    echo "📊 Project Validation Report"
    echo "============================"
    echo "Project Path: $project_path"
    echo "Project Type: $project_type"
    echo "Validation Time: ${validation_duration}ms"
    echo ""
    
    # Calculate overall health score
    total_score=0
    max_possible=0
    for category in "${!validation_scores[@]}"; do
        score=${validation_scores[$category]}
        total_score=$((total_score + score))
        max_possible=$((max_possible + 5))  # Assuming max 5 points per category
        echo "📋 $category: $score/5"
    done
    
    overall_percentage=$((total_score * 100 / max_possible))
    echo ""
    echo "🎯 Overall Health Score: $total_score/$max_possible ($overall_percentage%)"
    
    # Health assessment
    if [[ $overall_percentage -ge 80 ]]; then
        echo "🟢 Excellent project health"
        project_health="excellent"
    elif [[ $overall_percentage -ge 60 ]]; then
        echo "🟡 Good project health"
        project_health="good"
    elif [[ $overall_percentage -ge 40 ]]; then
        echo "🟠 Fair project health"
        project_health="fair"
    else
        echo "🔴 Poor project health - needs improvement"
        project_health="poor"
    fi
    
    echo ""
    echo "📋 Detailed Findings:"
    for detail in "${!validation_details[@]}"; do
        echo "  ${validation_details[$detail]}"
    done
    
    /error-handler "info" "Project validation completed: $project_health health ($overall_percentage%)"
    
    # Return appropriate exit code
    case "$project_health" in
        "excellent") exit 0 ;;
        "good") exit 1 ;;
        "fair") exit 2 ;;
        "poor") exit 3 ;;
    esac
fi
```

### Comprehensive Project Analysis
```bash
# Comprehensive validation with advanced analysis
if [[ "$validation_scope" == "comprehensive" ]]; then
    
    /error-handler "info" "Starting comprehensive project analysis: $project_path"
    
    # Run basic validation first
    /validate-project structure "$project_path"
    basic_result=$?
    
    echo ""
    echo "🔬 Advanced Analysis"
    echo "==================="
    
    # Code quality analysis
    echo "📊 Analyzing code quality..."
    
    if command -v cloc >/dev/null 2>&1; then
        cloc_output=$(cloc "$project_path" 2>/dev/null)
        if [[ -n "$cloc_output" ]]; then
            echo "📈 Lines of Code Analysis:"
            echo "$cloc_output" | tail -n +4
        fi
    fi
    
    # Dependency vulnerability analysis
    echo ""
    echo "🔒 Security Analysis..."
    
    case "$(detect_enhanced_project_type "$project_path")" in
        "nodejs")
            if command -v npm >/dev/null 2>&1 && [[ -f "$project_path/package.json" ]]; then
                cd "$project_path"
                echo "🔍 Running npm audit..."
                npm_audit_result=$(npm audit --audit-level=moderate 2>/dev/null || echo "No npm audit available")
                echo "$npm_audit_result"
            fi
            ;;
        "python")
            if command -v pip >/dev/null 2>&1; then
                echo "🔍 Checking Python dependencies..."
                if [[ -f "$project_path/requirements.txt" ]]; then
                    pip_check_result=$(pip check 2>/dev/null || echo "Pip check not available")
                    echo "$pip_check_result"
                fi
            fi
            ;;
        "golang")
            if command -v go >/dev/null 2>&1 && [[ -f "$project_path/go.mod" ]]; then
                cd "$project_path"
                echo "🔍 Running Go module verification..."
                go_verify_result=$(go mod verify 2>/dev/null || echo "Go verification not available")
                echo "$go_verify_result"
            fi
            ;;
    esac
    
    # Architecture analysis
    echo ""
    echo "🏗️ Architecture Analysis..."
    
    # Calculate project complexity
    total_files=$(find "$project_path" -type f \( -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.go" -o -name "*.rs" -o -name "*.java" \) | wc -l)
    total_directories=$(find "$project_path" -type d | wc -l)
    
    if [[ $total_files -gt 0 ]]; then
        avg_files_per_dir=$((total_files / total_directories))
        echo "📁 Project size: $total_files files in $total_directories directories"
        echo "📊 Average files per directory: $avg_files_per_dir"
        
        if [[ $total_files -gt 100 ]]; then
            echo "⚠️ Large project - consider modularization"
        elif [[ $total_files -gt 50 ]]; then
            echo "✅ Medium-sized project"
        else
            echo "✅ Small project - manageable size"
        fi
    fi
    
    # Performance considerations
    echo ""
    echo "⚡ Performance Analysis..."
    
    project_size=$(du -sh "$project_path" 2>/dev/null | cut -f1)
    echo "💾 Total project size: $project_size"
    
    # Large file detection
    large_files=$(find "$project_path" -type f -size +10M 2>/dev/null | head -5)
    if [[ -n "$large_files" ]]; then
        echo "⚠️ Large files detected:"
        echo "$large_files"
    else
        echo "✅ No unusually large files detected"
    fi
    
    /error-handler "info" "Comprehensive analysis completed"
    exit $basic_result
fi
```

### Security-Focused Validation
```bash
# Security validation
if [[ "$validation_scope" == "security" ]]; then
    
    /error-handler "info" "Starting security-focused validation: $project_path"
    
    echo "🔒 Security Validation"
    echo "====================="
    
    security_score=0
    declare -A security_findings
    
    # Sensitive file detection
    echo "🔍 Scanning for sensitive files..."
    
    sensitive_patterns=(".env" "*.key" "*.pem" "*.p12" "*.keystore" "config.json" "secrets.*")
    for pattern in "${sensitive_patterns[@]}"; do
        found_files=$(find "$project_path" -name "$pattern" -type f 2>/dev/null)
        if [[ -n "$found_files" ]]; then
            security_findings["sensitive_files"]="⚠️ Sensitive files found: $found_files"
        fi
    done
    
    # .gitignore validation
    if [[ -f "$project_path/.gitignore" ]]; then
        ((security_score++))
        security_findings["gitignore"]="✅ .gitignore file present"
        
        # Check if common sensitive patterns are ignored
        sensitive_ignore_patterns=("*.env" "*.key" "node_modules" "__pycache__" "*.log")
        ignored_patterns=0
        for pattern in "${sensitive_ignore_patterns[@]}"; do
            if grep -q "$pattern" "$project_path/.gitignore" 2>/dev/null; then
                ((ignored_patterns++))
            fi
        done
        
        if [[ $ignored_patterns -ge 3 ]]; then
            ((security_score++))
            security_findings["gitignore_quality"]="✅ Good .gitignore coverage ($ignored_patterns/5 patterns)"
        else
            security_findings["gitignore_quality"]="⚠️ Limited .gitignore coverage ($ignored_patterns/5 patterns)"
        fi
    else
        security_findings["gitignore"]="❌ .gitignore file missing"
    fi
    
    # Dependency security validation
    echo "🔐 Analyzing dependency security..."
    
    case "$(detect_enhanced_project_type "$project_path")" in
        "nodejs")
            if [[ -f "$project_path/package-lock.json" ]]; then
                ((security_score++))
                security_findings["dependency_lock"]="✅ Package lock file prevents dependency confusion"
            fi
            ;;
        "python")
            if [[ -f "$project_path/requirements.txt" ]]; then
                # Check for pinned versions
                pinned_deps=$(grep -c "==" "$project_path/requirements.txt" 2>/dev/null || echo "0")
                total_deps=$(wc -l < "$project_path/requirements.txt" 2>/dev/null || echo "0")
                if [[ $total_deps -gt 0 ]]; then
                    pin_percentage=$((pinned_deps * 100 / total_deps))
                    if [[ $pin_percentage -ge 70 ]]; then
                        ((security_score++))
                        security_findings["pinned_dependencies"]="✅ Well-pinned dependencies ($pin_percentage%)"
                    else
                        security_findings["pinned_dependencies"]="⚠️ Loosely pinned dependencies ($pin_percentage%)"
                    fi
                fi
            fi
            ;;
    esac
    
    # Secret detection
    echo "🕵️ Scanning for potential secrets..."
    
    secret_patterns=("password" "secret" "token" "api[_-]?key" "private[_-]?key")
    potential_secrets=0
    
    for pattern in "${secret_patterns[@]}"; do
        found_secrets=$(grep -ri "$pattern" "$project_path" --exclude-dir=.git --exclude-dir=node_modules 2>/dev/null | head -3)
        if [[ -n "$found_secrets" ]]; then
            ((potential_secrets++))
        fi
    done
    
    if [[ $potential_secrets -eq 0 ]]; then
        ((security_score++))
        security_findings["secret_detection"]="✅ No obvious secrets detected"
    else
        security_findings["secret_detection"]="⚠️ Potential secrets detected - review required"
    fi
    
    # Security configuration files
    security_configs=(".security.yml" "security.md" ".nvmrc" ".python-version")
    for config in "${security_configs[@]}"; do
        if [[ -f "$project_path/$config" ]]; then
            ((security_score++))
            security_findings["security_config"]="✅ Security configuration found: $config"
            break
        fi
    done
    
    # Generate security report
    echo ""
    echo "🔒 Security Assessment Report"
    echo "============================"
    echo "Security Score: $security_score/10"
    
    if [[ $security_score -ge 8 ]]; then
        echo "🟢 Excellent security posture"
        security_level="excellent"
    elif [[ $security_score -ge 6 ]]; then
        echo "🟡 Good security posture"
        security_level="good"
    elif [[ $security_score -ge 4 ]]; then
        echo "🟠 Fair security posture"
        security_level="fair"
    else
        echo "🔴 Poor security posture - immediate attention required"
        security_level="poor"
    fi
    
    echo ""
    echo "🔍 Security Findings:"
    for finding in "${!security_findings[@]}"; do
        echo "  ${security_findings[$finding]}"
    done
    
    /error-handler "info" "Security validation completed: $security_level posture"
    
    case "$security_level" in
        "excellent") exit 0 ;;
        "good") exit 1 ;;
        "fair") exit 2 ;;
        "poor") exit 3 ;;
    esac
fi
```

### Architecture Analysis
```bash
# Architecture analysis
if [[ "$validation_scope" == "architecture" ]]; then
    
    /error-handler "info" "Starting architecture analysis: $project_path"
    
    echo "🏗️ Architecture Analysis"
    echo "======================="
    
    # Project type detection with enhanced analysis
    project_type=$(detect_enhanced_project_type "$project_path")
    echo "📋 Project Type: $project_type"
    
    # Language-specific architecture analysis
    case "$project_type" in
        "nodejs")
            analyze_nodejs_architecture "$project_path"
            ;;
        "python")
            analyze_python_architecture "$project_path"
            ;;
        "golang")
            analyze_golang_architecture "$project_path"
            ;;
        "rust")
            analyze_rust_architecture "$project_path"
            ;;
        *)
            analyze_generic_architecture "$project_path"
            ;;
    esac
    
    /error-handler "info" "Architecture analysis completed"
fi
```

### Enterprise Compliance Validation
```bash
# Enterprise compliance validation
if [[ "$validation_scope" == "compliance" ]]; then
    
    /error-handler "info" "Starting enterprise compliance validation: $project_path"
    
    echo "🏢 Enterprise Compliance Validation"
    echo "=================================="
    
    compliance_score=0
    declare -A compliance_findings
    
    # License compliance
    echo "📜 License Compliance..."
    
    license_files=("LICENSE" "LICENSE.txt" "LICENSE.md" "COPYING" "COPYRIGHT")
    for file in "${license_files[@]}"; do
        if [[ -f "$project_path/$file" ]]; then
            ((compliance_score++))
            compliance_findings["license"]="✅ License file found: $file"
            break
        fi
    done
    
    # Documentation compliance
    echo "📚 Documentation Compliance..."
    
    required_docs=("README.md" "CHANGELOG.md" "CONTRIBUTING.md" "CODE_OF_CONDUCT.md")
    docs_found=0
    for doc in "${required_docs[@]}"; do
        if [[ -f "$project_path/$doc" ]]; then
            ((docs_found++))
        fi
    done
    
    if [[ $docs_found -ge 3 ]]; then
        ((compliance_score++))
        compliance_findings["documentation"]="✅ Comprehensive documentation ($docs_found/4 files)"
    elif [[ $docs_found -ge 1 ]]; then
        compliance_findings["documentation"]="⚠️ Basic documentation ($docs_found/4 files)"
    else
        compliance_findings["documentation"]="❌ Missing documentation"
    fi
    
    # Security compliance
    echo "🔒 Security Compliance..."
    
    if [[ -f "$project_path/.gitignore" ]]; then
        ((compliance_score++))
        compliance_findings["security_basic"]="✅ Basic security measures (.gitignore)"
    fi
    
    # CI/CD compliance
    echo "🔄 CI/CD Compliance..."
    
    ci_files=(".github/workflows" ".gitlab-ci.yml" ".travis.yml" "Jenkinsfile")
    for ci_file in "${ci_files[@]}"; do
        if [[ -f "$project_path/$ci_file" || -d "$project_path/$ci_file" ]]; then
            ((compliance_score++))
            compliance_findings["ci_cd"]="✅ CI/CD pipeline configured"
            break
        fi
    done
    
    # Generate compliance report
    echo ""
    echo "🏢 Compliance Assessment Report"
    echo "=============================="
    echo "Compliance Score: $compliance_score/10"
    
    if [[ $compliance_score -ge 8 ]]; then
        echo "🟢 Excellent compliance"
        compliance_level="excellent"
    elif [[ $compliance_score -ge 6 ]]; then
        echo "🟡 Good compliance"
        compliance_level="good"
    elif [[ $compliance_score -ge 4 ]]; then
        echo "🟠 Fair compliance"
        compliance_level="fair"
    else
        echo "🔴 Poor compliance - attention required"
        compliance_level="poor"
    fi
    
    echo ""
    echo "📋 Compliance Findings:"
    for finding in "${!compliance_findings[@]}"; do
        echo "  ${compliance_findings[$finding]}"
    done
    
    /error-handler "info" "Compliance validation completed: $compliance_level level"
    
    case "$compliance_level" in
        "excellent") exit 0 ;;
        "good") exit 1 ;;
        "fair") exit 2 ;;
        "poor") exit 3 ;;
    esac
fi
```

### Report Generation
```bash
# Generate detailed reports
if [[ "$validation_scope" == "report" ]]; then
    format="${ARGS[1]:-text}"
    report_project_path="${ARGS[2]:-.}"
    
    /error-handler "info" "Generating project validation report: $format format"
    
    case "$format" in
        "json")
            generate_json_report "$report_project_path"
            ;;
        "xml")
            generate_xml_report "$report_project_path"
            ;;
        "html")
            generate_html_report "$report_project_path"
            ;;
        "text"|*)
            generate_text_report "$report_project_path"
            ;;
    esac
    
    /error-handler "info" "Report generation completed"
fi
```

## Helper Functions

```bash
# Enhanced project type detection
detect_enhanced_project_type() {
    local project_dir="${1:-.}"
    
    # Multi-language project detection with priority
    if [[ -f "$project_dir/package.json" ]]; then
        echo "nodejs"
    elif [[ -f "$project_dir/requirements.txt" ]] || [[ -f "$project_dir/setup.py" ]] || [[ -f "$project_dir/pyproject.toml" ]]; then
        echo "python"
    elif [[ -f "$project_dir/go.mod" ]]; then
        echo "golang"
    elif [[ -f "$project_dir/Cargo.toml" ]]; then
        echo "rust"
    elif [[ -f "$project_dir/pom.xml" ]] || [[ -f "$project_dir/build.gradle" ]]; then
        echo "java"
    elif [[ -f "$project_dir/composer.json" ]]; then
        echo "php"
    elif [[ -f "$project_dir/Gemfile" ]]; then
        echo "ruby"
    elif [[ -f "$project_dir/mix.exs" ]]; then
        echo "elixir"
    elif [[ -f "$project_dir/pubspec.yaml" ]]; then
        echo "dart"
    elif [[ -f "$project_dir/Makefile" ]]; then
        echo "make"
    elif [[ -d "$project_dir/src" ]]; then
        echo "generic"
    else
        echo "unknown"
    fi
}

# Node.js architecture analysis
analyze_nodejs_architecture() {
    local project_path="$1"
    
    echo "🔧 Node.js Architecture Analysis"
    echo "-------------------------------"
    
    if [[ -f "$project_path/package.json" ]]; then
        # Analyze package.json structure
        if jq -e '.scripts' "$project_path/package.json" >/dev/null 2>&1; then
            script_count=$(jq '.scripts | length' "$project_path/package.json")
            echo "📜 Scripts configured: $script_count"
        fi
        
        if jq -e '.dependencies' "$project_path/package.json" >/dev/null 2>&1; then
            dep_count=$(jq '.dependencies | length' "$project_path/package.json")
            echo "📦 Dependencies: $dep_count"
        fi
        
        if jq -e '.devDependencies' "$project_path/package.json" >/dev/null 2>&1; then
            dev_dep_count=$(jq '.devDependencies | length' "$project_path/package.json")
            echo "🛠️ Dev Dependencies: $dev_dep_count"
        fi
    fi
    
    # Framework detection
    if [[ -f "$project_path/package.json" ]]; then
        if jq -e '.dependencies.react' "$project_path/package.json" >/dev/null 2>&1; then
            echo "⚛️ React application detected"
        elif jq -e '.dependencies.vue' "$project_path/package.json" >/dev/null 2>&1; then
            echo "🟢 Vue.js application detected"
        elif jq -e '.dependencies.angular' "$project_path/package.json" >/dev/null 2>&1; then
            echo "🔺 Angular application detected"
        elif jq -e '.dependencies.express' "$project_path/package.json" >/dev/null 2>&1; then
            echo "🚀 Express.js server detected"
        fi
    fi
}

# Python architecture analysis
analyze_python_architecture() {
    local project_path="$1"
    
    echo "🐍 Python Architecture Analysis"
    echo "------------------------------"
    
    # Virtual environment detection
    if [[ -d "$project_path/venv" ]] || [[ -d "$project_path/.venv" ]]; then
        echo "🌐 Virtual environment detected"
    fi
    
    # Framework detection
    if [[ -f "$project_path/requirements.txt" ]]; then
        if grep -q "django" "$project_path/requirements.txt"; then
            echo "🌐 Django application detected"
        elif grep -q "flask" "$project_path/requirements.txt"; then
            echo "🌶️ Flask application detected"
        elif grep -q "fastapi" "$project_path/requirements.txt"; then
            echo "⚡ FastAPI application detected"
        fi
    fi
    
    # Package structure analysis
    if [[ -f "$project_path/setup.py" ]]; then
        echo "📦 Python package (setup.py) detected"
    elif [[ -f "$project_path/pyproject.toml" ]]; then
        echo "📦 Modern Python package (pyproject.toml) detected"
    fi
}

# Go architecture analysis
analyze_golang_architecture() {
    local project_path="$1"
    
    echo "🐹 Go Architecture Analysis"
    echo "-------------------------"
    
    if [[ -f "$project_path/go.mod" ]]; then
        module_name=$(grep "^module " "$project_path/go.mod" | cut -d' ' -f2-)
        echo "📦 Go module: $module_name"
        
        if [[ -f "$project_path/go.sum" ]]; then
            dep_count=$(wc -l < "$project_path/go.sum")
            echo "📦 Dependencies: $((dep_count / 2)) modules"
        fi
    fi
    
    # Go project structure analysis
    if [[ -d "$project_path/cmd" ]]; then
        echo "🔧 Multi-binary project structure detected"
    fi
    
    if [[ -d "$project_path/internal" ]]; then
        echo "🔒 Internal packages detected"
    fi
    
    if [[ -d "$project_path/pkg" ]]; then
        echo "📦 Public packages detected"
    fi
}

# Generic architecture analysis
analyze_generic_architecture() {
    local project_path="$1"
    
    echo "🔧 Generic Architecture Analysis"
    echo "-------------------------------"
    
    # Directory structure analysis
    total_dirs=$(find "$project_path" -type d | wc -l)
    total_files=$(find "$project_path" -type f | wc -l)
    
    echo "📁 Directory structure: $total_dirs directories, $total_files files"
    
    # File type analysis
    if command -v file >/dev/null 2>&1; then
        echo "📄 File type analysis:"
        find "$project_path" -type f | head -20 | while read -r f; do
            file_type=$(file -b "$f" 2>/dev/null | cut -d',' -f1)
            echo "  $(basename "$f"): $file_type"
        done
    fi
}

# Report generation functions
generate_json_report() {
    local project_path="$1"
    
    # Run all validations and collect results
    structure_result=$(/validate-project structure "$project_path" 2>/dev/null; echo $?)
    security_result=$(/validate-project security "$project_path" 2>/dev/null; echo $?)
    
    # Generate JSON report
    jq -n \
        --arg project_path "$project_path" \
        --arg project_type "$(detect_enhanced_project_type "$project_path")" \
        --arg timestamp "$(date -u +%Y-%m-%dT%H:%M:%S.%3NZ)" \
        --argjson structure_score "$structure_result" \
        --argjson security_score "$security_result" \
        '{
            project_path: $project_path,
            project_type: $project_type,
            timestamp: $timestamp,
            validation_results: {
                structure: {
                    score: $structure_score,
                    status: (if $structure_score <= 1 then "excellent" elif $structure_score <= 2 then "good" else "poor" end)
                },
                security: {
                    score: $security_score,
                    status: (if $security_score <= 1 then "excellent" elif $security_score <= 2 then "good" else "poor" end)
                }
            },
            recommendations: [
                "Regular security audits",
                "Automated testing setup",
                "Documentation updates",
                "Dependency management"
            ]
        }'
}

generate_text_report() {
    local project_path="$1"
    
    echo "PROJECT VALIDATION REPORT"
    echo "========================"
    echo "Generated: $(date)"
    echo "Project: $project_path"
    echo "Type: $(detect_enhanced_project_type "$project_path")"
    echo ""
    
    echo "VALIDATION RESULTS:"
    echo "-------------------"
    /validate-project structure "$project_path"
    echo ""
    /validate-project security "$project_path"
}
```

## Integration Examples

### Error Handling Integration
```bash
# Project validation with comprehensive error handling
/error-handler "info" "Starting project validation workflow"

validation_result=$(/validate-project comprehensive "$PROJECT_PATH")
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Project validation successful: excellent health"
else
    /error-handler "warn" "Project validation completed with recommendations"
fi

/error-handler "info" "Validation report: $validation_result"
```

### Security Scanner Integration
```bash
# Combined project and security validation
project_validation=$(/validate-project security "$PROJECT_PATH")
security_scan=$(/security-scanner "full" "$PROJECT_PATH")

if [[ $project_validation -eq 0 && $security_scan -eq 0 ]]; then
    /error-handler "info" "Complete security validation passed"
else
    /error-handler "error" "Security issues detected in project validation"
fi
```

### Quality Gates Integration
```bash
# Project validation as part of quality gates
project_quality=$(/validate-project comprehensive "$PROJECT_PATH")
code_quality=$(/quality-check "all")

if [[ $project_quality -le 1 && $code_quality -eq 0 ]]; then
    /error-handler "info" "Project meets all quality standards"
else
    /error-handler "warn" "Project quality improvements recommended"
fi
```

**Technical**: Comprehensive project validation with architecture analysis, security assessment, and enterprise compliance checking  
**Simple**: Quality inspector that thoroughly examines your project and tells you exactly what's working and what needs improvement  
**Connection**: Teaches project architecture analysis essential for maintaining large codebases and ensuring enterprise-grade quality standards