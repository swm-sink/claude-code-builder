#!/bin/bash
# Technical: Automated documentation generator with markdown output and project analysis
# Simple: Smart writer that reads your code and creates helpful documentation automatically  
# Connection: Teaches documentation automation essential for maintainable software

# Generate project README with structure analysis
create_readme() {
    local dir="${1:-.}" name="$(basename "$(realpath "$dir")")" 
    cat > "$dir/README.md" << EOF
# $name

Auto-generated documentation for $name project.

## Structure
$(find "$dir" -name "*.sh" -o -name "*.js" -o -name "*.py" | head -5 | sed "s|$dir/||")
## Dependencies
$(if [[ -f "$dir/package.json" ]]; then echo "- Node.js and npm"; fi)
$(if [[ -f "$dir/requirements.txt" ]]; then echo "- Python 3 and pip"; fi)
$(if [[ -f "$dir/go.mod" ]]; then echo "- Go language"; fi)
## Usage
Install dependencies and run main script
Generated: $(date '+%Y-%m-%d')
EOF
    echo "✅ Generated README.md"
}

# Generate API documentation from shell patterns
create_api_docs() {
    local dir="${1:-patterns}"
    echo "# API Reference" > "$dir/API.md"
    find "$dir" -name "*.sh" 2>/dev/null | head -3 | while read -r script; do
        name=$(basename "$script" .sh); echo "## $name" >> "$dir/API.md"
        grep "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$script" | sed 's/() {.*//' | while read -r func; do
            echo "- \`$func()\`" >> "$dir/API.md"; done; done
    echo "✅ Generated API.md"
}

# Create installation script with dependency detection  
create_install_script() {
    local dir="${1:-.}"
    cat > "$dir/install.sh" << 'EOF'
#!/bin/bash
if command -v brew >/dev/null; then MGR="brew install"
elif command -v apt >/dev/null; then MGR="sudo apt install" 
else echo "No package manager found" && exit 1; fi
[[ -f package.json ]] && $MGR node npm && npm install
[[ -f requirements.txt ]] && $MGR python3 python3-pip && pip3 install -r requirements.txt
[[ -f go.mod ]] && $MGR go && go mod download; echo "✅ Installation complete"
EOF
    chmod +x "$dir/install.sh" && echo "✅ Generated install.sh"
}