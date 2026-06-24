# Feature-First Architecture (Bloc/Cubit)

Organize code by feature. Each feature owns its presentation, domain, and data parts.

## Recommended Structure

```
lib/
├── features/
│   ├── promo/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   │   └── services/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   └── use_cases/
│   │   └── presentation/
│   │       ├── pages/
│   │       ├── widgets/
│   │       ├── blocs/
│   │       └── cubits/
│   └── wallet/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/
│   ├── core/
│   ├── data/
│   └── ui/
└── main.dart
```

## Why feature-first

- Better team parallelism.
- Clear boundaries and ownership.
- Easier feature extraction/removal.
- Lower merge conflicts.

## Naming Conventions

- Folders: lowercase + snake_case.
- Bloc files: `feature_name_bloc.dart`, `feature_name_event.dart`, `feature_name_state.dart`.
- Cubit files: `feature_name_cubit.dart`, `feature_name_state.dart`.
- States/events: sealed classes with clear names.

## Dependency Rules

- Do not import from one feature's presentation into another.
- Share reusable pieces via `shared/`.
- Keep feature contracts in domain interfaces when cross-feature integration is required.

## Adding a New Feature

1. Create `data/`, `domain/`, `presentation/` folders.
2. Start with Cubit for simple flows.
3. Promote to Bloc when event complexity grows.
4. Add sealed states first, then UI and repository wiring.
5. Add tests for state transitions and repository contracts.
