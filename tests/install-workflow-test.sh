#!/bin/bash
# Technical: Comprehensive install workflow testing with collision and error scenarios
# Simple: Tests that verify the install script works correctly in all situations
# Connection: Teaches integration testing essential for reliable user onboarding

set -e

# Source helpers
source ./patterns/error-handling/simple-error-handling.sh 2>/dev/null || {
    echo "[INFO] Running install workflow tests (basic mode)"
}

# Test configuration
TEST_DIR="/tmp/claude-code-builder-install-test-$$"
ORIGINAL_DIR="$PWD"
PASSED=0
FAILED=0

# Clean test environment
cleanup() {
    rm -rf "$TEST_DIR" 2>/dev/null || true
}
trap cleanup EXIT

# Test install script validation
test_install_script_validation() {
    log_info "🧪 Testing install script git dependency validation..."
    
    # Create mock install script without git requirement
    mkdir -p "$TEST_DIR"
    cp scripts/install.sh "$TEST_DIR/install.sh"
    
    # Mock git command missing
    sed -i.bak 's/command -v git/command -v nonexistent-command/' "$TEST_DIR/install.sh"
    
    cd "$TEST_DIR"
    if ./install.sh 2>&1 | grep -q "Git is required"; then
        log_info "✅ Git dependency validation works"
        ((PASSED++))
    else
        log_error "❌ Git dependency validation failed"
        ((FAILED++))
    fi
    cd - >/dev/null
}

# Test collision detection
test_collision_detection() {
    log_info "🧪 Testing directory collision detection..."
    
    mkdir -p "$TEST_DIR/existing"
    cd "$TEST_DIR/existing"
    
    # Create fake existing directory
    mkdir claude-code-builder
    echo "user data" > claude-code-builder/important-file.txt
    
    # Test collision detection  
    cp "$ORIGINAL_DIR/scripts/install.sh" ./install.sh
    sed -i.bak 's|git clone.*|echo "fake clone"# &|' ./install.sh
    
    if ./install.sh 2>&1 | grep -q "exists but doesn't contain Claude Code Builder"; then
        log_info "✅ Collision detection works"
        ((PASSED++))
    else
        log_error "❌ Collision detection failed"
        ((FAILED++))
    fi
    cd - >/dev/null
}

# Test successful installation
test_successful_installation() {
    log_info "🧪 Testing successful installation workflow..."
    
    mkdir -p "$TEST_DIR/success"
    cd "$TEST_DIR/success"
    
    # Copy and modify install script for local testing
    cp "$ORIGINAL_DIR/scripts/install.sh" ./install.sh  
    sed -i.bak 's|git clone "$REPO_URL" "$INSTALL_DIR"|cp -r '"$ORIGINAL_DIR"' "$INSTALL_DIR"|' ./install.sh
    
    if ./install.sh 2>&1 | grep -q "Installation complete"; then
        log_info "✅ Successful installation works"
        ((PASSED++))
        
        # Test that patterns are available after install
        if [ -d "claude-code-builder/patterns" ]; then
            log_info "✅ Patterns directory created"
            ((PASSED++))
        else
            log_error "❌ Patterns directory missing"
            ((FAILED++))
        fi
        
        # Test quick-start after install
        if ./claude-code-builder/scripts/quick-start.sh 2>&1 | grep -q "Quick start complete"; then
            log_info "✅ Quick-start works after install"
            ((PASSED++))
        else
            log_error "❌ Quick-start failed after install"
            ((FAILED++))
        fi
    else
        log_error "❌ Installation failed"
        ((FAILED++))
    fi
    cd - >/dev/null
}

# Main test execution
main() {
    log_info "🚀 Starting install workflow tests..."
    
    test_install_script_validation
    test_collision_detection
    test_successful_installation
    
    echo ""
    log_info "📊 Install Test Results: $PASSED passed, $FAILED failed"
    
    if [ "$FAILED" -eq 0 ]; then
        log_info "🎉 All install workflow tests passed!"
        return 0
    else
        log_error "💥 Some install workflow tests failed"
        return 1
    fi
}

# Execute tests
main "$@"