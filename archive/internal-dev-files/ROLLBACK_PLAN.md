# Level-1-Dev Extraction Rollback Plan

## Plan Overview

**Purpose:** Ensure safe recovery if Level-1-Dev extraction fails or causes issues  
**Scope:** Complete restoration of original podcast project functionality  
**Estimated Recovery Time:** < 30 minutes  
**Risk Level:** LOW (well-tested procedures)  

## Rollback Scenarios

### Scenario 1: Pre-Extraction Rollback
**Trigger:** Issues discovered during validation phase  
**Action:** Stop extraction, no changes to revert  
**Time:** Immediate  

### Scenario 2: Mid-Extraction Rollback  
**Trigger:** Problems during repository creation or pattern development  
**Action:** Abandon dev-platform repository, no podcast project changes  
**Time:** < 5 minutes  

### Scenario 3: Post-Migration Rollback
**Trigger:** Podcast project broken after migration to dev-platform  
**Action:** Full restoration of original Level-1-Dev system  
**Time:** < 30 minutes  

### Scenario 4: Emergency Rollback
**Trigger:** Critical failure affecting podcast production  
**Action:** Immediate restoration with priority procedures  
**Time:** < 10 minutes  

## Pre-Rollback Preparation

### Backup Checklist (Complete BEFORE starting extraction)

#### 1. Full System Backup
```bash
# Create complete backup of podcast project
cd /Users/smenssink/Documents/GitHub/ai-podcasts-nobody-knows
tar -czf "../ai-podcasts-backup-$(date +%Y%m%d-%H%M%S).tar.gz" .

# Store backup location
echo "Backup: ../ai-podcasts-backup-$(date +%Y%m%d-%H%M%S).tar.gz" > rollback-info.txt
```

#### 2. Level-1-Dev Specific Backup
```bash
# Backup just the Level-1-Dev directory
cd .claude
tar -czf "level-1-dev-backup-$(date +%Y%m%d-%H%M%S).tar.gz" level-1-dev/

# Create hash for integrity verification
shasum -a 256 "level-1-dev-backup-$(date +%Y%m%d-%H%M%S).tar.gz" > backup-hash.txt
```

#### 3. Git State Backup
```bash
# Record current git state
git log --oneline -10 > git-state-backup.txt
git status --porcelain > git-status-backup.txt
git branch -v > git-branches-backup.txt

# Create git bundle for complete history
git bundle create complete-backup.bundle --all
```

#### 4. Configuration Backup
```bash
# Backup key configuration files
cp CLAUDE.md CLAUDE.md.backup
cp CLAUDE.local.md CLAUDE.local.md.backup
cp .gitignore .gitignore.backup
```

### Verification of Backups
```bash
# Test backup integrity
tar -tzf "level-1-dev-backup-$(date +%Y%m%d-%H%M%S).tar.gz" >/dev/null && echo "✅ Backup valid"

# Verify git bundle
git bundle verify complete-backup.bundle && echo "✅ Git bundle valid"

# Check file permissions
ls -la *.backup && echo "✅ Config backups exist"
```

## Rollback Procedures

### Procedure 1: Simple Rollback (Scenario 1-2)

#### If No Changes Made to Podcast Project:
```bash
# Simply stop extraction process
echo "❌ Extraction halted - no rollback needed"
echo "📁 Original Level-1-Dev intact"
echo "✅ Podcast project unchanged"
```

### Procedure 2: Repository-Only Rollback (Mid-Extraction)

#### If dev-platform Repository Created:
```bash
# Delete dev-platform repository (GitHub)
# Note: This requires manual GitHub action

# Remove local claude-code-builder work  
rm -rf /Users/smenssink/Documents/GitHub/claude-code-builder
echo "✅ Local claude-code-builder files removed"

# Podcast project remains unchanged
echo "✅ Podcast project unaffected"
```

### Procedure 3: Full System Rollback (Post-Migration)

#### Step 1: Stop All Processes
```bash
# Ensure no scripts are running
pkill -f "level-1-dev" || true
pkill -f "dev-platform" || true
echo "✅ Stopped all related processes"
```

#### Step 2: Restore from Git (Preferred Method)
```bash
# Navigate to podcast project
cd /Users/smenssink/Documents/GitHub/ai-podcasts-nobody-knows

# Reset to pre-migration state
git log --oneline | head -20  # Find pre-migration commit
read -p "Enter pre-migration commit hash: " COMMIT_HASH
git reset --hard "$COMMIT_HASH"

# Clean untracked files
git clean -fd

echo "✅ Git state restored"
```

#### Step 3: Restore Level-1-Dev from Backup (If Git Fails)
```bash
# Remove current Level-1-Dev
rm -rf .claude/level-1-dev

# Extract from backup
BACKUP_FILE=$(ls ../level-1-dev-backup-*.tar.gz | head -1)
cd .claude
tar -xzf "../$BACKUP_FILE"

# Verify restoration
ls -la level-1-dev/ && echo "✅ Level-1-Dev restored from backup"
```

#### Step 4: Restore Configuration Files
```bash
# Restore key configuration files
cp CLAUDE.md.backup CLAUDE.md 2>/dev/null || echo "No CLAUDE.md backup"
cp CLAUDE.local.md.backup CLAUDE.local.md 2>/dev/null || echo "No CLAUDE.local.md backup"
cp .gitignore.backup .gitignore 2>/dev/null || echo "No .gitignore backup"

echo "✅ Configuration files restored"
```

