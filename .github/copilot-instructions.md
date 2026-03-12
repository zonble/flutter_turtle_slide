# GitHub Copilot Instructions

## Project Overview

**flutter_turtle_slide** is a Flutter presentation application that demonstrates turtle graphics
concepts and implementation. It renders 19 interactive slides covering the history of turtle
graphics, live animated examples using the `flutter_turtle` package, the DSL command model,
L-systems, fractals, and internal Flutter implementation details (CustomPaint, TurtlePainter,
AnimationController).

Users navigate slides by tapping the screen, clicking the arrow buttons at the bottom, or using
keyboard controls.

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
│   ├── copilot-instructions.md   # This file
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

The current page number is tracked in `_PageNumberState` via a `GlobalKey` and updated through
`_key.currentState?.setPage(page)`.

### Slide Pages

All slides are added directly to the `PageView.children` list in `main.dart`. The current slide
order is:

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

## Adding a New Slide

1. Create `lib/pages/<slide_name>.dart`.
2. Extend `StatelessWidget` (static content) or `StatefulWidget` (interactive/animated).
3. Build a `Widget` that fits within the 900 × 600 pixel canvas.
4. Import the new file in `lib/main.dart`.
5. Insert the widget in the appropriate position in the `PageView.children` list.

### Typical static slide template

```dart
import 'package:flutter/material.dart';

class MyNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title', style: Theme.of(context).textTheme.displayLarge),
          const Divider(),
          const SizedBox(height: 20),
          // slide content
        ],
      ),
    );
  }
}
```

### Typical animated turtle slide template

```dart
import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

class MyAnimatedPage extends StatefulWidget {
  @override
  _MyAnimatedPageState createState() => _MyAnimatedPageState();
}

class _MyAnimatedPageState extends State<MyAnimatedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return TurtleView(
          commands: [
            PenDown(),
            // ... commands that reference _controller.value
          ],
          child: Container(width: double.infinity, height: double.infinity),
        );
      },
    );
  }
}
```

---

## Code Style & Conventions

- Follow the rules in `analysis_options.yaml` (extends `package:flutter_lints/flutter.yaml`).
- Use `flutter analyze` to check for lint errors before committing.
- Turtle command lambdas always use the short `(_) =>` form for the context parameter.
- `StatefulWidget` private state classes are named `_<WidgetName>State`.
- Avoid `print()` in production code (existing uses are acknowledged technical debt).
- No local assets are used; all visuals are programmatically generated via turtle commands.
- Prefer `const` constructors wherever possible.

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
- **Flutter version:** 3.32.0 (stable channel)
- **Steps:** checkout → setup Java 12 → install Flutter → `flutter upgrade` → enable web →
  `flutter packages get` → `flutter build web` → deploy `build/web/` to GitHub Pages via
  `JamesIves/github-pages-deploy-action@v4`

---

## Key Files Quick Reference

| File | What to look for |
|------|-----------------|
| `lib/main.dart` | `MyHomePage` – slide list, navigation logic, scale factor |
| `lib/pages/cover.dart` | Simplest animated example: `AnimatedTurtleView` with `Repeat` |
| `lib/pages/example2.dart` | Recursive tree using `SetMacro` / `RunMacro` / `IfElse` |
| `lib/pages/lsystem.dart` | L-system with `AnimationController` + `AnimatedBuilder` |
| `lib/pages/example1.dart` | Side-by-side code + live rendering layout |
| `pubspec.yaml` | All dependency versions |
| `analysis_options.yaml` | Lint rule configuration |
