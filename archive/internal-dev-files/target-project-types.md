# Target Project Types for Claude Code Dev Platform

## Primary Project Types (Must Support)

### 1. Web Applications 🌐
**Frontend apps, SPAs, full-stack applications**

**Common Characteristics:**
- package.json with build scripts
- HTML/CSS/JavaScript files
- Build processes (webpack, vite, etc.)
- Testing frameworks (jest, vitest, cypress)
- Linting (eslint, prettier)

**Required Patterns:**
- web-app-patterns.sh
- nodejs-patterns.sh  
- quality-check.sh
- simple-test-runner.sh
- git-hooks-setup.sh

**Template Includes:**
- package.json with common scripts
- Basic HTML/CSS/JS structure
- ESLint and Prettier configs
- Basic test setup
- Build configuration

### 2. APIs & Backend Services 🔧
**REST APIs, GraphQL, microservices**

**Common Characteristics:**
- Language-specific (Node.js, Python, Go, etc.)
- Database connections
- Environment configuration
- API documentation
- Security considerations

**Required Patterns:**
- nodejs-patterns.sh OR python-patterns.sh
- security-basics.sh
- dependency-basics.sh
- config-reader.sh
- quality-check.sh

**Template Includes:**
- Basic API structure
- Environment configuration
- Security headers setup
- Basic error handling
- API documentation template

### 3. CLI Tools 💻
**Command-line utilities and scripts**

**Common Characteristics:**
- Executable scripts
- Configuration files
- Help documentation
- Installation procedures
- Cross-platform compatibility

**Required Patterns:**
- simple-error-handling.sh
- config-reader.sh
- project-validator.sh
- docs-generator.sh

**Template Includes:**
- Main executable script
- Configuration file template
- README with usage examples
- Installation instructions
- Help system

### 4. AI/ML Pipelines 🤖
**Data processing, model training, inference**

**Common Characteristics:**
- Python-heavy (usually)
- Data file handling
- Environment/dependency management
- Notebook integration
- Model versioning

**Required Patterns:**
- python-patterns.sh
- simple-logging.sh
- dependency-basics.sh
- project-validator.sh
- config-reader.sh

**Template Includes:**
- requirements.txt / pyproject.toml
- Data directory structure
- Jupyter notebook setup
- Environment configuration
- Model storage structure

### 5. Libraries & Packages 📦
**Reusable code libraries, npm packages, pip packages**

**Common Characteristics:**
- Publishing configuration
- Version management
- Documentation requirements
- Testing requirements
- API design

**Required Patterns:**
- Language-specific patterns
- simple-test-runner.sh
- docs-generator.sh
- quality-check.sh
- git-hooks-setup.sh

**Template Includes:**
- Package configuration files
- Documentation structure
- Testing setup
- Publishing workflow
- Version management

## Secondary Project Types (Nice to Support)

### 6. Mobile Apps 📱
**React Native, Ionic, Flutter**

**Patterns:** Extend web-app-patterns.sh
**Template:** Mobile-specific build and deployment

### 7. Desktop Applications 🖥️
**Electron, Tauri, native apps**

**Patterns:** Extend existing language patterns
**Template:** Desktop-specific packaging

### 8. Game Development 🎮
**Game engines, interactive media**

**Patterns:** Basic patterns + game-specific
**Template:** Game project structure

### 9. IoT/Embedded 🔌
**Arduino, Raspberry Pi, embedded systems**

**Patterns:** Basic patterns + hardware-specific
**Template:** Embedded project structure

## Project Type Detection

### Automatic Detection Logic:
```bash
detect_project_type() {
    # Web App Detection
    if [ -f "package.json" ] && grep -q "react\|vue\|angular" package.json; then
        echo "web-app"
    # API Detection  
    elif [ -f "package.json" ] && grep -q "express\|fastify\|koa" package.json; then
        echo "api"
    # Python Project Detection
    elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
        echo "python"
    # CLI Tool Detection
    elif [ -f "bin/$(basename $(pwd))" ] || grep -q "#!/usr/bin/env" *.sh 2>/dev/null; then
        echo "cli"
    # Library Detection
    elif [ -f "package.json" ] && grep -q "\"main\":\|\"exports\":" package.json; then
        echo "library"
    # Default
    else
        echo "generic"
    fi
}
```

## Template Structure for Each Type

### Web App Template:
```
web-app-template/
├── package.json
├── index.html
├── src/
│   ├── main.js
│   ├── App.vue
│   └── components/
├── tests/
├── .eslintrc.js
├── .prettierrc
└── vite.config.js
```

### API Template:
```
api-template/
├── package.json
├── server.js
├── routes/
├── middleware/
├── models/
├── tests/
├── .env.example
└── docs/
```

### CLI Template:
```
cli-template/
├── bin/tool-name
├── lib/
├── tests/
├── README.md
├── package.json
└── config.json
```

### AI/ML Template:
```
ai-pipeline-template/
├── requirements.txt
├── src/
├── data/
├── notebooks/
├── models/
├── tests/
├── config.yaml
└── README.md
```

### Library Template:
```
library-template/
├── package.json
├── src/
├── dist/
├── tests/
├── docs/
├── examples/
└── README.md
```

## Adaptation Strategy

### For Claude Code:
1. **Auto-detect project type** based on files present
2. **Suggest relevant patterns** for the detected type
3. **Provide adaptation examples** for different use cases
4. **Allow easy customization** of patterns per project

### Pattern Selection by Type:
- **All types:** simple-error-handling.sh, quality-check.sh
- **Web/API:** nodejs-patterns.sh, security-basics.sh
- **Python projects:** python-patterns.sh, dependency-basics.sh
- **CLI tools:** config-reader.sh, docs-generator.sh
- **Libraries:** test-helpers.sh, git-hooks-setup.sh

This ensures Claude can quickly identify project needs and apply appropriate patterns.