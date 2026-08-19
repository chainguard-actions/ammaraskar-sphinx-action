<!-- markdownlint-disable -->

# Hardening Report: ammaraskar--sphinx-action/8.2.3

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **ammaraskar--sphinx-action/8.2.3** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The workflow uses `actions/checkout@v4`, which is a mutable tag reference rather than a pinned 40-character SHA commit hash. This means the action could be silently updated to a different (potentially malicious) version without any change to the workflow file, creating a supply-chain risk.

Locations:

- `.github/workflows/synchronize.yaml:13`

### missing-permissions (severity: medium)

The workflow file has no top-level `permissions:` key, and the single job `run-shell-script` also has no job-level `permissions:` key. Without explicit permissions, the job runs with the default (potentially broad) GITHUB_TOKEN permissions for the repository. Minimal permissions (e.g., `contents: write` for the git push, `packages: none`) should be declared explicitly.

Locations:

- `.github/workflows/synchronize.yaml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

1) Pinned `actions/checkout@v4` to its full commit SHA `11d5960a326750d5838078e36cf38b85af677262` with a `# v4` comment for readability. 2) Added a top-level `permissions:` block with `contents: write` — the minimum required for the workflow's git push operation performed by `./bin/tryrelease`.

