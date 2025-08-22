---
allowed-tools: WebSearch, WebFetch, Write, Read
argument-hint: [command-purpose] or [requirements-description]
description: Analyze requirements and research patterns for custom command
category: cmd-builder
---

# Command Analysis Phase

Analyze requirements and research patterns for command: **$ARGUMENTS**

## Analysis Process

I'll conduct comprehensive analysis to understand the command requirements and research current patterns:

### 1. Requirements Analysis
Parse and understand the command purpose: $ARGUMENTS

**Requirement Categories:**
- **Primary Function**: What should the command do?
- **Input Requirements**: What data/parameters does it need?
- **Output Expectations**: What should it produce?
- **Integration Needs**: How should it work with other commands?
- **User Experience**: Who will use it and how?

**Analysis Questions:**
- What problem does this command solve?
- What are the typical use cases?
- What are the edge cases to consider?
- How should errors be handled?
- What level of complexity is appropriate?

### 2. Pattern Research
Research current best practices for this type of command:

#### Claude Code Command Patterns (2024-2025)
- Slash command structure and syntax
- YAML frontmatter best practices
- $ARGUMENTS usage patterns
- Tool permission recommendations
- Output formatting standards

#### Similar Command Analysis
- Existing commands with similar functionality
- Community implementations
- Best practice patterns
- Common anti-patterns to avoid

#### Integration Patterns
- How commands work in chains
- Context passing between commands
- Session management approaches
- Error handling strategies

### 3. Technical Analysis

#### Tool Requirements Assessment
```
Analysis: What tools are needed?
- Required tools: [minimum needed for functionality]
- Optional tools: [nice-to-have for enhanced features]
- Security considerations: [permission implications]
- Performance implications: [resource usage]
```

#### Complexity Assessment
```
Analysis: Command complexity level
- Simple: Single action, minimal logic
- Moderate: Multiple steps, some conditionals
- Complex: Advanced logic, multiple integrations
- Integration: Requires external system connections
```

#### Performance Requirements
```
Analysis: Performance expectations
- Response time targets
- Resource usage constraints
- Scalability considerations
- Caching opportunities
```

### 4. User Experience Analysis

#### Target Audience
```
Analysis: Who will use this command?
- Beginner developers
- Experienced developers
- Specific domain experts
- General users
```

#### Usage Patterns
```
Analysis: How will it be used?
- Standalone execution
- Part of workflow chains
- Repeated usage patterns
- Integration with other tools
```

#### Interface Design
```
Analysis: User interface considerations
- Parameter structure
- Help and documentation needs
- Error message requirements
- Output format preferences
```

### 5. Research Implementation

I'll conduct systematic research to gather current information:

**Research Query 1**: Command type best practices
```
Searching: "[command-type] command implementation best practices 2024 2025"
Focus: Current standards and recommendations
```

**Research Query 2**: Claude Code specific patterns
```
Searching: "Claude Code custom commands slash commands patterns"
Focus: Native integration and best practices
```

**Research Query 3**: Similar implementations
```
Searching: "Claude Code [command-purpose] examples implementations"
Focus: Working examples and proven patterns
```

## Analysis Output

The analysis will produce structured requirements and research:

```json
{
  "command_analysis": {
    "command_purpose": "$ARGUMENTS",
    "analysis_date": "2025-01-XX",
    "requirements": {
      "primary_function": "...",
      "input_requirements": [],
      "output_expectations": "...",
      "integration_needs": [],
      "user_experience_goals": []
    },
    "complexity_assessment": {
      "level": "simple/moderate/complex/integration",
      "reasoning": "...",
      "estimated_development_time": "X minutes",
      "recommended_approach": "..."
    },
    "technical_requirements": {
      "required_tools": [],
      "optional_tools": [],
      "permission_level": "minimal/moderate/extensive",
      "performance_targets": {
        "response_time": "fast/moderate/slow",
        "resource_usage": "low/moderate/high"
      }
    },
    "user_experience_design": {
      "target_audience": [],
      "usage_patterns": [],
      "interface_requirements": {
        "parameter_structure": "...",
        "help_text_needs": "...",
        "error_handling_approach": "...",
        "output_format": "..."
      }
    }
  },
  "research_findings": {
    "best_practices": {
      "command_patterns": [],
      "claude_code_integration": [],
      "performance_optimization": [],
      "security_considerations": []
    },
    "similar_implementations": [
      {
        "source": "url/reference",
        "pattern": "description",
        "relevance": "high/medium/low",
        "lessons_learned": []
      }
    ],
    "anti_patterns": [],
    "recommendations": []
  },
  "design_constraints": {
    "technical_limitations": [],
    "security_requirements": [],
    "performance_requirements": [],
    "compatibility_requirements": []
  },
  "success_criteria": [
    "Clear functionality definition",
    "Appropriate complexity level",
    "User experience considerations",
    "Technical feasibility confirmed"
  ]
}
```

## Analysis Quality Gates

### Requirement Clarity
- Command purpose is clearly defined
- Use cases are well understood
- Success criteria are established
- Edge cases are identified

### Technical Feasibility
- Required tools are available
- Complexity is appropriate
- Performance is achievable
- Security is addressable

### User Experience
- Target audience is defined
- Usage patterns are understood
- Interface design is appropriate
- Help and documentation planned

## Usage

### Standalone Analysis
```
/cmd-builder:01-analyze "format-code with prettier"
```

### As Part of Chain
This command is the first step in the cmd-builder chain, providing analysis results for step 02 (design).

## Success Criteria

- Comprehensive requirement analysis complete
- Current best practices researched
- Technical feasibility confirmed  
- User experience considerations documented
- Ready for design phase
- Clear implementation path identified

The analysis phase establishes a solid foundation for creating an effective, well-designed command that meets user needs and follows current best practices.