# UX4G Flutter Design System — Migration Guide (MIGRATION.md)

This comprehensive guide outlines how to migrate an existing Flutter application (whether built with **Flutter Material 3 (M3)**, **Material 2**, or **Cupertino (iOS)**) to the **UX4G Flutter Design System (`ux4g_flutter_components`)** smoothly **without altering existing UI layouts, user flows, or business logic**.

---

## Table of Contents
1. [Migration Philosophy & Strategy](#1-migration-philosophy--strategy)
2. [Installation & Setup](#2-installation--setup)
3. [Theme Integration (`Ux4gTheme`)](#3-theme-integration-ux4gtheme)
4. [Component-by-Component Mapping & Replacement](#4-component-by-component-mapping--replacement)
5. [Side-by-Side Code Examples (Before & After)](#5-side-by-side-code-examples-before--after)
   - [Buttons & Icon Buttons](#buttons--icon-buttons)
   - [Text Inputs & Form Fields](#text-inputs--form-fields)
   - [App Bar & Navigation Header](#app-bar--navigation-header)
   - [Accordions & Expansion Panels](#accordions--expansion-panels)
   - [Checkboxes, Radios & Switches](#checkboxes-radios--switches)
   - [Dropdowns & Single/Multi Select](#dropdowns--singlemulti-select)
   - [Date & Time Pickers](#date--time-pickers)
   - [Progress Indicators & Gauges](#progress-indicators--gauges)
   - [Alerts, Banners & Toasts](#alerts-banners--toasts)
   - [Government-Exclusive Components](#government-exclusive-components)
6. [Design Tokens & Style Alignment](#6-design-tokens--style-alignment)
7. [Step-by-Step Gradual Migration Workflow](#7-step-by-step-gradual-migration-workflow)
8. [Migration Checklist & QA Verification](#8-migration-checklist--qa-verification)

---

## 1. Migration Philosophy & Strategy

When migrating an existing Flutter project to UX4G:
- **Zero Business Logic Disruption**: All standard Flutter controllers (`TextEditingController`, `ScrollController`, `PageController`), state management bindings (`Bloc`, `Provider`, `Riverpod`, `ValueNotifier`), and callbacks (`onPressed`, `onChanged`, `onSaved`, `validator`) remain 100% compatible.
- **Zero Layout Breakage**: UX4G Flutter components accept standard Flutter layout parameters (`margin`, `padding`, `width`, `height`, `constraints`, `Key`), preserving your existing flex rows, columns, and responsive layouts.
- **Incremental & Hybrid Migration**: You do not need to rewrite your whole app in one go. You can migrate screen-by-screen or component-by-component alongside existing Material and Cupertino widgets.

---

## 2. Installation & Setup

Add `ux4g_flutter_components` to your Flutter project's `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  ux4g_flutter_components: ^1.1.0 # Or use path / git reference
```

Run `flutter pub get`:
```bash
flutter pub get
```

---

## 3. Theme Integration (`Ux4gTheme`)

Configure your `MaterialApp` with `Ux4gTheme.themeData()`:

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gov Application',
      debugShowCheckedModeBanner: false,
      theme: Ux4gTheme.themeData(isDark: false),
      darkTheme: Ux4gTheme.themeData(isDark: true),
      themeMode: ThemeMode.system,
      home: const DashboardScreen(),
    );
  }
}
```

---

## 4. Component-by-Component Mapping & Replacement

| Category | Flutter Material 3 (M3) | Cupertino (iOS) | UX4G Flutter Component (`ux4g_flutter_components`) |
| :--- | :--- | :--- | :--- |
| **Buttons** | `ElevatedButton`, `FilledButton` | `CupertinoButton` | `Ux4gButton` |
| **Icon Buttons** | `IconButton`, `IconButton.filled` | `CupertinoButton` | `Ux4gIconButton` |
| **Text Inputs** | `TextField`, `TextFormField` | `CupertinoTextField` | `Ux4gInputField` |
| **Text Area** | `TextField(maxLines: 4)` | `CupertinoTextField(maxLines: 4)` | `Ux4gTextArea` |
| **Search Bar** | `SearchBar`, `SearchAnchor` | `CupertinoSearchTextField` | `Ux4gSearchField` |
| **App Headers** | `AppBar`, `SliverAppBar` | `CupertinoNavigationBar` | `Ux4gAppHeader` |
| **Accordions** | `ExpansionTile`, `ExpansionPanel` | Custom Collapsible | `Ux4gAccordion`, `Ux4gAccordionGroup` |
| **Checkboxes** | `Checkbox`, `CheckboxListTile` | `CupertinoCheckbox` | `Ux4gCheckbox`, `Ux4gCheckboxGroup` |
| **Radio Buttons** | `Radio`, `RadioListTile` | `CupertinoRadio` | `Ux4gRadioButton`, `Ux4gRadioGroup` |
| **Switches** | `Switch`, `SwitchListTile` | `CupertinoSwitch` | `Ux4gSwitch` |
| **Dropdowns** | `DropdownMenu`, `DropdownButtonFormField` | `CupertinoPicker` | `Ux4gActionDropdown`, `Ux4gSelectionDropdown` |
| **Cards** | `Card`, `Container` | Custom Container | `Ux4gCard` |
| **Chips / Tags** | `ChoiceChip`, `FilterChip`, `InputChip` | Custom Container | `Ux4gChoiceChip`, `Ux4gFilterChip`, `Ux4gChipGroup` |
| **Dividers** | `Divider`, `VerticalDivider` | `CupertinoListSection` | `Ux4gDivider` |
| **Avatars** | `CircleAvatar` | Custom Circle Container | `Ux4gAvatar`, `Ux4gAvatarGroup`, `Ux4gStatusAvatar` |
| **Progress (Linear)** | `LinearProgressIndicator` | Custom Container | `Ux4gLinearProgressBar` |
| **Progress (Circle)** | `CircularProgressIndicator` | `CupertinoActivityIndicator` | `Ux4gCircularProgressIndicator` |
| **Progress (Gauge)** | Custom Painter | N/A | `Ux4gHalfCircleProgress` |
| **Date Picker** | `showDatePicker`, `DatePickerDialog` | `CupertinoDatePicker` | `Ux4gDatePicker` |
| **Time Picker** | `showTimePicker`, `TimePickerDialog` | `CupertinoTimerPicker` | `Ux4gTimePicker` |
| **Dialogs / Modals** | `showDialog`, `AlertDialog` | `showCupertinoDialog` | `Ux4gModal` |
| **Snackbars / Toasts**| `ScaffoldMessenger.showSnackBar` | Custom Toast | `Ux4gToast`, `Ux4gToastController` |
| **Status Banners** | `MaterialBanner` | N/A | `Ux4gStatusBanner` |
| **Aadhaar Input** | Custom Regex Formatter | N/A | `Ux4gAadhaarInputField` (Built-in Verhoeff checksum) |
| **PAN Card Input** | Custom Uppercase Formatter | N/A | `Ux4gPanInputField` (Built-in format validator) |
| **OTP Input** | Custom PIN Row | N/A | `Ux4gOtpInput` (Auto-focus & SMS autofill) |
| **Biometric Auth** | Custom MLKit / Camera | N/A | `BiometricVerificationFlow` (Liveness & blink check) |
| **Journey Timeline** | Custom Stepper | N/A | `Ux4gJourneyTimeline` (Multi-step application tracker) |
| **Status Pipeline** | Custom Breadcrumbs | N/A | `Ux4gStatusPipeline` |
| **Empty State** | Custom Column | N/A | `Ux4gEmptyState` |
| **Feedback Forms** | Custom Rating Row | N/A | `Ux4gFeedbackFormStar`, `Ux4gFeedbackFormCsat` |

---

## 5. Side-by-Side Code Examples (Before & After)

### Buttons & Icon Buttons

#### Before (Material 3)
```dart
ElevatedButton(
  onPressed: isSubmitting ? null : handleSave,
  style: ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  child: isSubmitting
      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
      : const Text('Submit Application'),
)
```

#### After (UX4G Flutter)
```dart
Ux4gButton(
  text: 'Submit Application',
  variant: Ux4gButtonVariant.primary,
  size: Ux4gButtonSize.medium,
  isLoading: isSubmitting,
  onPressed: handleSave,
)
```

---

### Text Inputs & Form Fields

#### Before (Material 3)
```dart
TextFormField(
  controller: _nameController,
  decoration: InputDecoration(
    labelText: 'Full Name *',
    hintText: 'Enter name as per Aadhaar',
    prefixIcon: const Icon(Icons.person_outline),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    helperText: 'Must match official records',
  ),
  validator: (val) => val == null || val.isEmpty ? 'Name is required' : null,
)
```

#### After (UX4G Flutter)
```dart
Ux4gInputField(
  controller: _nameController,
  label: 'Full Name',
  required: true,
  placeholder: 'Enter name as per Aadhaar',
  prefixIcon: Icons.person_outline,
  helperText: 'Must match official records',
  validator: (val) => val == null || val.isEmpty ? 'Name is required' : null,
)
```

---

### App Bar & Navigation Header

#### Before (Material 3 / Cupertino)
```dart
AppBar(
  title: const Text('Department of Revenue'),
  centerTitle: false,
  actions: [
    IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
    IconButton(icon: const Icon(Icons.account_circle), onPressed: () {}),
  ],
)
```

#### After (UX4G Flutter)
```dart
Ux4gAppHeader(
  title: 'Department of Revenue',
  subtitle: 'Government of India',
  showEmblem: true,
  actions: [
    Ux4gHeaderAction(icon: Icons.notifications_none, badgeCount: 3, onTap: () {}),
    Ux4gHeaderAction(icon: Icons.account_circle, onTap: () {}),
  ],
)
```

---

### Accordions & Expansion Panels

#### Before (Material 3)
```dart
ExpansionTile(
  title: const Text('Scheme Eligibility Criteria'),
  leading: const Icon(Icons.info_outline),
  children: const [
    Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Citizens aged 18-60 with annual household income below 2.5 Lakhs.'),
    ),
  ],
)
```

#### After (UX4G Flutter)
```dart
Ux4gAccordion(
  title: 'Scheme Eligibility Criteria',
  icon: Icons.info_outline,
  statusBadge: 'Mandatory',
  content: const Text('Citizens aged 18-60 with annual household income below 2.5 Lakhs.'),
)
```

---

### Government-Exclusive Components

#### Aadhaar Input with Verhoeff Checksum
```dart
Ux4gAadhaarInputField(
  controller: _aadhaarController,
  onValidated: (isValid, formattedNumber) {
    if (isValid) {
      print('Valid UIDAI Aadhaar: $formattedNumber');
    }
  },
)
```

#### OTP PIN Code Selector
```dart
Ux4gOtpInput(
  length: 6,
  onCompleted: (pin) => verifyOtp(pin),
  onResend: () => resendOtp(),
)
```

#### Multi-Stage Application Journey Tracker
```dart
Ux4gJourneyTimeline(
  currentStep: 2,
  steps: const [
    Ux4gJourneyStep(title: 'Application Submitted', date: '01 Mar 2026', state: Ux4gJourneyStepState.completed),
    Ux4gJourneyStep(title: 'Document Verification', date: '04 Mar 2026', state: Ux4gJourneyStepState.completed),
    Ux4gJourneyStep(title: 'Under Review by Officer', date: '08 Mar 2026', state: Ux4gJourneyStepState.current),
    Ux4gJourneyStep(title: 'Final Approval & Certificate Issuance', state: Ux4gJourneyStepState.upcoming),
  ],
)
```

---

## 6. Design Tokens & Style Alignment

### Color Palette Tokens (`Ux4gColors.*`)
- `Ux4gColors.primary`: `#5B3AE6` (Primary interactive buttons, app header)
- `Ux4gColors.secondary`: `#0284C7` (Secondary links, info tags)
- `Ux4gColors.success`: `#10B981` (Approved verification, success toasts)
- `Ux4gColors.warning`: `#F59E0B` (Pending alerts, review notifications)
- `Ux4gColors.error`: `#F43F5E` (Validation errors, rejected status)
- `Ux4gColors.neutral`: `#F8FAFC` (Card backgrounds, surfaces)

### Typography Tokens (`Ux4gTypography.*`)
- `Ux4gTypography.displayLarge`: `48px` Bold
- `Ux4gTypography.headlineMedium`: `28px` SemiBold
- `Ux4gTypography.titleLarge`: `20px` SemiBold
- `Ux4gTypography.bodyMedium`: `14px` Regular
- `Ux4gTypography.labelSmall`: `11px` Bold

---

## 7. Step-by-Step Gradual Migration Workflow

1. **Step 1 — Configure Theme**: Add `Ux4gTheme.themeData(isDark: false)` to `MaterialApp`.
2. **Step 2 — Forms & Inputs**: Replace standard text inputs and buttons with `<Ux4gInputField>` and `<Ux4gButton>`.
3. **Step 3 — App Navigation**: Replace standard `AppBar` with `<Ux4gAppHeader>` featuring Government Emblem logo and notification counters.
4. **Step 4 — Gov Integrations**: Adopt `<Ux4gAadhaarInputField>`, `<Ux4gPanInputField>`, `<Ux4gOtpInput>`, and `<Ux4gJourneyTimeline>`.
5. **Step 5 — Polish & Feedback**: Replace snackbars with `<Ux4gToast>` and zero-states with `<Ux4gEmptyState>`.

---

## 8. Migration Checklist & QA Verification

- [ ] All standard form validations, `GlobalKey<FormState>`, and `TextEditingController` instances operate without errors.
- [ ] Color contrast meets WCAG 2.1 AA (>= 4.5:1 ratio).
- [ ] Responsive UI renders correctly on mobile, tablet, and desktop layouts.
- [ ] Aadhaar and PAN validators correctly verify checksums on citizen data.
- [ ] Dark Mode transitions smoothly with `Ux4gTheme.themeData(isDark: true)`.
