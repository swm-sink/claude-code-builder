---
allowed-tools: Read, Write, Bash(source:*), WebSearch
description: Three-judge evaluation system with consensus validation and quality scoring
argument-hint: [judge-config] [--focus technical|ux|standards] [--consensus-mode strict]
category: command-builder
version: 1.0.0
---

# ⚖️ THREE-JUDGE EVALUATION SYSTEM

Expert evaluation using specialized judges for comprehensive quality assessment.

## Judge Evaluation Framework

### Variant Test Results:
```yaml
$VARIANT_RESULTS_FROM_PREVIOUS_STEP
```

### Research Foundation Applied:
- ✅ Three-judge validation methodology
- ✅ Specialized evaluation domains
- ✅ Consensus scoring mechanisms
- ✅ Quality assessment standards

## Step 1: Judge Configuration & Initialization

### Three-Judge System Architecture:

**Research Insight**: Multi-perspective evaluation ensures comprehensive quality assessment by combining technical correctness, user experience, and standards compliance.

**Judge Specializations:**

1. **Judge 1: Technical Correctness Specialist**
   - Focus: Code quality, performance, security
   - Expertise: Bash scripting, system programming, optimization
   - Weight: 40% of total evaluation

2. **Judge 2: User Experience Specialist**
   - Focus: Usability, documentation, interface design
   - Expertise: UX design, accessibility, user interaction
   - Weight: 35% of total evaluation

3. **Judge 3: Standards Compliance Specialist**
   - Focus: Best practices, conventions, ecosystem integration
   - Expertise: Software standards, Claude Code patterns, compliance
   - Weight: 25% of total evaluation

### Judge Initialization:

**Technical Judge Setup:**
```bash
judge1_technical_init() {
    echo "Initializing Technical Correctness Judge..."
    
    # Load technical evaluation context
    source ./patterns/quality-gates/quality-check.sh
    source ./patterns/security/security-basics.sh
    
    # Set technical evaluation criteria
    export JUDGE1_FOCUS_AREAS=(
        "code_quality"
        "performance_optimization" 
        "security_implementation"
        "error_handling"
        "resource_management"
        "algorithmic_efficiency"
        "memory_safety"
        "concurrent_execution"
    )
    
    # Technical scoring weights
    export JUDGE1_WEIGHTS=(
        "correctness:25"
        "performance:20"
        "security:20"
        "reliability:15"
        "maintainability:10"
        "efficiency:10"
    )
    
    echo "✅ Technical Judge initialized with ${#JUDGE1_FOCUS_AREAS[@]} focus areas"
}

judge2_ux_init() {
    echo "Initializing User Experience Judge..."
    
    # Set UX evaluation criteria
    export JUDGE2_FOCUS_AREAS=(
        "usability"
        "documentation_quality"
        "error_messaging"
        "interface_consistency"
        "accessibility"
        "user_workflow"
        "help_system"
        "feedback_quality"
    )
    
    # UX scoring weights
    export JUDGE2_WEIGHTS=(
        "usability:30"
        "documentation:25"
        "error_experience:20"
        "consistency:15"
        "accessibility:10"
    )
    
    echo "✅ UX Judge initialized with ${#JUDGE2_FOCUS_AREAS[@]} focus areas"
}

judge3_standards_init() {
    echo "Initializing Standards Compliance Judge..."
    
    # Load standards context
    source ./patterns/error-handling/simple-error-handling.sh
    
    # Set standards evaluation criteria
    export JUDGE3_FOCUS_AREAS=(
        "coding_standards"
        "pattern_compliance"
        "naming_conventions"
        "structure_organization"
        "documentation_standards"
        "testing_standards"
        "ecosystem_integration"
        "interoperability"
    )
    
    # Standards scoring weights
    export JUDGE3_WEIGHTS=(
        "pattern_compliance:30"
        "coding_standards:25"
        "documentation:20"
        "integration:15"
        "conventions:10"
    )
    
    echo "✅ Standards Judge initialized with ${#JUDGE3_FOCUS_AREAS[@]} focus areas"
}
```

