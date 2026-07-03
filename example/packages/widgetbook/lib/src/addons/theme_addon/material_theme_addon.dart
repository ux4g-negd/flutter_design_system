import 'package:flutter/material.dart';

import 'addon.dart';

/// A [ThemeAddon] for changing the active [ThemeData] via [Theme].
///
/// Learn more: https://docs.widgetbook.io/addons/theme-addon#material-theme
class MaterialThemeAddon extends ThemeAddon<ThemeData> {
  /// Creates a new instance of [MaterialThemeAddon].
  MaterialThemeAddon({
    required super.themes,
    super.initialTheme,
  }) : super(
         themeBuilder: (context, theme, child) {
           return AnimatedTheme(
             data: theme,
             child: Builder(
               builder: (context) {
                 final animatedTheme = Theme.of(context);
                 return ColoredBox(
                   color: animatedTheme.scaffoldBackgroundColor,
                   child: DefaultTextStyle(
                     style: animatedTheme.textTheme.bodyMedium!,
                     child: child,
                   ),
                 );
               },
             ),
           );
         },
       );
}
