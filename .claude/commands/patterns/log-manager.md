---
allowed-tools: Read, Write, Bash(echo:*), Bash(printf:*), Bash(date:*), Bash(grep:*), Bash(awk:*), Bash(tail:*), Bash(head:*), Bash(wc:*), Bash(sort:*), Bash(uniq:*), Bash(jq:*), Bash(tee:*), Bash(logger:*), Bash(logrotate:*)
argument-hint: [log-level] or [message] or [operation]
description: Comprehensive logging management with structured output, aggregation, and observability integration
category: patterns
---

# Log Manager

Intelligent logging management with comprehensive structured output and observability: **$ARGUMENTS**

## Logging Management System

I'll provide comprehensive logging capabilities with intelligent log formatting, structured output, advanced filtering, log aggregation, and seamless integration with observability platforms and monitoring systems across multiple output formats and destinations.

### Input Processing

**Processing request**: $ARGUMENTS

#### Parameter Analysis
```
Input: $ARGUMENTS
Action: [Determining logging operation and configuration]
Mode: [log/configure/analyze/aggregate/export/monitor]
Level: [debug/info/warn/error/critical/success]
Format: [text/json/xml/structured/custom]
```

### Logging Analysis Process

#### Intelligent Log Management and Output Formatting
```markdown
**📝 Logging Analysis**

Configuring comprehensive logging system with structured output...
- Detecting application context, environment, and logging requirements
- Configuring log levels, formats, and output destinations
- Setting up log aggregation, filtering, and analysis capabilities
- Preparing observability integration and monitoring workflows
```

#### Multi-Format Logging Support

##### Structured Text Logging
```markdown
**📄 Structured Text Logging**

Format: Human-readable structured text with consistent formatting
Use Case: Development, debugging, console output, file logging
Features: Color coding, timestamps, severity levels, contextual information

Log Format Examples:
```
[2023-11-15 14:30:25.123] [INFO] [auth-service] User authentication successful
  ├── User ID: user-12345
  ├── Session: session-abcd-efgh
  ├── IP Address: 192.168.1.100
  └── Duration: 1.2s

[2023-11-15 14:30:26.456] [WARN] [database] Connection pool near capacity
  ├── Active Connections: 18/20
  ├── Queue Length: 5
  └── Database: primary-db

[2023-11-15 14:30:27.789] [ERROR] [payment] Payment processing failed
  ├── Transaction ID: txn-xyz-789
  ├── Amount: $125.50
  ├── Error Code: INSUFFICIENT_FUNDS
  └── Retry Count: 3/3
```

Output Configuration:
- **Console Output**: Color-coded with emojis for visual clarity
- **File Output**: Plain text with timestamps and structured formatting
- **Debug Mode**: Additional context, stack traces, and performance metrics
- **Production Mode**: Optimized output with essential information only

Usage: /log-manager "info" "User login successful" "auth-service"
```

##### JSON Structured Logging
```markdown
**📊 JSON Structured Logging**

Format: Machine-readable JSON with consistent schema
Use Case: Production logging, log aggregation, automated analysis
Features: Searchable fields, consistent structure, integration ready

JSON Log Examples:
```json
{
  "timestamp": "2023-11-15T14:30:25.123Z",
  "level": "INFO",
  "service": "auth-service",
  "message": "User authentication successful",
  "context": {
    "user_id": "user-12345",
    "session_id": "session-abcd-efgh",
    "ip_address": "192.168.1.100",
    "duration_ms": 1200,
    "request_id": "req-uuid-12345"
  },
  "tags": ["authentication", "success"],
  "environment": "production"
}

{
  "timestamp": "2023-11-15T14:30:26.456Z",
  "level": "WARN",
  "service": "database",
  "message": "Connection pool near capacity",
  "context": {
    "active_connections": 18,
    "max_connections": 20,
    "queue_length": 5,
    "database_name": "primary-db"
  },
  "metrics": {
    "connection_utilization": 0.90,
    "avg_response_time_ms": 45
  }
}
```

Schema Features:
- **Consistent Structure**: Standardized fields across all log entries
- **Context Enrichment**: Additional context fields for correlation and analysis
- **Metric Integration**: Performance metrics and monitoring data inclusion
- **Correlation IDs**: Request tracking and distributed system correlation

Usage: /log-manager "json" "error" "Payment failed" "payment-service"
```

