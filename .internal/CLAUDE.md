# Internal System Directory - AI Context Guide

> **System internals hub for reports, validation, development artifacts, and temporary data**

## 📦 Internal System Overview

This directory contains internal system files, reports, validation data, and temporary artifacts that support Claude Code Builder operations but are not directly user-facing. This will be migrated to `.system/` for clarity.

## 🔗 Internal Component Navigation

### Reports & Analysis
- `reports/` - System reports (converting to JSON)
  - Validation reports
  - Test reports
  - Analysis reports
  - Performance metrics

### Validation & Checklists
- `checklists/` - Validation checklists (converting to JSON)
  - Pre-push validation
  - Quality checklists
  - Security checklists

### Development Artifacts
- `development/` - Development-time artifacts
- `drafts/` - Working documents and drafts
- `archive/` - Archived materials
- `audits/` - Audit logs and reports

### Performance & Metrics
- `benchmarks/` - Performance benchmarks
- `releases/` - Release artifacts

## 🎯 Internal System Principles

### Data Format Standards
- **JSON for data** - All reports, metrics, validation
- **MD for context** - CLAUDE.md and README.md only
- **Structured storage** - Organized by type and date
- **Automatic cleanup** - Temporary data management

### Migration Plan (.internal → .system)
1. Create `.system/` directory structure
2. Convert MD reports to JSON
3. Migrate validation data
4. Update all references
5. Remove `.internal/`

## 🔄 Data Flow Patterns

### Report Generation
```bash
# Generate JSON report
./scripts/generate-report.sh > .internal/reports/report-$(date +%Y%m%d).json

# Future: .system/reports/
./scripts/generate-report.sh > .system/reports/report-$(date +%Y%m%d).json
```

### Validation Data
```bash
# Store validation results
echo '{"status": "pass", "checks": 100}' > .internal/validation/results.json

# Future: .system/validation/
echo '{"status": "pass", "checks": 100}' > .system/validation/results.json
```

## 📊 Internal Categories

### Reports
System-generated reports and analysis.

### Validation
Validation data and checklists.

### Development
Development artifacts and drafts.

### Metrics
Performance and quality metrics.

## 📖 Additional Resources

- @file README.md - Internal directory docs
- @file ../CLAUDE.md - Main project context
- @file ../scripts/CLAUDE.md - Scripts context

## 🤖 AI Assistant Guidelines

When working with internal data:
1. **Use JSON format** - For all data storage
2. **Maintain structure** - Keep organized by type
3. **Clean up regularly** - Remove old temporary files
4. **Prepare for migration** - .internal → .system

## Internal Data Types

### 📊 Reports (JSON)
Validation, test, and analysis reports.

### ✅ Validation (JSON)
Checklists and validation data.

### 📝 Drafts (Temporary)
Working documents and drafts.

### 📈 Metrics (JSON)
Performance and quality metrics.

---

**Context Type**: Internal System Hub  
**Migration**: .internal → .system planned  
**Format**: Converting MD to JSON for data