# Scope: Cedolino Statistiche

Local web application to manually insert payslip (cedolino) data, keep an accurate history, and analyze changes over time via statistics and graphs.

**Build approach:** Tracer Bullet (prove the whole pipe works before building any part of it fully).
**Workflow:** Prototype (Just /develop. Rely on self-checks. Best for fast iteration on a personal app). `/architect` is the recommended first stop for a feature with a real decision, but skippable when you already know the build. Any feature can carry its own tag (e.g. `· GA`) to do more or less.

_These are recommendations to keep your build orderly, not requirements. Skip anything that does not fit: if you already know how to build a feature, use `/develop` and skip `/architect`. You decide when a feature is `done`._

## At a glance

| # | Feature | Phase | Status |
|---|---------|-------|--------|
| 1 | Stack & architecture | Foundation | in-progress |
| 2 | Coding standards & tooling | Foundation | planned |
| 3 | Data model | Foundation | planned |
| 4 | Design system & UI foundation | Foundation | planned |
| 5 | Basic payslip entry and listing | Slice 1 | planned |
| 6 | Intelligent line items & history | Slice 2 | planned |
| 7 | Dashboard & summary charts | Slice 3 | planned |
| 8 | Detailed trends & yearly aggregations | Slice 4 | planned |
| 9 | CSV/Excel Export & Import | Slice 5 | planned |

## Foundations

### 1. Stack & architecture · in-progress
Decide the local web server stack and scaffold a runnable project so every later slice builds on real structure.
**Done when:** the stack is recorded in a spec and the empty scaffold boots locally and passes build.
- [x] Decide the stack (spec): `/architect stack & architecture`
- [x] Scaffold from the decision: `/develop stack & architecture`
- [x] Smoke-check it runs: `/test`
spec [0001](../specs/0001-stack-and-architecture.md)

### 2. Coding standards & tooling
Capture conventions, then install lint, format, and pre-commit enforcement from the real scaffolded project.
**Done when:** root `AGENTS.md` reflects the real stack, and lint/format/pre-commit run clean.
- [x] Capture conventions + tooling choices: `/audit`
- [ ] Install the tooling: `/develop tooling`
- [ ] Check it runs clean: `/test`

### 3. Data model · needs a decision
Core entities every feature builds on: payslips (cedolini), line items (simple vs detailed, deduction vs earning).
**Done when:** entities and relationships support later slices without a breaking migration.
- [ ] Design it (spec): `/architect data model`

### 4. Design system & UI foundation · needs a decision
Visual language, layout primitives, and base components so the flows feel cohesive and accessible.
**Done when:** `design.md` covers type/color/spacing/components, and base components handle focus and keyboard.
- [ ] Design it (spec): `/architect design system & UI foundation`

## Slice 1: Basic payslip entry and listing

### 5. Basic payslip entry and listing · needs a decision
Manual data entry of a basic payslip and viewing the list of saved payslips. This slice is the walking skeleton.
**Done when:** user can insert a basic payslip with line items, save it to the local DB, and view it in a simple list.
- [ ] Design it (spec): `/architect basic payslip entry and listing`

## Slice 2: Intelligent line items & history

### 6. Intelligent line items & history · needs a decision
Auto-completion of line items based on previous months, supporting both simple numeric items and detailed (unit/price) items.
**Done when:** entering line items suggests names from history, handles both simple and detailed data structures, and correctly categorizes as deductions or earnings.
- [ ] Design it (spec): `/architect intelligent line items & history`

## Slice 3: Dashboard & summary charts

### 7. Dashboard & summary charts · needs a decision
Basic visualizations of net pay over time and earnings vs deductions breakdown.
**Done when:** the dashboard renders basic graphs from real local DB data showing summary metrics.
- [ ] Design it (spec): `/architect dashboard & summary charts`

## Slice 4: Detailed trends & yearly aggregations

### 8. Detailed trends & yearly aggregations · needs a decision
Drill-down views to track specific line items over time (e.g. tracking a specific tax) and yearly rollups.
**Done when:** user can filter by a specific line item name to see its trend graph, and view yearly totals per category.
- [ ] Design it (spec): `/architect detailed trends & yearly aggregations`

## Slice 5: Export & Import

### 9. CSV/Excel Export & Import · needs a decision
Backup functionality and bulk population from existing records.
**Done when:** the user can export their entire history to CSV/Excel and import from a similarly structured file.
- [ ] Design it (spec): `/architect csv excel export import`