##### XML Structured Logging
```markdown
**📋 XML Structured Logging**

Format: XML with defined schema for enterprise integration
Use Case: Enterprise systems, SOAP services, legacy system integration
Features: Schema validation, namespace support, enterprise compliance

XML Log Examples:
```xml
<log-entry xmlns="urn:logging:schema:v1">
  <metadata>
    <timestamp>2023-11-15T14:30:25.123Z</timestamp>
    <level>INFO</level>
    <service>auth-service</service>
    <environment>production</environment>
  </metadata>
  <message>User authentication successful</message>
  <context>
    <field name="user_id">user-12345</field>
    <field name="session_id">session-abcd-efgh</field>
    <field name="ip_address">192.168.1.100</field>
    <field name="duration_ms" type="number">1200</field>
  </context>
  <tags>
    <tag>authentication</tag>
    <tag>success</tag>
  </tags>
</log-entry>
```

Enterprise Features:
- **Schema Validation**: XSD schema validation for data integrity
- **Namespace Support**: Enterprise namespace management and versioning
- **XSLT Processing**: Log transformation and formatting capabilities
- **Integration Ready**: Direct integration with enterprise logging systems

Usage: /log-manager "xml" "warn" "System maintenance required"
```

##### Custom Format Logging
```markdown
**🔧 Custom Format Logging**

Format: User-defined templates with variable substitution
Use Case: Specific compliance requirements, custom analysis needs
Features: Template engine, variable substitution, format validation

Custom Template Examples:
```
# Syslog Format Template
<%pri%>%timestamp% %hostname% %service%: %message% [%context.user_id%]

# CSV Format Template
%timestamp%,%level%,%service%,%message%,"%context%"

# Custom Application Format
[%level%] %service% - %message% | User: %context.user_id% | Duration: %context.duration_ms%ms
```

Template Features:
- **Variable Substitution**: Dynamic field insertion and formatting
- **Conditional Logic**: Conditional field inclusion based on context
- **Format Validation**: Template syntax validation and error checking
- **Performance Optimization**: Compiled templates for high-throughput logging

Usage: /log-manager "custom" "audit-template" "User action recorded"
```

### Logging Operations and Management

#### Comprehensive Logging Operations
```bash
# Basic logging operations
/log-manager "info" "Application started successfully"
/log-manager "warn" "Database connection pool near capacity"
/log-manager "error" "Payment processing failed"
/log-manager "debug" "Variable state: user_id=12345"

# Structured logging with context
/log-manager "info" "User login" --service="auth" --user-id="12345"
/log-manager "error" "API timeout" --service="api" --duration="5000ms"

# Format-specific logging
/log-manager "json" "info" "Transaction completed"
/log-manager "xml" "warn" "System maintenance scheduled"
/log-manager "custom" "audit-format" "Administrative action"
```

#### Log Configuration and Management
```bash
# Configure logging system
/log-manager "configure" "level=info" "format=json"
/log-manager "configure" "output=/var/log/app.log"
/log-manager "configure" "rotation=daily" "retention=30days"

# Log level management
/log-manager "level" "debug"                    # Set global log level
/log-manager "level" "auth-service" "warn"      # Set service-specific level
/log-manager "level" "list"                     # Show current levels
```

#### Log Analysis and Aggregation
```bash
# Log analysis operations
/log-manager "analyze" "/var/log/app.log"
/log-manager "filter" "level=error" "last-24h"
/log-manager "search" "user_id=12345" "today"

# Log aggregation and reporting
/log-manager "aggregate" "by-service" "last-week"
/log-manager "report" "errors" "monthly"
/log-manager "metrics" "performance" "daily"
```

#### Log Export and Integration
```bash
# Export logs to external systems
/log-manager "export" "elasticsearch" "last-week"
/log-manager "export" "splunk" "error-logs"
/log-manager "export" "datadog" "metrics"

# Real-time log streaming
/log-manager "stream" "kafka" "real-time"
/log-manager "stream" "webhook" "alerts"
```

### Advanced Logging Features

#### Distributed Logging and Correlation
```bash
# Distributed system logging
/log-manager "trace" "request-12345" "start"
/log-manager "trace" "request-12345" "service-a" "completed"
/log-manager "trace" "request-12345" "end"

# Correlation ID management
/log-manager "correlate" "generate-id"
/log-manager "correlate" "request-789" "associate"
```

#### Log Performance and Optimization
```bash
# Performance optimization
/log-manager "optimize" "buffer-size=1MB"
/log-manager "optimize" "async-logging=true"
/log-manager "optimize" "compression=gzip"

# Log rotation and archival
/log-manager "rotate" "size=100MB"
/log-manager "archive" "compress" "older-than=30days"
```

