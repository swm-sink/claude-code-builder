# Developer Certificate of Origin (DCO)

## Overview

The Dev Platform project requires all contributors to sign off on their commits using the Developer Certificate of Origin (DCO). This ensures that contributors have the legal right to submit their contributions and helps protect the project and its users.

## What is the DCO?

The Developer Certificate of Origin (DCO) is a lightweight way for contributors to certify that they wrote or otherwise have the right to submit the code they are contributing to the project.

## DCO Text

By making a contribution to this project, I certify that:

1. The contribution was created in whole or in part by me and I have the right to submit it under the open source license indicated in the file; or

2. The contribution is based upon previous work that, to the best of my knowledge, is covered under an appropriate open source license and I have the right under that license to submit that work with modifications, whether created in whole or in part by me, under the same open source license (unless I am permitted to submit under a different license), as indicated in the file; or

3. The contribution was provided directly to me by some other person who certified (1), (2) or (3) and I have not modified it.

4. I understand and agree that this project and the contribution are public and that a record of the contribution (including all personal information I submit with it, including my sign-off) is maintained indefinitely and may be redistributed consistent with this project or the open source license(s) involved.

## How to Sign Your Commits

### Automatic Signing (Recommended)

Configure git to automatically sign all your commits:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global commit.gpgsign true
```

### Manual Signing

Add the `-s` flag to your git commit command:

```bash
git commit -s -m "Your commit message"
```

This will automatically add a "Signed-off-by" line to your commit message:

```
Your commit message

Signed-off-by: Your Name <your.email@example.com>
```

### Bulk Signing (For Existing Commits)

If you have existing commits that need DCO sign-off:

```bash
# Sign off on the last commit
git commit --amend --signoff

# Sign off on multiple commits (interactive rebase)
git rebase -i HEAD~3 --signoff

# Sign off on all commits in a branch
git filter-branch --msg-filter 'cat && echo && echo "Signed-off-by: Your Name <your.email@example.com>"' HEAD~3..HEAD
```

## DCO Requirements

### For All Contributions

**Every commit** must include a valid DCO sign-off:

- ✅ **Valid:** `Signed-off-by: John Doe <john.doe@example.com>`
- ❌ **Invalid:** Missing sign-off line
- ❌ **Invalid:** `Signed-off-by: John Doe` (missing email)
- ❌ **Invalid:** Different name/email than git author

### Git Configuration Requirements

Your git configuration must match your DCO sign-off:

```bash
# Check your current configuration
git config user.name
git config user.email

# These must match your sign-off line
```

### Email Address Requirements

- **Work Email:** Use your work email if contributing on behalf of your employer
- **Personal Email:** Use your personal email for personal contributions
- **Consistency:** Use the same email across all commits in a PR
- **Verification:** Email should be verified on your GitHub account

## DCO Enforcement

### Automated Checking

We use automated tools to verify DCO compliance:

```yaml
# GitHub Action checks every PR
name: DCO Check
on: [pull_request]
jobs:
  dco_check:
    runs-on: ubuntu-latest
    steps:
      - name: DCO Check
        uses: dcoapp/dco-check-action@v1
```

### Pull Request Requirements

All pull requests must pass DCO verification:

- ✅ **All commits have valid DCO sign-off**
- ✅ **Sign-off matches git author information**
- ✅ **Email address is verified on GitHub**
- ✅ **No commits bypass DCO requirements**

### Failure Resolution

If DCO checks fail:

1. **Add missing sign-offs** to commits
2. **Fix mismatched information** (name/email)
3. **Force push** corrected commits
4. **Verify checks pass** on updated PR

## Why We Require DCO

### Legal Protection

- **Contributor Rights:** Ensures contributors have the right to submit code
- **Project Protection:** Protects the project from legal challenges
- **User Confidence:** Gives users confidence in the code's legal status
- **Enterprise Adoption:** Enables enterprise use with legal clarity

### Industry Standard

- **Linux Kernel:** Used by the Linux kernel project
- **CNCF Projects:** Required by Cloud Native Computing Foundation projects
- **Enterprise Projects:** Standard practice for enterprise open source
- **Legal Precedent:** Well-established legal framework

### Lightweight Process

- **Simple to Use:** Just add `-s` to git commits
- **No CLA Required:** No separate Contributor License Agreement needed
- **Automated Checking:** Tools verify compliance automatically
- **Git Integration:** Built into standard git workflow

## Troubleshooting DCO Issues

### Common Problems and Solutions

#### Missing Sign-off
```bash
# Problem: Commit missing DCO sign-off
# Solution: Amend the commit
git commit --amend --signoff
```

#### Wrong Email
```bash
# Problem: Sign-off email doesn't match git author
# Solution: Update git config and amend
git config user.email "correct.email@example.com"
git commit --amend --signoff
```

#### Multiple Commits Need Sign-off
```bash
# Problem: Several commits missing DCO
# Solution: Interactive rebase with sign-off
git rebase -i HEAD~3 --signoff
```

#### Force Push Required
```bash
# Problem: Need to update commits already pushed
# Solution: Force push corrected commits
git push --force-with-lease origin your-branch
```

### Getting Help

If you're having trouble with DCO requirements:

1. **Read Documentation:** Review this DCO guide thoroughly
2. **Check Examples:** Look at existing commits for proper format
3. **Ask for Help:** Create an issue or discussion for assistance
4. **Automated Tools:** Use git hooks to enforce DCO locally

## DCO Tools and Integrations

### Git Hooks

Set up a pre-commit hook to ensure DCO compliance:

```bash
#!/bin/sh
# .git/hooks/pre-commit
# Check for DCO sign-off

