---
allowed-tools: Write, Read
argument-hint: [enhancement-results-json] or [command-name]
description: Create clear, minimal documentation that enables quick success
category: cmd-builder
---

# Command Documentation Phase

Create clear, minimal documentation that enables quick success: **$ARGUMENTS**

## Documentation Philosophy: Minimum Viable Documentation

Focus on what users actually need to succeed quickly:

### Documentation Principles
- **Quick Start First**: Get users working in <60 seconds
- **Example-Driven**: Show, don't just tell
- **Essential Only**: No documentation bloat
- **Scannable**: Easy to find what you need

### 1. Parse Enhancement Results
Extract documentation requirements from enhancement outcomes:
- Final command capabilities
- User interface design
- Essential features implemented
- Common use cases supported

### 2. Essential Documentation Structure

#### README.md (Core Documentation)
```markdown
# [Command Name]

[One sentence: What it does and why you'd use it]

## Quick Start
```
/command-name "basic example"
```

## Usage
```
/command-name [parameter]
/command-name --help
```

## Examples
[3-4 real examples that cover 90% of use cases]

## Help
Use `/command-name --help` for details
```

#### Integrated Help (Built into Command)
```markdown
# Help system built into the command itself
- Brief usage summary
- Key examples
- Common error solutions
```

### 3. Documentation Content Strategy

#### Example-First Approach
```
Structure: Example → Explanation → Variations
Benefit: Users learn by doing, not reading
Coverage: 3-4 examples cover most use cases
```

#### Progressive Disclosure
```
Level 1: Quick start (90% of users)
Level 2: Common variations (9% of users)  
Level 3: Edge cases (1% of users)
```

#### Scannable Format
```
- Short paragraphs (2-3 lines max)
- Bullet points for lists
- Code examples prominently displayed
- Clear headings for navigation
```

### 4. Minimal Documentation Implementation

**Single README.md File**
```markdown
# [Command Name] - [One-line description]

Get started in 30 seconds:
```
/command-name "your-input-here"
```

## Common Usage
[3-4 practical examples]

## Parameters
- `parameter`: What it does
- `--help`: Show help

## Troubleshooting
**Error**: [Common error]
**Fix**: [Simple solution]

That's it! Use `--help` for more details.
```

**Integrated Help System**
```markdown
# Built into the command
When user types: /command-name --help

Shows:
- Usage syntax
- 2-3 key examples  
- Link to full documentation
```

### 5. Documentation Quality Gates

#### User Success Criteria
- New user can succeed in <60 seconds
- All examples work exactly as shown
- Common errors have clear solutions
- Help is discoverable and useful

#### Content Quality Criteria
- No jargon or unnecessary complexity
- Examples are practical and realistic
- Structure is logical and scannable
- Information is accurate and current

## Documentation Output

### Generated Documentation Package
```
documentation/
├── README.md           # Main documentation (essential only)
└── [integrated help]   # Built into command
```

### Documentation Metrics
```json
{
  "documentation_phase": "minimal_essential",
  "command_documented": "[command-name]",
  "documentation_timestamp": "2025-01-XX",
  "content_metrics": {
    "readme_word_count": "<500 words",
    "example_count": 3-4,
    "time_to_first_success": "<60 seconds",
    "coverage": "90% of use cases"
  },
  "quality_assessment": {
    "clarity": "excellent",
    "completeness": "essential coverage",
    "usability": "quick success enabled",
    "maintainability": "minimal overhead"
  },
  "user_experience": {
    "quick_start_effectiveness": "excellent",
    "example_quality": "practical and working",
    "help_accessibility": "built-in and discoverable",
    "troubleshooting_coverage": "common issues addressed"
  }
}
```

## Documentation Standards

### Content Standards
- **Clarity**: Written in plain language
- **Accuracy**: All examples tested and working
- **Completeness**: Covers essential use cases
- **Currency**: Information is current and relevant

### Format Standards
- **Scannable**: Easy to quickly find information
- **Consistent**: Follows established patterns
- **Accessible**: Clear for users of all levels
- **Practical**: Focuses on real-world usage

### User Experience Standards
- **Quick Success**: Users succeed within 60 seconds
- **Self-Service**: Users can solve problems independently
- **Progressive**: Information available when needed
- **Integrated**: Help available within the command

## Documentation Generation

**README.md Creation**
```markdown
Generate concise, example-driven documentation:
1. One-sentence description
2. 30-second quick start
3. 3-4 practical examples
4. Essential troubleshooting
5. Reference to built-in help
```

**Help Integration**
```markdown
Build help into command:
1. Usage syntax
2. Key examples
3. Common error guidance
4. Link to full documentation
```

## Usage

### Standalone Documentation
```
/cmd-builder:09-document [enhancement-results-json]
```

### As Part of Chain
Receives enhancement results from step 08, outputs documentation results for step 10.

## Success Criteria

- **Quick Success**: New users succeed in <60 seconds
- **Essential Coverage**: 90% of use cases documented
- **Minimal Overhead**: Documentation doesn't overwhelm
- **Practical Focus**: Examples work and solve real problems
- **Integrated Help**: Assistance available within command
- **Maintainable**: Easy to keep current and accurate

The documentation phase creates the minimum viable documentation that enables maximum user success with elegant simplicity.