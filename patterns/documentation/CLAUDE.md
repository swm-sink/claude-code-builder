# Documentation Pattern - AI Instructions

> **AI guidance for working with the documentation pattern in Claude Code Builder**

## Pattern Purpose

The documentation pattern provides intelligent project documentation generation with multi-language analysis, comprehensive output formats, and customizable templates. It serves as the documentation foundation for development workflows, ensuring consistent, comprehensive, and maintainable documentation across different project types, programming languages, and documentation standards.

## Core Capabilities

### Intelligent Project Analysis and Multi-Language Documentation
- **Node.js Projects**: package.json analysis, API endpoint documentation, dependency guides
- **Python Projects**: requirements.txt parsing, module documentation, virtual environment setup
- **Go Projects**: go.mod analysis, package documentation, build instructions
- **Rust Projects**: Cargo.toml parsing, crate documentation, feature guides
- **Docker Projects**: Container documentation, deployment guides, service configuration
- **Multi-Language Projects**: Intelligent detection and appropriate documentation generation

### Native Command Usage
```bash
# Basic documentation generation
/generate-docs "readme"                           # Generate comprehensive README
/generate-docs "api" "src/"                      # Generate API documentation
/generate-docs "install" "."                     # Generate installation guide
/generate-docs "changelog"                       # Generate changelog from git history

# Project-specific documentation
/generate-docs "readme" "node-project/"          # Node.js project README
/generate-docs "api" "python-project/" "detailed" # Detailed Python API docs
/generate-docs "full" "go-project/"              # Complete Go project documentation

# Multi-format output
/generate-docs "readme" "." "markdown"           # Markdown format (default)
/generate-docs "api" "src/" "html"               # HTML format with styling
/generate-docs "full" "project/" "pdf"           # PDF format for distribution

# Documentation validation and quality
/generate-docs "validate" "README.md"            # Validate documentation completeness
/generate-docs "lint" "docs/"                    # Lint documentation style
/generate-docs "check" "."                       # Check documentation coverage
```

## AI Assistant Guidelines

### When to Recommend Documentation Pattern
1. **Any development project** - Documentation is essential for all code projects
2. **Open source projects** - Comprehensive documentation for community adoption
3. **Team collaboration** - Standardized documentation across team members
4. **API development** - Detailed API documentation with examples
5. **Library/package creation** - Usage guides and installation instructions
6. **Project onboarding** - New developer setup and contribution guides
7. **Deployment documentation** - Production deployment and operational guides

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive documentation generation status
- **Quality Gates**: Provides documentation validation as part of quality assurance
- **Security Scanner**: Integrates with security scanning for documentation security review
- **Testing**: Documents testing procedures and test case examples
- **Configuration**: Documents configuration options and environment setup

### Usage Patterns to Recommend

#### Standard Documentation Workflow
```bash
# Complete project documentation generation
/generate-docs "full" "."                        # Generate all documentation types
/error-handler "info" "Generating project documentation"

# Validate documentation quality
/generate-docs "validate" "README.md"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Documentation validation passed"
else
    /error-handler "error" "Documentation validation failed"
fi
```

#### Multi-Language Project Documentation
```bash
# Node.js project with comprehensive documentation
/generate-docs "readme" "node-project/"          # Project overview
/generate-docs "api" "src/"                      # API endpoint documentation
/generate-docs "install" "."                     # npm installation guide

# Python project documentation
/generate-docs "readme" "python-project/"        # Project description
/generate-docs "api" "src/" "detailed"          # Module and function docs
/generate-docs "install" "." "pip"              # pip installation with virtual env
```

#### Documentation Quality and Validation
```bash
# Documentation quality assurance workflow
/error-handler "info" "Starting documentation quality assessment"
/generate-docs "validate" "docs/"               # Validate all documentation
/generate-docs "lint" "README.md"               # Check style compliance
/quality-check "documentation"                  # Comprehensive quality check
/error-handler "info" "Documentation quality assessment completed"
```

#### Multi-Format Documentation Generation
```bash
# Generate documentation in multiple formats for different audiences
/generate-docs "readme" "." "markdown"          # Developer-focused markdown
/generate-docs "readme" "." "html"              # Web-friendly HTML
/generate-docs "api" "src/" "pdf"               # Distribution-ready PDF
/generate-docs "changelog" "." "json"           # Machine-readable changelog
```

### Best Practices to Teach

