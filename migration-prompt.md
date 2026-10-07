# UX4G Flutter Design System — Non-Destructive AI Migration Prompt

## Context

I have an existing Flutter application that currently uses [Current UI Library: Flutter Material 3 (M3) / Material 2 / Cupertino (iOS) / Custom Widgets]. I need to migrate it to the **UX4G Flutter Design System** (`ux4g_flutter_components` package v1.5.1+) **without altering my existing application flow, working functionality, custom color combinations, brand theme, or typography hierarchy**.

## Project Details

- **Flutter SDK:** [e.g. Flutter 3.19+ / Dart 3.3+]
- **Current UI Library:** [Flutter Material 3 / Material 2 / Cupertino / Custom Widgets]
- **Current Color Palette / Brand Theme:** [e.g. Navy Blue #0D47A1, Emerald Green #059669, Saffron/Orange #FF9933, Custom Palette]
- **State Management:** [Provider / BLoC / Riverpod / MobX / GetX / ValueNotifier / setState]
- **Target Platforms:** [Android / iOS / Web / Windows / macOS / Linux]
- **Scope:** [Full Application / Specific Feature Screens / Component-by-Component]

## What I Need

Migrate my Flutter application from [current UI library] to the UX4G Flutter Design System (`ux4g_flutter_components`) adhering strictly to the **Zero-Disruption Migration Contract** below.

---

## Zero-Disruption Migration Contract (Critical Rules)

### Rule 1: Zero Functional & Flow Disruption (100% Logic Preservation)
- **Do NOT alter existing application flows, screen navigations, or business logic.**
- Retain all state management bindings (`BlocProvider`, `BlocBuilder`, `Riverpod Consumer`, `Provider`, `GetX`, `setState`).
- Retain all form controllers (`TextEditingController`, `FocusNode`, `ScrollController`, `PageController`).
- Retain all form validations (`GlobalKey<FormState>()`, `validator`, `onSaved`, `onChanged`, `onFieldSubmitted`).
- Retain all callback handlers (`onPressed`, `onTap`, `onChanged`, asynchronous submission flows).

### Rule 2: Safe, Non-Destructive Theme Integration
- **Do NOT overwrite or break the host project's existing `ThemeData` or `MaterialApp` settings.**
- `Ux4gTheme` operates via `ThemeExtension`. If the project already has an active Material/Custom Theme (`ColorScheme`, custom font family, dark mode toggles), **preserve the existing `ThemeData`** and non-destructively append UX4G extensions:

```dart
// SAFE: Non-destructive theme extension integration
final existingTheme = ThemeData(
  // Preserve all your existing brand colors, fontFamily, and properties
  primaryColor: const Color(0xFF0D47A1),
  fontFamily: 'Inter',
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
);

MaterialApp(
  theme: existingTheme.copyWith(
    extensions: [
      ...existingTheme.extensions.values,
      lightUx4gColors,
      defaultUx4gTypography,
    ],
  ),
  darkTheme: existingDarkTheme.copyWith(
    extensions: [
      ...existingDarkTheme.extensions.values,
      darkUx4gColors,
      defaultUx4gTypography,
    ],
  ),
  themeMode: ThemeMode.system,
  ...
)
```
*(If the project prefers the default UX4G theme, `Ux4gTheme.themeData(isDark: false)` can be used directly.)*

### Rule 3: Zero Color & Visual Identity Distortion
- **Do NOT force default UX4G purple (`#5B3AE6`) onto components that use custom brand colors.**
- When replacing buttons, headers, inputs, chips, and cards, **explicitly forward existing brand colors** via component styling props:
  - `backgroundColor: existingBrandColor`
  - `contentColor: existingTextColor`
  - `borderColor: existingBorderColor`
  - `borderRadius: existingBorderRadius`

### Rule 4: Zero Typography Breakdown
- **Do NOT override custom project font families or font size hierarchies.**
- When replacing text elements and form controls, map existing `TextStyle` directly into the component's `textStyle` prop so that font family, size, weight, and letter-spacing remain identical.

### Rule 5: Zero Layout Breakage
- Preserve all surrounding layout containers: `Column`, `Row`, `Expanded`, `Flexible`, `Padding`, `SizedBox`, `Wrap`, `Stack`, `SingleChildScrollView`, and `ListView`.
- Forward sizing parameters (`width`, `height`, `padding`, `margin`) directly into UX4G widgets.

### Rule 6: Replace Raw Widgets with Component Equivalents
Replace standard Material/Cupertino widgets with their designated `Ux4g*` equivalents while preserving all properties:
- `ElevatedButton` / `FilledButton` / `CupertinoButton` → `Ux4gButton`
- `IconButton` → `Ux4gIconButton`
- `FloatingActionButton` / `FAB.extended` → `Ux4gFab` (Circular, Labelled Pill, Speed Dial)
- `TextField` / `TextFormField` → `Ux4gInputField`
- `AppBar` / `CupertinoNavigationBar` → `Ux4gAppHeader`
- `NavigationDrawer` / `Drawer` → `Ux4gSideMenu`
- `NavigationBar` / `BottomNavigationBar` / `CupertinoTabBar` → `Ux4gBottomNavigationBar`
- `Card` → `Ux4gCard`
- `ExpansionTile` → `Ux4gAccordion` / `Ux4gAccordionGroup`
- `showModalBottomSheet` / `BottomSheet` → `Ux4gBottomSheet` (Draggable snap height presets)
- `Checkbox` → `Ux4gCheckbox` / `Ux4gCheckboxGroup`
- `Radio` → `Ux4gRadioButton` / `Ux4gRadioGroup`
- `Switch` → `Ux4gSwitch`
- `DropdownButtonFormField` → `Ux4gSelectionDropdown` / `Ux4gActionDropdown`
- `LinearProgressIndicator` → `Ux4gLinearProgressBar`
- `CircularProgressIndicator` → `Ux4gCircularProgressIndicator`

### Rule 7: Leverage Government-Exclusive Modules Seamlessly
Where applicable, upgrade custom manual input logic to UX4G's official Government modules without disrupting the form flow:
- **Aadhaar Input:** `Ux4gAadhaarInputField` (built-in Verhoeff checksum algorithm)
- **PAN Card Input:** `Ux4gPanInputField` (built-in format validator)
- **OTP Verification:** `Ux4gOtpInput` (6-digit / 4-digit auto-focus PIN box)
- **Journey / Stepper:** `Ux4gJourneyTimeline` (application tracking pipeline)
- **Biometric Face Verification:** `BiometricVerificationFlow` (MLKit face detection & liveness)
- **Empty States:** `Ux4gEmptyState`
- **Feedback Collection:** `Ux4gFeedbackFormStar`, `Ux4gFeedbackFormCsat`, `Ux4gFeedbackFormNps`

---

## Side-by-Side Migration Examples (Preserving Exact Style & Flow)

### 1. Button Migration (Preserving Custom Brand Color & Logic)

#### Before (Material 3):
```dart
ElevatedButton(
  onPressed: _isSubmitting ? null : _handlePayment,
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF00695C), // Custom brand green
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  child: _isSubmitting
      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
      : const Text('Pay Application Fee', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
)
```

#### After (UX4G Flutter — Exact Style & Logic Preserved):
```dart
Ux4gButton(
  text: 'Pay Application Fee',
  variant: Ux4gButtonVariant.primary,
  backgroundColor: const Color(0xFF00695C), // Brand green preserved
  contentColor: Colors.white,
  borderRadius: 10,
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  textStyle: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
  isLoading: _isSubmitting,
  onPressed: _handlePayment,
)
```

---

### 2. Form Input Field (Preserving Controller, Validator & Typography)

#### Before (Material 3):
```dart
TextFormField(
  controller: _nameController,
  focusNode: _nameFocusNode,
  keyboardType: TextInputType.name,
  style: const TextStyle(fontFamily: 'Inter', fontSize: 14, color: Color(0xFF1E293B)),
  decoration: InputDecoration(
    labelText: 'Applicant Full Name *',
    hintText: 'Enter name as per Aadhaar',
    prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF00695C)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    helperText: 'Must match official records exactly',
  ),
  validator: (val) {
    if (val == null || val.trim().isEmpty) return 'Full Name is required';
    if (val.length < 3) return 'Name is too short';
    return null;
  },
  onSaved: (val) => _applicantName = val,
)
```

#### After (UX4G Flutter — Exact Controller & Validator Preserved):
```dart
Ux4gInputField(
  controller: _nameController,
  label: 'Applicant Full Name',
  required: true,
  placeholder: 'Enter name as per Aadhaar',
  prefixIcon: Icons.person_outline,
  helperText: 'Must match official records exactly',
  borderRadius: 8,
  validator: (val) {
    if (val == null || val.trim().isEmpty) return 'Full Name is required';
    if (val.length < 3) return 'Name is too short';
    return null;
  },
  onSaved: (val) => _applicantName = val,
)
```

---

### 3. Application App Bar / Navigation Header

#### Before (Material 3):
```dart
AppBar(
  backgroundColor: const Color(0xFF00695C),
  title: const Text('National Scholarship Portal', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold)),
  actions: [
    IconButton(icon: const Icon(Icons.notifications_none), onPressed: _openNotifications),
    IconButton(icon: const Icon(Icons.account_circle), onPressed: _openProfile),
  ],
)
```

#### After (UX4G Flutter):
```dart
Ux4gAppHeader(
  title: 'National Scholarship Portal',
  subtitle: 'Government of India',
  showEmblem: true,
  backgroundColor: const Color(0xFF00695C),
  actions: [
    Ux4gHeaderAction(icon: Icons.notifications_none, badgeCount: 2, onTap: _openNotifications),
    Ux4gHeaderAction(icon: Icons.account_circle, onTap: _openProfile),
  ],
)
```

---

### 4. Bottom Navigation Bar

#### Before (Material 3):
```dart
NavigationBar(
  selectedIndex: _currentIndex,
  onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
  destinations: const [
    NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
    NavigationDestination(icon: Icon(Icons.folder_outlined), label: 'Applications'),
    NavigationDestination(icon: Icon(Icons.notifications_outlined), label: 'Alerts'),
    NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
  ],
)
```

#### After (UX4G Flutter):
```dart
Ux4gBottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (idx) => setState(() => _currentIndex = idx),
  indicatorType: Ux4gBottomNavIndicatorType.pill,
  items: const [
    Ux4gBottomNavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
    Ux4gBottomNavItem(icon: Icons.folder_outlined, activeIcon: Icons.folder, label: 'Applications', badgeCount: 3),
    Ux4gBottomNavItem(icon: Icons.notifications_outlined, activeIcon: Icons.notifications, label: 'Alerts', hasNotificationDot: true),
    Ux4gBottomNavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile'),
  ],
)
```

---

### 5. Side Menu / Navigation Drawer

#### Before (Material 3):
```dart
NavigationDrawer(
  selectedIndex: _selectedIdx,
  onDestinationSelected: (idx) => setState(() => _selectedIdx = idx),
  children: const [
    DrawerHeader(child: Text('Government Portal')),
    NavigationDrawerDestination(icon: Icon(Icons.dashboard_outlined), label: Text('Dashboard')),
    NavigationDrawerDestination(icon: Icon(Icons.assignment_outlined), label: Text('Services')),
  ],
)
```

#### After (UX4G Flutter):
```dart
Ux4gSideMenu(
  selectedId: _selectedRouteId,
  onItemSelected: (id) => setState(() => _selectedRouteId = id),
  brandBanner: const Ux4gSideMenuBrandBanner(portalName: 'National Service Portal'),
  header: const Ux4gSideMenuCitizenHeader(name: 'Aarav Sharma', role: 'Citizen Account'),
  groups: [
    Ux4gSideMenuGroup(
      title: 'CORE SERVICES',
      items: [
        Ux4gSideMenuItem(id: 'home', label: 'Dashboard', icon: Icons.dashboard_outlined),
        Ux4gSideMenuItem(id: 'inbox', label: 'Officer Inbox', icon: Icons.inbox_outlined, badgeCount: 7),
      ],
    ),
  ],
)
```

---

### 6. Modal Bottom Sheet

#### Before (Material 3):
```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  builder: (ctx) => Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Application Verification', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const Text('Please review the submitted citizen documents.'),
        ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('Confirm')),
      ],
    ),
  ),
);
```

#### After (UX4G Flutter):
```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (ctx) => Ux4gBottomSheet(
    size: Ux4gBottomSheetSize.half,
    title: 'Application Verification',
    description: 'Confirm citizen identity details before final submission.',
    icon: Icons.verified_user_outlined,
    primaryButtonText: 'Verify Details',
    onPrimaryPress: () => Navigator.pop(ctx),
    secondaryButtonText: 'Cancel',
    onSecondaryPress: () => Navigator.pop(ctx),
    onDismiss: () => Navigator.pop(ctx),
    content: const Padding(
      padding: EdgeInsets.all(20.0),
      child: Text('Please review the submitted citizen documents.'),
    ),
  ),
);
```

---

### 7. Floating Action Button (FAB & Speed Dial)

#### Before (Material 3):
```dart
FloatingActionButton.extended(
  onPressed: () => openNewApplication(),
  icon: const Icon(Icons.add),
  label: const Text('New Application'),
)
```

#### After (UX4G Flutter):
```dart
Ux4gFab(
  type: Ux4gFabType.speedDial,
  theme: Ux4gFabTheme.brand,
  icon: Icons.add,
  label: 'Quick Action',
  actions: [
    Ux4gFabActionItem(icon: Icons.description_outlined, label: 'New File', onPressed: () => handleNewFile()),
    Ux4gFabActionItem(icon: Icons.upload_file_outlined, label: 'Upload Doc', onPressed: () => handleUpload()),
  ],
)
```

---

### 8. Custom Cards & Surfaces

#### Before (Material 3):
```dart
Card(
  color: Colors.white,
  elevation: 2,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Application Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Text('Your application is under officer review.'),
      ],
    ),
  ),
)
```

#### After (UX4G Flutter):
```dart
Ux4gCard(
  cornerRadius: 12,
  backgroundColor: Colors.white,
  elevation: 2,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Application Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Text('Your application is under officer review.'),
      ],
    ),
  ),
)
```

---

## Step-by-Step Migration Process

1. **Step 1 — Codebase & Dependency Audit**:
   - Inspect `pubspec.yaml`, dependencies, state management architecture, and custom styling patterns.
   - Add `ux4g_flutter_components: ^1.5.1` to `pubspec.yaml` and run `flutter pub get`.

2. **Step 2 — Safe Theme Setup**:
   - Keep existing `ThemeData` intact and add UX4G theme extensions non-destructively so existing material theme functionality remains 100% unaffected.

3. **Step 3 — Screen-by-Screen Component Replacement**:
   - Migrate widgets screen-by-screen.
   - Forward all existing `TextEditingController`, `validator`, `onPressed`, `backgroundColor`, `contentColor`, `borderRadius`, and `textStyle` properties.

4. **Step 4 — Government Modules Integration (Optional Upgrade)**:
   - Replace generic number inputs with `Ux4gAadhaarInputField` or `Ux4gPanInputField` where citizen identity validation is needed.
   - Replace custom OTP boxes with `Ux4gOtpInput`.

5. **Step 5 — Verification & QA**:
   - Verify that forms submit, validate, and navigate exactly as before.
   - Verify that custom colors, fonts, and dark mode toggles operate smoothly.

---

## Post-Migration Verification Checklist

- [ ] **Zero Logic Breakage:** All form submit flows, API integrations, and state updates trigger without error.
- [ ] **Zero Styling Loss:** Custom brand colors, font families, font sizes, and layout margins remain visually identical.
- [ ] **Validation Parity:** All validators, error texts, and controller listeners function properly.
- [ ] **Dark Mode Parity:** Light and dark theme transitions work seamlessly.
- [ ] **Build & Analyzer Clean:** `flutter analyze` passes with zero errors.

---

## Start Migration

Begin by inspecting my Flutter project structure. Present a structured screen-by-screen migration plan confirming that all existing controllers, business flows, custom colors, and typography will be strictly preserved before writing any replacement code.

---

*UX4G Flutter Design System | ux4g_flutter_components v1.5.1 | National e-Governance Division (NeGD) | Government of India*
