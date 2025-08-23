# Function Complexity Analyzer Tool - AI Assistant Guide

> **Claude Code integration guide for comprehensive function complexity analysis and code maintainability assessment**

## Tool Purpose

**Technical**: Advanced function complexity analyzer providing cyclomatic complexity calculation, cognitive complexity assessment, Halstead metrics computation, maintainability index scoring, and intelligent refactoring recommendations across multiple programming languages with language-specific pattern recognition.

**Simple**: Smart code doctor that examines your functions, measures how complicated they are, and tells you exactly which ones need simplification to stay healthy and maintainable.

**Connection**: Teaches complexity management and code maintainability principles essential for creating sustainable, understandable code that both humans and AI can work with effectively.

## Core Analysis Operations

### Single File Analysis
```bash
# Analyze complexity of a single file
/function-complexity-analyzer analyze-file /path/to/code.py

# With custom complexity threshold
/function-complexity-analyzer analyze-file /path/to/code.js 15

# Analyze current file with strict threshold
/function-complexity-analyzer analyze-file ./complex-module.go 8
```

**When to use**: Code reviews, identifying refactoring targets, understanding function complexity

**Claude assistance approach**:
- Help users understand complexity metrics and their implications
- Explain the difference between cyclomatic and cognitive complexity
- Guide refactoring strategies for complex functions
- Connect complexity to maintainability and bug risk

### Project-Wide Analysis
```bash
# Analyze entire project complexity
/function-complexity-analyzer analyze-project

# Analyze specific directory with threshold
/function-complexity-analyzer analyze-project ./src 12

# Comprehensive project assessment
/function-complexity-analyzer comprehensive ./project
```

**When to use**: Technical debt assessment, project health checks, team code quality reviews

**Claude assistance approach**:
- Interpret project-wide complexity patterns
- Help prioritize refactoring efforts
- Explain how complexity impacts team productivity
- Suggest architectural improvements

### Complexity Hotspot Detection
```bash
# Find top 10 most complex functions
/function-complexity-analyzer hotspots

# Find top 20 complexity hotspots in project
/function-complexity-analyzer hotspots ./src 20

# Identify critical refactoring targets
/function-complexity-analyzer hotspots ./backend 5
```

**When to use**: Prioritizing refactoring work, identifying high-risk code, focusing improvement efforts

**Claude assistance approach**:
- Explain why certain functions become complexity hotspots
- Guide systematic refactoring of complex functions
- Help create refactoring plans and priorities
- Connect hotspots to bug probability and maintenance cost

## Complexity Metrics Explained

### Cyclomatic Complexity (30% weight)
**What it measures**: Number of independent paths through code

**Key factors**:
- Each `if`, `else if`, `case` adds +1
- Each `for`, `while`, `do-while` adds +1
- Each `&&`, `||` in conditions adds +1
- Each `try-catch` block adds +1

**Claude guidance approach**:
- Explain that cyclomatic complexity = minimum number of test cases needed
- Help users understand that complexity > 10 indicates high risk
- Guide extraction of complex conditions into separate functions
- Show how to reduce complexity through early returns

### Cognitive Complexity (25% weight)
**What it measures**: How difficult code is for humans to understand

**Key factors**:
- Nesting depth multiplies complexity
- Breaks in linear flow increase complexity
- Recursion adds significant complexity
- Complex boolean logic compounds difficulty

**Claude guidance approach**:
- Explain that cognitive complexity better reflects human comprehension difficulty
- Help flatten deeply nested code structures
- Guide simplification of control flow
- Suggest patterns that reduce cognitive load

### Halstead Complexity (15% weight)
**What it measures**: Code volume and difficulty based on operators and operands

**Key metrics**:
- n1 = unique operators
- n2 = unique operands
- N1 = total operators
- N2 = total operands
- Volume = N * log2(n)
- Difficulty = (n1/2) * (N2/n2)
- Effort = Volume * Difficulty

**Claude guidance approach**:
- Explain Halstead metrics in practical terms
- Help reduce vocabulary complexity (fewer unique operators/operands)
- Guide consistent naming to reduce operand variety
- Connect metrics to code readability

