---
allowed-tools: Write, Read, Bash(cp:*), Bash(chmod:*)
argument-hint: [documentation-results-json] or [command-name]
description: Package command for immediate use and easy sharing
category: cmd-builder
---

# Command Packaging Phase

Package command for immediate use and easy sharing: **$ARGUMENTS**

## Packaging Philosophy: Ready to Use

Create a simple, complete package that works immediately:

### Packaging Principles
- **Copy and Go**: Works immediately after copying
- **Self-Contained**: Everything needed included
- **Simple Structure**: Easy to understand and share
- **Zero Configuration**: No setup required

### 1. Parse Documentation Results
Extract packaging requirements from documentation outcomes:
- Final command state and capabilities
- Documentation completeness
- User experience validation
- Ready-to-use confirmation

### 2. Simple Package Structure

```
[command-name]/
├── [command-name].md    # The actual command file
├── README.md            # Quick documentation
└── metadata.json        # Simple package info
```

### 3. Package Creation Process

#### Copy Command to Package Directory
```bash
# Create clean package structure
mkdir -p "commands/[command-name]"
cp ".claude/commands/cmd-builder/[command-name].md" "commands/[command-name]/"
```

#### Create Package README
```markdown
# [Command Name]

[One-sentence description]

## Install
Copy `[command-name].md` to your `.claude/commands/` directory.

## Usage
```
/command-name "example"
```

## Quick Start
[One working example that demonstrates value]

Done! Use `/command-name --help` for more.
```

#### Generate Simple Metadata
```json
{
  "name": "[command-name]",
  "version": "1.0.0",
  "description": "[clear description]",
  "category": "[category]",
  "tools_required": ["minimal list"],
  "created": "2025-01-XX",
  "ready_to_use": true
}
```

### 4. Package Validation

#### Installation Test
```bash
# Test that package installs and works
cp [command-name].md ~/.claude/commands/
# Verify command is available and functional
```

#### Self-Containment Test
```bash
# Verify package has everything needed
# No external dependencies
# Clear installation instructions
# Working examples
```

### 5. Distribution Preparation

#### Git-Ready Structure
```
# Package is ready for git sharing
git add commands/[command-name]/
git commit -m "Add [command-name] command"
```

#### Community Sharing Format
```markdown
# Format ready for sharing in community repos
- Clear command purpose
- Working examples
- Simple installation
- Tested functionality
```

## Package Output

### Complete Package
```json
{
  "packaging_phase": "distribution_ready",
  "command_packaged": "[command-name]",
  "package_timestamp": "2025-01-XX",
  "package_contents": {
    "command_file": "[command-name].md",
    "documentation": "README.md", 
    "metadata": "metadata.json",
    "total_files": 3,
    "package_size": "< 10KB"
  },
  "installation": {
    "method": "copy to .claude/commands/",
    "dependencies": "none",
    "configuration": "none required",
    "time_to_use": "< 30 seconds"
  },
  "distribution_ready": {
    "git_compatible": true,
    "community_shareable": true,
    "self_contained": true,
    "tested_working": true
  },
  "quality_final": {
    "functionality": "complete",
    "simplicity": "maintained",
    "usability": "excellent",
    "reliability": "tested"
  }
}
```

### Package Location
```
commands/[command-name]/
├── [command-name].md     # Ready to use
├── README.md             # Simple documentation  
└── metadata.json         # Package information
```

## Installation Instructions

### For Users
```markdown
1. Copy `[command-name].md` to your `.claude/commands/` directory
2. Use immediately: `/command-name "example"`
3. Get help anytime: `/command-name --help`
```

### For Developers
```markdown
1. Clone or copy the command directory
2. Test: Copy to `.claude/commands/` and try it
3. Modify: Edit the `.md` file as needed
4. Share: Copy directory to others
```

## Usage

### Standalone Packaging
```
/cmd-builder:10-package [documentation-results-json]
```

### As Part of Chain
Final step in cmd-builder chain, producing ready-to-use command package.

## Success Criteria

- **Immediate Usability**: Works right after copying
- **Self-Contained**: No external dependencies
- **Simple Structure**: Easy to understand and share
- **Complete Package**: Everything needed included
- **Tested Working**: Functionality verified
- **Ready to Share**: Community-ready format

## Final Command Summary

```yaml
command_creation_complete:
  name: [command-name]
  version: 1.0.0
  complexity: minimal
  lines_of_code: <100
  
  quality_achieved:
    functionality: complete
    simplicity: elegant
    performance: optimized
    usability: excellent
    documentation: essential
    
  ready_for:
    immediate_use: ✅
    team_sharing: ✅ 
    community_distribution: ✅
    production_deployment: ✅
```

## Package Distribution

### Ready for Sharing
- **GitHub**: Ready for repository inclusion
- **Team**: Copy and use immediately  
- **Community**: Share in Claude Code collections
- **Personal**: Use across multiple projects

### Zero Setup Required
- No configuration files needed
- No dependency installation
- No environment setup
- Copy file and use

**🎉 Your command is packaged and ready to use!**

The packaging phase creates a complete, self-contained command that can be immediately used and easily shared while maintaining elegant simplicity.