## Step 2: Judge 1 - Technical Correctness Evaluation

### Technical Assessment Framework:

**Comprehensive Technical Analysis:**
```bash
judge1_evaluate_technical() {
    echo "=== JUDGE 1: TECHNICAL CORRECTNESS EVALUATION ==="
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local technical_scores=()
    local total_technical_score=0
    
    # Evaluation 1: Code Quality (25 points)
    echo "Evaluating code quality..."
    local code_quality_score
    code_quality_score=$(judge1_assess_code_quality "$command_path")
    technical_scores+=("Code Quality: $code_quality_score/25")
    total_technical_score=$((total_technical_score + code_quality_score))
    
    # Evaluation 2: Performance (20 points)
    echo "Evaluating performance..."
    local performance_score
    performance_score=$(judge1_assess_performance "$command_path")
    technical_scores+=("Performance: $performance_score/20")
    total_technical_score=$((total_technical_score + performance_score))
    
    # Evaluation 3: Security (20 points)
    echo "Evaluating security..."
    local security_score
    security_score=$(judge1_assess_security "$command_path")
    technical_scores+=("Security: $security_score/20")
    total_technical_score=$((total_technical_score + security_score))
    
    # Evaluation 4: Reliability (15 points)
    echo "Evaluating reliability..."
    local reliability_score
    reliability_score=$(judge1_assess_reliability "$command_path")
    technical_scores+=("Reliability: $reliability_score/15")
    total_technical_score=$((total_technical_score + reliability_score))
    
    # Evaluation 5: Maintainability (10 points)
    echo "Evaluating maintainability..."
    local maintainability_score
    maintainability_score=$(judge1_assess_maintainability "$command_path")
    technical_scores+=("Maintainability: $maintainability_score/10")
    total_technical_score=$((total_technical_score + maintainability_score))
    
    # Evaluation 6: Efficiency (10 points)
    echo "Evaluating efficiency..."
    local efficiency_score
    efficiency_score=$(judge1_assess_efficiency "$command_path")
    technical_scores+=("Efficiency: $efficiency_score/10")
    total_technical_score=$((total_technical_score + efficiency_score))
    
    # Technical judgment report
    echo "=== JUDGE 1 TECHNICAL ASSESSMENT ==="
    printf '%s\n' "${technical_scores[@]}"
    echo "Total Technical Score: $total_technical_score/100"
    
    # Technical judgment and recommendations
    judge1_generate_technical_recommendations "$total_technical_score"
    
    export JUDGE1_TOTAL_SCORE="$total_technical_score"
    export JUDGE1_DETAILED_SCORES="$(IFS=';'; echo "${technical_scores[*]}")"
    
    return 0
}

judge1_assess_code_quality() {
    local command_path="$1"
    local score=0
    
    # Check function modularity (5 points)
    local function_count
    function_count=$(grep -c "^[a-zA-Z_][a-zA-Z0-9_]*() {" "$command_path"/*.sh 2>/dev/null || echo 0)
    if [[ $function_count -ge 5 ]]; then
        score=$((score + 5))
    elif [[ $function_count -ge 3 ]]; then
        score=$((score + 3))
    elif [[ $function_count -ge 1 ]]; then
        score=$((score + 1))
    fi
    
    # Check variable naming (5 points)
    if grep -q "^[[:space:]]*[a-z_][a-z0-9_]*=" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    # Check error handling usage (5 points)
    if grep -q "handle_error\|log_error" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    # Check comment quality (5 points)
    local comment_lines
    comment_lines=$(grep -c "^[[:space:]]*#" "$command_path"/*.sh 2>/dev/null || echo 0)
    local total_lines
    total_lines=$(wc -l < "$command_path"/*.sh 2>/dev/null || echo 1)
    local comment_ratio=$((comment_lines * 100 / total_lines))
    
    if [[ $comment_ratio -ge 15 ]]; then
        score=$((score + 5))
    elif [[ $comment_ratio -ge 10 ]]; then
        score=$((score + 3))
    elif [[ $comment_ratio -ge 5 ]]; then
        score=$((score + 1))
    fi
    
    # Check code structure (5 points)
    if [[ -f "$command_path/README.md" ]] && [[ -f "$command_path/config.json" ]]; then
        score=$((score + 5))
    elif [[ -f "$command_path/README.md" ]] || [[ -f "$command_path/config.json" ]]; then
        score=$((score + 3))
    fi
    
    echo "$score"
}

judge1_assess_performance() {
    local command_path="$1"
    local score=0
    
    # Check variant test performance
    if [[ $VARIANT_OVERALL_SUCCESS_RATE -ge 95 ]]; then
        score=$((score + 10))
    elif [[ $VARIANT_OVERALL_SUCCESS_RATE -ge 85 ]]; then
        score=$((score + 8))
    elif [[ $VARIANT_OVERALL_SUCCESS_RATE -ge 75 ]]; then
        score=$((score + 5))
    fi
    
    # Check performance stability
    case "$PERFORMANCE_STABILITY" in
        "stable") score=$((score + 5)) ;;
        "moderate") score=$((score + 3)) ;;
        "unstable") score=$((score + 0)) ;;
    esac
    
    # Check optimization features (5 points)
    if grep -q "parallel\|cache\|optimize" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    echo "$score"
}

judge1_assess_security() {
    local command_path="$1"
    local score=0
    
    # Check input validation (8 points)
    if grep -q "validate.*input\|sanitize\|escape" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 8))
    fi
    
    # Check path security (6 points)
    if grep -q "\.\./\|path.*traversal\|realpath" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 6))
    fi
    
    # Check privilege handling (6 points)
    if grep -q "privilege\|uid\|gid\|sudo" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 6))
    fi
    
    echo "$score"
}

judge1_assess_reliability() {
    local command_path="$1"
    local score=0
    
    # Check error handling comprehensiveness (8 points)
    local error_patterns=("set -e" "trap" "||" "return 1" "exit 1")
    local found_patterns=0
    
    for pattern in "${error_patterns[@]}"; do
        if grep -q "$pattern" "$command_path"/*.sh 2>/dev/null; then
            ((found_patterns++))
        fi
    done
    
    score=$((found_patterns * 8 / ${#error_patterns[@]}))
    
    # Check robustness score (7 points)
    local robustness_bonus
    case "$ROBUSTNESS_LEVEL" in
        "excellent") robustness_bonus=7 ;;
        "good") robustness_bonus=5 ;;
        "acceptable") robustness_bonus=3 ;;
        *) robustness_bonus=0 ;;
    esac
    
    score=$((score + robustness_bonus))
    
    echo "$score"
}

judge1_generate_technical_recommendations() {
    local total_score="$1"
    
    echo "=== JUDGE 1 TECHNICAL RECOMMENDATIONS ==="
    
    if [[ $total_score -ge 90 ]]; then
        echo "🏆 EXCELLENT technical implementation"
        echo "- Code quality is outstanding"
        echo "- Performance is optimal"
        echo "- Security measures are comprehensive"
        export JUDGE1_RECOMMENDATION="excellent"
    elif [[ $total_score -ge 75 ]]; then
        echo "✅ GOOD technical implementation"
        echo "- Solid foundation with room for optimization"
        echo "- Consider performance enhancements"
        echo "- Security implementation is adequate"
        export JUDGE1_RECOMMENDATION="good"
    elif [[ $total_score -ge 60 ]]; then
        echo "⚠️ ACCEPTABLE technical implementation"
        echo "- Basic requirements met"
        echo "- Performance optimization needed"
        echo "- Security measures require attention"
        export JUDGE1_RECOMMENDATION="acceptable"
    else
        echo "❌ POOR technical implementation"
        echo "- Significant improvements needed"
        echo "- Performance is inadequate"
        echo "- Security vulnerabilities present"
        export JUDGE1_RECOMMENDATION="poor"
    fi
}
```

