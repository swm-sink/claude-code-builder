---
allowed-tools: Write, Read
argument-hint: [design-specification-json] or [agent-requirements]
description: Create agent prototype from design specifications
category: agent-builder
---

# Agent Prototype Phase

Create working agent prototype from design specifications: **$ARGUMENTS**

## Prototype Development Process

I'll implement the agent based on the design specifications provided:

### 1. Parse Design Specifications
Extract key implementation details from the design JSON:
- Agent identity and metadata
- Required tools and permissions
- System prompt structure
- Performance targets
- Integration requirements

### 2. Generate YAML Frontmatter
Create proper Claude Code frontmatter:

```yaml
---
name: [agent-name]
description: [clear, concise description]
tools: [minimal required tools only]
category: [appropriate category]
version: 1.0.0
---
```

### 3. Implement System Prompt
Build the agent's system prompt following the design:

#### Role and Expertise Definition
- Clear statement of the agent's role
- Domain expertise and capabilities
- Behavioral guidelines and constraints

#### Core Instructions
- Primary responsibilities and functions
- Step-by-step process guidance
- Decision-making frameworks
- Quality standards and requirements

#### Input/Output Specifications
- Expected input formats and validation
- Output formatting requirements
- Error handling and messaging
- Progress reporting patterns

#### Integration Instructions
- How to work with other agents/commands
- Claude Code feature utilization
- Context management guidelines
- Session and state handling

### 4. Implement Core Logic
Structure the agent's operational logic:

#### Process Framework
Clear, step-by-step process for handling requests:
1. Input validation and parsing
2. Core processing logic
3. Output generation and formatting
4. Error handling and recovery

#### Safety Measures
- Input validation and sanitization
- Safe failure modes
- Resource usage limits
- Privacy and security protections

### 5. Create Agent File
Write the complete agent to the appropriate location:
- Save to `.claude/agents/[agent-name].md`
- Ensure proper file permissions
- Validate YAML syntax
- Confirm readability

## Implementation Standards

### Code Quality
- Clear, readable markdown structure
- Proper YAML frontmatter formatting
- Consistent naming conventions
- Appropriate tool permissions

### Security Considerations
- Minimal required permissions only
- Input validation awareness
- Safe default behaviors
- Privacy protection measures

### Performance Optimization
- Efficient prompt structure
- Minimal token usage
- Fast initialization
- Responsive interactions

### Claude Code Integration
- Native feature utilization
- Standard pattern compliance
- Ecosystem compatibility
- Chain-friendly design

## Prototype Output

The prototype will generate:

```json
{
  "prototype_status": "completed",
  "agent_details": {
    "file_path": ".claude/agents/[name].md",
    "name": "[agent-name]",
    "description": "...",
    "tools_required": [],
    "file_size": "X lines",
    "token_estimate": 0000
  },
  "implementation_notes": {
    "key_features": [],
    "design_decisions": [],
    "optimization_applied": [],
    "security_measures": []
  },
  "validation_required": {
    "syntax_check": "pending",
    "functionality_test": "pending",
    "security_review": "pending",
    "performance_check": "pending"
  },
  "next_steps": [
    "Basic functionality testing",
    "Advanced scenario testing",
    "Security validation",
    "Performance optimization"
  ]
}
```

## Quality Assurance

### Implementation Checklist
- [ ] YAML frontmatter is valid and complete
- [ ] System prompt is clear and focused
- [ ] Tool permissions follow least privilege
- [ ] File is properly formatted and readable
- [ ] Agent follows design specifications
- [ ] Integration patterns are implemented
- [ ] Error handling is included
- [ ] Performance is optimized

### Validation Points
- Syntax validation of YAML and markdown
- Completeness check against design spec
- Security review of permissions and logic
- Performance assessment of token usage

## Usage

### Standalone Prototype
```
/agent-builder:03-prototype [design-specification-json]
```

### As Part of Chain
This command receives design specifications from step 02 and creates the prototype for testing in step 04.

## Success Criteria

- Working agent file created
- All design requirements implemented
- Proper Claude Code integration
- Ready for functional testing
- Documentation and metadata complete

The prototype phase transforms the design specification into a working agent that can be tested and validated.