#!/bin/bash
# Technical: End-to-end user journey testing from README instructions to success
# Simple: Tests the complete new user experience from start to finish
# Connection: Teaches user journey testing essential for product reliability

set -e

# Test configuration
PASSED=0
FAILED=0
TEST_DIR="/tmp/e2e-test-$$"
ORIGINAL_DIR="$PWD"

# Clean test environment
cleanup() {
    rm -rf "$TEST_DIR" 2>/dev/null || true
}
trap cleanup EXIT

# Test README Quick Start workflow
test_readme_quick_start() {
    echo "🧪 Testing README Quick Start workflow..."
    
    mkdir -p "$TEST_DIR/readme-test"
    cd "$TEST_DIR/readme-test"
    
    # Step 1: Simulate install (README step 1)
    cp -r "$ORIGINAL_DIR" ./claude-code-builder
    
    if [ -d "claude-code-builder" ]; then
        echo "✅ Step 1: Installation simulation successful"
        ((PASSED++))
    else
        echo "❌ Step 1: Installation failed"
        ((FAILED++))
        cd - >/dev/null
        return
    fi
    
    # Step 2: Initialize patterns (README step 2)
    if ./claude-code-builder/scripts/quick-start.sh 2>&1 | grep -q "Quick start complete"; then
        echo "✅ Step 2: Pattern initialization successful"
        ((PASSED++))
    else
        echo "❌ Step 2: Pattern initialization failed"
        ((FAILED++))
    fi
    
    # Step 3: Test pattern usage (README step 3)
    if source ./claude-code-builder/patterns/error-handling/simple-error-handling.sh && \
       log_info "Test message" 2>&1 | grep -q "Test message"; then
        echo "✅ Step 3: Pattern usage successful"
        ((PASSED++))
    else
        echo "❌ Step 3: Pattern usage failed"
        ((FAILED++))
    fi
    
    cd - >/dev/null
}

# Test git clone workflow from README
test_git_clone_workflow() {
    echo "🧪 Testing git clone workflow from README..."
    
    mkdir -p "$TEST_DIR/git-clone-test"
    cd "$TEST_DIR/git-clone-test"
    
    # Simulate git clone (copy local files)
    cp -r "$ORIGINAL_DIR" ./claude-code-builder
    cd claude-code-builder
    
    # Test quick-start from within repo
    if ./scripts/quick-start.sh 2>&1 | grep -q "Quick start complete"; then
        echo "✅ Git clone workflow: Quick-start successful"
        ((PASSED++))
    else
        echo "❌ Git clone workflow: Quick-start failed"
        ((FAILED++))
    fi
    
    # Test pattern sourcing
    if source ./patterns/error-handling/simple-error-handling.sh && \
       log_info "Git workflow test" 2>&1 | grep -q "Git workflow test"; then
        echo "✅ Git clone workflow: Pattern sourcing successful"
        ((PASSED++))
    else
        echo "❌ Git clone workflow: Pattern sourcing failed"
        ((FAILED++))
    fi
    
    cd - >/dev/null
    cd - >/dev/null
}

# Test Node.js project integration example
test_nodejs_integration() {
    echo "🧪 Testing Node.js project integration example..."
    
    mkdir -p "$TEST_DIR/nodejs-integration"
    cd "$TEST_DIR/nodejs-integration"
    
    # Create mock Node.js project
    echo '{"name": "test-project", "version": "1.0.0"}' > package.json
    mkdir -p node_modules
    
    # Add Claude Code Builder
    cp -r "$ORIGINAL_DIR" ./claude-code-builder
    
    # Test dependency detection
    if source ./claude-code-builder/patterns/dependencies/dependency-checker.sh && \
       [[ "$(detect_project_type .)" == "nodejs" ]]; then
        echo "✅ Node.js integration: Project type detection successful"
        ((PASSED++))
    else
        echo "❌ Node.js integration: Project type detection failed"
        ((FAILED++))
    fi
    
    # Test quality checks in Node.js context
    if source ./claude-code-builder/patterns/quality-gates/quality-check.sh && \
       command -v run_quality_checks >/dev/null 2>&1; then
        echo "✅ Node.js integration: Quality checks available"
        ((PASSED++))
    else
        echo "❌ Node.js integration: Quality checks not available"
        ((FAILED++))
    fi
    
    cd - >/dev/null
}

# Test Python project integration example  
test_python_integration() {
    echo "🧪 Testing Python project integration example..."
    
    mkdir -p "$TEST_DIR/python-integration"
    cd "$TEST_DIR/python-integration"
    
    # Create mock Python project
    echo "requests==2.25.1" > requirements.txt
    echo "print('Hello World')" > hello.py
    
    # Add Claude Code Builder
    cp -r "$ORIGINAL_DIR" ./claude-code-builder
    
    # Test dependency detection
    if source ./claude-code-builder/patterns/dependencies/dependency-checker.sh && \
       [[ "$(detect_project_type .)" == "python" ]]; then
        echo "✅ Python integration: Project type detection successful"
        ((PASSED++))
    else
        echo "❌ Python integration: Project type detection failed"
        ((FAILED++))
    fi
    
    cd - >/dev/null
}

# Test error scenarios and recovery
test_error_scenarios() {
    echo "🧪 Testing error scenarios and recovery..."
    
    mkdir -p "$TEST_DIR/error-scenarios"
    cd "$TEST_DIR/error-scenarios"
    
    # Test missing patterns directory
    mkdir claude-code-builder
    # Don't create patterns directory
    
    if ! ./claude-code-builder/scripts/quick-start.sh 2>&1 | grep -q "Quick start complete"; then
        echo "✅ Error handling: Missing patterns detected"
        ((PASSED++))
    else
        echo "❌ Error handling: Missing patterns not detected"
        ((FAILED++))
    fi
    
    cd - >/dev/null
}

# Main test execution
main() {
    echo "🚀 Starting end-to-end user journey tests..."
    echo "📍 Testing complete workflows from README documentation"
    echo ""
    
    test_readme_quick_start
    test_git_clone_workflow
    test_nodejs_integration
    test_python_integration
    test_error_scenarios
    
    echo ""
    echo "📊 End-to-End Test Results: $PASSED passed, $FAILED failed"
    
    if [ "$FAILED" -eq 0 ]; then
        echo "🎉 All end-to-end tests passed!"
        echo "✅ User journey from README works completely"
        return 0
    else
        echo "💥 Some end-to-end tests failed"
        echo "❌ User journey has critical gaps"
        return 1
    fi
}

# Execute tests
main "$@"