---
allowed-tools: Read, Write
argument-hint: [research-results-json] or [design-requirements]
description: Design agent architecture based on research findings
category: agent-builder
---

# Agent Design Phase

Design agent architecture based on research findings: **$ARGUMENTS**

## Design Process

I'll create a comprehensive design specification for the agent based on the research findings:

### 1. Parse Research Results
First, I'll analyze the research results provided in $ARGUMENTS to extract:
- Key requirements and capabilities
- Recommended tools and permissions
- Best practices to implement
- Performance and security considerations

### 2. Agent Architecture Design
Design the core agent structure:

#### Core Identity
- **Name**: Clear, descriptive agent name
- **Purpose**: Single, focused responsibility
- **Scope**: Well-defined boundaries and limitations

#### Capability Mapping
- **Primary Functions**: Core capabilities the agent provides
- **Tool Requirements**: Specific tools needed for each function
- **Input/Output Patterns**: Expected interaction patterns
- **Error Handling**: How the agent handles failures

#### Integration Design
- **Claude Code Integration**: How it leverages native features
- **Chainability**: How it works with other agents/commands
- **Context Management**: How it handles conversation context
- **Session Support**: If/how it maintains state

### 3. System Prompt Architecture
Design the system prompt structure:

#### Role Definition
- Clear role and expertise definition
- Behavioral guidelines and constraints
- Communication style and tone

#### Instruction Structure
- Primary responsibilities
- Step-by-step processes
- Decision-making frameworks
- Output formatting requirements

#### Safety and Security
- Input validation guidelines
- Security constraints
- Privacy considerations
- Safe failure modes

### 4. Technical Specifications
Define technical requirements:

#### YAML Frontmatter
- Required metadata fields
- Tool permissions (following least privilege)
- Category and classification
- Version and compatibility info

#### Performance Targets
- Token efficiency goals
- Response time expectations
- Memory usage constraints
- Initialization speed targets

## Design Output

The design will be structured as detailed JSON:

```json
{
  "design_version": "1.0",
  "agent_specification": {
    "identity": {
      "name": "agent-name",
      "description": "clear description",
      "purpose": "single focused purpose",
      "expertise_domains": []
    },
    "capabilities": {
      "primary_functions": [],
      "supported_scenarios": [],
      "input_patterns": [],
      "output_patterns": []
    },
    "technical_requirements": {
      "required_tools": [],
      "optional_tools": [],
      "permissions": [],
      "dependencies": []
    },
    "system_prompt_structure": {
      "role_definition": "...",
      "core_instructions": [],
      "behavioral_guidelines": [],
      "output_format": "...",
      "error_handling": "..."
    },
    "integration_specification": {
      "claude_code_features": [],
      "chainability": "yes/no",
      "session_support": "yes/no",
      "context_requirements": "minimal/moderate/high"
    },
    "performance_targets": {
      "max_tokens": 0000,
      "response_time": "fast/moderate/slow",
      "initialization_time": "instant/fast/moderate",
      "memory_efficiency": "high/moderate/low"
    }
  },
  "implementation_plan": {
    "development_phases": [],
    "testing_strategy": "...",
    "validation_criteria": [],
    "success_metrics": []
  },
  "next_step_requirements": {
    "prototype_priorities": [],
    "critical_features": [],
    "optional_features": []
  }
}
```

## Design Principles

### Simplicity First
- Single responsibility principle
- Clear, focused purpose
- Minimal complexity

### Native Integration
- Leverage Claude Code built-in features
- Follow established patterns
- Maintain compatibility

### Performance Conscious
- Token efficient design
- Fast initialization
- Responsive interaction

### Security Aware
- Principle of least privilege
- Input validation consideration
- Safe default behaviors

## Usage

### Standalone Design
```
/agent-builder:02-design [research-results-json]
```

### As Part of Chain
This command receives research results from step 01 and outputs design specifications for step 03 (prototype).

## Success Criteria

- Complete agent specification
- Clear implementation guidance
- Performance and security considered
- Ready for prototype development

The design phase transforms research insights into a concrete blueprint for agent implementation.