#### Documentation Organization
- **README**: Project overview, quick start, and essential information
- **API Documentation**: Detailed function/endpoint documentation with examples
- **Installation Guide**: Step-by-step setup instructions for all platforms
- **Contributing Guide**: Development setup, coding standards, and contribution workflow
- **Changelog**: Version history with features, fixes, and breaking changes

#### Documentation Quality
- **Clarity**: Write for your target audience (developers, users, operators)
- **Completeness**: Cover all essential aspects without overwhelming detail
- **Examples**: Include working code examples and common use cases
- **Maintenance**: Keep documentation synchronized with code changes
- **Accessibility**: Use clear language and logical structure

#### Documentation Standards
- **Consistent Format**: Use standardized sections and formatting across projects
- **Version Control**: Track documentation changes alongside code changes
- **Review Process**: Include documentation review in code review process
- **Automation**: Use documentation generation to maintain consistency
- **Templates**: Standardize documentation structure across similar projects

### Code Examples for AI

#### Basic Documentation Generation
```bash
# Standard project documentation workflow
/error-handler "info" "Generating project documentation"

# Generate comprehensive README with project analysis
/generate-docs "readme" "."
if [[ $? -eq 0 ]]; then
    /error-handler "info" "README.md generated successfully"
else
    /error-handler "error" "README generation failed"
    /error-handler "handle-error" "$LINENO" "Documentation generation error"
fi
```

#### API Documentation Workflow
```bash
# Generate detailed API documentation
/error-handler "info" "Creating API documentation"

# Analyze project structure and generate API docs
/generate-docs "api" "src/" "detailed"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "API documentation generated"
    
    # Validate API documentation completeness
    /generate-docs "validate" "docs/API.md"
    if [[ $? -eq 0 ]]; then
        /error-handler "info" "API documentation validation passed"
    else
        /error-handler "warn" "API documentation may be incomplete"
    fi
else
    /error-handler "error" "API documentation generation failed"
fi
```

#### Multi-Project Documentation Management
```bash
# Handle documentation for complex multi-language projects
/error-handler "info" "Generating documentation for multi-language project"

# Detect and document each language component
if [[ -f "package.json" ]]; then
    /error-handler "info" "Documenting Node.js components"
    /generate-docs "api" "src/js/" "javascript"
fi

if [[ -f "requirements.txt" ]]; then
    /error-handler "info" "Documenting Python components"
    /generate-docs "api" "src/python/" "python"
fi

if [[ -f "go.mod" ]]; then
    /error-handler "info" "Documenting Go components"
    /generate-docs "api" "src/go/" "golang"
fi

# Generate unified project documentation
/generate-docs "readme" "." "multi-language"
/error-handler "info" "Multi-language documentation completed"
```

#### Documentation Quality Integration
```bash
# Documentation-driven development workflow
/error-handler "info" "Starting documentation quality workflow"

# Generate documentation
/generate-docs "full" "."

# Validate documentation quality
/generate-docs "validate" "docs/"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Documentation validation passed"
    
    # Integrate with quality gates
    /quality-check "documentation"
    if [[ $? -eq 0 ]]; then
        /error-handler "info" "Documentation quality assessment passed"
    else
        /error-handler "warn" "Documentation quality improvements recommended"
    fi
else
    /error-handler "error" "Documentation validation failed"
fi
```

### Common User Questions & AI Responses

**Q: "How do I generate documentation for my project?"**
A: Use `/generate-docs "readme"` for a comprehensive README, or `/generate-docs "full"` for complete project documentation. The documentation generator automatically detects your project type (Node.js, Python, Go, etc.) and creates appropriate documentation.

**Q: "My documentation is missing API information, what should I do?"**
A: Run `/generate-docs "api" "src/"` to generate detailed API documentation, then `/generate-docs "validate"` to check completeness. Make sure your code has proper comments and docstrings for better API documentation.

**Q: "How can I create installation instructions?"**
A: Use `/generate-docs "install"` to generate installation guides. The generator analyzes your dependencies (package.json, requirements.txt, go.mod) and creates step-by-step installation instructions.

**Q: "Can I generate documentation in different formats?"**
A: Yes! Use `/generate-docs "readme" "." "html"` for HTML, `/generate-docs "api" "src/" "pdf"` for PDF, or `/generate-docs "full" "." "markdown"` for Markdown. Multiple formats help different audiences.

**Q: "How do I validate my documentation quality?"**
A: Use `/generate-docs "validate" "README.md"` to check completeness, `/generate-docs "lint" "docs/"` for style validation, and `/quality-check "documentation"` for comprehensive quality assessment.

### Troubleshooting Guide for AI

