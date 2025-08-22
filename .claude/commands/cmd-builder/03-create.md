---
allowed-tools: Write, Read
argument-hint: [design-specification-json] or [command-name]
description: Create command implementation from design specifications
category: cmd-builder
---

# Command Creation Phase

Create command implementation from design specifications: **$ARGUMENTS**

## Creation Process

I'll implement the command based on the detailed design specifications:

### 1. Parse Design Specifications
Extract implementation details from the design JSON:
- Command metadata and identity
- Interface specifications and parameters
- Tool requirements and permissions
- Logic flow and error handling
- Integration and performance requirements

### 2. Generate YAML Frontmatter
Create proper Claude Code frontmatter structure:

```yaml
---
allowed-tools: [tool1, tool2, tool3]  # Minimal required permissions
argument-hint: [parameter-structure]   # Clear parameter guidance
description: [user-facing description] # Concise functionality description
category: [command-category]          # Appropriate categorization
version: 1.0.0                       # Semantic versioning
---
```

**Frontmatter Quality Criteria:**
- Tools follow least privilege principle
- Argument hint is clear and helpful
- Description is concise but informative
- Category matches command purpose
- Version follows semantic conventions

### 3. Implement Command Logic

#### Core Functionality Implementation
Build the main command logic following the design:

**Input Processing**
```markdown
# Parameter handling
Parse and validate $ARGUMENTS:
- Extract parameters from input
- Validate format and content
- Provide clear error messages for invalid input
- Set default values where appropriate
```

**Core Processing Logic**
```markdown
# Main functionality
Implement the primary command purpose:
- Follow the designed execution flow
- Handle each step systematically
- Maintain clear progress indication
- Implement efficient algorithms
```

**Output Generation**
```markdown
# Result formatting
Generate appropriate output:
- Format according to design specifications
- Ensure consistent structure
- Provide meaningful feedback
- Include success/status indicators
```

#### Error Handling Implementation
Implement comprehensive error handling:

**Input Validation Errors**
```markdown
# Validation error handling
- Check parameter format and content
- Provide specific error messages
- Suggest correct usage format
- Guide user to help resources
```

**Processing Errors**
```markdown
# Runtime error handling
- Catch and handle processing failures
- Provide meaningful error descriptions
- Suggest recovery actions
- Maintain graceful degradation
```

**System Errors**
```markdown
# System-level error handling
- Handle tool permission issues
- Manage resource availability problems
- Provide fallback behaviors
- Log appropriate information
```

### 4. User Experience Implementation

#### Help and Documentation
```markdown
# Integrated help system
When user needs assistance:
- Provide usage examples
- Explain parameter options
- Show common patterns
- Link to additional resources
```

#### Progress Feedback
```markdown
# User feedback during execution
For longer operations:
- Show progress indicators
- Provide status updates
- Indicate completion
- Confirm successful actions
```

#### Error Guidance
```markdown
# Helpful error responses
When errors occur:
- Explain what went wrong
- Suggest specific fixes
- Provide alternative approaches
- Offer additional resources
```

### 5. Integration Features

#### $ARGUMENTS Processing
```markdown
# Dynamic parameter handling
Process $ARGUMENTS effectively:
- Parse different parameter formats
- Handle single and multiple parameters
- Support optional parameters
- Maintain backward compatibility
```

#### Chain Compatibility
```markdown
# Command chaining support
Enable use in command chains:
- Accept input from previous commands
- Format output for next commands
- Maintain context appropriately
- Handle state transitions
```

### 6. Performance and Security Implementation

#### Performance Optimization
```markdown
# Efficiency measures
Optimize command performance:
- Minimize resource usage
- Implement caching where beneficial
- Optimize algorithm efficiency
- Reduce response time
```

#### Security Measures
```markdown
# Security implementation
Implement security best practices:
- Validate all inputs thoroughly
- Use minimal required permissions
- Sanitize outputs appropriately
- Handle sensitive data safely
```

## Implementation Standards

### Code Quality Requirements
- Clear, readable markdown structure
- Proper YAML frontmatter formatting
- Consistent naming conventions
- Appropriate tool permissions
- Comprehensive error handling

### Claude Code Integration
- Native feature utilization
- Standard pattern compliance
- Ecosystem compatibility
- Chain-friendly design
- Performance optimization

### User Experience Standards
- Clear command purpose
- Intuitive parameter structure
- Helpful error messages
- Comprehensive help system
- Consistent output formatting

## Command File Generation

I'll create the complete command file:

```markdown
---
allowed-tools: [required-tools-list]
argument-hint: [parameter-structure]
description: [clear-description]
category: [category]
version: 1.0.0
---

# [Command Name]

[Brief description of command purpose and value]

## Usage

[Clear usage instructions and examples]

### Basic Usage
```
/command-name [basic-parameters]
```

### Advanced Usage
```
/command-name [advanced-parameters]
```

## Implementation

[Main command logic following design specifications]

### Input Processing
[Parameter parsing and validation logic]

### Core Functionality  
[Main processing logic implementation]

### Output Generation
[Result formatting and response generation]

### Error Handling
[Comprehensive error handling implementation]

## Help and Examples

[Integrated help system and usage examples]
```

## Creation Output Format

```json
{
  "creation_phase": "command_implementation",
  "command_created": "[command-name]",
  "creation_timestamp": "2025-01-XX",
  "implementation_details": {
    "file_path": ".claude/commands/[category]/[command-name].md",
    "file_size": "X lines",
    "token_estimate": 0000,
    "complexity_level": "simple/moderate/complex"
  },
  "feature_implementation": {
    "core_functionality": "✅ implemented",
    "error_handling": "✅ comprehensive",
    "help_system": "✅ integrated",
    "chain_compatibility": "✅ enabled",
    "performance_optimization": "✅ applied"
  },
  "code_quality": {
    "frontmatter_valid": true,
    "naming_consistent": true,
    "permissions_minimal": true,
    "structure_clear": true,
    "documentation_complete": true
  },
  "validation_required": {
    "syntax_check": "pending",
    "functionality_test": "pending",
    "argument_handling_test": "pending",
    "tool_permission_test": "pending",
    "integration_test": "pending"
  },
  "next_steps": [
    "Argument handling testing",
    "Tool permission validation", 
    "Functionality verification",
    "Integration testing",
    "Performance validation"
  ]
}
```

## Implementation Verification

### Quality Checklist
- [ ] YAML frontmatter is valid and complete
- [ ] Command logic follows design specification
- [ ] Error handling is comprehensive
- [ ] Help system is integrated and useful
- [ ] Tool permissions are minimal and appropriate
- [ ] Code is readable and well-structured
- [ ] Performance considerations are addressed
- [ ] Security measures are implemented

### Compliance Verification
- [ ] Follows Claude Code standards
- [ ] Implements design specification
- [ ] Maintains user experience requirements
- [ ] Meets performance targets
- [ ] Satisfies security requirements

## Usage

### Standalone Creation
```
/cmd-builder:03-create [design-specification-json]
```

### As Part of Chain
This command receives design specifications from step 02 and outputs implementation details for step 04 (argument testing).

## Success Criteria

- Complete command file created
- All design requirements implemented
- Code quality standards met
- Claude Code integration achieved
- Ready for comprehensive testing
- Performance and security addressed

The creation phase transforms the design specification into a working command that implements all planned functionality with proper error handling, user experience, and integration capabilities.