## Step 3: Judge 2 - User Experience Evaluation

### UX Assessment Framework:

**User Experience Analysis:**
```bash
judge2_evaluate_ux() {
    echo "=== JUDGE 2: USER EXPERIENCE EVALUATION ==="
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local ux_scores=()
    local total_ux_score=0
    
    # Evaluation 1: Usability (30 points)
    echo "Evaluating usability..."
    local usability_score
    usability_score=$(judge2_assess_usability "$command_path")
    ux_scores+=("Usability: $usability_score/30")
    total_ux_score=$((total_ux_score + usability_score))
    
    # Evaluation 2: Documentation (25 points)
    echo "Evaluating documentation..."
    local documentation_score
    documentation_score=$(judge2_assess_documentation "$command_path")
    ux_scores+=("Documentation: $documentation_score/25")
    total_ux_score=$((total_ux_score + documentation_score))
    
    # Evaluation 3: Error Experience (20 points)
    echo "Evaluating error experience..."
    local error_experience_score
    error_experience_score=$(judge2_assess_error_experience "$command_path")
    ux_scores+=("Error Experience: $error_experience_score/20")
    total_ux_score=$((total_ux_score + error_experience_score))
    
    # Evaluation 4: Consistency (15 points)
    echo "Evaluating consistency..."
    local consistency_score
    consistency_score=$(judge2_assess_consistency "$command_path")
    ux_scores+=("Consistency: $consistency_score/15")
    total_ux_score=$((total_ux_score + consistency_score))
    
    # Evaluation 5: Accessibility (10 points)
    echo "Evaluating accessibility..."
    local accessibility_score
    accessibility_score=$(judge2_assess_accessibility "$command_path")
    ux_scores+=("Accessibility: $accessibility_score/10")
    total_ux_score=$((total_ux_score + accessibility_score))
    
    # UX judgment report
    echo "=== JUDGE 2 UX ASSESSMENT ==="
    printf '%s\n' "${ux_scores[@]}"
    echo "Total UX Score: $total_ux_score/100"
    
    # UX judgment and recommendations
    judge2_generate_ux_recommendations "$total_ux_score"
    
    export JUDGE2_TOTAL_SCORE="$total_ux_score"
    export JUDGE2_DETAILED_SCORES="$(IFS=';'; echo "${ux_scores[*]}")"
    
    return 0
}

judge2_assess_usability() {
    local command_path="$1"
    local score=0
    
    # Check help system quality (10 points)
    if [[ -f "$command_path/help.md" ]] || grep -q "\-\-help\|usage" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 10))
    fi
    
    # Check intuitive argument structure (8 points)
    if grep -q "getopts\|while.*case.*in" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 8))
    fi
    
    # Check output format options (6 points)
    if grep -q "format.*json\|format.*text\|output.*format" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 6))
    fi
    
    # Check user feedback quality (6 points)
    if grep -q "log_info\|echo.*progress\|printf.*status" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 6))
    fi
    
    echo "$score"
}

judge2_assess_documentation() {
    local command_path="$1"
    local score=0
    
    # Check README existence and quality (15 points)
    if [[ -f "$command_path/README.md" ]]; then
        local readme_size
        readme_size=$(wc -l < "$command_path/README.md")
        if [[ $readme_size -ge 50 ]]; then
            score=$((score + 15))
        elif [[ $readme_size -ge 20 ]]; then
            score=$((score + 10))
        elif [[ $readme_size -ge 5 ]]; then
            score=$((score + 5))
        fi
    fi
    
    # Check examples (5 points)
    if grep -q "example\|Example\|EXAMPLE" "$command_path"/*.md 2>/dev/null; then
        score=$((score + 5))
    fi
    
    # Check API documentation (5 points)
    if [[ -f "$command_path/api.md" ]] || grep -q "API\|function.*description" "$command_path"/*.md 2>/dev/null; then
        score=$((score + 5))
    fi
    
    echo "$score"
}

judge2_assess_error_experience() {
    local command_path="$1"
    local score=0
    
    # Check helpful error messages (10 points)
    if grep -q "log_error.*\".*\"" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 10))
    fi
    
    # Check error recovery suggestions (5 points)
    if grep -q "suggest\|recommendation\|try.*instead" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    # Check error codes (5 points)
    if grep -q "return [0-9]\|exit [0-9]" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    echo "$score"
}

judge2_generate_ux_recommendations() {
    local total_score="$1"
    
    echo "=== JUDGE 2 UX RECOMMENDATIONS ==="
    
    if [[ $total_score -ge 85 ]]; then
        echo "🎉 EXCELLENT user experience"
        echo "- Intuitive and user-friendly interface"
        echo "- Comprehensive documentation"
        echo "- Clear error messaging"
        export JUDGE2_RECOMMENDATION="excellent"
    elif [[ $total_score -ge 70 ]]; then
        echo "✅ GOOD user experience"
        echo "- Generally user-friendly"
        echo "- Documentation is adequate"
        echo "- Error handling could be improved"
        export JUDGE2_RECOMMENDATION="good"
    elif [[ $total_score -ge 55 ]]; then
        echo "⚠️ ACCEPTABLE user experience"
        echo "- Basic usability achieved"
        echo "- Documentation needs enhancement"
        echo "- Error experience requires attention"
        export JUDGE2_RECOMMENDATION="acceptable"
    else
        echo "❌ POOR user experience"
        echo "- Significant usability issues"
        echo "- Documentation is inadequate"
        echo "- Error handling is confusing"
        export JUDGE2_RECOMMENDATION="poor"
    fi
}
```

