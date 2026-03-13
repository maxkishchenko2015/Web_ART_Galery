# Architecture Layers (Bloc/Cubit)

Detailed guide to layer responsibilities and interactions in Flutter apps using `flutter_bloc`.

## Layer Overview

```
UI (Widgets, Pages, Bloc/Cubit)
        ↓
Domain (Use-cases, Policies) [optional]
        ↓
Data (Repositories, Services)
```

## UI Layer

Responsibility: Render UI and translate user intents into Bloc/Cubit calls.

### Pages and Widgets

What they do:
- Render state from Bloc/Cubit.
- Send user intents via `add(event)` (Bloc) or method calls (Cubit).
- Handle visual concerns (layout, animations, navigation).

What they do not do:
- Business rules.
- Data source orchestration.
- Mapping API responses.

### Bloc and Cubit

What they do:
- Manage immutable UI state.
- Orchestrate use-cases/repositories.
- Emit loading/success/error states.

Use Bloc when:
- Flow is event-heavy and branch-heavy.
- You need precise event-to-state transitions.
- Side-effects require strict sequencing.

Use Cubit when:
- State transitions are straightforward.
- There are few actions and fewer branches.

## Domain Layer (Optional)

Add domain use-cases when business logic is complex or reused.

Examples:
- Composite validation across multiple repositories.
- Multi-step operations (pre-checks, submission, rollback).
- Policy decisions shared by multiple features.

## Data Layer

### Repositories

Single source of truth for each data type.

Responsibilities:
- Aggregate service calls.
- Normalize/mapping data.
- Handle caching and retries.
- Return domain-oriented results.

### Services

Responsibilities:
- Raw API/database/platform access.
- Stateless I/O wrappers.
- No business logic.

## Communication Rules

- UI only talks to Bloc/Cubit.
- Bloc/Cubit talks to use-cases/repositories.
- Repositories talk to services.
- No direct UI -> service calls.
- Keep flow unidirectional.

## Testing Strategy

- Widget tests: render by state.
- Bloc/Cubit tests: event/action -> expected states.
- Repository tests: mock services.
- Service tests: integration-level I/O contracts.
