import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../foundation/colors.dart';
import '../foundation/dimensions.dart';
import '../foundation/icons.dart';
import '../foundation/typography.dart';
import 'buttons.dart';
import 'divider.dart';

/// Position of the side menu / drawer: left or right.
enum Ux4gSideMenuPosition { left, right }

/// Type of header rendered at the top of the side menu.
enum Ux4gSideMenuHeaderType {
  /// Standard government / department header with Emblem/logo, Title, Subtitle, and Close button.
  standard,

  /// Compact horizontal user profile header with Avatar initials, Name, Subtitle, and Close button.
  compactUser,

  /// Prominent centered user profile header with large Avatar, Name, Role, Metadata text,
  /// Action button ("View profile"), and Close button.
  prominentUser,

  /// Plain title/subtitle header (e.g. Department Switcher header).
  plain,

  /// Custom header widget provided by the developer.
  custom,
}

// ─── DATA MODELS ─────────────────────────────────────────────────────────────

/// Model representing a single item (or parent with nested children) in [Ux4gSideMenu].
class Ux4gSideMenuItem {
  /// Unique key for the item.
  final String key;

  /// Display text label.
  final String label;

  /// Leading icon (can be [IconData], [Widget], or [String] asset path).
  final dynamic icon;

  /// Optional subtitle / description text (e.g. "Current department" or "transport.up.gov.in").
  final String? subtitle;

  /// Numeric or string badge counter/label displayed on the right.
  final dynamic badge;

  /// Custom background color for the badge pill.
  final Color? badgeColor;

  /// Custom text color for the badge pill.
  final Color? badgeTextColor;

  /// Optional highlight tag pill (e.g. "3 applications pending").
  final String? tag;

  /// Tag background color.
  final Color? tagColor;

  /// Tag text color.
  final Color? tagTextColor;

  /// Optional avatar initials (e.g. "RD", "TD") for department/profile card items.
  final String? avatarInitials;

  /// Optional avatar background color.
  final Color? avatarColor;

  /// Optional avatar text color.
  final Color? avatarTextColor;

  /// Custom trailing widget (e.g. checkmark icon).
  final Widget? trailing;

  /// Whether this item is disabled.
  final bool disabled;

  /// Tap callback for this specific item.
  final VoidCallback? onTap;

  /// Nested sub-items rendered as a hierarchical collapsible tree with vertical connector guide line.
  final List<Ux4gSideMenuItem>? children;

  /// Whether child items are initially expanded.
  final bool defaultExpanded;

  /// Whether to render this item as an elevated/outlined card tile (useful for Department selectors).
  final bool isCard;

  /// Accessibility semantic label.
  final String? semanticLabel;

  /// Optional custom widget to completely override the default item layout.
  final Widget? customContent;

  const Ux4gSideMenuItem({
    required this.key,
    required this.label,
    this.icon,
    this.subtitle,
    this.badge,
    this.badgeColor,
    this.badgeTextColor,
    this.tag,
    this.tagColor,
    this.tagTextColor,
    this.avatarInitials,
    this.avatarColor,
    this.avatarTextColor,
    this.trailing,
    this.disabled = false,
    this.onTap,
    this.children,
    this.defaultExpanded = false,
    this.isCard = false,
    this.semanticLabel,
    this.customContent,
  });

  Ux4gSideMenuItem copyWith({
    String? key,
    String? label,
    dynamic icon,
    String? subtitle,
    dynamic badge,
    Color? badgeColor,
    Color? badgeTextColor,
    String? tag,
    Color? tagColor,
    Color? tagTextColor,
    String? avatarInitials,
    Color? avatarColor,
    Color? avatarTextColor,
    Widget? trailing,
    bool? disabled,
    VoidCallback? onTap,
    List<Ux4gSideMenuItem>? children,
    bool? defaultExpanded,
    bool? isCard,
    String? semanticLabel,
    Widget? customContent,
  }) {
    return Ux4gSideMenuItem(
      key: key ?? this.key,
      label: label ?? this.label,
      icon: icon ?? this.icon,
      subtitle: subtitle ?? this.subtitle,
      badge: badge ?? this.badge,
      badgeColor: badgeColor ?? this.badgeColor,
      badgeTextColor: badgeTextColor ?? this.badgeTextColor,
      tag: tag ?? this.tag,
      tagColor: tagColor ?? this.tagColor,
      tagTextColor: tagTextColor ?? this.tagTextColor,
      avatarInitials: avatarInitials ?? this.avatarInitials,
      avatarColor: avatarColor ?? this.avatarColor,
      avatarTextColor: avatarTextColor ?? this.avatarTextColor,
      trailing: trailing ?? this.trailing,
      disabled: disabled ?? this.disabled,
      onTap: onTap ?? this.onTap,
      children: children ?? this.children,
      defaultExpanded: defaultExpanded ?? this.defaultExpanded,
      isCard: isCard ?? this.isCard,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      customContent: customContent ?? this.customContent,
    );
  }
}

/// Model representing a group/section of items in [Ux4gSideMenu].
class Ux4gSideMenuSection {
  /// Optional unique key for the section.
  final String? key;

  /// Section header title (e.g. 'SERVICES', 'ACCOUNT', 'FOLDERS', 'MAILBOX').
  final String? title;

  /// Items belonging to this section.
  final List<Ux4gSideMenuItem> items;

  /// Optional action link text rendered next to or under the section (e.g. 'Customize inbox').
  final String? actionText;

  /// Callback when [actionText] is tapped.
  final VoidCallback? onActionTap;

  /// Optional custom header widget for this section.
  final Widget? customHeader;

  /// Optional custom footer widget for this section.
  final Widget? customFooter;

  const Ux4gSideMenuSection({
    this.key,
    this.title,
    required this.items,
    this.actionText,
    this.onActionTap,
    this.customHeader,
    this.customFooter,
  });

  Ux4gSideMenuSection copyWith({
    String? key,
    String? title,
    List<Ux4gSideMenuItem>? items,
    String? actionText,
    VoidCallback? onActionTap,
    Widget? customHeader,
    Widget? customFooter,
  }) {
    return Ux4gSideMenuSection(
      key: key ?? this.key,
      title: title ?? this.title,
      items: items ?? this.items,
      actionText: actionText ?? this.actionText,
      onActionTap: onActionTap ?? this.onActionTap,
      customHeader: customHeader ?? this.customHeader,
      customFooter: customFooter ?? this.customFooter,
    );
  }
}

/// Model representing an action-required banner / card inside the side menu.
class Ux4gSideMenuActionCard {
  /// Category / Tag label above the title (defaults to "ACTION REQUIRED").
  final String tag;

  /// Main title text (e.g. "Verify your Aadhaar").
  final String title;

  /// Description text (e.g. "Complete identity verification to continue.").
  final String description;

  /// Call-to-action button text (e.g. "Verify now").
  final String buttonText;

  /// Callback when the action button is tapped.
  final VoidCallback? onButtonPressed;

  /// Custom background color for the banner (defaults to warm cream/amber `#FFF7E6`).
  final Color? backgroundColor;

  /// Custom border color.
  final Color? borderColor;

  /// Custom content widget replacing the default banner layout.
  final Widget? customContent;

  const Ux4gSideMenuActionCard({
    this.tag = 'ACTION REQUIRED',
    required this.title,
    required this.description,
    this.buttonText = 'Verify now',
    this.onButtonPressed,
    this.backgroundColor,
    this.borderColor,
    this.customContent,
  });
}

