# Claude Code Builder Project Context

> **AI-native development patterns for elegant command and agent creation**

## Project Identity

**Name**: Claude Code Builder  
**Type**: Native Claude Code development toolkit  
**Philosophy**: Elegant simplicity with minimum viable complexity  
**Status**: Production-ready native patterns

## Architecture Overview

### Core Components
- **Native Commands**: 35+ slash commands in `.claude/commands/`
- **Specialized Agents**: 3 validation subagents in `.claude/agents/`
- **Chain Workflows**: 10-step processes for command/agent building
- **Session Management**: JSON-based workflow tracking
- **Context System**: AI-optimized project understanding

### Design Principles
1. **Native First**: Pure Claude Code features, zero external dependencies
2. **Elegant Simplicity**: Minimum viable complexity approach
3. **Copy and Go**: Zero configuration, immediate usability
4. **Quality Focused**: Built-in validation and optimization
5. **AI Optimized**: Designed for AI comprehension and assistance

## Directory Structure

```
claude-code-builder/
├── .claude/                    # Native Claude Code patterns
│   ├── agents/                 # Specialized subagents
│   ├── commands/               # Slash commands
│   ├── contexts/               # AI context system
│   └── sessions/               # Workflow tracking
├── patterns/                   # Legacy patterns (being converted)
├── tools/                      # Legacy tools (being converted)
├── scripts/                    # Legacy scripts (being converted)
├── examples/                   # Usage examples
└── tests/                      # Validation and testing
```

## Key Features

### Chain-Based Development
- **Command Builder**: 10-step command creation process
- **Agent Builder**: 10-step agent development process
- **Quality Modes**: Quick/Standard/Excellence/Minimal options
- **Session Tracking**: Progress management and resumption

### Native Integration
- **YAML Frontmatter**: Tool permissions and metadata
- **$ARGUMENTS Processing**: Dynamic parameter handling
- **Subagent Calls**: Task(subagent_type:validator)
- **Tool Permissions**: Security-first minimal access

### Quality Assurance
- **Built-in Validation**: Standards compliance checking
- **Performance Optimization**: Speed and efficiency focus
- **Security Scanning**: Best practices enforcement
- **Testing Integration**: Comprehensive test coverage

## Development Workflows

### Creating Commands
1. Start session: `/session-start "project-name"`
2. Build command: `/cmd-builder:chain-master "purpose --mode=standard"`
3. Use command: `/new-command "parameters"`

### Creating Agents
1. Start session: `/session-start "agent-project"`
2. Build agent: `/agent-builder:chain-master "type --mode=excellence"`
3. Use agent: `/task "request" --subagent-type=new-agent`

### Quality Gates
- Input validation and sanitization
- Tool permission verification
- Performance benchmarking
- Security compliance checking
- Documentation completeness

## Context Usage

This context helps AI understand:
- Project structure and organization
- Development philosophies and patterns
- Available tools and capabilities
- Quality standards and requirements
- Integration points and workflows

## AI Assistant Guidelines

When working with this project:
1. **Prefer Native**: Use `.claude/commands/` over shell scripts
2. **Quality First**: Follow validation and testing patterns
3. **Simplicity Focus**: Minimum viable complexity approach
4. **Documentation**: Generate context files for understanding
5. **Security**: Minimal tool permissions, input validation

## Recent Changes

- Transformed from complex shell-script system to native Claude Code
- Implemented 10-step chain processes for building
- Added comprehensive session management
- Created validation subagents for quality assurance
- Built context system for AI understanding

## Future Direction

- Complete migration of remaining shell scripts to native commands
- Enhanced AI context generation and management
- Community pattern collection and sharing
- Advanced workflow orchestration capabilities