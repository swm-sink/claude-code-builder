#!/bin/bash
# Technical: Project structure validation with directory analysis, file detection, and project health scoring
# Simple: Quality inspector that looks at your project and tells you if everything is organized properly
# Connection: Teaches project architecture analysis essential for maintaining large codebases and team onboarding

# Validate project structure basics
validate_project_structure() {
    local project_dir="${1:-.}" score=0
    echo "🔍 Validating project structure in: $project_dir"
    [[ -f "$project_dir/README.md" ]] && ((score++)) && echo "✅ README found"
    [[ -d "$project_dir/.git" ]] && ((score++)) && echo "✅ Git repository detected"
    [[ -f "$project_dir/package.json" || -f "$project_dir/requirements.txt" || -f "$project_dir/go.mod" ]] && ((score++)) && echo "✅ Dependencies found"
    [[ -d "$project_dir/src" || -d "$project_dir/lib" ]] && ((score++)) && echo "✅ Source directory found"
    [[ -d "$project_dir/test" || -d "$project_dir/tests" ]] && ((score++)) && echo "✅ Tests found"
    echo "📊 Project health score: $score/5"
    return $((5 - score))
}

# Detect project type based on files
detect_project_architecture() {
    local project_dir="${1:-.}"
    [[ -f "$project_dir/package.json" ]] && echo "nodejs" && return
    [[ -f "$project_dir/requirements.txt" ]] && echo "python" && return
    [[ -f "$project_dir/go.mod" ]] && echo "golang" && return
    [[ -f "$project_dir/Cargo.toml" ]] && echo "rust" && return
    [[ -f "$project_dir/Makefile" ]] && echo "make" && return
    [[ -d "$project_dir/src" ]] && echo "generic" && return
    echo "unknown"
}

# Quick project health check
project_health_check() {
    local project_dir="${1:-.}"
    echo "🏗️ Project type: $(detect_project_architecture "$project_dir")"
    validate_project_structure "$project_dir" >/dev/null
    local health_score=$?
    if [[ $health_score -le 1 ]]; then
        echo "🟢 Excellent project structure"
    elif [[ $health_score -le 3 ]]; then
        echo "🟡 Good project structure"
    else
        echo "🔴 Needs improvement"
    fi
    return $health_score
}

# Check if project has good structure
has_good_structure() {
    project_health_check "$1" >/dev/null; [[ $? -le 3 ]]
}