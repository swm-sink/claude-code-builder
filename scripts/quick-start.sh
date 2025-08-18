#!/bin/bash
# Technical: Quick-start script for Claude Code Builder pattern initialization
# Simple: Fast setup script that gets you started with patterns quickly
# Connection: Teaches project initialization essential for development workflows

set -e

# Load helper modules
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/setup-helpers.sh" 2>/dev/null
source "$SCRIPT_DIR/pattern-demo.sh" 2>/dev/null

# Main setup workflow
main() {
    # Parse command line arguments
    parse_setup_args "$@"
    
    # Check system requirements
    check_requirements || exit 1
    
    # Validate project structure
    validate_project || exit 1
    
    # Run demo if needed
    run_demo_if_needed "$PROJECT_DIR" "$TEST_MODE"
    
    return 0
}

# Run main workflow
main "$@"