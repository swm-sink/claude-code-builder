# Logging Management Pattern - AI Instructions

> **AI guidance for working with the logging management pattern in Claude Code Builder**

## Pattern Purpose

The logging management pattern provides comprehensive structured logging with intelligent formatting, advanced aggregation, and observability integration. It serves as the logging foundation for development and production workflows, ensuring consistent, analyzable, and maintainable logging across different output formats, destinations, and enterprise environments.

## Core Capabilities

### Multi-Format Structured Logging and Observability Integration
- **Structured Text**: Human-readable logging with color coding and contextual formatting
- **JSON Logging**: Machine-readable structured logging for automated analysis and aggregation
- **XML Logging**: Enterprise-grade logging with schema validation and namespace support
- **Custom Formats**: Template-based logging with variable substitution and conditional logic
- **Real-Time Streaming**: Live log streaming to Kafka, webhooks, and monitoring dashboards
- **Observability**: Integration with metrics, tracing, and monitoring platforms

### Native Command Usage
```bash
# Basic logging operations
/log-manager "info" "Application started successfully"
/log-manager "warn" "Database connection pool near capacity"
/log-manager "error" "Payment processing failed"
/log-manager "debug" "Variable state inspection"

# Structured logging with context
/log-manager "info" "User login" --service="auth" --user-id="12345"
/log-manager "json" "error" "API timeout" --duration="5000ms"

# Log management operations
/log-manager "configure" "level=info" "format=json"
/log-manager "analyze" "/var/log/app.log"
/log-manager "export" "elasticsearch" "last-week"
/log-manager "stream" "kafka" "real-time"

# Advanced logging features
/log-manager "trace" "request-12345" "distributed-tracing"
/log-manager "correlate" "generate-id"
/log-manager "security" "redact-pii"
```

## AI Assistant Guidelines

### When to Recommend Logging Management Pattern
1. **Any application development** - Structured logging is essential for debugging and monitoring
2. **Production systems** - Comprehensive logging for observability and troubleshooting
3. **Microservices architecture** - Distributed logging with correlation and tracing
4. **Enterprise applications** - Compliance logging with security and audit requirements
5. **DevOps workflows** - Log aggregation and analysis for operational insights
6. **Debug and troubleshooting** - Structured debugging information for development
7. **Performance monitoring** - Performance metrics and monitoring integration

### Integration with Other Patterns
- **Error Handling**: Uses error handling for comprehensive logging system status reporting
- **Security Scanner**: Integrates with security scanning for log content analysis and PII detection
- **Quality Gates**: Provides logging quality assessment as part of overall system quality
- **Testing**: Structured logging for test execution tracking and debugging
- **Configuration**: Logging configuration management across different environments

### Usage Patterns to Recommend

#### Standard Application Logging
```bash
# Basic application logging workflow
/log-manager "info" "Application startup initiated"
/error-handler "info" "Configuring logging system"

# Configure production logging
/log-manager "configure" "level=info" "format=json" "output=/var/log/app.log"
if [[ $? -eq 0 ]]; then
    /error-handler "info" "Logging system configured successfully"
else
    /error-handler "error" "Logging configuration failed"
fi
```

#### Structured Development Logging
```bash
# Development logging with context and debugging
/log-manager "debug" "Function entry: authenticate_user"
/log-manager "info" "User authentication attempt" --user-id="12345"

# Error logging with context
if [[ $authentication_failed ]]; then
    /log-manager "error" "Authentication failed" --user-id="12345" --reason="invalid_password"
    /error-handler "warn" "Authentication failure detected"
fi
```

#### Production Observability Logging
```bash
# Production-grade structured logging
/error-handler "info" "Starting production logging with observability"

# JSON structured logging for automated analysis
/log-manager "json" "info" "Request processed" --request-id="req-789" --duration="120ms"
/log-manager "json" "warn" "High latency detected" --service="api" --latency="2500ms"

# Real-time streaming to monitoring systems
/log-manager "stream" "kafka" "production-logs"
/log-manager "export" "elasticsearch" "real-time"
```

#### Enterprise Compliance Logging
```bash
# Enterprise logging with security and compliance
/error-handler "info" "Configuring enterprise compliance logging"

# Secure logging with PII redaction
/log-manager "security" "enable-pii-redaction"
/log-manager "compliance" "audit-trail" "enable"

# Structured audit logging
/log-manager "audit" "user-action" --user-id="admin-001" --action="system-configuration"
/log-manager "audit" "data-access" --user-id="user-456" --resource="customer-data"
```

### Best Practices to Teach

#### Logging Structure and Consistency
- **Consistent Format**: Use structured logging formats (JSON, XML) for production systems
- **Context Enrichment**: Include relevant context (user IDs, request IDs, service names)
- **Log Levels**: Use appropriate log levels (debug, info, warn, error, critical)
- **Correlation IDs**: Implement correlation IDs for distributed system tracing

