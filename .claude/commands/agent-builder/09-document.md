---
allowed-tools: Write, Read
argument-hint: [enhancement-results-json] or [agent-name]
description: Generate comprehensive documentation for the agent
category: agent-builder
---

# Agent Documentation Phase

Generate comprehensive documentation for the agent: **$ARGUMENTS**

## Documentation Process

I'll create complete, user-friendly documentation based on the enhanced agent:

### 1. Parse Enhancement Results
Analyze enhancement outcomes to understand:
- Final agent capabilities
- Advanced features implemented
- Performance characteristics
- User experience improvements
- Integration capabilities

### 2. Documentation Strategy

#### Target Audiences
- **End Users**: Developers who will use the agent
- **Contributors**: Developers who might modify the agent
- **Integrators**: Those building workflows with the agent
- **Maintainers**: Those responsible for agent upkeep

#### Documentation Types
- **Quick Start Guide**: Get up and running fast
- **Complete Reference**: Comprehensive capability overview
- **Integration Guide**: How to use with other tools
- **Troubleshooting Guide**: Common issues and solutions
- **Development Guide**: For contributors and maintainers

### 3. Core Documentation Creation

#### Agent Overview Documentation
```markdown
# [Agent Name] - Claude Code Agent

## Overview
Brief description of what the agent does and why it's useful.

## Key Features
- Feature 1: Description and benefit
- Feature 2: Description and benefit
- Advanced Feature 3: Description and benefit

## Quick Start
Basic usage example that gets users started immediately.

## Use Cases
Primary scenarios where this agent adds value.
```

#### Usage Documentation
```markdown
## Usage Guide

### Basic Usage
Step-by-step instructions for common scenarios.

### Advanced Features
How to use enhanced capabilities.

### Integration Patterns
How to combine with other agents/commands.

### Configuration Options
Available settings and customization.
```

#### Technical Documentation
```markdown
## Technical Reference

### Input Specifications
- Expected input formats
- Parameter requirements
- Validation rules

### Output Formats
- Standard output structure
- Error message formats
- Success indicators

### Tool Requirements
- Required permissions
- Optional tools
- Integration dependencies
```

### 4. User Experience Documentation

#### Quick Reference Card
```markdown
# [Agent Name] Quick Reference

## Common Commands
- Basic usage: `command example`
- Advanced usage: `command with options`
- Help: `how to get help`

## Key Features
- Most important capabilities
- Performance characteristics
- Integration points
```

#### Troubleshooting Guide
```markdown
# Troubleshooting Guide

## Common Issues
1. **Issue**: Description
   **Solution**: Step-by-step fix
   **Prevention**: How to avoid

2. **Issue**: Another common problem
   **Solution**: How to resolve
   **Prevention**: Best practices
```

#### Best Practices Guide
```markdown
# Best Practices

## Usage Patterns
- Recommended approaches
- Performance tips
- Integration guidelines

## What to Avoid
- Common mistakes
- Performance pitfalls
- Security considerations
```

### 5. Developer Documentation

#### Architecture Overview
```markdown
# Architecture Documentation

## Design Principles
- Key design decisions
- Architecture rationale
- Performance considerations

## Component Overview
- Major components
- Interaction patterns
- Data flow
```

#### Contribution Guidelines
```markdown
# Contributing to [Agent Name]

## Development Setup
- Prerequisites
- Local development
- Testing procedures

## Contribution Process
- How to contribute
- Code standards
- Review process
```

### 6. Integration Documentation

#### Workflow Examples
```markdown
# Integration Examples

## Common Workflows
### Workflow 1: [Name]
Step-by-step example with code

### Workflow 2: [Name]
Another practical example

## Chain Integration
How to use in command chains
```

#### API Reference
```markdown
# API Reference

## Input Interface
Detailed input specification

## Output Interface
Complete output documentation

## Error Handling
Error codes and recovery
```

## Documentation Generation

I'll create comprehensive documentation covering all aspects:

### Primary Documentation Files

#### README.md
```markdown
# [Agent Name]

[Compelling description of the agent and its value proposition]

## Features
- [Key capabilities with brief descriptions]

## Quick Start
[Minimal example to get users started]

## Installation
[How to use this agent]

## Usage Examples
[Common use cases with code examples]

## Documentation
- [Quick Reference](docs/quick-reference.md)
- [Complete Guide](docs/complete-guide.md)
- [API Reference](docs/api-reference.md)
- [Troubleshooting](docs/troubleshooting.md)

## Contributing
[How to contribute to development]

## License
[License information]
```

#### Complete User Guide
```markdown
# [Agent Name] Complete Guide

## Table of Contents
1. Introduction
2. Getting Started
3. Core Features
4. Advanced Features
5. Integration Guide
6. Best Practices
7. Troubleshooting
8. FAQ

[Comprehensive coverage of all topics]
```

#### API Reference
```markdown
# [Agent Name] API Reference

## Overview
Complete technical reference for developers.

## Input Specifications
Detailed parameter documentation.

## Output Formats
Complete output structure documentation.

## Error Handling
Error codes, messages, and recovery patterns.

## Examples
Code examples for all major functions.
```

## Documentation Quality Assurance

### Content Standards
- **Clarity**: Easy to understand language
- **Completeness**: Covers all functionality
- **Accuracy**: Technically correct information
- **Consistency**: Uniform style and structure
- **Usefulness**: Practical, actionable guidance

### Structure Standards
- **Logical Organization**: Information flows naturally
- **Easy Navigation**: Clear headings and links
- **Progressive Disclosure**: Basic to advanced information
- **Quick Access**: Reference materials easily found
- **Visual Clarity**: Good formatting and layout

## Documentation Output Format

```json
{
  "documentation_phase": "comprehensive_docs",
  "agent_documented": "[agent-name]",
  "documentation_timestamp": "2025-01-XX",
  "documentation_created": {
    "primary_files": [
      "README.md",
      "docs/quick-reference.md",
      "docs/complete-guide.md",
      "docs/api-reference.md",
      "docs/troubleshooting.md"
    ],
    "supplementary_files": [
      "docs/architecture.md",
      "docs/contributing.md",
      "docs/examples.md",
      "docs/best-practices.md"
    ],
    "total_documents": 0,
    "word_count": 0000,
    "coverage_assessment": "comprehensive"
  },
  "documentation_quality": {
    "clarity_score": "excellent/good/fair",
    "completeness_score": "complete/mostly_complete/partial",
    "accuracy_score": "accurate/mostly_accurate/needs_review",
    "usefulness_score": "very_useful/useful/basic"
  },
  "target_audience_coverage": {
    "end_users": "excellent/good/basic",
    "contributors": "excellent/good/basic",
    "integrators": "excellent/good/basic",
    "maintainers": "excellent/good/basic"
  },
  "documentation_metrics": {
    "getting_started_time": "X minutes",
    "reference_completeness": "X%",
    "example_coverage": "X%",
    "troubleshooting_coverage": "X%"
  },
  "ready_for_finalization": true/false
}
```

## Usage

### Standalone Documentation
```
/agent-builder:09-document [enhancement-results-json]
```

### As Part of Chain
This command receives enhancement results from step 08 and outputs documentation results for step 10 (finalization).

## Success Criteria

- Comprehensive documentation created
- All user types can find needed information
- Clear examples and usage patterns provided
- Troubleshooting and FAQ sections complete
- Professional presentation and organization
- Ready for production deployment

The documentation phase ensures users can effectively discover, understand, and utilize the agent's full capabilities.