commit_regex='^Signed-off-by: .+ <.+@.+\..+>$'

if ! git log --format=%B -n 1 HEAD | grep -E "$commit_regex"; then
    echo "Commit must be signed off with DCO"
    echo "Use: git commit -s"
    exit 1
fi
```

### Editor Integration

#### VS Code
```json
{
  "git.alwaysSignOff": true
}
```

#### Vim/Neovim
```vim
" Add to .vimrc
autocmd FileType gitcommit setlocal formatoptions+=w
```

#### Emacs
```elisp
;; Add to .emacs
(add-hook 'git-commit-setup-hook 'git-commit-signoff)
```

### IDE Configuration

Most IDEs can be configured to automatically add DCO sign-offs:

- **IntelliJ IDEA:** Git settings → "Add Signed-off-by line"
- **VS Code:** Git extension settings → "Always Sign Off"
- **Atom:** git-plus package configuration
- **Sublime Text:** Git Savvy plugin settings

## Corporate Contributions

### Company Policy

If contributing on behalf of your employer:

1. **Use Work Email:** Use your company email address
2. **Verify Authorization:** Ensure you have authority to contribute
3. **Consistent Identity:** Use the same identity across all contributions
4. **Legal Review:** Have legal team review if required

### Multiple Identities

If you contribute both personally and professionally:

- **Separate Contributions:** Use different identities for different contexts
- **Clear Attribution:** Make it clear when you're representing your employer
- **Consistent Within PR:** Use the same identity within a single pull request

## DCO vs CLA

### Developer Certificate of Origin (DCO)
- ✅ **Lightweight:** Just sign commits
- ✅ **No Registration:** No separate sign-up process
- ✅ **Git Native:** Integrated into git workflow
- ✅ **Per-Commit:** Applied to each contribution

### Contributor License Agreement (CLA)
- ❌ **Heavy Process:** Separate legal document
- ❌ **Registration Required:** Must sign before contributing
- ❌ **Administrative Overhead:** Tracking and management required
- ❌ **One-Time:** Applies to all future contributions

**Dev Platform uses DCO** because it's simpler and more developer-friendly while providing the same legal protections.

## Frequently Asked Questions

### Q: Do I need to sign every commit?
**A:** Yes, every commit must include a DCO sign-off line.

### Q: Can I sign commits after pushing?
**A:** Yes, but you'll need to amend commits and force push the corrected history.

### Q: What if I forget to sign a commit?
**A:** Use `git commit --amend --signoff` to add the sign-off to the last commit.

### Q: Does DCO apply to documentation changes?
**A:** Yes, all contributions including documentation must be signed off.

### Q: Can I contribute if I don't own the copyright?
**A:** Only if you have explicit permission from the copyright holder and the code is under a compatible license.

### Q: What if my employer requires a CLA?
**A:** Contact the project maintainers to discuss your specific situation.

## Resources

### Official DCO Information
- **DCO Website:** https://developercertificate.org/
- **Linux Foundation Guide:** https://docs.linuxfoundation.org/lfx/easycla/v2-current/contributors
- **Git Documentation:** https://git-scm.com/docs/git-commit#Documentation/git-commit.txt--s

### DCO Tools
- **DCO GitHub App:** https://github.com/apps/dco
- **DCO Action:** https://github.com/dcoapp/dco-check-action
- **Git Hooks:** Various implementations available

### Legal Resources
- **Open Source Initiative:** https://opensource.org/
- **Software Freedom Law Center:** https://softwarefreedom.org/
- **GitHub Legal Resources:** https://github.com/github/choosealicense.com

---

**DCO Policy Version:** 1.0  
**Effective Date:** 2025-08-16  
**Last Updated:** 2025-08-16  
**Questions:** Create an issue or discussion for DCO-related questions