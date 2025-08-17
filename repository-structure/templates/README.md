# Templates Directory

## Overview

This directory contains reusable templates for project setup, pattern development, and common development workflows. Templates are designed to accelerate development and ensure consistency across projects.

## Template Categories

### `/project-templates/`
Complete project setups with dev-platform patterns pre-configured.

### `/pattern-templates/`
Scaffolding templates for developing new patterns.

### `/workflow-templates/`
Common development workflow configurations.

## Project Templates

### Node.js Projects

#### `nodejs-basic/`
Basic Node.js project with essential patterns.

**Included Patterns:**
- Error handling for async operations
- Testing with npm scripts integration
- Quality gates with ESLint and Prettier
- Git hooks for pre-commit validation

**Usage:**
```bash
./scripts/create-project.sh --template nodejs-basic --name my-app
```

#### `nodejs-express/`
Express.js web application with comprehensive patterns.

**Additional Features:**
- Security patterns for web applications
- API testing patterns
- Database migration patterns
- Docker deployment patterns

### Python Projects

#### `python-basic/`
Basic Python project with pytest and quality tools.

**Included Patterns:**
- Error handling for Python exceptions
- Testing with pytest integration
- Quality gates with black, flake8, mypy
- Virtual environment management

#### `python-fastapi/`
FastAPI web application template.

**Additional Features:**
- API documentation generation
- Database ORM patterns
- Authentication patterns
- Container deployment

### Go Projects

#### `go-basic/`
Go project with module structure and testing.

**Included Patterns:**
- Error handling for Go idioms
- Testing with go test integration
- Quality gates with go fmt, go vet
- Module dependency management

#### `go-web/`
Go web service with Gin framework.

**Additional Features:**
- HTTP middleware patterns
- JSON API patterns
- Configuration management
- Logging and monitoring

### Universal Templates

#### `generic-cli/`
Command-line tool template (language agnostic).

**Features:**
- Argument parsing patterns
- Configuration file handling
- Help text generation
- Cross-platform compatibility

#### `documentation-site/`
Documentation website with GitHub Pages.

**Features:**
- Markdown documentation structure
- Navigation generation
- Search functionality
- Responsive design

## Pattern Templates

### Basic Pattern Template

#### `basic-pattern/`
Simple pattern template with minimal structure.

**Structure:**
```
pattern-name/
├── pattern-name.sh         # Main pattern script
├── README.md              # Pattern documentation
├── examples/              # Usage examples
│   └── basic-usage.sh    # Simple example
└── tests/                # Pattern tests
    └── test-pattern.sh   # Basic tests
```

**Usage:**
```bash
./scripts/create-pattern.sh --template basic --name my-pattern
```

### Advanced Pattern Template

#### `advanced-pattern/`
Comprehensive pattern template with full features.

**Additional Features:**
- Configuration file support
- Multiple usage examples
- Integration tests
- Performance benchmarks
- Security validation

### Composite Pattern Template

#### `composite-pattern/`
Template for patterns that combine multiple patterns.

**Features:**
- Multi-pattern orchestration
- Dependency management
- Conflict resolution
- Performance optimization

## Workflow Templates

### CI/CD Templates

#### `github-actions/`
GitHub Actions workflow configurations.

**Workflows:**
- Pattern validation and testing
- Security scanning
- Cross-platform testing
- Automated releases

#### `gitlab-ci/`
GitLab CI/CD pipeline configurations.

**Features:**
- Multi-stage pipelines
- Container-based testing
- Artifact management
- Deployment automation

### Git Hooks Templates

#### `git-hooks-standard/`
Standard git hooks configuration.

**Hooks:**
- Pre-commit quality checks
- Pre-push testing
- Commit message validation
- Post-commit notifications

#### `git-hooks-comprehensive/`
Advanced git hooks with security and compliance.

**Additional Features:**
- Security scanning
- License compliance checking
- Code coverage validation
- Dependency vulnerability checks

## Template Usage

### Creating from Template

#### Command Line
```bash
# Create project from template
./scripts/create-project.sh --template nodejs-basic --name my-project

# Create pattern from template
./scripts/create-pattern.sh --template advanced --name my-pattern --category testing

# Create workflow from template
./scripts/create-workflow.sh --template github-actions --target .github/workflows/
```

