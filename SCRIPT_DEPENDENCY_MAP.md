# Script Dependency Map - Native Conversion Plan

> **Complete analysis of 41 shell scripts and their conversion to native Claude Code commands**

## Summary Statistics

- **Total Scripts**: 41
- **Patterns**: 10 (HIGH PRIORITY)
- **Tools**: 7 (MEDIUM PRIORITY) 
- **Scripts**: 6 (LOW PRIORITY)
- **Tests**: 13 (VALIDATION PRIORITY)
- **Native Command References**: 7 script calls to replace

## Category Analysis

### 🏗️ Pattern Scripts (HIGH PRIORITY - Core Functionality)

| Script | Size | Dependencies | Native Command | Status |
|--------|------|--------------|----------------|---------|
| patterns/error-handling/simple-error-handling.sh | Medium | None | /error-handler | Pending |
| patterns/testing/simple-test-runner.sh | Large | None | /test-runner | Pending |
| patterns/quality-gates/quality-check.sh | Large | error-handling | /quality-check | Pending |
| patterns/security/security-basics.sh | Medium | error-handling | /security-scanner | Pending |
| patterns/configuration/config-reader.sh | Small | None | /config-manager | Pending |
| patterns/documentation/docs-generator.sh | Medium | None | /generate-docs | Pending |
| patterns/git-hooks/git-hooks-setup.sh | Medium | quality-check | /setup-git-hooks | Pending |
| patterns/dependencies/dependency-checker.sh | Medium | None | /dependency-manager | Pending |
| patterns/project-validation/project-validator.sh | Large | Multiple | /validate-project | Pending |
| patterns/logging/simple-logging.sh | Small | None | /log-manager | Pending |

**Total Lines**: ~800-1000 lines of bash code

### 🛠️ Tool Scripts (MEDIUM PRIORITY - Quality & Analysis)

| Script | Size | Dependencies | Native Command | Status |
|--------|------|--------------|----------------|---------|
| tools/claude-readability-scorer.sh | Medium | None | /readability-scorer | Pending |
| tools/performance-benchmarks.sh | Large | None | /performance-tester | Pending |
| tools/function-complexity-analyzer.sh | Medium | None | /complexity-analyzer | Pending |
| tools/architectural-dashboard.sh | Large | Multiple | /architecture-dashboard | Pending |
| tools/simple-god-detector.sh | Small | None | /god-detector | Pending |
| tools/complexity-helpers.sh | Small | None | Integrate into /complexity-analyzer | Pending |
| tools/god-detection-helpers.sh | Small | None | Integrate into /god-detector | Pending |

**Total Lines**: ~600-800 lines of bash code

### 📜 Setup Scripts (LOW PRIORITY - Installation & Demo)

| Script | Size | Dependencies | Native Command | Priority |
|--------|------|--------------|----------------|----------|
| scripts/install.sh | Medium | None | /installer | Low |
| scripts/quick-start.sh | Small | patterns | /quick-start | Low |
| scripts/setup-helpers.sh | Medium | None | /setup-helper | Low |
| scripts/validate-pat.sh | Small | None | /validate-pat | Low |
| scripts/validate-pre-push.sh | Large | Multiple | /pre-push-validator | Low |
| scripts/pattern-demo.sh | Small | patterns | /demo-patterns | Low |

**Total Lines**: ~400-600 lines of bash code

### 🧪 Test Scripts (VALIDATION PRIORITY - Convert Last)

| Script | Size | Dependencies | Native Command | Priority |
|--------|------|--------------|----------------|----------|
| tests/integration-test-suite.sh | Large | patterns, tools | /integration-tester | Last |
| tests/pattern-functionality-test.sh | Medium | patterns | /pattern-tester | Last |
| tests/edge-case-validation.sh | Medium | patterns | /edge-case-tester | Last |
| tests/error-recovery-test.sh | Medium | error-handling | /error-recovery-tester | Last |
| tests/load-test-suite.sh | Large | Multiple | /load-tester | Last |
| tests/cross-platform-test.sh | Medium | None | /platform-tester | Last |
| tests/function-test-helpers.sh | Small | None | Library functions | Last |
| tests/pattern-compatibility-matrix.sh | Medium | patterns | /compatibility-tester | Last |
| tests/install-workflow-test.sh | Small | install | /install-tester | Last |
| tests/end-to-end-test.sh | Large | All | /e2e-tester | Last |
| tests/simple-pattern-test.sh | Small | patterns | /simple-tester | Last |
| tests/pattern-test-suite.sh | Medium | patterns | /pattern-suite-tester | Last |
| tests/simple-platform-test.sh | Small | None | /simple-platform-tester | Last |

**Total Lines**: ~600-800 lines of bash code

## Current Native Command Dependencies

### .claude/commands/dev/assess.md References:
```bash
# MUST REPLACE WITH NATIVE COMMANDS:
./tools/claude-readability-scorer.sh    → /readability-scorer
./tools/performance-benchmarks.sh       → /performance-tester
./tests/integration-test-suite.sh       → /integration-tester
./tests/error-recovery-test.sh          → /error-recovery-tester
./tests/edge-case-validation.sh         → /edge-case-tester
./tests/load-test-suite.sh              → /load-tester
```