/// Model representing the bottom branding block (e.g. Emblem + Department Name + Division).
class Ux4gSideMenuBottomBranding {
  /// Logo / Emblem (Widget, Image path, or null for default National Emblem).
  final dynamic logo;

  /// Department / Organization title (e.g. "Revenue Department").
  final String title;

  /// Subtitle (e.g. "Kanpur division" or "Government of India").
  final String? subtitle;

  /// Tap callback.
  final VoidCallback? onTap;

  const Ux4gSideMenuBottomBranding({
    this.logo,
    required this.title,
    this.subtitle,
    this.onTap,
  });
}

// ─── MAIN COMPONENT ──────────────────────────────────────────────────────────

/// **Ux4gSideMenu** (also available as **[Ux4gDrawer]**)
///
/// Fully configurable, accessible, and responsive navigation drawer / side menu component
/// built strictly to UX4G Design System guidelines.
///
/// ### Features:
/// - 5 Rich Visual Presets & custom configurations:
///   1. Standard Navigation (Emblem, Search, Accordion Tree with connector line, Badges, Footer Sign out)
///   2. Officer Inbox (User header, Mailbox, Folders, Action link, Inbox settings, Bottom branding)
///   3. Profile Menu (Prominent centered avatar, Role, Status metadata, Outlined action button, App sections)
///   4. Action Banner Mode (Action Required card with primary CTA button)
///   5. Department Switcher (Department card tiles with avatar initials, checkmark, and pending tags)
/// - Collapsible Sub-menu Navigation Tree with vertical connecting line
/// - Integrated Search bar with real-time auto-filtering across parents and children
/// - Responsive drawer width & smooth slide animation
/// - Dark & Light mode support
class Ux4gSideMenu extends StatefulWidget {
  /// Whether the drawer is open. When used inside a Scaffold or standalone, defaults to true.
  final bool isOpen;

  /// Callback invoked when close button or backdrop is tapped.
  final VoidCallback? onClose;

  /// Open position: [Ux4gSideMenuPosition.left] (default) or [Ux4gSideMenuPosition.right].
  final Ux4gSideMenuPosition position;

  /// Custom drawer width in pixels (defaults to responsive `math.min(screenWidth * 0.82, 340)`).
  final double? width;

  // ── Header Configuration ──
  /// Header style type. Defaults to [Ux4gSideMenuHeaderType.standard].
  final Ux4gSideMenuHeaderType headerType;

  /// Title rendered in header (default: 'Revenue Department').
  final String title;

  /// Subtitle rendered in header (default: 'Government of India').
  final String? subtitle;

  /// Logo or Emblem widget / asset path. Defaults to UX4G National Emblem.
  final dynamic logo;

  /// User avatar initials (e.g. 'RK', 'RD') used when [headerType] is [Ux4gSideMenuHeaderType.compactUser] or [Ux4gSideMenuHeaderType.prominentUser].
  final String? avatarInitials;

  /// User avatar image URL.
  final String? avatarImageUrl;

  /// User avatar container color.
  final Color? avatarColor;

  /// User avatar text color.
  final Color? avatarTextColor;

  /// Metadata string shown in prominent user header (e.g. '12 applications · 3 actions required').
  final String? userMetaText;

  /// Action button label shown in prominent user header (e.g. 'View profile').
  final String? userActionButtonText;

  /// Callback when user header action button is tapped.
  final VoidCallback? onUserActionButtonPressed;

  /// Whether to display the top right close '✕' button. Defaults to `true`.
  final bool showCloseButton;

  /// Completely custom header widget. Overrides default header when provided.
  final Widget? customHeader;

  /// Whether to show a divider under the header. Defaults to `true`.
  final bool showHeaderDivider;

  // ── Search Configuration ──
  /// Whether to display the search input bar. Defaults to `true`.
  final bool showSearch;

  /// Search input placeholder text. Defaults to `'Search for...'`.
  final String searchPlaceholder;

  /// Controlled search query string.
  final String? searchQuery;

  /// Callback fired when search query changes.
  final ValueChanged<String>? onSearchChanged;

  /// Whether to automatically filter menu items as the user types in the search bar. Defaults to `true`.
  final bool autoFilterOnSearch;

  // ── Sections & Navigation Items ──
  /// Grouped sections of navigation items.
  final List<Ux4gSideMenuSection>? sections;

  /// Flat list of navigation items (used if [sections] is not provided).
  final List<Ux4gSideMenuItem>? items;

  /// Currently selected item key (controlled selection).
  final String? selectedKey;

  /// Default selected item key for uncontrolled selection (defaults to `'dashboard'`).
  final String? defaultSelectedKey;

  /// Callback triggered when any item is pressed.
  final ValueChanged<Ux4gSideMenuItem>? onItemSelected;

  // ── Action Banner / Card ──
  /// Optional prominent callout / action-required card rendered above the footer.
  final Ux4gSideMenuActionCard? actionCard;

  // ── Footer Configuration ──
  /// Footer navigation items (rendered above or instead of sign out).
  final List<Ux4gSideMenuItem>? footerItems;

  /// Whether to show the default Sign out item in the footer. Defaults to `true`.
  final bool showSignOut;

  /// Label for the Sign out button. Defaults to `'Sign out'`.
  final String signOutLabel;

  /// Callback when Sign out is pressed.
  final VoidCallback? onSignOut;

  /// Optional bottom branding section (e.g. National Emblem + Division).
  final Ux4gSideMenuBottomBranding? bottomBranding;

  /// Custom footer widget. Overrides default footer when provided.
  final Widget? customFooter;

  /// Whether to show a divider line above the footer. Defaults to `true`.
  final bool showFooterDivider;

  // ── Appearance & Theme ──
  /// Background color of the side menu panel. Defaults to theme surface color.
  final Color? backgroundColor;

  /// Background color for selected / active item. Defaults to subtle primary tint or neutral100.
  final Color? activeItemBackgroundColor;

  /// Color for active item text and icon. Defaults to theme primary/neutral1000.
  final Color? activeItemColor;

  /// Color for inactive item text and icon. Defaults to theme neutral800/neutral400.
  final Color? inactiveItemColor;

  /// Border color for dividers, search input, and sub-item tree guide line.
  final Color? borderColor;

  /// Background color for the backdrop scrim. Defaults to `rgba(0, 0, 0, 0.5)`.
  final Color? scrimColor;

  /// Whether tapping the backdrop closes the side menu. Defaults to `true`.
  final bool closeOnBackdropTap;

  /// Whether to wrap content inside [SafeArea]. Defaults to `true`.
  final bool useSafeArea;

  /// Elevation depth for the drawer container. Defaults to `16.0`.
  final double elevation;

  /// Custom padding inside the scrollable content body.
  final EdgeInsetsGeometry? contentPadding;

