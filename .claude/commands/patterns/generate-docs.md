---
allowed-tools: Read, Write, Grep, Glob, Bash(find:*), Bash(head:*), Bash(grep:*), Bash(sed:*), Bash(awk:*), Bash(wc:*), Bash(file:*), Bash(tree:*)
argument-hint: [doc-type] or [project-path] or [format]
description: Intelligent documentation generation with multi-language support and comprehensive output formats
category: patterns
---

# Documentation Generator

Intelligent project documentation generation with multi-language analysis: **$ARGUMENTS**

## Documentation Generation System

I'll provide comprehensive documentation generation capabilities with intelligent project analysis, multi-format output, and customizable documentation templates for various project types and documentation needs.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining documentation scope and format]
Mode: [readme/api/install/changelog/full/custom]
Source: [project directory, specific files, or pattern]
Format: [markdown/html/pdf/json/custom]
```

### Documentation Analysis Process

#### Intelligent Project Detection
```markdown
**🔍 Project Analysis**

Analyzing project structure and generating comprehensive documentation...
- Detecting project type, languages, and framework patterns
- Identifying dependencies, build systems, and deployment targets
- Analyzing code structure, functions, classes, and API patterns
- Discovering configuration files, documentation standards, and requirements
```

#### Multi-Language Project Support

##### Node.js/JavaScript Projects
```markdown
**📦 Node.js Documentation**

Detection: package.json, node_modules/, .js/.ts files
Analysis: Dependencies, scripts, exports, API endpoints
Documentation: README, API reference, deployment guide

Project Structure Analysis:
```
├── package.json          # Dependencies and scripts
├── src/                  # Source code
│   ├── index.js         # Entry point
│   ├── routes/          # API routes
│   └── utils/           # Utility functions
├── tests/               # Test files
├── docs/                # Documentation
└── README.md            # Project overview
```

Documentation Generation:
- Project overview with installation instructions
- API endpoint documentation with examples
- Environment configuration guide
- Testing and deployment instructions

Usage: /generate-docs "readme" "node-project/"
```

##### Python Projects
```markdown
**🐍 Python Documentation**

Detection: requirements.txt, setup.py, .py files, pyproject.toml
Analysis: Modules, classes, functions, dependencies
Documentation: README, API docs, installation guide

Project Structure Analysis:
```
├── requirements.txt      # Dependencies
├── setup.py             # Package configuration
├── src/                 # Source code
│   ├── __init__.py     # Package initialization
│   ├── main.py         # Main module
│   └── utils/          # Utility modules
├── tests/              # Test files
├── docs/               # Documentation
└── README.md           # Project overview
```

Documentation Generation:
- Project description with Python version requirements
- Module and function documentation with docstrings
- Installation and virtual environment setup
- Testing and development workflow

Usage: /generate-docs "api" "python-project/"
```

##### Go Projects
```markdown
**🔧 Go Documentation**

Detection: go.mod, go.sum, .go files
Analysis: Packages, functions, structs, interfaces
Documentation: README, package docs, build guide

Project Structure Analysis:
```
├── go.mod               # Module definition
├── go.sum               # Dependency checksums
├── main.go              # Entry point
├── pkg/                 # Library packages
│   └── utils/          # Utility packages
├── cmd/                # Commands
├── internal/           # Internal packages
└── README.md           # Project overview
```

Documentation Generation:
- Project overview with Go version requirements
- Package and function documentation
- Build and deployment instructions
- Testing and development setup

Usage: /generate-docs "full" "go-project/"
```

##### Rust Projects
```markdown
**⚙️ Rust Documentation**

Detection: Cargo.toml, Cargo.lock, .rs files
Analysis: Crates, modules, functions, traits
Documentation: README, API docs, build guide

Project Structure Analysis:
```
├── Cargo.toml           # Project configuration
├── Cargo.lock           # Dependency lock
├── src/                 # Source code
│   ├── main.rs         # Entry point
│   ├── lib.rs          # Library root
│   └── modules/        # Module files
├── tests/              # Integration tests
├── examples/           # Example code
└── README.md           # Project overview
```

Documentation Generation:
- Project description with Rust edition information
- Crate and module documentation
- Build, test, and deployment guide
- Cargo configuration and features

Usage: /generate-docs "install" "rust-project/"
```

##### Docker Projects
```markdown
**🐳 Docker Documentation**

Detection: Dockerfile, docker-compose.yml, .dockerignore
Analysis: Images, services, volumes, networks
Documentation: README, deployment guide, operations manual

Container Structure Analysis:
```
├── Dockerfile           # Container definition
├── docker-compose.yml   # Multi-service setup
├── .dockerignore       # Build exclusions
├── docker/             # Docker configurations
│   ├── nginx.conf      # Web server config
│   └── scripts/        # Container scripts
├── volumes/            # Persistent data
└── README.md           # Deployment guide
```

Documentation Generation:
- Container deployment and operation guide
- Service configuration and networking
- Volume management and data persistence
- Development and production setup

