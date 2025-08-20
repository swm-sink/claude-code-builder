# Repository Structure Plan for swm-sink/dev-platform

## Repository Overview
```
swm-sink/dev-platform/
├── README.md                    # Human-readable overview
├── CLAUDE.md                    # Claude-specific instructions
├── LICENSE                      # MIT License
├── .github/
│   ├── workflows/
│   │   └── test-patterns.yml    # CI/CD for testing patterns
│   ├── ISSUE_TEMPLATE/
│   └── PULL_REQUEST_TEMPLATE.md
├── patterns/                    # Core reusable patterns
├── scripts/                     # Ready-to-use complete scripts
├── templates/                   # Project type templates
├── examples/                    # Usage examples and demos
├── docs/                        # Additional documentation
└── tests/                       # Pattern validation tests
```

## Core Directories Structure

### /patterns/ - Reusable Code Patterns
```
patterns/
├── foundation/                  # Essential building blocks
│   ├── simple-error-handling.sh
│   ├── simple-logging.sh
│   └── config-reader.sh
├── quality/                     # Quality assurance patterns
│   ├── simple-test-runner.sh
│   ├── quality-check.sh
│   ├── test-helpers.sh
│   └── project-validator.sh
├── security/                    # Security patterns
│   ├── security-basics.sh
│   └── dependency-basics.sh
├── git/                         # Git integration patterns
│   ├── git-hooks-setup.sh
│   ├── pre-commit-checks.sh
│   └── pre-push-checks.sh
├── docs/                        # Documentation patterns
│   ├── docs-generator.sh
│   └── readme-template.sh
├── setup/                       # Project setup patterns
│   └── project-setup.sh
└── languages/                   # Language-specific patterns
    ├── nodejs-patterns.sh
    ├── python-patterns.sh
    ├── web-app-patterns.sh
    └── go-patterns.sh
```

### /scripts/ - Complete Ready-to-Use Scripts
```
scripts/
├── universal-quality-check.sh   # All-in-one quality validation
├── universal-test-runner.sh     # Universal test execution
├── quick-security-scan.sh       # Basic security check
├── setup-git-hooks.sh          # Git hooks installer
└── validate-project.sh         # Project structure validator
```

### /templates/ - Project Type Templates
```
templates/
├── web-app/
│   ├── package.json
│   ├── index.html
│   ├── src/
│   ├── .eslintrc.js
│   └── README.md
├── api/
│   ├── package.json
│   ├── server.js
│   ├── routes/
│   ├── .env.example
│   └── README.md
├── cli/
│   ├── bin/
│   ├── lib/
│   ├── package.json
│   └── README.md
├── ai-pipeline/
│   ├── requirements.txt
│   ├── src/
│   ├── data/
│   ├── notebooks/
│   └── README.md
└── library/
    ├── package.json
    ├── src/
    ├── tests/
    ├── docs/
    └── README.md
```

### /examples/ - Usage Examples
```
examples/
├── basic-nodejs/                # Working Node.js example
│   ├── package.json
│   ├── app.js
│   ├── apply-patterns.sh        # Shows how to use patterns
│   └── README.md
├── basic-python/                # Working Python example
│   ├── requirements.txt
│   ├── main.py
│   ├── apply-patterns.sh
│   └── README.md
├── basic-web-app/               # Working web app example
│   ├── package.json
│   ├── index.html
│   ├── apply-patterns.sh
│   └── README.md
└── pattern-combinations/        # How to combine patterns
    ├── web-app-with-security.sh
    ├── api-with-quality-gates.sh
    └── cli-with-docs.sh
```

### /docs/ - Documentation
```
docs/
├── quick-start.md               # Get started in 5 minutes
├── pattern-guide.md             # How to use patterns
├── adaptation-guide.md          # How to modify patterns
├── best-practices.md            # Recommended approaches
├── troubleshooting.md           # Common issues
└── contributing.md              # How to contribute
```

