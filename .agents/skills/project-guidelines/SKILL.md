---
name: project-guidelines
description: Repository-specific coding standards for this project. Use this skill to ensure architecture, state management, DTO/entity modeling, naming, linting, and testing decisions follow GUIDELINES.md.
metadata:
  author: Art Gallery Team
  version: "1.0"
---

# Project Guidelines

## Overview

This skill binds AI behavior to the repository coding standards defined in:

- [`GUIDELINES.md`](../../GUIDELINES.md)

## Mandatory Instruction

Before making architecture, data modeling, state management, or testing decisions, read and apply `../../GUIDELINES.md`.

If there is a conflict between general Flutter advice and `GUIDELINES.md`, follow `GUIDELINES.md` for this repository.

## What To Enforce

- Feature-first Clean Architecture structure with `data/`, `domain/`, `presentation/`
- BLoC/Cubit state management with immutable states
- DTO-first modeling with `json_serializable`; use entities only when justified
- Snake_case file names and standard Dart naming conventions
- `flutter_lints` compliance and analyzer-clean code
- Unit tests for business logic and critical behavior
- Dependency hierarchy and package versioning rules from `GUIDELINES.md`

## When To Use This Skill

Use this skill for any task that:

- creates or refactors feature code
- introduces repositories, Cubits/BLoCs, models, or mappers
- changes architecture or folder structure
- updates linting, testing, or package dependencies

## Source of Truth

- [`GUIDELINES.md`](../../GUIDELINES.md)
