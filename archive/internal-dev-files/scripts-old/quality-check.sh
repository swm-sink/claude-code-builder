#!/bin/bash

# Simple Quality Check for Claude Code Projects
# Adapt this script for your specific project type

# Basic error handling
set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${GREEN}✓${NC} $1"; }
log_warn() { echo -e "${YELLOW}⚠${NC} $1"; }
log_error() { echo -e "${RED}✗${NC} $1"; }

echo "Running quality checks..."

# Check 1: Project structure exists
if [ -f "README.md" ]; then
    log_info "README.md exists"
else
    log_warn "No README.md found"
fi

# Check 2: For Node.js projects
if [ -f "package.json" ]; then
    log_info "Node.js project detected"
    
    if command -v npm >/dev/null 2>&1; then
        if npm test; then
            log_info "Tests passed"
        else
            log_error "Tests failed"
            exit 1
        fi
        
        if npm run lint 2>/dev/null; then
            log_info "Linting passed"
        else
            log_warn "No lint script or linting failed"
        fi
    else
        log_warn "npm not found"
    fi
fi

# Check 3: For Python projects  
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    log_info "Python project detected"
    
    if [ -f "test.py" ] || [ -d "tests/" ]; then
        if command -v python3 >/dev/null 2>&1; then
            if python3 -m pytest 2>/dev/null || python3 test.py 2>/dev/null; then
                log_info "Python tests passed"
            else
                log_warn "Python tests failed or not found"
            fi
        fi
    fi
fi

# Check 4: Look for common issues
if grep -r "TODO\|FIXME\|console.log" . --exclude-dir=node_modules --exclude-dir=.git 2>/dev/null | head -5; then
    log_warn "Found TODO/FIXME/debug statements (shown above)"
fi

# Check 5: Git status (if in git repo)
if [ -d ".git" ]; then
    if [ -n "$(git status --porcelain)" ]; then
        log_warn "Uncommitted changes found"
    else
        log_info "Git working directory clean"
    fi
fi

echo ""
log_info "Quality check completed"