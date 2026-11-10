# Cedolino Statistiche

## Stack

- **Language / Runtime**: Python (Backend), TypeScript (Frontend)
- **Framework**: FastAPI (Backend), React via Vite (Frontend)
- **Key dependencies**: SQLite, Tailwind CSS, Chart.js
- **Package manager**: npm (Frontend), pip (Backend)

## Build approach

**Tracer Bullet**, vertical end to end slices, thin but complete through every layer

## Commands

```bash
# Install
cd frontend && npm install
cd backend && python -m venv .venv && .\.venv\Scripts\Activate.ps1 && pip install -r requirements.txt

# Dev server
.\start.bat

# Build
cd frontend && npm run build

# Test
# No test runner configured yet. Rely on typecheck + /check verify.
```

## Specs

Stored in `docs/specs/`. Format: `docs/specs/NNNN-title.md`.

## Rules

- **Architecture Style: Clean Architecture**
  - Strict layer separation, domain logic never touches frameworks or I/O.
  - Code is organized in four layers: `domain`, `application`, `infrastructure`, `presentation`.
  - Use cases are thin orchestrators. They call domain logic and infrastructure interfaces.
  - Infrastructure implements interfaces defined in the domain or application layer (dependency inversion).
  - No framework or ORM code appears inside `domain/` or `application/`.
  - Entities contain business rules and enforce their own invariants.
  - All cross boundary communication uses DTOs or plain objects.
  - Tests: domain and application layers are unit tested with no mocks of infrastructure.
- **Type strictness**: Strict (no any, exhaustive types).
- **Module & folder structure**: Folder-by-feature (colocate by feature).
- **Code standards**: Documented public APIs, a consistent error handling pattern, consistent naming conventions, conventional commit messages.

## Tooling

- **Linting & formatting**: ESLint + Prettier (Frontend) & Ruff (Backend)
- **Checks before commit**: Lint + format + typecheck on every commit
- **Testing gate**: typecheck+verify (no test runner yet)
- **Continuous Integration**: A basic CI check on push (lint, typecheck)

## Git

- integration: on
- branch prefix: feat/
- commit: per-milestone

## Context files

<!-- Nested AGENTS.md files are listed here as they are created -->

_Drafted by /audit from the repo, worth a quick human pass. Edit freely: once a line stops matching this draft, later runs treat it as curated and will flag rather than overwrite it._