## Step 4: Judge 3 - Standards Compliance Evaluation

### Standards Assessment Framework:

**Standards Compliance Analysis:**
```bash
judge3_evaluate_standards() {
    echo "=== JUDGE 3: STANDARDS COMPLIANCE EVALUATION ==="
    
    local command_path=".claude/commands/$COMMAND_NAME"
    local standards_scores=()
    local total_standards_score=0
    
    # Evaluation 1: Pattern Compliance (30 points)
    echo "Evaluating pattern compliance..."
    local pattern_score
    pattern_score=$(judge3_assess_pattern_compliance "$command_path")
    standards_scores+=("Pattern Compliance: $pattern_score/30")
    total_standards_score=$((total_standards_score + pattern_score))
    
    # Evaluation 2: Coding Standards (25 points)
    echo "Evaluating coding standards..."
    local coding_score
    coding_score=$(judge3_assess_coding_standards "$command_path")
    standards_scores+=("Coding Standards: $coding_score/25")
    total_standards_score=$((total_standards_score + coding_score))
    
    # Evaluation 3: Documentation Standards (20 points)
    echo "Evaluating documentation standards..."
    local doc_standards_score
    doc_standards_score=$(judge3_assess_documentation_standards "$command_path")
    standards_scores+=("Documentation Standards: $doc_standards_score/20")
    total_standards_score=$((total_standards_score + doc_standards_score))
    
    # Evaluation 4: Integration Standards (15 points)
    echo "Evaluating integration standards..."
    local integration_score
    integration_score=$(judge3_assess_integration_standards "$command_path")
    standards_scores+=("Integration Standards: $integration_score/15")
    total_standards_score=$((total_standards_score + integration_score))
    
    # Evaluation 5: Naming Conventions (10 points)
    echo "Evaluating naming conventions..."
    local naming_score
    naming_score=$(judge3_assess_naming_conventions "$command_path")
    standards_scores+=("Naming Conventions: $naming_score/10")
    total_standards_score=$((total_standards_score + naming_score))
    
    # Standards judgment report
    echo "=== JUDGE 3 STANDARDS ASSESSMENT ==="
    printf '%s\n' "${standards_scores[@]}"
    echo "Total Standards Score: $total_standards_score/100"
    
    # Standards judgment and recommendations
    judge3_generate_standards_recommendations "$total_standards_score"
    
    export JUDGE3_TOTAL_SCORE="$total_standards_score"
    export JUDGE3_DETAILED_SCORES="$(IFS=';'; echo "${standards_scores[*]}")"
    
    return 0
}

judge3_assess_pattern_compliance() {
    local command_path="$1"
    local score=0
    
    # Check error handling pattern usage (10 points)
    if grep -q "log_info\|log_warn\|log_error\|handle_error" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 10))
    fi
    
    # Check testing pattern integration (10 points)
    if [[ -f "$command_path/tests/" ]] || grep -q "test.*function\|assert" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 10))
    fi
    
    # Check configuration pattern (5 points)
    if [[ -f "$command_path/config.json" ]] || grep -q "config\|configuration" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    # Check security pattern (5 points)
    if grep -q "security\|validate\|sanitize" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    echo "$score"
}

judge3_assess_coding_standards() {
    local command_path="$1"
    local score=0
    
    # Check bash best practices (10 points)
    if grep -q "set -euo pipefail\|set -e" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    if grep -q "#!/bin/bash" "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 5))
    fi
    
    # Check function structure (8 points)
    local functions_with_local
    functions_with_local=$(grep -c "local " "$command_path"/*.sh 2>/dev/null || echo 0)
    if [[ $functions_with_local -ge 3 ]]; then
        score=$((score + 8))
    elif [[ $functions_with_local -ge 1 ]]; then
        score=$((score + 4))
    fi
    
    # Check consistent indentation (7 points)
    if grep -q "^    " "$command_path"/*.sh 2>/dev/null; then
        score=$((score + 7))
    fi
    
    echo "$score"
}

judge3_generate_standards_recommendations() {
    local total_score="$1"
    
    echo "=== JUDGE 3 STANDARDS RECOMMENDATIONS ==="
    
    if [[ $total_score -ge 85 ]]; then
        echo "📏 EXCELLENT standards compliance"
        echo "- Follows all major conventions"
        echo "- Pattern integration is exemplary"
        echo "- Documentation meets standards"
        export JUDGE3_RECOMMENDATION="excellent"
    elif [[ $total_score -ge 70 ]]; then
        echo "✅ GOOD standards compliance"
        echo "- Most standards are followed"
        echo "- Minor convention improvements needed"
        echo "- Pattern usage is appropriate"
        export JUDGE3_RECOMMENDATION="good"
    elif [[ $total_score -ge 55 ]]; then
        echo "⚠️ ACCEPTABLE standards compliance"
        echo "- Basic standards are met"
        echo "- Pattern integration needs work"
        echo "- Documentation requires standardization"
        export JUDGE3_RECOMMENDATION="acceptable"
    else
        echo "❌ POOR standards compliance"
        echo "- Major standards violations"
        echo "- Pattern integration is missing"
        echo "- Documentation is substandard"
        export JUDGE3_RECOMMENDATION="poor"
    fi
}
```

