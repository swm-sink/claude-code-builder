---
allowed-tools: Read
argument-hint: [session-name] or [list-all]
description: Check session progress and status
category: utils
---

# Session Status

Check progress and status for chain session: **$ARGUMENTS**

## Session Status Check

### Current Session: $ARGUMENTS

I'll check the status of your session and show current progress:

### Session Overview
```
Session: $ARGUMENTS
Status: [Active/Paused/Complete]
Progress: [X/Y steps] ([percentage]%)
Current Phase: [phase-name]
Time Elapsed: [duration]
```

### Progress Visualization
```
Chain Progress: $ARGUMENTS

[▓▓▓▓░░░░░░] 40% Complete

✅ Completed Steps:
- Step 1: [name] (✅ completed)
- Step 2: [name] (✅ completed) 
- Step 3: [name] (✅ completed)
- Step 4: [name] (✅ completed)

🔄 Current Step:
- Step 5: [name] (🔄 in progress)

⏳ Remaining Steps:
- Step 6: [name] (⏳ pending)
- Step 7: [name] (⏳ pending)
- Step 8: [name] (⏳ pending)
- Step 9: [name] (⏳ pending)
- Step 10: [name] (⏳ pending)
```

### Session Details
```
Session Information:
- Created: [timestamp]
- Last Activity: [timestamp]
- Workflow Type: [agent-builder/cmd-builder]
- Total Commands Run: [count]
- Success Rate: [percentage]%
```

### Context Summary
```
Current Context:
- Last Command: [command-name]
- Last Result: [success/failure/warning]
- Next Suggested: [next-command]
- Session Notes: [any important context]
```

### Quick Actions

**Continue Session**:
```
[Next suggested command based on current progress]
```

**Resume from Current Step**:
```
/[workflow]:0[current-step] [context-data]
```

**Save Session**:
```
/session-save "$ARGUMENTS"
```

**List All Sessions**:
```
/session-status "list-all"
```

## Session Management

### If No Active Session
```
No active session found: $ARGUMENTS

Available sessions:
- [session-1]: [status] ([progress])
- [session-2]: [status] ([progress])

Start new session:
/session-start "new-session-name"
```

### If Multiple Sessions
```
Multiple sessions available:

Active Sessions:
✅ session-1: 60% complete (agent-builder)
🔄 session-2: 30% complete (cmd-builder)
⏸️ session-3: paused at step 5

Choose session:
/session-status "session-name"
```

## Usage Examples

### Check Specific Session
```
/session-status "my-agent-project"
```

### List All Sessions
```
/session-status "list-all"
```

### Quick Status
```
/session-status
# Shows default or last active session
```

## Session Actions

Based on current status, here are your options:

**Continue Current Step**:
Continue with the current step in progress

**Resume from Interruption**:
Pick up exactly where you left off

**Skip to Next Phase**:
Move to next major phase if current is complete

**Review Previous Results**:
Check outputs from completed steps

**Save and Pause**:
Save current state and pause session

**Complete Session**:
Mark session as finished

**🔍 Session status check complete. Ready to continue your workflow!**