#### Performance and Efficiency
- **Asynchronous Logging**: Use async logging for high-performance applications
- **Log Sampling**: Implement log sampling for high-volume systems
- **Efficient Formatting**: Use optimized log formatting for minimal performance impact
- **Buffer Management**: Configure appropriate buffer sizes for throughput optimization

#### Security and Compliance
- **PII Protection**: Automatically redact personally identifiable information
- **Access Control**: Implement role-based access to sensitive logs
- **Encryption**: Encrypt logs at rest and in transit for sensitive applications
- **Retention Policies**: Implement appropriate log retention for compliance requirements

### Code Examples for AI

#### Basic Structured Logging
```bash
# Standard application logging workflow
/error-handler "info" "Initializing application logging"

# Configure logging for current environment
ENVIRONMENT=${ENVIRONMENT:-development}
if [[ "$ENVIRONMENT" == "production" ]]; then
    /log-manager "configure" "level=info" "format=json"
    /log-manager "configure" "output=/var/log/app.log" "rotation=daily"
else
    /log-manager "configure" "level=debug" "format=text"
    /log-manager "configure" "output=console" "color=true"
fi

# Application startup logging
/log-manager "info" "Application starting" --environment="$ENVIRONMENT"
/error-handler "info" "Logging system configured for $ENVIRONMENT"
```

#### Error Logging with Context
```bash
# Error handling with comprehensive logging
/error-handler "info" "Processing user request"

# Business logic with contextual logging
process_user_request() {
    local user_id="$1" request_type="$2"
    
    /log-manager "debug" "Processing request" --user-id="$user_id" --type="$request_type"
    
    # Simulate business logic
    if ! validate_user "$user_id"; then
        /log-manager "error" "User validation failed" --user-id="$user_id"
        /error-handler "error" "Invalid user request detected"
        return 1
    fi
    
    /log-manager "info" "Request processed successfully" --user-id="$user_id"
    return 0
}
```

#### Performance Monitoring Integration
```bash
# Performance-aware logging with metrics
/error-handler "info" "Starting performance monitoring logging"

# Function with performance logging
monitored_function() {
    local start_time=$(date +%s%3N)
    local operation="$1"
    
    /log-manager "debug" "Operation started" --operation="$operation"
    
    # Simulate operation
    sleep 1
    
    local end_time=$(date +%s%3N)
    local duration=$((end_time - start_time))
    
    if [[ $duration -gt 1000 ]]; then
        /log-manager "warn" "Slow operation detected" --operation="$operation" --duration="${duration}ms"
    else
        /log-manager "info" "Operation completed" --operation="$operation" --duration="${duration}ms"
    fi
    
    # Export metrics to monitoring system
    /log-manager "metrics" "operation_duration" --value="$duration" --operation="$operation"
}
```

#### Distributed System Logging
```bash
# Distributed logging with correlation IDs
/error-handler "info" "Configuring distributed system logging"

# Generate correlation ID for request tracking
CORRELATION_ID=$(/log-manager "correlate" "generate-id")
export CORRELATION_ID

# Service A processing
service_a_processing() {
    /log-manager "info" "Service A: Processing request" --correlation-id="$CORRELATION_ID"
    
    # Call downstream service
    call_service_b "$CORRELATION_ID"
    
    /log-manager "info" "Service A: Request completed" --correlation-id="$CORRELATION_ID"
}

# Service B processing
call_service_b() {
    local correlation_id="$1"
    
    /log-manager "info" "Service B: Processing request" --correlation-id="$correlation_id"
    /log-manager "debug" "Service B: Business logic executed" --correlation-id="$correlation_id"
    /log-manager "info" "Service B: Request completed" --correlation-id="$correlation_id"
}
```

### Common User Questions & AI Responses

**Q: "How do I set up structured logging for my application?"**
A: Use `/log-manager "configure" "format=json"` for structured logging, then log with context using `/log-manager "info" "message" --service="myapp" --user-id="123"`. JSON format enables automated analysis and monitoring integration.

**Q: "My logs are too verbose, how do I control log levels?"**
A: Configure log levels with `/log-manager "configure" "level=warn"` for global settings, or `/log-manager "level" "myservice" "info"` for service-specific levels. Use debug for development and info/warn for production.

**Q: "How do I integrate logging with monitoring systems?"**
A: Use `/log-manager "stream" "kafka" "real-time"` for real-time streaming, or `/log-manager "export" "elasticsearch" "daily"` for batch export. Configure with your monitoring platform's ingestion endpoints.

