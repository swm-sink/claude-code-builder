# Examples Directory

## Overview

This directory contains real-world examples demonstrating how to use dev-platform patterns in different project types and scenarios. Examples are organized by project type and use case to help developers quickly find relevant implementations.

## Project Type Examples

### `/nodejs/`
Node.js and JavaScript project examples.

### `/python/`
Python project examples with various frameworks.

### `/go/`
Go project examples and patterns.

### `/web-apps/`
Web application examples (various technologies).

### `/cli-tools/`
Command-line tool examples.

### `/devops/`
DevOps and infrastructure automation examples.

## Node.js Examples

### Basic Node.js Project
**Path:** `nodejs/basic-app/`

**Patterns Used:**
- `error-handling/simple-error-handling.sh`
- `testing/simple-test-runner.sh`
- `quality-gates/quality-check.sh`
- `git-hooks/git-hooks-setup.sh`

**Features Demonstrated:**
- npm script integration with patterns
- ESLint and Prettier quality gates
- Jest testing automation
- Pre-commit hooks with formatting

**Usage:**
```bash
cd examples/nodejs/basic-app
npm install
./setup-dev-platform.sh
npm test
```

### Express.js API Server
**Path:** `nodejs/express-api/`

**Additional Patterns:**
- `security/security-basics.sh`
- `quality-gates/dependency-audit.sh`

**Features Demonstrated:**
- API endpoint testing
- Security vulnerability scanning
- Dependency license checking
- Docker container patterns

### React Frontend Application
**Path:** `nodejs/react-frontend/`

**Features Demonstrated:**
- Build process integration
- Component testing patterns
- Bundle size monitoring
- Accessibility checking

## Python Examples

### Basic Python Package
**Path:** `python/basic-package/`

**Patterns Used:**
- `error-handling/simple-error-handling.sh`
- `testing/simple-test-runner.sh`
- `quality-gates/quality-check.sh`

**Features Demonstrated:**
- pytest integration
- Black and flake8 formatting
- mypy type checking
- setuptools packaging

**Usage:**
```bash
cd examples/python/basic-package
python -m venv venv
source venv/bin/activate
pip install -r requirements-dev.txt
./setup-dev-platform.sh
pytest
```

### FastAPI Web Service
**Path:** `python/fastapi-service/`

**Additional Patterns:**
- `security/security-basics.sh`
- `quality-gates/dependency-audit.sh`

**Features Demonstrated:**
- API testing with pytest
- Database migration patterns
- Container deployment
- OpenAPI documentation

### Data Science Project
**Path:** `python/data-science/`

**Features Demonstrated:**
- Jupyter notebook validation
- Data pipeline testing
- Model validation patterns
- Reproducible environment setup

## Go Examples

### Basic Go Module
**Path:** `go/basic-module/`

**Patterns Used:**
- `error-handling/simple-error-handling.sh`
- `testing/simple-test-runner.sh`
- `quality-gates/quality-check.sh`

**Features Demonstrated:**
- go mod integration
- go fmt and go vet checking
- Benchmark testing
- Cross-compilation patterns

**Usage:**
```bash
cd examples/go/basic-module
go mod download
./setup-dev-platform.sh
go test ./...
```

### Go Web Service
**Path:** `go/web-service/`

**Features Demonstrated:**
- HTTP server testing
- Middleware patterns
- Configuration management
- Health check endpoints

### CLI Tool
**Path:** `go/cli-tool/`

**Features Demonstrated:**
- Command-line argument parsing
- Cross-platform builds
- Installation patterns
- Man page generation

## Web Application Examples

### Static Site with Build Process
**Path:** `web-apps/static-site/`

**Features Demonstrated:**
- HTML/CSS/JS validation
- Build process automation
- Asset optimization
- Deployment patterns

### WordPress Theme Development
**Path:** `web-apps/wordpress-theme/`

**Features Demonstrated:**
- PHP code quality checks
- Theme validation
- Local development setup
- Version control patterns

## CLI Tools Examples

### Shell Script CLI
**Path:** `cli-tools/shell-cli/`

**Features Demonstrated:**
- Argument parsing patterns
- Help text generation
- Configuration file handling
- Cross-platform compatibility

### Multi-language CLI
**Path:** `cli-tools/multi-lang-cli/`

**Features Demonstrated:**
- Language detection
- Tool chain management
- Unified interface patterns
- Plugin architecture

## DevOps Examples

### Docker Multi-stage Build
**Path:** `devops/docker-build/`

**Features Demonstrated:**
- Container security scanning
- Multi-stage optimization
- Health check patterns
- Registry automation

### Infrastructure as Code
**Path:** `devops/terraform/`

**Features Demonstrated:**
- Terraform validation
- Security compliance checking
- Cost estimation
- Change management

