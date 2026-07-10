import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ── App Header ────────────────────────────────────────────────────────────────

final appHeaderComponent = WidgetbookComponent(
  name: 'App Header',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'AppHeader',
        description:
            'A top app-bar component with optional back button, leading widgets, '
            'title, and action buttons. Supports three visual variants: light, filled, and outlined.',
        code: '''Ux4gAppHeader(
  title: 'Home',
  variant: Ux4gAppHeaderVariant.light,
  showBackButton: false,
  leadingWidgets: [
    Icon(Icons.menu_rounded),
  ],
  actions: [
    Ux4gAppHeaderAction(
      icon: Icons.notifications_outlined,
      onPressed: () {},
    ),
    Ux4gAppHeaderAction(
      icon: Icons.settings_outlined,
      onPressed: () {},
    ),
  ],
  showAvatar: true,
  avatarSize: Ux4gAvatarSize.s,
);''',
        props: const [
          PropRow(
            name: 'title',
            type: 'String',
            description: 'Header title text.',
            defaultValue: "'Title'",
          ),
          PropRow(
            name: 'variant',
            type: 'Ux4gAppHeaderVariant',
            description: 'light / filled / outlined.',
            defaultValue: 'outlined',
          ),
          PropRow(
            name: 'showBackButton',
            type: 'bool',
            description: 'Show a back-arrow button.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'onBackPressed',
            type: 'VoidCallback?',
            description: 'Called when back button is tapped.',
          ),
          PropRow(
            name: 'leadingWidgets',
            type: 'List<Widget>?',
            description: 'Widgets placed before the title.',
          ),
          PropRow(
            name: 'actions',
            type: 'List<Ux4gAppHeaderAction>?',
            description: 'Icon buttons on the trailing side.',
          ),
          PropRow(
            name: 'avatar',
            type: 'Widget?',
            description: 'Custom avatar widget.',
          ),
          PropRow(
            name: 'avatarSize',
            type: 'Ux4gAvatarSize',
            description: 'Size of default avatar.',
            defaultValue: 's',
          ),
          PropRow(
            name: 'showAvatar',
            type: 'bool',
            description: 'Show an avatar.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'avatarImageUrl',
            type: 'String?',
            description: 'URL for default avatar image.',
          ),
          PropRow(
            name: 'avatarInitials',
            type: 'String?',
            description: 'Initials for default avatar.',
          ),
          PropRow(
            name: 'onAvatarPressed',
            type: 'VoidCallback?',
            description: 'Called when avatar is tapped.',
          ),
          PropRow(
            name: 'titleWidget',
            type: 'Widget?',
            description: 'Overrides title text with custom widget.',
          ),
          PropRow(
            name: 'titleStyle',
            type: 'TextStyle?',
            description: 'Custom style for title.',
          ),
          PropRow(
            name: 'backgroundColor',
            type: 'Color?',
            description: 'Background color override.',
          ),
          PropRow(
            name: 'foregroundColor',
            type: 'Color?',
            description: 'Text/icon color override.',
          ),
          PropRow(
            name: 'borderColor',
            type: 'Color?',
            description: 'Border color (outlined variant).',
          ),
          PropRow(
            name: 'height',
            type: 'double?',
            description: 'Bar height. If null, adapts to screen size.',
            defaultValue: 'null',
          ),
          PropRow(
            name: 'horizontalPadding',
            type: 'double',
            description: 'Left/right padding.',
            defaultValue: '12.0',
          ),
          PropRow(
            name: 'leadingSpacing',
            type: 'double',
            description: 'Gap between leading items.',
            defaultValue: '8.0',
          ),
          PropRow(
            name: 'actionSpacing',
            type: 'double',
            description: 'Gap between action items.',
            defaultValue: '4.0',
          ),
          PropRow(
            name: 'elevation',
            type: 'double',
            description: 'Shadow depth.',
            defaultValue: '0',
          ),
          PropRow(
            name: 'useSafeArea',
            type: 'bool',
            description: 'Whether to add top padding for status bar.',
            defaultValue: 'true',
          ),
        ],
        center: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ux4gAppHeader(
              title: context.knobs.string(
                label: 'Title',
                initialValue: 'App Header',
              ),
              variant: context.knobs.list(
                label: 'Variant',
                options: Ux4gAppHeaderVariant.values,
                initialOption: Ux4gAppHeaderVariant.light,
                labelBuilder: (v) => v.name,
              ),
              showBackButton: context.knobs.boolean(
                label: 'Back button',
                initialValue: false,
              ),
              onBackPressed: () {},
              leadingWidgets: const [Icon(Icons.menu_rounded)],
              actions: [
                Ux4gAppHeaderAction(
                  icon: Icons.notifications_outlined,
                  onPressed: () {},
                ),
                Ux4gAppHeaderAction(
                  icon: Icons.settings_outlined,
                  onPressed: () {},
                ),
              ],
              showAvatar: context.knobs.boolean(
                label: 'Show avatar',
                initialValue: true,
              ),
              avatarSize: Ux4gAvatarSize.s,
              useSafeArea: context.knobs.boolean(
                label: 'Use SafeArea',
                initialValue: false,
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Left Aligned Title',
      builder: (context) => ComponentDocs(
        name: 'AppHeader — Left Aligned',
        description:
            'Header with a back button, left-aligned title, and actions.',
        code: '''Ux4gAppHeader(
  title: 'Page Title',
  showBackButton: true,
  variant: Ux4gAppHeaderVariant.filled,
  actions: [
    Ux4gAppHeaderAction(
      icon: Icons.search,
      onPressed: () {},
    ),
  ],
);''',
        child: Ux4gAppHeader(
          title: 'Page Title',
          showBackButton: true,
          variant: Ux4gAppHeaderVariant.filled,
          useSafeArea: false,
          actions: [Ux4gAppHeaderAction(icon: Icons.search, onPressed: () {})],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Centered Title',
      builder: (context) => ComponentDocs(
        name: 'AppHeader — Centered Title',
        description: 'Header with a centered title.',
        code: '''Ux4gAppHeader(
  showBackButton: true,
  variant: Ux4gAppHeaderVariant.filled,
  titleWidget: const Center(
    child: Text(
      'Page Title',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    ),
  ),
  actions: [
    Ux4gAppHeaderAction(
      icon: Icons.search,
      onPressed: () {},
    ),
  ],
);''',
        child: Ux4gAppHeader(
          showBackButton: true,
          variant: Ux4gAppHeaderVariant.filled,
          useSafeArea: false,
          titleWidget: const Center(
            child: Text(
              'Page Title',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          actions: [Ux4gAppHeaderAction(icon: Icons.search, onPressed: () {})],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Avatar Header',
      builder: (context) => ComponentDocs(
        name: 'AppHeader — Avatar',
        description: 'Header with title and a user avatar on the right.',
        code: '''Ux4gAppHeader(
  title: 'Welcome, User',
  variant: Ux4gAppHeaderVariant.light,
  showAvatar: true,
  avatarInitials: 'JD',
);''',
        child: const Ux4gAppHeader(
          title: 'Welcome, User',
          variant: Ux4gAppHeaderVariant.light,
          showAvatar: true,
          avatarInitials: 'JD',
          useSafeArea: false,
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Full Header',
      builder: (context) => ComponentDocs(
        name: 'AppHeader — Full',
        description:
            'A comprehensive header with menu, title, actions, and avatar.',
        code: '''Ux4gAppHeader(
  title: 'Dashboard',
  variant: Ux4gAppHeaderVariant.light,
  leadingWidgets: [
    Icon(Icons.menu),
  ],
  actions: [
    Ux4gAppHeaderAction(icon: Icons.search, onPressed: () {}),
    Ux4gAppHeaderAction(icon: Icons.notifications_outlined, onPressed: () {}),
    Ux4gAppHeaderAction(icon: Icons.settings_outlined, onPressed: () {}),
  ],
  showAvatar: true,
  avatarInitials: 'JD',
);''',
        child: Ux4gAppHeader(
          title: 'Dashboard',
          variant: Ux4gAppHeaderVariant.light,
          useSafeArea: false,
          leadingWidgets: const [Icon(Icons.menu)],
          actions: [
            Ux4gAppHeaderAction(icon: Icons.search, onPressed: () {}),
            Ux4gAppHeaderAction(
              icon: Icons.notifications_outlined,
              onPressed: () {},
            ),
            Ux4gAppHeaderAction(
              icon: Icons.settings_outlined,
              onPressed: () {},
            ),
          ],
          showAvatar: true,
          avatarInitials: 'JD',
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom Leading Widgets',
      builder: (context) => ComponentDocs(
        name: 'AppHeader — Custom Leading Widgets',
        description:
            'Headers with custom leading widgets (emblem, logos) and trailing combinations. Fully dark mode compatible.',
        code: '''// With Avatar
Ux4gAppHeader(
  leadingWidgets: [
    SvgPicture.asset(
      Ux4gIcons.nationalEmblem, 
      height: 32,
      colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Colors.white : Ux4gPalette.neutral900, BlendMode.srcIn),
    ),
    Container(height: 24, width: 1, color: Colors.grey, margin: const EdgeInsets.symmetric(horizontal: 8)),
    SvgPicture.asset(
      Ux4gIcons.union, 
      height: 24,
      colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Colors.white : Ux4gPalette.primary500, BlendMode.srcIn),
    ),
  ],
  actions: [
    Ux4gAppHeaderAction(icon: Icons.view_in_ar_outlined, onPressed: () {}),
  ],
  showAvatar: true,
  avatarInitials: 'JD',
);

// With Menu Button
Ux4gAppHeader(
  leadingWidgets: [
    SvgPicture.asset(
      Ux4gIcons.nationalEmblem, 
      height: 32,
      colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Colors.white : Ux4gPalette.neutral900, BlendMode.srcIn),
    ),
    Container(height: 24, width: 1, color: Colors.grey, margin: const EdgeInsets.symmetric(horizontal: 8)),
    SvgPicture.asset(
      Ux4gIcons.union, 
      height: 24,
      colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Colors.white : Ux4gPalette.primary500, BlendMode.srcIn),
    ),
  ],
  actions: [
    Ux4gAppHeaderAction(icon: Icons.view_in_ar_outlined, onPressed: () {}),
    Ux4gAppHeaderAction(
      customWidget: Container(
        margin: const EdgeInsets.only(left: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 40,
        height: 40,
        child: const Icon(Icons.menu, size: 20),
      ),
    ),
  ],
);''',
        center: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ux4gAppHeader(
              title: 'Title',
              variant: Ux4gAppHeaderVariant.light,
              useSafeArea: false,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Ux4gPalette.neutral900,
                    BlendMode.srcIn,
                  ),
                ),
                Container(
                  height: 24,
                  width: 1,
                  color: Colors.grey.withValues(alpha: 0.5),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),
                SvgPicture.asset(
                  Ux4gIcons.union,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Ux4gPalette.primary500,
                    BlendMode.srcIn,
                  ),
                ),
              ],
              actions: [
                Ux4gAppHeaderAction(
                  icon: Icons.view_in_ar_outlined,
                  onPressed: () {},
                ),
              ],
              showAvatar: true,
              avatarInitials: 'JD',
            ),
            const SizedBox(height: 16),
            Ux4gAppHeader(
              title: 'Title',
              variant: Ux4gAppHeaderVariant.light,
              useSafeArea: false,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Ux4gPalette.neutral900,
                    BlendMode.srcIn,
                  ),
                ),
                Container(
                  height: 24,
                  width: 1,
                  color: Colors.grey.withValues(alpha: 0.5),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),
                SvgPicture.asset(
                  Ux4gIcons.union,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Ux4gPalette.primary500,
                    BlendMode.srcIn,
                  ),
                ),
              ],
              actions: [
                Ux4gAppHeaderAction(
                  icon: Icons.view_in_ar_outlined,
                  onPressed: () {},
                ),
                Ux4gAppHeaderAction(
                  customWidget: Container(
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.3),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 40,
                    height: 40,
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black87,
                      iconSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'All variants',
      builder: (context) => ComponentDocs(
        name: 'AppHeader — Variants',
        description: 'All three visual variants side by side.',
        code: '''// Light Variant
Ux4gAppHeader(
  title: 'Light',
  variant: Ux4gAppHeaderVariant.light,
  actions: [
    Ux4gAppHeaderAction(
      icon: Icons.notifications_outlined,
      onPressed: () {},
    ),
  ],
);

// Filled Variant
Ux4gAppHeader(
  title: 'Filled',
  variant: Ux4gAppHeaderVariant.filled,
  actions: [
    Ux4gAppHeaderAction(
      icon: Icons.notifications_outlined,
      onPressed: () {},
    ),
  ],
);

// Outlined Variant
Ux4gAppHeader(
  title: 'Outlined',
  variant: Ux4gAppHeaderVariant.outlined,
  actions: [
    Ux4gAppHeaderAction(
      icon: Icons.notifications_outlined,
      onPressed: () {},
    ),
  ],
);''',
        center: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: Ux4gAppHeaderVariant.values
              .map(
                (v) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Ux4gAppHeader(
                    title: '${v.name[0].toUpperCase()}${v.name.substring(1)}',
                    variant: v,
                    useSafeArea: false,
                    actions: [
                      Ux4gAppHeaderAction(
                        icon: Icons.notifications_outlined,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ),
  ],
);
