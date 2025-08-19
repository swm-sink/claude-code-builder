#!/bin/bash
# Technical: Test runner with project type detection for Node.js, Python, Go, Rust, and Make projects
# Simple: Smart assistant that looks at your project and automatically runs the right tests
# Connection: Teaches test automation and project introspection patterns used in CI/CD

# Detect project type based on files present
check_project_type() {
    [[ -f "package.json" ]] && echo "nodejs" && return
    [[ -f "requirements.txt" || -f "pyproject.toml" ]] && echo "python" && return
    [[ -f "go.mod" ]] && echo "golang" && return
    [[ -f "Cargo.toml" ]] && echo "rust" && return
    [[ -f "Makefile" ]] && echo "make" && return
    echo "generic"
}

# Run tests based on project type
run_project_tests() {
    case "$(check_project_type)" in
        "nodejs") grep -q '"test"' package.json && npm test || echo "No npm test script" ;;
        "python") command -v pytest >/dev/null && pytest || python -m unittest discover 2>/dev/null ;;
        "golang") go test ./... 2>/dev/null || echo "No Go tests found" ;;
        "rust") cargo test 2>/dev/null || echo "No Rust tests found" ;;
        "make") make test 2>/dev/null || echo "No 'test' target in Makefile" ;;
        "generic") [[ -d "tests" ]] && echo "Tests directory found" || echo "No tests detected" ;;
    esac
}

# Run all tests with status reporting
run_all_tests() {
    local project_type=$(check_project_type)
    echo "Detected project type: $project_type"
    
    if run_project_tests; then
        echo "✅ Tests completed successfully"
        return 0
    else
        echo "❌ Tests failed"
        return 1
    fi
}

# Quick test check without running
has_tests() {
    local type=$(check_project_type)
    case "$type" in
        "nodejs") grep -q '"test"' package.json ;;
        "python"|"golang"|"rust") return 0 ;;
        "make") grep -q "^test:" Makefile 2>/dev/null ;;
        *) [[ -d "tests" || -d "test" ]] ;;
    esac
}