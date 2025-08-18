#!/bin/bash
# Technical: Modular test helpers for pattern validation
# Simple: Helper functions that make testing patterns easier
# Connection: Teaches test organization essential for reliable software

# Test counters
PASSED=0
FAILED=0

# Test a single pattern file
test_pattern() {
    local pattern_name="$1"
    local pattern_path="$2"
    local function_name="$3"
    
    if source "$pattern_path" 2>/dev/null; then
        log_info "✅ $pattern_name pattern loads successfully"
        ((PASSED++))
        
        # Test function availability if specified
        if [[ -n "$function_name" ]] && command -v "$function_name" >/dev/null 2>&1; then
            log_info "✅ $pattern_name functions available"
            ((PASSED++))
        elif [[ -n "$function_name" ]]; then
            log_error "❌ $pattern_name functions not available"
            ((FAILED++))
        fi
    else
        log_error "❌ $pattern_name pattern failed to load"
        ((FAILED++))
    fi
}

# Show test results
show_test_results() {
    echo ""
    log_info "📊 Test Results: $PASSED passed, $FAILED failed"
    [ "$FAILED" -eq 0 ] && { log_info "🎉 All pattern tests passed!"; return 0; } || { log_error "💥 Some pattern tests failed"; return 1; }
}

# Initialize test environment
init_tests() {
    PASSED=0
    FAILED=0
    log_info "🧪 Running pattern functionality tests..."
}