# Conversion Validation Checklist

> **Comprehensive quality assurance for converting shell scripts to native Claude Code commands**

## 📋 Pre-Conversion Analysis

### Script Analysis (Complete Before Starting)
- [ ] **Read Original Script Completely**
  - [ ] Understand core functionality and purpose
  - [ ] Document all input parameters and expected outputs
  - [ ] Identify all external dependencies and script calls
  - [ ] Note error handling patterns and edge cases
  - [ ] Record performance characteristics and timing

- [ ] **Dependency Analysis**
  - [ ] List all scripts sourced or called by this script
  - [ ] Identify functions used from other patterns
  - [ ] Document environment variables and configuration dependencies
  - [ ] Check for file system dependencies and paths
  - [ ] Verify external tool requirements (git, npm, etc.)

- [ ] **Integration Points**
  - [ ] Find all references to this script in other files
  - [ ] Identify commands that will need updating
  - [ ] Document expected input/output formats
  - [ ] Check for specific command line argument patterns

## 🏗️ Native Command Creation

### YAML Frontmatter (Required)
- [ ] **Tool Permissions**
  - [ ] Use minimal required tools only (principle of least privilege)
  - [ ] Prefer Read/Write over Bash execution when possible
  - [ ] Specify exact Bash commands if needed: `Bash(command:*)`
  - [ ] Include WebSearch/WebFetch only if external data needed
  - [ ] Validate tools are appropriate for functionality

- [ ] **Metadata Completeness**
  - [ ] `argument-hint` provides clear user guidance
  - [ ] `description` accurately describes purpose in <80 characters
  - [ ] `category` matches pattern type (patterns/tools/utils)
  - [ ] No additional unnecessary fields added

### Command Implementation (Native Claude Code)
- [ ] **Parameter Handling**
  - [ ] `$ARGUMENTS` used correctly for input processing
  - [ ] Input validation implemented for all parameters
  - [ ] Help text available via `--help` parameter
  - [ ] Error messages clear and actionable for invalid inputs
  - [ ] Parameter parsing handles edge cases (empty, special chars)

- [ ] **Core Functionality**
  - [ ] All original script functionality preserved
  - [ ] Native tools used efficiently (Read, Write, Grep, Glob)
  - [ ] Logic flow matches or improves on original
  - [ ] Error handling comprehensive and user-friendly
  - [ ] Output format consistent with other native commands

- [ ] **Security Implementation**
  - [ ] Input sanitization for all user-provided data
  - [ ] No eval or exec of user input
  - [ ] Safe file operations with path validation
  - [ ] Minimal tool permissions enforced
  - [ ] No hardcoded secrets or credentials

- [ ] **Performance Optimization**
  - [ ] Command completes in reasonable time (<5 seconds typical)
  - [ ] Efficient use of native tools (avoid redundant operations)
  - [ ] Memory usage reasonable for expected inputs
  - [ ] Scalable for typical project sizes

## 📝 Context Documentation Creation

### Pattern CLAUDE.md (AI Instructions)
- [ ] **AI Context Optimization**
  - [ ] Clear purpose and capability description
  - [ ] Usage examples with realistic scenarios  
  - [ ] Integration guidance with other patterns
  - [ ] Common troubleshooting scenarios
  - [ ] Best practices and recommendations

- [ ] **Instruction Quality**
  - [ ] AI can understand purpose immediately
  - [ ] Examples are complete and functional
  - [ ] Edge cases and error conditions documented
  - [ ] Integration patterns clearly explained
  - [ ] Less than 200 lines for AI comprehension

### Pattern context.md (Background Information)
- [ ] **Comprehensive Context**
  - [ ] Pattern history and evolution
  - [ ] Relationship to other patterns
  - [ ] Use cases and scenarios
  - [ ] Configuration options and customization
  - [ ] Migration notes from script version

- [ ] **Technical Details**
  - [ ] Implementation approach and rationale
  - [ ] Dependencies and requirements
  - [ ] Performance characteristics
  - [ ] Security considerations
  - [ ] Troubleshooting guide

### .claude/contexts/patterns/[pattern].md (Detailed Context)
- [ ] **AI Understanding Enhancement**
  - [ ] Pattern role in overall system
  - [ ] Detailed relationship mapping
  - [ ] Advanced usage patterns
  - [ ] Integration scenarios
  - [ ] Quality metrics and standards

## 🧪 Functional Testing

### Basic Functionality Testing
- [ ] **Core Function Tests**
  - [ ] Command executes without errors with valid inputs
  - [ ] All major features work as expected
  - [ ] Output matches expected format and content
  - [ ] Help text displays correctly with `--help`
  - [ ] Command handles typical use cases successfully

- [ ] **Input Validation Tests**
  - [ ] Empty parameters handled gracefully
  - [ ] Invalid parameters produce helpful error messages
  - [ ] Special characters in parameters handled safely
  - [ ] Boundary conditions tested (very long inputs, etc.)
  - [ ] Required vs optional parameters work correctly

### Edge Case Testing
- [ ] **Error Conditions**
  - [ ] Missing dependencies handled gracefully
  - [ ] File permission errors handled appropriately
  - [ ] Network errors (if applicable) handled with retries
  - [ ] Malformed input files handled safely
  - [ ] Resource exhaustion scenarios tested

- [ ] **Integration Testing**
  - [ ] Command works correctly with other native commands
  - [ ] File outputs can be consumed by other commands
  - [ ] Command can be used in chain workflows
  - [ ] Session management integration works
  - [ ] Subagent validation (if applicable) functions

### Performance Testing
- [ ] **Speed Validation**
  - [ ] Command completes within acceptable time limits
  - [ ] Performance comparable to or better than original script
  - [ ] Memory usage within reasonable bounds
  - [ ] No memory leaks during extended usage
  - [ ] Scales appropriately with input size

