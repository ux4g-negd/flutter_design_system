import 'package:flutter/material.dart';

/// Global notifier that drives the outer-frame / doc-page theme.
/// Listened to by the sidebar, home page, Overview, and Installation screens.
/// Component previews in the middle panel are NOT affected — they follow
/// the right-side Settings addon.
final ValueNotifier<ThemeMode> widgetbookThemeNotifier = ValueNotifier(
  ThemeMode.light,
);