### /tests/ - Pattern Validation
```
tests/
├── test-all-patterns.sh         # Test all patterns work
├── test-pattern-combinations.sh # Test patterns work together
├── test-examples.sh             # Test example projects
└── validation/
    ├── nodejs-validation.sh
    ├── python-validation.sh
    └── web-app-validation.sh
```

## Key Files Content

### README.md (Human-Readable)
```markdown
# Dev Platform - Claude Code Pattern Library

A collection of simple, reusable development patterns designed for Claude Code projects.

## Quick Start
1. Copy patterns you need into your project
2. Adapt paths and configuration
3. Run and enjoy!

## Available Patterns
- **Quality:** test-runner, quality-check, project-validator
- **Security:** security-basics, dependency-check
- **Git:** git-hooks, pre-commit, pre-push
- **Languages:** nodejs, python, web-app

[Links to examples and documentation]
```

### CLAUDE.md (Claude-Specific Instructions)
```markdown
# Instructions for Claude Code

## How to Use This Pattern Library

When a user asks for project setup, quality checks, or automation:

1. **Identify project type** (web-app, api, cli, ai-pipeline, library)
2. **Select relevant patterns** from /patterns/ directory
3. **Copy and adapt** patterns to user's project
4. **Explain what each pattern does** and how to customize

## Pattern Selection Guide
- All projects: foundation/simple-error-handling.sh, quality/quality-check.sh
- Web apps: languages/web-app-patterns.sh, git/git-hooks-setup.sh
- APIs: languages/nodejs-patterns.sh, security/security-basics.sh
- Python: languages/python-patterns.sh, security/dependency-basics.sh

## Usage Examples
[Detailed examples of how Claude should use patterns]
```

### LICENSE (MIT)
```
MIT License - Standard open source license
```

## Organization Principles

### 1. Claude-First Design
- **Patterns directory:** Easy for Claude to browse and understand
- **Clear naming:** Obvious what each pattern does
- **Self-contained:** Each pattern works independently
- **Well-commented:** Claude can understand and adapt quickly

### 2. Human-Friendly
- **README.md:** Clear overview for humans visiting the repo
- **Examples directory:** Working examples to learn from
- **Documentation:** Comprehensive guides and troubleshooting

### 3. Maintainable
- **Small files:** Each pattern < 50 lines
- **No complex dependencies:** Basic Unix tools only
- **Tested:** Each pattern has validation tests
- **Versioned:** Clear semantic versioning

### 4. Extensible
- **Template system:** Easy to add new project types
- **Pattern categories:** Logical organization for growth
- **Language-specific:** Easy to add new languages
- **Community-ready:** Issue templates and contributing guide

## File Naming Conventions

### Patterns:
- **Descriptive names:** `simple-error-handling.sh` not `error.sh`
- **Hyphen-separated:** `git-hooks-setup.sh` not `gitHooksSetup.sh`
- **Purpose-clear:** Name indicates what it does

### Templates:
- **Project type:** `web-app/`, `api/`, `cli/`
- **Standard files:** `package.json`, `README.md`, etc.
- **No vendor lock-in:** Generic configurations

### Examples:
- **Working projects:** Complete, runnable examples
- **Apply scripts:** Show how to use patterns
- **Clear README:** Explain what example demonstrates

## Repository Settings

### GitHub Configuration:
- **Public repository:** Open source and accessible
- **Good description:** "Simple development patterns for Claude Code projects"
- **Topics:** `claude-code`, `development-patterns`, `automation`, `devops`
- **Wiki enabled:** For additional documentation
- **Issues enabled:** For community feedback
- **Discussions enabled:** For questions and ideas

### Branch Protection:
- **Main branch protected:** Require PR reviews
- **CI checks required:** All tests must pass
- **No direct pushes:** Changes through PRs only

This structure ensures the repository is immediately useful for Claude Code while being maintainable and extensible.