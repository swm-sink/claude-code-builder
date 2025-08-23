# .system Directory

> **System data directory for internal operations and reporting**

## 📁 Directory Structure

```
.system/
├── reports/      # JSON validation and test reports
├── checklists/   # Validation checklists and protocols
├── cache/        # Temporary cache for operations
├── temp/         # Temporary working files
├── metrics/      # Performance and quality metrics
└── logs/         # Operation and error logs
```

## 🔒 File Format Policy

- **Reports**: JSON format only (*.json)
- **Checklists**: Markdown format (*.md)
- **Metrics**: JSON format (*.json)
- **Logs**: Plain text or JSON (*.log, *.json)
- **Cache/Temp**: Any format (auto-cleaned)

## ⚠️ Important Notes

- This directory contains system-generated data
- Files here are NOT for direct user consumption
- Data is automatically managed by scripts
- Cache and temp directories are regularly cleaned

## 🚫 Do Not

- Manually edit files in this directory
- Store user documentation here
- Commit sensitive data to version control
- Rely on file persistence in cache/temp

---

**Directory Type**: System Data  
**Access**: Automated scripts only  
**Format**: JSON-first for data storage