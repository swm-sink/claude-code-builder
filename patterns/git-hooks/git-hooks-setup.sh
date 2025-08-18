#!/bin/bash
# Technical: Git hooks installation and management with pre-commit, pre-push validation and easy configuration
# Simple: Assistant that automatically sets up quality checks to run every time you commit or push code
# Connection: Teaches Git automation essential for maintaining code quality and CI/CD integration

# Install basic pre-commit hook
install_pre_commit_hook() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || { echo "❌ Not a git repository"; return 1; }
    echo '#!/bin/bash
echo "🔍 Running pre-commit validation..."
git diff --cached | grep -E "^(\+|\-){7}|^>{7}|^<{7}" && echo "❌ Merge conflict markers" && exit 1
git diff --cached --name-only | while read -r file; do [[ -f "$file" && $(wc -c < "$file") -gt 1048576 ]] && echo "⚠️ Large file: $file"; done
echo "✅ Pre-commit checks passed"' > "$git_dir/hooks/pre-commit"
    chmod +x "$git_dir/hooks/pre-commit" && echo "✅ Pre-commit hook installed"
}

# Install basic pre-push hook
install_pre_push_hook() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || { echo "❌ Not a git repository"; return 1; }
    echo '#!/bin/bash
echo "🚀 Running pre-push validation..."
while read -r local_ref local_sha remote_ref remote_sha; do [[ "$remote_ref" =~ (main|master)$ ]] && echo "⚠️ Pushing to: $(basename "$remote_ref")"; done
echo "✅ Pre-push checks passed"' > "$git_dir/hooks/pre-push"
    chmod +x "$git_dir/hooks/pre-push" && echo "✅ Pre-push hook installed"
}

# Setup complete git hooks suite
setup_git_hooks() {
    echo "🔧 Setting up git hooks..."
    install_pre_commit_hook && install_pre_push_hook && echo "✅ Git hooks setup completed"
}

# Check if hooks are installed
has_git_hooks() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    [[ -x "$git_dir/hooks/pre-commit" ]] || [[ -x "$git_dir/hooks/pre-push" ]]
}

# Remove git hooks
remove_git_hooks() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2>/dev/null) || return 1
    rm -f "$git_dir/hooks/pre-commit" "$git_dir/hooks/pre-push" && echo "✅ Git hooks removed"
}