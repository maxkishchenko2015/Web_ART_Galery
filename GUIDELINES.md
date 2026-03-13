# Coding Standards & Guidelines
This document outlines the coding standards and best practices of the project. It establishes a foundational agreement among Flutter developers on architecture, state management, data modeling, and code style. Adhering to these guidelines will ensure our codebase remains consistent, scalable, testable, and maintainable [[1]](#sources). The guidelines draw from Clean Architecture principles, the IDT Feature Development Guide, and Flutter’s official recommendations.

# Architecture & Project Structure
We follow a **feature-first Clean Architecture** approach, emphasizing separation of concerns[[2]](#sources). Each feature resides in its own folder with a clear layer separation. This structure makes it easy to locate code, enables modular development, and aligns with Flutter's recommended project organization[[3]](#sources).

**See a complete example**: [packages/examples/base/lib/feature_name/](packages/examples/base/lib/feature_name/)

```
src/your_feature/
├── data/
│   ├── api/           # Remote data sources (e.g. API clients) 
│   ├── models/        # Data Transfer Objects (DTOs) for API models
│   └── repository/    # Repository Implementations
├── domain/
│   ├── repository/    # Optional - Repository Interfaces
│   └── use_cases/     # Optional - For complex and shared business logic 
└── presentation/
    ├── cubits/blocs   # Cubits/BLoCs and immutable state definitions
    ├── screens/       # Screens (UI pages for this feature)
    └── widgets/       # Reusable UI components (specific to this feature)
```

### Layer Responsibilities:
- **Presentation Layer**: Contains UI code (screens/widgets) and state management (Cubits/BLoCs). UI widgets should contain no business logic; they merely render state and forward user interactions to Cubits/BLoCs[[4]](#sources). This keeps the UI simple and declarative, with business logic handled separately.
  - **Example Cubit**: [version_cubit.dart](packages/examples/base/lib/feature_name/presentation/cubits/version_cubit.dart)
  - **Example States**: [version_states.dart](packages/examples/base/lib/feature_name/presentation/cubits/version_states.dart)
  - **Example Screen**: [version_page.dart](packages/examples/base/lib/feature_name/presentation/screens/version_page.dart) - Note the use of exhaustive switch expressions for state handling


- **Domain Layer**: Defines core business logic contracts. 

  Here we place repository interfaces (abstract classes defining data operations) but only when they are needed. Add a Repostory Interface when:
  - There is a high probablity that the Repository will will change in the near future, for example changing from one endpoint to another.
  - The Repository will be referenced from multiple Cubits/BLoCs.

  If needed, domain entities (business models) should be placed here. The domain layer is independent of any UI or infrastructure concerns, ensuring core logic is isolated and reusable[[5]](#sources)[[6]](#sources).
  - **Example Entity**: [version.dart](packages/examples/base/lib/feature_name/domain/entities/version.dart) - Simple entity with Equatable for value comparison


- **Data Layer**: Handles data retrieval and persistence. This includes API clients (under `data/api`; [example](packages/examples/base/lib/feature_name/data/api/feature_name_api_client.dart)), data transfer models (DTOs under `data/models`; [example](packages/examples/base/lib/feature_name/data/models/version_response.dart)) and implementation of Repositories (under `data/repository`; [example](packages/examples/base/lib/feature_name/data/repository/version_repository_remote.dart)). 
  - Repositories in this layer implement domain interfaces (if there is an interface) and coordinate data from APIs or other sources. They may perform transformations (e.g. mapping DTOs to domain entities) when needed, but most of the time DTO and Entity mapping will be done in an extension to the DTO class ([example](packages/examples/base/lib/feature_name/data/mappers/version_mapper.dart)). By keeping data logic here, we ensure the UI and domain are not tightly coupled to external data sources[[7]](#sources)[[8]](#sources). 
  - Each feature’s folder encapsulates all its relevant files, enabling modularity – developers can work on a feature in isolation with well-defined boundaries. This vertical slice structure aligns with Clean Architecture’s goal of layer isolation[[9]](#sources) and Flutter’s guidance to split UI from data concerns[[2]](#sources). As the app grows, this makes it easier to extend features or even extract them into modules or packages if needed, without impacting others.

# State Management with BLoC/Cubit
For all business logic and state management, we use the BLoC pattern, specifically Cubit/Bloc classes from the flutter_bloc package. This provides a unified approach to manage state across the app and ensures a clear separation between state logic and UI. Using BLoCs/Cubits for feature logic makes our code more maintainable and testable, as the UI simply reacts to state changes and does not contain business rules[[4]](#sources).

**Example implementation**: [version_cubit.dart](packages/examples/base/lib/feature_name/presentation/cubits/version_cubit.dart)

**Cubit vs Bloc**: You may use either Cubit or Bloc, depending on the complexity of the feature: - Use a Cubit for simpler state handling (where inputs are straightforward method calls). - Use a Bloc (with explicit Events and States) if you prefer or if a feature benefits from a more event-driven approach. 

In both cases, all state changes must go through these classes, never directly in the UI. For example, on a button press, the UI should call a Cubit/Bloc method or add an Event, rather than manipulate any data directly.

**Use Cases**: Creating Use Case classes are considered optional and can be added when a feature meets any of the following criteria:
 - Merging of data from multiple repositories is required
 - The feature’s logic is complex and needs to be extracted from the bloc/cubit to make it easier to maintain
 - The business logic will be re-used in multiple blocs/cubits


**Immutable States**: All Cubit/Bloc state classes must be immutable. This means whenever state needs to change, a new state object is emitted instead of modifying an existing state in place. Immutability ensures predictable state transitions and prevents unintended side-effects or bugs from shared mutable state[[10]](#sources). To enforce this: - Define state classes with all fields as final (and preferably use the `@immutable` annotation from `package:meta` for clarity). - If the state has multiple properties, provide a copy constructor or copyWith method to create modified copies. - You can also use patterns like sealed classes or union types for states. For advanced cases, it’s acceptable to use freezed to generate immutable state classes with union types (e.g., for representing loading/success/error states as separate subclasses). However, for straightforward state objects, plain Dart classes (possibly with `Equatable` for equality) are fine.

By adhering to immutability, we maintain consistency throughout the app state[[10]](#sources). This approach is a best practice recommended by the Bloc library community and ensures that each new state emitted is a distinct snapshot of app state (making debugging and reasoning about state much easier).


# Data Modeling & Serialization
For modeling data, especially data coming from or going to APIs, we use Data Transfer Objects (DTOs) and JSON serialization. The standard approach is to use the `json_serializable` package for all JSON parsing/serialization of API requests and responses.

* JSON Serializable for DTOs: Each API model should be defined as a DTO class (in `data/models`) annotated with `@JsonSerializable`. This allows us to auto-generate `fromJson/toJson` methods, reducing boilerplate and ensuring consistent JSON handling across the project. For example, an API response object `UserDto` would be a simple class with fields matching the JSON, and `json_serializable` will generate the code to parse JSON into `UserDto` and vice versa. This approach keeps our API models dumb and straightforward, purely reflecting the external data format.
  - **Example**: [version_response.dart](packages/examples/base/lib/feature_name/data/dto/version_response.dart)

* Using `freezed` selectively: We limit the use of `freezed` (a code generator for immutable classes and unions) to cases where it's truly beneficial. Specifically, only use `freezed` for advanced data modeling needs, such as:
Complex objects requiring union types or sealed classes (e.g. an object that can represent multiple variants or an API response that can be one of several forms).
Data classes with a lot of boilerplate where freezed can significantly reduce code (e.g. classes with many properties, equality, copyWith, etc.) and improve maintainability.

* Use enums with unknown case: if the API response contains an enum we should parse it as an enum and always add “unknown” case that will be used as a fallback.

In most cases, DTOs **do not need** `freezed`, simple data classes with `json_serializable` and perhaps `Equatable` for comparison will suffice. 

Overusing `freezed` can add unnecessary abstraction and build complexity, so we prefer the simpler solution unless a clear need arises. This strikes a balance between immutability and simplicity – we get immutable JSON models via generated code without introducing too many layers of abstraction.

# DTO vs Entity – When to Introduce Domain Models
We generally use DTOs as our primary data models throughout the app, to avoid duplicating model classes needlessly. However, there are specific situations where creating a separate Entity (domain model) is warranted. Here are the rules for deciding between DTOs and Entities:
* Use DTOs by default: In most cases, the data model returned from an API (the DTO) can be used directly in the application (especially in the UI or even in simple business logic). This keeps things simple and avoids unnecessary mapping code. For example, if the backend provides a UserDto and it has exactly the data we need for our feature, we can use UserDto directly in Cubit state or UI widgets.

* **Introduce a Domain Entity only when necessary**: If any of the following conditions apply, consider creating a separate Entity class in the domain layer:
    * **Different Shape for Domain Needs**: The API response structure doesn’t match what the app needs. For instance, if the API gives you a convoluted object or extra data that the UI shouldn’t worry about, or if the data needs to be restructured (e.g., combining two fields into one), an Entity can present a cleaner, simplified model to the UI.

    * **Validation or Transformation Logic**: If the data requires validation or non-trivial transformation before use, encapsulate that in a domain Entity. For example, if the API provides a raw value that needs calculation or formatting (such as converting a timestamp to a DateTime or computing a derived property), an Entity can perform this in its constructor or via methods, ensuring that the rest of the app deals only with valid, ready-to-use data.

    * **Protecting Against API Changes**: If the backend is expected to evolve and might change response formats or fields, an Entity can act as a stable interface for the UI and domain logic. The Entity isolates the core app logic from backend fluctuations – only the conversion from DTO to Entity would need updating if the API changes, not the entire app.

    * **Avoid premature abstraction**: If the differences between the API model and what the app needs are minor, do not create a new Entity just for the sake of it. We want to keep our code as simple as possible. In such cases, you can leverage extension methods on DTOs to add minor computed properties or helper functions. For example, if UserDto has firstName and lastName fields but you often need the full name, you can write an extension on UserDto to provide a fullName getter, instead of creating a whole new User entity class for that. This gives you the convenience of a richer model without extra layers of abstraction:

```
// In src/your_feature/data/models/user_dto.dart
@JsonSerializable()
class UserDto {
  final String firstName;
  final String lastName;
  // ... other fields ...

  const UserDto({required this.firstName, required this.lastName, /*...*/});

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

// Extension to add a computed property
extension UserDtoX on UserDto {
  String get fullName => '$firstName $lastName';
}
```

In the above example, `fullName` is a trivial computed property. Using an extension keeps the logic close to the data model without introducing a separate domain entity. This approach should cover many small use-cases. Only graduate to a distinct Entity class if the logic or transformation can't be cleanly handled with a simple extension or if it falls under the earlier conditions.

**Real example**: See [version_mapper.dart](packages/examples/base/lib/feature_name/data/mappers/version_mapper.dart) which uses an extension method to convert VersionResponse DTO to Version entity.

By defaulting to DTOs and only introducing Entities when needed, we avoid over-engineering while still preserving the flexibility to adapt the model when the domain logic demands it. Remember that if an Entity is introduced, it should reside in the domain layer (`your_feature/domain/`), and typically we will write conversion methods (or factory constructors) like `dto.toDomain()` or use mappers in the data layer to convert DTOs to Entities and vice versa[[8]](#sources).

# Static Analysis & Naming Conventions
Consistent code style is enforced via static analysis lints and naming rules:
* **Linting**: We use the `flutter_lints` package for static analysis. This is the official recommended lint set from the Flutter team, which encourages good coding practices for Flutter apps[[11]](#sources). The `analysis_options.yaml` in the project includes `package:flutter_lints/flutter.yaml` to activate these rules. All code must pass `flutter analyz`e without errors or warnings. We chose `flutter_lints` for consistency with Flutter’s defaults and simplicity. (We do not use `very_good_analysis` or other stricter community lint sets, to keep the lint rules straightforward and aligned with standard Flutter style.)

* **File Naming**: All files and directories **must use snake_case** naming. This means filenames are all lowercase, with words separated by underscores (e.g. `login_page.dart`, `user_profile_cubit.dart`). Snake case is the Dart convention for filenames and makes it easy to identify files in a glance. Avoid any uppercase letters, spaces, or dashes in file names.

* **Class & Identifier Naming**: Classes, enums, typedefs, etc., should use **UpperCamelCase** (e.g. `UserProfileCubit`, `UserDto`), following Dart conventions. Member variables, parameters, and local variables use lowerCamelCase (e.g. `isLoading`, `userList`). Constant values should be all uppercase with underscores (`MAX_RETRY_COUNT`) or follow Dart constant style if inside a class. While these are default Dart rules, it's worth reiterating to maintain consistency.

* **Project Structure Names**: The folder names for layers (`data`, `domain`, `presentation`) and their subfolders (`api`, `models`, `repository`, `cubits`, `screens`, `widgets`) are part of the standard and should be all lowercase (they are not classes). Feature folders under `src/` should also be snake_case (for multi-word feature names, e.g. `user_profile/` or `order_history/`). Consistent naming in paths helps navigation and reduces cognitive load when searching for files.

By following a unified style and lint rules, we make the codebase cleaner and avoid common mistakes. The lints will catch many potential issues (like unused variables, missing const where possible, improper spacing, etc.), and the agreed naming conventions ensure that one can predict file names and class names during development or review. Developers should fix lint issues as they code; the CI pipeline (if any) should be configured to fail on analyzer issues to enforce this.

# Testing & Maintainability
We put a strong emphasis on testability. The architecture and patterns we’ve chosen (Clean Architecture layers with BLoC state management) are designed to make the code easy to unit test[1]. All new features should include unit tests, especially for Cubit/Bloc classes and any critical domain logic.
 * **Unit Tests for Business Logic**: Every Cubit/Bloc must have corresponding unit tests covering its behavior (e.g., given an initial state, when specific events or method calls occur, then it emits the expected new states). The newly created BLoCs and Cubits should have 90% of the unit test coverage of the Cubit/Bloc. Since Cubit/Bloc are essentially plain Dart classes, they are straightforward to test in isolation[[12]](#sources). We should take advantage of this by writing tests for all possible state transitions, edge cases, and error scenarios. This ensures our business logic is reliable and documents expected behavior. Developers can use the `bloc_test` package to simplify testing of Cubits/BLoCs (providing utilities like emit expectations), or plain `package:test` with proper arrangements.
  - **Example**: [version_cubit_test.dart](packages/examples/base/test/feature_name/presentation/cubits/version_cubit_test.dart) - Demonstrates comprehensive testing with mocktail, bloc_test, and proper state verification

* **Formatters, Parsers and Validators**: Any Formatters, String Parsers or Input Validators should have unit tests that cover all the different cases we support.

* **Mocking and Dependency Injection**: When Cubits/BLoCs depend on repositories or other services, use dependency injection to supply a mock or fake implementation in tests. Our use of abstract repository interfaces in the domain layer makes it easy to swap in a mock for testing. This decoupling is deliberate – by coding against interfaces, we ensure that the core logic can be tested without needing real HTTP calls or database access. For example, a Cubit that uses `UserRepository` can accept it via constructor; in tests we provide a dummy implementation or use a mocking framework to simulate repository responses (e.g., returning predefined data or errors). This leads to fast, reliable tests that focus on the Cubit's reaction to various repository outcomes.
  - **Example DI registration**: [base_package.dart](packages/examples/base/lib/base_package.dart) - Shows how dependencies are registered with GetIt
  - **Example Scope**: [version_scope.dart](packages/examples/base/lib/feature_name/presentation/screens/version_scope.dart) - Shows BlocProvider with dependency injection

* Use **Mocktail** as it doesn’t require file generation: [Mocktail](https://pub.dev/packages/mocktail)

* **UI Tests (optional)**: While the focus is on unit testing the logic, also consider writing widget tests for important UI flows, especially those involving multiple states. With the separation we have, widget tests can pump a screen widget with a mocked Cubit/Bloc to validate that UI elements appear correctly for each state (loading indicators, error messages, data displayed, etc.). This further ensures that the presentation layer correctly responds to state changes.

* **Maintainability through Modular Design**: By organizing code into layers and feature folders, our code is easier to maintain. A change in one feature or layer has minimal impact on others. For instance, if an API changes, we might only update the DTO and repository of that feature, without touching UI or business logic. Similarly, if we update how a piece of UI looks, we do so in the widget files without altering the underlying Cubit or data layer. This modularity and clear separation of responsibilities follow Flutter’s recommended best practices for scalable apps[1]. It means new team members can quickly find the relevant code for a feature and understand its structure, and it allows us to work on multiple features in parallel with fewer merge conflicts.

* **Code Reviews and Collaboration**: All code should be reviewed with these guidelines in mind. During PR reviews, team members will check for adherence to the folder structure, proper use of Cubit/Bloc, DTO/Entity rules, and presence of tests. The tone of this guideline is collaborative – we all share responsibility for keeping the codebase clean and consistent. If something doesn't fit the patterns described here, consider whether an exception is truly needed or if the design should be adjusted. The goal is not to be overly rigid, but to have a common foundation so that everyone speaks the same “language” in code. When exceptions or new patterns are necessary, discuss them with the team and update this document if needed, so the standards evolve with the project.

# Internal packages dependencies
The dtc-flutter repository contains over 100 internal packages that are reused across our applications. To avoid cross-dependencies between packages, it's crucial to maintain a strict and correct dependency hierarchy.
Refer to the diagram below: additions to the "Apps" and "Main Features" levels are rare and only occur at the initiative of stakeholders.
Dependencies between packages on the same level, or from lower levels to higher ones, are strictly prohibited.

![Dependencies](dependencies.png "Dependencies")

# Package References
We apply the following approach to references of packages in our pubspec.yaml files:
* Prefer fixed versions over optimistic versions:
    * Referencing a package like `package: 1.0.0` is considered safer than `package: ^1.0.0` as breaking changes can be introduced in minor versions
* When upgrading a package to a newer version, ensure to update all references to the package to use the exact same version.
    * Also ensure that proper testing is done in all packages to ensure the functionality is still working as expected


# Conclusion
Following these coding standards will help ensure that `dtc-flutter` remains robust and developer-friendly. We’ve defined a clear architecture that separates UI, business logic, and data concerns, aligned with Flutter’s official architecture guidance[[2]](#sources). We use proven state management (Bloc/Cubit) to keep logic organized, maintain immutable state, and encourage testability. Our approach to data modeling avoids over-abstraction while still allowing flexibility through DTOs and Entities where appropriate. Consistent linting and naming conventions make the code style uniform, reducing friction in collaboration.

By adhering to these guidelines, we can work together efficiently on a large Flutter codebase, confident that each feature is structured, coded, and tested in a predictable manner. This consistency not only makes development and code reviews smoother, but also results in an app that is easier to scale and maintain over the long term[[1]](#sources). Let’s all commit to these standards and continuously improve them as we learn new best practices, ensuring our project stays clean, scalable, and enjoyable to work on.

# Sources

[1] [2] [3] [Architecture guide | Flutter](https://docs.flutter.dev/app-architecture/guide)

[4] [10] [12] [Flutter BLoC Tutorial: Learning State Management in Flutter](https://www.dhiwise.com/post/flutter-bloc-tutorial-understanding-state-management)

[5] [6] [IDT Feature Development Guide.pdf](https://docs.google.com/document/d/177Yl4UWtF4YbJteXXsbCDcO3ete2YbQSNiq9O_IMU74/edit?tab=t.0)

[7] [8] [9] [Feature-First Clean Architecture for Flutter | Medium](https://medium.com/@remy.baudet/feature-first-clean-architecture-for-flutter-246366e71c18)

[11] [Introducing package:flutter_lints | Flutter](https://docs.flutter.dev/release/breaking-changes/flutter-lints-package)


