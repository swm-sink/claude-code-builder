#!/bin/bash
# Technical: Cross-platform compatibility testing for bash features and shell variations
# Simple: Tests that verify the project works on different systems and shell versions
# Connection: Teaches cross-platform development essential for portable software

set -e

# Test configuration
PASSED=0
FAILED=0
TEST_DIR="/tmp/cross-platform-test-$$"

# Clean test environment
cleanup() {
    rm -rf "$TEST_DIR" 2>/dev/null || true
}
trap cleanup EXIT

# Test bash version compatibility
test_bash_version_compatibility() {
    echo "🧪 Testing bash version compatibility..."
    
    local bash_version
    bash_version=$(bash --version | head -1 | grep -o '[0-9]\+\.[0-9]\+')
    echo "📋 Current bash version: $bash_version"
    
    # Test if we meet minimum bash 3.0 requirement
    local major_version minor_version
    major_version=$(echo "$bash_version" | cut -d. -f1)
    minor_version=$(echo "$bash_version" | cut -d. -f2)
    
    if [ "$major_version" -ge 3 ]; then
        echo "✅ Bash version meets minimum requirement (3.0+)"
        ((PASSED++))
    else
        echo "❌ Bash version below minimum requirement"
        ((FAILED++))
    fi
}

# Test bash-specific features used in project
test_bash_specific_features() {
    echo "🧪 Testing bash-specific features..."
    
    # Test [[ ]] syntax compatibility
    if [[ "test" == "test" ]] 2>/dev/null; then
        echo "✅ [[ ]] syntax supported"
        ((PASSED++))
    else
        echo "❌ [[ ]] syntax not supported"
        ((FAILED++))
    fi
    
    # Test regex matching (=~) compatibility
    local test_string="test123"
    if [[ "$test_string" =~ ^test[0-9]+$ ]] 2>/dev/null; then
        echo "✅ Regex matching (=~) supported"
        ((PASSED++))
    else
        echo "❌ Regex matching (=~) not supported"
        ((FAILED++))
    fi
    
    # Test parameter expansion compatibility
    local test_var
    test_var="${NONEXISTENT_VAR:-default_value}"
    if [ "$test_var" = "default_value" ]; then
        echo "✅ Parameter expansion (:-) supported"
        ((PASSED++))
    else
        echo "❌ Parameter expansion (:-) failed"
        ((FAILED++))
    fi
}

# Test essential commands availability
test_command_availability() {
    echo "🧪 Testing essential command availability..."
    
    local essential_commands="grep find sed wc head tail cut"
    
    for cmd in $essential_commands; do
        if command -v "$cmd" >/dev/null 2>&1; then
            echo "✅ Command '$cmd' available"
            ((PASSED++))
        else
            echo "❌ Command '$cmd' not available"
            ((FAILED++))
        fi
    done
}

# Test filesystem compatibility
test_filesystem_compatibility() {
    echo "🧪 Testing filesystem compatibility..."
    
    mkdir -p "$TEST_DIR"
    
    # Test file creation and permissions
    echo "test content" > "$TEST_DIR/test_file.txt"
    if [ -f "$TEST_DIR/test_file.txt" ]; then
        echo "✅ File creation works"
        ((PASSED++))
    else
        echo "❌ File creation failed"
        ((FAILED++))
    fi
    
    # Test chmod operations
    if chmod +x "$TEST_DIR/test_file.txt" 2>/dev/null; then
        echo "✅ chmod operations work"
        ((PASSED++))
    else
        echo "❌ chmod operations failed"
        ((FAILED++))
    fi
    
    # Test directory operations
    mkdir -p "$TEST_DIR/nested/directory/structure"
    if [ -d "$TEST_DIR/nested/directory/structure" ]; then
        echo "✅ Nested directory creation works"
        ((PASSED++))
    else
        echo "❌ Nested directory creation failed"
        ((FAILED++))
    fi
}

# Test key patterns functionality
test_patterns_cross_platform() {
    echo "🧪 Testing pattern cross-platform functionality..."
    
    # Test error handling pattern
    if source ./patterns/error-handling/simple-error-handling.sh 2>/dev/null; then
        echo "✅ Error handling pattern loads"
        ((PASSED++))
        
        # Test logging functions
        if log_info "cross-platform test" 2>&1 | grep -q "cross-platform test"; then
            echo "✅ Logging functions work cross-platform"
            ((PASSED++))
        else
            echo "❌ Logging functions failed"
            ((FAILED++))
        fi
    else
        echo "❌ Error handling pattern failed to load"
        ((FAILED++))
    fi
    
    # Test dependency checker pattern
    if source ./patterns/dependencies/dependency-checker.sh 2>/dev/null; then
        echo "✅ Dependency checker pattern loads"
        ((PASSED++))
        
        # Test project detection
        mkdir -p "$TEST_DIR/test_project"
        echo '{"name": "test"}' > "$TEST_DIR/test_project/package.json"
        
        if [ "$(detect_project_type "$TEST_DIR/test_project")" = "nodejs" ]; then
            echo "✅ Project detection works cross-platform"
            ((PASSED++))
        else
            echo "❌ Project detection failed"
            ((FAILED++))
        fi
    else
        echo "❌ Dependency checker pattern failed to load"
        ((FAILED++))
    fi
}

# Test security features across platforms
test_security_cross_platform() {
    echo "🧪 Testing security features cross-platform..."
    
    if source ./patterns/security/security-basics.sh 2>/dev/null; then
        echo "✅ Security pattern loads"
        ((PASSED++))
        
        # Test security scan
        if basic_security_scan . 2>/dev/null; then
            echo "✅ Security scan runs cross-platform"
            ((PASSED++))
        else
            echo "❌ Security scan failed"
            ((FAILED++))
        fi
    else
        echo "❌ Security pattern failed to load"
        ((FAILED++))
    fi
}

# Main test execution
main() {
    echo "🚀 Starting cross-platform compatibility tests..."
    echo "🖥️  Testing on: $(uname -s) $(uname -m)"
    echo "🐚 Shell: $0 (PID: $$)"
    echo ""
    
    test_bash_version_compatibility
    test_bash_specific_features
    test_command_availability
    test_filesystem_compatibility
    test_patterns_cross_platform
    test_security_cross_platform
    
    echo ""
    echo "📊 Cross-Platform Test Results: $PASSED passed, $FAILED failed"
    echo "🖥️  Platform: $(uname -s) $(uname -m)"
    echo "🐚 Bash: $(bash --version | head -1)"
    
    if [ "$FAILED" -eq 0 ]; then
        echo "🎉 All cross-platform tests passed!"
        echo "✅ Project is compatible with this platform"
        return 0
    else
        echo "💥 Some cross-platform tests failed"
        echo "❌ Platform compatibility issues detected"
        return 1
    fi
}

# Execute tests
main "$@"