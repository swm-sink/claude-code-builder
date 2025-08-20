#!/bin/bash
# Technical: Installation script for Claude Code Builder patterns with project detection
# Simple: One-command installer that gets Claude Code Builder working in your project
# Connection: Teaches installation automation essential for developer tools

set -e

# Installation configuration
REPO_URL="https://github.com/smenssink/claude-code-builder.git"
INSTALL_DIR="claude-code-builder"

# Check prerequisites
check_prerequisites() {
    if ! command -v git >/dev/null 2>&1; then
        echo "❌ Git is required but not installed"
        echo "💡 Install git first:"
        echo "   • macOS: brew install git"
        echo "   • Ubuntu/Debian: sudo apt install git"  
        echo "   • CentOS/RHEL: sudo yum install git"
        exit 1
    fi
}

# Installation workflow
main() {
    echo "🚀 Installing Claude Code Builder patterns..."
    
    # Validate prerequisites
    check_prerequisites
    
    # Validate or install Claude Code Builder
    if [ -d "$INSTALL_DIR" ]; then
        # Directory exists - validate it contains Claude Code Builder
        if [ -d "$INSTALL_DIR/patterns" ] && [ -d "$INSTALL_DIR/scripts" ] && [ -f "$INSTALL_DIR/scripts/quick-start.sh" ]; then
            echo "✅ Claude Code Builder already present and valid"
        else
            echo "⚠️  Directory '$INSTALL_DIR' exists but doesn't contain Claude Code Builder"
            echo "💡 Options:"
            echo "   • Move/rename existing directory: mv $INSTALL_DIR ${INSTALL_DIR}-backup"
            echo "   • Remove existing directory: rm -rf $INSTALL_DIR"
            echo "   • Install in different directory: Edit INSTALL_DIR in this script"
            exit 1
        fi
    else
        echo "📥 Downloading Claude Code Builder..."
        git clone "$REPO_URL" "$INSTALL_DIR" >/dev/null 2>&1
        
        if [ $? -eq 0 ]; then
            echo "✅ Download completed"
        else
            echo "❌ Download failed. Possible causes:"
            echo "   • No internet connection"
            echo "   • GitHub is unreachable"
            echo "   • Repository URL changed"
            echo "💡 Try manual install: git clone $REPO_URL"
            exit 1
        fi
    fi
    
    # Set up executable permissions for verified scripts
    echo "🔒 Setting up script permissions..."
    
    # Core executable scripts that need to run
    local core_scripts=(
        "$INSTALL_DIR/scripts/quick-start.sh"
        "$INSTALL_DIR/tools/architectural-dashboard.sh"
        "$INSTALL_DIR/tools/simple-god-detector.sh"
        "$INSTALL_DIR/tools/function-complexity-analyzer.sh"
        "$INSTALL_DIR/tests/simple-pattern-test.sh"
    )
    
    # Make core scripts executable
    for script in "${core_scripts[@]}"; do
        if [ -f "$script" ]; then
            chmod +x "$script" || {
                echo "⚠️  Warning: Could not make $script executable"
            }
        fi
    done
    
    # Pattern files are sourced, not executed, so they don't need +x
    echo "✅ Script permissions configured securely"
    
    echo "🎯 Installation complete!"
    echo ""
    echo "Next steps:"
    echo "1. Run: ./$INSTALL_DIR/scripts/quick-start.sh"
    echo "2. Source patterns: source ./$INSTALL_DIR/patterns/error-handling/simple-error-handling.sh"
    echo "3. Use functions: log_info \"Hello Claude Code Builder!\""
}

# Execute main function
main "$@"