  const Ux4gSideMenu({
    super.key,
    this.isOpen = true,
    this.onClose,
    this.position = Ux4gSideMenuPosition.left,
    this.width,
    this.headerType = Ux4gSideMenuHeaderType.standard,
    this.title = 'Revenue Department',
    this.subtitle = 'Government of India',
    this.logo,
    this.avatarInitials,
    this.avatarImageUrl,
    this.avatarColor,
    this.avatarTextColor,
    this.userMetaText,
    this.userActionButtonText = 'View profile',
    this.onUserActionButtonPressed,
    this.showCloseButton = true,
    this.customHeader,
    this.showHeaderDivider = true,
    this.showSearch = true,
    this.searchPlaceholder = 'Search for...',
    this.searchQuery,
    this.onSearchChanged,
    this.autoFilterOnSearch = true,
    this.sections,
    this.items,
    this.selectedKey,
    this.defaultSelectedKey = 'dashboard',
    this.onItemSelected,
    this.actionCard,
    this.footerItems,
    this.showSignOut = true,
    this.signOutLabel = 'Sign out',
    this.onSignOut,
    this.bottomBranding,
    this.customFooter,
    this.showFooterDivider = true,
    this.backgroundColor,
    this.activeItemBackgroundColor,
    this.activeItemColor,
    this.inactiveItemColor,
    this.borderColor,
    this.scrimColor,
    this.closeOnBackdropTap = true,
    this.useSafeArea = true,
    this.elevation = 16.0,
    this.contentPadding,
  });

  /// Helper static method to open an animated slide-out UX4G Side Menu modal.
  static Future<T?> show<T>(
    BuildContext context, {
    Ux4gSideMenuPosition position = Ux4gSideMenuPosition.left,
    double? width,
    Ux4gSideMenuHeaderType headerType = Ux4gSideMenuHeaderType.standard,
    String title = 'Revenue Department',
    String? subtitle = 'Government of India',
    dynamic logo,
    String? avatarInitials,
    String? avatarImageUrl,
    Color? avatarColor,
    Color? avatarTextColor,
    String? userMetaText,
    String? userActionButtonText = 'View profile',
    VoidCallback? onUserActionButtonPressed,
    bool showCloseButton = true,
    Widget? customHeader,
    bool showHeaderDivider = true,
    bool showSearch = true,
    String searchPlaceholder = 'Search for...',
    String? searchQuery,
    ValueChanged<String>? onSearchChanged,
    bool autoFilterOnSearch = true,
    List<Ux4gSideMenuSection>? sections,
    List<Ux4gSideMenuItem>? items,
    String? selectedKey,
    String? defaultSelectedKey = 'dashboard',
    ValueChanged<Ux4gSideMenuItem>? onItemSelected,
    Ux4gSideMenuActionCard? actionCard,
    List<Ux4gSideMenuItem>? footerItems,
    bool showSignOut = true,
    String signOutLabel = 'Sign out',
    VoidCallback? onSignOut,
    Ux4gSideMenuBottomBranding? bottomBranding,
    Widget? customFooter,
    bool showFooterDivider = true,
    Color? backgroundColor,
    Color? activeItemBackgroundColor,
    Color? activeItemColor,
    Color? inactiveItemColor,
    Color? borderColor,
    Color? scrimColor,
    bool closeOnBackdropTap = true,
    bool useSafeArea = true,
    double elevation = 16.0,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: closeOnBackdropTap,
      barrierLabel: 'Dismiss Side Menu',
      barrierColor: scrimColor ?? const Color(0x80000000),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return Align(
          alignment: position == Ux4gSideMenuPosition.left
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Ux4gSideMenu(
              isOpen: true,
              onClose: () => Navigator.of(dialogContext).pop(),
              position: position,
              width: width,
              headerType: headerType,
              title: title,
              subtitle: subtitle,
              logo: logo,
              avatarInitials: avatarInitials,
              avatarImageUrl: avatarImageUrl,
              avatarColor: avatarColor,
              avatarTextColor: avatarTextColor,
              userMetaText: userMetaText,
              userActionButtonText: userActionButtonText,
              onUserActionButtonPressed: onUserActionButtonPressed,
              showCloseButton: showCloseButton,
              customHeader: customHeader,
              showHeaderDivider: showHeaderDivider,
              showSearch: showSearch,
              searchPlaceholder: searchPlaceholder,
              searchQuery: searchQuery,
              onSearchChanged: onSearchChanged,
              autoFilterOnSearch: autoFilterOnSearch,
              sections: sections,
              items: items,
              selectedKey: selectedKey,
              defaultSelectedKey: defaultSelectedKey,
              onItemSelected: onItemSelected,
              actionCard: actionCard,
              footerItems: footerItems,
              showSignOut: showSignOut,
              signOutLabel: signOutLabel,
              onSignOut: onSignOut,
              bottomBranding: bottomBranding,
              customFooter: customFooter,
              showFooterDivider: showFooterDivider,
              backgroundColor: backgroundColor,
              activeItemBackgroundColor: activeItemBackgroundColor,
              activeItemColor: activeItemColor,
              inactiveItemColor: inactiveItemColor,
              borderColor: borderColor,
              scrimColor: scrimColor,
              closeOnBackdropTap: closeOnBackdropTap,
              useSafeArea: useSafeArea,
              elevation: elevation,
              contentPadding: contentPadding,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        final offsetTween = position == Ux4gSideMenuPosition.left
            ? Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            : Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);

        return SlideTransition(
          position: offsetTween.animate(curve),
          child: child,
        );
      },
    );
  }

  @override
  State<Ux4gSideMenu> createState() => _Ux4gSideMenuState();
}