**Q: "How do I handle sensitive data in logs?"**
A: Enable PII redaction with `/log-manager "security" "redact-pii"` and use `/log-manager "compliance" "audit-trail"` for audit logging. Never log passwords, tokens, or personal data directly.

**Q: "My application has performance issues with logging, what should I do?"**
A: Enable async logging with `/log-manager "optimize" "async-logging=true"` and configure appropriate buffer sizes. Use log sampling for high-volume scenarios and optimize log formatting.

### Troubleshooting Guide for AI

#### Common Issues
- **Performance impact**: Enable async logging and optimize buffer sizes
- **Storage concerns**: Configure log rotation and compression policies
- **Missing context**: Add correlation IDs and structured context fields
- **Security issues**: Enable PII redaction and access control
- **Integration failures**: Verify network connectivity and authentication for external systems

#### Validation Steps
1. **Configuration Check**: `/log-manager "configure" "validate"` shows current settings
2. **Log Level Test**: `/log-manager "debug" "test message"` validates level configuration
3. **Format Validation**: `/log-manager "json" "info" "test"` validates structured output
4. **Export Test**: `/log-manager "export" "test-destination"` validates integrations
5. **Performance Check**: `/log-manager "analyze" "performance"` shows logging metrics

#### Environment-Specific Troubleshooting

##### Development Environment Issues
- **Verbose output**: Use text format with color coding for readability
- **Debug information**: Enable debug level for detailed troubleshooting
- **Console output**: Configure console output for immediate feedback
- **Context missing**: Add relevant context fields for debugging

##### Production Environment Issues
- **Performance impact**: Use JSON format with async processing
- **Storage optimization**: Enable compression and appropriate retention
- **Security compliance**: Enable PII redaction and audit trails
- **Monitoring integration**: Configure real-time streaming and export

##### Distributed System Issues
- **Request tracking**: Implement correlation IDs across all services
- **Service identification**: Include service names and versions in logs
- **Cross-service debugging**: Use distributed tracing integration
- **Log aggregation**: Centralize logs from multiple services

### Advanced Usage Patterns

#### Custom Log Formats
```bash
# Create custom log format for specific requirements
/log-manager "template" "create" "audit-format"
/log-manager "custom" "audit-format" "User action recorded"
```

#### Log Analytics and Reporting
```bash
# Advanced log analysis and reporting
/log-manager "analyze" "error-patterns" "last-week"
/log-manager "report" "performance-metrics" "monthly"
/log-manager "aggregate" "by-service" "real-time"
```

#### Enterprise Integration
```bash
# Enterprise logging platform integration
/log-manager "enterprise" "splunk" "configure"
/log-manager "enterprise" "datadog" "export"
/log-manager "compliance" "sox" "enable"
```

### Integration Examples

#### With Application Monitoring
```bash
# Application performance monitoring integration
/log-manager "metrics" "export" "prometheus"
/log-manager "trace" "jaeger" "distributed"
```

#### With Security Systems
```bash
# Security monitoring integration
/log-manager "security" "siem-export"
/security-scanner "logs"                       # Security analysis of log content
```

#### With CI/CD Pipelines
```bash
# Build and deployment logging
/log-manager "build" "start" --build-id="build-123"
/log-manager "deploy" "success" --environment="production"
```

## AI Development Guidelines

### When Helping Users
1. **Start with environment assessment** - Determine development vs. production logging needs
2. **Recommend structured formats** - Guide users toward JSON/XML for production systems
3. **Show context enrichment** - Demonstrate adding relevant context to log entries
4. **Integrate with monitoring** - Connect logging to observability and monitoring workflows
5. **Emphasize security** - Guide users toward secure logging practices and compliance

### Pattern Recognition
- If user mentions logging, debugging, monitoring → recommend this pattern
- If user has production systems → highlight structured JSON logging and observability
- If user asks about troubleshooting → demonstrate log analysis and filtering capabilities
- If user needs compliance → show audit logging and PII redaction features
- If user has distributed systems → demonstrate correlation IDs and distributed tracing

### Logging Management Assurance
- Ensure logging commands are appropriate for detected environments and use cases
- Verify structured logging formats are suitable for automated analysis and monitoring
- Check that security features protect sensitive information appropriately
- Confirm integration patterns work with other Claude Code Builder patterns
- Validate that logging solutions maintain performance and scalability standards

### Error Recovery Guidance
- Help users identify and fix logging performance issues
- Guide users through log analysis and troubleshooting procedures
- Provide environment-specific logging configuration recommendations
- Suggest logging optimization strategies for high-volume applications
- Ensure logging solutions scale with application growth and complexity

This logging management pattern provides intelligent, comprehensive structured logging that handles multi-format output, observability integration, and enterprise-grade features while maintaining elegant simplicity and high-performance operation across various development and production environments.