### Maintainability Index
**What it measures**: Overall code maintainability (0-100 scale)

**Score interpretation**:
- 85-100: Highly maintainable
- 65-85: Moderately maintainable
- 0-65: Difficult to maintain

**Claude guidance approach**:
- Explain the composite nature of maintainability index
- Help improve specific components (complexity, volume, comments)
- Guide balanced improvements across all factors
- Connect maintainability to long-term project health

## Multi-Language Support

### Language-Specific Patterns

#### Python
```bash
/function-complexity-analyzer analyze-file script.py
```
**Python-specific considerations**:
- List comprehensions vs loops
- Generator expressions complexity
- Decorator impact on complexity
- Async/await patterns

#### JavaScript/TypeScript
```bash
/function-complexity-analyzer analyze-file app.js
```
**JavaScript-specific considerations**:
- Promise chains vs async/await
- Callback complexity
- Arrow function readability
- Closure complexity

#### Go
```bash
/function-complexity-analyzer analyze-file service.go
```
**Go-specific considerations**:
- Goroutine complexity
- Channel operations
- Error handling patterns
- Interface compliance

#### Rust
```bash
/function-complexity-analyzer analyze-file lib.rs
```
**Rust-specific considerations**:
- Match expression complexity
- Lifetime complexity
- Trait implementation
- Error handling with Result

## Refactoring Recommendations

### High Cyclomatic Complexity (>10)
**Common causes**:
- Too many conditional branches
- Complex switch/case statements
- Multiple exit points

**Refactoring strategies**:
1. **Extract Method**: Break large functions into smaller ones
2. **Replace Conditional with Polymorphism**: Use objects instead of switches
3. **Decompose Conditional**: Extract complex conditions into methods
4. **Replace Nested Conditional with Guard Clauses**: Use early returns

**Claude assistance approach**:
- Provide specific before/after refactoring examples
- Explain the benefits of each refactoring pattern
- Guide step-by-step refactoring process
- Help maintain functionality during refactoring

### High Cognitive Complexity (>15)
**Common causes**:
- Deep nesting
- Complex boolean logic
- Mixed abstraction levels
- Unclear control flow

**Refactoring strategies**:
1. **Flatten Nesting**: Use early returns and guard clauses
2. **Extract Complex Logic**: Move complex calculations to separate functions
3. **Simplify Boolean Expressions**: Use descriptive variables for conditions
4. **Apply Single Responsibility Principle**: One function, one purpose

### High Nesting Depth (>4)
**Common causes**:
- Multiple nested loops
- Deeply nested conditionals
- Callback hell (JavaScript)
- Error handling cascades

**Refactoring strategies**:
1. **Extract Nested Logic**: Move inner loops/conditions to functions
2. **Use Early Returns**: Eliminate unnecessary nesting
3. **Apply Chain of Responsibility**: For sequential validations
4. **Async/Await over Callbacks**: In asynchronous code

## Integration with Other Tools

### With Error Handler
```bash
# Complexity analysis with comprehensive error reporting
/error-handler "info" "Starting complexity analysis"

complexity_result=$(/function-complexity-analyzer analyze-project)
if [ $? -eq 0 ]; then
    /error-handler "info" "✅ Project complexity is well-managed"
else
    /error-handler "warn" "⚠️  High complexity detected - refactoring recommended"
fi
```

### With Quality Gates
```bash
# Complexity as quality gate
complexity_score=$(/function-complexity-analyzer analyze-project . 10)
quality_score=$(/quality-check comprehensive)

if [[ $complexity_score -eq 0 && $quality_score -eq 0 ]]; then
    /error-handler "info" "All quality gates passed including complexity"
else
    /error-handler "error" "Quality gates failed - check complexity and code quality"
fi
```

### With Performance Benchmarks
```bash
# Correlate complexity with performance
/function-complexity-analyzer hotspots . 5
/performance-benchmarks benchmark-all

# High complexity often correlates with poor performance
```

## Common Use Cases

