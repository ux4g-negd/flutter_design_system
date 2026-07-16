import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resizable_widget/resizable_widget.dart';

import '../settings/settings.dart';
import '../state/state.dart';
import '../widgetbook_theme.dart';
import 'base_layout.dart';

/// The [DesktopLayout] is a layout for desktop devices that allows
/// displaying the navigation, addons, knobs, and workbench in a
/// resizable layout.
@internal
class DesktopLayout extends StatelessWidget implements BaseLayout {
  const DesktopLayout({
    super.key,
    required this.navigationBuilder,
    required this.addonsBuilder,
    required this.knobsBuilder,
    required this.workbench,
  });

  final Widget Function(BuildContext context) navigationBuilder;
  final List<Widget> Function(BuildContext context) addonsBuilder;
  final List<Widget> Function(BuildContext context) knobsBuilder;
  final Widget workbench;

  @override
  Widget build(BuildContext context) {
    final state = WidgetbookState.of(context);

    const kSidePanelPercentage = 0.2;

    final showNavigationPanel = state.canShowPanel(LayoutPanel.navigation);

    // Hide the settings panel (Knobs/Addons) on:
    // 1. Home screen (no use case selected)
    // 2. Quick Guide doc pages (Overview, Installation)
    // 3. Token sections (Colors, Typography, Elevation, Dimensions)
    final isHomeScreen = state.useCase == null;
    final currentPath = state.path ?? '';
    final isDocPage =
        currentPath.startsWith('introduction') ||
        currentPath.startsWith('quick-start-guide') ||
        currentPath.startsWith('overview') ||
        currentPath.startsWith('quick-guide') ||
        currentPath.startsWith('token') ||
        currentPath.startsWith('utils');
    final showSettingsPanel =
        !isHomeScreen &&
        !isDocPage &&
        (state.canShowPanel(LayoutPanel.addons) ||
            state.canShowPanel(LayoutPanel.knobs));

    // Dynamically compute workbench width based on visible panels
    final navWidth = showNavigationPanel ? kSidePanelPercentage : 0.0;
    final settingsWidth = showSettingsPanel ? kSidePanelPercentage : 0.0;
    final workbenchWidth = 1.0 - navWidth - settingsWidth;

    return ColoredBox(
      color: WidgetbookTheme.of(context).colorScheme.surface,
      // ValueKey forces ResizableWidget to recreate when panel count changes
      child: ResizableLayout(
        key: ValueKey('layout-$showNavigationPanel-$showSettingsPanel'),
        items: [
          if (showNavigationPanel)
            ResizableLayoutItem(
              percentage: navWidth,
              child: Card(
                child: navigationBuilder(context),
              ),
            ),
          ResizableLayoutItem(
            percentage: workbenchWidth,
            child: workbench,
          ),
          if (showSettingsPanel)
            ResizableLayoutItem(
              percentage: settingsWidth,
              child: Card(
                child: SettingsPanel(
                  settings: [
                    if (state.canShowPanel(LayoutPanel.knobs)) ...{
                      SettingsPanelData(
                        name: 'Panel',
                        builder: knobsBuilder,
                      ),
                    },
                    if (state.canShowPanel(LayoutPanel.addons) &&
                        state.addons != null) ...{
                      SettingsPanelData(
                        name: 'Settings',
                        builder: addonsBuilder,
                      ),
                    },
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

@internal
class ResizableLayoutItem {
  const ResizableLayoutItem({
    required this.percentage,
    required this.child,
  });

  final double percentage;
  final Widget child;
}

/// An improved API for [ResizableWidget] that allows passing both percentage
/// and child in a single object, allowing to easily add or remove items.
/// Also distributes the remaining space equally among all items.
@internal
class ResizableLayout extends StatelessWidget {
  const ResizableLayout({super.key, required this.items});

  final List<ResizableLayoutItem> items;

  @override
  Widget build(BuildContext context) {
    final totalPercentage = items.fold(0.0, (sum, x) => sum + x.percentage);
    final remainingPercentage = 1 - totalPercentage;
    final extraPercentage = remainingPercentage / items.length;

    return ResizableWidget(
      separatorSize: 2,
      separatorColor: Colors.white24,
      percentages: items.map((x) => x.percentage + extraPercentage).toList(),
      children: items.map((x) => x.child).toList(),
    );
  }
}
