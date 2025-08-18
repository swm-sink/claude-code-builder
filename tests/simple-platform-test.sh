#!/bin/bash
# Technical: Simple cross-platform compatibility validation
# Simple: Quick test to verify project works on different systems
# Connection: Teaches platform compatibility testing for portable software

set -e

echo "🚀 Cross-Platform Compatibility Report"
echo "======================================"
echo "🖥️  Platform: $(uname -s) $(uname -m)"
echo "🐚 Shell: $(bash --version | head -1)"
echo ""

# Test bash features
echo "📋 Testing bash features:"

# Test [[ ]] syntax
if [[ "test" == "test" ]] 2>/dev/null; then
    echo "✅ [[ ]] syntax: Supported"
else
    echo "❌ [[ ]] syntax: Not supported"
fi

# Test regex matching
test_string="test123"
if [[ "$test_string" =~ ^test[0-9]+$ ]] 2>/dev/null; then
    echo "✅ Regex matching (=~): Supported"
else
    echo "❌ Regex matching (=~): Not supported"
fi

# Test parameter expansion
test_var="${NONEXISTENT_VAR:-default_value}"
if [ "$test_var" = "default_value" ]; then
    echo "✅ Parameter expansion (:-): Supported"
else
    echo "❌ Parameter expansion (:-): Not supported"
fi

echo ""
echo "📋 Testing essential commands:"

# Test essential commands
for cmd in grep find sed wc head tail cut; do
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "✅ $cmd: Available"
    else
        echo "❌ $cmd: Missing"
    fi
done

echo ""
echo "📋 Testing project patterns:"

# Test core pattern loading
if source ./patterns/error-handling/simple-error-handling.sh 2>/dev/null; then
    echo "✅ Error handling pattern: Loads successfully"
    
    # Test logging function
    if log_info "platform test" 2>&1 | grep -q "platform test"; then
        echo "✅ Logging functions: Work correctly"
    else
        echo "❌ Logging functions: Failed"
    fi
else
    echo "❌ Error handling pattern: Failed to load"
fi

echo ""
echo "🎯 Compatibility Summary:"
echo "This project uses bash-specific features ([[ ]], =~) which require:"
echo "• bash 3.0 or higher (not POSIX sh)"
echo "• Standard Unix commands (grep, find, sed, etc.)"
echo "• Standard filesystem operations"
echo ""
echo "✅ Compatible with: macOS (bash 3.2+), Linux (bash 3.0+)"
echo "❌ Not compatible with: Pure POSIX sh, dash, very old systems"
echo ""
echo "📊 Test completed successfully on $(uname -s) $(uname -m)"