class _Ux4gSideMenuState extends State<Ux4gSideMenu> {
  late TextEditingController _searchController;
  late String _internalSelectedKey;
  late Map<String, bool> _expandedKeys;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery ?? '');
    _internalSelectedKey = widget.defaultSelectedKey ?? 'dashboard';
    _expandedKeys = {};
    _initExpandedState();
  }

  @override
  void didUpdateWidget(covariant Ux4gSideMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchQuery != null &&
        widget.searchQuery != _searchController.text) {
      _searchController.text = widget.searchQuery!;
    }
    if (widget.selectedKey != null &&
        widget.selectedKey != _internalSelectedKey) {
      _internalSelectedKey = widget.selectedKey!;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _initExpandedState() {
    final activeSections = _resolveSections();
    for (final section in activeSections) {
      for (final item in section.items) {
        if (item.children != null && item.children!.isNotEmpty) {
          _expandedKeys[item.key] = item.defaultExpanded || item.key == 'applications';
        }
      }
    }
  }

  List<Ux4gSideMenuSection> _getDefaultSections() {
    return [
      Ux4gSideMenuSection(
        key: 'services-section',
        title: 'SERVICES',
        items: [
          const Ux4gSideMenuItem(
            key: 'dashboard',
            label: 'Dashboard',
            icon: Icons.grid_view_rounded,
          ),
          const Ux4gSideMenuItem(
            key: 'applications',
            label: 'Applications',
            icon: Icons.assignment_outlined,
            defaultExpanded: true,
            children: [
              Ux4gSideMenuItem(
                key: 'applications-in-progress',
                label: 'In progress',
                icon: Icons.assignment_outlined,
              ),
              Ux4gSideMenuItem(
                key: 'applications-approved',
                label: 'Approved',
                icon: Icons.assignment_outlined,
              ),
            ],
          ),
          Ux4gSideMenuItem(
            key: 'notifications',
            label: 'Notifications',
            icon: Icons.notifications_none_outlined,
            badge: 3,
            badgeColor: Ux4gColors.primary600,
            badgeTextColor: Ux4gColors.white,
          ),
        ],
      ),
      const Ux4gSideMenuSection(
        key: 'account-section',
        title: 'ACCOUNT',
        items: [
          Ux4gSideMenuItem(
            key: 'my-account',
            label: 'My account',
            icon: Icons.account_circle_outlined,
          ),
          Ux4gSideMenuItem(
            key: 'help-support',
            label: 'Help & support',
            icon: Icons.help_outline_rounded,
          ),
        ],
      ),
    ];
  }

  List<Ux4gSideMenuSection> _resolveSections() {
    if (widget.sections != null && widget.sections!.isNotEmpty) {
      return widget.sections!;
    }
    if (widget.items != null && widget.items!.isNotEmpty) {
      return [
        Ux4gSideMenuSection(key: 'main-section', items: widget.items!),
      ];
    }
    return _getDefaultSections();
  }

  List<Ux4gSideMenuSection> _filterSections(List<Ux4gSideMenuSection> sections) {
    if (!widget.autoFilterOnSearch || _searchController.text.trim().isEmpty) {
      return sections;
    }
    final query = _searchController.text.toLowerCase().trim();

    return sections
        .map((section) {
          final matchingItems = section.items
              .map((item) {
                final matchesParent =
                    item.label.toLowerCase().contains(query) ||
                    (item.subtitle?.toLowerCase().contains(query) ?? false);
                final matchingChildren = item.children?.where((child) {
                  return child.label.toLowerCase().contains(query) ||
                      (child.subtitle?.toLowerCase().contains(query) ?? false);
                }).toList();

                if (matchesParent) {
                  return item;
                }
                if (matchingChildren != null && matchingChildren.isNotEmpty) {
                  return item.copyWith(children: matchingChildren);
                }
                return null;
              })
              .whereType<Ux4gSideMenuItem>()
              .toList();

          return section.copyWith(items: matchingItems);
        })
        .where((section) => section.items.isNotEmpty)
        .toList();
  }

  void _handleItemTap(Ux4gSideMenuItem item) {
    if (item.disabled) return;

    if (item.children != null && item.children!.isNotEmpty) {
      setState(() {
        _expandedKeys[item.key] = !(_expandedKeys[item.key] ?? false);
      });
      return;
    }

    setState(() {
      _internalSelectedKey = item.key;
    });

    item.onTap?.call();
    widget.onItemSelected?.call(item);
  }

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();
    final isDark = materialTheme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final resolvedWidth = widget.width ?? math.min(screenWidth * 0.82, 340.0);

    final resolvedBg = widget.backgroundColor ??
        (isDark ? Ux4gColors.neutral900 : (ux4gColors?.surface ?? Ux4gColors.white));

    final resolvedBorder = widget.borderColor ??
        (isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200);

    final resolvedActiveBg = widget.activeItemBackgroundColor ??
        (isDark ? Ux4gColors.primary900.withValues(alpha: 0.35) : Ux4gColors.neutral100);

    final resolvedActiveFg = widget.activeItemColor ??
        (isDark ? Ux4gColors.primary300 : Ux4gColors.neutral1000black);

    final resolvedInactiveFg = widget.inactiveItemColor ??
        (isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral800);

    final resolvedSectionTitleColor =
        isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral600;

    final effectiveSections = _filterSections(_resolveSections());

    Widget content = Container(
      width: resolvedWidth,
      height: double.infinity,
      decoration: BoxDecoration(
        color: resolvedBg,
        border: Border(
          right: widget.position == Ux4gSideMenuPosition.left
              ? BorderSide(color: resolvedBorder, width: 0.5)
              : BorderSide.none,
          left: widget.position == Ux4gSideMenuPosition.right
              ? BorderSide(color: resolvedBorder, width: 0.5)
              : BorderSide.none,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.12),
            blurRadius: widget.elevation,
            offset: Offset(
              widget.position == Ux4gSideMenuPosition.left ? 4 : -4,
              0,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── 1. HEADER ──
          _buildHeader(
            context,
            ux4gTypography,
            resolvedActiveFg,
            resolvedInactiveFg,
            resolvedSectionTitleColor,
            resolvedBorder,
            isDark,
          ),

          // ── 2. SEARCH BAR ──
          if (widget.showSearch)
            _buildSearchBar(
              context,
              ux4gTypography,
              resolvedActiveFg,
              resolvedSectionTitleColor,
              resolvedBorder,
              isDark,
            ),

          // ── 3. SCROLLABLE BODY ──
          Expanded(
            child: ListView(
              padding: widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              physics: const ClampingScrollPhysics(),
              children: [
                for (final section in effectiveSections)
                  _buildSection(
                    section,
                    ux4gTypography,
                    resolvedActiveBg,
                    resolvedActiveFg,
                    resolvedInactiveFg,
                    resolvedSectionTitleColor,
                    resolvedBorder,
                    isDark,
                  ),

                if (effectiveSections.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        'No matching options found',
                        style: (ux4gTypography?.bS_default ??
                                const TextStyle(fontSize: 13))
                            .copyWith(color: resolvedSectionTitleColor),
                      ),
                    ),
                  ),

                // ── Action Required Card (if provided) ──
                if (widget.actionCard != null) ...[
                  const SizedBox(height: 12),
                  _buildActionCard(
                    widget.actionCard!,
                    ux4gTypography,
                    isDark,
                  ),
                ],
              ],
            ),
          ),

          // ── 4. FOOTER / SIGN OUT / BRANDING ──
          _buildFooter(
            context,
            ux4gTypography,
            resolvedActiveBg,
            resolvedActiveFg,
            resolvedInactiveFg,
            resolvedSectionTitleColor,
            resolvedBorder,
            isDark,
          ),
        ],
      ),
    );

    if (widget.useSafeArea) {
      content = SafeArea(child: content);
    }

    return content;
  }

  // ─── HEADER BUILDERS ───────────────────────────────────────────────────────

  Widget _buildHeader(
    BuildContext context,
    Ux4gTypography? typography,
    Color activeFg,
    Color inactiveFg,
    Color sectionTitleColor,
    Color borderColor,
    bool isDark,
  ) {
    if (widget.customHeader != null) {
      return widget.customHeader!;
    }

    Widget headerContent;

    switch (widget.headerType) {
      case Ux4gSideMenuHeaderType.compactUser:
        headerContent = _buildCompactUserHeader(
          typography,
          activeFg,
          sectionTitleColor,
          isDark,
        );
        break;

      case Ux4gSideMenuHeaderType.prominentUser:
        headerContent = _buildProminentUserHeader(
          typography,
          activeFg,
          sectionTitleColor,
          isDark,
        );
        break;

      case Ux4gSideMenuHeaderType.plain:
        headerContent = _buildPlainHeader(
          typography,
          activeFg,
          sectionTitleColor,
        );
        break;

      case Ux4gSideMenuHeaderType.standard:
      default:
        headerContent = _buildStandardGovHeader(
          typography,
          activeFg,
          sectionTitleColor,
          isDark,
        );
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        headerContent,
        if (widget.showHeaderDivider)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Ux4gDivider(color: borderColor),
          ),
      ],
    );
  }

  Widget _buildStandardGovHeader(
    Ux4gTypography? typography,
    Color activeFg,
    Color subtitleColor,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Emblem / Logo
          _buildLogo(activeFg, isDark),
          const SizedBox(width: 12),

          // Titles
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: (typography?.hXXS_strong ??
                          const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ))
                      .copyWith(color: activeFg, letterSpacing: -0.2),
                ),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: (typography?.bXS_default ??
                            const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ))
                        .copyWith(color: subtitleColor),
                  ),
                ],
              ],
            ),
          ),

          // Close button
          if (widget.showCloseButton) _buildCloseButton(activeFg),
        ],
      ),
    );
  }

  Widget _buildCompactUserHeader(
    Ux4gTypography? typography,
    Color activeFg,
    Color subtitleColor,
    bool isDark,
  ) {
    final initials = widget.avatarInitials ??
        (widget.title.isNotEmpty
            ? widget.title
                .split(' ')
                .map((e) => e.isNotEmpty ? e[0] : '')
                .take(2)
                .join()
            : 'U');

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular Initials Avatar
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.avatarColor ??
                  (isDark ? Ux4gColors.primary900 : Ux4gColors.primary100),
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: TextStyle(
                color: widget.avatarTextColor ??
                    (isDark ? Ux4gColors.primary300 : Ux4gColors.primary700),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name and Email / Role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: (typography?.hXXS_strong ??
                          const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ))
                      .copyWith(color: activeFg),
                ),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: (typography?.bXS_default ??
                            const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ))
                        .copyWith(color: subtitleColor),
                  ),
                ],
              ],
            ),
          ),

          // Close button
          if (widget.showCloseButton) _buildCloseButton(activeFg),
        ],
      ),
    );
  }

  Widget _buildProminentUserHeader(
    Ux4gTypography? typography,
    Color activeFg,
    Color subtitleColor,
    bool isDark,
  ) {
    final initials = widget.avatarInitials ??
        (widget.title.isNotEmpty
            ? widget.title
                .split(' ')
                .map((e) => e.isNotEmpty ? e[0] : '')
                .take(2)
                .join()
            : 'U');

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Close Button row
          if (widget.showCloseButton)
            Align(
              alignment: Alignment.topRight,
              child: _buildCloseButton(activeFg),
            ),

          // Large Centered Avatar
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.avatarColor ??
                  (isDark ? Ux4gColors.primary900 : Ux4gColors.primary200),
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: TextStyle(
                color: widget.avatarTextColor ??
                    (isDark ? Ux4gColors.primary300 : Ux4gColors.primary800),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Name
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: (typography?.hS_strong ??
                    const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ))
                .copyWith(color: activeFg),
          ),

          // Subtitle / Role (e.g. "Citizen")
          if (widget.subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              widget.subtitle!,
              textAlign: TextAlign.center,
              style: (typography?.bS_default ??
                      const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ))
                  .copyWith(color: subtitleColor),
            ),
          ],

          // User Metadata (e.g. "12 applications · 3 actions required")
          if (widget.userMetaText != null) ...[
            const SizedBox(height: 4),
            Text(
              widget.userMetaText!,
              textAlign: TextAlign.center,
              style: (typography?.bXS_default ??
                      const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ))
                  .copyWith(color: subtitleColor),
            ),
          ],

          // Outlined Action Button (e.g. "View profile")
          if (widget.userActionButtonText != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 36,
              child: OutlinedButton(
                onPressed: widget.onUserActionButtonPressed ??
                    () => Navigator.of(context).maybePop(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Text(
                  widget.userActionButtonText!,
                  style: TextStyle(
                    color: activeFg,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPlainHeader(
    Ux4gTypography? typography,
    Color activeFg,
    Color subtitleColor,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: (typography?.hS_strong ??
                          const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ))
                      .copyWith(color: activeFg),
                ),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    widget.subtitle!,
                    style: (typography?.bS_default ??
                            const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ))
                        .copyWith(color: subtitleColor),
                  ),
                ],
              ],
            ),
          ),
          if (widget.showCloseButton) _buildCloseButton(activeFg),
        ],
      ),
    );
  }

  Widget _buildCloseButton(Color color) {
    return InkWell(
      onTap: widget.onClose ?? () => Navigator.of(context).maybePop(),
      borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Icon(Icons.close, size: 20, color: color),
      ),
    );
  }

  Widget _buildLogo(Color activeFg, bool isDark) {
    if (widget.logo != null) {
      if (widget.logo is Widget) return widget.logo as Widget;
      if (widget.logo is String) {
        final path = widget.logo as String;
        if (path.endsWith('.svg')) {
          return SvgPicture.asset(
            path,
            width: 32,
            height: 32,
            package: path.startsWith('packages/')
                ? null
                : Ux4gIcons.assetPackage,
          );
        }
        return Image.asset(path, width: 32, height: 32);
      }
    }

    // Default National Emblem SVG
    return SvgPicture.asset(
      'assets/icons/national_amblam_logo.svg',
      width: 32,
      height: 32,
      package: Ux4gIcons.assetPackage,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.account_balance_outlined,
          size: 28,
          color: activeFg,
        );
      },
    );
  }

  // ─── SEARCH BAR BUILDER ────────────────────────────────────────────────────

  Widget _buildSearchBar(
    BuildContext context,
    Ux4gTypography? typography,
    Color activeFg,
    Color hintColor,
    Color borderColor,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.white,
          borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
          border: Border.all(color: borderColor, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 18, color: hintColor),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: (text) {
                  setState(() {});
                  widget.onSearchChanged?.call(text);
                },
                style: (typography?.bS_default ??
                        const TextStyle(fontSize: 13))
                    .copyWith(color: activeFg),
                decoration: InputDecoration(
                  hintText: widget.searchPlaceholder,
                  hintStyle: TextStyle(
                    color: hintColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
            if (_searchController.text.isNotEmpty)
              InkWell(
                onTap: () {
                  _searchController.clear();
                  setState(() {});
                  widget.onSearchChanged?.call('');
                },
                borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(Icons.close, size: 16, color: hintColor),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ─── SECTION & ITEM BUILDERS ───────────────────────────────────────────────

  Widget _buildSection(
    Ux4gSideMenuSection section,
    Ux4gTypography? typography,
    Color activeBg,
    Color activeFg,
    Color inactiveFg,
    Color sectionTitleColor,
    Color borderColor,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Section Title
          if (section.title != null)
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 6, top: 4),
              child: Text(
                section.title!,
                style: (typography?.lS_strong ??
                        const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ))
                    .copyWith(
                      color: sectionTitleColor,
                      letterSpacing: 0.8,
                    ),
              ),
            ),

          if (section.customHeader != null) section.customHeader!,

          // Section Items
          for (final item in section.items)
            _buildMenuItem(
              item,
              typography,
              activeBg,
              activeFg,
              inactiveFg,
              sectionTitleColor,
              borderColor,
              isDark,
            ),

          // Section Action Text (e.g. "Customize inbox")
          if (section.actionText != null)
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 8),
              child: InkWell(
                onTap: section.onActionTap,
                borderRadius: BorderRadius.circular(Ux4gRadius.radius4),
                child: Text(
                  section.actionText!,
                  style: TextStyle(
                    color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          if (section.customFooter != null) section.customFooter!,
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    Ux4gSideMenuItem item,
    Ux4gTypography? typography,
    Color activeBg,
    Color activeFg,
    Color inactiveFg,
    Color sectionTitleColor,
    Color borderColor,
    bool isDark, {
    bool isSubItem = false,
  }) {
    if (item.customContent != null) {
      return item.customContent!;
    }

    final effectiveSelectedKey = widget.selectedKey ?? _internalSelectedKey;
    final isSelected = effectiveSelectedKey == item.key;
    final hasChildren = item.children != null && item.children!.isNotEmpty;
    final isExpanded = _expandedKeys[item.key] ?? false;

    // Card style item (used for Department Switcher variant)
    if (item.isCard) {
      return _buildDepartmentCardItem(
        item,
        isSelected,
        typography,
        activeBg,
        activeFg,
        inactiveFg,
        sectionTitleColor,
        borderColor,
        isDark,
      );
    }

    final fgColor = isSelected ? activeFg : inactiveFg;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          label: item.semanticLabel ?? item.label,
          selected: isSelected,
          button: true,
          child: Material(
            color: isSelected ? activeBg : Colors.transparent,
            borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
            child: InkWell(
              onTap: item.disabled ? null : () => _handleItemTap(item),
              borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
              child: Container(
                height: isSubItem ? 38 : 42,
                padding: EdgeInsets.symmetric(horizontal: isSubItem ? 8 : 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Item Icon
                    if (item.icon != null) ...[
                      Container(
                        width: 24,
                        alignment: Alignment.centerLeft,
                        child: _buildItemIcon(
                          item.icon,
                          fgColor,
                          isSubItem ? 17 : 19,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],

                    // Label
                    Expanded(
                      child: Text(
                        item.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: isSubItem ? 13 : 14,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                          color: fgColor,
                        ),
                      ),
                    ),

                    // Badge Pill (e.g. 3, 9, 8)
                    if (item.badge != null) ...[
                      const SizedBox(width: 8),
                      _buildBadgePill(item.badge, item.badgeColor, item.badgeTextColor, isDark),
                    ],

                    // Custom Trailing
                    if (item.trailing != null) ...[
                      const SizedBox(width: 6),
                      item.trailing!,
                    ],

                    // Accordion Expand/Collapse Chevron
                    if (hasChildren) ...[
                      const SizedBox(width: 4),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 18,
                        color: inactiveFg,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),

        // Sub-items Tree with Vertical Guide Line
        if (hasChildren && isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 2),
            child: Stack(
              children: [
                // Vertical Connector Line
                Positioned(
                  left: 0,
                  top: 4,
                  bottom: 8,
                  width: 1.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),

                // Sub-items indented
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final child in item.children!)
                        _buildMenuItem(
                          child,
                          typography,
                          activeBg,
                          activeFg,
                          inactiveFg,
                          sectionTitleColor,
                          borderColor,
                          isDark,
                          isSubItem: true,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // ─── DEPARTMENT CARD ITEM (Department Switcher Variant) ────────────────────

  Widget _buildDepartmentCardItem(
    Ux4gSideMenuItem item,
    bool isSelected,
    Ux4gTypography? typography,
    Color activeBg,
    Color activeFg,
    Color inactiveFg,
    Color sectionTitleColor,
    Color borderColor,
    bool isDark,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: isSelected
            ? (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral100)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
        child: InkWell(
          onTap: item.disabled ? null : () => _handleItemTap(item),
          borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
              border: Border.all(
                color: isSelected
                    ? (isDark ? Ux4gColors.primary400 : Ux4gColors.neutral300)
                    : Colors.transparent,
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar Initials Badge
                if (item.avatarInitials != null) ...[
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: item.avatarColor ??
                          (isDark ? Ux4gColors.primary900 : Ux4gColors.primary200),
                      borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      item.avatarInitials!,
                      style: TextStyle(
                        color: item.avatarTextColor ??
                            (isDark ? Ux4gColors.primary300 : Ux4gColors.primary800),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],

                // Titles & Tag
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: activeFg,
                        ),
                      ),
                      if (item.subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          item.subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: sectionTitleColor,
                          ),
                        ),
                      ],
                      if (item.tag != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: item.tagColor ??
                                (isDark
                                    ? Ux4gColors.secondary900
                                    : const Color(0xFFFFF0D9)),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            item.tag!,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: item.tagTextColor ??
                                  (isDark
                                      ? Ux4gColors.secondary300
                                      : const Color(0xFF9A5B00)),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Selected Checkmark or Trailing
                if (isSelected)
                  Icon(
                    Icons.check,
                    size: 20,
                    color: activeFg,
                  )
                else if (item.trailing != null)
                  item.trailing!,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ─── ACTION REQUIRED CARD BANNER ───────────────────────────────────────────

  Widget _buildActionCard(
    Ux4gSideMenuActionCard card,
    Ux4gTypography? typography,
    bool isDark,
  ) {
    if (card.customContent != null) {
      return card.customContent!;
    }

    final cardBg = card.backgroundColor ??
        (isDark ? Ux4gColors.neutral800 : const Color(0xFFFFF3D9));
    final cardBorder = card.borderColor ??
        (isDark ? Ux4gColors.neutral700 : const Color(0xFFFFE3A8));

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
        border: Border.all(color: cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tag / Header
          Text(
            card.tag,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral700,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),

          // Title
          Text(
            card.title,
            style: (typography?.hXXS_strong ??
                    const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ))
                .copyWith(
                  color: isDark ? Ux4gColors.white : Ux4gColors.neutral1000black,
                ),
          ),
          const SizedBox(height: 4),

          // Description
          Text(
            card.description,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isDark ? Ux4gColors.neutral300 : Ux4gColors.neutral800,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),

          // Action Button (Solid primary purple button)
          SizedBox(
            height: 36,
            child: Ux4gButton(
              onPressed: card.onButtonPressed ?? () {},
              text: card.buttonText,
              size: Ux4gButtonSize.small,
              backgroundColor:
                  isDark ? Ux4gColors.primary500 : Ux4gColors.primary600,
              contentColor: Ux4gColors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ─── FOOTER BUILDERS ───────────────────────────────────────────────────────

  Widget _buildFooter(
    BuildContext context,
    Ux4gTypography? typography,
    Color activeBg,
    Color activeFg,
    Color inactiveFg,
    Color sectionTitleColor,
    Color borderColor,
    bool isDark,
  ) {
    if (widget.customFooter != null) {
      return widget.customFooter!;
    }

    final hasFooterItems =
        widget.footerItems != null && widget.footerItems!.isNotEmpty;
    final hasSignOut = widget.showSignOut;
    final hasBranding = widget.bottomBranding != null;

    if (!hasFooterItems && !hasSignOut && !hasBranding) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.showFooterDivider)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Ux4gDivider(color: borderColor),
          ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Extra footer menu items (e.g. "Inbox settings" or "+ Request department access")
              if (hasFooterItems)
                for (final item in widget.footerItems!)
                  _buildMenuItem(
                    item,
                    typography,
                    activeBg,
                    activeFg,
                    inactiveFg,
                    sectionTitleColor,
                    borderColor,
                    isDark,
                  ),

              // Default Sign out button
              if (hasSignOut)
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                  child: InkWell(
                    onTap: widget.onSignOut ??
                        widget.onClose ??
                        () => Navigator.of(context).maybePop(),
                    borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                    child: Container(
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            size: 20,
                            color: inactiveFg,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.signOutLabel,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: inactiveFg,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // Bottom Branding (e.g. Emblem + Revenue Department + Division)
              if (hasBranding) ...[
                const SizedBox(height: 6),
                _buildBottomBranding(widget.bottomBranding!, activeFg, sectionTitleColor, isDark),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBranding(
    Ux4gSideMenuBottomBranding branding,
    Color activeFg,
    Color subtitleColor,
    bool isDark,
  ) {
    return InkWell(
      onTap: branding.onTap,
      borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            if (branding.logo is Widget)
              branding.logo as Widget
            else
              SvgPicture.asset(
                'assets/icons/national_amblam_logo.svg',
                width: 26,
                height: 26,
                package: Ux4gIcons.assetPackage,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.account_balance_outlined,
                  size: 24,
                  color: activeFg,
                ),
              ),
            const SizedBox(width: 10),

            // Titles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    branding.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: activeFg,
                    ),
                  ),
                  if (branding.subtitle != null) ...[
                    const SizedBox(height: 1),
                    Text(
                      branding.subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── HELPER WIDGETS ────────────────────────────────────────────────────────

  Widget _buildItemIcon(dynamic icon, Color color, double size) {
    if (icon is IconData) {
      return Icon(icon, size: size, color: color);
    }
    if (icon is Widget) {
      return SizedBox(width: size, height: size, child: icon);
    }
    if (icon is String) {
      if (icon.endsWith('.svg')) {
        return SvgPicture.asset(
          icon,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      }
      return Image.asset(icon, width: size, height: size);
    }
    return Icon(Icons.circle_outlined, size: size, color: color);
  }

  Widget _buildBadgePill(
    dynamic badge,
    Color? badgeColor,
    Color? badgeTextColor,
    bool isDark,
  ) {
    if (badge is Widget) return badge;

    final text = badge.toString();
    final isSingleDigit = text.length == 1;

    final resolvedBg = badgeColor ??
        (isDark ? Ux4gColors.primary500 : Ux4gColors.primary600);
    final resolvedFg = badgeTextColor ?? Ux4gColors.white;

    return Container(
      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      padding: EdgeInsets.symmetric(horizontal: isSingleDigit ? 0 : 6),
      decoration: BoxDecoration(
        color: resolvedBg,
        shape: isSingleDigit ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isSingleDigit ? null : BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: resolvedFg,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    );
  }
}

// ─── CONVENIENCE PRESETS / TEMPLATES ──────────────────────────────────────────

/// Ready-to-use template builders corresponding to standard UX4G application patterns.
class Ux4gSideMenuPresets {
  /// 1. Standard Government Navigation (Image 1)
  static Ux4gSideMenu standard({
    VoidCallback? onClose,
    ValueChanged<Ux4gSideMenuItem>? onItemSelected,
    VoidCallback? onSignOut,
    String? selectedKey,
  }) {
    return Ux4gSideMenu(
      title: 'Revenue Department',
      subtitle: 'Government of India',
      showSearch: true,
      selectedKey: selectedKey,
      onClose: onClose,
      onItemSelected: onItemSelected,
      onSignOut: onSignOut,
      sections: [
        Ux4gSideMenuSection(
          key: 'services',
          title: 'SERVICES',
          items: [
            const Ux4gSideMenuItem(
              key: 'dashboard',
              label: 'Dashboard',
              icon: Icons.grid_view_rounded,
            ),
            const Ux4gSideMenuItem(
              key: 'applications',
              label: 'Applications',
              icon: Icons.assignment_outlined,
              defaultExpanded: true,
              children: [
                Ux4gSideMenuItem(
                  key: 'applications-in-progress',
                  label: 'In progress',
                  icon: Icons.assignment_outlined,
                ),
                Ux4gSideMenuItem(
                  key: 'applications-approved',
                  label: 'Approved',
                  icon: Icons.assignment_outlined,
                ),
              ],
            ),
            Ux4gSideMenuItem(
              key: 'notifications',
              label: 'Notifications',
              icon: Icons.notifications_none_outlined,
              badge: 3,
              badgeColor: Ux4gColors.primary600,
            ),
          ],
        ),
        const Ux4gSideMenuSection(
          key: 'account',
          title: 'ACCOUNT',
          items: [
            Ux4gSideMenuItem(
              key: 'my-account',
              label: 'My account',
              icon: Icons.account_circle_outlined,
            ),
            Ux4gSideMenuItem(
              key: 'help-support',
              label: 'Help & support',
              icon: Icons.help_outline_rounded,
            ),
          ],
        ),
      ],
    );
  }

  /// 2. Officer Inbox Navigation (Image 2 left)
  static Ux4gSideMenu officerInbox({
    String name = 'Ramesh Kumar',
    String email = 'ramesh.kumar@gov.in',
    String division = 'Kanpur division',
    VoidCallback? onClose,
    ValueChanged<Ux4gSideMenuItem>? onItemSelected,
    VoidCallback? onCustomizeInbox,
    VoidCallback? onSignOut,
    String selectedKey = 'inbox',
  }) {
    return Ux4gSideMenu(
      headerType: Ux4gSideMenuHeaderType.compactUser,
      title: name,
      subtitle: email,
      showSearch: false,
      selectedKey: selectedKey,
      onClose: onClose,
      onItemSelected: onItemSelected,
      onSignOut: onSignOut,
      sections: [
        Ux4gSideMenuSection(
          key: 'mailbox',
          title: 'MAILBOX',
          items: [
            Ux4gSideMenuItem(
              key: 'inbox',
              label: 'Inbox',
              icon: Icons.mail_outline,
              badge: 9,
              badgeColor: Ux4gColors.primary600,
            ),
            const Ux4gSideMenuItem(
              key: 'assigned-to-me',
              label: 'Assigned to me',
              icon: Icons.assignment_ind_outlined,
            ),
          ],
        ),
        Ux4gSideMenuSection(
          key: 'folders',
          title: 'FOLDERS',
          actionText: 'Customize inbox',
          onActionTap: onCustomizeInbox,
          items: const [
            Ux4gSideMenuItem(
              key: 'sent',
              label: 'Sent',
              icon: Icons.arrow_outward,
            ),
            Ux4gSideMenuItem(
              key: 'drafts',
              label: 'Drafts',
              icon: Icons.edit_note_outlined,
            ),
            Ux4gSideMenuItem(
              key: 'archive',
              label: 'Archive',
              icon: Icons.layers_outlined,
            ),
            Ux4gSideMenuItem(
              key: 'rejected-applications',
              label: 'Rejected applications',
              icon: Icons.error_outline_rounded,
            ),
          ],
        ),
      ],
      footerItems: const [
        Ux4gSideMenuItem(
          key: 'inbox-settings',
          label: 'Inbox settings',
          icon: Icons.more_vert,
        ),
      ],
      showSignOut: false,
      bottomBranding: Ux4gSideMenuBottomBranding(
        title: 'Revenue Department',
        subtitle: division,
      ),
    );
  }

  /// 3. Citizen Profile Menu (Image 2 right)
  static Ux4gSideMenu citizenProfile({
    String name = 'Ramesh Kumar',
    String role = 'Citizen',
    String metaText = '12 applications · 3 actions required',
    VoidCallback? onViewProfile,
    VoidCallback? onClose,
    ValueChanged<Ux4gSideMenuItem>? onItemSelected,
    VoidCallback? onSignOut,
  }) {
    return Ux4gSideMenu(
      headerType: Ux4gSideMenuHeaderType.prominentUser,
      title: name,
      subtitle: role,
      userMetaText: metaText,
      userActionButtonText: 'View profile',
      onUserActionButtonPressed: onViewProfile,
      showSearch: false,
      onClose: onClose,
      onItemSelected: onItemSelected,
      onSignOut: onSignOut,
      sections: const [
        Ux4gSideMenuSection(
          key: 'account',
          title: 'ACCOUNT',
          items: [
            Ux4gSideMenuItem(
              key: 'profile-settings',
              label: 'Profile & settings',
              icon: Icons.account_circle_outlined,
            ),
            Ux4gSideMenuItem(
              key: 'saved-items',
              label: 'Saved items',
              icon: Icons.layers_outlined,
            ),
          ],
        ),
        Ux4gSideMenuSection(
          key: 'applications',
          title: 'APPLICATIONS',
          items: [
            Ux4gSideMenuItem(
              key: 'my-applications',
              label: 'My applications',
              icon: Icons.assignment_outlined,
            ),
            Ux4gSideMenuItem(
              key: 'track-application',
              label: 'Track an application',
              icon: Icons.location_on_outlined,
            ),
          ],
        ),
        Ux4gSideMenuSection(
          key: 'support',
          title: 'SUPPORT',
          items: [
            Ux4gSideMenuItem(
              key: 'help-support',
              label: 'Help & support',
              icon: Icons.help_outline_rounded,
            ),
          ],
        ),
      ],
      showSignOut: true,
    );
  }

  /// 4. Department Switcher Menu (Image 3 right)
  static Ux4gSideMenu departmentSwitcher({
    String title = 'Departments',
    String subtitle = 'Choose a department to work in.',
    String selectedDepartmentKey = 'dept-revenue',
    VoidCallback? onClose,
    ValueChanged<Ux4gSideMenuItem>? onSelectDepartment,
    VoidCallback? onRequestAccess,
    VoidCallback? onSettings,
    VoidCallback? onHelp,
  }) {
    return Ux4gSideMenu(
      headerType: Ux4gSideMenuHeaderType.plain,
      title: title,
      subtitle: subtitle,
      showSearch: false,
      selectedKey: selectedDepartmentKey,
      onClose: onClose,
      onItemSelected: onSelectDepartment,
      sections: [
        Ux4gSideMenuSection(
          items: [
            const Ux4gSideMenuItem(
              key: 'dept-revenue',
              label: 'Revenue Department',
              subtitle: 'Current department',
              avatarInitials: 'RD',
              isCard: true,
            ),
            const Ux4gSideMenuItem(
              key: 'dept-transport',
              label: 'Transport Department',
              subtitle: 'transport.up.gov.in',
              avatarInitials: 'TD',
              tag: '3 applications pending',
              isCard: true,
            ),
          ],
        ),
      ],
      footerItems: [
        Ux4gSideMenuItem(
          key: 'request-access',
          label: 'Request department access',
          icon: Icons.add,
          onTap: onRequestAccess,
        ),
        Ux4gSideMenuItem(
          key: 'settings',
          label: 'Settings',
          icon: Icons.more_vert,
          onTap: onSettings,
        ),
        Ux4gSideMenuItem(
          key: 'help',
          label: 'Help & support',
          icon: Icons.help_outline_rounded,
          onTap: onHelp,
        ),
      ],
      showSignOut: false,
    );
  }

  /// 5. Action Required & Workflows Menu (Image 3 left)
  static Ux4gSideMenu actionRequired({
    String title = 'Revenue Department',
    String subtitle = 'Kanpur division',
    VoidCallback? onClose,
    VoidCallback? onVerifyAadhaar,
    ValueChanged<Ux4gSideMenuItem>? onItemSelected,
  }) {
    return Ux4gSideMenu(
      title: title,
      subtitle: subtitle,
      showSearch: false,
      onClose: onClose,
      onItemSelected: onItemSelected,
      showSignOut: false,
      sections: [
        Ux4gSideMenuSection(
          key: 'services',
          title: 'SERVICES',
          items: [
            const Ux4gSideMenuItem(
              key: 'dashboard',
              label: 'Dashboard',
              icon: Icons.grid_view_rounded,
            ),
            const Ux4gSideMenuItem(
              key: 'applications',
              label: 'Applications',
              icon: Icons.assignment_outlined,
              defaultExpanded: true,
              children: [
                Ux4gSideMenuItem(
                  key: 'new-applications',
                  label: 'New applications',
                ),
                Ux4gSideMenuItem(
                  key: 'under-review',
                  label: 'Under review',
                ),
                Ux4gSideMenuItem(
                  key: 'approved-applications',
                  label: 'Approved applications',
                ),
              ],
            ),
            Ux4gSideMenuItem(
              key: 'inbox',
              label: 'Inbox',
              icon: Icons.mail_outline,
              badge: 8,
              badgeColor: Ux4gColors.primary600,
            ),
          ],
        ),
        const Ux4gSideMenuSection(
          key: 'workspace',
          title: 'WORKSPACE',
          items: [
            Ux4gSideMenuItem(
              key: 'priority-applications',
              label: 'Priority applications',
              icon: Icons.priority_high_rounded,
            ),
            Ux4gSideMenuItem(
              key: 'archive',
              label: 'Archive',
              icon: Icons.layers_outlined,
            ),
          ],
        ),
      ],
      actionCard: Ux4gSideMenuActionCard(
        title: 'Verify your Aadhaar',
        description: 'Complete identity verification to continue.',
        buttonText: 'Verify now',
        onButtonPressed: onVerifyAadhaar,
      ),
    );
  }

  /// 6. Citizen Simple Profile Navigation (Image 4)
  static Ux4gSideMenu citizenSimple({
    String name = 'Ramesh Kumar',
    String role = 'Citizen',
    VoidCallback? onClose,
    ValueChanged<Ux4gSideMenuItem>? onItemSelected,
    VoidCallback? onSignOut,
  }) {
    return Ux4gSideMenu(
      headerType: Ux4gSideMenuHeaderType.compactUser,
      title: name,
      subtitle: role,
      showSearch: false,
      onClose: onClose,
      onItemSelected: onItemSelected,
      onSignOut: onSignOut,
      sections: [
        Ux4gSideMenuSection(
          items: [
            const Ux4gSideMenuItem(
              key: 'my-applications',
              label: 'My applications',
              icon: Icons.assignment_outlined,
            ),
            const Ux4gSideMenuItem(
              key: 'my-documents',
              label: 'My documents',
              icon: Icons.layers_outlined,
            ),
            Ux4gSideMenuItem(
              key: 'notifications',
              label: 'Notifications',
              icon: Icons.notifications_none_outlined,
              badge: 3,
              badgeColor: Ux4gColors.primary600,
            ),
          ],
        ),
        const Ux4gSideMenuSection(
          items: [
            Ux4gSideMenuItem(
              key: 'profile-settings',
              label: 'Profile & settings',
              icon: Icons.account_circle_outlined,
            ),
            Ux4gSideMenuItem(
              key: 'help-support',
              label: 'Help & support',
              icon: Icons.help_outline_rounded,
            ),
          ],
        ),
      ],
      showSignOut: true,
      bottomBranding: const Ux4gSideMenuBottomBranding(
        title: 'Revenue Department',
        subtitle: 'Government of India',
      ),
    );
  }
}

// ─── ALIAS EXPORT ────────────────────────────────────────────────────────────

/// [Ux4gDrawer] is an alias for [Ux4gSideMenu].
typedef Ux4gDrawer = Ux4gSideMenu;
