# 0001. Local web server stack and architecture

**Date**: 2026-09-30
**Status**: Proposed

## Summary

This decision defines the foundational technology stack for the Cedolino Statistiche local web application. We are using a Python backend (FastAPI) paired with a React frontend (Vite) and a local SQLite database to provide a fast, self-contained environment. This stack balances rapid development, rich data visualization capabilities, and zero infrastructure overhead for a personal application.

## Context

The product is a personal web application running entirely on a local machine to track, manage, and analyze payslip (cedolino) data over time. It requires data entry, history tracking, and interactive statistical charting. The system will only serve a single user (the owner) locally, so there are no production deployment, scaling, or distributed system requirements. The key constraints are simplicity of setup, rich frontend charting capabilities, and a durable but portable local database.

## Options considered

### Option 1: Python API (FastAPI) + React SPA + SQLite

A decoupled architecture where a lightweight Python API serves data from a local SQLite database, and a Vite-powered React frontend provides the interactive UI and charts.

**Pros**:
- React provides the best ecosystem for interactive charting and dashboards.
- FastAPI allows for rapid API development with automatic OpenAPI documentation.
- SQLite is zero-configuration and stores data in a single, easily backed-up file.

**Cons**:
- Requires running two processes locally (backend server and frontend dev server or built static files).

### Option 2: Full-Stack React (Next.js) + SQLite

A unified full-stack React framework handling both the backend API routes and the frontend UI, backed by SQLite.

**Pros**:
- Single project structure and single process to run.
- Seamless sharing of TypeScript types between frontend and backend.

**Cons**:
- Overkill for a local-only app, adding unnecessary SSR (Server-Side Rendering) complexity.
- Python is generally preferred for data-heavy manipulation and future statistical analysis if the app grows beyond basic charts.

### Option 3: Traditional Server-Rendered App (Flask + Jinja2)

A classic server-side rendered application using Python (Flask) generating HTML with embedded charting libraries.

**Pros**:
- Extremely simple architecture; just one Python process.
- No complex frontend build step.

**Cons**:
- Difficult to build highly interactive, dynamic dashboards without writing complex vanilla JavaScript.
- Less reusable component structure compared to React.

## Decision

**Chosen option**: Option 1: Python API (FastAPI) + React SPA + SQLite
(basis: best ecosystem for interactive charting combined with a simple local API)

We will build a decoupled Single Page Application using React (Vite) for the frontend, FastAPI for the backend, and SQLite for persistence.

## Rationale

For a personal dashboard application focused on data entry and statistics, the frontend requires rich interactive components. React provides the most mature ecosystem for complex data visualization and component-driven UI (Tailwind CSS). FastAPI is chosen for the backend because it is modern, asynchronous, and automatically generates OpenAPI documentation, which can be used to synchronize TypeScript types with the frontend. SQLite is the perfect fit for local data persistence, requiring no server setup and allowing easy backups of the single database file. This decoupled approach also keeps the door open for advanced Python-based data analysis in the future.

## Proposed stack

| Layer | Choice | Reason |
|---|---|---|
| Language | Python (Backend), TypeScript (Frontend) | Balances strong data capabilities on the backend with type-safe UI development. |
| Framework (Backend) | FastAPI | Modern, fast, and provides automatic OpenAPI contract generation. |
| Framework (Frontend) | React (via Vite) | Best-in-class ecosystem for dashboards and interactive data visualization. |
| Primary DB | SQLite | Zero-configuration, single-file relational database ideal for local apps. |
| Auth | None | Local personal application; no authentication required. |
| Styling | Tailwind CSS | Utility-first CSS for rapid UI development without writing custom stylesheets. |
| Charting | Chart.js | Simple, standard, and easy to integrate for standard bar, line, and doughnut charts. |
| Hosting | Local environment | Runs entirely on the user's machine. |

## Consequences

**Positive**:
- Excellent developer experience with fast hot-module reloading on the frontend.
- Strong type safety across the stack if OpenAPI types are generated for the frontend.
- Zero external dependencies for the database; data is safely stored locally.

**Negative / tradeoffs**:
- Slightly more complex local execution (needs both a Python server and a Node.js/Vite server to run).

**Neutral**:
- Must define a clear API contract between the frontend and backend, avoiding the shortcuts possible in a monolithic full-stack framework.

## Follow-up

- [ ] Ensure a simple local startup script (e.g., a batch file or Makefile) is created so the user can easily launch both frontend and backend processes with a single command.

## References

**Practices & standards**:
- Single Page Application (SPA) architecture for interactive dashboards.
- OpenAPI contract-driven development for API synchronization.

**Links**:
- FastAPI: https://fastapi.tiangolo.com/
- React: https://react.dev/
- Vite: https://vite.dev/
- Chart.js: https://www.chartjs.org/