### CI/CD Pipeline
**Path:** `devops/ci-cd-pipeline/`

**Features Demonstrated:**
- Pipeline validation
- Artifact management
- Deployment strategies
- Rollback procedures

## Usage Patterns

### Basic Integration
All examples include a setup script that demonstrates basic pattern integration:

```bash
#!/bin/bash
# setup-dev-platform.sh - Example setup script

# Install required patterns
./dev-platform/scripts/install-patterns.sh \
    error-handling \
    testing \
    quality-gates \
    git-hooks

# Configure git hooks
./dev-platform/patterns/git-hooks/git-hooks-setup.sh

# Set up quality gates
./dev-platform/patterns/quality-gates/quality-check.sh --configure

echo "Dev platform setup complete!"
echo "Run 'git commit' to test pre-commit hooks"
```

### Advanced Integration
Complex examples show pattern composition and customization:

```bash
#!/bin/bash
# advanced-setup.sh - Complex setup with customization

source ./dev-platform/patterns/error-handling/simple-error-handling.sh

log_info "Setting up advanced development environment..."

# Install patterns with configuration
./dev-platform/scripts/install-patterns.sh \
    --config ./dev-platform-config.yml \
    --target ./tools \
    error-handling testing quality-gates security git-hooks

# Customize patterns for project
log_info "Customizing patterns for project type: $PROJECT_TYPE"
./customize-patterns.sh "$PROJECT_TYPE"

# Validate setup
if ./dev-platform/scripts/validate-patterns.sh; then
    log_info "Development environment ready!"
else
    log_error "Setup validation failed"
    exit 1
fi
```

## Running Examples

### Prerequisites
- bash 3.2+ (macOS compatible)
- git
- Project-specific tools (node, python, go, etc.)

### Quick Start
```bash
# Clone repository
git clone https://github.com/swm-sink/dev-platform.git
cd dev-platform

# Choose an example
cd examples/nodejs/basic-app

# Follow example README
cat README.md

# Run setup
./setup-dev-platform.sh

# Test functionality
npm test  # or appropriate test command
```

### Testing All Examples
```bash
# Test all examples (requires all language tools)
./scripts/test-all-examples.sh

# Test specific project type
./scripts/test-examples.sh --type nodejs

# Test with specific patterns
./scripts/test-examples.sh --patterns error-handling,testing
```

## Example Structure

### Standard Example Structure
Each example follows this structure:

```
example-name/
├── README.md                  # Example documentation
├── setup-dev-platform.sh     # Pattern setup script
├── dev-platform-config.yml   # Pattern configuration
├── project-files...          # Actual project files
├── tests/                     # Example-specific tests
│   ├── test-setup.sh         # Test setup process
│   └── test-patterns.sh      # Test pattern integration
└── docs/                     # Additional documentation
    ├── WALKTHROUGH.md        # Step-by-step guide
    └── TROUBLESHOOTING.md    # Common issues
```

### Example Documentation
Each example includes comprehensive documentation:

- **README.md** - Overview, setup, and usage
- **WALKTHROUGH.md** - Step-by-step tutorial
- **TROUBLESHOOTING.md** - Common issues and solutions

## Contributing Examples

### Example Contribution Process
1. **Identify Use Case** - Find gap in current examples
2. **Create Project** - Build realistic project example
3. **Integrate Patterns** - Demonstrate pattern usage
4. **Document** - Complete documentation and walkthrough
5. **Test** - Validate example works end-to-end
6. **Submit** - Create pull request with example review

### Example Review Criteria
- [ ] Realistic and practical use case
- [ ] Demonstrates multiple patterns effectively
- [ ] Includes comprehensive documentation
- [ ] Setup and testing scripts functional
- [ ] Cross-platform compatible
- [ ] Follows example structure standards
- [ ] Code quality meets project standards

### Adding New Project Types
To add support for a new project type:

1. Create directory: `examples/new-project-type/`
2. Add basic example: `examples/new-project-type/basic-example/`
3. Create setup documentation
4. Add testing integration
5. Update this README

## Example Maintenance

### Keeping Examples Current
- Regular updates for dependency changes
- Pattern version compatibility testing
- Documentation accuracy validation
- Security vulnerability patching

### Example Testing
```bash
# Automated example testing
./tests/examples/test-all-examples.sh

# Manual example validation
./scripts/validate-examples.sh --detailed

# Performance testing
./tests/performance/test-example-performance.sh
```

---

**Examples Version:** 1.0.0  
**Last Updated:** 2025-08-16  
**Project Types:** 6 types supported  
**Total Examples:** 15+ comprehensive examples  
**Language Support:** Node.js, Python, Go, Shell, Web technologies