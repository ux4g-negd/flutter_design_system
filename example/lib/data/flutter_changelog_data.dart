// ── Models for UX4G Flutter Changelog ─────────────────────────────────────────

class ChangelogItem {
  final String component;
  final String? componentPath;
  final String summary;
  final List<String> details;

  const ChangelogItem({
    required this.component,
    this.componentPath,
    required this.summary,
    this.details = const [],
  });
}

class ChangelogCategory {
  final String type; // 'Fixed', 'Added', 'Enhanced', 'Changed'
  final String label;
  final List<ChangelogItem> items;

  const ChangelogCategory({
    required this.type,
    required this.label,
    required this.items,
  });
}

class ChangelogRelease {
  final String version;
  final String date;
  final String relativeDate;
  final String? tag; // 'Latest', 'Maintenance', 'Major', 'Minor', 'Patch', etc.
  final bool isLatest;
  final String title;
  final String overview;
  final List<String> highlights;
  final String installCommand;
  final List<ChangelogCategory> categories;

  const ChangelogRelease({
    required this.version,
    required this.date,
    required this.relativeDate,
    this.tag,
    this.isLatest = false,
    required this.title,
    required this.overview,
    this.highlights = const [],
    required this.installCommand,
    required this.categories,
  });
}

// ── Complete Changelog Dataset ───────────────────────────────────────────────

