---
name: flutter-result-cache
description: Use Result pattern and BehaviorSubject local cache in Flutter/Dart architecture. Apply when you need typed success/failure modeling and reactive in-memory cache streams in repositories.
metadata:
  author: Maxkishchenko
  version: "1.0"
---

# Flutter Result and BehaviorSubject Cache

## Overview

This skill standardizes two practical building blocks for Flutter architecture:

- A generic `Result<V, E>` sealed type for typed success/failure flows.
- A `BehaviorSubject<T>`-based local cache for reactive repository state.

Use this skill to avoid exception-driven control flow in UI-facing layers and to expose cache updates as streams.

## When to use

- Repository methods should return explicit success/failure values.
- UI state layer (Bloc/Cubit) needs predictable error handling.
- You need a simple in-memory reactive cache that replays the latest value.
- You want to reduce boilerplate around loading cached + remote data.

## Key capabilities

- Copy-ready generic `Result<V, E>` implementation.
- `BehaviorSubject<T>` cache patterns (single value + keyed cache).
- Repository examples combining remote fetch + subject updates.
- Lifecycle and safety notes (close subject, avoid leaks).

## References

- `result-pattern.md` - Result pattern implementation and usage.
- `behavior-subject-cache.md` - BehaviorSubject local cache patterns.
- `integration-repository-pattern.md` - Combining Result + cache in repository flows.

## Notes

- Return `Result` from repositories/use-cases, not raw exceptions.
- Use typed error models (`enum`, sealed classes, domain errors).
- Close every `BehaviorSubject` in `dispose`/`close` path.
