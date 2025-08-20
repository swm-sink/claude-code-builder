#!/bin/bash
# validate-pat.sh - MANDATORY PAT Authentication Validator
# Enforces CLAUDE.md PAT requirements before ANY GitHub operations

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $*"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }

# Validate PAT enforcement
validate_pat_enforcement() {
    echo "🔐 MANDATORY PAT VALIDATION - CLAUDE.md ENFORCEMENT"
    echo "================================================="
    
    # Check 1: .env file exists
    if [[ ! -f ".env" ]]; then
        log_error "🚫 BLOCKING CONDITION: .env file missing"
        log_error "CLAUDE.md VIOLATION: Cannot proceed without PAT authentication"
        log_error "Required: Create .env file with GITHUB_TOKEN=your_pat_here"
        return 1
    fi
    
    # Check 2: .env contains GitHub token
    if ! grep -q "GITHUB_TOKEN" .env; then
        log_error "🚫 BLOCKING CONDITION: GITHUB_TOKEN not found in .env"
        log_error "Required: Add GITHUB_TOKEN=your_pat_here to .env file"
        return 1
    fi
    
    # Check 3: Source .env and verify token
    set -a; source .env; set +a
    if [[ -z "${GITHUB_TOKEN:-}" ]]; then
        log_error "🚫 BLOCKING CONDITION: GITHUB_TOKEN is empty"
        log_error "Required: Set valid PAT token in .env file"
        return 1
    fi
    
    # Check 4: Token format validation
    if [[ ${#GITHUB_TOKEN} -lt 20 ]]; then
        log_error "🚫 BLOCKING CONDITION: GITHUB_TOKEN appears invalid (too short)"
        log_error "Required: Valid GitHub Personal Access Token"
        return 1
    fi
    
    log_success "✅ PAT authentication validated"
    log_success "✅ Using PAT: ${GITHUB_TOKEN:0:8}..."
    log_success "✅ CLAUDE.md PAT enforcement satisfied"
    
    return 0
}

# Configure git to use PAT
configure_git_pat() {
    set -a; source .env; set +a
    git remote set-url origin "https://${GITHUB_TOKEN}@github.com/swm-sink/claude-code-builder.git"
    log_success "✅ Git configured to use PAT authentication"
}

# Main validation
main() {
    if validate_pat_enforcement; then
        configure_git_pat
        log_success "🔐 PAT enforcement complete - GitHub operations authorized"
        return 0
    else
        log_error "🚫 PAT validation FAILED - GitHub operations BLOCKED"
        log_error "Fix .env configuration before proceeding"
        return 1
    fi
}

main "$@"