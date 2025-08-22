---
allowed-tools: Write
argument-hint: [session-name] or [purpose]
description: Start a new chain session with tracking
category: utils
---

# Start Chain Session

Start a new chain session for organized workflow tracking: **$ARGUMENTS**

## Session Management

I'll create a new session to track your workflow progress:

### Session Setup
**Session Name**: $ARGUMENTS
**Started**: $(date)
**Type**: Chain workflow session

### Session Benefits
- **Progress Tracking**: See where you are in any chain
- **Context Preservation**: Maintain context across steps
- **Resume Capability**: Pick up where you left off
- **Clear Organization**: Separate different workflows

### Session Initialization

Creating session file for: **$ARGUMENTS**

```json
{
  "session_name": "$ARGUMENTS",
  "session_id": "session_$(date +%s)",
  "started": "$(date -Iseconds)",
  "status": "active",
  "workflow_type": "to_be_determined",
  "current_step": 0,
  "total_steps": 0,
  "progress": "0%",
  "context": {
    "last_command": "session-start",
    "last_output": "",
    "next_suggested": "Choose agent-builder or cmd-builder chain"
  },
  "session_log": [
    {
      "timestamp": "$(date -Iseconds)",
      "action": "session_started",
      "command": "session-start",
      "input": "$ARGUMENTS"
    }
  ]
}
```

### Session File Location
**Session saved to**: `.claude/sessions/$ARGUMENTS.json`

### Next Steps

Your session is ready! Choose your workflow:

**Agent Creation**:
```
/agent-builder:chain-master "your-agent-type"
```

**Command Creation**:
```
/cmd-builder:chain-master "your-command-purpose"
```

**Resume Existing Session**:
```
/session-resume "session-name"
```

**Session Status**:
```
/session-status "session-name"
```

## Usage Examples

### Start Agent Development Session
```
/session-start "building-code-reviewer-agent"
```

### Start Command Development Session  
```
/session-start "creating-format-command"
```

### Start Learning Session
```
/session-start "learning-claude-code-patterns"
```

## Session Features

- **Automatic Tracking**: Progress saved after each step
- **Context Preservation**: Maintains state between commands
- **Resume Capability**: Continue from any interruption
- **Clean Organization**: Separate sessions for different projects

**🚀 Session '$ARGUMENTS' is active and ready for workflow chains!**