### Code Review Support
**Scenario**: Reviewing pull request for complexity issues
```bash
# Analyze changed files
/function-complexity-analyzer analyze-file modified-file.py 10

# Check project impact
/function-complexity-analyzer analyze-project . 12
```

**Claude guidance**:
1. Focus on functions that exceed team thresholds
2. Explain complexity implications for maintenance
3. Suggest specific refactoring approaches
4. Help balance feature delivery with code quality

### Technical Debt Assessment
**Scenario**: Evaluating project technical debt
```bash
# Identify worst offenders
/function-complexity-analyzer hotspots . 20

# Generate detailed report
/function-complexity-analyzer report . json
```

**Claude guidance**:
1. Help quantify technical debt in terms of complexity
2. Create prioritized refactoring backlog
3. Estimate refactoring effort based on complexity
4. Connect complexity reduction to business value

### Continuous Integration
**Scenario**: Automated complexity checks in CI/CD
```bash
# Fail build if complexity exceeds threshold
/function-complexity-analyzer analyze-project . 15 || exit 1

# Generate complexity report for artifacts
/function-complexity-analyzer report . json > complexity-report.json
```

**Claude guidance**:
1. Help set appropriate thresholds for different projects
2. Explain how to handle legacy code with high complexity
3. Guide gradual complexity reduction strategies
4. Suggest complexity budgets for new code

## Best Practices

### Setting Complexity Thresholds
- **New Code**: Cyclomatic complexity ≤ 10
- **Legacy Code**: Gradual reduction, start with ≤ 20
- **Critical Systems**: Stricter limits, ≤ 7
- **Prototypes**: More lenient, ≤ 15

### Refactoring Workflow
1. **Identify**: Use hotspots to find high-complexity functions
2. **Understand**: Analyze why complexity is high
3. **Test**: Ensure comprehensive tests before refactoring
4. **Refactor**: Apply appropriate patterns incrementally
5. **Verify**: Re-analyze to confirm improvement

### Team Adoption
1. **Education**: Explain complexity metrics to team
2. **Baseline**: Establish current complexity levels
3. **Goals**: Set realistic improvement targets
4. **Monitor**: Track complexity trends over time
5. **Celebrate**: Recognize complexity improvements

## Common Questions and Answers

### "What's the difference between cyclomatic and cognitive complexity?"
**Claude response approach**:
- Cyclomatic counts decision points (testing perspective)
- Cognitive measures understanding difficulty (human perspective)
- Show examples where they differ significantly
- Explain when each metric is most useful

### "How do I refactor a function with complexity 25?"
**Claude response approach**:
- Start by identifying independent code blocks
- Extract each logical section into separate functions
- Simplify control flow with early returns
- Provide step-by-step refactoring plan
- Emphasize maintaining test coverage during refactoring

### "What complexity threshold should we use?"
**Claude response approach**:
- Consider project type and team experience
- Start with industry standards (10 for cyclomatic)
- Adjust based on your specific context
- Focus on trends rather than absolute numbers
- Suggest gradual tightening of thresholds

### "How does complexity relate to bugs?"
**Claude response approach**:
- Studies show correlation between complexity and defect density
- Functions with cyclomatic > 10 have 50% more bugs
- Complex code is harder to test thoroughly
- Complexity increases maintenance errors
- Provide specific risk levels for different complexity ranges

## Advanced Features

### Complexity Trend Analysis
```bash
# Track complexity over time
for commit in $(git rev-list HEAD~10..HEAD); do
    git checkout $commit
    /function-complexity-analyzer report . json > "complexity-$commit.json"
done
```

### Language-Specific Optimizations
- **Python**: Leverage comprehensions and generators
- **JavaScript**: Use functional patterns to reduce complexity
- **Go**: Simplify error handling with helper functions
- **Java**: Apply design patterns for complex logic

### Complexity Budget Management
- Allocate complexity budget per module
- Track complexity debt like technical debt
- Enforce complexity limits in critical paths
- Allow higher complexity in less critical areas

The function complexity analyzer provides comprehensive, multi-dimensional analysis of code complexity with actionable refactoring guidance, helping teams maintain sustainable, understandable codebases that are easier to test, debug, and enhance.