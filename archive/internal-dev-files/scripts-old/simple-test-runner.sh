#!/bin/bash

# Simple Test Runner for Claude Code Projects
# Detects project type and runs appropriate tests

set -e
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }

echo "🧪 Starting test runner..."

tests_run=0
tests_passed=0

# Function to run a test and track results
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    echo ""
    echo "Running: $test_name"
    tests_run=$((tests_run + 1))
    
    if eval "$test_command"; then
        log_info "$test_name passed"
        tests_passed=$((tests_passed + 1))
        return 0
    else
        log_error "$test_name failed"
        return 1
    fi
}

# Node.js project tests
if [ -f "package.json" ]; then
    log_info "Node.js project detected"
    
    if command -v npm >/dev/null 2>&1; then
        run_test "npm test" "npm test"
        
        if npm run lint 2>/dev/null; then
            run_test "npm lint" "npm run lint"
        fi
        
        if npm run build 2>/dev/null; then
            run_test "npm build" "npm run build"
        fi
    else
        log_warn "npm not available"
    fi
fi

# Python project tests
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    log_info "Python project detected"
    
    if command -v python3 >/dev/null 2>&1; then
        # Try different test patterns
        if [ -f "test.py" ]; then
            run_test "python test.py" "python3 test.py"
        elif [ -d "tests/" ]; then
            if command -v pytest >/dev/null 2>&1; then
                run_test "pytest" "python3 -m pytest tests/"
            else
                run_test "python unittest" "python3 -m unittest discover tests/"
            fi
        fi
    else
        log_warn "python3 not available"
    fi
fi

# Generic shell script tests
if ls test*.sh 1> /dev/null 2>&1; then
    log_info "Shell test scripts found"
    for test_file in test*.sh; do
        if [ -x "$test_file" ]; then
            run_test "Shell test: $test_file" "./$test_file"
        fi
    done
fi

# Custom test directory
if [ -d "tests/" ] && [ -z "$(find tests/ -name '*.py' -o -name '*.js')" ]; then
    log_info "Generic tests directory found"
    for test_file in tests/*; do
        if [ -x "$test_file" ]; then
            run_test "Custom test: $(basename $test_file)" "$test_file"
        fi
    done
fi

# Summary
echo ""
echo "📊 Test Summary:"
echo "   Tests run: $tests_run"
echo "   Tests passed: $tests_passed"
echo "   Tests failed: $((tests_run - tests_passed))"

if [ $tests_run -eq 0 ]; then
    log_warn "No tests found to run"
    exit 0
elif [ $tests_passed -eq $tests_run ]; then
    log_info "All tests passed! 🎉"
    exit 0
else
    log_error "Some tests failed"
    exit 1
fi