## Step 5: Consensus Building & Final Scoring

### Three-Judge Consensus System:

**Consensus Calculation:**
```bash
calculate_judge_consensus() {
    echo "=== CALCULATING THREE-JUDGE CONSENSUS ==="
    
    # Initialize judges
    judge1_technical_init
    judge2_ux_init
    judge3_standards_init
    
    # Run evaluations
    judge1_evaluate_technical
    judge2_evaluate_ux
    judge3_evaluate_standards
    
    # Apply weights and calculate consensus
    local technical_weighted=$((JUDGE1_TOTAL_SCORE * 40 / 100))
    local ux_weighted=$((JUDGE2_TOTAL_SCORE * 35 / 100))
    local standards_weighted=$((JUDGE3_TOTAL_SCORE * 25 / 100))
    
    local consensus_score=$((technical_weighted + ux_weighted + standards_weighted))
    
    echo "=== JUDGE SCORES & WEIGHTS ==="
    echo "Judge 1 (Technical): $JUDGE1_TOTAL_SCORE/100 (weight: 40%) = $technical_weighted points"
    echo "Judge 2 (UX): $JUDGE2_TOTAL_SCORE/100 (weight: 35%) = $ux_weighted points"
    echo "Judge 3 (Standards): $JUDGE3_TOTAL_SCORE/100 (weight: 25%) = $standards_weighted points"
    echo ""
    echo "CONSENSUS SCORE: $consensus_score/100"
    
    # Consensus analysis
    generate_consensus_analysis "$consensus_score"
    
    export CONSENSUS_SCORE="$consensus_score"
    export WEIGHTED_TECHNICAL="$technical_weighted"
    export WEIGHTED_UX="$ux_weighted"
    export WEIGHTED_STANDARDS="$standards_weighted"
    
    return 0
}

generate_consensus_analysis() {
    local consensus_score="$1"
    
    echo "=== CONSENSUS ANALYSIS ==="
    
    # Judge agreement analysis
    local score_diff_1_2=$((JUDGE1_TOTAL_SCORE - JUDGE2_TOTAL_SCORE))
    local score_diff_1_3=$((JUDGE1_TOTAL_SCORE - JUDGE3_TOTAL_SCORE))
    local score_diff_2_3=$((JUDGE2_TOTAL_SCORE - JUDGE3_TOTAL_SCORE))
    
    # Calculate absolute differences
    score_diff_1_2=${score_diff_1_2#-}
    score_diff_1_3=${score_diff_1_3#-}
    score_diff_2_3=${score_diff_2_3#-}
    
    local max_diff=$score_diff_1_2
    if [[ $score_diff_1_3 -gt $max_diff ]]; then max_diff=$score_diff_1_3; fi
    if [[ $score_diff_2_3 -gt $max_diff ]]; then max_diff=$score_diff_2_3; fi
    
    echo "Judge Agreement Analysis:"
    echo "- Technical vs UX: ${score_diff_1_2} point difference"
    echo "- Technical vs Standards: ${score_diff_1_3} point difference"
    echo "- UX vs Standards: ${score_diff_2_3} point difference"
    echo "- Maximum Disagreement: $max_diff points"
    
    # Consensus quality assessment
    if [[ $max_diff -le 10 ]]; then
        echo "✅ HIGH consensus - Judges strongly agree"
        export CONSENSUS_QUALITY="high"
    elif [[ $max_diff -le 20 ]]; then
        echo "⚠️ MODERATE consensus - Some disagreement"
        export CONSENSUS_QUALITY="moderate"
    else
        echo "❌ LOW consensus - Significant disagreement"
        export CONSENSUS_QUALITY="low"
    fi
    
    # Final certification
    if [[ $consensus_score -ge 85 ]]; then
        echo "🏆 CERTIFICATION: EXCELLENT - Ready for production"
        export COMMAND_CERTIFICATION="excellent"
    elif [[ $consensus_score -ge 70 ]]; then
        echo "✅ CERTIFICATION: GOOD - Recommended for use"
        export COMMAND_CERTIFICATION="good"
    elif [[ $consensus_score -ge 55 ]]; then
        echo "⚠️ CERTIFICATION: ACCEPTABLE - Suitable with monitoring"
        export COMMAND_CERTIFICATION="acceptable"
    else
        echo "❌ CERTIFICATION: POOR - Requires significant improvement"
        export COMMAND_CERTIFICATION="poor"
    fi
}
```

