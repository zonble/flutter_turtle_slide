# flutter_turtle_slide

A Flutter presentation app demonstrating turtle graphics concepts and implementation.

## What it does

This app creates an interactive slide presentation that showcases:

- Turtle graphics history and concepts
- Live turtle graphics demonstrations using the `flutter_turtle` package
- Implementation details of turtle graphics in Flutter
- Animated examples including L-systems and fractals
- Domain Specific Language (DSL) approach for turtle commands

Navigate through the slides by tapping the screen, clicking the arrow buttons at the bottom, or
using keyboard controls.

---

## Technology Stack

| Layer | Technology |
|-------|-----------|
| Language | Dart 3.0+ |
| Framework | Flutter 3.32.0 (pinned via `.fvmrc`) |
| Turtle graphics | `flutter_turtle ^0.4.2` |
| Syntax highlighting | `flutter_syntax_view` (Dracula theme) |
| External links | `url_launcher` |
| Icons | `cupertino_icons` |
| Testing | `flutter_test` (SDK) |
| Linting | `flutter_lints` (via `analysis_options.yaml`) |
| CI/CD | GitHub Actions → GitHub Pages |

---

## Directory Structure

```
flutter_turtle_slide/
├── .github/
│   └── workflows/
│       └── flutter_web_ci.yml    # CI: build + deploy to GitHub Pages on push to master
├── lib/
│   ├── main.dart                 # App entry point, MyApp, MyHomePage, PageNumber
│   └── pages/                   # One Dart file per slide (or pair of slides)
│       ├── agenda.dart
│       ├── animation.dart
│       ├── components.dart
│       ├── cover.dart
│       ├── custom_paint.dart
│       ├── dsl.dart
│       ├── dsl_explained.dart
│       ├── end.dart
│       ├── example1.dart
│       ├── example2.dart        # Also contains Example22 (slider demo)
│       ├── flutter_turtle_intro.dart
│       ├── history.dart
│       ├── intro.dart
│       ├── lsystem.dart
│       ├── painter.dart
│       └── today.dart
├── test/
│   └── widget_test.dart
├── analysis_options.yaml
├── pubspec.yaml
└── pubspec.lock
```

---

## Architecture

### Slide Navigation

`MyHomePage` in `main.dart` owns a `PageController` and wraps everything in a `PageView`. The
presentation is fixed at 900 × 600 logical pixels and scaled to fit the screen height using
`Transform.scale`. Navigation is handled by:

- **Tap on slide** – calls `nextPage()`
- **Arrow buttons** (bottom overlay) – call `nextPage()` / `previousPage()`
- `nextPage()` / `previousPage()` – animate via `PageController.animateToPage` with
  `Curves.easeInCubic` and 250 ms duration.

The current slide order is:

```
Cover → AgendaPage → IntroPage → HistoryPage → TodayPage →
FlutterTurtleIntroPage → Example1Code → Example1 →
Example2Code → Example2 → Example22 → LSystemPage →
ComponentsPage → DSLPage → DSLExplainedPage →
CustomPaintPage → PainterPage → AnimationPage → EndPage
```

### Widget Patterns

| Pattern | When used |
|---------|-----------|
| `StatelessWidget` | Static content slides (text/layout only) |
| `StatefulWidget` | Slides with animation, interactivity, or `setState` rebuilds |
| `SingleTickerProviderStateMixin` | Slides that own an `AnimationController` (e.g., `LSystemPage`) |
| `AnimatedBuilder` | Efficiently rebuild only the animated subtree |

---

## Turtle Graphics DSL

All turtle graphics are expressed as a `List<TurtleCommand>` passed to `TurtleView` or
`AnimatedTurtleView`. Commands receive a context map `_` (type `Map<String, dynamic>`) through
anonymous functions.

### Core Commands

```dart
PenDown()                              // start drawing
Forward((_) => 100.0)                  // move forward n pixels
Back((_) => 50.0)                      // move backward n pixels
Left((_) => 30.0)                      // rotate left by degrees
Right((_) => 30.0)                     // rotate right by degrees
SetColor((_) => Colors.green)          // set pen color
SetStrokeWidth((_) => 3.0)             // set line width
Stop()                                 // halt current macro branch
```

### Macro / Recursion Commands

```dart
// Define a named macro (supports recursion via RunMacro)
SetMacro('tree', [
  IfElse((_) => _['l'] < 10.0, [Stop()], [
    Forward((_) => _['l']),
    Right((_) => 30.0),
    RunMacro('tree', (_) => {'l': _['l'] * 0.75}),
    Left((_) => 60.0),
    RunMacro('tree', (_) => {'l': _['l'] * 0.75}),
  ]),
]),

// Invoke a macro, passing a new variable context
RunMacro('tree', (_) => {'l': 100.0})
```

### Control Flow

```dart
// IfElse(condition, trueCommands, falseCommands)
IfElse((_) => _['l'] < 20.0,
  [SetColor((_) => Colors.green)],
  [SetColor((_) => Colors.brown)],
)

// Repeat(countFn, commands)
Repeat((_) => 36, [
  Left((_) => 10),
  Repeat((_) => 360, [Left((_) => 1), Forward((_) => 3)]),
])
```

### Widgets

```dart
// Static rendering
TurtleView(
  commands: [...],
  child: Container(width: double.infinity, height: 400),
)

// Animated rendering (replays commands over the given duration)
AnimatedTurtleView(
  animationDuration: Duration(milliseconds: 500),
  commands: [...],
  child: Container(height: 300, width: double.infinity),
)
```

---

## Build, Lint & Test

```bash
# Install dependencies
flutter packages get

# Lint / static analysis
flutter analyze

# Run tests
flutter test

# Run locally (web)
flutter config --enable-web
flutter run -d chrome

# Build for web (output: build/web/)
flutter build web
```

---

## CI/CD Pipeline

Defined in `.github/workflows/flutter_web_ci.yml`:

- **Trigger:** push to `master`
- **Runner:** `ubuntu-latest`
- **Flutter version:** stable channel
- **Steps:** checkout → install Flutter → enable web → `flutter packages get` →
  `flutter build web` → deploy `build/web/` to GitHub Pages via
  `JamesIves/github-pages-deploy-action@v4`

---

## Adding a New Slide

1. Create `lib/pages/<slide_name>.dart`.
2. Extend `StatelessWidget` (static content) or `StatefulWidget` (interactive/animated).
3. Build a `Widget` that fits within the 900 × 600 pixel canvas.
4. Import the new file in `lib/main.dart`.
5. Insert the widget in the appropriate position in the `PageView.children` list.
