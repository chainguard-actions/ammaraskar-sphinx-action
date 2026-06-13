<!-- markdownlint-disable -->

# Hardening Report: ammaraskar--sphinx-action/0.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **ammaraskar--sphinx-action/0.2** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The Dockerfile uses a mutable base image tag `FROM python:3-slim` without a SHA digest. This means the base image can change at any time, creating a supply-chain risk. It should be pinned to a specific SHA digest, e.g. `FROM python:3-slim@sha256:<64-hex-char-digest>`.

Locations:

- `Dockerfile:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Dockerfile base image from `python:3-slim` to `python:3-slim@sha256:d7a925f9eb9639a93e455b9f12c167569358818c0f62b51b88edbc8fcf34c421 # 3-slim`. This prevents the mutable tag from being silently updated and eliminates the supply-chain risk.

