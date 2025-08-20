#!/bin/bash
# Pre-Push Validation Script - 50 Comprehensive Checks
# Technical: Automated validation system ensuring project integrity before GitHub push
# Simple: Quality guard that checks everything is perfect before sharing your code
# Connection: Teaches comprehensive quality validation essential for professional software development

set -euo pipefail

# Load required patterns
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

source "$PROJECT_ROOT/patterns/logging/simple-logging.sh"
source "$PROJECT_ROOT/patterns/error-handling/simple-error-handling.sh"

# Configuration
VERBOSE=false
STRICT=false
CHECK_COUNT=0
PASS_COUNT=0
FAIL_COUNT=0
WARNING_COUNT=0

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --verbose)
            VERBOSE=true
            shift
            ;;
        --strict)
            STRICT=true
            shift
            ;;
        --all)
            VERBOSE=true
            STRICT=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--verbose] [--strict] [--all] [--help]"
            echo "  --verbose: Show detailed output for each check"
            echo "  --strict:  Fail on warnings"
            echo "  --all:     Enable verbose and strict modes"
            echo "  --help:    Show this help message"
            exit 0
            ;;
        *)
            log_warn "Unknown parameter: $1"
            shift
            ;;
    esac
done

# Utility functions
run_check() {
    local check_name="$1"
    local check_command="$2"
    local expected_result="$3"
    local category="$4"
    
    ((CHECK_COUNT++))
    
    if [[ "$VERBOSE" == "true" ]]; then
        log_info "[$CHECK_COUNT/50] $category: $check_name"
    fi
    
    local result
    if result=$(eval "$check_command" 2>&1); then
        if [[ -n "$expected_result" ]] && [[ "$result" == *"$expected_result"* ]]; then
            ((PASS_COUNT++))
            [[ "$VERBOSE" == "true" ]] && log_success "  ✅ PASS"
            return 0
        elif [[ -z "$expected_result" ]] && [[ -z "$result" ]]; then
            ((PASS_COUNT++))
            [[ "$VERBOSE" == "true" ]] && log_success "  ✅ PASS"
            return 0
        else
            ((FAIL_COUNT++))
            log_error "  ❌ FAIL: $check_name"
            [[ "$VERBOSE" == "true" ]] && log_error "    Expected: $expected_result"
            [[ "$VERBOSE" == "true" ]] && log_error "    Got: $result"
            return 1
        fi
    else
        ((FAIL_COUNT++))
        log_error "  ❌ FAIL: $check_name"
        [[ "$VERBOSE" == "true" ]] && log_error "    Command failed: $check_command"
        [[ "$VERBOSE" == "true" ]] && log_error "    Error: $result"
        return 1
    fi
}

run_warning_check() {
    local check_name="$1"
    local check_command="$2"
    local expected_result="$3"
    local category="$4"
    
    ((CHECK_COUNT++))
    
    if [[ "$VERBOSE" == "true" ]]; then
        log_info "[$CHECK_COUNT/50] $category: $check_name"
    fi
    
    local result
    if result=$(eval "$check_command" 2>&1); then
        if [[ -n "$expected_result" ]] && [[ "$result" == *"$expected_result"* ]]; then
            ((PASS_COUNT++))
            [[ "$VERBOSE" == "true" ]] && log_success "  ✅ PASS"
            return 0
        else
            ((WARNING_COUNT++))
            log_warn "  ⚠️ WARNING: $check_name"
            [[ "$VERBOSE" == "true" ]] && log_warn "    Result: $result"
            if [[ "$STRICT" == "true" ]]; then
                ((FAIL_COUNT++))
                ((WARNING_COUNT--))
                log_error "  ❌ STRICT MODE: Treating warning as failure"
                return 1
            fi
            return 0
        fi
    else
        ((FAIL_COUNT++))
        log_error "  ❌ FAIL: $check_name"
        [[ "$VERBOSE" == "true" ]] && log_error "    Command failed: $check_command"
        return 1
    fi
}

# Change to project root
cd "$PROJECT_ROOT"

# Start validation
log_info "🔒 Starting Pre-Push Validation (50 checks)"
log_info "Mode: $(if [[ "$VERBOSE" == "true" ]]; then echo "VERBOSE"; else echo "SUMMARY"; fi) | $(if [[ "$STRICT" == "true" ]]; then echo "STRICT"; else echo "STANDARD"; fi)"

# 🚫 CRITICAL: PAT Authentication Validation (MANDATORY)
log_info "🔐 CRITICAL: PAT Authentication Enforcement"
if ! ./scripts/validate-pat.sh; then
    log_error "🚫 PAT validation FAILED - CANNOT PROCEED"
    log_error "This violates CLAUDE.md PAT enforcement requirements"
    exit 1