### .claude/commands/dev/implement-tdd.md References:
```bash
# MUST REPLACE WITH NATIVE COMMANDS:
../patterns/testing/simple-test-runner.sh → /test-runner
```

## Conversion Priority Matrix

### Phase 1: Foundation Patterns (Week 1)
1. **error-handling** → Foundation for all other patterns
2. **testing** → Required for validation of conversions
3. **quality-gates** → Needed for validation pipeline
4. **security** → Security-first approach

### Phase 2: Development Patterns (Week 1-2)
5. **configuration** → Project customization
6. **logging** → Debugging and monitoring
7. **documentation** → Knowledge management
8. **dependencies** → Package management

### Phase 3: Integration Patterns (Week 2)
9. **git-hooks** → Automation workflows
10. **project-validation** → Comprehensive checks

### Phase 4: Analysis Tools (Week 2-3)
11. **readability-scorer** → Code quality
12. **performance-benchmarks** → Performance analysis
13. **complexity-analyzer** → Code complexity
14. **architectural-dashboard** → System overview

### Phase 5: Setup & Demo (Week 3)
15. **installer** → Setup automation
16. **quick-start** → User onboarding
17. **pre-push-validator** → Git integration

### Phase 6: Testing Suite (Week 3-4)
18. **All test scripts** → Final validation

## Dependency Relationships

```
Foundation Layer:
├── error-handling (used by: quality-gates, security, project-validation)
├── testing (used by: all validation)
└── configuration (used by: most patterns)

Development Layer:
├── quality-gates (uses: error-handling, testing)
├── security (uses: error-handling)
├── logging (uses: error-handling)
└── documentation (uses: configuration)

Integration Layer:
├── git-hooks (uses: quality-gates, testing)
├── dependencies (uses: configuration)
└── project-validation (uses: ALL patterns)

Tool Layer:
├── readability-scorer (standalone)
├── performance-benchmarks (standalone)
├── complexity-analyzer (standalone)
└── architectural-dashboard (uses: multiple patterns)
```

## Conversion Strategy

### 1. Read Original Script
```bash
# For each script, analyze:
- Core functionality
- Input/output patterns
- Error handling approach
- Dependencies and integration points
- Usage patterns
```

### 2. Design Native Command
```yaml
# Native command structure:
---
allowed-tools: [minimal required tools]
argument-hint: [user guidance]
description: [clear purpose]
category: [patterns/tools/utils]
---

# Native implementation using:
# - Read/Write for file operations
# - Grep/Glob for pattern matching
# - Bash with specific allowed commands
# - WebSearch/WebFetch for external data
```

### 3. Create Context Files
```markdown
# For each pattern, create:
patterns/[category]/CLAUDE.md     # AI instructions
patterns/[category]/context.md    # Pattern background
.claude/contexts/patterns/[category].md  # Detailed context
```

### 4. Validation Process
```bash
# For each conversion:
1. Test native command functionality
2. Compare output with original script
3. Verify integration with other commands
4. Update any dependent commands
5. Remove original script references
```

## Script Analysis Details

### High-Complexity Scripts (>100 lines)
- **patterns/project-validation/project-validator.sh** - 150+ lines
- **tools/architectural-dashboard.sh** - 120+ lines
- **tools/performance-benchmarks.sh** - 100+ lines
- **tests/integration-test-suite.sh** - 130+ lines
- **tests/end-to-end-test.sh** - 110+ lines
- **scripts/validate-pre-push.sh** - 200+ lines

### Medium-Complexity Scripts (50-100 lines)
- **patterns/testing/simple-test-runner.sh** - 80 lines
- **patterns/quality-gates/quality-check.sh** - 70 lines
- **patterns/error-handling/simple-error-handling.sh** - 60 lines
- **tools/claude-readability-scorer.sh** - 75 lines
- **tools/function-complexity-analyzer.sh** - 65 lines

### Low-Complexity Scripts (<50 lines)
- **patterns/configuration/config-reader.sh** - 30 lines
- **patterns/logging/simple-logging.sh** - 25 lines
- **tools/simple-god-detector.sh** - 35 lines
- **scripts/quick-start.sh** - 40 lines

## Success Metrics

### Conversion Completion
- [ ] 10 pattern scripts → native commands
- [ ] 7 tool scripts → native commands
- [ ] 6 setup scripts → native commands (optional)
- [ ] 13 test scripts → native commands (for validation)

### Zero Script Dependencies
- [ ] No .sh references in .claude/commands/
- [ ] All functionality available via native commands
- [ ] Full workflow completion without script execution

### Quality Validation
- [ ] All native commands pass validation
- [ ] Performance equivalent or better than scripts
- [ ] Security improved with minimal permissions
- [ ] Documentation complete for all conversions

## Estimated Timeline

**Week 1**: Foundation patterns (error-handling, testing, quality-gates, security)
**Week 2**: Development patterns + core tools (config, logging, docs, deps + readability, performance)
**Week 3**: Integration + remaining tools (git-hooks, validation + complexity, dashboard)
**Week 4**: Testing suite + final validation

**Total Effort**: 3-4 weeks for complete native transformation