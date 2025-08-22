---
allowed-tools: Read, Write
argument-hint: [analysis-results-json] or [command-requirements]
description: Design command structure and interface based on analysis
category: cmd-builder
---

# Command Design Phase

Design command structure and interface based on analysis: **$ARGUMENTS**

## Design Process

I'll create a comprehensive command design based on the analysis results:

### 1. Parse Analysis Results
Extract design requirements from analysis findings:
- Command purpose and functionality
- Technical requirements and constraints
- User experience goals
- Performance and security requirements
- Integration needs and patterns

### 2. Command Architecture Design

#### Core Command Structure
Design the fundamental command architecture:

**Identity Definition**
```yaml
# Command metadata design
name: [command-name]
description: [clear, concise description]
category: [appropriate category]
version: 1.0.0
```

**Functionality Specification**
```
Primary Function: [main purpose]
Secondary Functions: [supporting capabilities]
Scope Boundaries: [what it will NOT do]
Success Criteria: [how success is measured]
```

#### Interface Design

**Parameter Structure**
```yaml
# YAML frontmatter design
allowed-tools: [minimal required tools]
argument-hint: [parameter-structure]
description: [user-facing description]
category: [command-category]
```

**Argument Processing Design**
```markdown
# $ARGUMENTS parsing strategy
- Simple format: single parameter
- Complex format: structured parameters
- Optional parameters: handling strategy
- Validation approach: input checking
```

**Input/Output Specification**
```
Input Format: [expected parameter format]
Input Validation: [validation rules]
Output Format: [response structure]
Error Handling: [error response format]
```

### 3. User Experience Design

#### Command Invocation Patterns
```bash
# Basic usage
/command-name [simple-parameter]

# Advanced usage  
/command-name [parameter] [options]

# Help usage
/command-name --help
```

#### Help and Documentation Design
```markdown
# Integrated help system
- Brief description
- Usage examples
- Common patterns
- Error resolution
```

#### Progress and Feedback Design
```
Progress Indication: [for long operations]
Status Messages: [informative feedback]
Success Confirmation: [completion messages]
Error Guidance: [helpful error messages]
```

### 4. Technical Design Specification

#### Tool Requirements Design
```yaml
# Minimal tool permissions
allowed-tools: 
  - Read  # If file reading needed
  - Write # If file writing needed
  - Bash(specific:*) # If shell commands needed
  - WebSearch # If research needed
```

**Tool Usage Patterns**
```
Tool Selection Rationale:
- [tool]: [why needed and how used]
- Security implications: [permission justification]
- Performance considerations: [resource usage]
```

#### Logic Flow Design
```markdown
# Command execution flow
1. Input validation and parsing
2. Core processing logic
3. Output generation and formatting
4. Error handling and recovery
5. Cleanup and finalization
```

#### Error Handling Strategy
```
Error Categories:
- Input validation errors: [handling approach]
- Processing errors: [recovery strategy]
- Tool permission errors: [user guidance]
- System errors: [fallback behavior]
```

### 5. Integration Design

#### Chain Compatibility
```
Input from previous commands: [format expected]
Output to next commands: [format provided]
Context requirements: [what context is needed]
State management: [how state is handled]
```

#### Claude Code Feature Integration
```
Native features utilized:
- $ARGUMENTS processing: [approach]
- Tool permissions: [security model]
- Session management: [context handling]
- Error reporting: [user feedback]
```

### 6. Performance and Security Design

#### Performance Optimization
```
Response Time Targets: [acceptable timing]
Resource Usage Limits: [memory/CPU constraints]
Caching Opportunities: [what can be cached]
Optimization Strategies: [efficiency approaches]
```

#### Security Considerations
```
Input Sanitization: [validation approach]
Permission Model: [least privilege application]
Output Safety: [secure output handling]
Error Information: [safe error disclosure]
```

## Design Output

The design will be structured as comprehensive specification:

```json
{
  "command_design": {
    "metadata": {
      "name": "[command-name]",
      "description": "[clear description]",
      "category": "[category]",
      "version": "1.0.0",
      "complexity_level": "simple/moderate/complex"
    },
    "architecture": {
      "primary_function": "...",
      "secondary_functions": [],
      "scope_boundaries": [],
      "success_criteria": []
    },
    "interface_specification": {
      "parameter_structure": {
        "format": "...",
        "validation_rules": [],
        "examples": []
      },
      "frontmatter_design": {
        "allowed_tools": [],
        "argument_hint": "...",
        "description": "...",
        "category": "..."
      },
      "input_output": {
        "input_format": "...",
        "output_format": "...",
        "error_format": "..."
      }
    },
    "user_experience": {
      "invocation_patterns": [],
      "help_system": "...",
      "progress_feedback": "...",
      "error_guidance": "..."
    },
    "technical_specification": {
      "tool_requirements": {
        "required_tools": [],
        "optional_tools": [],
        "permission_justification": "..."
      },
      "execution_flow": [],
      "error_handling": {
        "validation_errors": "...",
        "processing_errors": "...",
        "system_errors": "..."
      }
    },
    "integration_design": {
      "chain_compatibility": {
        "input_handling": "...",
        "output_format": "...",
        "context_requirements": "..."
      },
      "claude_code_integration": {
        "native_features": [],
        "standard_patterns": [],
        "ecosystem_compatibility": "..."
      }
    },
    "performance_security": {
      "performance_targets": {
        "response_time": "...",
        "resource_usage": "...",
        "optimization_strategies": []
      },
      "security_measures": {
        "input_validation": "...",
        "permission_model": "...",
        "output_safety": "..."
      }
    }
  },
  "implementation_guidance": {
    "development_approach": "...",
    "testing_strategy": "...",
    "validation_criteria": [],
    "success_metrics": []
  },
  "next_step_requirements": {
    "implementation_priorities": [],
    "critical_features": [],
    "optional_enhancements": []
  }
}
```

## Design Validation

### Design Quality Checklist
- [ ] Clear command purpose and scope
- [ ] User-friendly interface design
- [ ] Appropriate tool permissions
- [ ] Robust error handling plan
- [ ] Performance considerations addressed
- [ ] Security measures included
- [ ] Integration compatibility ensured
- [ ] Implementation guidance provided

### Design Principles Applied
- **Simplicity**: Interface is intuitive and straightforward
- **Consistency**: Follows Claude Code patterns and conventions
- **Security**: Implements principle of least privilege
- **Performance**: Optimized for efficiency and responsiveness
- **Usability**: Focuses on positive user experience
- **Maintainability**: Clear structure and documentation

## Usage

### Standalone Design
```
/cmd-builder:02-design [analysis-results-json]
```

### As Part of Chain
This command receives analysis results from step 01 and outputs design specifications for step 03 (creation).

## Success Criteria

- Comprehensive command design specification created
- User experience thoroughly considered
- Technical requirements clearly defined
- Integration patterns established
- Security and performance addressed
- Ready for implementation phase

The design phase transforms analysis insights into a concrete blueprint for command implementation that balances functionality, usability, and technical excellence.