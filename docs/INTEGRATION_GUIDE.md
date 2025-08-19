# Claude Code Builder Integration Guide

> Complete guide for integrating Claude Code Builder patterns into existing projects and workflows

## Table of Contents

- [Quick Start Integration](#quick-start-integration)
- [Project Type Integration](#project-type-integration)
- [CI/CD Integration](#cicd-integration)
- [IDE and Editor Integration](#ide-and-editor-integration)
- [Framework-Specific Integration](#framework-specific-integration)
- [Advanced Integration Patterns](#advanced-integration-patterns)
- [Migration Strategies](#migration-strategies)
- [Troubleshooting Integration Issues](#troubleshooting-integration-issues)

---

## Quick Start Integration

### 1. Basic Pattern Loading

**Minimal Integration (2 patterns):**
```bash
#!/bin/bash
# Essential patterns for any script
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

log_info "Script starting"
check_command_exists "git" || handle_error $LINENO "Git is required"
```

**Standard Integration (4 patterns):**
```bash
#!/bin/bash
# Recommended for most projects
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/testing/simple-test-runner.sh

# Use configuration
database_url=$(get_config "DATABASE_URL" ".env" "sqlite://local.db")
log_info "Using database: $database_url"
```

**Full Integration (all patterns):**
```bash
#!/bin/bash
# Complete pattern suite
for pattern in patterns/*/simple-*.sh; do
    [[ -f "$pattern" ]] && source "$pattern"
done

log_info "All patterns loaded successfully"
```

### 2. Installation in Existing Projects

**Method 1: Git Submodule**
```bash
# Add as submodule
git submodule add https://github.com/smenssink/claude-code-builder.git tools/claude-patterns

# Use in your scripts
source tools/claude-patterns/patterns/logging/simple-logging.sh
```

**Method 2: Direct Download**
```bash
# Download patterns directory
curl -L https://github.com/smenssink/claude-code-builder/archive/main.zip -o patterns.zip
unzip patterns.zip "*/patterns/*" -j -d patterns/
```

**Method 3: Package Manager Integration**
```bash
# Using npm (if you have package.json)
npm install --save-dev claude-code-builder

# Using curl with installer
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
```

---

## Project Type Integration

### Node.js Projects

**Integration with package.json:**
```json
{
  "scripts": {
    "setup": "curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash",
    "test": "bash scripts/test.sh",
    "quality": "bash scripts/quality-check.sh",
    "docs": "bash scripts/generate-docs.sh"
  },
  "devDependencies": {
    "claude-code-builder": "latest"
  }
}
```

**Integration script (scripts/test.sh):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/testing/simple-test-runner.sh
source patterns/error-handling/simple-error-handling.sh

log_info "Running Node.js tests with pattern integration"

# Run native npm tests
npm test || handle_error $LINENO "npm tests failed"

# Run additional pattern-based tests
run_all_tests

log_success "All tests completed successfully"
```

### Python Projects

**Integration with setup.py:**
```python
# setup.py
import subprocess
import os

def install_claude_patterns():
    """Install Claude Code Builder patterns"""
    if not os.path.exists('patterns'):
        subprocess.run([
            'curl', '-sSL', 
            'https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh'
        ], shell=True)

# Call during development setup
if 'develop' in sys.argv:
    install_claude_patterns()
```

**Integration script (scripts/python-test.sh):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/project-validation/project-validator.sh

log_info "Python project validation starting"

# Detect Python project
project_type=$(detect_project_type)
[[ "$project_type" == "python" ]] || handle_error $LINENO "Not a Python project"

# Check Python dependencies
if has_config "requirements.txt"; then
    log_info "Installing requirements"
    pip install -r requirements.txt || handle_error $LINENO "Failed to install requirements"
fi

# Run tests
if has_tests; then
    log_info "Running Python tests"
    python -m pytest || handle_error $LINENO "Tests failed"
fi

log_success "Python project validation complete"
```

### Go Projects

**Integration with Makefile:**
```makefile
# Makefile
.PHONY: setup test quality

setup:
	@curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash

test: setup
	@bash scripts/go-test.sh

quality: setup
	@bash scripts/quality-check.sh

build: test quality
	go build ./...
```

**Integration script (scripts/go-test.sh):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/dependencies/dependency-checker.sh

log_info "Go project testing starting"

# Check Go dependencies
check_command_exists "go" || handle_error $LINENO "Go is not installed"

# Run Go tests
log_info "Running Go tests"
go test ./... || handle_error $LINENO "Go tests failed"

# Run Go vet
log_info "Running Go vet"
go vet ./... || handle_error $LINENO "Go vet failed"

log_success "Go project testing complete"
```

### Shell/Bash Projects

**Direct integration in scripts:**
```bash
#!/bin/bash
# Your existing shell script

# Add pattern integration at the top
PATTERN_DIR="${BASH_SOURCE%/*}/patterns"
[[ -d "$PATTERN_DIR" ]] || PATTERN_DIR="./patterns"

source "$PATTERN_DIR/logging/simple-logging.sh"
source "$PATTERN_DIR/error-handling/simple-error-handling.sh"

# Your existing script logic
log_info "Enhanced with Claude Code Builder patterns"

# Replace echo statements with log_info
# Replace error exits with handle_error
```

---

## CI/CD Integration

### GitHub Actions

**Complete workflow (.github/workflows/claude-patterns.yml):**
```yaml
name: Claude Code Builder Integration

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  quality-gates:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Install Claude Code Builder
      run: |
        curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
    
    - name: Run Quality Checks
      run: |
        source patterns/logging/simple-logging.sh
        source patterns/quality-gates/quality-check.sh
        export LOG_COLOR=false
        run_quality_checks
    
    - name: Run Security Scan
      run: |
        source patterns/security/security-basics.sh
        basic_security_scan
    
    - name: Run Tests
      run: |
        source patterns/testing/simple-test-runner.sh
        run_all_tests
    
    - name: Generate Documentation
      run: |
        source patterns/documentation/docs-generator.sh
        generate_docs
    
    - name: Upload Documentation
      uses: actions/upload-artifact@v3
      with:
        name: documentation
        path: docs/
```

### GitLab CI

**GitLab CI configuration (.gitlab-ci.yml):**
```yaml
stages:
  - setup
  - test
  - quality
  - deploy

variables:
  LOG_COLOR: "false"

setup_patterns:
  stage: setup
  script:
    - curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
  artifacts:
    paths:
      - patterns/
    expire_in: 1 hour

quality_gates:
  stage: quality
  dependencies:
    - setup_patterns
  script:
    - source patterns/logging/simple-logging.sh
    - source patterns/quality-gates/quality-check.sh
    - run_quality_checks

security_scan:
  stage: quality
  dependencies:
    - setup_patterns
  script:
    - source patterns/security/security-basics.sh
    - basic_security_scan

run_tests:
  stage: test
  dependencies:
    - setup_patterns
  script:
    - source patterns/testing/simple-test-runner.sh
    - run_all_tests
```

### Jenkins

**Jenkinsfile:**
```groovy
pipeline {
    agent any
    
    environment {
        LOG_COLOR = 'false'
    }
    
    stages {
        stage('Setup Patterns') {
            steps {
                sh '''
                    curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
                '''
            }
        }
        
        stage('Quality Gates') {
            steps {
                sh '''
                    source patterns/logging/simple-logging.sh
                    source patterns/quality-gates/quality-check.sh
                    run_quality_checks
                '''
            }
        }
        
        stage('Security Scan') {
            steps {
                sh '''
                    source patterns/security/security-basics.sh
                    basic_security_scan
                '''
            }
        }
        
        stage('Tests') {
            steps {
                sh '''
                    source patterns/testing/simple-test-runner.sh
                    run_all_tests
                '''
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: 'logs/*.log', allowEmptyArchive: true
        }
    }
}
```

---

## IDE and Editor Integration

### VS Code Integration

**Settings configuration (.vscode/settings.json):**
```json
{
  "shellcheck.enable": true,
  "shellcheck.run": "onType",
  "bash-ide-vscode.shellcheckPath": "/usr/local/bin/shellcheck",
  "files.associations": {
    "*.sh": "shellscript"
  },
  "shellformat.path": "/usr/local/bin/shfmt",
  "editor.formatOnSave": true,
  "terminal.integrated.env.osx": {
    "CLAUDE_PATTERNS_PATH": "${workspaceFolder}/patterns"
  }
}
```

**Tasks configuration (.vscode/tasks.json):**
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Install Claude Patterns",
      "type": "shell",
      "command": "curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash",
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always"
      }
    },
    {
      "label": "Run Quality Checks",
      "type": "shell",
      "command": "source patterns/quality-gates/quality-check.sh && run_quality_checks",
      "group": "test",
      "dependsOn": "Install Claude Patterns"
    },
    {
      "label": "Run Tests",
      "type": "shell",
      "command": "source patterns/testing/simple-test-runner.sh && run_all_tests",
      "group": "test",
      "dependsOn": "Install Claude Patterns"
    }
  ]
}
```

**Code snippets (.vscode/snippets/shellscript.json):**
```json
{
  "Load Claude Patterns": {
    "prefix": "claude-load",
    "body": [
      "# Load Claude Code Builder patterns",
      "source patterns/logging/simple-logging.sh",
      "source patterns/error-handling/simple-error-handling.sh",
      "$0"
    ],
    "description": "Load essential Claude Code Builder patterns"
  },
  "Pattern Log Info": {
    "prefix": "log-info",
    "body": [
      "log_info \"$1\""
    ],
    "description": "Log info message using Claude patterns"
  },
  "Pattern Error Handling": {
    "prefix": "handle-error",
    "body": [
      "$1 || handle_error \\$LINENO \"$2\""
    ],
    "description": "Add error handling using Claude patterns"
  }
}
```

### Vim/Neovim Integration

**Vim configuration (~/.vimrc):**
```vim
" Claude Code Builder integration
function! LoadClaudePatterns()
    :terminal bash -c "source patterns/logging/simple-logging.sh && source patterns/error-handling/simple-error-handling.sh"
endfunction

" Custom mappings
nnoremap <leader>cp :call LoadClaudePatterns()<CR>
nnoremap <leader>cq :terminal bash -c "source patterns/quality-gates/quality-check.sh && run_quality_checks"<CR>
nnoremap <leader>ct :terminal bash -c "source patterns/testing/simple-test-runner.sh && run_all_tests"<CR>

" Snippets for UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "claude-snippets"]
```

### Emacs Integration

**Emacs configuration (init.el):**
```elisp
;; Claude Code Builder integration
(defun claude-load-patterns ()
  "Load Claude Code Builder patterns in shell"
  (interactive)
  (shell-command "source patterns/logging/simple-logging.sh && source patterns/error-handling/simple-error-handling.sh"))

(defun claude-run-quality-checks ()
  "Run Claude Code Builder quality checks"
  (interactive)
  (shell-command "source patterns/quality-gates/quality-check.sh && run_quality_checks"))

;; Key bindings
(global-set-key (kbd "C-c c l") 'claude-load-patterns)
(global-set-key (kbd "C-c c q") 'claude-run-quality-checks)
```

---

## Framework-Specific Integration

### Docker Integration

**Dockerfile with patterns:**
```dockerfile
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code Builder patterns
RUN curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash

# Copy application
COPY . /app
WORKDIR /app

# Use patterns in entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
```

**Docker entrypoint (entrypoint.sh):**
```bash
#!/bin/bash
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

log_info "Container starting with Claude Code Builder patterns"

# Validate environment
check_command_exists "git" || handle_error $LINENO "Git not available in container"

# Run application
exec "$@"
```

### Kubernetes Integration

**Kubernetes ConfigMap:**
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: claude-patterns-config
data:
  setup.sh: |
    #!/bin/bash
    curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
    source patterns/logging/simple-logging.sh
    log_info "Claude patterns loaded in Kubernetes pod"
```

**Pod with patterns:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: app-with-claude-patterns
spec:
  initContainers:
  - name: setup-patterns
    image: curlimages/curl
    command: ['sh', '-c']
    args:
      - curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
    volumeMounts:
    - name: patterns-volume
      mountPath: /patterns
  containers:
  - name: app
    image: your-app:latest
    volumeMounts:
    - name: patterns-volume
      mountPath: /app/patterns
  volumes:
  - name: patterns-volume
    emptyDir: {}
```

### Terraform Integration

**Terraform with patterns:**
```hcl
resource "null_resource" "setup_claude_patterns" {
  provisioner "local-exec" {
    command = "curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash"
  }
}

resource "null_resource" "run_quality_checks" {
  depends_on = [null_resource.setup_claude_patterns]
  
  provisioner "local-exec" {
    command = "source patterns/quality-gates/quality-check.sh && run_quality_checks"
  }
}
```

---

## Advanced Integration Patterns

### Microservices Integration

**Service mesh integration:**
```bash
#!/bin/bash
# microservice-bootstrap.sh

source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh
source patterns/security/security-basics.sh

# Service configuration
service_name=$(get_config "SERVICE_NAME" ".env" "unknown-service")
service_port=$(get_config "SERVICE_PORT" ".env" "8080")

log_info "Starting microservice: $service_name on port $service_port"

# Security validation
basic_security_scan || handle_error $LINENO "Security scan failed"

# Health check endpoint with patterns
health_check() {
    log_info "Health check requested"
    echo "OK"
}

# Start service with pattern integration
start_service() {
    log_info "Service startup complete"
    # Your service logic here
}

# Graceful shutdown with patterns
cleanup() {
    log_info "Shutting down $service_name gracefully"
    exit 0
}

trap cleanup SIGTERM SIGINT

start_service
```

### Event-Driven Integration

**Event handler with patterns:**
```bash
#!/bin/bash
# event-handler.sh

source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh

# Event processing function
process_event() {
    local event_type="$1"
    local event_data="$2"
    
    log_info "Processing event: $event_type"
    
    case "$event_type" in
        "deployment")
            handle_deployment_event "$event_data"
            ;;
        "security_alert")
            handle_security_event "$event_data"
            ;;
        *)
            log_warn "Unknown event type: $event_type"
            ;;
    esac
}

handle_deployment_event() {
    local data="$1"
    log_info "Handling deployment event"
    
    # Run quality checks
    source patterns/quality-gates/quality-check.sh
    run_quality_checks || handle_error $LINENO "Quality checks failed for deployment"
    
    log_success "Deployment event processed successfully"
}

handle_security_event() {
    local data="$1"
    log_warn "Security alert received: $data"
    
    # Run security scan
    source patterns/security/security-basics.sh
    basic_security_scan || handle_error $LINENO "Security scan failed"
    
    log_info "Security event processed"
}
```

### API Integration

**REST API wrapper with patterns:**
```bash
#!/bin/bash
# api-client.sh

source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
source patterns/configuration/config-reader.sh

# API configuration
api_base_url=$(get_config "API_BASE_URL" ".env" "https://api.example.com")
api_key=$(get_config "API_KEY" ".env" "")

[[ -n "$api_key" ]] || handle_error $LINENO "API_KEY is required"

# API call wrapper
api_call() {
    local method="$1"
    local endpoint="$2"
    local data="$3"
    
    log_info "Making $method request to $endpoint"
    
    local response
    response=$(curl -s -X "$method" \
        -H "Authorization: Bearer $api_key" \
        -H "Content-Type: application/json" \
        -d "$data" \
        "$api_base_url$endpoint")
    
    local status=$?
    [[ $status -eq 0 ]] || handle_error $LINENO "API call failed with status $status"
    
    log_success "API call completed successfully"
    echo "$response"
}

# Usage examples
# api_call "GET" "/users" ""
# api_call "POST" "/users" '{"name":"John","email":"john@example.com"}'
```

---

## Migration Strategies

### Gradual Migration

**Phase 1: Add logging and error handling**
```bash
# Before
echo "Starting process..."
cp file1 file2
if [ $? -ne 0 ]; then
    echo "Error: Copy failed"
    exit 1
fi

# After
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

log_info "Starting process..."
cp file1 file2 || handle_error $LINENO "Copy failed"
```

**Phase 2: Add configuration management**
```bash
# Before
DATABASE_URL="sqlite://local.db"
PORT=8080

# After
source patterns/configuration/config-reader.sh

DATABASE_URL=$(get_config "DATABASE_URL" ".env" "sqlite://local.db")
PORT=$(get_config "PORT" ".env" "8080")
```

**Phase 3: Add testing and quality gates**
```bash
# Add testing
source patterns/testing/simple-test-runner.sh

test_file_exists() {
    [[ -f "important-file.txt" ]]
}

run_test "File exists check" test_file_exists

# Add quality gates
source patterns/quality-gates/quality-check.sh
run_quality_checks || handle_error $LINENO "Quality checks failed"
```

### Legacy System Integration

**Wrapper approach:**
```bash
#!/bin/bash
# legacy-wrapper.sh

source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh

log_info "Starting legacy system with Claude patterns"

# Wrap legacy calls with error handling
run_legacy_command() {
    local cmd="$1"
    log_info "Executing legacy command: $cmd"
    
    $cmd || handle_error $LINENO "Legacy command failed: $cmd"
    
    log_success "Legacy command completed successfully"
}

# Usage
run_legacy_command "./legacy-script.sh"
run_legacy_command "make old-target"
```

### Configuration Migration

**Configuration converter:**
```bash
#!/bin/bash
# migrate-config.sh

source patterns/logging/simple-logging.sh
source patterns/configuration/config-reader.sh

migrate_config() {
    local old_config="$1"
    local new_config="$2"
    
    log_info "Migrating configuration from $old_config to $new_config"
    
    # Validate old config exists
    has_config "$old_config" || handle_error $LINENO "Old config file not found: $old_config"
    
    # Read values and convert format
    while IFS='=' read -r key value; do
        [[ "$key" =~ ^[[:space:]]*# ]] && continue  # Skip comments
        [[ -z "$key" ]] && continue  # Skip empty lines
        
        echo "${key}=${value}" >> "$new_config"
        log_info "Migrated: $key"
    done < "$old_config"
    
    log_success "Configuration migration completed"
}

# Usage
migrate_config "old-config.conf" ".env"
```

---

## Troubleshooting Integration Issues

### Common Issues and Solutions

#### Issue 1: Patterns Not Found

**Problem:**
```bash
bash: patterns/logging/simple-logging.sh: No such file or directory
```

**Solutions:**
```bash
# Solution 1: Check pattern path
ls -la patterns/
[[ -d "patterns" ]] || log_error "Patterns directory not found"

# Solution 2: Use absolute path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/patterns/logging/simple-logging.sh"

# Solution 3: Download patterns
curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash
```

#### Issue 2: Permission Denied

**Problem:**
```bash
bash: ./patterns/logging/simple-logging.sh: Permission denied
```

**Solutions:**
```bash
# Fix permissions
chmod +x patterns/*/simple-*.sh

# Or source without execute permission
source patterns/logging/simple-logging.sh  # Uses source, not execute
```

#### Issue 3: Function Not Found

**Problem:**
```bash
bash: log_info: command not found
```

**Solutions:**
```bash
# Check if pattern was sourced correctly
declare -F log_info >/dev/null || {
    echo "log_info function not available"
    source patterns/logging/simple-logging.sh
}

# Debug pattern loading
set -x
source patterns/logging/simple-logging.sh
set +x
```

#### Issue 4: Performance Issues

**Problem:** Slow script startup with all patterns loaded

**Solutions:**
```bash
# Load only required patterns
source patterns/logging/simple-logging.sh
source patterns/error-handling/simple-error-handling.sh
# Don't load all patterns unless needed

# Use conditional loading
if [[ "${LOAD_ALL_PATTERNS:-false}" == "true" ]]; then
    for pattern in patterns/*/simple-*.sh; do
        source "$pattern"
    done
fi

# Cache pattern loading
if [[ -z "$PATTERNS_LOADED" ]]; then
    source patterns/logging/simple-logging.sh
    source patterns/error-handling/simple-error-handling.sh
    export PATTERNS_LOADED=true
fi
```

### Debugging Integration

**Debug script:**
```bash
#!/bin/bash
# debug-integration.sh

set -euo pipefail

echo "=== Claude Code Builder Integration Debug ==="

# Check environment
echo "Working directory: $(pwd)"
echo "Script location: ${BASH_SOURCE[0]}"
echo "Shell: $BASH_VERSION"

# Check patterns directory
if [[ -d "patterns" ]]; then
    echo "✅ Patterns directory found"
    echo "Patterns available:"
    ls -la patterns/*/simple-*.sh | head -5
else
    echo "❌ Patterns directory not found"
    echo "Try running: curl -sSL https://raw.githubusercontent.com/smenssink/claude-code-builder/main/scripts/install.sh | bash"
fi

# Test pattern loading
echo
echo "=== Testing Pattern Loading ==="
if source patterns/logging/simple-logging.sh 2>/dev/null; then
    echo "✅ Logging pattern loaded successfully"
    log_info "Logging pattern is working"
else
    echo "❌ Failed to load logging pattern"
fi

# Test function availability
echo
echo "=== Testing Function Availability ==="
functions_to_test=(
    "log_info"
    "log_error"
    "handle_error"
    "get_config"
    "run_test"
)

for func in "${functions_to_test[@]}"; do
    if declare -F "$func" >/dev/null 2>&1; then
        echo "✅ $func is available"
    else
        echo "❌ $func is not available"
    fi
done

echo
echo "=== Debug Complete ==="
```

### Performance Monitoring

**Performance monitoring script:**
```bash
#!/bin/bash
# monitor-performance.sh

source patterns/logging/simple-logging.sh

monitor_performance() {
    local start_time=$(date +%s%N)
    
    # Your operation here
    "$@"
    
    local end_time=$(date +%s%N)
    local duration=$(( (end_time - start_time) / 1000000 ))  # Convert to milliseconds
    
    log_info "Operation completed in ${duration}ms"
    
    # Alert if slow
    if [[ $duration -gt 1000 ]]; then
        log_warn "Operation took longer than 1 second: ${duration}ms"
    fi
}

# Usage
monitor_performance source patterns/logging/simple-logging.sh
monitor_performance run_quality_checks
```

---

## Integration Checklist

### Pre-Integration Checklist

- [ ] Project type identified (Node.js, Python, Go, Shell, etc.)
- [ ] CI/CD platform determined (GitHub Actions, GitLab CI, Jenkins, etc.)
- [ ] Required patterns identified (minimal, standard, or full)
- [ ] Installation method selected (submodule, download, package manager)
- [ ] Integration points planned (scripts, workflows, hooks)

### Post-Integration Checklist

- [ ] All required patterns load successfully
- [ ] Functions are available and working
- [ ] No permission or path issues
- [ ] Performance is acceptable
- [ ] CI/CD integration working
- [ ] Documentation updated
- [ ] Team trained on new patterns

### Quality Assurance Checklist

- [ ] All tests pass with pattern integration
- [ ] Security scans complete successfully
- [ ] Performance benchmarks meet requirements
- [ ] Error handling works as expected
- [ ] Logging output is clear and useful
- [ ] Configuration management functional

For additional support, see [TROUBLESHOOTING.md](TROUBLESHOOTING.md) or [API_REFERENCE.md](API_REFERENCE.md).