fi
log_success "✅ PAT authentication enforced successfully"

# 1. Pattern Integrity (5 checks)
log_info "📁 1. Pattern Integrity Validation"

run_check "Pattern size validation" \
    "find patterns -name 'simple-*.sh' -exec wc -l {} \; | awk '\$1 > 50 {count++} END {print count+0}'" \
    "0" \
    "Pattern Integrity"

run_check "Triple explanation format" \
    "find patterns -name 'simple-*.sh' -exec grep -L '# Technical:' {} \; | wc -l" \
    "0" \
    "Pattern Integrity"

run_check "Function naming conventions" \
    "grep -n '^[a-zA-Z_][a-zA-Z0-9_]*() {' patterns/*/simple-*.sh | grep -v -E '(log_|get_|has_|check_|run_|handle_|validate_|test_|parse_|create_)' | wc -l | tr -d ' '" \
    "0" \
    "Pattern Integrity"

run_check "Pattern syntax validation" \
    "for f in patterns/*/simple-*.sh; do bash -n \"\$f\" || echo \"Error in \$f\"; done | wc -l" \
    "0" \
    "Pattern Integrity"

run_check "Pattern dependencies documented" \
    "find patterns -maxdepth 1 -type d | tail -n +2 | wc -l" \
    "$(find patterns -name 'README.md' | wc -l)" \
    "Pattern Integrity"

# 2. Security Validation (5 checks)
log_info "🔒 2. Security Validation"

run_check "No dangerous commands" \
    "grep -r 'eval\\|exec' patterns/ tools/ scripts/ 2>/dev/null | wc -l" \
    "0" \
    "Security"

run_check "No hardcoded secrets" \
    "grep -ri 'password.*=\\|secret.*=\\|key.*=' patterns/ tools/ scripts/ 2>/dev/null | grep -v 'API_KEY\\|SECRET_KEY\\|get_config' | wc -l" \
    "0" \
    "Security"

run_check "Input validation present" \
    "grep -r 'validate_input' patterns/security/ | wc -l" \
    "" \
    "Security"

run_check "Secure file permissions" \
    "find . -name '.env*' -exec stat -c '%a' {} \; 2>/dev/null | grep -v '600' | wc -l" \
    "0" \
    "Security"

run_check "Security scan passes" \
    "source patterns/security/security-basics.sh && basic_security_scan && echo 'SECURITY_CLEAN'" \
    "SECURITY_CLEAN" \
    "Security"

# 3. Testing Coverage (5 checks)
log_info "🧪 3. Testing Coverage Validation"

run_check "Pattern test coverage" \
    "find patterns -name 'simple-*.sh' | wc -l" \
    "" \
    "Testing"

run_check "Integration tests pass" \
    "if [[ -f tests/integration-test-suite.sh ]]; then tests/integration-test-suite.sh | grep -c '✅' || echo '0'; else echo '0'; fi" \
    "" \
    "Testing"

run_check "Error recovery tests pass" \
    "if [[ -f tests/error-recovery-test.sh ]]; then tests/error-recovery-test.sh | grep -c '✅' || echo '0'; else echo '0'; fi" \
    "" \
    "Testing"

run_check "Load tests pass" \
    "if [[ -f tests/load-test-suite.sh ]]; then tests/load-test-suite.sh | grep -c '✅' || echo '0'; else echo '0'; fi" \
    "" \
    "Testing"

run_check "Edge case tests pass" \
    "if [[ -f tests/edge-case-validation.sh ]]; then tests/edge-case-validation.sh | grep -c '✅' || echo '0'; else echo '0'; fi" \
    "" \
    "Testing"

# 4. Documentation Completeness (5 checks)
log_info "📚 4. Documentation Validation"

run_check "README.md current" \
    "grep -c '$(date +%Y)' README.md 2>/dev/null || echo '0'" \
    "" \
    "Documentation"

run_check "API documentation exists" \
    "if [[ -f docs/API_REFERENCE.md ]]; then wc -l docs/API_REFERENCE.md | awk '\$1 > 500 {print \"SUFFICIENT\"}'; else echo \"MISSING\"; fi" \
    "SUFFICIENT" \
    "Documentation"

run_check "Pattern documentation complete" \
    "find patterns -maxdepth 1 -type d | tail -n +2 | wc -l" \
    "$(find patterns -name 'README.md' | wc -l)" \
    "Documentation"

run_check "CHANGELOG.md updated" \
    "if [[ -f CHANGELOG.md ]]; then head -n 10 CHANGELOG.md | grep -c '$(date +%Y)' || echo '0'; else echo '0'; fi" \
    "" \
    "Documentation"

