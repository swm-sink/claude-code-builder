# Level-1-Dev Dependency Map

## Core Dependencies (Used by Multiple Components)

### 1. error-handling-template.sh
**Used by 10+ files:**
- All security scanning scripts
- All performance monitoring scripts
- Test integration scripts
- Quality gate scripts

**Pattern for Extraction:**
```bash
# Current complex dependency:
source "$SCRIPT_DIR/../templates/error-handling-template.sh"

# Simplified version:
source "$(dirname "$0")/simple-error-handling.sh"
```

### 2. Project Structure Assumptions
**Hard Dependencies:**
- `LEVEL1_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"` 
- `PROJECT_ROOT="$(cd "$LEVEL1_DIR/../.." && pwd)"`
- Assumption of `.claude/level-1-dev/` structure

**Pattern for Extraction:**
```bash
# Current podcast-specific:
PROJECT_ROOT="$(cd "$LEVEL1_DIR/../.." && pwd)"

# Generic pattern:
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
```

### 3. Configuration Files
**Current Dependencies:**
- `security/security-config.yaml`
- `quality/standards.yaml` 
- `quality/metrics.yaml`
- Various report directories

**Pattern for Extraction:**
```bash
# Current complex config:
SECURITY_CONFIG="$SCRIPT_DIR/../security/security-config.yaml"

# Simplified pattern:
CONFIG_FILE="${CONFIG_FILE:-$(pwd)/project-config.yaml}"
```

## Internal Script Dependencies

### Performance Scripts Chain
```
performance-benchmarks.sh
    ↓ called by
performance-baseline-manager.sh
    ↓ called by  
performance-regression-detector.sh
```
**Extraction Strategy:** Break chain, make each script standalone

### Security Scripts Chain
```
security-scanner.sh
dependency-checker.sh    → security-audit.sh (orchestrator)
secret-detector.sh
```
**Extraction Strategy:** Keep simple individual scripts, remove orchestrator

### Quality Gates Chain
```
error-handling-template.sh
    ↓ sourced by
test-quality-gates.sh → generate-quality-report.sh
```
**Extraction Strategy:** Simplify to basic quality check script

## External Tool Dependencies

### Required Tools (Keep)
- `git` - Universal
- `bash` - Universal  
- Basic Unix tools: `grep`, `find`, `cat`, etc.

### Optional Tools (Detect if Available)
- `npm` - Node.js projects
- `python3` - Python projects
- `go` - Go projects
- `docker` - Containerized projects

### Complex Tools (Remove)
- `yq` - YAML parsing (too specialized)
- `jq` - JSON parsing (can use basic alternatives)
- Custom metrics collection tools

## Directory Structure Dependencies

### Current Structure (Podcast-Specific)
```
.claude/level-1-dev/
├── quality/
├── templates/
├── security/
└── tests/
```

### Target Structure (Generic)
```
dev-platform/
├── patterns/     # Reusable patterns
├── scripts/      # Ready-to-use scripts  
├── templates/    # Project templates
└── examples/     # Usage examples
```

## Breaking Dependencies for Extraction

### 1. Remove Complex Error Handling
**Before:** 659-line error-handling-template.sh with stack traces, detailed logging
**After:** 30-line simple-error-handling.sh with basic logging

### 2. Remove Project Structure Assumptions
**Before:** Hard-coded paths to `.claude/level-1-dev/`
**After:** Scripts work in any directory, detect project type

### 3. Remove Configuration Dependencies  
**Before:** Complex YAML configuration files
**After:** Simple environment variables or no config

### 4. Remove Script Chaining
**Before:** Scripts call other scripts in complex chains
**After:** Each script is self-contained

### 5. Make Tool Dependencies Optional
**Before:** Scripts fail if specific tools missing
**After:** Scripts gracefully degrade or skip features

## Standalone Pattern Requirements

Each extracted pattern should:
1. **Work in isolation** - No dependencies on other patterns
2. **Detect project type** - Automatically adapt to environment
3. **Fail gracefully** - Work even if tools missing
4. **Use generic paths** - No hard-coded directory structure
5. **Have minimal config** - Defaults work for most cases

## Example Simplified Dependencies

### Before (Complex)
```bash
# Source complex error handling (659 lines)
source "$SCRIPT_DIR/../templates/error-handling-template.sh"

# Set up complex directory structure
LEVEL1_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_ROOT="$(cd "$LEVEL1_DIR/../.." && pwd)"  
SECURITY_CONFIG="$SCRIPT_DIR/../security/security-config.yaml"

# Initialize complex error handling system
setup_error_handling
```

### After (Simple)
```bash
# Simple error handling (inline)
set -e
log_error() { echo "ERROR: $1" >&2; }

# Generic project detection  
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

# No complex configuration
```

This approach eliminates complex dependencies while maintaining useful functionality.