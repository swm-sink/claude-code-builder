#!/bin/bash
# Technical: Cross-platform dependency detection with project analysis and installation guidance
# Simple: Smart checker that tells you what tools your project needs and how to install them
# Connection: Teaches dependency management essential for portable software development

# Check if command exists in PATH
has_command() { command -v "$1" >/dev/null 2>&1; }

# Detect project type by examining files
detect_project_type() {
    local dir="${1:-.}"
    [[ -f "$dir/package.json" ]] && echo "nodejs" && return
    [[ -f "$dir/requirements.txt" ]] && echo "python" && return  
    [[ -f "$dir/go.mod" ]] && echo "golang" && return
    [[ -f "$dir/Cargo.toml" ]] && echo "rust" && return
    echo "unknown"
}

# Check project dependencies based on type
check_dependencies() {
    local dir="${1:-.}" missing=0 type
    type=$(detect_project_type "$dir")
    echo "🔍 Checking $type project dependencies..."
    case "$type" in
        "nodejs")
            has_command "node" || { echo "❌ Node.js missing"; ((missing++)); }
            has_command "npm" || { echo "❌ npm missing"; ((missing++)); }
            [[ -d "$dir/node_modules" ]] || { echo "⚠️  Run: npm install"; ((missing++)); } ;;
        "python") 
            has_command "python3" || has_command "python" || { echo "❌ Python missing"; ((missing++)); }
            has_command "pip3" || has_command "pip" || { echo "❌ pip missing"; ((missing++)); } ;;
        "golang") has_command "go" || { echo "❌ Go missing"; ((missing++)); } ;;
        "rust")
            has_command "rustc" || { echo "❌ Rust missing"; ((missing++)); }
            has_command "cargo" || { echo "❌ Cargo missing"; ((missing++)); } ;;
    esac
    
    ((missing == 0)) && echo "✅ All dependencies satisfied"
    return $missing
}

# Get installation command for detected project type
get_install_cmd() {
    case "$(detect_project_type "${1:-.}")" in
        "nodejs") echo "brew install node || apt install nodejs npm" ;;
        "python") echo "brew install python || apt install python3 python3-pip" ;;
        "golang") echo "brew install go || apt install golang" ;;
        "rust") echo "curl -sSf https://sh.rustup.rs | sh" ;;
        *) echo "No command available" ;;
    esac
}