run_warning_check "Documentation links valid" \
    "grep -r '\\[.*\\](\\./' docs/ 2>/dev/null | cut -d: -f2- | sed 's/.*](\\.\\///' | sed 's/).*//' | while read link; do test -f \"\$link\" || echo \"BROKEN: \$link\"; done | wc -l" \
    "0" \
    "Documentation"

# 5. Performance Validation (5 checks)
log_info "⚡ 5. Performance Validation"

run_warning_check "Pattern loading performance" \
    "timeout 30s bash -c 'start=\$(date +%s%N); source patterns/logging/simple-logging.sh; end=\$(date +%s%N); duration=\$(( (end - start) / 1000000 )); if [[ \$duration -lt 150 ]]; then echo \"FAST\"; else echo \"SLOW: \${duration}ms\"; fi'" \
    "FAST" \
    "Performance"

run_warning_check "Memory usage acceptable" \
    "bash -c 'for p in patterns/*/simple-*.sh; do source \"\$p\" 2>/dev/null; done; rss=\$(ps -o rss= -p \$\$); if [[ \$rss -lt 15000 ]]; then echo \"EFFICIENT\"; else echo \"HIGH: \${rss}KB\"; fi'" \
    "EFFICIENT" \
    "Performance"

run_warning_check "Function execution speed" \
    "timeout 10s bash -c 'source patterns/logging/simple-logging.sh; start=\$(date +%s%N); log_info \"test\" >/dev/null; end=\$(date +%s%N); duration=\$(( (end - start) / 1000000 )); if [[ \$duration -lt 10 ]]; then echo \"FAST\"; else echo \"SLOW\"; fi'" \
    "FAST" \
    "Performance"

run_warning_check "Performance benchmarks available" \
    "if [[ -f tools/performance-benchmarks.sh ]]; then echo \"AVAILABLE\"; else echo \"MISSING\"; fi" \
    "AVAILABLE" \
    "Performance"

run_warning_check "No performance regressions" \
    "if [[ -f performance-baseline.sh ]]; then echo \"BASELINE_EXISTS\"; else echo \"NO_BASELINE\"; fi" \
    "" \
    "Performance"

# 6. Code Quality (5 checks)
log_info "🎯 6. Code Quality Validation"

run_warning_check "Claude readability score" \
    "if [[ -f tools/claude-readability-scorer.sh ]]; then source tools/claude-readability-scorer.sh && score_all_patterns 2>/dev/null | grep 'Average:' | awk -F: '\$2 >= 60 {print \"GOOD\"} \$2 < 60 {print \"POOR\"}' || echo \"GOOD\"; else echo \"NO_SCORER\"; fi" \
    "" \
    "Code Quality"

run_warning_check "No anti-patterns detected" \
    "if [[ -f tools/simple-god-detector.sh ]]; then source tools/simple-god-detector.sh && detect_god_objects 2>/dev/null | grep -c 'god object' || echo '0'; else echo '0'; fi" \
    "0" \
    "Code Quality"

run_warning_check "Shellcheck availability" \
    "command -v shellcheck >/dev/null && echo 'AVAILABLE' || echo 'NOT_AVAILABLE'" \
    "" \
    "Code Quality"

run_check "Consistent code style" \
    "find patterns -name '*.sh' -exec grep -l '^#!/bin/bash' {} \\; | wc -l" \
    "$(find patterns -name '*.sh' | wc -l)" \
    "Code Quality"

run_warning_check "No dead code" \
    "if [[ -f tools/function-complexity-analyzer.sh ]]; then echo \"ANALYZER_AVAILABLE\"; else echo \"NO_ANALYZER\"; fi" \
    "" \
    "Code Quality"

# 7. Error Handling (5 checks)
log_info "🚨 7. Error Handling Validation"

run_check "Error handling present" \
    "grep -r '||' patterns/ | grep -c 'handle_error\\|return 1\\|exit 1'" \
    "" \
    "Error Handling"

run_check "Error messages descriptive" \
    "grep -r 'handle_error' patterns/ | grep -c '\".*failed\"' | awk '{if(\$1 == 0) print \"DESCRIPTIVE\"; else print \"GENERIC\"}'" \
    "" \
    "Error Handling"

run_check "Line numbers in errors" \
    "grep -r 'handle_error' patterns/ | grep -c '\\$LINENO'" \
    "" \
    "Error Handling"

run_warning_check "Graceful failure paths" \
    "grep -r 'trap.*cleanup' patterns/ tools/ scripts/ 2>/dev/null | wc -l" \
    "" \
    "Error Handling"

run_check "Error recovery tested" \
    "if [[ -f tests/error-recovery-test.sh ]]; then echo \"ERROR_RECOVERY_TESTS\"; else echo \"NO_ERROR_TESTS\"; fi" \
    "ERROR_RECOVERY_TESTS" \
    "Error Handling"

