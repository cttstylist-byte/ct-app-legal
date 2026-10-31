#!/usr/bin/env bash
# SessionStart hook: install the Hostinger plugin from the official marketplace
# in Claude Code cloud sessions. Never blocks the session on failure.
set -u

# Only run in cloud (remote) sessions; leave local setups untouched.
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0

if ! claude plugin list 2>/dev/null | grep -q 'hostinger@claude-plugins-official'; then
  claude plugin marketplace add anthropics/claude-plugins-official >/dev/null 2>&1 || true
  claude plugin install hostinger@claude-plugins-official >/dev/null 2>&1 || true
fi

exit 0
