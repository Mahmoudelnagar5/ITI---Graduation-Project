# Theme System Documentation

This directory contains the comprehensive theme system for the ITI Fayoum app, providing both light and dark themes for all user screens from splash to home.

## Files Structure

```
lib/core/theme/
├── light_theme.dart      # Light theme configuration
├── dark_theme.dart       # Dark theme configuration
├── theme_manager.dart    # Theme management utilities
├── theme_export.dart     # Export file for easy imports
└── README.md            # This documentation file
```

## Features

### 1. Light Theme (`light_theme.dart`)
- Clean, bright interface with light backgrounds
- Uses `AppColors.light*` color variants
- Optimized for daytime usage
- High contrast for better readability
- Proper Material 3 design system implementation

### 2. Dark Theme (`dark_theme.dart`)
- Dark interface with reduced eye strain
- Uses `AppColors.dark*` color variants
- Optimized for nighttime usage
- Maintains accessibility standards
- True dark mode with proper contrast ratios

### 3. Theme Manager (`theme_manager.dart`)
- Provides easy access to both themes
- Handles theme switching logic
- Supports system theme detection
- Fallback mechanisms for theme switching

## Color System

### Light Theme Colors
- `lightScaffoldBg`: Main background color (off-white)
- `lightCardBg`: Card background color (white)
- `lightCardBorder`: Card border color
- `lightHomeUserTitle`: Primary text color (dark)
- `lightHomeUserSubtitle`: Secondary text color (medium gray)
- `lightSearchFillColor`: Search field background
- `lightUnfocusedTextFieldBorder`: Input field borders
- `lightDividerColor`: Divider lines
- `lightShadowColor`: Shadow colors
- `lightErrorColor`: Error states
- `lightWarningColor`: Warning states
- `lightInfoColor`: Information states

### Dark Theme Colors
- `darkScaffoldBg`: Dark background color (true dark)
- `darkCardBg`: Dark card background
- `darkCardBorder`: Dark card border color
- `darkHomeUserTitle`: Light text color for dark theme
- `darkHomeUserSubtitle`: Secondary light text color
- `darkSearchFillColor`: Dark search field background
- `darkUnfocusedTextFieldBorder`: Dark input field borders
- `darkDividerColor`: Dark divider lines
- `darkShadowColor`: Dark shadow colors
- `darkErrorColor`: Dark error states
- `darkWarningColor`: Dark warning states
- `darkInfoColor`: Dark information states

## Usage

### Basic Theme Usage

```dart
import 'package:final_project_iti/core/theme/theme_export.dart';

// In your MaterialApp
MaterialApp(
  theme: ThemeManager.getLightTheme(),
  darkTheme: ThemeManager.getDarkTheme(),
  themeMode: ThemeMode.system, // or .light, .dark
  // ... other properties
)
```

### Using Theme Colors in Widgets

Instead of hardcoding colors, use the theme system:

```dart
// ❌ Don't do this
Text(
  'Hello',
  style: TextStyle(color: AppColors.mainColorStart),
)

// ✅ Do this instead
Text(
  'Hello',
  style: TextStyle(color: Theme.of(context).colorScheme.primary),
)
```

### Theme-Aware Widgets

The following widgets automatically adapt to the current theme:

- **AppBar**: Uses theme colors for background and text
- **Cards**: Adapt background and border colors
- **Buttons**: Use theme primary colors
- **Text Fields**: Adapt colors and borders
- **Bottom Navigation**: Uses theme colors for active/inactive states
- **Search Widgets**: Adapt to theme colors
- **Track Items**: Use theme surface and text colors
- **Onboarding**: Adapts dots and text colors

## Screens Covered

The theme system is designed to work with all user screens:

### ✅ Splash Screen
- Logo and text colors adapt to theme
- Background uses theme scaffold color

### ✅ Onboarding Screens
- Text colors adapt to theme
- Page indicator dots use theme colors
- Skip button uses theme primary color

### ✅ Authentication Screens
- Login/Register forms use theme colors
- Text fields adapt to theme
- Buttons use theme primary colors
- Tab indicators use theme colors

### ✅ User Home Screens
- App bar text adapts to theme
- Search widget uses theme colors
- Track items use theme surface colors
- Navigation uses theme colors
- All text elements adapt to theme

### ✅ Profile & Settings
- Cards and lists use theme colors
- Text and icons adapt to theme
- Theme toggle widget included

## Migration Guide

### Updating Existing Widgets

1. **Replace hardcoded colors with theme colors:**
   ```dart
   // Old
   color: AppColors.mainColorStart
   
   // New
   color: Theme.of(context).colorScheme.primary
   ```

2. **Use theme text styles:**
   ```dart
   // Old
   style: AppTextStyles.textStyleBold20.copyWith(
     color: AppColors.mainColorStart,
   )
   
   // New
   style: AppTextStyles.textStyleBold20.copyWith(
     color: Theme.of(context).colorScheme.primary,
   )
   ```

3. **Update background colors:**
   ```dart
   // Old
   backgroundColor: AppColors.white
   
   // New
   backgroundColor: Theme.of(context).colorScheme.surface
   ```

4. **Update card colors:**
   ```dart
   // Old
   color: AppColors.white
   
   // New
   color: Theme.of(context).colorScheme.surface
   ```

### Best Practices

1. **Always use theme colors** instead of hardcoded colors
2. **Test both themes** to ensure proper contrast and readability
3. **Use semantic colors** (primary, secondary, surface, etc.) when possible
4. **Maintain accessibility** by ensuring sufficient color contrast
5. **Update legacy widgets** gradually to maintain consistency
6. **Use opacity** for secondary text (e.g., `withOpacity(0.7)`)

## Theme Toggle

Use the provided `ThemeToggleWidget` in your settings or profile screen:

```dart
import 'package:final_project_iti/core/widgets/theme_toggle_widget.dart';

// In your widget
const ThemeToggleWidget()
```

## Performance Benefits

- **Const constructors** used where possible
- **Efficient theme switching** with smooth animations
- **Minimal rebuilds** with proper widget structure
- **Optimized color schemes** for both themes

## Accessibility

- **High contrast ratios** maintained in both themes
- **Proper text sizing** for readability
- **Color-blind friendly** color combinations
- **System theme integration** for user preferences

## Future Enhancements

- [ ] Add more theme variants (e.g., high contrast)
- [ ] Support for custom color schemes
- [ ] Animated theme transitions
- [ ] Theme presets for different user preferences
- [ ] Accessibility theme options
