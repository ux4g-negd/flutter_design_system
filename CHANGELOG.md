## 1.5.1
* **Component Bug Fixes & Improvements**:
  * **Floating Action Button (`Ux4gFab`)**:
    * Fixed layout spacing and 2.0px overflow issue when speed-dial sub-action menus are closed using `Offstage` visibility handling.
    * Ensured speed-dial expand/collapse animations maintain accurate anchoring without horizontal shifting.
  * **Bottom Navigation Bar (`Ux4gBottomNavigationBar`)**:
    * Refined active pill capsule and top bar indicator positioning across compact and wide mobile viewports.
    * Improved touch ripple and background transparency on active items.
  * **Side Menu (`Ux4gSideMenu`)**:
    * Enhanced responsive drawer wrapping for header actions, preset items, and drawer slide transitions.
* **Widgetbook & Documentation Updates**:
    * Made all 4 newly added components (`Side Menu`, `Bottom Navigation Bar`, `Floating Action Button`, `Bottom Sheet`) 100% responsive across all mobile (320px–375px), tablet, and desktop viewports.
    * Added dedicated Widgetbook components and stories for all 6 Side Menu state presets and modal drawer configurations.

## 1.5.0
* **New & Updated Components**:
  * **Side Menu (`Ux4gSideMenu`)**: Added comprehensive side navigation drawer supporting header, user profiles, collapsible sub-items, badge notifications, search filtering, and custom footer actions.
  * **Bottom Navigation Bar (`Ux4gBottomNavigationBar`)**: Added configurable bottom navigation bar with support for badges, active states, custom styling, and FAB notches.
  * **Floating Action Button (`Ux4gFab`)**: Added Floating Action Button component supporting standard, mini, extended labels, speed-dial menus, and responsive color themes.
  * **Bottom Sheet (`Ux4gBottomSheet`)**: Added complete UX4G Modal Bottom Sheet implementation with responsive snap presets (`peek`, `half`, `expanded`, `full`), smooth velocity drag gestures, anchored fixed footer actions, drag handle indicator, and full theme support.
* **Component Improvements & Bug Fixes**:
  * **Accessibility & Semantics**: Improved accessibility traits and semantic labels across buttons, headers, forms, and navigation widgets.
  * **Package Optimization**: Excluded internal development tools and build artifacts via `.pubignore` for a clean, lightweight pub.dev distribution.

## 1.4.0
* **Foundation Updates**:
  * **Shadow**: Renamed the elevation foundation class to `Ux4gShadow` for better clarity and added comprehensive test cases.
* **Component Updates & Fixes**:
  * **Journey Progress Indicator**: Integrated the proper `Ux4gPanInputField` to ensure accurate PAN card formatting and validation.
  * **Selection Dropdown**: Added missing label and description states.
  * **OTP Input**: Added new variant options in the Widgetbook side panel with updated code sections.
  * **Switch / Toggle**: Updated the Widgetbook naming to properly display as "Toggle".
  * **Bug Fixes**: Addressed various bugs in the **Button**, **Badge**, and **App Header** components.

## 1.3.0

* **Component Refactoring & Naming Standardization (100% Backward Compatible via Deprecated Aliases)**:
  * Renamed `Ux4gToggle` to `Ux4gSwitch` (`export 'src/components/ux4g_switch.dart'`).
  * Renamed `Ux4gCapsuleStepper` to `Ux4gCompactStepper` (`export 'src/components/compact_stepper.dart'`) and added full props documentation section.
  * Renamed `Ux4gSlotGrid` to `Ux4gTimeSlot` (`export 'src/components/time_slot.dart'`) with updated clean sidebar display name.
  * Renamed `Ux4gLoader` to `Ux4gSpinner` (`export 'src/components/spinner.dart'`), added comprehensive color and percentage `Variants` in Widgetbook, and enabled folder icon resolution.
  * Renamed `Ux4gResultRow` to `Ux4gResultList` (`export 'src/components/result_list.dart'`).
  * Renamed `Ux4gFeedbackForm` to `Ux4gFeedbackFormStar` (`export 'src/components/feedback_form_star.dart'`).
  * Renamed `Ux4gPaginationIndicator` to `Ux4gPaginationDotted` (`export 'src/components/pagination_dotted.dart'`).
  * Renamed `Ux4gLinearProgress` to `Ux4gLinearProgressBar` (`export 'src/components/linear_progress_bar.dart'`).
* **Design System Foundations & Tokens**:
  * Renamed `Ux4gPalette` to `Ux4gColors` for streamlined color foundation referencing.
  * Introduced dedicated elevation token objects (`Ux4gElevation`) and refreshed token color preview UI.

## 1.1.0

* **Bug Fix (Biometric Component)**: Fixed an issue where pressing the back button during face verification or liveness check caused an app crash.

## 1.0.0

* Initial release of `ux4g_flutter_components`.
* Added foundations for colors, typography, spacing, radii, and icons.
* Added 45+ component implementations including buttons, cards, modals, bottom sheets, tooltips, steppers, avatars, badges, inputs, pagination, toasts, and loaders.
* Added showcase example app and Widgetbook documentation for component previews and interaction testing.