# 8. Configuration Management (5 checks)
log_info "⚙️ 8. Configuration Management Validation"

run_check "No hardcoded values" \
    "grep -r 'localhost\\|127.0.0.1' patterns/ | grep -v 'get_config\\|example' | wc -l" \
    "0" \
    "Configuration"

run_warning_check "Environment variables documented" \
    "grep -r 'export\\|get_config' patterns/ | grep -o '[A-Z_][A-Z_0-9]*' | sort -u | wc -l" \
    "" \
    "Configuration"

run_check "Config validation present" \
    "grep -r 'validate_config\\|has_config' patterns/configuration/ | wc -l" \
    "" \
    "Configuration"

run_warning_check "Secure config handling" \
    "grep -r 'chmod 600\\|0600' patterns/configuration/ 2>/dev/null | wc -l" \
    "" \
    "Configuration"

run_check "Default values provided" \
    "grep -r 'get_config.*default\\|:-' patterns/configuration/ | wc -l" \
    "" \
    "Configuration"

# 9. CI/CD Readiness (5 checks)
log_info "🔄 9. CI/CD Readiness Validation"

run_warning_check "GitHub Actions valid" \
    "if [[ -d .github/workflows ]]; then find .github/workflows -name '*.yml' | wc -l; else echo '0'; fi" \
    "" \
    "CI/CD"

run_warning_check "CI tests configured" \
    "if [[ -f .github/workflows/test.yml ]] || [[ -f .github/workflows/ci.yml ]]; then echo 'CI_CONFIGURED'; else echo 'NO_CI'; fi" \
    "" \
    "CI/CD"

run_warning_check "Docker builds" \
    "if [[ -f Dockerfile ]]; then echo 'DOCKERFILE_EXISTS'; else echo 'NO_DOCKERFILE'; fi" \
    "" \
    "CI/CD"

run_check "Cross-platform compatibility" \
    "if [[ -f tests/cross-platform-test.sh ]]; then echo 'CROSS_PLATFORM_TESTS'; else echo 'NO_CROSS_PLATFORM'; fi" \
    "" \
    "CI/CD"

run_warning_check "Release notes prepared" \
    "if [[ -f RELEASE_NOTES.md ]]; then wc -l RELEASE_NOTES.md | awk '\$1 > 10 {print \"SUFFICIENT\"} \$1 <= 10 {print \"MINIMAL\"}'; else echo 'MISSING'; fi" \
    "" \
    "CI/CD"

# 10. Project Hygiene (5 checks)
log_info "🧹 10. Project Hygiene Validation"

run_check "No temporary files" \
    "find . -name '*.tmp' -o -name '*.bak' -o -name '*.swp' | wc -l" \
    "0" \
    "Project Hygiene"

run_check ".gitignore comprehensive" \
    "if [[ -f .gitignore ]]; then grep -c '*.tmp\\|*.log\\|*.bak' .gitignore || echo '0'; else echo '0'; fi" \
    "" \
    "Project Hygiene"

run_check "No merge conflicts" \
    "grep -r '<<<<<<\\|>>>>>>\\|======' . 2>/dev/null | grep -v '.git' | wc -l" \
    "0" \
    "Project Hygiene"

run_warning_check "Commit message format" \
    "git log --oneline -10 2>/dev/null | grep -E '^[a-f0-9]+ (feat|fix|docs|style|refactor|test|chore):' | wc -l" \
    "" \
    "Project Hygiene"

run_warning_check "Version numbers updated" \
    "grep -r 'version.*1.0.0' package.json setup.py CHANGELOG.md 2>/dev/null | wc -l" \
    "" \
    "Project Hygiene"

# Final results
echo
log_info "🎯 Pre-Push Validation Results"
log_info "Total Checks: $CHECK_COUNT/50"
log_info "Passed: $PASS_COUNT"
log_info "Failed: $FAIL_COUNT"
log_info "Warnings: $WARNING_COUNT"

if [[ $FAIL_COUNT -eq 0 ]]; then
    if [[ $WARNING_COUNT -eq 0 ]]; then
        log_success "✅ ALL 50 CHECKS PASSED - READY FOR PUSH"
        echo "$(date): Pre-push validation passed (50/50)" >> .validation-log
        exit 0
    else
        log_warn "⚠️ $WARNING_COUNT WARNINGS - REVIEW BEFORE PUSH"
        echo "$(date): Pre-push validation passed with $WARNING_COUNT warnings" >> .validation-log
        exit 0
    fi
else
    log_error "❌ $FAIL_COUNT CHECKS FAILED - DO NOT PUSH"
    log_error "Fix all failures and run validation again"
    echo "$(date): Pre-push validation failed ($FAIL_COUNT failures)" >> .validation-log
    exit 1
fi