# Navigation Patterns

## Choosing a Navigation Approach

### Simple Apps (No Deep Linking)
Use **Navigator API** with `Navigator.push()` and `Navigator.pop()`. Best for:
- Single-screen to multi-screen transitions
- Simple navigation stacks
- No requirement for deep linking or browser history

Example: `assets/navigator_basic.dart`

### Named Routes (Not Recommended)
Flutter team does NOT recommend named routes for most applications. Use only for:
- Very simple apps with static routes
- Basic deep linking without custom behavior

Limitations:
- Cannot customize deep link behavior
- No browser forward button support
- Always pushes new routes regardless of current state

### Complex Apps (Deep Linking, Web, Multiple Navigators)
Use **go_router** (declarative routing) or **auto_route** (typed, code-generated routing). Recommended for:
- Apps requiring deep linking
- Web applications with browser history
- Complex navigation patterns
- Multiple Navigator widgets
- URL-based navigation

Example: `assets/go_router_basic.dart`

## Router Decision Matrix

| Criteria | go_router | auto_route |
|----------|-----------|------------|
| Setup complexity | Lower, minimal setup | Higher, needs generation setup |
| Type-safe route args | Basic (manual patterns) | Strongly typed generated routes |
| Deep linking | Strong | Strong |
| Route guards | Built-in redirects/logic | Built-in guard classes |
| Nested navigation | Good | Excellent for complex nesting |
| Web URL support | Excellent | Excellent |
| Team fit | Prefer simple declarative config | Prefer scalable typed architecture |

### Choose go_router when
- You want fast setup and clear declarative route definitions.
- The app has moderate complexity and you do not need generated route types.

### Choose auto_route when
- You want generated route classes with compile-time argument safety.
- You need advanced nested routing or structured guards with less manual boilerplate.

## Common Patterns

### Passing Data Between Screens

**Method 1: Constructor parameters** (with Navigator)
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailScreen(item: myItem)),
);
```

Example: `assets/passing_data.dart`

**Method 2: Query parameters** (with go_router)
```dart
context.push('/details?id=123&name=test');

// Extract in screen
final id = state.uri.queryParameters['id'];
```

**Method 3: Arguments with named routes** (not recommended)
```dart
Navigator.pushNamed(context, '/details', arguments: myItem);
final item = ModalRoute.of(context)!.settings.arguments as MyItem;
```

### Returning Data From Screens

Use `await Navigator.push()`:
```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute<String>(builder: (context) => SelectionScreen()),
);
if (!context.mounted) return;
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$result')));
```

Example: `assets/returning_data.dart`

### Deep Linking Behavior

| Platform | Navigator | Router (go_router/auto_route) |
|----------|-----------|-------------------|
| iOS (not launched) | Gets initialRoute "/" then pushRoute | Gets initialRoute "/" then RouteInformationParser |
| Android (not launched) | Gets initialRoute containing route | Gets initialRoute with route path |
| iOS/Android (launched) | pushRoute called | Route parsed, Navigator configured |
| Web | No browser forward button | Full browser History API integration |

## Web-Specific Considerations

### URL Strategies

**Hash (default)**: `example.com/#/path/to/screen`
- No server configuration needed
- Works with all web servers
- URL looks less clean

**Path**: `example.com/path/to/screen`
- Requires server configuration (SPA rewrite)
- Cleaner URLs
- Use `usePathUrlStrategy()` before `runApp()`

See [web-navigation.md](web-navigation.md) for detailed setup.

### Navigation Methods

- **Navigator**: Imperative, creates pageless routes (not deep-linkable)
- **Router (go_router/auto_route)**: Declarative, creates page-backed routes (deep-linkable)

When using Router with Navigator together, removing a page-backed route also removes all subsequent pageless routes.
