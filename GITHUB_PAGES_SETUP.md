# GitHub Pages Documentation Site Setup

## Overview

This document provides comprehensive instructions for setting up GitHub Pages to serve the dev-platform documentation site with automated deployment, structured navigation, and SEO optimization.

**Technical:** Automated static site generation using GitHub Pages with Jekyll, custom themes, structured content organization, and CI/CD integration for seamless documentation deployment.

**Simple:** Like creating a professional website that automatically updates itself whenever we improve our documentation or add new patterns.

**Connection:** This teaches you how to build documentation sites that scale with your project and provide excellent user experience for both human readers and AI assistants.

## 🎯 Documentation Site Objectives

### Primary Goals
- **Three-Tier Documentation**: Quick Start, Claude Guide, Deep Dive
- **Pattern Discovery**: Easy browsing and search of available patterns  
- **Educational Focus**: Learning-oriented content with dual explanations
- **Claude Code Integration**: AI-optimized documentation structure
- **SEO Optimization**: Discoverable via search engines
- **Mobile Responsive**: Accessible on all devices

### Site Architecture
```
dev-platform.github.io
├── / (Landing Page)
├── /quick-start/ (Getting Started)
├── /claude-guide/ (AI Integration)
├── /patterns/ (Pattern Library)
├── /examples/ (Real-world Examples)
├── /api/ (API Reference)
├── /community/ (Community Resources)
└── /security/ (Security Documentation)
```

## 🚀 GitHub Pages Setup Instructions

### 1. Enable GitHub Pages

**Repository Settings Path:** Settings → Pages

**Configuration:**
```yaml
Source: GitHub Actions
Build and deployment: GitHub Actions
Custom domain: dev-platform.org (optional)
Enforce HTTPS: Enabled
```

### 2. Create Site Configuration

Create `_config.yml` in repository root:

```yaml
# Site Configuration
title: "Dev Platform"
description: "Claude Code native development patterns for project automation and quality gates"
baseurl: ""
url: "https://swm-sink.github.io/dev-platform"
repository: "swm-sink/dev-platform"

# Build Settings
markdown: kramdown
highlighter: rouge
theme: minima
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag
  - jekyll-redirect-from

# Collections
collections:
  patterns:
    output: true
    permalink: /:collection/:name/
  examples:
    output: true
    permalink: /:collection/:name/
  guides:
    output: true
    permalink: /:collection/:name/

# Navigation
navigation:
  - title: "Quick Start"
    url: /quick-start/
  - title: "Claude Guide"  
    url: /claude-guide/
  - title: "Patterns"
    url: /patterns/
  - title: "Examples"
    url: /examples/
  - title: "API Reference"
    url: /api/
  - title: "Community"
    url: /community/
  - title: "Security"
    url: /security/

# Pattern Categories
pattern_categories:
  - name: "Error Handling"
    description: "Structured logging and error management patterns"
    icon: "🚨"
  - name: "Testing"
    description: "Automated test detection and execution patterns"
    icon: "🧪"
  - name: "Quality Gates"
    description: "Code quality and standards enforcement patterns"
    icon: "✅"
  - name: "Security"
    description: "Security scanning and best practices patterns"
    icon: "🔒"
  - name: "Git Hooks"
    description: "Automated git workflow management patterns"
    icon: "🪝"

# SEO Configuration
google_analytics: "G-XXXXXXXXXX" # Add when ready
social:
  name: "Dev Platform"
  links:
    - https://github.com/swm-sink/dev-platform
    - https://github.com/swm-sink/dev-platform/discussions

# Build Optimization
sass:
  style: compressed
```

### 3. Create Custom Theme