const List<ChangelogRelease> kFlutterChangelogData = [
  ChangelogRelease(
    version: '1.5.2',
    date: 'October 12, 2026',
    relativeDate: 'Latest Release',
    tag: 'Latest',
    isLatest: true,
    title: 'Navigation, Gesture & Layout Refinements',
    overview:
        'Addresses modal backdrop tap dismiss handling on Ux4gBottomSheet, auto-wrapping long descriptions, responsive label scale-down for 5-item Ux4gBottomNavigationBar bars, and fixes Widgetbook deep linking across web refresh.',
    highlights: [
      'Fixed Ux4gBottomSheet backdrop dismiss tap gesture using HitTestBehavior.opaque so tapping the darkened background dismisses the sheet reliably.',
      'Enhanced Ux4gBottomSheet description layout to auto-wrap long text across multiple lines without truncating.',
      'Fixed label truncation on 5-item Ux4gBottomNavigationBar (e.g., "Services" clipping) via responsive FittedBox scale-down.',
      'Fixed Ux4gBottomNavigationBar centre action FAB margin and padding clearance against adjacent navigation items.',
      'Fixed Ux4gSideMenu modal drawer launch triggers in the Introduction showcase to accurately open the currently selected preset.',
      'Fixed Widgetbook deep linking and browser refresh issue for component paths containing "&" characters.',
    ],
    installCommand: 'flutter pub add ux4g_flutter_components',
    categories: [
      ChangelogCategory(
        type: 'Fixed',
        label: 'Fixed & Enhanced',
        items: [
          ChangelogItem(
            component: 'Ux4gBottomSheet',
            componentPath: 'components/bottom-sheet/introduction/overview-&-presets',
            summary: 'Backdrop dismiss tap gesture & auto-wrapping description layout',
            details: [
              'Fixed backdrop dismiss tap gesture handling using HitTestBehavior.opaque so tapping the backdrop background dismisses the sheet reliably.',
              'Improved description layout to auto-wrap long text descriptions across multiple lines without truncating.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gBottomNavigationBar',
            componentPath: 'components/bottom-navigation-bar/introduction/overview-&-presets',
            summary: 'Label clipping resolution & centre FAB spacing clearance',
            details: [
              'Fixed label truncation (e.g., "Services" clipping) on 5-item bars using responsive label scale-down (FittedBox).',
              'Fixed centre action FAB margin and padding clearance to avoid clipping against adjacent navigation items.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gSideMenu',
            componentPath: 'components/side-menu/introduction/overview-&-presets',
            summary: 'Modal drawer showcase launch preset targeting',
            details: [
              'Fixed modal drawer launch ("Launch Left Drawer" and "Launch Right Drawer") in the Introduction showcase to accurately open the currently selected preset.',
            ],
          ),
          ChangelogItem(
            component: 'Widgetbook Deep Linking',
            componentPath: null,
            summary: 'URL query parameter parsing for special characters',
            details: [
              'Fixed deep linking and browser refresh issue for component and use-case paths containing "&" characters.',
            ],
          ),
        ],
      ),
    ],
  ),
  ChangelogRelease(
    version: '1.5.1',
    date: 'October 2026',
    relativeDate: 'Maintenance Release',
    tag: 'Maintenance',
    title: 'Speed-Dial Layout & Mobile Viewport Optimizations',
    overview:
        'Fine-tunes Floating Action Button (Ux4gFab) sub-action menu layout, eliminates 2.0px overflow on closed speed-dials, refines active indicator positioning on Ux4gBottomNavigationBar, and achieves 100% responsiveness on 320px–375px screens.',
    highlights: [
      'Fixed layout spacing and 2.0px overflow issue when Ux4gFab speed-dial sub-action menus are closed using Offstage visibility handling.',
      'Ensured Ux4gFab speed-dial expand/collapse animations maintain accurate anchoring without horizontal shifting.',
      'Refined active pill capsule and top bar indicator positioning across compact and wide mobile viewports in Ux4gBottomNavigationBar.',
      'Enhanced responsive drawer wrapping for header actions, preset items, and drawer slide transitions in Ux4gSideMenu.',
      'Made all 4 newly added navigation components 100% responsive across all mobile (320px–375px), tablet, and desktop viewports.',
    ],
    installCommand: 'flutter pub add ux4g_flutter_components',
    categories: [
      ChangelogCategory(
        type: 'Fixed',
        label: 'Fixed Issues',
        items: [
          ChangelogItem(
            component: 'Ux4gFab',
            componentPath: 'components/floating-action-button/introduction/overview-&-presets',
            summary: 'Speed-dial closed menu overflow & animation anchoring',
            details: [
              'Fixed layout spacing and 2.0px overflow issue when speed-dial sub-action menus are closed using Offstage visibility handling.',
              'Ensured speed-dial expand/collapse animations maintain accurate anchoring without horizontal shifting.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gBottomNavigationBar',
            componentPath: 'components/bottom-navigation-bar/introduction/overview-&-presets',
            summary: 'Active pill & top bar indicator positioning',
            details: [
              'Refined active pill capsule and top bar indicator positioning across compact and wide mobile viewports.',
              'Improved touch ripple and background transparency on active items.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gSideMenu',
            componentPath: 'components/side-menu/introduction/overview-&-presets',
            summary: 'Responsive drawer wrapping & transitions',
            details: [
              'Enhanced responsive drawer wrapping for header actions, preset items, and drawer slide transitions.',
            ],
          ),
        ],
      ),
      ChangelogCategory(
        type: 'Enhanced',
        label: 'Enhancements & Documentation',
        items: [
          ChangelogItem(
            component: 'Widgetbook Stories',
            componentPath: null,
            summary: '100% Mobile responsiveness & dedicated stories',
            details: [
              'Made all 4 newly added components (Side Menu, Bottom Navigation Bar, Floating Action Button, Bottom Sheet) 100% responsive across all mobile (320px–375px), tablet, and desktop viewports.',
              'Added dedicated Widgetbook components and stories for all 6 Side Menu state presets and modal drawer configurations.',
            ],
          ),
        ],
      ),
    ],
  ),
  ChangelogRelease(
    version: '1.5.0',
    date: 'October 2026',
    relativeDate: 'Major Release',
    tag: 'Major',
    title: 'Navigation Primitives & Modal Bottom Sheet Suite',
    overview:
        'Introduces 4 major mobile navigation and modal drawer components: Ux4gSideMenu, Ux4gBottomNavigationBar, Ux4gFab, and Ux4gBottomSheet, along with enhanced accessibility traits and package distribution optimization.',
    highlights: [
      'Added comprehensive Ux4gSideMenu drawer with collapsible sub-items, badge counters, search filtering, and user profiles.',
      'Added configurable Ux4gBottomNavigationBar with support for badges, active states, custom styling, and FAB notches.',
      'Added Ux4gFab Floating Action Button supporting circular icon, extended labelled, and speed-dial submenus.',
      'Added Ux4gBottomSheet modal bottom sheet with velocity drag snapping (peek, half, expanded, full), fixed action footers, and drag handles.',
      'Optimized pub.dev distribution package size by excluding internal development tools via .pubignore.',
    ],
    installCommand: 'flutter pub add ux4g_flutter_components',
    categories: [
      ChangelogCategory(
        type: 'Added',
        label: 'New & Updated Components',
        items: [
          ChangelogItem(
            component: 'Ux4gSideMenu',
            componentPath: 'components/side-menu/introduction/overview-&-presets',
            summary: 'Comprehensive side navigation drawer',
            details: [
              'Added comprehensive side navigation drawer supporting header, user profiles, collapsible sub-items, badge notifications, search filtering, and custom footer actions.',
              'Supported 6 distinct presets: standard, officer inbox, citizen profile, action required, department switcher, and citizen simple.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gBottomNavigationBar',
            componentPath: 'components/bottom-navigation-bar/introduction/overview-&-presets',
            summary: 'Configurable bottom navigation bar',
            details: [
              'Added configurable bottom navigation bar with support for badges, active states, custom styling, and FAB notches.',
              'Supported 6 visual variants: labelled, top rounded, icon only, centre action, floating pill, and indicators.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gFab',
            componentPath: 'components/floating-action-button/introduction/overview-&-presets',
            summary: 'Floating Action Button with speed-dial',
            details: [
              'Added Floating Action Button component supporting standard, mini, extended labels, speed-dial menus, and responsive color themes.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gBottomSheet',
            componentPath: 'components/bottom-sheet/introduction/overview-&-presets',
            summary: 'Modal Bottom Sheet with velocity snapping',
            details: [
              'Added complete UX4G Modal Bottom Sheet implementation with responsive snap presets (peek, half, expanded, full), smooth velocity drag gestures, anchored fixed footer actions, drag handle indicator, and full theme support.',
            ],
          ),
        ],
      ),
      ChangelogCategory(
        type: 'Enhanced',
        label: 'Accessibility & Package Optimization',
        items: [
          ChangelogItem(
            component: 'Accessibility & Semantics',
            componentPath: null,
            summary: 'Screen reader accessibility and WCAG AA compliance',
            details: [
              'Improved accessibility traits and semantic labels across buttons, headers, forms, and navigation widgets.',
            ],
          ),
          ChangelogItem(
            component: 'Package Distribution',
            componentPath: null,
            summary: 'Clean, lightweight pub.dev package build',
            details: [
              'Excluded internal development tools and build artifacts via .pubignore for a clean, lightweight pub.dev distribution.',
            ],
          ),
        ],
      ),
    ],
  ),
  ChangelogRelease(
    version: '1.4.0',
    date: 'September 2026',
    relativeDate: 'Foundation & Parity Update',
    tag: 'Minor',
    title: 'Shadow Elevation Foundation & Component Parity',
    overview:
        'Standardizes the elevation foundation as Ux4gShadow with extensive tests, integrates Ux4gPanInputField into Journey Progress Indicator, and adds missing states to dropdowns and switches.',
    highlights: [
      'Renamed the elevation foundation class to Ux4gShadow for clearer semantics and added comprehensive test cases.',
      'Integrated the proper Ux4gPanInputField into Journey Progress Indicator to ensure accurate PAN card formatting and validation.',
      'Added missing label and description states in Selection Dropdown.',
      'Added new variant options in the Widgetbook side panel for OTP Input.',
      'Addressed bug fixes across Button, Badge, and App Header components.',
    ],
    installCommand: 'flutter pub add ux4g_flutter_components',
    categories: [
      ChangelogCategory(
        type: 'Changed',
        label: 'Foundation Updates',
        items: [
          ChangelogItem(
            component: 'Ux4gShadow',
            componentPath: 'token/shadow',
            summary: 'Elevation foundation renaming & tests',
            details: [
              'Renamed the elevation foundation class to Ux4gShadow for better clarity and added comprehensive test cases.',
            ],
          ),
        ],
      ),
      ChangelogCategory(
        type: 'Fixed',
        label: 'Component Updates & Fixes',
        items: [
          ChangelogItem(
            component: 'Journey Progress Indicator',
            componentPath: null,
            summary: 'Ux4gPanInputField integration',
            details: [
              'Integrated the proper Ux4gPanInputField to ensure accurate PAN card formatting and validation.',
            ],
          ),
          ChangelogItem(
            component: 'Selection Dropdown',
            componentPath: null,
            summary: 'Label and description states',
            details: [
              'Added missing label and description states.',
            ],
          ),
          ChangelogItem(
            component: 'OTP Input',
            componentPath: null,
            summary: 'Widgetbook side panel variants',
            details: [
              'Added new variant options in the Widgetbook side panel with updated code sections.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gSwitch',
            componentPath: null,
            summary: 'Sidebar naming consistency',
            details: [
              'Updated the Widgetbook naming to properly display as "Toggle".',
            ],
          ),
          ChangelogItem(
            component: 'Core Components',
            componentPath: null,
            summary: 'Bug fixes in Button, Badge, and App Header',
            details: [
              'Addressed various bugs in the Button, Badge, and App Header components.',
            ],
          ),
        ],
      ),
    ],
  ),
  ChangelogRelease(
    version: '1.3.0',
    date: 'August 2026',
    relativeDate: 'Refactoring & Tokens',
    tag: 'Minor',
    title: 'Design Token Standardization & Backward Compatible Refactoring',
    overview:
        'Refactors component names to standard UX4G terminology with 100% backward compatibility via deprecated aliases, renames Ux4gPalette to Ux4gColors, and introduces Ux4gElevation objects.',
    highlights: [
      'Renamed Ux4gPalette to Ux4gColors for streamlined color foundation referencing.',
      'Maintained 100% backward compatibility via deprecated aliases for all renamed components.',
      'Renamed Ux4gToggle to Ux4gSwitch, Ux4gCapsuleStepper to Ux4gCompactStepper, Ux4gSlotGrid to Ux4gTimeSlot, Ux4gLoader to Ux4gSpinner, Ux4gResultRow to Ux4gResultList, and Ux4gLinearProgress to Ux4gLinearProgressBar.',
      'Introduced dedicated elevation token objects (Ux4gElevation) with refreshed preview UI.',
    ],
    installCommand: 'flutter pub add ux4g_flutter_components',
    categories: [
      ChangelogCategory(
        type: 'Changed',
        label: 'Design System Foundations & Tokens',
        items: [
          ChangelogItem(
            component: 'Ux4gColors',
            componentPath: 'token/colors/primary',
            summary: 'Ux4gPalette renamed to Ux4gColors',
            details: [
              'Renamed Ux4gPalette to Ux4gColors for streamlined color foundation referencing.',
              'Introduced dedicated elevation token objects (Ux4gElevation) and refreshed token color preview UI.',
            ],
          ),
        ],
      ),
      ChangelogCategory(
        type: 'Changed',
        label: 'Component Refactoring & Naming (100% Backward Compatible)',
        items: [
          ChangelogItem(
            component: 'Ux4gSwitch',
            componentPath: null,
            summary: 'Renamed Ux4gToggle to Ux4gSwitch',
            details: [
              'Renamed Ux4gToggle to Ux4gSwitch (export src/components/ux4g_switch.dart).',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gCompactStepper',
            componentPath: null,
            summary: 'Renamed Ux4gCapsuleStepper to Ux4gCompactStepper',
            details: [
              'Renamed Ux4gCapsuleStepper to Ux4gCompactStepper and added full props documentation section.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gTimeSlot',
            componentPath: null,
            summary: 'Renamed Ux4gSlotGrid to Ux4gTimeSlot',
            details: [
              'Renamed Ux4gSlotGrid to Ux4gTimeSlot with updated clean sidebar display name.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gSpinner',
            componentPath: null,
            summary: 'Renamed Ux4gLoader to Ux4gSpinner',
            details: [
              'Renamed Ux4gLoader to Ux4gSpinner, added comprehensive color and percentage variants in Widgetbook.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gResultList',
            componentPath: null,
            summary: 'Renamed Ux4gResultRow to Ux4gResultList',
            details: [
              'Renamed Ux4gResultRow to Ux4gResultList.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gFeedbackFormStar',
            componentPath: null,
            summary: 'Renamed Ux4gFeedbackForm to Ux4gFeedbackFormStar',
            details: [
              'Renamed Ux4gFeedbackForm to Ux4gFeedbackFormStar.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gPaginationDotted',
            componentPath: null,
            summary: 'Renamed Ux4gPaginationIndicator to Ux4gPaginationDotted',
            details: [
              'Renamed Ux4gPaginationIndicator to Ux4gPaginationDotted.',
            ],
          ),
          ChangelogItem(
            component: 'Ux4gLinearProgressBar',
            componentPath: null,
            summary: 'Renamed Ux4gLinearProgress to Ux4gLinearProgressBar',
            details: [
              'Renamed Ux4gLinearProgress to Ux4gLinearProgressBar.',
            ],
          ),
        ],
      ),
    ],
  ),
  ChangelogRelease(
    version: '1.1.0',
    date: 'July 2026',
    relativeDate: 'Bug Fix Release',
    tag: 'Patch',
    title: 'Biometric Face Auth Stability Fix',
    overview:
        'Resolves an edge-case app crash on hardware back button press during camera biometric verification or liveness check challenge.',
    highlights: [
      'Fixed an issue where pressing the hardware back button during face verification or liveness check caused an app crash.',
    ],
    installCommand: 'flutter pub add ux4g_flutter_components',
    categories: [
      ChangelogCategory(
        type: 'Fixed',
        label: 'Bug Fixes',
        items: [
          ChangelogItem(
            component: 'Biometric Face Auth',
            componentPath: null,
            summary: 'Hardware back button crash fix',
            details: [
              'Fixed an issue where pressing the back button during face verification or liveness check caused an app crash.',
            ],
          ),
        ],
      ),
    ],
  ),
  ChangelogRelease(
    version: '1.0.0',
    date: 'June 2026',
    relativeDate: 'Initial Release',
    tag: 'Initial',
    title: 'Initial Release of UX4G Flutter Components',
    overview:
        'First public release of ux4g_flutter_components, providing government-grade UI foundations, 45+ accessible components, and full interactive Widgetbook documentation.',
    highlights: [
      'Initial release of ux4g_flutter_components for Flutter mobile and web.',
      'Foundations for colors, typography, spacing, radii, elevation, and icons.',
      'Added 45+ component implementations including buttons, cards, modals, bottom sheets, tooltips, steppers, avatars, badges, inputs, pagination, toasts, and loaders.',
      'Comprehensive showcase example app and Widgetbook documentation.',
    ],
    installCommand: 'flutter pub add ux4g_flutter_components',
    categories: [
      ChangelogCategory(
        type: 'Added',
        label: 'Initial Release',
        items: [
          ChangelogItem(
            component: 'UX4G Flutter Design System',
            componentPath: null,
            summary: 'Foundations & 45+ components',
            details: [
              'Added foundations for colors, typography, spacing, radii, and icons.',
              'Added 45+ component implementations including buttons, cards, modals, bottom sheets, tooltips, steppers, avatars, badges, inputs, pagination, toasts, and loaders.',
              'Added showcase example app and Widgetbook documentation for component previews and interaction testing.',
            ],
          ),
        ],
      ),
    ],
  ),
];

