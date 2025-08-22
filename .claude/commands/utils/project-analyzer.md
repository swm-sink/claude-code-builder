---
allowed-tools: Read, Glob, Grep, Write
argument-hint: [path] or [analysis-type]
description: Deep project analysis and context generation using native Claude Code tools
category: utils
---

# Project Analyzer

Deep project analysis and understanding: **$ARGUMENTS**

## Analysis Process

I'll perform comprehensive project analysis using native Claude Code tools to understand structure, patterns, and relationships.

### 1. Project Structure Discovery

**Analyzing project at**: $ARGUMENTS

#### Directory Structure Analysis
```
Discovering project layout...
- Finding all directories and their purposes
- Identifying pattern categories and relationships
- Mapping command and agent structures
- Understanding file organization
```

#### File Type Analysis
```
Scanning file types and distributions...
- Markdown documentation files
- Shell scripts (legacy to convert)
- Native command files (.claude/commands/)
- Native agent files (.claude/agents/)
- Configuration and context files
```

### 2. Pattern Analysis

#### Legacy Pattern Discovery
```
Analyzing patterns/ directory...
- Error handling patterns
- Testing frameworks
- Quality gates
- Security implementations
- Configuration management
- Documentation systems
```

#### Native Command Mapping
```
Analyzing .claude/commands/ structure...
- Command builder chains (10 steps + master)
- Agent builder chains (10 steps + master)
- Utility commands
- Development workflow commands
```

### 3. Dependency Analysis

#### Script Dependencies
```
Analyzing shell script usage...
- Finding all .sh files
- Mapping script interconnections
- Identifying conversion candidates
- Planning native replacements
```

#### Tool Dependencies
```
Analyzing native tool usage...
- Tool permissions across commands
- Security boundaries and constraints
- Performance implications
- Integration patterns
```

### 4. Quality Analysis

#### Code Quality Metrics
```
Analyzing code quality...
- Command complexity levels
- Documentation completeness
- Error handling coverage
- Security implementation
```

#### Pattern Compliance
```
Checking pattern adherence...
- Native Claude Code standards
- YAML frontmatter completeness
- $ARGUMENTS usage patterns
- Tool permission appropriateness
```

### 5. Context Generation

#### Global Context
```
Generating project-wide context...
- Architecture overview
- Pattern relationships
- Development workflows
- Quality standards
```

#### Pattern-Specific Context
```
Generating pattern contexts...
- Individual pattern documentation
- Usage examples and relationships
- Integration guidelines
- Best practices
```

## Analysis Output

### Project Summary
```json
{
  "project_analysis": {
    "name": "claude-code-builder",
    "type": "native_claude_code_toolkit",
    "analysis_date": "$(date -Iseconds)",
    "structure": {
      "directories": {
        "native_commands": 35,
        "native_agents": 3,
        "legacy_patterns": 10,
        "legacy_scripts": 41,
        "total_directories": "discovered_count"
      },
      "files": {
        "markdown_files": "count",
        "shell_scripts": "count",
        "config_files": "count",
        "context_files": "count"
      }
    },
    "conversion_status": {
      "native_commands_ready": true,
      "legacy_scripts_remaining": 41,
      "conversion_priority": [
        "error-handling",
        "testing",
        "quality-gates",
        "security"
      ]
    },
    "quality_metrics": {
      "native_compliance": "percentage",
      "documentation_coverage": "percentage",
      "security_implementation": "level",
      "performance_grade": "rating"
    }
  }
}
```

### Detailed Findings

#### 🏗️ Architecture Assessment
- **Native Integration**: Percentage of native vs legacy
- **Command Coverage**: Functional areas covered by commands
- **Agent Specialization**: Validation and optimization coverage
- **Context Completeness**: AI understanding enablement

#### 📊 Pattern Analysis
- **Pattern Maturity**: Legacy to native conversion status
- **Relationship Mapping**: Inter-pattern dependencies
- **Usage Frequency**: Most and least used patterns
- **Integration Quality**: How well patterns work together

#### 🔒 Security Analysis
- **Tool Permissions**: Minimal privilege compliance
- **Input Validation**: Parameter sanitization coverage
- **Security Patterns**: Security implementation completeness
- **Vulnerability Assessment**: Potential security issues

#### ⚡ Performance Analysis
- **Command Efficiency**: Execution speed and resource usage
- **Tool Usage**: Optimal native tool selection
- **Context Size**: AI comprehension optimization
- **Scalability**: Growth and extension capability

### Recommendations

#### Immediate Actions (High Priority)
1. **Convert Core Patterns**: Transform error-handling, testing, quality-gates to native
2. **Remove Script Dependencies**: Eliminate .sh references in commands
3. **Generate Missing Contexts**: Create CLAUDE.md and context.md files
4. **Update Documentation**: Reflect native architecture

#### Short-term Improvements (Medium Priority)
1. **Enhance Context System**: Improve AI understanding with richer contexts
2. **Optimize Tool Permissions**: Review and minimize security footprint
3. **Improve Error Handling**: Standardize error patterns across commands
4. **Add Performance Monitoring**: Track and optimize command performance

#### Long-term Enhancements (Low Priority)
1. **Community Integration**: Enable pattern sharing and collaboration
2. **Advanced Orchestration**: Complex workflow management
3. **AI-Driven Optimization**: Intelligent pattern recommendations
4. **Ecosystem Extension**: Plugin and extension framework

### Context File Generation

Based on this analysis, I'll generate appropriate context files:

#### .claude/contexts/patterns/[category].md
- Pattern-specific context and relationships
- Usage guidelines and best practices
- Integration points with other patterns
- Migration status and recommendations

#### patterns/[category]/CLAUDE.md
- AI instructions for working with this pattern
- Pattern purpose and capabilities
- Integration guidelines
- Quality standards

#### patterns/[category]/context.md
- Pattern context and background
- Usage examples and scenarios
- Relationship to other patterns
- Implementation notes

## Usage Examples

### Full Project Analysis
```bash
# Comprehensive analysis of current directory
/project-analyzer "."

# Analysis with specific focus
/project-analyzer ". --focus=security"
/project-analyzer ". --focus=performance"
/project-analyzer ". --focus=conversion"
```

### Targeted Analysis
```bash
# Analyze specific pattern
/project-analyzer "patterns/error-handling"

# Analyze command structure
/project-analyzer ".claude/commands"

# Analyze legacy scripts
/project-analyzer "scripts"
```

### Context Generation Mode
```bash
# Generate all missing context files
/project-analyzer ". --generate-contexts"

# Update existing contexts
/project-analyzer ". --update-contexts"

# Validate context completeness
/project-analyzer ". --validate-contexts"
```

## Success Criteria

- ✅ **Complete Structure Map**: All directories and files catalogued
- ✅ **Pattern Relationships**: Interconnections documented
- ✅ **Conversion Plan**: Legacy to native migration roadmap
- ✅ **Quality Assessment**: Current state and improvement areas
- ✅ **Context Generation**: AI-optimized understanding files
- ✅ **Actionable Recommendations**: Prioritized improvement steps

The project analyzer provides deep understanding of the codebase structure, enabling intelligent decision-making about native conversion, quality improvements, and context generation for optimal AI assistance.