## Step 6: Detailed Judge Report Generation

### Comprehensive Evaluation Report:

**Generate Judge Report:**
```bash
generate_three_judge_report() {
    local report_file=".claude/commands/$COMMAND_NAME/judge_evaluation_report.md"
    
    cat > "$report_file" << EOF
# $COMMAND_NAME Three-Judge Evaluation Report

Generated: $(date -Iseconds)

## Executive Summary

**Consensus Score**: $CONSENSUS_SCORE/100
**Certification Level**: $COMMAND_CERTIFICATION
**Consensus Quality**: $CONSENSUS_QUALITY
**Overall Recommendation**: $OVERALL_RECOMMENDATION

## Individual Judge Assessments

### Judge 1: Technical Correctness Specialist
**Total Score**: $JUDGE1_TOTAL_SCORE/100 (Weight: 40%)
**Recommendation**: $JUDGE1_RECOMMENDATION

**Detailed Scores**:
$(echo "$JUDGE1_DETAILED_SCORES" | tr ';' '\n' | sed 's/^/- /')

### Judge 2: User Experience Specialist  
**Total Score**: $JUDGE2_TOTAL_SCORE/100 (Weight: 35%)
**Recommendation**: $JUDGE2_RECOMMENDATION

**Detailed Scores**:
$(echo "$JUDGE2_DETAILED_SCORES" | tr ';' '\n' | sed 's/^/- /')

### Judge 3: Standards Compliance Specialist
**Total Score**: $JUDGE3_TOTAL_SCORE/100 (Weight: 25%)
**Recommendation**: $JUDGE3_RECOMMENDATION

**Detailed Scores**:
$(echo "$JUDGE3_DETAILED_SCORES" | tr ';' '\n' | sed 's/^/- /')

## Consensus Analysis

**Weighted Scores**:
- Technical (40%): $WEIGHTED_TECHNICAL points
- UX (35%): $WEIGHTED_UX points  
- Standards (25%): $WEIGHTED_STANDARDS points

**Judge Agreement**: $CONSENSUS_QUALITY consensus

## Certification & Recommendations

**Certification Level**: $COMMAND_CERTIFICATION

**Next Steps**: $NEXT_STEPS_BASED_ON_CERTIFICATION

## Quality Gates Assessment

- **Minimum Viability** (≥40): $(if [[ $CONSENSUS_SCORE -ge 40 ]]; then echo "✅ PASSED"; else echo "❌ FAILED"; fi)
- **Production Ready** (≥55): $(if [[ $CONSENSUS_SCORE -ge 55 ]]; then echo "✅ PASSED"; else echo "❌ FAILED"; fi)
- **Excellence Standard** (≥70): $(if [[ $CONSENSUS_SCORE -ge 70 ]]; then echo "✅ PASSED"; else echo "❌ FAILED"; fi)
- **Outstanding Quality** (≥85): $(if [[ $CONSENSUS_SCORE -ge 85 ]]; then echo "✅ PASSED"; else echo "❌ FAILED"; fi)

EOF

    echo "Three-judge evaluation report generated: $report_file"
}
```

