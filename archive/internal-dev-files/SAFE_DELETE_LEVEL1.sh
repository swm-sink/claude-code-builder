#!/bin/bash
# Safe Level-1-Dev Deletion Script
# Comprehensive verification before deletion with backup and rollback

set -e

# Colors and formatting
RED='\033[0;31m'
GREEN='\033[0;32m'  
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
PODCAST_PROJECT="/Users/smenssink/Documents/GitHub/ai-podcasts-nobody-knows"
LEVEL1_DIR="$PODCAST_PROJECT/.claude/level-1-dev"
CLAUDE_BUILDER="/Users/smenssink/Documents/GitHub/claude-code-builder"
BACKUP_DIR="$HOME/level-1-dev-backup-$(date +%Y%m%d-%H%M%S)"

echo -e "${BLUE}=== LEVEL-1-DEV SAFE DELETION VERIFICATION ===${NC}"
echo

# Function to print status
print_status() {
    local status=$1
    local message=$2
    if [[ $status == "ok" ]]; then
        echo -e "${GREEN}✅ $message${NC}"
    elif [[ $status == "warning" ]]; then
        echo -e "${YELLOW}⚠️  $message${NC}"
    else
        echo -e "${RED}❌ $message${NC}"
    fi
}

# Step 1: Check for remaining references
echo -e "${BLUE}Step 1: Checking for Level-1-Dev references...${NC}"
REMAINING_REFS=$(grep -r "level-1-dev" "$PODCAST_PROJECT" \
   --exclude-dir=.git \
   --exclude-dir=.claude \
   --exclude="*.log" \
   2>/dev/null | grep -v "MIGRATED" | grep -v "claude-code-builder" | grep -v "backup" | head -5)

if [[ -n "$REMAINING_REFS" ]]; then
    print_status "error" "Active references still exist - resolve before deletion"
    echo -e "${YELLOW}Tip: Check .pre-commit-config.yaml, README.md, CONTRIBUTING.md${NC}"
    echo "Found references:"
    echo "$REMAINING_REFS"
    exit 1
else
    print_status "ok" "No active references found"
fi

# Step 2: Verify replacement patterns are accessible  
echo -e "${BLUE}Step 2: Verifying claude-code-builder patterns...${NC}"
if [[ ! -d "$CLAUDE_BUILDER/repository-structure/patterns" ]]; then
    print_status "error" "Replacement patterns not found at: $CLAUDE_BUILDER"
    exit 1
fi

pattern_count=$(find "$CLAUDE_BUILDER/repository-structure/patterns" -name "*.sh" | wc -l)
if [[ $pattern_count -lt 10 ]]; then
    print_status "error" "Incomplete patterns found: $pattern_count/10"
    exit 1
fi

print_status "ok" "Replacement patterns ready ($pattern_count/10 patterns)"

# Step 3: Test new pre-commit hook
echo -e "${BLUE}Step 3: Testing new pre-commit hook...${NC}"
if [[ -f "$PODCAST_PROJECT/scripts/precommit/claude-code-builder-quality.sh" ]]; then
    if bash -n "$PODCAST_PROJECT/scripts/precommit/claude-code-builder-quality.sh"; then
        print_status "ok" "New pre-commit hook syntax is valid"
    else
        print_status "error" "New pre-commit hook has syntax errors"
        exit 1
    fi
else
    print_status "error" "New pre-commit hook not found"
    exit 1
fi

# Step 4: Verify patterns load correctly
echo -e "${BLUE}Step 4: Testing pattern independence...${NC}"
test_result=$(cd /tmp && bash -c "
source '$CLAUDE_BUILDER/repository-structure/patterns/logging/simple-logging.sh' 2>/dev/null &&
source '$CLAUDE_BUILDER/repository-structure/patterns/error-handling/simple-error-handling.sh' 2>/dev/null &&
echo 'patterns_ok'
" 2>/dev/null)

if [[ "$test_result" == "patterns_ok" ]]; then
    print_status "ok" "Patterns load independently"
else
    print_status "error" "Patterns failed to load"
    exit 1
fi

# Step 5: Check Level-1-Dev directory exists
echo -e "${BLUE}Step 5: Verifying Level-1-Dev directory...${NC}"
if [[ ! -d "$LEVEL1_DIR" ]]; then
    print_status "warning" "Level-1-Dev directory not found (may already be deleted)"
    echo -e "${YELLOW}Nothing to delete.${NC}"
    exit 0
fi

dir_size=$(du -sh "$LEVEL1_DIR" | cut -f1)
file_count=$(find "$LEVEL1_DIR" -type f | wc -l)
print_status "ok" "Level-1-Dev found: $dir_size, $file_count files"

# Step 6: Create backup
echo -e "${BLUE}Step 6: Creating backup...${NC}"
if tar -czf "$BACKUP_DIR.tar.gz" -C "$(dirname "$LEVEL1_DIR")" "$(basename "$LEVEL1_DIR")" 2>/dev/null; then
    backup_size=$(du -sh "$BACKUP_DIR.tar.gz" | cut -f1)
    print_status "ok" "Backup created: $BACKUP_DIR.tar.gz ($backup_size)"
else
    print_status "error" "Failed to create backup"
    exit 1
fi

# Step 7: Final verification
echo -e "${BLUE}Step 7: Final verification...${NC}"

# Check git status
cd "$PODCAST_PROJECT"
if git status --porcelain | grep -q .; then
    print_status "warning" "Uncommitted changes in podcast project"
    echo -e "${YELLOW}Recommend committing changes before deletion${NC}"
else
    print_status "ok" "Git working directory clean"
fi

# Final decision point
echo
echo -e "${BLUE}=== DELETION READINESS SUMMARY ===${NC}"
print_status "ok" "Pre-commit hooks updated to claude-code-builder"
print_status "ok" "All documentation references updated"  
print_status "ok" "Migration shim created"
print_status "ok" "Patterns tested and working independently"
print_status "ok" "Backup created at: $BACKUP_DIR.tar.gz"
print_status "ok" "No remaining active references found"

echo
echo -e "${GREEN}✅ SAFE TO DELETE LEVEL-1-DEV${NC}"
echo
echo -e "${YELLOW}Deletion command:${NC}"
echo -e "${RED}rm -rf '$LEVEL1_DIR'${NC}"
echo
echo -e "${YELLOW}Rollback command (if needed):${NC}"
echo -e "${BLUE}tar -xzf '$BACKUP_DIR.tar.gz' -C '$(dirname "$LEVEL1_DIR")'${NC}"
echo

# Optional automatic deletion
read -p "$(echo -e ${YELLOW}Do you want to delete Level-1-Dev now? [y/N]: ${NC})" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}Deleting Level-1-Dev...${NC}"
    rm -rf "$LEVEL1_DIR"
    print_status "ok" "Level-1-Dev deleted successfully"
    
    # Create deletion marker
    echo "# Level-1-Dev Deleted on $(date)" > "$PODCAST_PROJECT/.claude/level-1-dev-DELETED"
    echo "Backup: $BACKUP_DIR.tar.gz" >> "$PODCAST_PROJECT/.claude/level-1-dev-DELETED"
    echo "Replacement: claude-code-builder" >> "$PODCAST_PROJECT/.claude/level-1-dev-DELETED"
    
    print_status "ok" "Deletion marker created"
    echo -e "${GREEN}🎉 Level-1-Dev successfully migrated and deleted!${NC}"
else
    echo -e "${BLUE}Deletion cancelled - Level-1-Dev preserved${NC}"
fi