#!/bin/bash
# Technical: Multi-language quality validation with linting, formatting, and standards checking
# Simple: Quality inspector that checks different projects and ensures code meets professional standards  
# Connection: Teaches code quality management essential for team collaboration and maintainable codebases

# Detect project type for quality checks
detect_quality_project() {
    [[ -f "package.json" || -f ".eslintrc" ]] && echo "nodejs" && return
    [[ -f "requirements.txt" || -f "pyproject.toml" ]] && echo "python" && return
    [[ -f "go.mod" ]] && echo "golang" && return
    [[ -f "Cargo.toml" ]] && echo "rust" && return
    echo "generic"
}

# Run language-specific quality checks
run_language_quality() {
    case "$(detect_quality_project)" in
        "nodejs") command -v eslint >/dev/null && eslint . || echo "ESLint not available" ;;
        "python") command -v flake8 >/dev/null && flake8 . || echo "flake8 not available" ;;
        "golang") go fmt -l . 2>/dev/null | grep -q . && echo "Code needs formatting" || echo "Go format OK" ;;
        "rust") command -v rustfmt >/dev/null && cargo fmt --check || echo "rustfmt not available" ;;
        "generic") [[ -f ".editorconfig" ]] && echo "EditorConfig found" || echo "No quality config" ;;
    esac
}

# Check for common quality issues  
check_common_issues() {
    local extensions="*.sh *.js *.py *.go *.rs *.md"
    
    # Check trailing whitespace
    find . \( -name "*.sh" -o -name "*.js" -o -name "*.py" \) 2>/dev/null | \
    head -10 | xargs grep -l "[[:space:]]$" 2>/dev/null && echo "⚠️ Trailing whitespace found"
    
    # Check large files
    find . \( -name "*.sh" -o -name "*.js" -o -name "*.py" \) 2>/dev/null | \
    head -10 | xargs wc -l 2>/dev/null | awk '$1 > 300 {print "⚠️ Large file: " $2}' | head -3
}

# Main quality check function
run_quality_checks() {
    local project_type=$(detect_quality_project)
    echo "Running quality checks for: $project_type"
    
    run_language_quality
    check_common_issues
    
    echo "✅ Quality checks completed"
    return 0
}