#### Log Security and Compliance
```bash
# Security and compliance features
/log-manager "security" "encrypt-sensitive"
/log-manager "security" "redact-pii"
/log-manager "compliance" "audit-trail"
/log-manager "compliance" "retention-policy"
```

### Integration with Error Handling

#### Comprehensive Logging Status Reporting
```bash
# All logging operations use error handling pattern integration
/error-handler "info" "Initializing logging system with $format format"

# Logging configuration status
/error-handler "info" "Log level set to $log_level"
/error-handler "info" "Log output configured: $output_destination"

# Logging operation results
/error-handler "info" "Log entry written successfully"
/error-handler "warn" "Log buffer near capacity: $buffer_usage%"
/error-handler "error" "Log write failed: $error_message"
/error-handler "handle-error" "$LINENO" "Logging system failure"
```

#### Advanced Logging Integration Reporting
```bash
# Log analysis and aggregation feedback
/error-handler "info" "Analyzed $log_count log entries"
/error-handler "info" "Found $error_count errors in $time_period"
/error-handler "warn" "High error rate detected: $error_rate errors/minute"

# Log export and integration status
/error-handler "info" "Exported $export_count logs to $destination"
/error-handler "info" "Real-time streaming active: $stream_rate logs/second"
/error-handler "error" "Log export failed: $export_error"
```

### Logging Implementation

#### Intelligent Log Processing Engine
```markdown
**Smart Log Management**:

**Context Enrichment**:
- Automatic timestamp and timezone handling
- Service and application context detection
- Request correlation and distributed tracing
- Performance metrics and monitoring data inclusion

**Format Optimization**:
- Template-based log formatting with variable substitution
- Conditional field inclusion based on log level and context
- Performance-optimized formatting for high-throughput applications
- Schema validation and consistency checking across log formats
```

#### Multi-Destination Log Routing
```markdown
**Advanced Log Routing**:

**Output Destinations**:
- **Console**: Color-coded development output with real-time display
- **File**: Structured file output with rotation and archival
- **Syslog**: System log integration with facility and priority management
- **Network**: Remote logging with TCP/UDP transport and encryption
- **Cloud**: Direct integration with cloud logging services and platforms

**Routing Rules**:
- Level-based routing (errors to alerts, debug to development logs)
- Service-based routing (microservice logs to dedicated destinations)
- Context-based routing (user actions to audit logs, performance to metrics)
- Time-based routing (real-time streaming vs. batch processing)
```

### Output Formatting

#### Standard Logging Results
```
📝 Log Manager: Production Logging
🎯 Format: JSON Structured
⚡ Status: Active (1,247 logs/minute)

💾 Logging Configuration:
  Level: INFO (global), DEBUG (auth-service)
  Format: JSON with correlation IDs
  Output: /var/log/app.log + Elasticsearch
  Rotation: Daily, 30-day retention
  
📊 Current Statistics:
  ├── Total Logs Today: 1,234,567
  ├── Error Rate: 0.02% (247 errors)
  ├── Performance: 99.8% success rate
  └── Storage: 2.3GB (compressed)

📈 Recent Activity:
  • 14:30:25 - AUTH: User login successful (user-12345)
  • 14:30:26 - DB: Connection pool at 90% capacity
  • 14:30:27 - PAY: Payment processing completed (txn-789)

⏱️  Response Time: <5ms average
🎯 System Health: 98/100
```

#### Log Analysis Results
```
🔍 Log Analysis: Error Pattern Detection
📊 Time Period: Last 24 hours
⚡ Status: 456,789 logs analyzed

📋 Analysis Summary:
  🚨 Critical Errors: 12 occurrences
  ⚠️  Warnings: 1,847 occurrences
  ✅ Successful Operations: 454,930
  📊 Overall Success Rate: 99.6%
  
🔍 Error Patterns:
  ├── Database Timeout: 8 occurrences (66.7% of errors)
  ├── API Rate Limit: 3 occurrences (25.0% of errors)
  └── Payment Gateway: 1 occurrence (8.3% of errors)

📈 Trending Issues:
  • Database timeout frequency increasing (3x vs. yesterday)
  • Peak error time: 14:00-15:00 UTC
  • Most affected service: payment-service

📝 Recommendations:
  • Investigate database connection pool settings
  • Consider API rate limit optimization
  • Monitor payment gateway health during peak hours

🎯 Analysis Score: 94/100
```

