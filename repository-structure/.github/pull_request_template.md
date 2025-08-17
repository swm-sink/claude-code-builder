# Pull Request

## 📋 Description

### Summary
<!-- Provide a clear and concise description of your changes -->
Brief description of what this PR does:

### Context and Motivation
<!-- Why is this change needed? What problem does it solve? -->
**Technical:** [Detailed technical context and problem being solved]
**Simple:** [Simple explanation of why this change is needed]
**Connection:** [How this helps developers learn or improves their workflow]

### Related Issues
<!-- Link any related issues -->
- Closes #[issue_number]
- Related to #[issue_number]
- Addresses #[issue_number]

## 🔧 Type of Change

Select all that apply:

- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] ✨ New pattern (adds new development pattern)
- [ ] ⚡ Enhancement (improves existing functionality)
- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] 📚 Documentation update
- [ ] 🔒 Security improvement
- [ ] 🧪 Tests (adding or modifying tests)
- [ ] 🏗️ Infrastructure/tooling changes
- [ ] 🎨 Code style/formatting changes
- [ ] ♻️ Refactoring (no functional changes)

## 📐 Pattern-Specific Checklist (if applicable)

If this PR adds or modifies patterns, ensure:

### Pattern Requirements ✅
- [ ] Pattern is under 50 lines for Claude comprehension
- [ ] Includes dual explanations (Technical/Simple/Connection)
- [ ] Uses bash 3.x compatible syntax (macOS compatibility)
- [ ] Follows snake_case function naming conventions
- [ ] Includes proper error handling
- [ ] Has inline usage examples

### Pattern Documentation ✅
- [ ] Description comment at the top of the file
- [ ] Usage examples in comments
- [ ] Function documentation with dual explanations
- [ ] Integration examples with other patterns
- [ ] Troubleshooting guidance

### Pattern Quality ✅
- [ ] Functions have single responsibility
- [ ] Input validation implemented
- [ ] Output sanitization for security
- [ ] Proper exit codes and error messages
- [ ] No hardcoded paths or assumptions

## 🧪 Testing

### Testing Completed ✅
- [ ] I have tested these changes locally
- [ ] Changes work on macOS (bash 3.x)
- [ ] Changes work on Linux (bash 4.x+)
- [ ] I have added/updated tests for new functionality
- [ ] All existing tests pass
- [ ] I tested pattern combinations if applicable

### Test Environment
<!-- Describe your testing environment -->
- **OS:** [macOS 14.x, Ubuntu 22.04, etc.]
- **Bash Version:** [3.2.57, 4.4.20, 5.1.16, etc.]
- **Project Type Tested:** [Node.js, Python, Go, web app, etc.]
- **Claude Code Version:** [if applicable]

### Test Results
<!-- Describe what you tested and the results -->
```bash
# Commands run for testing
source patterns/example/pattern.sh
test_function "input"
# Expected output: success message
```

## 🔒 Security

### Security Review ✅
- [ ] I have reviewed these changes for security implications
- [ ] No secrets, passwords, or sensitive information are included
- [ ] Input validation is implemented where applicable
- [ ] Error handling doesn't expose sensitive information
- [ ] No command injection vulnerabilities introduced
- [ ] No path traversal vulnerabilities introduced

### Security Considerations
<!-- Describe any security considerations -->
- **Input Validation:** [How inputs are validated]
- **Output Sanitization:** [How outputs are sanitized]
- **Command Execution:** [Safe command execution practices]
- **File Operations:** [Secure file handling]

## 📚 Documentation

### Documentation Updates ✅
- [ ] I have updated relevant documentation
- [ ] Code includes appropriate comments and dual explanations
- [ ] README.md updated if applicable
- [ ] CLAUDE.md updated if applicable
- [ ] Pattern README files updated
- [ ] Examples and usage documentation included

### Documentation Quality
- [ ] Documentation follows dual explanation format
- [ ] Examples are clear and working
- [ ] Troubleshooting guidance provided
- [ ] Links and references are correct

## ⚖️ Legal and Compliance

### DCO & Legal ✅
- [ ] All commits are signed off with DCO (`git commit -s`)
- [ ] Changes comply with MIT license
- [ ] No copyright issues with included code
- [ ] Attribution provided for any external code or concepts

### DCO Verification
<!-- Verify your DCO sign-off -->
All commits include: `Signed-off-by: Your Name <your.email@example.com>`

## 🎯 Quality Gates