#### Step 5: Verify Restoration
```bash
# Test Level-1-Dev functionality
cd .claude/level-1-dev
./tests/run-all-tests.sh --quick 2>/dev/null && echo "✅ Level-1-Dev functional" || echo "⚠️ Tests failed"

# Check git status
git status && echo "✅ Git repository status OK"

# Verify key files exist
ls -la CLAUDE.md quality/ tests/ && echo "✅ Key files exist"
```

### Procedure 4: Emergency Rollback (Critical Failures)

#### Immediate Actions (< 5 minutes):
```bash
#!/bin/bash
# emergency-rollback.sh - Run if system is critically broken

set -e

echo "🚨 EMERGENCY ROLLBACK INITIATED"

# Go to project directory
cd /Users/smenssink/Documents/GitHub/ai-podcasts-nobody-knows

# Hard reset to known good state (update this commit hash)
KNOWN_GOOD_COMMIT="c3431c5"  # Update before migration!
git reset --hard "$KNOWN_GOOD_COMMIT"
git clean -fd

# Remove any dev-platform references
find . -name "*dev-platform*" -delete 2>/dev/null || true

# Verify basic functionality
if [ -f ".claude/level-1-dev/tests/run-all-tests.sh" ]; then
    echo "✅ Level-1-Dev structure intact"
else
    echo "❌ Level-1-Dev missing - restore from backup required"
fi

echo "🔄 Emergency rollback complete"
echo "📝 Check git log for current state"
echo "🧪 Run tests to verify functionality"
```

## Post-Rollback Verification

### Verification Checklist:
- [ ] **Level-1-Dev directory exists** and contains expected files
- [ ] **Tests run successfully** (`./tests/run-all-tests.sh`)
- [ ] **Quality gates work** (run a quality check)
- [ ] **Git repository clean** (no unexpected changes)
- [ ] **CLAUDE.md intact** and references work
- [ ] **Project builds successfully** (if applicable)
- [ ] **No dev-platform references** remain in project

### Test Script for Verification:
```bash
#!/bin/bash
# verify-rollback.sh - Confirm rollback was successful

echo "🔍 Verifying rollback completion..."

# Check Level-1-Dev structure
if [ -d ".claude/level-1-dev" ]; then
    echo "✅ Level-1-Dev directory exists"
    file_count=$(find .claude/level-1-dev -name "*.sh" | wc -l)
    echo "📁 Found $file_count shell scripts"
else
    echo "❌ Level-1-Dev directory missing"
    exit 1
fi

# Check for dev-platform references
if grep -r "dev-platform" . --exclude-dir=.git 2>/dev/null; then
    echo "⚠️ Found dev-platform references - may need cleanup"
else
    echo "✅ No dev-platform references found"
fi

# Test basic functionality
cd .claude/level-1-dev
if ./tests/run-all-tests.sh --help >/dev/null 2>&1; then
    echo "✅ Test runner accessible"
else
    echo "❌ Test runner not working"
fi

# Check git status
if git status >/dev/null 2>&1; then
    echo "✅ Git repository functional"
    echo "📊 Current branch: $(git branch --show-current)"
else
    echo "❌ Git repository issues"
fi

echo "🎯 Rollback verification complete"
```

## Prevention & Monitoring

### Pre-Migration Safety Measures:
1. **Complete backup verification** before starting
2. **Test rollback procedures** on copy of project
3. **Set up monitoring** for critical failures
4. **Document current state** thoroughly
5. **Plan rollback trigger points** in advance

### Monitoring During Migration:
- **Continuous testing** of original functionality
- **Regular backup updates** during migration
- **Clear stop criteria** if issues arise
- **Communication plan** for team notification

### Post-Migration Monitoring:
- **24-hour monitoring** after migration
- **Quick rollback capability** maintained
- **Performance comparison** with baseline
- **User feedback collection** for issues

## Emergency Contacts & Procedures

### Decision Tree for Rollback:
1. **Minor issues** → Continue with fixes
2. **Moderate issues** → Pause and assess
3. **Major functionality broken** → Initiate full rollback
4. **System completely broken** → Emergency rollback

### Communication Plan:
1. **Document the issue** clearly
2. **Notify relevant stakeholders** 
3. **Execute appropriate rollback**
4. **Verify system recovery**
5. **Post-mortem analysis**

## Testing Rollback Procedures

### Before Migration - Test Rollback:
```bash
# Create a test copy
cp -r /Users/smenssink/Documents/GitHub/ai-podcasts-nobody-knows /tmp/test-rollback

# Practice rollback on test copy
cd /tmp/test-rollback

# Make some changes to simulate migration
rm -rf .claude/level-1-dev/quality/some-file.sh

# Test rollback procedures
# ... (run through rollback steps)

# Verify success
ls -la .claude/level-1-dev/quality/

# Clean up test
rm -rf /tmp/test-rollback
```

## Rollback Success Criteria

### ✅ Rollback Successful When:
- All original Level-1-Dev functionality restored
- All tests pass as before migration
- Project builds and runs normally
- Git repository in clean state
- No performance degradation
- All team members can continue work

### ❌ Rollback Failed If:
- Tests still failing after rollback
- Missing files or functionality
- Git repository corrupted
- Performance issues persist
- Unable to continue normal development

## Conclusion

This rollback plan provides multiple layers of protection and recovery options for the Level-1-Dev extraction. By following these procedures, we can safely attempt the extraction with confidence that any issues can be quickly resolved.

**Key Principle:** Better to rollback quickly and try again than to persist with a broken system.

---

**Plan Version:** 1.0  
**Last Updated:** 2025-08-16  
**Status:** Ready for Implementation  
**Review Required:** Before any migration begins