Usage: /generate-docs "deployment" "docker-project/"
```

### Documentation Types and Formats

#### README Generation
```bash
# Generate comprehensive project README
/generate-docs "readme"
/generate-docs "readme" "project-directory/"
/generate-docs "readme" "." "detailed"
```

**README Structure**:
1. **Project Title and Description**: Clear, concise project overview
2. **Installation Instructions**: Step-by-step setup guide
3. **Usage Examples**: Code examples and common use cases
4. **Configuration**: Environment variables and configuration options
5. **API Reference**: Key functions and endpoints (if applicable)
6. **Testing**: How to run tests and contribute
7. **Deployment**: Production deployment instructions
8. **Contributing**: Contribution guidelines and standards
9. **License**: License information and copyright

#### API Documentation Generation
```bash
# Generate comprehensive API documentation
/generate-docs "api"
/generate-docs "api" "src/" "detailed"
/generate-docs "api" "." "json"
```

**API Documentation Features**:
- **Function Documentation**: Parameters, return values, examples
- **Class/Module Documentation**: Purpose, usage patterns, inheritance
- **Endpoint Documentation**: HTTP methods, parameters, responses
- **Type Documentation**: Data structures, interfaces, schemas
- **Example Code**: Working examples for each API component

#### Installation Guide Generation
```bash
# Generate installation and setup documentation
/generate-docs "install"
/generate-docs "install" "." "platform-specific"
/generate-docs "install" "project/" "automated"
```

**Installation Guide Components**:
- **System Requirements**: Operating system, dependencies, versions
- **Dependency Installation**: Package managers, manual installation
- **Environment Setup**: Virtual environments, configuration files
- **Build Instructions**: Compilation, bundling, optimization
- **Verification Steps**: Testing installation success
- **Troubleshooting**: Common issues and solutions

#### Changelog Generation
```bash
# Generate changelog from git history and patterns
/generate-docs "changelog"
/generate-docs "changelog" "." "semantic-versioning"
/generate-docs "changelog" "project/" "detailed"
```

**Changelog Features**:
- **Version History**: Semantic versioning with dates
- **Feature Changes**: New features, enhancements, improvements
- **Bug Fixes**: Resolved issues and fixes
- **Breaking Changes**: API changes and migration notes
- **Security Updates**: Security fixes and vulnerability patches

### Advanced Documentation Features

#### Multi-Format Output
```bash
# Generate documentation in multiple formats
/generate-docs "readme" "." "markdown"
/generate-docs "api" "src/" "html"
/generate-docs "full" "project/" "pdf"
/generate-docs "custom" "." "json"
```

#### Documentation Templates
```bash
# Use predefined documentation templates
/generate-docs "template" "open-source"
/generate-docs "template" "enterprise"
/generate-docs "template" "api-first"
/generate-docs "template" "minimal"
```

#### Documentation Validation
```bash
# Validate documentation completeness and quality
/generate-docs "validate" "README.md"
/generate-docs "lint" "docs/"
/generate-docs "check" "."
```

### Integration with Error Handling

#### Comprehensive Documentation Status Reporting
```bash
# All documentation operations use error handling pattern
/error-handler "info" "Starting documentation generation for $project_type"

# Documentation progress
/error-handler "info" "Analyzing project structure..."
/error-handler "info" "Generating README.md..."
/error-handler "info" "Creating API documentation..."

# Documentation completion
/error-handler "info" "Documentation generation completed successfully"

# Documentation validation
/error-handler "warn" "Missing API documentation for some functions"
/error-handler "error" "Documentation validation failed: missing installation instructions"
```

#### Detailed Documentation Reporting
```bash
# Documentation quality feedback
/error-handler "info" "Generated $doc_count documentation files"
/error-handler "info" "Documentation coverage: $coverage_percent%"
/error-handler "warn" "Consider adding more code examples"

# Documentation format feedback
/error-handler "info" "Generated documentation in $format format"
/error-handler "info" "Output saved to $output_directory"
/error-handler "handle-error" "$LINENO" "Documentation generation failed"
```

### Documentation Implementation

#### Intelligent Content Generation
```markdown
**Smart Documentation Creation**:

**Project Analysis**:
- Language detection and framework identification
- Dependency analysis and version requirements
- Code structure analysis and pattern recognition
- Configuration file parsing and environment detection

**Content Generation**:
- Template-based documentation with intelligent substitution
- Code example extraction and formatting
- Dependency tree analysis and documentation
- API endpoint discovery and documentation
```

#### Multi-Language Code Analysis
```markdown
**Code Pattern Recognition**:

**Function/Method Detection**:
- JavaScript: function declarations, arrow functions, class methods
- Python: def functions, class methods, decorators
- Go: func declarations, struct methods, interfaces
- Rust: fn declarations, impl blocks, trait implementations

**Documentation Extraction**:
- Comments and docstrings parsing
- Type annotations and signatures
- Usage examples and test cases
- Configuration and environment requirements
```

### Output Formatting

#### Standard Documentation Results
```
📚 Documentation Generation: README.md
📝 Project Type: Node.js Application
⚡ Status: Generated