#### Common Issues
- **Empty documentation**: Check if source files exist and are readable
- **Missing sections**: Use `/generate-docs "validate"` to identify missing content
- **Format errors**: Validate source code comments and docstrings
- **Permission errors**: Check file permissions for documentation output directory
- **Language detection failures**: Verify project files (package.json, requirements.txt, etc.)

#### Validation Steps
1. **Project Detection**: `/generate-docs "check" "."` shows detected project type
2. **Content Validation**: `/generate-docs "validate" "docs/"` checks completeness
3. **Style Validation**: `/generate-docs "lint" "README.md"` checks formatting
4. **Quality Assessment**: `/quality-check "documentation"` provides quality score
5. **Integration Test**: Generate and validate complete documentation suite

#### Project-Specific Troubleshooting

##### Node.js Project Issues
- **Missing API docs**: Ensure JSDoc comments in JavaScript/TypeScript files
- **Incomplete installation**: Check package.json scripts and dependencies
- **Framework detection**: Verify Express, React, or other framework configuration

##### Python Project Issues
- **Missing module docs**: Ensure docstrings in Python functions and classes
- **Installation issues**: Check requirements.txt and setup.py configuration
- **Package structure**: Verify proper Python package structure with __init__.py

##### Go Project Issues
- **Missing package docs**: Ensure Go doc comments on exported functions
- **Build instructions**: Verify go.mod and build tag documentation
- **API documentation**: Check interface and struct documentation

##### Docker Project Issues
- **Container documentation**: Ensure Dockerfile and docker-compose.yml are documented
- **Service descriptions**: Document service configurations and networking
- **Deployment guides**: Include environment variables and volume documentation

### Advanced Usage Patterns

#### Documentation Templates
```bash
# Use predefined templates for specific project types
/generate-docs "template" "open-source"        # Open source project template
/generate-docs "template" "enterprise"         # Enterprise project template
/generate-docs "template" "api-first"          # API-focused documentation
```

#### Custom Documentation Generation
```bash
# Generate custom documentation with specific sections
/generate-docs "custom" "overview,api,deploy"  # Specific sections only
/generate-docs "sections" "installation,testing" # Custom section generation
```

#### Documentation Automation
```bash
# Automated documentation update workflow
/generate-docs "update" "."                    # Update existing documentation
/generate-docs "sync" "docs/"                  # Synchronize with code changes
/generate-docs "refresh" "README.md"           # Refresh specific documentation
```

### Integration Examples

#### With Testing Frameworks
```bash
# Document testing procedures and examples
/generate-docs "testing" "tests/"              # Generate testing documentation
/test-runner "all"                             # Run all tests
/generate-docs "test-report" "."               # Generate test coverage docs
```

#### With Deployment Workflows
```bash
# Generate deployment and operational documentation
/generate-docs "deployment" "."                # Deployment instructions
/generate-docs "operations" "configs/"         # Operational procedures
```

#### With Security Documentation
```bash
# Security-aware documentation generation
/generate-docs "security" "."                  # Security guidelines
/security-scanner "docs"                       # Scan documentation for security
```

## AI Development Guidelines

### When Helping Users
1. **Start with project analysis** - Determine project type and documentation needs
2. **Recommend appropriate documentation types** - README, API, installation based on project
3. **Show validation workflow** - Generate, validate, and improve documentation quality
4. **Integrate with development workflow** - Connect documentation to testing and deployment
5. **Emphasize maintenance** - Show how to keep documentation current with code changes

### Pattern Recognition
- If user mentions documentation, README, API docs → recommend this pattern
- If user has multiple languages → highlight multi-language documentation features
- If user asks about installation → demonstrate installation guide generation
- If user needs project overview → show README generation capabilities
- If user wants API documentation → demonstrate API documentation features

### Documentation Assurance
- Ensure documentation commands are appropriate for detected project types
- Verify documentation covers essential project aspects (installation, usage, API)
- Check that generated documentation follows best practices and standards
- Confirm integration patterns work with other Claude Code Builder patterns
- Validate that documentation recommendations improve project maintainability

### Error Recovery Guidance
- Help users identify and fix documentation completeness issues
- Guide users through documentation quality improvement processes
- Provide project-specific documentation recommendations and templates
- Suggest documentation structure improvements and content enhancements
- Ensure documentation solutions scale with project growth and complexity

This documentation pattern provides intelligent, comprehensive documentation generation that analyzes project structure and creates professional documentation across multiple formats, languages, and project types while seamlessly integrating with development workflows.