Create `_layouts/default.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% if page.title %}{{ page.title }} - {% endif %}{{ site.title }}</title>
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="{% if page.excerpt %}{{ page.excerpt | strip_html | strip_newlines | truncate: 160 }}{% else %}{{ site.description }}{% endif %}">
    <meta name="keywords" content="claude-code, development-patterns, automation, bash, devops, ai-native">
    <meta name="author" content="SWM Development">
    
    <!-- Open Graph Meta Tags -->
    <meta property="og:title" content="{% if page.title %}{{ page.title }}{% else %}{{ site.title }}{% endif %}">
    <meta property="og:description" content="{% if page.excerpt %}{{ page.excerpt | strip_html | strip_newlines | truncate: 160 }}{% else %}{{ site.description }}{% endif %}">
    <meta property="og:image" content="{{ '/assets/images/dev-platform-og.png' | relative_url }}">
    <meta property="og:url" content="{{ page.url | absolute_url }}">
    <meta property="og:type" content="website">
    
    <!-- Twitter Meta Tags -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="{% if page.title %}{{ page.title }}{% else %}{{ site.title }}{% endif %}">
    <meta name="twitter:description" content="{% if page.excerpt %}{{ page.excerpt | strip_html | strip_newlines | truncate: 160 }}{% else %}{{ site.description }}{% endif %}">
    <meta name="twitter:image" content="{{ '/assets/images/dev-platform-og.png' | relative_url }}">
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{ '/assets/favicon.ico' | relative_url }}">
    
    <!-- Stylesheets -->
    <link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/themes/prism.min.css">
    
    <!-- JSON-LD Schema -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "SoftwareSourceCode",
        "name": "Dev Platform",
        "description": "{{ site.description }}",
        "url": "{{ site.url }}",
        "codeRepository": "https://github.com/swm-sink/dev-platform",
        "programmingLanguage": "Shell",
        "operatingSystem": ["macOS", "Linux"],
        "applicationCategory": "DeveloperApplication"
    }
    </script>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="{{ '/' | relative_url }}" class="nav-brand">
                🚀 Dev Platform
            </a>
            <div class="nav-menu">
                {% for item in site.navigation %}
                <a href="{{ item.url | relative_url }}" class="nav-link">{{ item.title }}</a>
                {% endfor %}
                <a href="https://github.com/swm-sink/dev-platform" class="nav-link github-link">GitHub</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        {{ content }}
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-section">
                <h3>🚀 Dev Platform</h3>
                <p>Claude Code native development patterns</p>
            </div>
            <div class="footer-section">
                <h4>Resources</h4>
                <ul>
                    <li><a href="{{ '/quick-start/' | relative_url }}">Quick Start</a></li>
                    <li><a href="{{ '/claude-guide/' | relative_url }}">Claude Guide</a></li>
                    <li><a href="{{ '/patterns/' | relative_url }}">Pattern Library</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Community</h4>
                <ul>
                    <li><a href="https://github.com/swm-sink/dev-platform">GitHub</a></li>
                    <li><a href="https://github.com/swm-sink/dev-platform/discussions">Discussions</a></li>
                    <li><a href="https://github.com/swm-sink/dev-platform/issues">Issues</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Legal</h4>
                <ul>
                    <li><a href="{{ '/security/' | relative_url }}">Security Policy</a></li>
                    <li><a href="https://github.com/swm-sink/dev-platform/blob/main/LICENSE">MIT License</a></li>
                    <li><a href="https://github.com/swm-sink/dev-platform/blob/main/DCO.md">DCO</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 SWM Development. Open source under MIT License.</p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/components/prism-core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/plugins/autoloader/prism-autoloader.min.js"></script>
    <script src="{{ '/assets/js/main.js' | relative_url }}"></script>
</body>
</html>
```

### 4. Create Landing Page

Create `index.md`:

```markdown
---
layout: default
title: "Home"
description: "Claude Code native development patterns for project automation and quality gates"
---

# 🚀 Dev Platform

**Claude Code native development patterns for project automation and quality gates**

<div class="hero-section">
    <div class="hero-content">
        <h2>⚡ Patterns designed for AI comprehension</h2>
        <p class="hero-description">
            50-line patterns optimized for Claude Code with dual explanations, 
            security-first design, and educational focus.
        </p>
        <div class="hero-actions">
            <a href="{{ '/quick-start/' | relative_url }}" class="btn btn-primary">Get Started</a>
            <a href="{{ '/patterns/' | relative_url }}" class="btn btn-secondary">Browse Patterns</a>
        </div>
    </div>
</div>

## 🎯 Key Features

<div class="features-grid">
    <div class="feature-card">
        <div class="feature-icon">🤖</div>
        <h3>Claude Code Optimized</h3>
        <p>Every pattern under 50 lines for instant AI comprehension</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">🎓</div>
        <h3>Educational Focus</h3>
        <p>Dual explanations teach transferable development skills</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">🔒</div>
        <h3>Security First</h3>
        <p>Zero-tolerance security policy with comprehensive scanning</p>
    </div>
    
    <div class="feature-card">
        <div class="feature-icon">⚡</div>
        <h3>Developer Experience</h3>
        <p>Simple, composable patterns that just work</p>
    </div>
</div>

## 🏗️ Pattern Categories

{% for category in site.pattern_categories %}
<div class="pattern-category">
    <h3>{{ category.icon }} {{ category.name }}</h3>
    <p>{{ category.description }}</p>
    <a href="{{ '/patterns/' | append: category.name | downcase | replace: ' ', '-' | relative_url }}">
        Explore {{ category.name }} Patterns →
    </a>
</div>
{% endfor %}

## 🚀 Quick Start

```bash
# Install dev-platform patterns
curl -sSL https://raw.githubusercontent.com/swm-sink/dev-platform/main/scripts/install.sh | bash

# Source your first pattern
source ~/.dev-platform/patterns/error-handling/simple-error-handling.sh

# Start using Claude-optimized development patterns
log_info "Ready to build better software! 🎉"
```

## 📚 Three-Tier Documentation

<div class="docs-tiers">
    <div class="docs-tier">
        <h3>🚀 Quick Start</h3>
        <p>Get up and running in minutes</p>
        <a href="{{ '/quick-start/' | relative_url }}">Start Here →</a>
    </div>
    
    <div class="docs-tier">
        <h3>🤖 Claude Guide</h3>
        <p>AI-assisted development workflows</p>
        <a href="{{ '/claude-guide/' | relative_url }}">AI Integration →</a>
    </div>
    
    <div class="docs-tier">
        <h3>🔬 Deep Dive</h3>
        <p>Comprehensive technical documentation</p>
        <a href="{{ '/api/' | relative_url }}">Technical Docs →</a>
    </div>
</div>

## 🌟 Community

Join our growing community of developers building better software with AI-native patterns:

- **[GitHub Discussions](https://github.com/swm-sink/dev-platform/discussions)** - Ask questions, share ideas
- **[Issues](https://github.com/swm-sink/dev-platform/issues)** - Report bugs, request features
- **[Contributors]({{ '/community/contributors/' | relative_url }})** - Join our contributor community

---

**Ready to transform your development workflow?** [Get started now]({{ '/quick-start/' | relative_url }}) or explore our [pattern library]({{ '/patterns/' | relative_url }}).
```

### 5. Create Site Stylesheet

Create `assets/css/main.scss`:

```scss
---
---

// Variables
:root {
    --primary-color: #0066cc;
    --secondary-color: #00aa44;
    --accent-color: #ff6600;
    --text-color: #333;
    --bg-color: #fff;
    --border-color: #ddd;
    --code-bg: #f5f5f5;
    --shadow: 0 2px 4px rgba(0,0,0,0.1);
}

// Base Styles
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    line-height: 1.6;
    color: var(--text-color);
    background-color: var(--bg-color);
}

// Navigation
.navbar {
    background: var(--bg-color);
    border-bottom: 1px solid var(--border-color);
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: var(--shadow);
}

.nav-container {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
}

.nav-brand {
    font-size: 1.5rem;
    font-weight: bold;
    text-decoration: none;
    color: var(--primary-color);
}

.nav-menu {
    display: flex;
    gap: 2rem;
}

.nav-link {
    text-decoration: none;
    color: var(--text-color);
    font-weight: 500;
    transition: color 0.3s;
    
    &:hover {
        color: var(--primary-color);
    }
}

.github-link {
    background: var(--primary-color);
    color: white !important;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    
    &:hover {
        background: darken(var(--primary-color), 10%);
    }
}

// Main Content
.main-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem;
    min-height: calc(100vh - 200px);
}

// Hero Section
.hero-section {
    text-align: center;
    padding: 4rem 0;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    border-radius: 8px;
    margin-bottom: 3rem;
}

.hero-description {
    font-size: 1.2rem;
    color: #666;
    margin: 1rem 0 2rem;
}

.hero-actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
}

// Buttons
.btn {
    display: inline-block;
    padding: 0.75rem 1.5rem;
    text-decoration: none;
    border-radius: 4px;
    font-weight: 500;
    transition: all 0.3s;
    
    &.btn-primary {
        background: var(--primary-color);
        color: white;
        
        &:hover {
            background: darken(var(--primary-color), 10%);
        }
    }
    
    &.btn-secondary {
        background: transparent;
        color: var(--primary-color);
        border: 2px solid var(--primary-color);
        
        &:hover {
            background: var(--primary-color);
            color: white;
        }
    }
}

// Feature Grid
.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin: 3rem 0;
}

.feature-card {
    text-align: center;
    padding: 2rem;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    transition: transform 0.3s, box-shadow 0.3s;
    
    &:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow);
    }
}

.feature-icon {
    font-size: 3rem;
    margin-bottom: 1rem;
}

// Pattern Categories
.pattern-category {
    border: 1px solid var(--border-color);
    border-radius: 8px;
    padding: 1.5rem;
    margin-bottom: 1rem;
    
    h3 {
        color: var(--primary-color);
        margin-bottom: 0.5rem;
    }
    
    a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 500;
        
        &:hover {
            text-decoration: underline;
        }
    }
}

// Documentation Tiers
.docs-tiers {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 2rem;
    margin: 2rem 0;
}

.docs-tier {
    text-align: center;
    padding: 2rem;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    
    h3 {
        color: var(--primary-color);
        margin-bottom: 1rem;
    }
    
    a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 500;
        
        &:hover {
            text-decoration: underline;
        }
    }
}

// Code Blocks
pre, code {
    font-family: 'Monaco', 'Consolas', monospace;
    background: var(--code-bg);
}

pre {
    padding: 1rem;
    border-radius: 4px;
    overflow-x: auto;
    border: 1px solid var(--border-color);
}

code {
    padding: 0.2rem 0.4rem;
    border-radius: 3px;
    font-size: 0.9em;
}

// Footer
.footer {
    background: #f8f9fa;
    border-top: 1px solid var(--border-color);
    margin-top: 4rem;
}

.footer-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 3rem 2rem 1rem;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 2rem;
}

.footer-section {
    h3, h4 {
        margin-bottom: 1rem;
        color: var(--primary-color);
    }
    
    ul {
        list-style: none;
        
        li {
            margin-bottom: 0.5rem;
        }
        
        a {
            color: var(--text-color);
            text-decoration: none;
            
            &:hover {
                color: var(--primary-color);
            }
        }
    }
}

.footer-bottom {
    text-align: center;
    padding: 1rem;
    border-top: 1px solid var(--border-color);
    color: #666;
}

// Responsive Design
@media (max-width: 768px) {
    .nav-container {
        flex-direction: column;
        gap: 1rem;
    }
    
    .nav-menu {
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .main-content {
        padding: 1rem;
    }
    
    .hero-actions {
        flex-direction: column;
        align-items: center;
    }
}
```

### 6. Create Search Functionality

Create `assets/js/main.js`:

```javascript
// Pattern Search Functionality
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('pattern-search');
    const patternCards = document.querySelectorAll('.pattern-card');
    
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            
            patternCards.forEach(card => {
                const title = card.querySelector('h3').textContent.toLowerCase();
                const description = card.querySelector('p').textContent.toLowerCase();
                const category = card.dataset.category ? card.dataset.category.toLowerCase() : '';
                
                if (title.includes(searchTerm) || description.includes(searchTerm) || category.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    }
    
    // Copy code button functionality
    const codeBlocks = document.querySelectorAll('pre code');
    codeBlocks.forEach(block => {
        const button = document.createElement('button');
        button.className = 'copy-button';
        button.textContent = 'Copy';
        button.onclick = () => {
            navigator.clipboard.writeText(block.textContent);
            button.textContent = 'Copied!';
            setTimeout(() => button.textContent = 'Copy', 2000);
        };
        
        block.parentElement.style.position = 'relative';
        block.parentElement.appendChild(button);
    });
    
    // Mobile menu toggle
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const navMenu = document.querySelector('.nav-menu');
    
    if (mobileMenuButton) {
        mobileMenuButton.addEventListener('click', function() {
            navMenu.classList.toggle('active');
        });
    }
});
```

### 7. Create Automated Deployment

GitHub Pages workflow is already created in the documentation workflow. Ensure it includes:

```yaml
# In .github/workflows/documentation.yml
deploy-docs:
  name: Deploy Documentation
  runs-on: ubuntu-latest
  needs: build-docs
  if: github.ref == 'refs/heads/main'
  
  environment:
    name: github-pages
    url: ${{ steps.deployment.outputs.page_url }}

  steps:
  - name: Deploy to GitHub Pages
    id: deployment
    uses: actions/deploy-pages@v4
```

## 📊 SEO and Analytics Configuration

### 1. SEO Optimization

Create `_includes/seo.html`:

```html
<!-- Meta Tags -->
<meta name="description" content="{% if page.excerpt %}{{ page.excerpt | strip_html | strip_newlines | truncate: 160 }}{% else %}{{ site.description }}{% endif %}">
<meta name="keywords" content="claude-code, development-patterns, automation, bash, devops, ai-native, {{ page.tags | join: ', ' }}">

<!-- Canonical URL -->
<link rel="canonical" href="{{ page.url | absolute_url }}">

<!-- Structured Data -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "{% if page.layout == 'pattern' %}SoftwareSourceCode{% else %}WebPage{% endif %}",
  "name": "{{ page.title | default: site.title }}",
  "description": "{{ page.excerpt | default: site.description | strip_html | strip_newlines | truncate: 160 }}",
  "url": "{{ page.url | absolute_url }}",
  {% if page.layout == 'pattern' %}
  "programmingLanguage": "Shell",
  "codeRepository": "{{ site.repository | prepend: 'https://github.com/' }}",
  {% endif %}
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "{{ page.url | absolute_url }}"
  }
}
</script>
```

### 2. Analytics Setup

Add to `_config.yml`:

```yaml
# Analytics
google_analytics: "G-XXXXXXXXXX"
google_site_verification: "xxxxxxxxxx"

# Performance
plugins:
  - jekyll-sitemap
  - jekyll-seo-tag
  - jekyll-feed
  - jekyll-compress-images
```

## 🔧 Maintenance and Updates

### Automated Updates
- **Content Sync**: Documentation automatically updates from repository
- **Link Checking**: Monthly automated link validation
- **Performance Monitoring**: Core Web Vitals tracking
- **Security Scanning**: Regular security audits

### Manual Maintenance
- **Quarterly Review**: Content freshness and accuracy
- **Annual Design Review**: User experience improvements
- **SEO Optimization**: Search ranking improvements
- **Analytics Review**: User behavior analysis

## 📱 Mobile and Accessibility

### Mobile Optimization
- Responsive design for all screen sizes
- Touch-friendly navigation
- Fast loading on mobile networks
- Progressive Web App features

### Accessibility Features
- WCAG 2.1 AA compliance
- Screen reader compatibility
- Keyboard navigation support
- High contrast mode support

---

**GitHub Pages Setup Version:** 1.0  
**Last Updated:** 2025-08-16  
**Site URL:** https://swm-sink.github.io/dev-platform  
**Maintenance Schedule:** Monthly updates, quarterly reviews