#### Real-Time Log Streaming Status
```
🔄 Log Streaming: Real-Time Monitoring
📡 Destinations: Kafka + Webhook + Dashboard
⚡ Status: 2,847 logs/minute streaming

💾 Streaming Configuration:
  Kafka Topic: app-logs-prod
  Webhook URL: https://monitoring.company.com/logs
  Buffer Size: 1MB (current: 340KB)
  Compression: gzip (67% reduction)
  
📊 Streaming Statistics:
  ├── Messages Sent: 4,567,890 today
  ├── Success Rate: 99.9%
  ├── Average Latency: 12ms
  └── Failed Deliveries: 45 (auto-retry enabled)

🔍 Active Filters:
  • Level: INFO and above
  • Services: payment, auth, api-gateway
  • Exclude: health-check, ping

📡 Real-Time Status:
  • Kafka: Connected, lag <100ms
  • Webhook: Healthy, 200 OK responses
  • Dashboard: Live, 50+ active viewers

🎯 Streaming Health: 99/100
```

### Performance Optimization

#### High-Performance Logging
- **Asynchronous Logging**: Non-blocking log writes with background processing
- **Buffer Management**: Intelligent buffering with configurable flush policies
- **Compression**: Real-time log compression for storage optimization
- **Batch Processing**: Efficient batch log processing for high-throughput scenarios

#### Resource Optimization
- **Memory Management**: Optimized memory usage with configurable buffer limits
- **CPU Optimization**: Efficient string processing and formatting algorithms
- **I/O Optimization**: Minimized disk I/O with intelligent batching and caching
- **Network Efficiency**: Optimized network protocols for remote logging

### Logging Security and Compliance

#### Secure Logging Practices
- **Data Sanitization**: Automatic PII detection and redaction
- **Encryption**: Log encryption at rest and in transit
- **Access Control**: Role-based access to logs and sensitive information
- **Audit Trail**: Comprehensive audit logging for compliance requirements

#### Compliance Features
- **Data Retention**: Configurable retention policies with automatic cleanup
- **Regulatory Compliance**: GDPR, HIPAA, SOX compliance features
- **Log Integrity**: Cryptographic log integrity verification
- **Privacy Protection**: Advanced PII protection and data anonymization

### Integration Patterns

#### With Error Handling Pattern
```bash
# Logging workflow with comprehensive error handling
/error-handler "info" "Starting application logging system"
/log-manager "configure" "production"
/error-handler "info" "Logging system initialized successfully"
```

#### With Monitoring and Observability
```bash
# Observability-integrated logging
/log-manager "metrics" "export" "prometheus"
/log-manager "trace" "jaeger" "distributed-tracing"
```

#### With Security Scanner
```bash
# Security-aware logging
/log-manager "security" "scan-sensitive-data"
/security-scanner "logs"                       # Security scan of log content
```

#### With Quality Gates
```bash
# Quality-integrated logging
/log-manager "analyze" "quality-metrics"
/quality-check "logging"                       # Logging quality assessment
```

### Logging Options

#### Configuration Settings
```bash
LOG_LEVEL="info"                              # Global log level
LOG_FORMAT="json"                             # Output format
LOG_OUTPUT="/var/log/app.log"                 # Primary output destination
LOG_ROTATION="daily"                          # Log rotation policy
LOG_RETENTION="30d"                           # Log retention period
LOG_COMPRESSION="gzip"                        # Log compression method
```

#### Advanced Configuration
```bash
# .logrc configuration file support
LOG_STRUCTURED_FORMAT=true
LOG_CORRELATION_IDS=true
LOG_PERFORMANCE_METRICS=true
LOG_SECURITY_REDACTION=true
LOG_ASYNC_PROCESSING=true
```

## Success Indicators

- ✅ **Multi-Format Support**: Comprehensive text, JSON, XML, and custom format logging
- ✅ **Advanced Features**: Structured logging, correlation IDs, distributed tracing
- ✅ **Performance Optimization**: Asynchronous processing, compression, and efficient I/O
- ✅ **Security Integration**: PII redaction, encryption, and compliance features
- ✅ **Observability**: Real-time streaming, metrics export, and monitoring integration
- ✅ **Enterprise Ready**: Log rotation, retention policies, and enterprise system integration

The log manager provides intelligent, comprehensive logging management that handles structured output, observability integration, and enterprise-grade features while maintaining elegant simplicity and high-performance operation across various logging scenarios and environments.