## 🔗 Integration Validation

### Command References Update
- [ ] **Script Reference Replacement**
  - [ ] All references to original .sh script found and documented
  - [ ] Native command calls replace script calls
  - [ ] Updated commands tested for functionality
  - [ ] Parameter passing works correctly in new format
  - [ ] Error handling maintained in updated commands

- [ ] **Workflow Integration**
  - [ ] Command works in existing workflows
  - [ ] Chain command integration tested
  - [ ] Session management compatibility verified
  - [ ] Agent integration (if applicable) tested
  - [ ] Quality gates recognize new command

### Dependency Verification
- [ ] **Pattern Dependencies**
  - [ ] All required patterns available as native commands
  - [ ] Dependency chain works correctly
  - [ ] Circular dependencies avoided
  - [ ] Optional dependencies handled gracefully
  - [ ] Version compatibility maintained

## 🛡️ Security Validation

### Permission Audit
- [ ] **Tool Permission Review**
  - [ ] Only necessary tools included in allowed-tools
  - [ ] Bash permissions limited to specific commands
  - [ ] No wildcards in sensitive operations
  - [ ] File system access appropriately limited
  - [ ] Network access justified and minimal

### Security Testing
- [ ] **Input Security**
  - [ ] No code injection vulnerabilities
  - [ ] Path traversal attacks prevented
  - [ ] Command injection prevented
  - [ ] File permissions respected
  - [ ] User input properly sanitized

## 📊 Quality Gates

### Code Quality Standards
- [ ] **Native Command Quality**
  - [ ] Command under 100 lines for maintainability
  - [ ] Clear, readable structure and formatting
  - [ ] Appropriate comments for complex logic
  - [ ] Consistent naming conventions
  - [ ] Error messages helpful and user-friendly

- [ ] **Documentation Quality**
  - [ ] CLAUDE.md file under 200 lines
  - [ ] context.md comprehensive but concise
  - [ ] Examples work correctly when tested
  - [ ] Cross-references accurate and helpful
  - [ ] Grammar and spelling correct

### Compliance Verification
- [ ] **Claude Code Standards**
  - [ ] YAML frontmatter correctly formatted
  - [ ] Tool permissions follow security principles
  - [ ] Command structure follows established patterns
  - [ ] Integration points work with existing system
  - [ ] Output format consistent with other commands

## ✅ Final Validation

### Pre-Deployment Checklist
- [ ] **Comprehensive Testing**
  - [ ] All test cases pass
  - [ ] Integration tests pass
  - [ ] Performance acceptable
  - [ ] Security validation complete
  - [ ] Documentation accurate and complete

- [ ] **Rollout Preparation**
  - [ ] Original script references documented for rollback
  - [ ] Migration path tested
  - [ ] User communication prepared (if needed)
  - [ ] Monitoring in place for issues
  - [ ] Rollback procedure defined

### Post-Deployment Validation
- [ ] **Live Testing**
  - [ ] Command works in production environment
  - [ ] Integration with other commands validated
  - [ ] Performance meets expectations
  - [ ] No error reports from usage
  - [ ] User feedback positive

- [ ] **Cleanup**
  - [ ] Original script can be safely archived
  - [ ] All references updated successfully
  - [ ] Documentation updated
  - [ ] Migration marked complete
  - [ ] Lessons learned documented

## 📝 Pattern-Specific Validation

### For Error Handling Patterns
- [ ] Error codes consistent across different scenarios
- [ ] Log levels appropriate for different error types
- [ ] Error messages include helpful context
- [ ] Recovery suggestions provided where possible
- [ ] Stack traces available for debugging when needed

### For Testing Patterns
- [ ] Multiple test frameworks detected correctly
- [ ] Test output parsing works for all supported formats
- [ ] Parallel execution works without conflicts
- [ ] Test filtering and selection works accurately
- [ ] Coverage reporting accurate and complete

### For Security Patterns
- [ ] Vulnerability detection accurate with minimal false positives
- [ ] Security rules up-to-date with current best practices
- [ ] Different security levels supported appropriately
- [ ] Remediation suggestions actionable and specific
- [ ] Integration with security tools works correctly

### For Quality Patterns
- [ ] Quality metrics accurate and meaningful
- [ ] Thresholds configurable and reasonable
- [ ] Quality reports actionable and clear
- [ ] Integration with CI/CD systems works
- [ ] Quality trends tracked over time

## 🎯 Success Criteria

### Mandatory Requirements (Must Pass)
- [ ] **Functionality**: All original script functionality preserved
- [ ] **Security**: No security vulnerabilities introduced
- [ ] **Performance**: Acceptable speed and resource usage
- [ ] **Integration**: Works with existing commands and workflows
- [ ] **Documentation**: Complete and accurate context files

### Quality Requirements (Should Pass)
- [ ] **User Experience**: Improved ease of use over original
- [ ] **Maintainability**: Code clear and well-structured
- [ ] **Extensibility**: Easy to enhance with new features
- [ ] **Reliability**: Handles edge cases gracefully
- [ ] **Consistency**: Follows established patterns and conventions

### Validation Sign-off
- [ ] **Technical Review**: Code and implementation reviewed
- [ ] **Security Review**: Security implications assessed
- [ ] **Integration Review**: Impact on other components assessed
- [ ] **Documentation Review**: Context files reviewed for accuracy
- [ ] **User Experience Review**: Usability and clarity assessed

**Final Approval**: ✅ Pattern conversion ready for production use

---

This checklist ensures every script conversion maintains quality, security, and functionality while improving the overall native Claude Code experience.