💾 Documentation Summary:
  Type: README.md
  Sections: 8 sections generated
  Length: 2,340 words
  Examples: 12 code examples included
  
📊 Content Analysis:
  ├── Project Overview ✅
  ├── Installation Guide ✅ 
  ├── Usage Examples ✅
  ├── API Reference ✅
  ├── Configuration ✅
  ├── Testing Guide ✅
  ├── Deployment ✅
  └── Contributing ✅

⏱️  Generation Time: 3.2s
🎯 Documentation Quality: 92/100
```

#### Multi-Format Documentation Results
```
📚 Documentation Suite: Full Project Documentation
📝 Project Type: Python Package
⚡ Status: Generated (4 formats)

💾 Generated Documentation:
  📄 README.md: Project overview and usage
  📊 API.md: Complete API reference
  ⚙️ INSTALL.md: Installation and setup guide
  📋 CHANGELOG.md: Version history and changes
  
🌐 Multi-Format Output:
  ├── Markdown: ./docs/markdown/
  ├── HTML: ./docs/html/
  ├── PDF: ./docs/pdf/
  └── JSON: ./docs/json/

📈 Coverage Statistics:
  • Functions Documented: 95% (38/40)
  • Classes Documented: 100% (12/12)
  • Examples Provided: 85% (17/20)
  • Installation Steps: Complete
```

#### Documentation Validation Results
```
✅ Documentation Validation: Project Documentation

📋 Validation Results:
  ✅ Completeness: All required sections present
  ✅ Accuracy: Code examples verified
  ✅ Consistency: Style guide compliance
  ✅ Accessibility: Clear language and structure
  
🔍 Quality Assessment:
  • Readability Score: 87/100
  • Technical Accuracy: 94/100
  • Completeness: 91/100
  • Code Examples: 89/100
  
📝 Recommendations:
  • Add more troubleshooting examples
  • Include performance benchmarks
  • Add visual diagrams for complex workflows
  
📊 Overall Documentation Score: 90/100
```

### Performance Optimization

#### Fast Documentation Generation
- **Template Caching**: Pre-compiled documentation templates
- **Incremental Generation**: Update only changed sections
- **Parallel Processing**: Generate multiple documents simultaneously
- **Smart Analysis**: Cache project analysis results

#### Efficient Resource Usage
- **Memory Management**: Stream large file processing
- **File Access**: Efficient file reading and writing
- **Content Processing**: Optimized text processing and formatting
- **Output Generation**: Efficient multi-format generation

### Documentation Security

#### Safe Content Generation
- **Input Validation**: Sanitize file paths and content
- **Output Validation**: Validate generated content format
- **File Access Control**: Read-only access to source files
- **Template Security**: Secure template processing

#### Documentation Privacy
- **Sensitive Data Detection**: Identify and exclude secrets
- **Personal Information**: Remove or anonymize personal data
- **Code Security**: Avoid exposing sensitive code patterns
- **Configuration Safety**: Sanitize configuration examples

### Integration Patterns

#### With Error Handling Pattern
```bash
# Documentation workflow with comprehensive error handling
/error-handler "info" "Starting project documentation generation"
/generate-docs "full" "."
/error-handler "info" "Documentation generation completed"
```

#### With Quality Gates
```bash
# Documentation quality validation
/generate-docs "validate" "README.md"
/quality-check "documentation"
```

#### With Security Scanner
```bash
# Security-aware documentation generation
/generate-docs "readme" "."
/security-scanner "docs"      # Scan generated documentation
```

### Documentation Options

#### Generation Configuration
```bash
DOC_TEMPLATE_PATH="./templates"      # Documentation template directory
DOC_OUTPUT_FORMAT="markdown"        # Default output format
DOC_INCLUDE_EXAMPLES=true           # Include code examples
DOC_VALIDATION_STRICT=false         # Strict validation mode
DOC_MULTI_FORMAT=false              # Generate multiple formats
```

#### Project Configuration
```bash
# .docsrc configuration file support
DOC_SECTIONS="overview,install,usage,api,contributing"
DOC_EXCLUDE_PATTERNS="*.test.js,*.spec.py"
DOC_TEMPLATE_STYLE="professional"
DOC_INCLUDE_DIAGRAMS=true
```

## Success Indicators

- ✅ **Multi-Language Support**: Intelligent analysis of JavaScript, Python, Go, Rust, and Docker projects
- ✅ **Comprehensive Generation**: README, API docs, installation guides, and changelogs
- ✅ **Multi-Format Output**: Markdown, HTML, PDF, and JSON format support
- ✅ **Quality Validation**: Documentation completeness and quality assessment
- ✅ **Template System**: Customizable documentation templates for different project types
- ✅ **Integration**: Seamless integration with error handling, quality gates, and security patterns

The documentation generator provides intelligent, comprehensive documentation creation that analyzes project structure and generates professional documentation across multiple formats and languages.