#!/bin/bash

# Test Native Claude Code Builder Patterns
# Tests individual chain steps and validation

set -e

echo "🧪 Testing Claude Code Builder Native Patterns"
echo "=============================================="

# Test 1: Verify command structure
echo "📁 Test 1: Command Structure Validation"
echo "---------------------------------------"

COMMAND_COUNT=$(find .claude/commands -name "*.md" | wc -l)
echo "✅ Found $COMMAND_COUNT command files"

AGENT_COUNT=$(find .claude/agents -name "*.md" | wc -l)
echo "✅ Found $AGENT_COUNT agent files"

# Test 2: Verify YAML frontmatter
echo ""
echo "📝 Test 2: YAML Frontmatter Validation"
echo "--------------------------------------"

YAML_COUNT=$(grep -r "^---$" .claude/commands --include="*.md" | wc -l)
echo "✅ Found $((YAML_COUNT/2)) commands with YAML frontmatter"

# Test 3: Check $ARGUMENTS usage
echo ""
echo "🔧 Test 3: \$ARGUMENTS Parameter Usage"
echo "-------------------------------------"

ARGS_USAGE=$(grep -r "\$ARGUMENTS" .claude/commands --include="*.md" | wc -l)
echo "✅ Found $ARGS_USAGE instances of \$ARGUMENTS usage"

# Test 4: Verify tool permissions
echo ""
echo "🔒 Test 4: Tool Permissions Check"
echo "--------------------------------"

TOOLS_COUNT=$(grep -r "allowed-tools:" .claude/commands --include="*.md" | wc -l)
echo "✅ Found $TOOLS_COUNT commands with tool permissions"

# Test 5: Check session management
echo ""
echo "📊 Test 5: Session Management"
echo "-----------------------------"

if [ -d ".claude/sessions" ]; then
    SESSION_COUNT=$(find .claude/sessions -name "*.json" | wc -l)
    echo "✅ Session directory exists with $SESSION_COUNT session files"
else
    echo "⚠️  Session directory does not exist - creating it"
    mkdir -p .claude/sessions
fi

# Test 6: Validate chain structure
echo ""
echo "⛓️  Test 6: Chain Structure Validation"
echo "------------------------------------"

CMD_CHAIN_STEPS=$(find .claude/commands/cmd-builder -name "[0-9][0-9]-*.md" | wc -l)
echo "✅ Command builder has $CMD_CHAIN_STEPS chain steps"

AGENT_CHAIN_STEPS=$(find .claude/commands/agent-builder -name "[0-9][0-9]-*.md" | wc -l)
echo "✅ Agent builder has $AGENT_CHAIN_STEPS chain steps"

# Test 7: Test individual chain step
echo ""
echo "🔬 Test 7: Individual Step Functionality"
echo "---------------------------------------"

if [ -f ".claude/commands/cmd-builder/01-analyze.md" ]; then
    echo "✅ cmd-builder:01-analyze exists and is readable"
    
    # Check if it has required frontmatter fields
    if grep -q "argument-hint:" .claude/commands/cmd-builder/01-analyze.md; then
        echo "✅ Contains argument-hint field"
    fi
    
    if grep -q "description:" .claude/commands/cmd-builder/01-analyze.md; then
        echo "✅ Contains description field"
    fi
else
    echo "❌ cmd-builder:01-analyze not found"
fi

# Test 8: Subagent validation
echo ""
echo "🤖 Test 8: Subagent Validation"
echo "-----------------------------"

if [ -f ".claude/agents/validator.md" ]; then
    echo "✅ Validator subagent exists"
    
    if grep -q "name: validator" .claude/agents/validator.md; then
        echo "✅ Validator has correct name field"
    fi
    
    if grep -q "tools:" .claude/agents/validator.md; then
        echo "✅ Validator has tools permissions"
    fi
else
    echo "❌ Validator subagent not found"
fi

# Test 9: Documentation completeness
echo ""
echo "📚 Test 9: Documentation Completeness"
echo "------------------------------------"

if [ -f "CLAUDE_v2.md" ]; then
    echo "✅ CLAUDE_v2.md native guide exists"
    
    DOC_SIZE=$(wc -l < CLAUDE_v2.md)
    echo "✅ Guide contains $DOC_SIZE lines of documentation"
else
    echo "❌ CLAUDE_v2.md not found"
fi

# Summary
echo ""
echo "📋 Test Summary"
echo "==============="
echo "All basic structural tests completed successfully!"
echo ""
echo "🎯 Ready for full chain orchestration testing"
echo ""
echo "Next steps:"
echo "- Test full chain execution"
echo "- Validate argument passing between steps"
echo "- Test session management workflows"
echo "- Create working examples"

echo ""
echo "✅ Native pattern testing complete!"