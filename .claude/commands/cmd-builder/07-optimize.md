---
allowed-tools: Read, Write, Task(subagent_type:optimizer)
argument-hint: [validation-results-json] or [command-name]
description: Optimize command for simplicity, performance, and user experience
category: cmd-builder
---

# Command Optimization Phase

Optimize command for simplicity, performance, and user experience: **$ARGUMENTS**

## Optimization Philosophy: Elegant Simplicity

Focus on **minimum viable complexity** while maximizing effectiveness:

### Core Principles
- **Less is More**: Remove unnecessary complexity
- **Clear Over Clever**: Prioritize readability and understanding
- **Fast and Light**: Optimize for speed and efficiency
- **User-Friendly**: Make it intuitive and helpful

### 1. Parse Validation Results
Identify optimization opportunities from validation assessment:
- Performance bottlenecks to address
- Complexity areas to simplify
- User experience pain points
- Code quality improvements needed

### 2. Simplicity Optimization

#### Code Simplification
```
Optimization: Remove unnecessary complexity
Target: Cleaner, more readable code
Method: Eliminate redundant logic, combine similar operations
Risk: Low - maintain all functionality
```

#### Interface Simplification
```
Optimization: Streamline user interface
Target: Easier command usage
Method: Simplify parameters, improve defaults
Risk: Low - enhance user experience
```

#### Logic Streamlining
```
Optimization: Optimize execution flow
Target: Faster, clearer processing
Method: Reduce steps, eliminate branches
Risk: Medium - ensure functionality preserved
```

### 3. Performance Optimization

#### Token Efficiency
```
Optimization: Reduce token usage
Target: 20-30% reduction in tokens
Method: Concise language, eliminate redundancy
Impact: Faster initialization, lower cost
```

#### Response Speed
```
Optimization: Improve response time
Target: <1 second for typical operations
Method: Optimize algorithms, reduce overhead
Impact: Better user experience
```

#### Resource Efficiency
```
Optimization: Minimize resource usage
Target: Lean memory and CPU usage
Method: Efficient data structures, lazy loading
Impact: Better scalability
```

### 4. User Experience Optimization

#### Error Message Clarity
```
Optimization: Improve error messages
Target: Clear, actionable guidance
Method: Specific messages, helpful suggestions
Impact: Reduced user frustration
```

#### Help System Enhancement
```
Optimization: Streamline help system
Target: Quick, relevant assistance
Method: Contextual help, clear examples
Impact: Faster user success
```

#### Output Formatting
```
Optimization: Clean, readable output
Target: Scannable, useful results
Method: Consistent formatting, clear structure
Impact: Better information consumption
```

## Optimization Implementation

I'll use the optimizer subagent to systematically improve the command:

**Activating optimization specialist for elegant simplification...**

Focus areas:
- **Simplicity**: Remove complexity without losing functionality
- **Performance**: Optimize for speed and efficiency
- **Clarity**: Improve readability and understanding
- **Usability**: Enhance user experience

## Optimization Results Format

```json
{
  "optimization_phase": "elegant_simplification",
  "command_optimized": "[command-name]",
  "optimization_timestamp": "2025-01-XX",
  "baseline_metrics": {
    "validation_score": "X/100",
    "complexity_level": "simple/moderate/complex",
    "performance_rating": "fast/adequate/slow",
    "user_experience": "excellent/good/poor"
  },
  "optimizations_applied": [
    {
      "type": "simplification",
      "change": "Removed redundant validation steps",
      "impact": "30% fewer lines, clearer logic",
      "risk": "low"
    },
    {
      "type": "performance",
      "change": "Optimized parameter parsing",
      "impact": "50% faster initialization",
      "risk": "low"
    },
    {
      "type": "user_experience",
      "change": "Improved error messages",
      "impact": "Clearer guidance for users",
      "risk": "low"
    }
  ],
  "improvement_metrics": {
    "code_reduction": "X% fewer lines",
    "performance_gain": "X% faster response",
    "clarity_improvement": "significantly clearer",
    "user_experience_boost": "more intuitive"
  },
  "optimization_summary": {
    "complexity_reduced": "high/medium/low",
    "performance_improved": "significant/moderate/minimal", 
    "usability_enhanced": "significantly/moderately/minimally",
    "maintainability": "improved/maintained/reduced"
  },
  "quality_preserved": {
    "functionality": "100% maintained",
    "security": "maintained/improved",
    "reliability": "maintained/improved",
    "compatibility": "maintained"
  }
}
```

## Optimization Categories

### High-Impact, Low-Risk (Priority 1)
- Remove redundant code and logic
- Simplify parameter handling
- Improve error message clarity
- Streamline output formatting

### Medium-Impact, Low-Risk (Priority 2)
- Optimize performance bottlenecks
- Enhance help system
- Improve code organization
- Standardize naming conventions

### High-Impact, Medium-Risk (Priority 3)
- Restructure complex logic flows
- Optimize algorithm efficiency
- Enhance user interface design
- Improve integration patterns

## Success Criteria

### Simplicity Goals
- **Code Clarity**: Easy to read and understand
- **Interface Simplicity**: Intuitive to use
- **Logic Streamlining**: Efficient execution flow
- **Minimal Complexity**: No unnecessary complications

### Performance Goals
- **Response Time**: <1 second typical operations
- **Token Efficiency**: 20-30% reduction
- **Resource Usage**: Minimal memory/CPU
- **Scalability**: Handles increased load well

### User Experience Goals
- **Ease of Use**: Intuitive interface
- **Clear Feedback**: Helpful messages
- **Quick Success**: Fast time-to-value
- **Error Recovery**: Easy to fix mistakes

## Usage

### Standalone Optimization
```
/cmd-builder:07-optimize [validation-results-json]
```

### As Part of Chain
Receives validation results from step 06, outputs optimization results for step 08.

## Elegant Simplicity Achieved

The optimization phase transforms the command into its most elegant, simple, and effective form while maintaining all essential functionality and improving performance and user experience.