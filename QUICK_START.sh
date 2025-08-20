#!/bin/bash
# QUICK_START.sh - One-command demo of Claude Code Builder
# Run this to see patterns in action: ./QUICK_START.sh

set -euo pipefail

# Load the logging pattern
source patterns/logging/simple-logging.sh

# Welcome message
log_info "🚀 Welcome to Claude Code Builder!"
log_info "Loading AI-native development patterns..."

# Demonstrate pattern functionality
log_success "✅ Logging pattern loaded successfully"
log_info "📚 You now have access to these logging functions:"
echo "   • log_info 'Your message here'"  
echo "   • log_success 'Success message'"
echo "   • log_warn 'Warning message'"
echo "   • log_error 'Error message'"

# Load error handling pattern
source patterns/error-handling/simple-error-handling.sh
log_success "✅ Error handling pattern loaded"
log_info "🛡️ You now have robust error handling with handle_error"

# Load configuration pattern  
source patterns/configuration/config-reader.sh
log_success "✅ Configuration pattern loaded"
log_info "⚙️ You can now read config with get_config"

# Show next steps
echo
log_info "🎯 Try these commands:"
echo "   source patterns/logging/simple-logging.sh"
echo "   log_info 'Hello from Claude Code Builder!'"
echo 
echo "📖 Next steps:"
echo "   • Read README.md for full installation guide"
echo "   • Browse examples/ directory for more examples"
echo "   • Check docs/ for comprehensive documentation"
echo
log_success "🎉 Claude Code Builder patterns are ready to use!"