### Code Quality ✅
- [ ] Code follows project style guidelines
- [ ] ShellCheck linting passes
- [ ] No trailing whitespace or formatting issues
- [ ] Variable names are descriptive
- [ ] Functions are well-documented

### Performance ✅
- [ ] Changes don't significantly impact pattern loading time
- [ ] No performance anti-patterns introduced
- [ ] Efficient algorithms and approaches used
- [ ] Patterns source in < 1 second

### Compatibility ✅
- [ ] Works with existing patterns without conflicts
- [ ] Backward compatible with current API
- [ ] Cross-platform compatible (macOS/Linux)
- [ ] Integrates with git workflows
- [ ] Works in CI/CD environments

## 🤖 Claude Code Integration

### AI Assistance Optimization ✅
- [ ] Pattern size optimized for Claude comprehension (< 50 lines)
- [ ] Dual explanations support AI understanding
- [ ] Clear function names aid AI assistance
- [ ] Usage examples help AI provide guidance
- [ ] Error messages are clear for AI to explain

### Claude Code Testing
<!-- If you tested with Claude Code -->
- [ ] Tested pattern with Claude Code assistance
- [ ] Claude can understand and explain the pattern
- [ ] Claude can provide helpful usage guidance
- [ ] AI assistance workflow is smooth

## 🌟 Community Value

### Educational Value ✅
- [ ] Changes provide learning opportunities
- [ ] Demonstrates transferable development concepts
- [ ] Includes practical, real-world examples
- [ ] Supports skill development

### Community Impact
<!-- Describe how this helps the community -->
This change helps the community by:
- [Specific benefit 1]
- [Specific benefit 2]
- [Learning opportunity it provides]

## 🔍 Review Guidance

### For Reviewers
<!-- Help reviewers understand what to focus on -->
Please pay special attention to:
- [ ] Pattern size and Claude comprehension
- [ ] Security implications of changes
- [ ] Educational value and dual explanations
- [ ] Integration with existing patterns
- [ ] Cross-platform compatibility

### Areas of Focus
- **Security:** [Specific security aspects to review]
- **Patterns:** [Pattern-specific considerations]
- **Documentation:** [Documentation areas to verify]
- **Testing:** [Testing scenarios to validate]

## 📋 Deployment Checklist

### Pre-Merge Requirements ✅
- [ ] All CI/CD checks pass
- [ ] Security scan passes
- [ ] Pattern validation passes
- [ ] DCO check passes
- [ ] Documentation validation passes
- [ ] Code review approved
- [ ] Conflicts resolved

### Post-Merge Actions
<!-- Actions to take after merge -->
- [ ] Update related documentation
- [ ] Notify community of new features
- [ ] Monitor for any issues
- [ ] Update examples if needed

## 💬 Additional Notes

### Breaking Changes
<!-- If this includes breaking changes -->
**Breaking Changes:** [List any breaking changes]
**Migration Guide:** [How users should migrate]
**Deprecation Timeline:** [When old functionality will be removed]

### Future Improvements
<!-- Ideas for future enhancements -->
- [Future enhancement 1]
- [Future enhancement 2]
- [Follow-up work needed]

### Dependencies
<!-- New dependencies or tool requirements -->
**New Dependencies:** [List any new external dependencies]
**Tool Requirements:** [Required tools or versions]
**Installation Impact:** [How this affects installation]

---

## 🤝 Contribution Checklist

**I confirm that:**

- [ ] I have read and understand the [GOVERNANCE.md](GOVERNANCE.md) guidelines
- [ ] I have read and followed the [SECURITY.md](SECURITY.md) practices
- [ ] I understand the [DCO.md](DCO.md) requirements and have signed all commits
- [ ] I have tested my changes thoroughly
- [ ] I am willing to respond to review feedback
- [ ] I understand this contribution will be licensed under MIT
- [ ] I have considered the educational value of my changes
- [ ] I am committed to supporting this contribution

**For the community:**

- [ ] This change benefits the broader development community
- [ ] The implementation follows security best practices
- [ ] The documentation supports learning and skill development
- [ ] The code is maintainable and well-documented

---

**Thank you for contributing to dev-platform! 🚀**

Your contribution helps build better development tools and teaches valuable skills to the community. We appreciate your effort in making development easier, safer, and more enjoyable for everyone.

**Next steps:**
1. ✅ Submit this PR when ready
2. 🔄 Respond to any review feedback
3. 🎉 Celebrate when it's merged!
4. 📚 Consider contributing documentation or examples
5. 🤝 Help review other community contributions