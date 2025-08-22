---
allowed-tools: WebSearch, WebFetch, Write
argument-hint: [agent-type] or [research-results-from-previous-step]
description: Research best practices and patterns for agent type
category: agent-builder
---

# Agent Research Phase

Research current best practices and patterns for agent type: **$ARGUMENTS**

## Research Process

I'll conduct comprehensive research to gather the latest information about building this type of agent:

### 1. Current Best Practices Search
Searching for 2024-2025 best practices for: $ARGUMENTS

*This will include:*
- Latest prompt engineering techniques
- Agent architecture patterns
- Tool usage patterns
- Security considerations
- Performance optimizations

### 2. Claude Code Integration Patterns
Researching Claude Code-specific patterns for: $ARGUMENTS

*This will cover:*
- Native Claude Code features to leverage
- YAML frontmatter best practices
- Tool permission recommendations
- Integration with existing ecosystem

### 3. Community Examples
Finding successful implementations and community patterns

*This includes:*
- GitHub repositories with similar agents
- Community best practices
- Proven patterns and anti-patterns
- Real-world usage examples

### 4. Domain-Specific Requirements
Identifying specific requirements for: $ARGUMENTS

*This covers:*
- Required tools and permissions
- Expected inputs and outputs
- Common use cases and scenarios
- Performance and security requirements

## Research Output

The research will be compiled into a structured JSON format:

```json
{
  "agent_type": "$ARGUMENTS",
  "research_date": "2025-01-XX",
  "best_practices": {
    "prompt_patterns": [],
    "tool_usage": [],
    "security": [],
    "performance": []
  },
  "claude_code_patterns": {
    "recommended_tools": [],
    "frontmatter_structure": {},
    "integration_points": []
  },
  "community_examples": [
    {
      "source": "url",
      "pattern": "description",
      "relevance": "high/medium/low"
    }
  ],
  "requirements": {
    "essential_tools": [],
    "optional_tools": [],
    "key_capabilities": [],
    "performance_targets": {}
  },
  "next_steps": []
}
```

## Usage

### Standalone Research
```
/agent-builder:01-research "code-reviewer"
```

### As Part of Chain
This command can be called individually or as the first step in the agent-builder chain. The output JSON will be passed to the next step via $ARGUMENTS.

## Success Criteria

- Comprehensive research covering all major aspects
- Current information from 2024-2025 sources
- Structured output ready for next step
- Clear recommendations and requirements identified

The research phase sets the foundation for creating a well-designed, effective agent that follows current best practices and integrates seamlessly with Claude Code.