## Three-Judge Evaluation Complete

### Judge Evaluation Summary:
- ✅ **Technical Evaluation**: $JUDGE1_TOTAL_SCORE/100 ($JUDGE1_RECOMMENDATION)
- ✅ **UX Evaluation**: $JUDGE2_TOTAL_SCORE/100 ($JUDGE2_RECOMMENDATION)
- ✅ **Standards Evaluation**: $JUDGE3_TOTAL_SCORE/100 ($JUDGE3_RECOMMENDATION)
- ✅ **Consensus Score**: $CONSENSUS_SCORE/100 ($CONSENSUS_QUALITY consensus)
- ✅ **Certification**: $COMMAND_CERTIFICATION level
- ✅ **Quality Gates**: $QUALITY_GATES_PASSED passed

### Weighted Assessment:
```yaml
judge_evaluation:
  consensus_score: $CONSENSUS_SCORE/100
  certification: $COMMAND_CERTIFICATION
  consensus_quality: $CONSENSUS_QUALITY
  
  individual_scores:
    technical: $JUDGE1_TOTAL_SCORE/100
    ux: $JUDGE2_TOTAL_SCORE/100
    standards: $JUDGE3_TOTAL_SCORE/100
    
  weighted_contributions:
    technical: $WEIGHTED_TECHNICAL points (40%)
    ux: $WEIGHTED_UX points (35%)
    standards: $WEIGHTED_STANDARDS points (25%)
    
  ready_for_optimization: true
```

### Next Phase:

**Continue to:** `/command-builder/08-optimize` for meta-prompt optimization (if consensus < 85) or `/command-builder/09-enhance` for RAG enhancement.

Your command has been evaluated by three specialized judges and is ready for optimization or enhancement.

**Ready to proceed to optimization phase?** (y/n) > [WAIT FOR CONFIRMATION]