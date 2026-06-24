# UI Constants Guidelines

## Purpose

A constants class (for example `KSize`) removes repeated numeric literals from UI code and makes design changes safer.

## Recommended grouping

- Margins and spacing.
- Border radius and border widths.
- Font sizes and font weights.
- Icon, avatar, and button dimensions.
- Component heights/widths (app bar, bottom sheet, loaders).
- Breakpoints and content bounds.
- Opacity and elevation levels.

## Usage patterns

```dart
Padding(
  padding: const EdgeInsets.all(KSize.margin4x),
  child: Text(
    'Title',
    style: TextStyle(
      fontSize: KSize.fontSizeL,
      fontWeight: KSize.fontWeightBold,
    ),
  ),
)
```

```dart
Container(
  height: KSize.buttonHeightM,
  decoration: BoxDecoration(
    borderRadius: KSize.defaultBorderRadius,
  ),
)
```

## Best practices

- Keep constants in one place and avoid duplicates.
- Avoid unclear names like `size1`, `size2`; use semantic names.
- Document non-obvious values with short comments.
- Introduce deprecation comments before renaming frequently used constants.
- Add project-level lint/review rule to disallow magic numbers in UI when practical.