#### Interactive Mode
```bash
# Interactive project creation
./scripts/create-project.sh --interactive

# Choose template: nodejs-basic, python-basic, go-basic, etc.
# Customize options: testing framework, quality tools, etc.
# Generate project with selections
```

### Template Customization

#### Variable Substitution
Templates support variable substitution:

```bash
# Variables are replaced during template instantiation
PROJECT_NAME="my-awesome-project"
AUTHOR_NAME="Your Name"
AUTHOR_EMAIL="your.email@example.com"
```

#### Template Variables
Common variables used in templates:

- `{{PROJECT_NAME}}` - Project name
- `{{AUTHOR_NAME}}` - Author name
- `{{AUTHOR_EMAIL}}` - Author email
- `{{DESCRIPTION}}` - Project description
- `{{LICENSE}}` - License type
- `{{YEAR}}` - Current year
- `{{DATE}}` - Current date

#### Configuration Files
Templates can include configuration files:

```yaml
# .devplatform-template.yml
name: "Node.js Basic Project"
description: "Basic Node.js project with dev-platform patterns"
variables:
  project_name:
    prompt: "Project name"
    default: "my-project"
  use_typescript:
    prompt: "Use TypeScript?"
    type: boolean
    default: false
patterns:
  - error-handling
  - testing
  - quality-gates
```

## Template Development

### Creating New Templates

#### Project Template Structure
```
template-name/
├── template.yml           # Template metadata and configuration
├── {{PROJECT_NAME}}/      # Template files (with variable substitution)
│   ├── package.json
│   ├── README.md
│   ├── .gitignore
│   └── src/
│       └── index.js
├── hooks/                 # Template hooks for customization
│   ├── pre-create.sh     # Run before template instantiation
│   ├── post-create.sh    # Run after template instantiation
│   └── validate.sh       # Validate template inputs
└── README.md             # Template documentation
```

#### Pattern Template Structure
```
pattern-template-name/
├── template.yml
├── {{PATTERN_NAME}}/
│   ├── {{PATTERN_NAME}}.sh
│   ├── README.md
│   ├── examples/
│   └── tests/
└── README.md
```

### Template Testing

#### Template Validation
```bash
# Validate template structure
./scripts/validate-template.sh templates/project-templates/nodejs-basic

# Test template instantiation
./scripts/test-template.sh --template nodejs-basic --test-dir ./tmp/test
```

#### Integration Testing
```bash
# Test template with pattern installation
./tests/integration/test-template-nodejs-basic.sh

# Test template with different configurations
./tests/integration/test-template-configurations.sh
```

## Template Registry

### Available Templates

#### Project Templates
- `nodejs-basic` - Basic Node.js project
- `nodejs-express` - Express.js web application
- `python-basic` - Basic Python project
- `python-fastapi` - FastAPI web application
- `go-basic` - Basic Go project
- `go-web` - Go web service
- `generic-cli` - Command-line tool
- `documentation-site` - Documentation website

#### Pattern Templates
- `basic-pattern` - Simple pattern template
- `advanced-pattern` - Comprehensive pattern template
- `composite-pattern` - Multi-pattern template

#### Workflow Templates
- `github-actions` - GitHub Actions workflows
- `gitlab-ci` - GitLab CI/CD pipelines
- `git-hooks-standard` - Standard git hooks
- `git-hooks-comprehensive` - Advanced git hooks

### Template Versioning
Templates use semantic versioning:
- **Major** - Breaking changes to template structure
- **Minor** - New features, backward compatible
- **Patch** - Bug fixes, no breaking changes

### Template Registry Updates
```bash
# Update template registry
./scripts/update-templates.sh

# Check for template updates
./scripts/check-template-updates.sh

# Upgrade templates
./scripts/upgrade-templates.sh
```

## Contributing Templates

### Template Contribution Process
1. **Design** - Plan template structure and features
2. **Implement** - Create template files and configuration
3. **Test** - Validate template with various configurations
4. **Document** - Complete README and usage examples
5. **Submit** - Create pull request with template review

### Template Review Criteria
- [ ] Clear purpose and use case
- [ ] Follows template structure standards
- [ ] Includes comprehensive documentation
- [ ] Variables and customization options documented
- [ ] Tests created and passing
- [ ] Examples functional
- [ ] Cross-platform compatible

---

**Templates Version:** 1.0.0  
**Last Updated:** 2025-08-16  
**Project Templates:** 8 templates  
**Pattern Templates:** 3 templates  
**Workflow Templates:** 4 templates