import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:ux4g_flutter_components/src/components/social_links.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UX4G Flutter Design System',
      debugShowCheckedModeBanner: false,
      theme: Ux4gTheme.themeData(isDark: false),
      darkTheme: Ux4gTheme.themeData(isDark: true),
      home: const ComponentShowcasePage(),
    );
  }
}

class ComponentShowcasePage extends StatefulWidget {
  const ComponentShowcasePage({super.key});

  @override
  State<ComponentShowcasePage> createState() => _ComponentShowcasePageState();
}

class _ComponentShowcasePageState extends State<ComponentShowcasePage> {
  final Ux4gToastHostState _toastHostState = Ux4gToastHostState();
  bool _toastAtTop = true;
  bool _isDark = false;

  // Radio
  int _selectedRadio = 1;

  // Dropdown
  List<String> _singleSelected = ['opt_1'];
  List<String> _multiSelected = ['opt_1', 'opt_3'];
  List<String> _searchableSingleSelected = ['br'];
  List<String> _searchableMultiSelected = ['arp', 'br'];

  // Input
  String _textVal = '';
  String _passVal = '';

  // Search
  String _autocompleteVal = 'm';

  // Slider
  double _slider1 = 50;
  RangeValues _slider2 = const RangeValues(20, 70);
  double _slider3 = 40;
  RangeValues _slider4 = const RangeValues(30, 80);

  // Stepper
  int _currentStep = 2;

  // Pagination
  int _pageIndex = 1;

  // Capsule Stepper
  int _capsuleStep = 1;

  // Checkbox
  bool? _checkbox1 = true;
  bool? _checkbox2 = false;
  bool? _checkbox3; // tristate null = indeterminate

  // Toggle
  bool _toggle1 = true;
  bool _toggle2 = false;

  // Accordion
  int? _expandedAccordionIndex = 2;

  // Chips
  int _selectedChoiceChip = 0;
  final Set<int> _selectedFilterChips = {0, 2};

  // TextArea
  String _textAreaVal = '';

  // Linear Progress
  double _progressValue = 0.0;
  double _circularProgressValue = 0.5;

  // Social Links
  SocialMediaIcon _selectedSocialIcon = SocialMediaIcon.github;
  Color _selectedTintColor = Ux4gColors.primary500;

  // File Upload
  List<UploadedFile> _uploadedFiles = [];

  // Aadhaar
  String _aadhaarValue = '';
  Ux4gInputFieldStatus _aadhaarStatus = Ux4gInputFieldStatus.defaultStatus;

  // PAN
  String _panValue = '';
  Ux4gInputFieldStatus _panStatus = Ux4gInputFieldStatus.defaultStatus;

  // OTP
  String _otpDefault = '';
  String _otpError = '';
  String _otpSuccess = '123456';
  String _otpWarning = '';
  String _otpLocked = '123';
  String _otpCountdown = '';
  bool _otpCountdownExpired = false;

  // Interactive OTP Demo
  String _otpTestValue = '';
  Ux4gOtpInputStatus _otpTestStatus = Ux4gOtpInputStatus.defaultStatus;
  int _otpAttemptsLeft = 3;
  bool _otpIsLocked = false;

  // Floating Action Button (FAB) Showcase State
  Ux4gFabColorTheme _fabPlaygroundTheme = Ux4gFabColorTheme.brand;
  Ux4gFabVariant _fabPlaygroundVariant = Ux4gFabVariant.menuJoined;
  Ux4gFabSize _fabPlaygroundSize = Ux4gFabSize.medium;
  bool _fabPlaygroundDisabled = false;
  bool _fabPlaygroundBackdrop = false;
  bool _fabPlaygroundShowIcon = true;
  bool _fabPlaygroundOpen = false;
  String _fabActionLog = 'Tap the FAB or action items to interact!';

  // Side Menu (Ux4gSideMenu / Ux4gDrawer) Showcase State
  int _selectedSideMenuPreset = 0;
  String _sideMenuActionLog = 'Select a preset or tap items in the live drawer preview below';


  List<Ux4gDropdownOption> get _stateOptions => [
    Ux4gDropdownOption(id: 'ap', label: 'Andhra Pradesh'),
    Ux4gDropdownOption(id: 'arp', label: 'Arunachal Pradesh'),
    Ux4gDropdownOption(id: 'as', label: 'Assam'),
    Ux4gDropdownOption(id: 'br', label: 'Bihar'),
    Ux4gDropdownOption(id: 'cg', label: 'Chhattisgarh'),
    Ux4gDropdownOption(id: 'ga', label: 'Goa'),
    Ux4gDropdownOption(id: 'gj', label: 'Gujarat'),
  ];

  @override
  void dispose() {
    _toastHostState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Ux4gTheme(
      isDark: _isDark,
      child: Builder(
        builder: (ctx) {
          final colors = Ux4gTheme.colors(ctx);
          final typography = Ux4gTheme.typography(ctx);

          return Scaffold(
            backgroundColor: colors.background,
            appBar: AppBar(
              backgroundColor: colors.surface,
              title: Text(
                'Ux4g Component Showcase',
                style: typography.hS_strong.copyWith(color: colors.onSurface),
              ),
              actions: [
                Icon(
                  _isDark ? Icons.dark_mode : Icons.light_mode,
                  color: colors.onSurface,
                  size: 18,
                ),
                Switch(
                  value: _isDark,
                  onChanged: (v) => setState(() => _isDark = v),
                  activeTrackColor: colors.primary,
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ─── 1. Profile Avatar ────────────────────────────
                      _sectionTitle('Profile Avatar', typography, colors),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          Ux4gProfileAvatar(
                            size: Ux4gAvatarSize.xl,
                            variant: Ux4gProfileAction.edit,
                            imageUrl:
                                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
                          ),
                          Ux4gProfileAvatar(
                            size: Ux4gAvatarSize.xl,
                            variant: Ux4gProfileAction.camera,
                            initials: 'JD',
                          ),
                          Ux4gProfileAvatar(
                            size: Ux4gAvatarSize.l,
                            variant: Ux4gProfileBadge.verified,
                            imageUrl:
                                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400',
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // ─── Avatar Group ─────────────────────────────────
                      _sectionTitle('Avatar Group', typography, colors),
                      const SizedBox(height: 12),
                      Ux4gAvatarGroup(
                        items: [
                          Ux4gAvatarGroupItem(initials: 'AB'),
                          Ux4gAvatarGroupItem(initials: 'CD'),
                          Ux4gAvatarGroupItem(initials: 'EF'),
                          Ux4gAvatarGroupItem(initials: 'GH'),
                          Ux4gAvatarGroupItem(initials: 'IJ'),
                        ],
                        size: Ux4gAvatarSize.m,
                        maxLimit: 3,
                      ),

                      const SizedBox(height: 24),

                      // ─── Status Avatar ────────────────────────────────
                      _sectionTitle('Status Avatar', typography, colors),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        children: [
                          Ux4gStatusAvatar(
                            size: Ux4gAvatarSize.l,
                            variant: Ux4gStatusVariant.online,
                            initials: 'ON',
                          ),
                          Ux4gStatusAvatar(
                            size: Ux4gAvatarSize.l,
                            variant: Ux4gStatusVariant.offline,
                            initials: 'OF',
                          ),
                          Ux4gStatusAvatar(
                            size: Ux4gAvatarSize.l,
                            variant: Ux4gStatusVariant.busy,
                            initials: 'BS',
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // ─── 2. Primary Button ────────────────────────────
                      _showcaseCard(
                        title: 'Primary Button',
                        typography: typography,
                        colors: colors,
                        child: Ux4gButton(
                          onPressed: () {},
                          text: 'confirm changes',
                        ),
                      ),

                      // ─── 3. Outlined Button ───────────────────────────
                      _showcaseCard(
                        title: 'Outlined Button',
                        typography: typography,
                        colors: colors,
                        child: Ux4gButton(
                          onPressed: () {},
                          text: 'Outlined Action',
                          variant: Ux4gButtonVariant.outline,
                        ),
                      ),

                      // ─── 4. Custom Style (Secondary) ──────────────────
                      _showcaseCard(
                        title: 'Custom Style (Secondary)',
                        typography: typography,
                        colors: colors,
                        child: Ux4gButton(
                          onPressed: () {},
                          text: 'Secondary Pill Button',
                          backgroundColor: Ux4gColors.secondary,
                          contentColor: Ux4gColors.neutral1000black,
                          borderRadius: 24,
                          elevation: 8,
                        ),
                      ),

                      // ─── 5. Loading State ─────────────────────────────
                      _showcaseCard(
                        title: 'Loading State',
                        typography: typography,
                        colors: colors,
                        child: Ux4gButton(
                          onPressed: () {},
                          text: 'Click Me',
                          isLoading: true,
                        ),
                      ),

                      // ─── 6. Disabled State ────────────────────────────
                      _showcaseCard(
                        title: 'Disabled State',
                        typography: typography,
                        colors: colors,
                        child: Ux4gButton(
                          onPressed: () {},
                          text: 'Disabled Button',
                          enabled: false,
                        ),
                      ),

                      // ─── Button Variants ──────────────────────────────
                      _showcaseCard(
                        title: 'Button Variants',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gButton(
                              onPressed: () {},
                              text: 'Ghost Button',
                              variant: Ux4gButtonVariant.ghost,
                            ),
                            const SizedBox(height: 8),
                            Ux4gButton(
                              onPressed: () {},
                              text: 'Secondary Button',
                              variant: Ux4gButtonVariant.secondary,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Ux4gIconButton(
                                  icon: Icons.add,
                                  onPressed: () {},
                                ),
                                Ux4gIconButton(
                                  icon: Icons.edit,
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                ),
                                Ux4gIconButton(
                                  icon: Icons.delete,
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.ghost,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ─── 7. ux4gSpinner ───────────────────────────────────
                      _showcaseCard(
                        title: 'Accordion',
                        typography: typography,
                        colors: colors,
                        child: Ux4gAccordionGroup(
                          items: const [
                            Ux4gAccordionItem(title: 'Accordion Item'),
                            Ux4gAccordionItem(title: 'Accordion Item'),
                            Ux4gAccordionItem(title: 'Accordion Item'),
                            Ux4gAccordionItem(title: 'Accordion Item'),
                            Ux4gAccordionItem(
                              title: 'Accordion Item',
                              enabled: false,
                            ),
                          ],
                          expandedIndex: _expandedAccordionIndex,
                          onExpandedIndexChange: (value) {
                            setState(() => _expandedAccordionIndex = value);
                          },
                          contentBuilder: (index, item) {
                            if (index != 2) {
                              return const SizedBox.shrink();
                            }

                            return Text(
                              'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development. Its purpose is to permit a page layout to be designed, independently of the copy that will subsequently populate it.',
                              style: typography.bXS_default.copyWith(
                                color: Ux4gColors.neutral500,
                              ),
                            );
                          },
                        ),
                      ),

                      _showcaseCard(
                        title: 'ux4gSpinner',
                        typography: typography,
                        colors: colors,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Ux4gSpinner(
                              size: 40,
                              percentage: 100,
                              color: Ux4gColors.primary,
                            ),
                            Ux4gSpinner(
                              size: 40,
                              percentage: 60,
                              color: Ux4gColors.secondary,
                            ),
                            Ux4gSpinner(
                              size: 40,
                              percentage: 30,
                              color: Ux4gColors.red,
                            ),
                            Ux4gSpinner(
                              size: 40,
                              percentage: 75,
                              color: Ux4gColors.green,
                            ),
                          ],
                        ),
                      ),

                      // ─── 8. Radio Buttons ─────────────────────────────
                      _showcaseCard(
                        title: 'Radio Buttons',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gRadioButton<int>(
                              value: 1,
                              groupValue: _selectedRadio,
                              onChanged: (v) =>
                                  setState(() => _selectedRadio = v!),
                              label: 'Option 1 (Medium)',
                              size: Ux4gRadioButtonSize.medium,
                            ),
                            const SizedBox(height: 8),
                            Ux4gRadioButton<int>(
                              value: 2,
                              groupValue: _selectedRadio,
                              onChanged: (v) =>
                                  setState(() => _selectedRadio = v!),
                              label: 'Option 2 (Large with Desc)',
                              size: Ux4gRadioButtonSize.large,
                              description: 'Helper text for option 2',
                            ),
                            const SizedBox(height: 8),
                            Ux4gRadioButton<int>(
                              value: 3,
                              groupValue: _selectedRadio,
                              onChanged: (v) =>
                                  setState(() => _selectedRadio = v!),
                              label: 'Option 3 (Disabled)',
                              size: Ux4gRadioButtonSize.medium,
                              enabled: false,
                            ),
                          ],
                        ),
                      ),

                      // ─── 9. Checkbox ──────────────────────────────────
                      _showcaseCard(
                        title: 'Checkboxes',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gCheckbox(
                              value: _checkbox1,
                              onChanged: (v) => setState(() => _checkbox1 = v),
                              label: 'Checked',
                              size: Ux4gCheckboxSize.medium,
                            ),
                            const SizedBox(height: 8),
                            Ux4gCheckbox(
                              value: _checkbox2,
                              onChanged: (v) => setState(() => _checkbox2 = v),
                              label: 'Unchecked (with description)',
                              description: 'Helper text here',
                              size: Ux4gCheckboxSize.large,
                            ),
                            const SizedBox(height: 8),
                            Ux4gCheckbox(
                              value: _checkbox3,
                              onChanged: (v) => setState(() => _checkbox3 = v),
                              label: 'Indeterminate (tristate)',
                              size: Ux4gCheckboxSize.medium,
                            ),
                            const SizedBox(height: 8),
                            Ux4gCheckbox(
                              value: true,
                              onChanged: (_) {},
                              label: 'Disabled Checked',
                              enabled: false,
                            ),
                          ],
                        ),
                      ),

                      // ─── 10. Toggle ───────────────────────────────────
                      _showcaseCard(
                        title: 'Toggle Switch',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gToggle(
                              checked: _toggle1,
                              onCheckedChange: (v) =>
                                  setState(() => _toggle1 = v),
                              label: 'Notifications',
                              description: 'Receive push notifications',
                              size: Ux4gToggleSize.m,
                              labelPosition: Ux4gToggleLabelPosition.right,
                            ),
                            const SizedBox(height: 12),
                            Ux4gToggle(
                              checked: _toggle2,
                              onCheckedChange: (v) =>
                                  setState(() => _toggle2 = v),
                              label: 'Dark Mode',
                              size: Ux4gToggleSize.l,
                              labelPosition: Ux4gToggleLabelPosition.left,
                            ),
                            const SizedBox(height: 12),
                            Ux4gToggle(
                              checked: true,
                              label: 'Disabled (On)',
                              size: Ux4gToggleSize.s,
                              enabled: false,
                            ),
                          ],
                        ),
                      ),

                      // ─── 11. Dropdown Showcase ────────────────────────
                      _showcaseCard(
                        title: 'Selection Dropdowns',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gSelectionDropdown(
                              options: [
                                Ux4gDropdownOption(
                                  id: 'opt_1',
                                  label: 'Option A',
                                ),
                                Ux4gDropdownOption(
                                  id: 'opt_2',
                                  label: 'Option B',
                                ),
                                Ux4gDropdownOption(
                                  id: 'opt_3',
                                  label: 'Option C',
                                  leadingIcon: Icons.person,
                                ),
                              ],
                              selectedOptionIds: _singleSelected,
                              onSelectionChange: (v) =>
                                  setState(() => _singleSelected = v),
                              label: 'Single Select',
                              description: 'Choose one option',
                              mode: Ux4gDropdownMode.single,
                            ),
                            const SizedBox(height: 16),
                            Ux4gSelectionDropdown(
                              options: [
                                Ux4gDropdownOption(
                                  id: 'opt_1',
                                  label: 'Option A',
                                ),
                                Ux4gDropdownOption(
                                  id: 'opt_2',
                                  label: 'Option B',
                                ),
                                Ux4gDropdownOption(
                                  id: 'opt_3',
                                  label: 'Option C',
                                  leadingIcon: Icons.person,
                                ),
                              ],
                              selectedOptionIds: _multiSelected,
                              onSelectionChange: (v) =>
                                  setState(() => _multiSelected = v),
                              label: 'Multi Select',
                              description: 'Choose multiple options',
                              mode: Ux4gDropdownMode.multi,
                            ),
                          ],
                        ),
                      ),

                      // ─── 12. Searchable Dropdowns ─────────────────────
                      _showcaseCard(
                        title: 'Searchable Selection Dropdowns',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Filter: StartsWithPerTerm',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gSelectionDropdown(
                              options: _stateOptions,
                              selectedOptionIds: _searchableSingleSelected,
                              onSelectionChange: (v) =>
                                  setState(() => _searchableSingleSelected = v),
                              label: 'Single - Starts With Word',
                              description: "Typing 'Pra' matches 'Pradesh'",
                              searchEnabled: true,
                              filterType:
                                  Ux4gDropdownFilterType.startsWithPerTerm,
                              mode: Ux4gDropdownMode.single,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Filter: Contains',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gSelectionDropdown(
                              options: _stateOptions,
                              selectedOptionIds: _searchableSingleSelected,
                              onSelectionChange: (v) =>
                                  setState(() => _searchableSingleSelected = v),
                              label: 'Single - Contains',
                              description: "Typing 'esh' matches 'Pradesh'",
                              searchEnabled: true,
                              filterType: Ux4gDropdownFilterType.contains,
                              mode: Ux4gDropdownMode.single,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Multi Select Searchable',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gSelectionDropdown(
                              options: _stateOptions,
                              selectedOptionIds: _searchableMultiSelected,
                              onSelectionChange: (v) =>
                                  setState(() => _searchableMultiSelected = v),
                              label: 'Multi - Contains',
                              description: 'Choose multiple states',
                              searchEnabled: true,
                              filterType: Ux4gDropdownFilterType.contains,
                              mode: Ux4gDropdownMode.multi,
                            ),
                          ],
                        ),
                      ),

                      // ─── 13. Input Field Showcase ─────────────────────
                      _showcaseCard(
                        title: 'Input Fields',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gInputField(
                              value: _textVal,
                              onValueChange: (v) =>
                                  setState(() => _textVal = v),
                              label: 'Default Input',
                              placeholder: 'Placeholder',
                              caption: 'Helper text',
                              required: true,
                              size: Ux4gInputFieldSize.medium,
                            ),
                            const SizedBox(height: 16),
                            Ux4gInputField(
                              value: _textVal,
                              onValueChange: (v) =>
                                  setState(() => _textVal = v),
                              label: 'Error Input',
                              placeholder: 'Placeholder',
                              caption: 'Error subtitle',
                              status: Ux4gInputFieldStatus.error,
                              trailingIcon: Icons.close,
                            ),
                            const SizedBox(height: 16),
                            Ux4gInputField(
                              value: _passVal,
                              onValueChange: (v) =>
                                  setState(() => _passVal = v),
                              label: 'Password',
                              placeholder: 'Enter your password',
                              type: Ux4gInputFieldType.password,
                            ),
                            const SizedBox(height: 16),
                            Ux4gInputField(
                              value: _textVal,
                              onValueChange: (v) =>
                                  setState(() => _textVal = v),
                              label: 'Amount',
                              placeholder: '100',
                              prefixText: '\$',
                              postfixText: '.00',
                            ),
                            const SizedBox(height: 16),
                            Ux4gInputField(
                              value: _textVal,
                              onValueChange: (v) =>
                                  setState(() => _textVal = v),
                              label: 'Search',
                              placeholder: 'Search...',
                              leadingIcon: Icons.search,
                            ),
                            const SizedBox(height: 16),
                            const Ux4gDivider(),
                            const SizedBox(height: 16),
                            Text(
                              'Aadhaar Input (Specialized)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Ux4gAadhaarInputField(
                              value: _aadhaarValue,
                              onValueChange: (v) {
                                setState(() {
                                  _aadhaarValue = v;
                                  if (v.replaceAll(' ', '').length == 12) {
                                    final isValid =
                                        Ux4gAadhaarInputField.validateAadhaar(
                                          v,
                                        );
                                    _aadhaarStatus = isValid
                                        ? Ux4gInputFieldStatus.success
                                        : Ux4gInputFieldStatus.error;
                                  } else {
                                    _aadhaarStatus =
                                        Ux4gInputFieldStatus.defaultStatus;
                                  }
                                });
                              },
                              status: _aadhaarStatus,
                              required: true,
                              caption:
                                  _aadhaarStatus == Ux4gInputFieldStatus.error
                                  ? 'Invalid Aadhaar number (Verhoeff check failed)'
                                  : (_aadhaarStatus ==
                                            Ux4gInputFieldStatus.success
                                        ? 'Valid Aadhaar number'
                                        : 'Enter your 12-digit Aadhaar number'),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'PAN Input (Specialized)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Ux4gPanInputField(
                              value: _panValue,
                              onValueChange: (v) {
                                setState(() {
                                  _panValue = v;
                                  if (v.length == 10) {
                                    final isValid =
                                        Ux4gPanInputField.validatePan(v);
                                    _panStatus = isValid
                                        ? Ux4gInputFieldStatus.success
                                        : Ux4gInputFieldStatus.error;
                                  } else {
                                    _panStatus =
                                        Ux4gInputFieldStatus.defaultStatus;
                                  }
                                });
                              },
                              status: _panStatus,
                              required: true,
                              caption: _panStatus == Ux4gInputFieldStatus.error
                                  ? 'Invalid PAN number (Format: ABCDE1234F)'
                                  : (_panStatus == Ux4gInputFieldStatus.success
                                        ? 'Valid PAN number'
                                        : 'Enter your 10-character PAN number'),
                            ),
                          ],
                        ),
                      ),

                      // ─── 13b. OTP Input ───────────────────────────────
                      _showcaseCard(
                        title: 'OTP Input',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ─── Interactive Demo ───────────────────────────────
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colors.primary.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(
                                  Ux4gRadius.radius12,
                                ),
                                border: Border.all(
                                  color: colors.primary.withValues(alpha: 0.1),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Interactive Testing Demo',
                                        style: typography.lM_strong.copyWith(
                                          color: colors.primary,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _otpTestValue = '';
                                            _otpTestStatus = Ux4gOtpInputStatus
                                                .defaultStatus;
                                            _otpAttemptsLeft = 3;
                                            _otpIsLocked = false;
                                          });
                                        },
                                        child: const Text('Reset Demo'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Ux4gOtpInput(
                                    length: 6,
                                    value: _otpTestValue,
                                    enabled: !_otpIsLocked,
                                    status: _otpTestStatus,
                                    label:
                                        'Enter Verification Code (Default OTP is 123456)',
                                    captionVariant: _otpIsLocked
                                        ? Ux4gOtpCaptionVariant.locked
                                        : (_otpTestStatus ==
                                                  Ux4gOtpInputStatus.success
                                              ? Ux4gOtpCaptionVariant.success
                                              : (_otpAttemptsLeft < 3
                                                    ? Ux4gOtpCaptionVariant
                                                          .attemptWithTimer
                                                    : Ux4gOtpCaptionVariant
                                                          .plain)),
                                    captionLeadingText: _otpIsLocked
                                        ? 'Locked for 30:00'
                                        : (_otpAttemptsLeft < 3
                                              ? 'Attempt ${4 - _otpAttemptsLeft} of 3'
                                              : 'Correct code is 123456'),
                                    captionTrailingText: _otpIsLocked
                                        ? 'Resend OTP'
                                        : null,
                                    onChanged: (v) {
                                      setState(() {
                                        _otpTestValue = v;
                                        // Reset error state when user types again
                                        if (_otpTestStatus ==
                                            Ux4gOtpInputStatus.error) {
                                          _otpTestStatus =
                                              Ux4gOtpInputStatus.defaultStatus;
                                        }
                                      });
                                    },
                                    onCompleted: (v) {
                                      setState(() {
                                        if (v == '123456') {
                                          _otpTestStatus =
                                              Ux4gOtpInputStatus.success;
                                        } else {
                                          _otpAttemptsLeft--;
                                          if (_otpAttemptsLeft <= 0) {
                                            _otpIsLocked = true;
                                            _otpTestStatus =
                                                Ux4gOtpInputStatus.locked;
                                          } else {
                                            _otpTestStatus =
                                                Ux4gOtpInputStatus.error;
                                          }
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // 4-Digit Demo
                            Ux4gOtpInput(
                              length: 4,
                              value: _otpCountdown,
                              onChanged: (v) =>
                                  setState(() => _otpCountdown = v),
                              label: '4-Digit Mode',
                              captionVariant: Ux4gOtpCaptionVariant.plain,
                              captionText:
                                  'Demo of 4-box layout with separators',
                            ),
                            const SizedBox(height: 32),

                            // Default
                            Text('Default', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 6,
                              value: _otpDefault,
                              onChanged: (v) => setState(() => _otpDefault = v),
                              onCompleted: (v) {},
                              label: 'Label',
                              required: true,
                              labelTrailingIcon: Icons.info_outline,
                              captionVariant: Ux4gOtpCaptionVariant.resendTimer,
                              captionLeadingText: "Didn't receive OTP?",
                              captionTrailingText: 'Resend in 00:30',
                            ),
                            const SizedBox(height: 20),

                            // Resend Action
                            Text('Resend Action', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 6,
                              value: _otpDefault,
                              onChanged: (v) => setState(() => _otpDefault = v),
                              captionVariant:
                                  Ux4gOtpCaptionVariant.resendAction,
                              captionLeadingText: "Didn't receive OTP?",
                              captionTrailingText: 'Resend OTP',
                              onCaptionTrailingTap: () {},
                            ),
                            const SizedBox(height: 20),

                            // Error / Attempt
                            Text(
                              'Error — Attempt 2 of 3',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 6,
                              value: _otpError,
                              onChanged: (v) => setState(() => _otpError = v),
                              status: Ux4gOtpInputStatus.error,
                              captionVariant:
                                  Ux4gOtpCaptionVariant.attemptWithTimer,
                              captionLeadingText: 'Attempt 2 of 3',
                              captionTrailingText: 'Resend OTP in 00:17',
                            ),
                            const SizedBox(height: 20),

                            // Locked
                            Text('Locked', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 6,
                              value: _otpLocked,
                              onChanged: (v) => setState(() => _otpLocked = v),
                              status: Ux4gOtpInputStatus.locked,
                              captionVariant: Ux4gOtpCaptionVariant.locked,
                              captionLeadingText: 'Locked for 28:43',
                              captionTrailingText: 'Resend OTP',
                              onCaptionTrailingTap: () {},
                            ),
                            const SizedBox(height: 20),

                            // Success
                            Text('Success', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 6,
                              value: _otpSuccess,
                              onChanged: (v) => setState(() => _otpSuccess = v),
                              status: Ux4gOtpInputStatus.success,
                              captionVariant: Ux4gOtpCaptionVariant.success,
                              captionText: 'Verification successful',
                            ),
                            const SizedBox(height: 20),

                            // Warning
                            Text('Warning', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 6,
                              value: _otpWarning,
                              onChanged: (v) => setState(() => _otpWarning = v),
                              status: Ux4gOtpInputStatus.warning,
                              captionVariant: Ux4gOtpCaptionVariant.warning,
                              captionText: 'Warning message',
                            ),
                            const SizedBox(height: 20),

                            // Auto Countdown (30s)
                            Text(
                              'Auto Countdown (30s)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 4,
                              value: _otpCountdown,
                              onChanged: (v) =>
                                  setState(() => _otpCountdown = v),
                              captionVariant: _otpCountdownExpired
                                  ? Ux4gOtpCaptionVariant.resendAction
                                  : Ux4gOtpCaptionVariant.resendTimer,
                              captionLeadingText: "Didn't receive OTP?",
                              captionTrailingText: _otpCountdownExpired
                                  ? 'Resend OTP'
                                  : 'Resend in',
                              onCaptionTrailingTap: _otpCountdownExpired
                                  ? () => setState(
                                      () => _otpCountdownExpired = false,
                                    )
                                  : null,
                              autoCountdownSeconds: 30,
                              onCountdownComplete: () =>
                                  setState(() => _otpCountdownExpired = true),
                            ),
                            const SizedBox(height: 20),

                            // Obscure / Password mode
                            Text(
                              'Obscure (Password mode)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gOtpInput(
                              length: 6,
                              value: _otpDefault,
                              onChanged: (v) => setState(() => _otpDefault = v),
                              obscure: true,
                              captionVariant: Ux4gOtpCaptionVariant.plain,
                              captionText: 'Enter your 6-digit PIN',
                            ),
                          ],
                        ),
                      ),

                      // ─── 14. Text Area ────────────────────────────────
                      _showcaseCard(
                        title: 'Text Area',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gTextArea(
                              value: _textAreaVal,
                              onValueChange: (v) =>
                                  setState(() => _textAreaVal = v),
                              label: 'Description',
                              placeholder: 'Write something...',
                              caption: 'Max 200 characters',
                              maxLength: 200,
                              size: Ux4gTextAreaSize.large,
                              minHeight: Ux4gTextAreaMinHeight.medium,
                            ),
                            const SizedBox(height: 16),
                            Ux4gTextArea(
                              value: 'Read only content',
                              onValueChange: (_) {},
                              label: 'Read Only',
                              readOnly: true,
                              size: Ux4gTextAreaSize.small,
                            ),
                          ],
                        ),
                      ),

                      // ─── 15. Search Field ─────────────────────────────
                      _showcaseCard(
                        title: 'Search Field (Autocomplete)',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Builder(
                              builder: (context) {
                                final data = [
                                  'macbook',
                                  'mobile',
                                  'monitor',
                                  'mouse',
                                  'camera',
                                  'keyboard',
                                ];
                                final filtered = data
                                    .where(
                                      (e) => e.contains(
                                        _autocompleteVal.toLowerCase(),
                                      ),
                                    )
                                    .toList();
                                final isLoading = _autocompleteVal == 'mm';
                                return Ux4gSearchField(
                                  value: _autocompleteVal,
                                  onValueChange: (v) =>
                                      setState(() => _autocompleteVal = v),
                                  variant: Ux4gSearchFieldVariant.autocomplete,
                                  label: 'Search components',
                                  placeholder: 'Search for...',
                                  showVoiceIcon: true,
                                  isLoading: isLoading,
                                  options: isLoading ? [] : filtered,
                                  onOptionSelected: (s) =>
                                      setState(() => _autocompleteVal = s),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            Ux4gSearchField(
                              value: '',
                              onValueChange: (_) {},
                              variant: Ux4gSearchFieldVariant.searchWithSubmit,
                              label: 'With Submit Button',
                              placeholder: 'Type and submit...',
                            ),
                          ],
                        ),
                      ),

                      // ─── 16. Tooltip Showcase ─────────────────────────
                      _showcaseCard(
                        title: 'Tooltips (Long-press to show)',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Ux4gTooltip(
                                  tooltipText: 'Top tooltip',
                                  placement: Ux4gTooltipPlacement.top,
                                  child: Ux4gButton(
                                    onPressed: () {},
                                    text: 'Top',
                                    size: Ux4gButtonSize.small,
                                  ),
                                ),
                                Ux4gTooltip(
                                  tooltipText: 'Bottom tooltip',
                                  placement: Ux4gTooltipPlacement.bottom,
                                  child: Ux4gButton(
                                    onPressed: () {},
                                    text: 'Bottom',
                                    size: Ux4gButtonSize.small,
                                  ),
                                ),
                                Ux4gTooltip(
                                  tooltipText: 'With Icon',
                                  placement: Ux4gTooltipPlacement.right,
                                  icon: Icons.info_outline,
                                  child: Ux4gButton(
                                    onPressed: () {},
                                    text: 'Right',
                                    size: Ux4gButtonSize.small,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Ux4gTooltip(
                                  tooltipText: 'Custom Color',
                                  placement: Ux4gTooltipPlacement.left,
                                  backgroundColor: Ux4gColors.primary,
                                  contentColor: Ux4gColors.white,
                                  child: Ux4gButton(
                                    onPressed: () {},
                                    text: 'Left',
                                    size: Ux4gButtonSize.small,
                                  ),
                                ),
                                Ux4gTooltip(
                                  tooltipText: 'Top Start',
                                  placement: Ux4gTooltipPlacement.topStart,
                                  icon: Icons.check_circle,
                                  child: Icon(
                                    Icons.info_outline,
                                    color: colors.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Rich Tooltips (Long-press)',
                              style: typography.tS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gRichTooltip(
                              tooltipText:
                                  'This is a rich tooltip with a title and an action button. Tap outside or the action to dismiss.',
                              title: 'Rich Tooltip',
                              icon: Icons.info_outline,
                              placement: Ux4gTooltipPlacement.top,
                              action: Ux4gButton(
                                onPressed: () {},
                                text: 'Action',
                                size: Ux4gButtonSize.small,
                              ),
                              child: Ux4gButton(
                                onPressed: () {},
                                text: 'Long Press Me',
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── Carousel Showcase ─────────────────────────
                      _showcaseCard(
                        title: 'Carousel (Image Slider)',
                        typography: typography,
                        colors: colors,
                        child: Ux4gCarousel(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          height: 250,
                          items: List.generate(4, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: colors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Slide ${index + 1}',
                                    style: typography.hM_strong,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '(Replace with desired banner content)',
                                    style: typography.lS_default.copyWith(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white70
                                          : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),

                      // ─── Date Picker Showcase ────────────────────────
                      _showcaseCard(
                        title: 'Date Picker',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Single Date Selection',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 8),
                            Ux4gDatePicker(
                              mode: Ux4gDatePickerMode.single,
                              placeholder: 'Select DOB',
                              maxDate: DateTime.now(), // Prevent future DOB
                              onDateSelected: (date) {
                                print('Selected Date: $date');
                              },
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Date Range Selection',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 8),
                            Ux4gDatePicker(
                              mode: Ux4gDatePickerMode.range,
                              placeholder: 'Select range',
                              onDateRangeSelected: (range) {
                                print(
                                  'Selected Range: ${range.start} to ${range.end}',
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // ─── Time Picker Showcase ────────────────────────
                      _showcaseCard(
                        title: 'Time Picker',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Standard Time Picker',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 8),
                            Ux4gTimePicker(
                              placeholder: 'Select time',
                              onTimeSelected: (time) {
                                print('Selected Time: $time');
                              },
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '5-Minute Interval',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 8),
                            Ux4gTimePicker(
                              placeholder: 'Select time (5m intervals)',
                              minuteInterval: 5,
                              onTimeSelected: (time) {
                                print('Selected Time (Interval): $time');
                              },
                            ),
                          ],
                        ),
                      ),
                      // ─── Status Banners Showcase ─────────────────────
                      _showcaseCard(
                        title: 'Status Banners (Top Snackbars)',
                        typography: typography,
                        colors: colors,
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            Ux4gButton(
                              text: 'Show Complex Warning',
                              variant: Ux4gButtonVariant.primary,
                              onPressed: () {
                                Ux4gBannerManager.show(
                                  context,
                                  variant: Ux4gBannerVariant.warningLight,
                                  leadingIcon: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFE5B4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.inventory_2_outlined,
                                      color: Color(0xFFF58220),
                                      size: 16,
                                    ),
                                  ),
                                  title: 'Income Certificate Application',
                                  subtitle: 'Last saved: 10 Apr 2026',
                                  badge: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFE5B4),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Step 3 of 5 Document Upload',
                                      style: typography.lM_default.copyWith(
                                        color: const Color(0xFFF58220),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Ux4gBannerManager.hide(),
                                      child: Text(
                                        'Discard',
                                        style: typography.bM_strong.copyWith(
                                          color: const Color(0xFFC41D7F),
                                        ),
                                      ),
                                    ),
                                    Ux4gButton(
                                      text: 'Resume',
                                      variant: Ux4gButtonVariant.primary,
                                      onPressed: () => Ux4gBannerManager.hide(),
                                    ),
                                  ],
                                  autoDismiss: false,
                                );
                              },
                            ),
                            Ux4gButton(
                              text: 'Show Simple Warning',
                              variant: Ux4gButtonVariant.outline,
                              onPressed: () {
                                Ux4gBannerManager.show(
                                  context,
                                  variant: Ux4gBannerVariant.warningLight,
                                  leadingIcon: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFE5B4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.inventory_2_outlined,
                                      color: Color(0xFFF58220),
                                      size: 16,
                                    ),
                                  ),
                                  title: 'Your draft expires in 5 days',
                                  badge: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFE5B4),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '16 Apr',
                                      style: typography.lM_default.copyWith(
                                        color: const Color(0xFFF58220),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Ux4gButton(
                              text: 'Show Solid Warning',
                              variant: Ux4gButtonVariant.outline,
                              onPressed: () {
                                Ux4gBannerManager.show(
                                  context,
                                  variant: Ux4gBannerVariant.warningSolid,
                                  leadingIcon: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.inventory_2_outlined,
                                      color: Color(0xFFF58220),
                                      size: 16,
                                    ),
                                  ),
                                  title:
                                      'Your draft expires tomorrow. Submit today',
                                );
                              },
                            ),
                            Ux4gButton(
                              text: 'Show Error',
                              variant: Ux4gButtonVariant.outline,
                              onPressed: () {
                                Ux4gBannerManager.show(
                                  context,
                                  variant: Ux4gBannerVariant.errorLight,
                                  leadingIcon: const Icon(
                                    Icons.error_outline,
                                    color: Color(0xFFFF4D4F),
                                    size: 24,
                                  ),
                                  title: 'Draft expired on 9 April 2026',
                                  actions: [
                                    TextButton(
                                      onPressed: () => Ux4gBannerManager.hide(),
                                      child: Text(
                                        'Action',
                                        style: typography.bM_strong.copyWith(
                                          color: const Color(0xFFA8071A),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Ux4gButton(
                              text: 'Show Saving',
                              variant: Ux4gButtonVariant.outline,
                              onPressed: () {
                                Ux4gBannerManager.show(
                                  context,
                                  variant: Ux4gBannerVariant.savingLight,
                                  title: '',
                                  trailingIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Color(0xFF722ED1),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Saving',
                                        style: typography.bM_default.copyWith(
                                          color: Ux4gColors.neutral500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Ux4gButton(
                              text: 'Show Success (Right Icon)',
                              variant: Ux4gButtonVariant.outline,
                              onPressed: () {
                                Ux4gBannerManager.show(
                                  context,
                                  variant: Ux4gBannerVariant.successLight,
                                  title: '',
                                  trailingIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.check_circle_outline,
                                        color: Color(0xFF52C41A),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Saved 3:14 PM',
                                        style: typography.bM_default.copyWith(
                                          color: Ux4gColors.gray900,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Ux4gButton(
                              text: 'Show Success (Left Icon)',
                              variant: Ux4gButtonVariant.outline,
                              onPressed: () {
                                Ux4gBannerManager.show(
                                  context,
                                  variant: Ux4gBannerVariant.successLight,
                                  leadingIcon: const Icon(
                                    Icons.check_circle_outline,
                                    color: Color(0xFF52C41A),
                                    size: 24,
                                  ),
                                  title: 'Draft saved successfully at 3:14 PM',
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // ─── Feedback Form (Star) Showcase ───────────────────────
                      _showcaseCard(
                        title: 'Feedback Form (Star)',
                        typography: typography,
                        colors: colors,
                        child: Center(
                          child: Ux4gFeedbackFormStar(
                            improvementOptions: const [
                              'Content accuracy',
                              'Visual design',
                              'Performance',
                              'Navigation',
                            ],
                            minWords: 0,
                            maxLength: 200,
                            onSubmit: (rating, chip, comment) {
                              print(
                                'Feedback Submitted: Rating: $rating, Chip: $chip, Comment: $comment',
                              );
                            },
                            onSkip: () {
                              print('Feedback Skipped');
                            },
                          ),
                        ),
                      ),

                      // ─── NPS Feedback Form Showcase ───────────────────
                      _showcaseCard(
                        title: 'NPS Feedback Form',
                        typography: typography,
                        colors: colors,
                        child: Center(
                          child: Ux4gFeedbackFormNps(
                            onSubmit: (score, comment) {
                              print(
                                'NPS Submitted: Score: $score, Comment: $comment',
                              );
                            },
                            onSkip: () {
                              print('NPS Skipped');
                            },
                          ),
                        ),
                      ),

                      // ─── CSAT Feedback Form Showcase ──────────────────
                      _showcaseCard(
                        title: 'CSAT Feedback Form',
                        typography: typography,
                        colors: colors,
                        child: Center(
                          child: Ux4gFeedbackFormCsat(
                            onSubmit: (score, comment) {
                              print(
                                'CSAT Submitted: Score: $score, Comment: $comment',
                              );
                            },
                            onSkip: () {
                              print('CSAT Skipped');
                            },
                          ),
                        ),
                      ),

                      // ─── Result Rows Showcase ──────────────────────
                      _showcaseCard(
                        title: 'Result Rows (Search / Status)',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            // 1. Under Review Variant
                            Ux4gResultRow(
                              title: 'Income Certificate',
                              statusTag: 'Under review',
                              tagColorScheme: Ux4gTagColor.warning,
                              actionButtonText: 'Track',
                              details: const [
                                Ux4gResultDetail(
                                  label: 'Reference Number',
                                  value: 'INC-2026-MH-04127',
                                ),
                                Ux4gResultDetail(
                                  label: 'Last Updated Date',
                                  value: '10 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Submitted Date',
                                  value: '1 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Assigned Officer',
                                  value: 'Rahul Sharma',
                                ),
                                Ux4gResultDetail(
                                  label: 'Department',
                                  value: 'Revenue Department',
                                ),
                                Ux4gResultDetail(
                                  label: 'Documents',
                                  value: 'ID Proof, Address Proof',
                                ),
                              ],
                            ),

                            // 2. Download Variant
                            Ux4gResultRow(
                              title: 'Income Certificate',
                              actionButtonText: 'Download',
                              actionButtonIcon: Icons.file_download_outlined,
                              details: const [
                                Ux4gResultDetail(
                                  label: 'Issued',
                                  value: '05 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Valid till',
                                  value: '05 Apr 2027',
                                ),
                                Ux4gResultDetail(
                                  label: 'Reference Number',
                                  value: 'INC-2026-MH-04127',
                                ),
                                Ux4gResultDetail(
                                  label: 'Last Updated Date',
                                  value: '10 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Submitted Date',
                                  value: '1 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Assigned Officer',
                                  value: 'Rahul Sharma',
                                ),
                                Ux4gResultDetail(
                                  label: 'Department',
                                  value: 'Revenue Department',
                                ),
                                Ux4gResultDetail(
                                  label: 'Documents',
                                  value: 'ID Proof, Address Proof',
                                ),
                              ],
                            ),

                            // 3. Metadata Variant (Paid)
                            Ux4gResultRow(
                              title: 'Income Certificate',
                              metadataSegments: const [
                                Ux4gPillSegment(text: 'Paid', bold: true),
                                Ux4gPillSegment(text: '₹ 120/-'),
                                Ux4gPillSegment(
                                  text: '20 mins',
                                  leading: Icon(Icons.access_time, size: 12),
                                ),
                              ],
                              actionButtonText: 'Apply',
                              details: const [
                                Ux4gResultDetail(
                                  label: 'Reference Number',
                                  value: 'INC-2026-MH-04127',
                                ),
                                Ux4gResultDetail(
                                  label: 'Last Updated Date',
                                  value: '10 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Submitted Date',
                                  value: '1 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Assigned Officer',
                                  value: 'Rahul Sharma',
                                ),
                                Ux4gResultDetail(
                                  label: 'Department',
                                  value: 'Revenue Department',
                                ),
                                Ux4gResultDetail(
                                  label: 'Documents',
                                  value: 'ID Proof, Address Proof',
                                ),
                              ],
                            ),

                            // 4. Escalated / Overdue Variant
                            Ux4gResultRow(
                              title: 'Income Certificate',
                              statusTag: 'Escalated',
                              tagColorScheme: Ux4gTagColor.error,
                              actionButtonText: 'Track',
                              details: const [
                                Ux4gResultDetail(
                                  label: 'Reference Number',
                                  value: 'GRV-2026-04127',
                                ),
                                Ux4gResultDetail(
                                  label: 'SLA Status',
                                  value: 'SLA 3 days overdue',
                                  icon: Icons.priority_high,
                                  valueColor: Ux4gColors.orange700,
                                  isBold: true,
                                ),
                                Ux4gResultDetail(
                                  label: 'Submitted Date',
                                  value: '1 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Assigned Officer',
                                  value: 'Rahul Sharma',
                                ),
                                Ux4gResultDetail(
                                  label: 'Department',
                                  value: 'Revenue Department',
                                ),
                                Ux4gResultDetail(
                                  label: 'Documents',
                                  value: 'ID Proof, Address Proof',
                                ),
                              ],
                            ),

                            // 5. Receipt Variant
                            Ux4gResultRow(
                              title: 'Income Certificate',
                              statusTag: 'Paid',
                              tagColorScheme: Ux4gTagColor.success,
                              actionButtonText: 'Receipt',
                              actionButtonIcon: Icons.receipt_long_outlined,
                              detailsColumns: 2,
                              showBottomDivider: false,
                              details: const [
                                Ux4gResultDetail(
                                  label: 'Amount paid',
                                  value: '₹400/-',
                                  isBold: true,
                                ),
                                Ux4gResultDetail(
                                  label: 'Paid on',
                                  value: '12 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Submitted Date',
                                  value: '1 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Assigned Officer',
                                  value: 'Rahul Sharma',
                                ),
                                Ux4gResultDetail(
                                  label: 'Department',
                                  value: 'Revenue Department',
                                ),
                                Ux4gResultDetail(
                                  label: 'Documents',
                                  value: 'ID Proof, Address Proof',
                                ),
                              ],
                            ),

                            // 6. Explicit 2-Column & Custom Color Variant
                            Ux4gResultRow(
                              title: 'Income Certificate',
                              statusTag: 'Paid',
                              tagColorScheme: Ux4gTagColor.success,
                              actionButtonText: 'Download',
                              actionButtonIcon: Icons.download,
                              actionButtonColor:
                                  Ux4gColors.blue700, // Custom Blue Button
                              detailsColumns: 2, // Explicitly 2 columns
                              showBottomDivider: false,
                              details: const [
                                Ux4gResultDetail(
                                  label: 'Reference Number',
                                  value: 'INC-2026-MH-04127',
                                ),
                                Ux4gResultDetail(
                                  label: 'Last Updated Date',
                                  value: '10 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Submitted Date',
                                  value: '1 Apr 2026',
                                ),
                                Ux4gResultDetail(
                                  label: 'Assigned Officer',
                                  value: 'Rahul Sharma',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ─── Divider Showcase ─────────────────────────
                      _showcaseCard(
                        title: 'Dividers',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Horizontal – Solid',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 4),
                            const Ux4gDivider(),
                            const SizedBox(height: 12),
                            Text(
                              'Horizontal – Dashed',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 4),
                            const Ux4gDivider(style: Ux4gDividerStyle.dashed),
                            const SizedBox(height: 12),
                            Text(
                              'Horizontal – Dotted, Primary',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 4),
                            Ux4gDivider(
                              style: Ux4gDividerStyle.dotted,
                              color: Ux4gColors.primary500,
                              thickness: 1.5,
                            ),
                            const SizedBox(height: 12),
                            Text('With Label', style: typography.lM_default),
                            const SizedBox(height: 4),
                            Ux4gDivider(
                              label: Text(
                                'OR',
                                style: typography.lS_strong.copyWith(
                                  color: Ux4gColors.neutral500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Vertical Dividers',
                              style: typography.lM_default,
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              height: 56,
                              child: Row(
                                children: [
                                  Text('Left', style: typography.bM_default),
                                  const SizedBox(width: 8),
                                  const Ux4gDivider(
                                    orientation:
                                        Ux4gDividerOrientation.vertical,
                                  ),
                                  const SizedBox(width: 8),
                                  Text('Mid', style: typography.bM_default),
                                  const SizedBox(width: 8),
                                  const Ux4gDivider(
                                    orientation:
                                        Ux4gDividerOrientation.vertical,
                                    style: Ux4gDividerStyle.dashed,
                                  ),
                                  const SizedBox(width: 8),
                                  Text('Right', style: typography.bM_default),
                                  const SizedBox(width: 8),
                                  Ux4gDivider(
                                    orientation:
                                        Ux4gDividerOrientation.vertical,
                                    color: Ux4gColors.primary500,
                                    thickness: 2,
                                  ),
                                  const SizedBox(width: 8),
                                  Text('End', style: typography.bM_default),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── 18. Tags ─────────────────────────────────────
                      _showcaseCard(
                        title: 'Tags',
                        typography: typography,
                        colors: colors,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            Ux4gTag(text: 'Neutral'),
                            Ux4gTag(
                              text: 'Brand',
                              colorScheme: Ux4gTagColor.brand,
                            ),
                            Ux4gTag(
                              text: 'Success',
                              colorScheme: Ux4gTagColor.success,
                            ),
                            Ux4gTag(
                              text: 'Warning',
                              colorScheme: Ux4gTagColor.warning,
                            ),
                            Ux4gTag(
                              text: 'Error',
                              colorScheme: Ux4gTagColor.error,
                            ),
                            Ux4gTag(
                              text: 'Info',
                              colorScheme: Ux4gTagColor.info,
                            ),
                            Ux4gTag(
                              text: 'Filled',
                              style: Ux4gTagStyle.filled,
                              colorScheme: Ux4gTagColor.brand,
                            ),
                            Ux4gTag(
                              text: 'Outline',
                              style: Ux4gTagStyle.outline,
                              colorScheme: Ux4gTagColor.error,
                            ),
                            Ux4gTag(
                              text: 'Rectangular',
                              shape: Ux4gTagShape.rectangular,
                              colorScheme: Ux4gTagColor.success,
                            ),
                            Ux4gTag(
                              text: 'Large',
                              size: Ux4gTagSize.l,
                              colorScheme: Ux4gTagColor.info,
                            ),
                            Ux4gTag(
                              text: 'Dismissible',
                              colorScheme: Ux4gTagColor.brand,
                              onDismiss: () {},
                            ),
                          ],
                        ),
                      ),

                      // ─── 19. Badges ───────────────────────────────────
                      _showcaseCard(
                        title: 'Badges',
                        typography: typography,
                        colors: colors,
                        child: Wrap(
                          spacing: 24,
                          runSpacing: 16,
                          children: [
                            Ux4gBadge.dot(
                              child: Icon(
                                Icons.notifications,
                                color: colors.onBackground,
                                size: 28,
                              ),
                            ),
                            Ux4gBadge.count(
                              5,
                              child: Icon(
                                Icons.mail,
                                color: colors.onBackground,
                                size: 28,
                              ),
                            ),
                            Ux4gBadge.count(
                              120,
                              limit: Ux4gBadgeLimit.doubleDigit,
                              child: Icon(
                                Icons.shopping_cart,
                                color: colors.onBackground,
                                size: 28,
                              ),
                            ),
                            Ux4gBadge.label(
                              'New',
                              child: Icon(
                                Icons.star,
                                color: colors.onBackground,
                                size: 28,
                              ),
                            ),
                            Ux4gBadge.icon(
                              Icons.check,
                              child: Icon(
                                Icons.person,
                                color: colors.onBackground,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── 20. Chips ────────────────────────────────────
                      _showcaseCard(
                        title: 'Chips',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Choice Chips', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(4, (i) {
                                return Ux4gChoiceChip(
                                  text: 'Choice ${i + 1}',
                                  selected: _selectedChoiceChip == i,
                                  onClick: () =>
                                      setState(() => _selectedChoiceChip = i),
                                );
                              }),
                            ),
                            const SizedBox(height: 16),
                            Text('Filter Chips', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(4, (i) {
                                return Ux4gFilterChip(
                                  text: 'Filter ${i + 1}',
                                  selected: _selectedFilterChips.contains(i),
                                  onClick: () => setState(() {
                                    if (_selectedFilterChips.contains(i)) {
                                      _selectedFilterChips.remove(i);
                                    } else {
                                      _selectedFilterChips.add(i);
                                    }
                                  }),
                                );
                              }),
                            ),
                            const SizedBox(height: 16),
                            Text('Input Chips', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Ux4gInputChip(
                                  text: 'Flutter',
                                  onDismiss: () {},
                                ),
                                Ux4gInputChip(text: 'Dart', onDismiss: () {}),
                                Ux4gInputChip(
                                  text: 'Material',
                                  onDismiss: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ─── 21. Modals ───────────────────────────────────
                      _showcaseCard(
                        title: 'Modals',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gButton(
                              onPressed: () => _showModal(
                                context,
                                Ux4gModal(
                                  onDismiss: () => Navigator.of(context).pop(),
                                  headerImageContent: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF9C6FE0),
                                          Color(0xFFE07BAD),
                                          Color(0xFF7B9FE0),
                                        ],
                                      ),
                                    ),
                                  ),
                                  showHeader: true,
                                  headerTitle: 'Header',
                                  showSubtitle: true,
                                  showBody: true,
                                  showFooter: true,
                                  footerButtons:
                                      Ux4gModalFooterButtons.twoButtons,
                                  footerAlign: Ux4gModalFooterAlign.right,
                                  isDestructive: false,
                                  onPrimaryClick: () =>
                                      Navigator.of(context).pop(),
                                  onSecondaryClick: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ),
                              text: 'Open Default Modal (2 buttons, Left)',
                            ),
                            const SizedBox(height: 8),
                            Ux4gButton(
                              onPressed: () => _showModal(
                                context,
                                Ux4gModal(
                                  onDismiss: () => Navigator.of(context).pop(),
                                  headerImageContent: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF9C6FE0),
                                          Color(0xFFE07BAD),
                                        ],
                                      ),
                                    ),
                                  ),
                                  showHeader: true,
                                  headerTitle: 'Warning',
                                  showDescription: true,
                                  descriptionText:
                                      'This action cannot be undone.',
                                  alignment: Ux4gModalAlignment.centered,
                                  showSubtitle: true,
                                  subtitleText: 'Delete Item?',
                                  showBody: true,
                                  bodyText:
                                      'Are you sure you want to permanently delete this item?',
                                  showFooter: true,
                                  footerButtons:
                                      Ux4gModalFooterButtons.twoButtons,
                                  footerAlign: Ux4gModalFooterAlign.center,
                                  isDestructive: true,
                                  primaryButtonText: 'Delete',
                                  secondaryButtonText: 'Cancel',
                                  onPrimaryClick: () =>
                                      Navigator.of(context).pop(),
                                  onSecondaryClick: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ),
                              text: 'Open Destructive Modal (Centered)',
                              backgroundColor: Ux4gColors.red500,
                              contentColor: Ux4gColors.white,
                            ),
                            const SizedBox(height: 8),
                            Ux4gButton(
                              onPressed: () => _showModal(
                                context,
                                Ux4gModal(
                                  onDismiss: () => Navigator.of(context).pop(),
                                  headerImageStyle: Ux4gModalHeaderImage.none,
                                  showHeader: false,
                                  showDividers: false,
                                  showSubtitle: true,
                                  subtitleText: 'Confirm Action',
                                  showBody: true,
                                  bodyText:
                                      'This will permanently remove the selected items. Continue?',
                                  showFooter: true,
                                  footerButtons:
                                      Ux4gModalFooterButtons.twoButtons,
                                  footerAlign: Ux4gModalFooterAlign.split,
                                  isDestructive: true,
                                  primaryButtonText: 'Confirm',
                                  secondaryButtonText: 'Cancel',
                                  showCloseButton: false,
                                  onPrimaryClick: () =>
                                      Navigator.of(context).pop(),
                                  onSecondaryClick: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ),
                              text: 'Open Minimal Confirm Modal',
                              backgroundColor: Ux4gColors.gray800,
                              contentColor: Ux4gColors.white,
                            ),
                            const SizedBox(height: 8),
                            Ux4gButton(
                              onPressed: () => _showModal(
                                context,
                                Ux4gModal(
                                  onDismiss: () => Navigator.of(context).pop(),
                                  headerImageContent: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF9C6FE0),
                                          Color(0xFFE07BAD),
                                        ],
                                      ),
                                    ),
                                  ),
                                  headerImageStyle: Ux4gModalHeaderImage.padded,
                                  leadingItem: Ux4gModalLeadingItem.avatar,
                                  avatarInitials: 'JD',
                                  alignment: Ux4gModalAlignment.centered,
                                  showHeader: true,
                                  headerTitle: 'Header',
                                  showDescription: true,
                                  descriptionText: 'Write description here',
                                  showSubtitle: true,
                                  showBody: true,
                                  showFooter: true,
                                  footerButtons:
                                      Ux4gModalFooterButtons.oneButton,
                                  footerAlign: Ux4gModalFooterAlign.center,
                                  isDestructive: true,
                                  onPrimaryClick: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ),
                              text: 'Avatar Modal (Centered + Padded)',
                              backgroundColor: Ux4gColors.primary700,
                              contentColor: Ux4gColors.white,
                            ),
                            const SizedBox(height: 8),
                            Ux4gButton(
                              onPressed: () => _showModal(
                                context,
                                Ux4gModal(
                                  onDismiss: () => Navigator.of(context).pop(),
                                  headerImageStyle: Ux4gModalHeaderImage.none,
                                  leadingItem: Ux4gModalLeadingItem.icon,
                                  leadingIcon: Icons.info_outline,
                                  leadingIconTint: Ux4gColors.red500,
                                  alignment: Ux4gModalAlignment.leftAligned,
                                  showHeader: true,
                                  headerTitle: 'Header',
                                  showDescription: true,
                                  descriptionText: 'Write description here',
                                  showSubtitle: true,
                                  showBody: true,
                                  showFooter: true,
                                  footerButtons:
                                      Ux4gModalFooterButtons.twoButtons,
                                  footerAlign: Ux4gModalFooterAlign.split,
                                  isDestructive: true,
                                  primaryButtonText: 'Delete',
                                  secondaryButtonText: 'Cancel',
                                  onPrimaryClick: () =>
                                      Navigator.of(context).pop(),
                                  onSecondaryClick: () =>
                                      Navigator.of(context).pop(),
                                ),
                              ),
                              text: 'Icon Modal (No image + Split)',
                              backgroundColor: Ux4gColors.red700,
                              contentColor: Ux4gColors.white,
                            ),
                          ],
                        ),
                      ),

                      // ─── 22. Card Component ───────────────────────────
                      _sectionTitle('Card Component', typography, colors),
                      const SizedBox(height: 12),

                      // Full card
                      Ux4gCard(
                        mediaImageUrl:
                            'https://picsum.photos/seed/card1/600/300',
                        mediaLabelText: 'Label',
                        avatar: Ux4gAvatar(
                          size: Ux4gAvatarSize.s,
                          initials: 'JD',
                          containerColor: Ux4gColors.primary50,
                          contentColor: Ux4gColors.primary700,
                        ),
                        title: 'Title',
                        subtitle: 'Subtitle',
                        statusChips: const ['Status A', 'Pending', 'Approved'],
                        body:
                            'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development.',
                        bottomChips: const ['Label', 'Label', 'Label', 'Label'],
                        footerType: Ux4gCardFooterType.primaryAndSecondary,
                        footerAlignment: Ux4gCardFooterAlignment.centered,
                        primaryButtonText: 'Confirm',
                        secondaryButtonText: 'Cancel',
                      ),
                      const SizedBox(height: 16),

                      // Outlined card
                      Ux4gCard(
                        mediaImageUrl:
                            'https://picsum.photos/seed/card2/600/300',
                        mediaLabelText: 'New',
                        borderColor: Ux4gColors.primary,
                        borderWidth: 1,
                        title: 'Outlined Card',
                        subtitle: 'No avatar shown here',
                        statusChips: const ['Category', 'Design'],
                        body:
                            'This card has a primary coloured border and only a secondary footer button.',
                        bottomChips: const ['Kotlin', 'Compose', 'Ux4G'],
                        footerType: Ux4gCardFooterType.secondaryOnly,
                        footerAlignment: Ux4gCardFooterAlignment.left,
                        secondaryButtonText: 'Learn More',
                      ),
                      const SizedBox(height: 16),

                      // Elevated card
                      Ux4gCard(
                        elevation: 4,
                        backgroundColor: Color.lerp(
                          colors.surface,
                          colors.primary,
                          0.08,
                        ),
                        cornerRadius: Ux4gRadius.radius16,
                        title: 'Elevated Card',
                        body:
                            'This card has a tinted background and elevated shadow, no image required.',
                        bottomChips: const ['Jetpack', 'Material3', 'API 26+'],
                        footerType: Ux4gCardFooterType.primaryOnly,
                        footerAlignment: Ux4gCardFooterAlignment.right,
                        primaryButtonText: 'Get Started',
                      ),

                      const SizedBox(height: 32),

                      // ─── 23. Sliders ──────────────────────────────────
                      _showcaseCard(
                        title: 'Sliders',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          children: [
                            Ux4gSlider(
                              value: _slider1,
                              onValueChange: (v) =>
                                  setState(() => _slider1 = v),
                              label: 'Basic Single Slider (Small)',
                              showMarksAndValues: true,
                              steps: 9,
                            ),
                            const SizedBox(height: 24),
                            Ux4gRangeSlider(
                              values: _slider2,
                              onValueChange: (v) =>
                                  setState(() => _slider2 = v),
                              label: 'Basic Range Slider (Medium)',
                              size: Ux4gSliderSize.medium,
                              showValueLabels: true,
                              showMarksAndValues: true,
                              steps: 9,
                            ),
                            const SizedBox(height: 24),
                            Ux4gSlider(
                              value: _slider3,
                              onValueChange: (v) =>
                                  setState(() => _slider3 = v),
                              label: 'With Value Indicator',
                              showIndicator: true,
                              showMarksAndValues: true,
                              steps: 4,
                            ),
                            const SizedBox(height: 24),
                            Ux4gRangeSlider(
                              values: _slider4,
                              onValueChange: (v) =>
                                  setState(() => _slider4 = v),
                              label: 'With Editable Input Fields',
                              showInputFields: true,
                              showMarksAndValues: true,
                              steps: 5,
                            ),
                            const SizedBox(height: 24),
                            Ux4gSlider(
                              value: 60,
                              onValueChange: null,
                              label: 'Disabled State',
                              enabled: false,
                              showMarksAndValues: true,
                              steps: 9,
                              caption: 'Component is disabled',
                            ),
                            const SizedBox(height: 24),
                            Ux4gSlider(
                              value: 15,
                              onValueChange: null,
                              label: 'Error state',
                              caption: 'Value is out of budget!',
                              captionVariant: Ux4gSliderCaptionVariant.error,
                              showMarksAndValues: true,
                              steps: 2,
                            ),
                            const SizedBox(height: 16),
                            Ux4gSlider(
                              value: 85,
                              onValueChange: null,
                              label: 'Warning state',
                              caption: 'High priority task',
                              captionVariant: Ux4gSliderCaptionVariant.warning,
                              showMarksAndValues: true,
                              steps: 2,
                            ),
                            const SizedBox(height: 16),
                            Ux4gSlider(
                              value: 100,
                              onValueChange: null,
                              label: 'Success state',
                              caption: 'Target achieved!',
                              captionVariant: Ux4gSliderCaptionVariant.success,
                              showMarksAndValues: true,
                              steps: 2,
                            ),
                          ],
                        ),
                      ),

                      // --- 24. Linear Progress ---
                      _showcaseCard(
                        title: 'Linear Progress Bar',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Interactive Demo',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Ux4gAnimatedLinearProgressBar(
                              value: _progressValue,
                              icon: Icons.rocket_launch_outlined,
                              iconColor: const Color(0xFF6A4EFF),
                              iconBackgroundColor: const Color(
                                0xFF6A4EFF,
                              ).withValues(alpha: 0.12),
                              label: 'Upload Progress',
                              height: 12,
                              shape: Ux4gProgressShape.rounded,
                              gradientColors: const [
                                Color(0xFF6A4EFF),
                                Color(0xFF9B59B6),
                              ],
                              showPercentage: true,
                              labelPosition: Ux4gProgressLabelPosition.outside,
                              duration: const Duration(milliseconds: 800),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () =>
                                        setState(() => _progressValue = 0.0),
                                    text: 'Reset',
                                    variant: Ux4gButtonVariant.outline,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: _progressValue >= 1.0
                                        ? null
                                        : () => setState(
                                            () => _progressValue =
                                                (_progressValue + 0.1).clamp(
                                                  0.0,
                                                  1.0,
                                                ),
                                          ),
                                    text: '+10%',
                                    enabled: _progressValue < 1.0,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () =>
                                        setState(() => _progressValue = 1.0),
                                    text: 'Complete',
                                    backgroundColor: Ux4gColors.green600,
                                    contentColor: Ux4gColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'With Icon, Label & Gradient',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Ux4gLinearProgress(
                              value: 0.55,
                              icon: Icons.cloud_upload_outlined,
                              iconColor: const Color(0xFF6A4EFF),
                              iconBackgroundColor: const Color(
                                0xFF6A4EFF,
                              ).withValues(alpha: 0.12),
                              label: 'Label',
                              hint: 'Hint',
                              height: 10,
                              shape: Ux4gProgressShape.rounded,
                              gradientColors: const [
                                Color(0xFF6A4EFF),
                                Color(0xFF9B59B6),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Ux4gLinearProgress(
                              value: 0.45,
                              icon: Icons.bolt_outlined,
                              iconColor: const Color(0xFFF39C12),
                              iconBackgroundColor: const Color(
                                0xFFF39C12,
                              ).withValues(alpha: 0.12),
                              label: 'Label',
                              hint: 'Hint',
                              height: 10,
                              shape: Ux4gProgressShape.rounded,
                              gradientColors: const [
                                Color(0xFFFFAE00),
                                Color(0xFFFF5F00),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Ux4gLinearProgress(
                              value: 0.35,
                              icon: Icons.warning_amber_rounded,
                              iconColor: const Color(0xFFE74C3C),
                              iconBackgroundColor: const Color(
                                0xFFE74C3C,
                              ).withValues(alpha: 0.12),
                              label: 'Label',
                              hint: 'Hint',
                              height: 10,
                              shape: Ux4gProgressShape.rounded,
                              gradientColors: const [
                                Color(0xFFFFB3AE),
                                Color(0xFFE74C3C),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Ux4gLinearProgress(
                              value: 0.6,
                              icon: Icons.check_circle_outline,
                              iconColor: const Color(0xFF27AE60),
                              iconBackgroundColor: const Color(
                                0xFF27AE60,
                              ).withValues(alpha: 0.12),
                              label: 'Label',
                              hint: 'Hint',
                              height: 10,
                              shape: Ux4gProgressShape.rounded,
                              gradientColors: const [
                                Color(0xFF90EE90),
                                Color(0xFF27AE60),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Sharp vs Rounded',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sharp',
                                        style: typography.lS_default.copyWith(
                                          color: Ux4gColors.neutral500,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Ux4gLinearProgress(
                                        value: 0.65,
                                        height: 12,
                                        shape: Ux4gProgressShape.sharp,
                                        color: Ux4gColors.primary,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rounded',
                                        style: typography.lS_default.copyWith(
                                          color: Ux4gColors.neutral500,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Ux4gLinearProgress(
                                        value: 0.65,
                                        height: 12,
                                        shape: Ux4gProgressShape.rounded,
                                        color: Ux4gColors.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Label Outside vs Inside',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Column(
                              children: List.generate(5, (i) {
                                final val = (i + 1) * 0.2;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Ux4gLinearProgress(
                                          value: val,
                                          height: 16,
                                          shape: Ux4gProgressShape.sharp,
                                          color: Ux4gColors.primary,
                                          showPercentage: true,
                                          labelPosition:
                                              Ux4gProgressLabelPosition.outside,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Ux4gLinearProgress(
                                          value: val,
                                          height: 16,
                                          shape: Ux4gProgressShape.rounded,
                                          color: Ux4gColors.primary,
                                          showPercentage: true,
                                          labelPosition:
                                              Ux4gProgressLabelPosition.outside,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Ux4gLinearProgress(
                                          value: val,
                                          height: 16,
                                          shape: Ux4gProgressShape.sharp,
                                          color: Ux4gColors.primary,
                                          showPercentage: true,
                                          labelPosition:
                                              Ux4gProgressLabelPosition.inside,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Ux4gLinearProgress(
                                          value: val,
                                          height: 16,
                                          shape: Ux4gProgressShape.rounded,
                                          color: Ux4gColors.primary,
                                          showPercentage: true,
                                          labelPosition:
                                              Ux4gProgressLabelPosition.inside,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),

                      // ─── 24. Interactive Toast ────────────────────────
                      _showcaseCard(
                        title: 'Circular Progress Indicator',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Interactive Demo',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: Ux4gAnimatedCircularProgress(
                                value: _circularProgressValue,
                                size: Ux4gCircularProgressSize.xxxl,
                                backgroundColor: colors.onSurface.withValues(
                                  alpha: 0.05,
                                ),
                                progressGradient: SweepGradient(
                                  transform: GradientRotation(-math.pi / 2),
                                  colors: [
                                    Color(0xFFDCD4FF),
                                    Color(0xFF6A4EFF),
                                  ],
                                ),
                                centerValueText:
                                    '${(_circularProgressValue * 100).round()}%',
                                centerDescription: 'Description',
                                label:
                                    '${(_circularProgressValue * 100).round()}%',
                                description: 'Description',
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () => setState(
                                      () => _circularProgressValue = 0.0,
                                    ),
                                    text: 'Reset',
                                    variant: Ux4gButtonVariant.outline,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: _circularProgressValue >= 1.0
                                        ? null
                                        : () => setState(
                                            () => _circularProgressValue =
                                                (_circularProgressValue + 0.1)
                                                    .clamp(0.0, 1.0),
                                          ),
                                    text: '+10%',
                                    enabled: _circularProgressValue < 1.0,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () => setState(
                                      () => _circularProgressValue = 1.0,
                                    ),
                                    text: 'Complete',
                                    backgroundColor: Ux4gColors.green600,
                                    contentColor: Ux4gColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Responsive Size Matrix',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final compact = constraints.maxWidth < 780;
                                final items = [
                                  ('XS', Ux4gCircularProgressSize.xs, false),
                                  ('S', Ux4gCircularProgressSize.s, false),
                                  ('M', Ux4gCircularProgressSize.m, false),
                                  ('L', Ux4gCircularProgressSize.l, false),
                                  ('XL', Ux4gCircularProgressSize.xl, true),
                                  ('2XL', Ux4gCircularProgressSize.xxl, true),
                                  ('3XL', Ux4gCircularProgressSize.xxxl, true),
                                ];

                                return Wrap(
                                  spacing: compact ? 24 : 36,
                                  runSpacing: compact ? 28 : 40,
                                  children: items
                                      .map(
                                        (item) => SizedBox(
                                          width: compact ? 112 : 128,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                item.$1,
                                                style: typography.lM_strong,
                                              ),
                                              const SizedBox(height: 10),
                                              _circularProgressDemoItem(
                                                size: item.$2,
                                                inlineMeta: item.$3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Color Variants (Rounded)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _circularColorVariant(
                                    colors: colors,
                                    typography: typography,
                                    progressColor: const Color(0xFF6A4EFF),
                                    gradient: const SweepGradient(
                                      transform: GradientRotation(-math.pi / 2),
                                      colors: [
                                        Color(0xFFDCD4FF),
                                        Color(0xFF6A4EFF),
                                      ],
                                    ),
                                    footerColor: const Color(0xFFEFEAFF),
                                    footerTextColor: const Color(0xFF6A4EFF),
                                  ),
                                  const SizedBox(width: 20),
                                  _circularColorVariant(
                                    colors: colors,
                                    typography: typography,
                                    progressColor: const Color(0xFFFFA827),
                                    gradient: const SweepGradient(
                                      transform: GradientRotation(-math.pi / 2),
                                      colors: [
                                        Color(0xFFFFF2D9),
                                        Color(0xFFFFA827),
                                      ],
                                    ),
                                    footerColor: const Color(0xFFFFF7E6),
                                    footerTextColor: const Color(0xFFFFA827),
                                  ),
                                  const SizedBox(width: 20),
                                  _circularColorVariant(
                                    colors: colors,
                                    typography: typography,
                                    progressColor: const Color(0xFFF55E57),
                                    descriptionColor: const Color(0xFFB3251E),
                                    gradient: const SweepGradient(
                                      transform: GradientRotation(-math.pi / 2),
                                      colors: [
                                        Color(0xFFFFECEE),
                                        Color(0xFFF55E57),
                                      ],
                                    ),
                                    footerColor: const Color(0xFFFFF0F0),
                                    footerTextColor: const Color(0xFFF55E57),
                                  ),
                                  const SizedBox(width: 20),
                                  _circularColorVariant(
                                    colors: colors,
                                    typography: typography,
                                    progressColor: const Color(0xFF1AA64A),
                                    gradient: const SweepGradient(
                                      transform: GradientRotation(-math.pi / 2),
                                      colors: [
                                        Color(0xFFDFF9E8),
                                        Color(0xFF1AA64A),
                                      ],
                                    ),
                                    footerColor: const Color(0xFFF2FCEF),
                                    footerTextColor: const Color(0xFF1AA64A),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── Status Pipeline ──────────────────────────
                      _showcaseCard(
                        title: 'Status Pipeline',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── Vertical — Circles Only ──
                            Text(
                              'Vertical — Circles Only',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.vertical,
                              size: Ux4gPipelineSize.m,
                              currentStep: 1,
                              showLabels: false,
                              showDescriptions: false,
                              steps: [
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            // ── Vertical — With Labels ──
                            Text(
                              'Vertical — With Labels',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.vertical,
                              size: Ux4gPipelineSize.m,
                              currentStep: 1,
                              showDescriptions: false,
                              steps: [
                                Ux4gPipelineStep(label: 'Submitted'),
                                Ux4gPipelineStep(label: 'Verification'),
                                Ux4gPipelineStep(label: 'Inspection'),
                                Ux4gPipelineStep(label: 'Decision'),
                                Ux4gPipelineStep(label: 'Issued'),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            // ── Vertical — Labels + Descriptions ──
                            Text(
                              'Vertical — Labels + Descriptions',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.vertical,
                              size: Ux4gPipelineSize.m,
                              currentStep: 1,
                              steps: [
                                Ux4gPipelineStep(
                                  label: 'Submitted',
                                  description: '5 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Verification',
                                  description: 'In progress',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Inspection',
                                  description: 'Est. 10 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Decision',
                                  description: 'Est. 18 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Issued',
                                  description: 'Est. 20 Apr',
                                ),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            // ── Vertical — With Error & Warning ──
                            Text(
                              'Vertical — Error & Warning States',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.vertical,
                              size: Ux4gPipelineSize.m,
                              currentStep: -1,
                              steps: [
                                Ux4gPipelineStep(
                                  label: 'Submitted',
                                  description: '5 Apr',
                                  state: Ux4gPipelineStepState.completed,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Verification',
                                  description: 'Failed',
                                  state: Ux4gPipelineStepState.error,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Inspection',
                                  description: 'Blocked',
                                  state: Ux4gPipelineStepState.warning,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Decision',
                                  state: Ux4gPipelineStepState.upcoming,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Issued',
                                  state: Ux4gPipelineStepState.upcoming,
                                ),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            // ── Vertical — Small Size ──
                            Text(
                              'Vertical — Small Size',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.vertical,
                              size: Ux4gPipelineSize.s,
                              currentStep: 1,
                              steps: [
                                Ux4gPipelineStep(
                                  label: 'Submitted',
                                  description: '5 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Verification',
                                  description: 'In progress',
                                ),
                                Ux4gPipelineStep(label: 'Inspection'),
                                Ux4gPipelineStep(label: 'Decision'),
                                Ux4gPipelineStep(label: 'Issued'),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            // ── Vertical — Large Size ──
                            Text(
                              'Vertical — Large Size',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.vertical,
                              size: Ux4gPipelineSize.l,
                              currentStep: 2,
                              steps: [
                                Ux4gPipelineStep(
                                  label: 'Submitted',
                                  description: '5 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Verification',
                                  description: '8 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Inspection',
                                  description: 'In progress',
                                ),
                                Ux4gPipelineStep(label: 'Decision'),
                                Ux4gPipelineStep(label: 'Issued'),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space32),

                            // ══════════════════════════════════════════════
                            // HORIZONTAL
                            // ══════════════════════════════════════════════
                            Text(
                              'Horizontal — Circles Only',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.horizontal,
                              size: Ux4gPipelineSize.m,
                              currentStep: 1,
                              showLabels: false,
                              showDescriptions: false,
                              steps: [
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                                Ux4gPipelineStep(),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            Text(
                              'Horizontal — With Labels',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.horizontal,
                              size: Ux4gPipelineSize.m,
                              currentStep: 1,
                              showDescriptions: false,
                              steps: [
                                Ux4gPipelineStep(label: 'Submitted'),
                                Ux4gPipelineStep(label: 'Verification'),
                                Ux4gPipelineStep(label: 'Inspection'),
                                Ux4gPipelineStep(label: 'Decision'),
                                Ux4gPipelineStep(label: 'Issued'),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            Text(
                              'Horizontal — Labels + Descriptions',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.horizontal,
                              size: Ux4gPipelineSize.m,
                              currentStep: 1,
                              steps: [
                                Ux4gPipelineStep(
                                  label: 'Submitted',
                                  description: '5 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Verification',
                                  description: 'In progress',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Inspection',
                                  description: 'Est. 10 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Decision',
                                  description: 'Est. 18 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Issued',
                                  description: 'Est. 20 Apr',
                                ),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            Text(
                              'Horizontal — Small Size',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.horizontal,
                              size: Ux4gPipelineSize.s,
                              currentStep: 1,
                              steps: [
                                Ux4gPipelineStep(
                                  label: 'Submitted',
                                  description: '5 Apr',
                                ),
                                Ux4gPipelineStep(
                                  label: 'Verification',
                                  description: 'In progress',
                                ),
                                Ux4gPipelineStep(label: 'Inspection'),
                                Ux4gPipelineStep(label: 'Decision'),
                                Ux4gPipelineStep(label: 'Issued'),
                              ],
                            ),

                            const SizedBox(height: Ux4gSpace.space24),

                            Text(
                              'Horizontal — Error & Warning',
                              style: typography.bS_strong,
                            ),
                            const SizedBox(height: Ux4gSpace.space12),
                            const Ux4gStatusPipeline(
                              orientation: Ux4gPipelineOrientation.horizontal,
                              size: Ux4gPipelineSize.m,
                              currentStep: -1,
                              steps: [
                                Ux4gPipelineStep(
                                  label: 'Submitted',
                                  description: '5 Apr',
                                  state: Ux4gPipelineStepState.completed,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Verification',
                                  description: 'Failed',
                                  state: Ux4gPipelineStepState.error,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Inspection',
                                  state: Ux4gPipelineStepState.warning,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Decision',
                                  state: Ux4gPipelineStepState.upcoming,
                                ),
                                Ux4gPipelineStep(
                                  label: 'Issued',
                                  state: Ux4gPipelineStepState.upcoming,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ─── Journey Timeline ───────────────────────────
                      _showcaseCard(
                        title: 'Journey Timeline',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── Vertical Timeline with header ──
                            Text(
                              'Vertical Timeline',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Ux4gJourneyTimeline(
                              header: const Ux4gJourneyHeader(
                                title: 'Title',
                                description: 'Description',
                                icon: Icons.settings_outlined,
                              ),
                              currentStep: 1,
                              steps: [
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                              ],
                            ),

                            const SizedBox(height: 32),

                            // ── Card Variants ──
                            Text(
                              'Card Variants',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Ux4gJourneyTimeline(
                              currentStep: 4,
                              steps: [
                                // Simple
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                // With helping text
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                  helpingText: 'Helping Text',
                                ),
                                // With icon
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                  icon: Icons.link,
                                ),
                                // With status
                                Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                  status: Ux4gJourneyStepStatus(
                                    text: '2 days remaining',
                                    dotColor: Ux4gColors.secondary,
                                    badgeText: 'Pending',
                                    badgeColor: Ux4gColors.secondary
                                        .withValues(alpha: 0.12),
                                    badgeTextColor: Ux4gColors.secondary,
                                  ),
                                ),
                                // Upcoming (gray)
                                const Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                              ],
                            ),

                            const SizedBox(height: 32),

                            // ── Horizontal Timeline ──
                            Text(
                              'Horizontal Timeline',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Ux4gJourneyTimeline(
                              orientation: Ux4gJourneyOrientation.horizontal,
                              header: const Ux4gJourneyHeader(
                                title: 'Title',
                                description: 'Description',
                                icon: Icons.settings_outlined,
                              ),
                              currentStep: 1,
                              steps: const [
                                Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                                Ux4gJourneyStep(
                                  title: 'Title',
                                  date: 'Date',
                                  tag: 'Tag',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ─── App Header ─────────────────────────────────
                      _showcaseCard(
                        title: 'App Header',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── Default: Emblem + Logo + Title + Settings + Avatar ──
                            Text(
                              'With Leading Icons + Avatar',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    leadingWidgets: [
                                      Icon(
                                        Icons.account_balance,
                                        size: 24,
                                        color: v == Ux4gAppHeaderVariant.filled
                                            ? colors.onPrimary
                                            : colors.onSurface,
                                      ),
                                      Icon(
                                        Icons.waves,
                                        size: 24,
                                        color: v == Ux4gAppHeaderVariant.filled
                                            ? colors.onPrimary
                                            : colors.primary,
                                      ),
                                    ],
                                    actions: [
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                    ],
                                    showAvatar: true,
                                    avatarSize: Ux4gAvatarSize.s,
                                    avatarImageUrl:
                                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ── Emblem + Logo + Title + Settings + Hamburger ──
                            Text(
                              'With Leading Icons + Hamburger Menu',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    leadingWidgets: [
                                      Icon(
                                        Icons.account_balance,
                                        size: 24,
                                        color: v == Ux4gAppHeaderVariant.filled
                                            ? colors.onPrimary
                                            : colors.onSurface,
                                      ),
                                      Icon(
                                        Icons.waves,
                                        size: 24,
                                        color: v == Ux4gAppHeaderVariant.filled
                                            ? colors.onPrimary
                                            : colors.primary,
                                      ),
                                    ],
                                    actions: [
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                      Ux4gAppHeaderAction(
                                        icon: Icons.menu,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ── Back + Title (simple) ──
                            Text(
                              'Back + Title Only',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    showBackButton: true,
                                    onBackPressed: () {},
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ── Back + Title + 1 Action ──
                            Text(
                              'Back + Title + Action',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    showBackButton: true,
                                    onBackPressed: () {},
                                    actions: [
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ── Back + Title + 2 Actions ──
                            Text(
                              'Back + Title + 2 Actions',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    showBackButton: true,
                                    onBackPressed: () {},
                                    actions: [
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ── Back + Title + 3 Actions ──
                            Text(
                              'Back + Title + 3 Actions',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    showBackButton: true,
                                    onBackPressed: () {},
                                    actions: [
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ── With Status Avatar ──
                            Text(
                              'With Status Avatar',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    leadingWidgets: [
                                      Icon(
                                        Icons.account_balance,
                                        size: 24,
                                        color: v == Ux4gAppHeaderVariant.filled
                                            ? colors.onPrimary
                                            : colors.onSurface,
                                      ),
                                      Icon(
                                        Icons.waves,
                                        size: 24,
                                        color: v == Ux4gAppHeaderVariant.filled
                                            ? colors.onPrimary
                                            : colors.primary,
                                      ),
                                    ],
                                    actions: [
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                    ],
                                    avatar: Ux4gStatusAvatar(
                                      size: Ux4gAvatarSize.s,
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
                                      variant: Ux4gStatusVariant.online,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            // ── Back + Title + Status Avatar ──
                            Text(
                              'Back + Title + Status Avatar',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...[
                              Ux4gAppHeaderVariant.light,
                              Ux4gAppHeaderVariant.filled,
                              Ux4gAppHeaderVariant.outlined,
                            ].map(
                              (v) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Ux4gAppHeader(
                                    title: 'Title',
                                    variant: v,
                                    showBackButton: true,
                                    onBackPressed: () {},
                                    actions: [
                                      Ux4gAppHeaderAction(
                                        icon: Icons.settings_outlined,
                                        onPressed: () {},
                                      ),
                                    ],
                                    avatar: Ux4gStatusAvatar(
                                      size: Ux4gAvatarSize.s,
                                      initials: 'JD',
                                      variant: Ux4gStatusVariant.busy,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── Half Circle Progress Indicator ─────────────
                      _showcaseCard(
                        title: 'Half Circle Progress Indicator',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ── Without Scale ──
                            Text(
                              'Without Scale',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 24,
                              runSpacing: 24,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.s,
                                  description: 'Description',
                                ),
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.m,
                                  description: 'Description',
                                ),
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.l,
                                  description: 'Description',
                                ),
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.xl,
                                  description: 'Description',
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),

                            // ── With Scale ──
                            Text(
                              'With Scale',
                              style: typography.bS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 24,
                              runSpacing: 24,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.s,
                                  description: 'Description',
                                  showScale: true,
                                ),
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.m,
                                  description: 'Description',
                                  showScale: true,
                                ),
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.l,
                                  description: 'Description',
                                  showScale: true,
                                ),
                                Ux4gHalfCircleProgress(
                                  value: 0.5,
                                  size: Ux4gHalfCircleProgressSize.xl,
                                  description: 'Description',
                                  showScale: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      _showcaseCard(
                        title: 'Interactive Toasts',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Position: ${_toastAtTop ? "Top" : "Bottom"}',
                              style: typography.bS_default,
                            ),
                            const SizedBox(height: 8),
                            Ux4gButton(
                              onPressed: () =>
                                  setState(() => _toastAtTop = !_toastAtTop),
                              text: 'Toggle Toast Position',
                              backgroundColor: Ux4gColors.gray800,
                              contentColor: Ux4gColors.white,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () => _toastHostState.showToast(
                                      category: Ux4gToastCategory.success,
                                      title: 'Success!',
                                      subtitle:
                                          'Operation completed successfully.',
                                      autoClose: true,
                                      duration: const Duration(seconds: 2),
                                    ),
                                    text: 'Success',
                                    backgroundColor: Ux4gColors.green500,
                                    contentColor: Ux4gColors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () => _toastHostState.showToast(
                                      category: Ux4gToastCategory.error,
                                      title: 'Error',
                                      subtitle: 'Something went wrong.',
                                      autoClose: true,
                                      duration: const Duration(seconds: 2),
                                    ),
                                    text: 'Error',
                                    backgroundColor: Ux4gColors.red500,
                                    contentColor: Ux4gColors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () => _toastHostState.showToast(
                                      category: Ux4gToastCategory.warning,
                                      title: 'Warning',
                                      subtitle: 'Please check your input.',
                                      autoClose: true,
                                      duration: const Duration(seconds: 2),
                                    ),
                                    text: 'Warning',
                                    backgroundColor: Ux4gColors.gold600,
                                    contentColor: Ux4gColors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: () => _toastHostState.showToast(
                                      category: Ux4gToastCategory.info,
                                      title: 'Info',
                                      subtitle: 'New update available.',
                                      autoClose: true,
                                      duration: const Duration(seconds: 2),
                                    ),
                                    text: 'Info',
                                    backgroundColor: Ux4gColors.cyan600,
                                    contentColor: Ux4gColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ─── 25. Static Toast Varieties ───────────────────
                      _showcaseCard(
                        title: 'Toast Varieties',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Layout (Tablet/Desktop)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gToast(
                              category: Ux4gToastCategory.info,
                              title: 'Info',
                              subtitle: 'Write your information text here',
                              actionText: 'Action',
                            ),
                            const SizedBox(height: 8),
                            Ux4gToast(
                              category: Ux4gToastCategory.success,
                              title: 'Success',
                              subtitle: 'Write your success text here',
                              actionText: 'Action',
                            ),
                            const SizedBox(height: 8),
                            Ux4gToast(
                              category: Ux4gToastCategory.warning,
                              title: 'Warning',
                              subtitle: 'Write your warning text here',
                              actionText: 'Action',
                            ),
                            const SizedBox(height: 8),
                            Ux4gToast(
                              category: Ux4gToastCategory.error,
                              title: 'Error',
                              subtitle: 'Write your error text here',
                              actionText: 'Action',
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Stacked Layout (Mobile)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gToast(
                              category: Ux4gToastCategory.info,
                              title: 'Info',
                              subtitle: 'Write your information text here',
                              actionText: 'Action',
                              layout: Ux4gToastLayout.stacked,
                            ),
                            const SizedBox(height: 8),
                            Ux4gToast(
                              category: Ux4gToastCategory.warning,
                              title: 'Warning',
                              subtitle: 'Write your warning text here',
                              actionText: 'Action',
                              layout: Ux4gToastLayout.stacked,
                            ),
                          ],
                        ),
                      ),

                      // ─── 26. Stepper ──────────────────────────────────
                      _showcaseCard(
                        title: 'Stepper Component',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Horizontal Stepper',
                              style: typography.lM_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gStepper(
                              totalSteps: 4,
                              currentStep: _currentStep,
                              orientation: StepperOrientation.horizontal,
                              steps: [
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Vertical Stepper',
                              style: typography.lM_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gStepper(
                              totalSteps: 4,
                              currentStep: _currentStep,
                              orientation: StepperOrientation.vertical,
                              steps: [
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                                Ux4gStepItem(
                                  title: 'Label',
                                  description: 'Write description here',
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: _currentStep > 1
                                        ? () => setState(() => _currentStep--)
                                        : null,
                                    text: 'Previous',
                                    enabled: _currentStep > 1,
                                    backgroundColor: Ux4gColors.gray800,
                                    contentColor: Ux4gColors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Ux4gButton(
                                    onPressed: _currentStep < 4
                                        ? () => setState(() => _currentStep++)
                                        : null,
                                    text: 'Next',
                                    enabled: _currentStep < 4,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Ux4gDivider(),
                            const SizedBox(height: 16),
                            Text(
                              'Stepper with Error State',
                              style: typography.lM_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gStepper(
                              totalSteps: 4,
                              currentStep: 3,
                              orientation: StepperOrientation.horizontal,
                              steps: [
                                Ux4gStepItem(
                                  title: 'Account',
                                  description: 'Completed',
                                ),
                                Ux4gStepItem(
                                  title: 'Profile',
                                  description: 'Completed',
                                ),
                                Ux4gStepItem(
                                  title: 'Payment',
                                  description: 'Transaction failed',
                                  isError: true,
                                ),
                                Ux4gStepItem(
                                  title: 'Done',
                                  description: 'Pending',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ─── 27. Pagination ───────────────────────────────
                      _showcaseCard(
                        title: 'Pagination Dotted',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Default', style: typography.lM_strong),
                            const SizedBox(height: 8),
                            Center(
                              child: Ux4gPaginationDotted(
                                totalPageCount: 7,
                                currentPageIndex: _pageIndex,
                                onPageChange: (v) =>
                                    setState(() => _pageIndex = v),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Capsule', style: typography.lM_strong),
                            const SizedBox(height: 8),
                            Center(
                              child: Ux4gPaginationDotted(
                                totalPageCount: 7,
                                currentPageIndex: _pageIndex,
                                onPageChange: (v) =>
                                    setState(() => _pageIndex = v),
                                variant: Ux4gPaginationVariant.capsule,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Dots Only (no arrows)',
                              style: typography.lM_strong,
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Ux4gPaginationDotted(
                                totalPageCount: 7,
                                currentPageIndex: _pageIndex,
                                onPageChange: (v) =>
                                    setState(() => _pageIndex = v),
                                showArrows: false,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── 28. Bottom Sheets ────────────────────────────
                      _showcaseCard(
                        title: 'Bottom Sheet (Ux4gBottomSheet)',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Modal bottom sheet built strictly to UX4G Figma Bottom Sheet component set: 4 size presets, header/footer variants, draggable multi-snap expansion (peek 26% -> half 50% -> expanded 75% -> full 94%), fixed bottom action buttons, and full dark/light theme support.',
                              style: typography.bS_default.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // 1. Sizes
                            Text(
                              '1. Sizes (peek, half, expanded, full)',
                              style: typography.lS_strong.copyWith(
                                color: colors.primary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Heights come from Figma Size variant as screen ratio: peek 26%, half 50%, expanded 75%, full 94%.',
                              style: typography.bXS_default.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final size in Ux4gBottomSheetSize.values)
                                  Ux4gButton(
                                    variant: Ux4gButtonVariant.outline,
                                    size: Ux4gButtonSize.small,
                                    text: size.name,
                                    onPressed: () => Ux4gBottomSheet.show(
                                      context,
                                      size: size,
                                      title: 'Size = ${size.name}',
                                      description:
                                          'Drag the handle or header down to collapse/dismiss or up to expand.',
                                      primaryButtonText: 'Confirm',
                                      secondaryButtonText: 'Cancel',
                                      content: _demoBottomSheetBody(
                                        lines: 10,
                                        color: colors.onSurface.withValues(
                                          alpha: 0.75,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // 2. Header variations
                            Text(
                              '2. Header Variations',
                              style: typography.lS_strong.copyWith(
                                color: colors.primary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Ux4gButton(
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  text: 'Title + Description',
                                  onPressed: () => Ux4gBottomSheet.show(
                                    context,
                                    size: Ux4gBottomSheetSize.half,
                                    title: 'Header',
                                    description: 'Write description here',
                                    primaryButtonText: 'Confirm',
                                    secondaryButtonText: 'Cancel',
                                    content: _demoBottomSheetBody(
                                      lines: 6,
                                      color: colors.onSurface.withValues(
                                        alpha: 0.75,
                                      ),
                                    ),
                                  ),
                                ),
                                Ux4gButton(
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  text: 'Icon + Subtle Text',
                                  onPressed: () => Ux4gBottomSheet.show(
                                    context,
                                    size: Ux4gBottomSheetSize.half,
                                    icon: Icons.info_outline,
                                    title: 'Header',
                                    subtleText: 'Subtle text',
                                    description:
                                        'The description aligns with the title when an icon is present.',
                                    primaryButtonText: 'Confirm',
                                    secondaryButtonText: 'Cancel',
                                    content: _demoBottomSheetBody(
                                      lines: 6,
                                      color: colors.onSurface.withValues(
                                        alpha: 0.75,
                                      ),
                                    ),
                                  ),
                                ),
                                Ux4gButton(
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  text: 'No Header',
                                  onPressed: () => Ux4gBottomSheet.show(
                                    context,
                                    size: Ux4gBottomSheetSize.peek,
                                    showHeader: false,
                                    content: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        'showHeader: false hides the whole header block — useful for simple action sheets.',
                                        style: typography.bS_default.copyWith(
                                          color: colors.onSurface.withValues(
                                            alpha: 0.75,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // 3. Footer variations
                            Text(
                              '3. Footer Variations (footerAlign, isDestructive, showFooter)',
                              style: typography.lS_strong.copyWith(
                                color: colors.primary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'split is the Figma default — both actions stretch 50/50 across the row.',
                              style: typography.bXS_default.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final align in [
                                  Ux4gBottomSheetFooterAlign.split,
                                  Ux4gBottomSheetFooterAlign.left,
                                  Ux4gBottomSheetFooterAlign.center,
                                  Ux4gBottomSheetFooterAlign.right,
                                ])
                                  Ux4gButton(
                                    variant: Ux4gButtonVariant.outline,
                                    size: Ux4gButtonSize.small,
                                    text: align.name,
                                    onPressed: () => Ux4gBottomSheet.show(
                                      context,
                                      size: Ux4gBottomSheetSize.peek,
                                      title: 'footerAlign = ${align.name}',
                                      footerAlign: align,
                                      primaryButtonText: 'Confirm',
                                      secondaryButtonText: 'Cancel',
                                      content: Text(
                                        'Notice the footer alignment: ${align.name}.',
                                        style: typography.bS_default.copyWith(
                                          color: colors.onSurface.withValues(
                                            alpha: 0.75,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                Ux4gButton(
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  text: 'Destructive',
                                  onPressed: () => Ux4gBottomSheet.show(
                                    context,
                                    size: Ux4gBottomSheetSize.peek,
                                    title: 'Delete this item?',
                                    description:
                                        'This action cannot be undone.',
                                    isDestructive: true,
                                    primaryButtonText: 'Delete',
                                    secondaryButtonText: 'Cancel',
                                    content: Text(
                                      'isDestructive renders the primary action in the danger/error theme color.',
                                      style: typography.bS_default.copyWith(
                                        color: colors.onSurface.withValues(
                                          alpha: 0.75,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Ux4gButton(
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  text: 'No Footer',
                                  onPressed: () => Ux4gBottomSheet.show(
                                    context,
                                    size: Ux4gBottomSheetSize.half,
                                    title: 'No Footer',
                                    showFooter: false,
                                    content: _demoBottomSheetBody(
                                      lines: 8,
                                      color: colors.onSurface.withValues(
                                        alpha: 0.75,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // 4. Options
                            Text(
                              '4. Options (showBottomDivider, showHeaderDivider, showBackdrop)',
                              style: typography.lS_strong.copyWith(
                                color: colors.primary,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Ux4gButton(
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  text: 'Dividers (Header & Bottom)',
                                  onPressed: () => Ux4gBottomSheet.show(
                                    context,
                                    size: Ux4gBottomSheetSize.half,
                                    title: 'Dividers Enabled',
                                    description:
                                        'Figma dividers under header and above fixed footer.',
                                    showHeaderDivider: true,
                                    showBottomDivider: true,
                                    primaryButtonText: 'Confirm',
                                    secondaryButtonText: 'Cancel',
                                    content: _demoBottomSheetBody(
                                      lines: 7,
                                      color: colors.onSurface.withValues(
                                        alpha: 0.75,
                                      ),
                                    ),
                                  ),
                                ),
                                Ux4gButton(
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  text: 'No Backdrop Scrim',
                                  onPressed: () => Ux4gBottomSheet.show(
                                    context,
                                    size: Ux4gBottomSheetSize.peek,
                                    title: 'No Backdrop',
                                    showBackdrop: false,
                                    primaryButtonText: 'Close',
                                    showSecondaryButton: false,
                                    content: Text(
                                      'The scrim is hidden, so background content stays completely visible. Tap close or drag down to dismiss.',
                                      style: typography.bS_default.copyWith(
                                        color: colors.onSurface.withValues(
                                          alpha: 0.75,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // 5. Draggable Multi-Snap Sheet
                            Text(
                              '5. Draggable & Multi-Snap Points',
                              style: typography.lS_strong.copyWith(
                                color: colors.primary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Drag the top pill handle or header UP to expand through snap points (peek 26% -> half 50% -> expanded 75% -> full 94%), or drag DOWN to collapse and dismiss. Bottom action buttons remain fixed at all times.',
                              style: typography.bXS_default.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Ux4gButton(
                              variant: Ux4gButtonVariant.primary,
                              size: Ux4gButtonSize.medium,
                              text: 'Open Draggable Multi-Snap Sheet',
                              onPressed: () => Ux4gBottomSheet.show(
                                context,
                                size: Ux4gBottomSheetSize.half,
                                title: 'Interactive Multi-Snap Sheet',
                                description:
                                    'Drag up/down freely across all 4 snap levels.',
                                showHeaderDivider: true,
                                showBottomDivider: true,
                                primaryButtonText: 'Save Changes',
                                secondaryButtonText: 'Discard',
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Notification Preferences',
                                      style: typography.tS_strong.copyWith(
                                        color: colors.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Ux4gCheckbox(
                                      value: true,
                                      onChanged: (_) {},
                                      label: 'Email Notifications',
                                    ),
                                    Ux4gCheckbox(
                                      value: false,
                                      onChanged: (_) {},
                                      label: 'Push Notifications',
                                    ),
                                    Ux4gCheckbox(
                                      value: true,
                                      onChanged: (_) {},
                                      label: 'SMS Alerts',
                                    ),
                                    const SizedBox(height: 12),
                                    const Ux4gDivider(),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Volume Level',
                                      style: typography.tS_strong.copyWith(
                                        color: colors.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Ux4gSlider(
                                      value: 65,
                                      onValueChange: (_) {},
                                      showMarksAndValues: true,
                                      steps: 4,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Scrollable Activity Logs',
                                      style: typography.tS_strong.copyWith(
                                        color: colors.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    for (int i = 1; i <= 15; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          'Log entry #$i: Body content scrolls smoothly while the action buttons stay anchored at the bottom.',
                                          style: typography.bS_default.copyWith(
                                            color: colors.onSurface.withValues(
                                              alpha: 0.7,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── 28B. Bottom Navigation Bar ────────────────────────────
                      _showcaseCard(
                        title: 'Bottom Navigation Bar (Ux4gBottomNavigationBar)',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Complete navigation bar matching UX4G Design System guidelines: 3 active indicator variants (Pill, Bar, Plain), 5 layout shapes (Labelled, Top-Rounded, Icon-Only, Centre-Action FAB, Floating Pill Capsule), custom badges, and responsive dark/light themes.',
                              style: typography.bS_default.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.7),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Ux4gTag(text: 'Pill Indicator', colorScheme: Ux4gTagColor.brand),
                                Ux4gTag(text: 'Top Bar Indicator', colorScheme: Ux4gTagColor.brand),
                                Ux4gTag(text: 'Floating Capsule', colorScheme: Ux4gTagColor.info),
                                Ux4gTag(text: 'Center FAB Action', colorScheme: Ux4gTagColor.success),
                                Ux4gTag(text: 'Badges & Counts', colorScheme: Ux4gTagColor.warning),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Ux4gButton(
                              text: 'Open Fullscreen Navigation Bar Demo',
                              variant: Ux4gButtonVariant.primary,
                              trailingIcon: Icons.open_in_new,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const Ux4gBottomNavShowcaseScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      // ─── 29. Compact Stepper ──────────────────────────
                      _showcaseCard(
                        title: 'Compact Stepper',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Layout: Linear (Default)',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gCompactStepper(
                              totalSteps: 12,
                              currentStep: _capsuleStep,
                              stepLabel: 'Account Setup',
                              description:
                                  'Enter your personal details to continue.',
                              layout: Ux4gCompactStepperLayout.linear,
                              onNext: _capsuleStep < 12
                                  ? () => setState(() => _capsuleStep++)
                                  : () {},
                              onPrevious: _capsuleStep > 1
                                  ? () => setState(() => _capsuleStep--)
                                  : () {},
                            ),
                            const SizedBox(height: 16),
                            const Ux4gDivider(),
                            const SizedBox(height: 16),
                            Text(
                              'Layout: Right Aligned',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gCompactStepper(
                              totalSteps: 12,
                              currentStep: _capsuleStep,
                              stepLabel: 'Finalize Profile',
                              description:
                                  'Uploading your bio and other settings.',
                              layout: Ux4gCompactStepperLayout.rightAligned,
                              onNext: _capsuleStep < 12
                                  ? () => setState(() => _capsuleStep++)
                                  : () {},
                              onPrevious: _capsuleStep > 1
                                  ? () => setState(() => _capsuleStep--)
                                  : () {},
                            ),
                            const SizedBox(height: 16),
                            const Ux4gDivider(),
                            const SizedBox(height: 16),
                            Text(
                              'Layout: Centered',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 8),
                            Ux4gCompactStepper(
                              totalSteps: 12,
                              currentStep: _capsuleStep,
                              stepLabel: 'Payment Methods',
                              description:
                                  'Review your cards and billing address.',
                              layout: Ux4gCompactStepperLayout.centered,
                              onNext: _capsuleStep < 12
                                  ? () => setState(() => _capsuleStep++)
                                  : () {},
                              onPrevious: _capsuleStep > 1
                                  ? () => setState(() => _capsuleStep--)
                                  : () {},
                            ),
                            const SizedBox(height: 16),
                            const Ux4gDivider(),
                            const SizedBox(height: 16),
                            Text('Layout: Split', style: typography.lS_strong),
                            const SizedBox(height: 8),
                            Ux4gCompactStepper(
                              totalSteps: 12,
                              currentStep: _capsuleStep,
                              stepLabel: 'Confirmation',
                              description:
                                  'Almost done. Just one more click to finish your setup and start using the platform.',
                              layout: Ux4gCompactStepperLayout.split,
                              onNext: _capsuleStep < 12
                                  ? () => setState(() => _capsuleStep++)
                                  : () {},
                              onPrevious: _capsuleStep > 1
                                  ? () => setState(() => _capsuleStep--)
                                  : () {},
                            ),
                          ],
                        ),
                      ),

                      // ─── Biometric Verification ─────────────────────
                      _showcaseCard(
                        title: 'Biometric Verification',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Face capture + liveness detection + UIDAI verification flow',
                              style: typography.bS_default.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: Ux4gButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const BiometricShowcasePage(
                                            mockSuccess: true,
                                          ),
                                    ),
                                  );
                                },
                                text: 'Simulate Success Flow',
                                leadingIcon: Icons.check_circle_outline,
                                backgroundColor: Ux4gColors.green,
                                contentColor: Ux4gColors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: Ux4gButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const BiometricShowcasePage(
                                            mockSuccess: false,
                                          ),
                                    ),
                                  );
                                },
                                text: 'Simulate Failure Flow',
                                leadingIcon: Icons.error_outline,
                                backgroundColor: Ux4gColors.red,
                                contentColor: Ux4gColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // ─── Empty State ──────────────────────────────────
                      _sectionTitle('Empty State', typography, colors),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // No results found
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.onSurface.withValues(alpha: 0.12),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Ux4gEmptyState(
                              variant: Ux4gEmptyStateVariant.noResults,
                              title: 'No results found',
                              subtitle: 'Did you mean:',
                              description: 'Driving License, Ration Card',
                              buttonText: 'Clear all filters',
                              onButtonPressed: () {},
                            ),
                          ),

                          const SizedBox(height: 16),

                          // No active applications
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.onSurface.withValues(alpha: 0.12),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Ux4gEmptyState(
                              variant: Ux4gEmptyStateVariant.noData,
                              title: 'No active applications',
                              subtitle: 'Start your application easily',
                              description: 'by clicking on the button below.',
                              buttonText: 'Start application',
                              onButtonPressed: () {},
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Coming soon
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.onSurface.withValues(alpha: 0.12),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Ux4gEmptyState(
                              variant: Ux4gEmptyStateVariant.comingSoon,
                              title: 'Coming soon',
                              subtitle: 'This feature is under development.',
                              buttonText: 'Go Back',
                              onButtonPressed: () {},
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Could not load data
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.onSurface.withValues(alpha: 0.12),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Ux4gEmptyState(
                              variant: Ux4gEmptyStateVariant.error,
                              title: 'Could not load data',
                              subtitle: 'Last updated: 4 minutes ago',
                              buttonText: 'Refresh',
                              onButtonPressed: () {},
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Custom variant
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.onSurface.withValues(alpha: 0.12),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Ux4gEmptyState(
                              variant: Ux4gEmptyStateVariant.custom,
                              icon: Icons.lock_outline_rounded,
                              iconColor: Ux4gColors.secondary,
                              title: 'Access restricted',
                              subtitle:
                                  'You do not have permission to view this content.',
                              description: 'Please contact your administrator.',
                              buttonText: 'Request access',
                              onButtonPressed: () {},
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // ─── Social Links ─────────────────────────────────
                      _sectionTitle('Social Links', typography, colors),
                      const SizedBox(height: 12),

                      _showcaseCard(
                        title: 'Icon Variants - Original White',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Original White Icon (As Imported):',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: Column(
                                children: [
                                  Ux4gSocialLink(
                                    icon: _selectedSocialIcon,
                                    size: SocialLinkSize.xxl,
                                    color: Ux4gColors.white,
                                    enableBackground: true,
                                    containerSize: 100,
                                    containerColor: _isDark
                                        ? colors.surface
                                        : colors.primary,
                                    tooltip: _selectedSocialIcon.name,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    _selectedSocialIcon.name.toUpperCase(),
                                    style: typography.lM_strong.copyWith(
                                      color: colors.onBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      _showcaseCard(
                        title: 'Icon Variants - Colored',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Colored Icon (Original colored version):',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: Column(
                                children: [
                                  Ux4gSocialLink(
                                    icon: _selectedSocialIcon,
                                    size: SocialLinkSize.xxl,
                                    useColoredIcon: true,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    _selectedSocialIcon.name.toUpperCase(),
                                    style: typography.lM_strong.copyWith(
                                      color: colors.onBackground,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      _showcaseCard(
                        title: 'Icon Variants - Custom Tint',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Tint Color:',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children:
                                  [
                                    (Ux4gColors.red500, 'Red'),
                                    (Ux4gColors.green500, 'Green'),
                                    (Ux4gColors.primary500, 'Blue'),
                                    (Ux4gColors.gold600, 'Gold'),
                                    (Ux4gColors.purple500, 'Purple'),
                                    (Ux4gColors.cyan500, 'Cyan'),
                                  ].map((colorTuple) {
                                    final color = colorTuple.$1;
                                    final label = colorTuple.$2;
                                    final isSelected =
                                        _selectedTintColor == color;
                                    return GestureDetector(
                                      onTap: () => setState(
                                        () => _selectedTintColor = color,
                                      ),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 150,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? color.withValues(alpha: 0.15)
                                              : colors.surface,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: isSelected
                                                ? color
                                                : colors.onSurface.withValues(
                                                    alpha: 0.12,
                                                  ),
                                            width: isSelected ? 1.5 : 1,
                                          ),
                                        ),
                                        child: Text(
                                          label,
                                          style: typography.tS_strong.copyWith(
                                            color: isSelected
                                                ? color
                                                : colors.onSurface,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: Column(
                                children: [
                                  Ux4gSocialLink(
                                    icon: _selectedSocialIcon,
                                    size: SocialLinkSize.xxl,
                                    color: _selectedTintColor,
                                    enableBackground: true,
                                    containerSize: 100,
                                    containerColor: _selectedTintColor
                                        .withValues(alpha: 0.1),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '${_selectedSocialIcon.name.toUpperCase()} with custom tint',
                                    style: typography.lM_strong.copyWith(
                                      color: _selectedTintColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      _showcaseCard(
                        title: 'Pick an Icon',
                        typography: typography,
                        colors: colors,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Icon to Preview:',
                              style: typography.lS_strong,
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: SocialMediaIcon.values.map((icon) {
                                final isSelected = _selectedSocialIcon == icon;
                                return GestureDetector(
                                  onTap: () => setState(
                                    () => _selectedSocialIcon = icon,
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? colors.primary.withValues(
                                              alpha: 0.15,
                                            )
                                          : colors.surface,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: isSelected
                                            ? colors.primary
                                            : colors.onSurface.withValues(
                                                alpha: 0.12,
                                              ),
                                        width: isSelected ? 1.5 : 1,
                                      ),
                                    ),
                                    child: Ux4gSocialLink(
                                      icon: icon,
                                      size: SocialLinkSize.m,
                                      color: isSelected
                                          ? colors.primary
                                          : colors.onSurface,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // ─── File Upload ──────────────────────────────────
                      _sectionTitle('File Upload', typography, colors),
                      const SizedBox(height: 12),

                      _showcaseCard(
                        title: 'File Upload Component',
                        typography: typography,
                        colors: colors,
                        child: Ux4gFileUpload(
                          maxFiles: 5,
                          maxFileSize: 5 * 1024 * 1024, // 5MB
                          onFilesChanged: (files) {
                            setState(() => _uploadedFiles = files);
                          },
                          onUpload: (file) async {
                            // Simulate upload delay
                            await Future.delayed(const Duration(seconds: 2));
                            // Return true for success, false for failure
                            return true;
                          },
                        ),
                      ),

                      const SizedBox(height: 32),

                      // ─── ux4gTimeslot ────────────────────────────────────
                      _sectionTitle('ux4gTimeslot', typography, colors),
                      const SizedBox(height: 12),

                      _showcaseCard(
                        title: 'ux4gTimeslot – Calendar Booking',
                        typography: typography,
                        colors: colors,
                        child: Ux4gTimeslotShowcase(),
                      ),

                      const SizedBox(height: 24),

                      // ─── Floating Action Button (FAB) & Speed-Dial ────
                      _buildFabShowcase(colors, typography, context),

                      const SizedBox(height: 32),

                      // ─── Side Menu (Ux4gSideMenu / Ux4gDrawer) ─────────
                      _buildSideMenuShowcase(colors, typography, context),

                      const SizedBox(height: 80),
                    ],
                  ),
                ),

                // ── Toast overlay ───────────────────────────────────────
                Positioned(
                  top: _toastAtTop ? 0 : null,
                  bottom: _toastAtTop ? null : 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Ux4gToastHost(
                      hostState: _toastHostState,
                      isBottom: !_toastAtTop,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showModal(BuildContext context, Ux4gModal modal) {
    Ux4gModal.show(context, modal: modal);
  }

  Widget _sectionTitle(
    String text,
    Ux4gTypography typography,
    Ux4gThemeColors colors,
  ) {
    return Text(
      text,
      style: typography.tS_strong.copyWith(color: colors.onBackground),
    );
  }

  Widget _showcaseCard({
    required String title,
    required Ux4gTypography typography,
    required Ux4gThemeColors colors,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Ux4gCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: typography.tS_strong.copyWith(
                  color: colors.onBackground,
                ),
              ),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _demoBottomSheetBody({int lines = 6, required Color color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        lines,
        (i) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            '${i + 1}. Bottom sheet body content. Pass anything you like as `children` or `content` — this slot maps to the Content slot in the Figma component.',
            style: TextStyle(
              color: color,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }

  Widget _circularProgressDemoItem({
    required Ux4gCircularProgressSize size,
    required bool inlineMeta,
  }) {
    final colors = Ux4gTheme.colors(context);
    final valueText = '${(_circularProgressValue * 100).round()}%';

    return Ux4gCircularProgress(
      value: _circularProgressValue,
      size: size,
      backgroundColor:
          (size == Ux4gCircularProgressSize.xl ||
              size == Ux4gCircularProgressSize.xxl ||
              size == Ux4gCircularProgressSize.xxxl)
          ? colors.onSurface.withValues(alpha: 0.05)
          : null,
      progressGradient: SweepGradient(
        transform: GradientRotation(-math.pi / 2),
        colors: [Color(0xFFDCD4FF), Color(0xFF6A4EFF)],
      ),
      centerValueText: valueText,
      centerDescription: inlineMeta ? 'Description' : null,
      label: inlineMeta ? null : valueText,
      description: inlineMeta ? null : 'Description',
      gap: 6,
    );
  }

  // ─── FAB SHOWCASE BUILDER ──────────────────────────────────────────────────

  Widget _buildFabShowcase(
    Ux4gThemeColors colors,
    Ux4gTypography typography,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & Description
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'NEW COMPONENT',
                style: typography.bXS_strong.copyWith(
                  color: colors.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Floating Action Button (FAB)',
              style: typography.hM_strong.copyWith(color: colors.onSurface),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Modular floating action buttons with Brand & Surface styling, circular and labelled variants, and 3 speed-dial layouts (Joined Capsule, Spaced Circles, and Labelled Pills).',
          style: typography.bS_default.copyWith(
            color: colors.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 20),

        // ─── SECTION 1: DESIGN SPECIFICATION MATRIX (BRAND vs SURFACE) ─────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colors.onSurface.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Design Specification Matrix',
                style: typography.hS_strong.copyWith(color: colors.onSurface),
              ),
              const SizedBox(height: 4),
              Text(
                'Side-by-side comparison of Brand (Purple filled) and Surface (White elevated) variants across all button types and speed-dial layouts:',
                style: typography.bS_default.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 20),

              // Matrix Container with Dashed Border
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Column(
                    children: [
                      // Header Row: Brand vs Surface
                      Row(
                        children: [
                          const SizedBox(width: 130), // Column for row labels
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Brand',
                                  style: typography.bM_strong.copyWith(
                                    color: colors.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  height: 2.5,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: colors.primary.withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Surface',
                                  style: typography.bM_strong.copyWith(
                                    color: colors.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  height: 2.5,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: colors.primary.withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Dashed Container with Matrix Rows
                      CustomPaint(
                        painter: _DashedBorderPainter(
                          color: colors.primary.withValues(alpha: 0.4),
                          borderRadius: 16,
                          strokeWidth: 1.5,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 28,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: _isDark
                                ? Ux4gColors.neutral950.withValues(alpha: 0.4)
                                : const Color(0xFFFAF9FF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              // Row 1: Icon
                              _buildMatrixRow(
                                label: 'Icon',
                                typography: typography,
                                colors: colors,
                                brandChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.icon,
                                  colorTheme: Ux4gFabColorTheme.brand,
                                ),
                                surfaceChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.icon,
                                  colorTheme: Ux4gFabColorTheme.surface,
                                ),
                              ),
                              const SizedBox(height: 36),

                              // Row 2: Labelled (with icon)
                              _buildMatrixRow(
                                label: 'Labelled',
                                typography: typography,
                                colors: colors,
                                brandChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.labelled,
                                  colorTheme: Ux4gFabColorTheme.brand,
                                  label: 'Button',
                                  showIcon: true,
                                ),
                                surfaceChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.labelled,
                                  colorTheme: Ux4gFabColorTheme.surface,
                                  label: 'Button',
                                  showIcon: true,
                                ),
                              ),
                              const SizedBox(height: 36),

                              // Row 3: Labelled (without icon)
                              _buildMatrixRow(
                                label: 'Labelled (no icon)',
                                typography: typography,
                                colors: colors,
                                brandChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.labelled,
                                  colorTheme: Ux4gFabColorTheme.brand,
                                  label: 'Button',
                                  showIcon: false,
                                ),
                                surfaceChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.labelled,
                                  colorTheme: Ux4gFabColorTheme.surface,
                                  label: 'Button',
                                  showIcon: false,
                                ),
                              ),
                              const SizedBox(height: 36),

                              // Row 4: Menu - joined
                              _buildMatrixRow(
                                label: 'Menu - joined',
                                typography: typography,
                                colors: colors,
                                brandChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.menuJoined,
                                  colorTheme: Ux4gFabColorTheme.brand,
                                  isOpen: true,
                                  animated: false,
                                ),
                                surfaceChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.menuJoined,
                                  colorTheme: Ux4gFabColorTheme.surface,
                                  isOpen: true,
                                  animated: false,
                                ),
                              ),
                              const SizedBox(height: 36),

                              // Row 5: Menu - spaced
                              _buildMatrixRow(
                                label: 'Menu - spaced',
                                typography: typography,
                                colors: colors,
                                brandChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.menuSpaced,
                                  colorTheme: Ux4gFabColorTheme.brand,
                                  isOpen: true,
                                  animated: false,
                                ),
                                surfaceChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.menuSpaced,
                                  colorTheme: Ux4gFabColorTheme.surface,
                                  isOpen: true,
                                  animated: false,
                                ),
                              ),
                              const SizedBox(height: 36),

                              // Row 6: Menu - labelled
                              _buildMatrixRow(
                                label: 'Menu - labelled',
                                typography: typography,
                                colors: colors,
                                brandChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.menuLabelled,
                                  colorTheme: Ux4gFabColorTheme.brand,
                                  isOpen: true,
                                  animated: false,
                                ),
                                surfaceChild: const Ux4gFab(
                                  variant: Ux4gFabVariant.menuLabelled,
                                  colorTheme: Ux4gFabColorTheme.surface,
                                  isOpen: true,
                                  animated: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // ─── SECTION 2: LIVE INTERACTIVE PLAYGROUND ────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colors.onSurface.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Interactive Live Playground & Speed-Dial Simulator',
                    style: typography.hS_strong.copyWith(color: colors.onSurface),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Live Interactive',
                      style: typography.bXS_strong.copyWith(color: colors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Customize FAB properties, test smooth open/close expansion animations, and trigger real-time actions:',
                style: typography.bS_default.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 16),

              // Control Bars
              Wrap(
                spacing: 16,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Color Theme Selector
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('THEME: ', style: typography.bXS_strong.copyWith(color: colors.onSurface.withValues(alpha: 0.7))),
                      for (final theme in Ux4gFabColorTheme.values)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ChoiceChip(
                            label: Text(theme.name.toUpperCase()),
                            selected: _fabPlaygroundTheme == theme,
                            onSelected: (sel) {
                              if (sel) setState(() => _fabPlaygroundTheme = theme);
                            },
                          ),
                        ),
                    ],
                  ),

                  // Variant Selector
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('VARIANT: ', style: typography.bXS_strong.copyWith(color: colors.onSurface.withValues(alpha: 0.7))),
                      for (final v in Ux4gFabVariant.values)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ChoiceChip(
                            label: Text(v.name),
                            selected: _fabPlaygroundVariant == v,
                            onSelected: (sel) {
                              if (sel) setState(() => _fabPlaygroundVariant = v);
                            },
                          ),
                        ),
                    ],
                  ),

                  // Sizing Selector
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('SIZE: ', style: typography.bXS_strong.copyWith(color: colors.onSurface.withValues(alpha: 0.7))),
                      for (final sz in Ux4gFabSize.values)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ChoiceChip(
                            label: Text(sz.name.toUpperCase()),
                            selected: _fabPlaygroundSize == sz,
                            onSelected: (sel) {
                              if (sel) setState(() => _fabPlaygroundSize = sz);
                            },
                          ),
                        ),
                    ],
                  ),

                  // Show Icon Switch (for labelled variant)
                  if (_fabPlaygroundVariant == Ux4gFabVariant.labelled)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('ICON: ', style: typography.bXS_strong.copyWith(color: colors.onSurface.withValues(alpha: 0.7))),
                        Switch(
                          value: _fabPlaygroundShowIcon,
                          onChanged: (v) => setState(() => _fabPlaygroundShowIcon = v),
                          activeTrackColor: colors.primary,
                        ),
                      ],
                    ),

                  // Disabled Switch
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('DISABLED: ', style: typography.bXS_strong.copyWith(color: colors.onSurface.withValues(alpha: 0.7))),
                      Switch(
                        value: _fabPlaygroundDisabled,
                        onChanged: (v) => setState(() => _fabPlaygroundDisabled = v),
                        activeTrackColor: colors.primary,
                      ),
                    ],
                  ),

                  // Backdrop Switch
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('BACKDROP SCRIM: ', style: typography.bXS_strong.copyWith(color: colors.onSurface.withValues(alpha: 0.7))),
                      Switch(
                        value: _fabPlaygroundBackdrop,
                        onChanged: (v) => setState(() => _fabPlaygroundBackdrop = v),
                        activeTrackColor: colors.primary,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Action Feedback Status Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: colors.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.touch_app_rounded, color: colors.primary, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Event Feed: $_fabActionLog • [Menu: ${_fabPlaygroundOpen ? "OPEN" : "CLOSED"}]',
                        style: typography.bS_strong.copyWith(color: colors.primary),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Live Playground Phone Container
              Container(
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral300,
                  ),
                ),
                child: Stack(
                  children: [
                    // Mock App Content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: colors.surface,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: colors.onSurface.withValues(alpha: 0.08),
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: colors.primary,
                                  child: const Text('PS', style: TextStyle(color: Colors.white, fontSize: 13)),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Citizen Dashboard', style: typography.bS_strong.copyWith(color: colors.onSurface)),
                                    Text('Speed-Dial Demo Surface', style: typography.bXS_default.copyWith(color: colors.onSurface.withValues(alpha: 0.6))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Click the floating action button at the bottom-right corner to test speed-dial opening, item actions, and backdrop dismissals.',
                            style: typography.bS_default.copyWith(
                              color: colors.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Interactive FAB Positioned
                    Ux4gFab(
                      key: ValueKey(
                        '${_fabPlaygroundTheme.name}_${_fabPlaygroundVariant.name}_${_fabPlaygroundSize.name}_${_fabPlaygroundShowIcon}_${_fabPlaygroundDisabled}_$_fabPlaygroundBackdrop',
                      ),
                      colorTheme: _fabPlaygroundTheme,
                      variant: _fabPlaygroundVariant,
                      size: _fabPlaygroundSize,
                      showIcon: _fabPlaygroundShowIcon,
                      disabled: _fabPlaygroundDisabled,
                      showBackdrop: _fabPlaygroundBackdrop,
                      position: Ux4gFabPosition.bottomRight,
                      offset: const EdgeInsets.all(20),
                      label: 'Create New',
                      actions: [
                        Ux4gFabActionItem(
                          id: 'add',
                          label: 'Add',
                          icon: Icons.add,
                          onPressed: () {
                            setState(() => _fabActionLog = 'Action tapped: [Add (+)]');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Add action tapped!'),
                                duration: Duration(milliseconds: 1200),
                              ),
                            );
                          },
                        ),
                        Ux4gFabActionItem(
                          id: 'message',
                          label: 'Message',
                          icon: Icons.chat_bubble_outline_rounded,
                          onPressed: () {
                            setState(() => _fabActionLog = 'Action tapped: [Message (💬)]');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Message action tapped!'),
                                duration: Duration(milliseconds: 1200),
                              ),
                            );
                          },
                        ),
                        Ux4gFabActionItem(
                          id: 'share',
                          label: 'Share',
                          icon: Icons.share_outlined,
                          onPressed: () {
                            setState(() => _fabActionLog = 'Action tapped: [Share (🔗)]');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Share action tapped!'),
                                duration: Duration(milliseconds: 1200),
                              ),
                            );
                          },
                        ),
                        Ux4gFabActionItem(
                          id: 'call',
                          label: 'Call',
                          icon: Icons.phone_outlined,
                          onPressed: () {
                            setState(() => _fabActionLog = 'Action tapped: [Call (📞)]');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Call action tapped!'),
                                duration: Duration(milliseconds: 1200),
                              ),
                            );
                          },
                        ),
                      ],
                      onToggle: (isOpen) {
                        setState(() {
                          _fabPlaygroundOpen = isOpen;
                          _fabActionLog = isOpen ? 'FAB menu expanded' : 'FAB menu collapsed';
                        });
                      },
                      onPressed: () {
                        if (_fabPlaygroundVariant == Ux4gFabVariant.icon ||
                            _fabPlaygroundVariant == Ux4gFabVariant.labelled) {
                          setState(() => _fabActionLog = 'Main FAB button pressed');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Main FAB button pressed!'),
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // ─── SECTION 3: DEVELOPER USAGE REFERENCE ──────────────────────────────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colors.onSurface.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Developer Usage & API Reference',
                style: typography.hS_strong.copyWith(color: colors.onSurface),
              ),
              const SizedBox(height: 4),
              Text(
                'Use modular props on Ux4gFab for standard circular buttons, extended pills, or speed-dials:',
                style: typography.bS_default.copyWith(
                  color: colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _isDark ? Ux4gColors.neutral950 : Ux4gColors.neutral900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '''// 1. Standard Circular FAB (Brand / Surface)
Ux4gFab(
  variant: Ux4gFabVariant.icon,
  colorTheme: Ux4gFabColorTheme.brand,
  icon: Icons.add,
  onPressed: () => handleCreate(),
)

// 2. Extended Labelled Pill FAB
Ux4gFab(
  variant: Ux4gFabVariant.labelled,
  colorTheme: Ux4gFabColorTheme.brand,
  label: 'Create Ticket',
  icon: Icons.add,
  onPressed: () => handleCreate(),
)

// 3. Joined Speed-Dial Menu
Ux4gFab(
  variant: Ux4gFabVariant.menuJoined,
  colorTheme: Ux4gFabColorTheme.brand,
  actions: [
    Ux4gFabActionItem(id: 'add', label: 'Add', icon: Icons.add, onPressed: () {}),
    Ux4gFabActionItem(id: 'chat', label: 'Chat', icon: Icons.chat, onPressed: () {}),
  ],
)

// 4. Spaced Speed-Dial Circles
Ux4gFab(
  variant: Ux4gFabVariant.menuSpaced,
  colorTheme: Ux4gFabColorTheme.surface,
  actions: myActions,
)

// 5. Labelled Speed-Dial Pills with Positioning & Backdrop
Ux4gFab(
  variant: Ux4gFabVariant.menuLabelled,
  colorTheme: Ux4gFabColorTheme.brand,
  position: Ux4gFabPosition.bottomRight,
  offset: EdgeInsets.all(24),
  showBackdrop: true,
  actions: myActions,
)''',
                  style: TextStyle(
                    color: Color(0xFF86E1FC),
                    fontFamily: 'monospace',
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMatrixRow({
    required String label,
    required Ux4gTypography typography,
    required Ux4gThemeColors colors,
    required Widget brandChild,
    required Widget surfaceChild,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: typography.bM_strong.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: brandChild,
          ),
        ),
        Expanded(
          child: Center(
            child: surfaceChild,
          ),
        ),
      ],
    );
  }

  // ─── SIDE MENU (UX4GSIDEMENU / UX4GDRAWER) SHOWCASE BUILDER ─────────────

  Widget _buildSideMenuShowcase(
    Ux4gThemeColors colors,
    Ux4gTypography typography,
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final presetNames = [
      '1. Standard Gov Navigation',
      '2. Officer Inbox',
      '3. Profile Menu',
      '4. Action Required Banner',
      '5. Department Switcher',
      '6. Citizen Simple Navigation',
    ];

    Widget currentLiveMenu;
    switch (_selectedSideMenuPreset) {
      case 1:
        currentLiveMenu = Ux4gSideMenuPresets.officerInbox(
          name: 'Ramesh Kumar',
          email: 'ramesh.kumar@gov.in',
          division: 'Kanpur division',
          onItemSelected: (item) {
            setState(() {
              _sideMenuActionLog = 'Selected mailbox item: "${item.label}" (${item.key})';
            });
          },
          onCustomizeInbox: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "Customize inbox"';
            });
          },
          onSignOut: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "Sign out"';
            });
          },
        );
        break;

      case 2:
        currentLiveMenu = Ux4gSideMenuPresets.citizenProfile(
          name: 'Ramesh Kumar',
          role: 'Citizen',
          metaText: '12 applications · 3 actions required',
          onViewProfile: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "View profile" button';
            });
          },
          onItemSelected: (item) {
            setState(() {
              _sideMenuActionLog = 'Selected profile item: "${item.label}"';
            });
          },
          onSignOut: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "Sign out"';
            });
          },
        );
        break;

      case 3:
        currentLiveMenu = Ux4gSideMenuPresets.actionRequired(
          title: 'Revenue Department',
          subtitle: 'Kanpur division',
          onVerifyAadhaar: () {
            setState(() {
              _sideMenuActionLog = 'Action card CTA tapped: "Verify now"';
            });
          },
          onItemSelected: (item) {
            setState(() {
              _sideMenuActionLog = 'Selected menu item: "${item.label}"';
            });
          },
        );
        break;

      case 4:
        currentLiveMenu = Ux4gSideMenuPresets.departmentSwitcher(
          title: 'Departments',
          subtitle: 'Choose a department to work in.',
          selectedDepartmentKey: 'dept-revenue',
          onSelectDepartment: (dept) {
            setState(() {
              _sideMenuActionLog = 'Switched to department: "${dept.label}"';
            });
          },
          onRequestAccess: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "+ Request department access"';
            });
          },
          onSettings: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "Settings"';
            });
          },
          onHelp: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "Help & support"';
            });
          },
        );
        break;

      case 5:
        currentLiveMenu = Ux4gSideMenuPresets.citizenSimple(
          name: 'Ramesh Kumar',
          role: 'Citizen',
          onItemSelected: (item) {
            setState(() {
              _sideMenuActionLog = 'Selected item: "${item.label}"';
            });
          },
          onSignOut: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "Sign out"';
            });
          },
        );
        break;

      case 0:
      default:
        currentLiveMenu = Ux4gSideMenuPresets.standard(
          onItemSelected: (item) {
            setState(() {
              _sideMenuActionLog = 'Selected navigation item: "${item.label}" (${item.key})';
            });
          },
          onSignOut: () {
            setState(() {
              _sideMenuActionLog = 'Action tapped: "Sign out"';
            });
          },
        );
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & Badge
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'NEW COMPONENT',
                style: typography.bXS_strong.copyWith(
                  color: colors.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Side Menu (Ux4gSideMenu / Ux4gDrawer)',
              style: typography.hM_strong.copyWith(color: colors.onSurface),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Accessible, responsive navigation drawer supporting all 6 UX4G design system state presets (Standard Government Navigation, Officer Inbox, Citizen Profile Menu, Action Required Banner, Department Switcher, and Simple Navigation), real-time search filtering, collapsible sub-menu tree with connector lines, and modal presentation.',
          style: typography.bS_default.copyWith(
            color: colors.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 20),

        // Preset selector chips
        Text(
          'SELECT DESIGN SYSTEM STATE PRESET',
          style: typography.lS_strong.copyWith(
            color: colors.onSurface.withValues(alpha: 0.6),
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(presetNames.length, (index) {
            final isSelected = _selectedSideMenuPreset == index;
            return ChoiceChip(
              label: Text(presetNames[index]),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedSideMenuPreset = index;
                    _sideMenuActionLog = 'Switched to ${presetNames[index]}';
                  });
                }
              },
              selectedColor: colors.primary.withValues(alpha: 0.18),
              backgroundColor: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral100,
              labelStyle: TextStyle(
                color: isSelected ? colors.primary : colors.onSurface,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                fontSize: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                side: BorderSide(
                  color: isSelected
                      ? colors.primary
                      : (isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300),
                ),
              ),
            );
          }),
        ),

        const SizedBox(height: 16),

        // Interactive Action Toolbar
        Row(
          children: [
            Ux4gButton(
              onPressed: () {
                _launchModalDrawer(context, Ux4gSideMenuPosition.left);
              },
              text: 'Launch Modal (Left Slide)',
              leadingIcon: Icons.menu_open_rounded,
              size: Ux4gButtonSize.small,
              variant: Ux4gButtonVariant.primary,
            ),
            const SizedBox(width: 12),
            Ux4gButton(
              onPressed: () {
                _launchModalDrawer(context, Ux4gSideMenuPosition.right);
              },
              text: 'Launch Modal (Right Slide)',
              leadingIcon: Icons.arrow_back_rounded,
              size: Ux4gButtonSize.small,
              variant: Ux4gButtonVariant.outline,
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Action feedback log card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF7F5FF),
            borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
            border: Border.all(
              color: colors.primary.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: colors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _sideMenuActionLog,
                  style: typography.bXS_default.copyWith(
                    color: isDark ? Ux4gColors.neutral200 : colors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Live interactive embedded preview canvas
        Center(
          child: Container(
            width: 340,
            height: 640,
            decoration: BoxDecoration(
              color: isDark ? Ux4gColors.neutral900 : Ux4gColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: currentLiveMenu,
          ),
        ),
      ],
    );
  }

  void _launchModalDrawer(BuildContext context, Ux4gSideMenuPosition position) {
    switch (_selectedSideMenuPreset) {
      case 1:
        Ux4gSideMenu.show(
          context,
          position: position,
          headerType: Ux4gSideMenuHeaderType.compactUser,
          title: 'Ramesh Kumar',
          subtitle: 'ramesh.kumar@gov.in',
          showSearch: false,
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
            const Ux4gSideMenuSection(
              key: 'folders',
              title: 'FOLDERS',
              actionText: 'Customize inbox',
              items: [
                Ux4gSideMenuItem(key: 'sent', label: 'Sent', icon: Icons.arrow_outward),
                Ux4gSideMenuItem(key: 'drafts', label: 'Drafts', icon: Icons.edit_note_outlined),
                Ux4gSideMenuItem(key: 'archive', label: 'Archive', icon: Icons.layers_outlined),
                Ux4gSideMenuItem(key: 'rejected', label: 'Rejected applications', icon: Icons.error_outline_rounded),
              ],
            ),
          ],
          footerItems: const [
            Ux4gSideMenuItem(key: 'settings', label: 'Inbox settings', icon: Icons.more_vert),
          ],
          showSignOut: false,
          bottomBranding: const Ux4gSideMenuBottomBranding(
            title: 'Revenue Department',
            subtitle: 'Kanpur division',
          ),
        );
        break;

      case 2:
        Ux4gSideMenu.show(
          context,
          position: position,
          headerType: Ux4gSideMenuHeaderType.prominentUser,
          title: 'Ramesh Kumar',
          subtitle: 'Citizen',
          userMetaText: '12 applications · 3 actions required',
          userActionButtonText: 'View profile',
          showSearch: false,
          sections: const [
            Ux4gSideMenuSection(
              key: 'account',
              title: 'ACCOUNT',
              items: [
                Ux4gSideMenuItem(key: 'profile', label: 'Profile & settings', icon: Icons.account_circle_outlined),
                Ux4gSideMenuItem(key: 'saved', label: 'Saved items', icon: Icons.layers_outlined),
              ],
            ),
            Ux4gSideMenuSection(
              key: 'apps',
              title: 'APPLICATIONS',
              items: [
                Ux4gSideMenuItem(key: 'my-apps', label: 'My applications', icon: Icons.assignment_outlined),
                Ux4gSideMenuItem(key: 'track', label: 'Track an application', icon: Icons.location_on_outlined),
              ],
            ),
          ],
        );
        break;

      case 3:
        Ux4gSideMenu.show(
          context,
          position: position,
          title: 'Revenue Department',
          subtitle: 'Kanpur division',
          showSearch: false,
          showSignOut: false,
          sections: [
            Ux4gSideMenuSection(
              key: 'services',
              title: 'SERVICES',
              items: [
                const Ux4gSideMenuItem(key: 'dash', label: 'Dashboard', icon: Icons.grid_view_rounded),
                const Ux4gSideMenuItem(
                  key: 'apps',
                  label: 'Applications',
                  icon: Icons.assignment_outlined,
                  defaultExpanded: true,
                  children: [
                    Ux4gSideMenuItem(key: 'new', label: 'New applications'),
                    Ux4gSideMenuItem(key: 'review', label: 'Under review'),
                    Ux4gSideMenuItem(key: 'approved', label: 'Approved applications'),
                  ],
                ),
                Ux4gSideMenuItem(key: 'inbox', label: 'Inbox', icon: Icons.mail_outline, badge: 8),
              ],
            ),
          ],
          actionCard: const Ux4gSideMenuActionCard(
            title: 'Verify your Aadhaar',
            description: 'Complete identity verification to continue.',
            buttonText: 'Verify now',
          ),
        );
        break;

      case 4:
        Ux4gSideMenu.show(
          context,
          position: position,
          headerType: Ux4gSideMenuHeaderType.plain,
          title: 'Departments',
          subtitle: 'Choose a department to work in.',
          showSearch: false,
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
          footerItems: const [
            Ux4gSideMenuItem(key: 'access', label: 'Request department access', icon: Icons.add),
            Ux4gSideMenuItem(key: 'settings', label: 'Settings', icon: Icons.more_vert),
            Ux4gSideMenuItem(key: 'help', label: 'Help & support', icon: Icons.help_outline_rounded),
          ],
          showSignOut: false,
        );
        break;

      case 5:
        Ux4gSideMenu.show(
          context,
          position: position,
          headerType: Ux4gSideMenuHeaderType.compactUser,
          title: 'Ramesh Kumar',
          subtitle: 'Citizen',
          showSearch: false,
          sections: [
            Ux4gSideMenuSection(
              items: [
                const Ux4gSideMenuItem(key: 'apps', label: 'My applications', icon: Icons.assignment_outlined),
                const Ux4gSideMenuItem(key: 'docs', label: 'My documents', icon: Icons.layers_outlined),
                Ux4gSideMenuItem(key: 'notifs', label: 'Notifications', icon: Icons.notifications_none_outlined, badge: 3),
              ],
            ),
          ],
          bottomBranding: const Ux4gSideMenuBottomBranding(
            title: 'Revenue Department',
            subtitle: 'Government of India',
          ),
        );
        break;

      case 0:
      default:
        Ux4gSideMenu.show(
          context,
          position: position,
          title: 'Revenue Department',
          subtitle: 'Government of India',
          showSearch: true,
        );
        break;
    }
  }
}

Widget _circularColorVariant({
  required Ux4gThemeColors colors,
  required Ux4gTypography typography,
  required Color progressColor,
  required SweepGradient gradient,
  required Color footerColor,
  required Color footerTextColor,
  Color? descriptionColor,
}) {
  return Ux4gCircularProgress(
    value: 0.65,
    size: Ux4gCircularProgressSize.xl,
    strokeWidth: 6,
    strokeCap: StrokeCap.round,
    progressGradient: gradient,
    centerValueText: '8',
    centerDescription: 'days left',
    label: 'Label',
    description: 'Description',
    descriptionStyle: descriptionColor != null
        ? typography.bS_default.copyWith(color: descriptionColor)
        : null,
    footer: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: footerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Label',
        style: typography.bXS_strong.copyWith(color: footerTextColor),
      ),
    ),
  );
}

// ─── Biometric Showcase Page ──────────────────────────────────────────────

class BiometricShowcasePage extends StatelessWidget {
  final bool mockSuccess;

  const BiometricShowcasePage({super.key, this.mockSuccess = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BiometricVerificationFlow(
        onVerify: MockVerificationService(simulateSuccess: mockSuccess).verify,
        onSuccess: (result) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Verified: ${result.maskedName ?? "Success"}'),
              backgroundColor: const Color(0xFF1AA64A),
            ),
          );
        },
        onFailure: (reason, message) {
          // Handled by the flow internally (retry / OTP)
        },
        onDismiss: () => Navigator.of(context).pop(),
        onAlternateVerify: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP verification flow...')),
          );
        },
        enableBlinkCheck: true,
        enableLightingCheck: true,
        enableLiveness: true,
        maxAttempts: 3,
      ),
    );
  }
}

// ─── ux4gTimeslot Showcase ──────────────────────────────────────────────────────

class Ux4gTimeslotShowcase extends StatefulWidget {
  final SlotPickerViewMode viewMode;

  const Ux4gTimeslotShowcase({
    super.key,
    this.viewMode = SlotPickerViewMode.expanded,
  });

  @override
  State<Ux4gTimeslotShowcase> createState() => _Ux4gTimeslotShowcaseState();
}

class _Ux4gTimeslotShowcaseState extends State<Ux4gTimeslotShowcase> {
  DateTime? _selectedDate;
  late Ux4gTimeslotData _data;

  // Mutable copy of time slots per date key (including "default").
  // Initialized from _getJsonInput() so bookings persist across taps.
  Map<String, List<Map<String, dynamic>>> _mutableTimeSlots = {};

  Map<String, dynamic> _getJsonInput() {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));
    final dayAfter = now.add(const Duration(days: 2));
    final day4 = now.add(const Duration(days: 3));

    return {
      "year": now.year,
      "month": now.month,
      "today":
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}',
      "weeklyOffWeekdays": [6, 7],
      "allowTapOnPublicHoliday": false,
      "allowTapOnWeeklyOff": false,
      "viewMode": widget.viewMode == SlotPickerViewMode.compact
          ? "compact"
          : "expanded",
      "dates": [
        {
          "date":
              '${now.year}-${now.month.toString().padLeft(2, '0')}-${_pad(now.day + 2)}',
          "status": "publicHoliday",
        },
        {
          "date":
              '${now.year}-${now.month.toString().padLeft(2, '0')}-${_pad(now.day + 4)}',
          "status": "noSlots",
        },
        {
          "date":
              '${now.year}-${now.month.toString().padLeft(2, '0')}-${_pad(now.day + 6)}',
          "status": "noSlots",
        },
      ],
      "timeSlots": {
        '${tomorrow.year}-${tomorrow.month.toString().padLeft(2, '0')}-${tomorrow.day.toString().padLeft(2, '0')}':
            [
              {"time": "9:00 AM", "slotCount": 2, "status": "available"},
              {"time": "10:00 AM", "slotCount": 1, "status": "limited"},
              {"time": "11:00 AM", "slotCount": 0, "status": "noSlots"},
              {"time": "2:00 PM", "slotCount": 3, "status": "available"},
            ],
        '${dayAfter.year}-${dayAfter.month.toString().padLeft(2, '0')}-${dayAfter.day.toString().padLeft(2, '0')}':
            [
              {"time": "9:30 AM", "slotCount": 5, "status": "available"},
              {"time": "10:30 AM", "slotCount": 2, "status": "available"},
              {"time": "1:00 PM", "slotCount": 4, "status": "available"},
              {"time": "3:00 PM", "slotCount": 1, "status": "limited"},
              {"time": "4:00 PM", "slotCount": 0, "status": "noSlots"},
            ],
        '${day4.year}-${day4.month.toString().padLeft(2, '0')}-${day4.day.toString().padLeft(2, '0')}':
            [
              {"time": "11:00 AM", "slotCount": 8, "status": "available"},
              {"time": "12:00 PM", "slotCount": 6, "status": "available"},
              {"time": "1:00 PM", "slotCount": 3, "status": "available"},
              {"time": "2:30 PM", "slotCount": 1, "status": "limited"},
            ],
        "default": [
          {"time": "9:00 AM", "slotCount": 4, "status": "available"},
          {"time": "9:30 AM", "slotCount": 6, "status": "available"},
          {"time": "10:00 AM", "slotCount": 3, "status": "available"},
          {"time": "10:30 AM", "slotCount": 0, "status": "noSlots"},
          {"time": "11:00 AM", "slotCount": 8, "status": "available"},
          {"time": "11:30 AM", "slotCount": 5, "status": "available"},
          {"time": "12:00 PM", "slotCount": 10, "status": "available"},
          {"time": "2:00 PM", "slotCount": 5, "status": "available"},
          {"time": "2:30 PM", "slotCount": 2, "status": "limited"},
          {"time": "3:00 PM", "slotCount": 2, "status": "limited"},
          {"time": "3:30 PM", "slotCount": 1, "status": "limited"},
          {"time": "4:00 PM", "slotCount": 7, "status": "available"},
          {"time": "4:30 PM", "slotCount": 2, "status": "limited"},
          {"time": "5:00 PM", "slotCount": 2, "status": "limited"},
          {"time": "5:30 PM", "slotCount": 0, "status": "noSlots"},
        ],
      },
    };
  }

  static String _pad(int day) => day.toString().padLeft(2, '0');

  /// Builds the mutable slot map from the JSON definition.
  Map<String, List<Map<String, dynamic>>> _buildMutableSlots() {
    final json = _getJsonInput();
    final raw = json['timeSlots'] as Map<String, dynamic>;
    return raw.map(
      (key, value) => MapEntry(
        key,
        (value as List)
            .map((e) => Map<String, dynamic>.from(e as Map))
            .toList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _mutableTimeSlots = _buildMutableSlots();
    _data = Ux4gTimeslotData.fromJson(_getJsonInput());
  }

  @override
  void didUpdateWidget(Ux4gTimeslotShowcase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewMode != widget.viewMode) {
      _data = Ux4gTimeslotData.fromJson(_getJsonInput());
    }
  }

  /// Returns current slots for [date], falling back to "default".
  List<SlotTimeEntry> _timeSlotsFor(DateTime date) {
    final dateStr =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    if (_mutableTimeSlots.isEmpty) {
      _mutableTimeSlots = _buildMutableSlots();
    }
    // If no date-specific entry, create one by copying 'default' so mutations are isolated.
    if (!_mutableTimeSlots.containsKey(dateStr)) {
      final defaultSlots = _mutableTimeSlots['default'] ?? [];
      _mutableTimeSlots[dateStr] = defaultSlots
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    return _mutableTimeSlots[dateStr]!
        .map((e) => SlotTimeEntry.fromJson(e))
        .toList();
  }

  /// Increments slotCount for [bookedTime] on [date] and updates status.
  void _onSlotBooked(DateTime date, SlotTimeEntry bookedTime) {
    final dateStr =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    if (_mutableTimeSlots.isEmpty) {
      _mutableTimeSlots = _buildMutableSlots();
    }
    // Always use date-specific key (ensured by _timeSlotsFor creating it on tap)
    final slots = _mutableTimeSlots[dateStr];
    if (slots == null) return;

    setState(() {
      for (final slot in slots) {
        if (slot['time'] == bookedTime.time) {
          final newCount = (slot['slotCount'] as int) + 1;
          slot['slotCount'] = newCount;
          if (newCount == 0) {
            slot['status'] = 'noSlots';
          } else if (newCount <= 2) {
            slot['status'] = 'limited';
          } else {
            slot['status'] = 'available';
          }
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Ux4gTheme.colors(context);
    final typography = Ux4gTheme.typography(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Ux4gTimeslot(
          data: _data,
          timeSlotProvider: _timeSlotsFor,
          onSlotConfirmed: (date, slot) => _onSlotBooked(date, slot),
          onDateSelected: (date) {
            setState(() {
              _selectedDate = date;
              final json = _getJsonInput();
              _data = Ux4gTimeslotData.fromJson({
                ...json,
                'selectedDate':
                    '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
                'year': _data.year,
                'month': _data.month,
              });
            });
          },
          onMonthChanged: (year, month) {
            setState(() {
              final json = _getJsonInput();
              _data = Ux4gTimeslotData.fromJson({
                ...json,
                'year': year,
                'month': month,
              });
            });
          },
        ),
        if (_selectedDate != null) ...[
          const SizedBox(height: 16),
          Text(
            'Selected: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
            style: typography.bS_default.copyWith(color: colors.onBackground),
          ),
        ],
      ],
    );
  }
}

// ─── Ux4gBottomNavShowcaseScreen ──────────────────────────────────────────────

class Ux4gBottomNavShowcaseScreen extends StatefulWidget {
  const Ux4gBottomNavShowcaseScreen({super.key});

  @override
  State<Ux4gBottomNavShowcaseScreen> createState() =>
      _Ux4gBottomNavShowcaseScreenState();
}

class _Ux4gBottomNavShowcaseScreenState
    extends State<Ux4gBottomNavShowcaseScreen> {
  bool _isDark = false;
  String _lastActionMessage = 'Tap any tab in the matrix or playground to interact';

  // 5x3 Matrix state: [row][col]
  final List<List<int>> _matrixIndices = [
    [0, 0, 0], // Labelled (Pill, Bar, Plain)
    [0, 0, 0], // Top-rounded (Pill, Bar, Plain)
    [0, 0, 0], // Icon only (Pill, Bar, Plain)
    [0, 0, 0], // Centre action (Pill, Bar, Plain)
    [0, 0, 0], // Pill floating (Pill, Bar, Plain)
  ];

  // Playground state
  int _playgroundIndex = 0;
  Ux4gBottomNavIndicatorVariant _playgroundIndicator =
      Ux4gBottomNavIndicatorVariant.pill;
  Ux4gBottomNavVariant _playgroundVariant = Ux4gBottomNavVariant.labelled;
  bool _showBadges = true;
  bool _showLabels = true;

  // Full Screen interactive modal state
  int _fullScreenIndex = 0;
  Ux4gBottomNavIndicatorVariant _fullScreenIndicator =
      Ux4gBottomNavIndicatorVariant.pill;
  Ux4gBottomNavVariant _fullScreenVariant = Ux4gBottomNavVariant.labelled;

  // Base 5 items matching Image 1 exactly
  List<Ux4gBottomNavItem> _buildStandardItems({bool showBadges = false}) {
    return [
      const Ux4gBottomNavItem(
        key: 'home',
        label: 'Home',
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
      ),
      const Ux4gBottomNavItem(
        key: 'services',
        label: 'Services',
        icon: Icons.grid_view_outlined,
        activeIcon: Icons.grid_view,
      ),
      const Ux4gBottomNavItem(
        key: 'status',
        label: 'Status',
        icon: Icons.assignment_outlined,
        activeIcon: Icons.assignment,
      ),
      Ux4gBottomNavItem(
        key: 'alerts',
        label: 'Alerts',
        icon: Icons.notifications_none_outlined,
        activeIcon: Icons.notifications,
        badge: showBadges ? 3 : null,
      ),
      const Ux4gBottomNavItem(
        key: 'profile',
        label: 'Profile',
        icon: Icons.person_outline,
        activeIcon: Icons.person,
      ),
    ];
  }

  // 4 items for Centre Action mode (Home, Services | Status, Alerts)
  List<Ux4gBottomNavItem> _buildCentreActionItems({bool showBadges = false}) {
    return [
      const Ux4gBottomNavItem(
        key: 'home',
        label: 'Home',
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
      ),
      const Ux4gBottomNavItem(
        key: 'services',
        label: 'Services',
        icon: Icons.grid_view_outlined,
        activeIcon: Icons.grid_view,
      ),
      const Ux4gBottomNavItem(
        key: 'status',
        label: 'Status',
        icon: Icons.assignment_outlined,
        activeIcon: Icons.assignment,
      ),
      Ux4gBottomNavItem(
        key: 'alerts',
        label: 'Alerts',
        icon: Icons.notifications_none_outlined,
        activeIcon: Icons.notifications,
        badge: showBadges ? '!' : null,
      ),
    ];
  }

  void _updateMatrixIndex(int row, int col, int idx, String label) {
    setState(() {
      _matrixIndices[row][col] = idx;
      _lastActionMessage = '[Row ${row + 1}, Col ${col + 1}] selected "$label"';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Ux4gTheme(
      isDark: _isDark,
      child: Builder(
        builder: (ctx) {
          final colors = Ux4gTheme.colors(ctx);
          final typography = Ux4gTheme.typography(ctx);

          final matrixRows = [
            (label: 'Labelled', variant: Ux4gBottomNavVariant.labelled, items: _buildStandardItems(showBadges: _showBadges), showLabels: true),
            (label: 'Top-rounded', variant: Ux4gBottomNavVariant.topRounded, items: _buildStandardItems(showBadges: _showBadges), showLabels: true),
            (label: 'Icon only', variant: Ux4gBottomNavVariant.iconOnly, items: _buildStandardItems(showBadges: _showBadges), showLabels: false),
            (label: 'Centre action', variant: Ux4gBottomNavVariant.centreAction, items: _buildCentreActionItems(showBadges: _showBadges), showLabels: true),
            (label: 'Pill (floating)', variant: Ux4gBottomNavVariant.floatingPill, items: _buildStandardItems(showBadges: _showBadges), showLabels: true),
          ];

          final matrixCols = [
            (title: 'Pill', indicator: Ux4gBottomNavIndicatorVariant.pill),
            (title: 'Bar', indicator: Ux4gBottomNavIndicatorVariant.bar),
            (title: 'Plain', indicator: Ux4gBottomNavIndicatorVariant.plain),
          ];

          return Scaffold(
            backgroundColor: colors.background,
            appBar: AppBar(
              backgroundColor: colors.surface,
              elevation: 0,
              title: Text(
                'UX4G Bottom Navigation Bar',
                style: typography.hS_strong.copyWith(color: colors.onSurface),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: colors.onSurface),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                FilledButton.icon(
                  onPressed: () => _openFullScreenDemo(context),
                  icon: const Icon(Icons.phone_android, size: 16),
                  label: const Text('Live Demo'),
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    _isDark ? Icons.light_mode : Icons.dark_mode,
                    color: colors.onSurface,
                  ),
                  tooltip: 'Toggle Theme',
                  onPressed: () => setState(() => _isDark = !_isDark),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Header & Description ─────────────────────────────────────
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colors.onSurface.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colors.primary.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'UX4G NAVIGATION',
                                style: typography.bXS_strong.copyWith(
                                  color: colors.primary,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colors.onSurface.withValues(alpha: 0.06),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '5 Rows × 3 Indicators',
                                style: typography.bXS_default.copyWith(
                                  color: colors.onSurface.withValues(alpha: 0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Bottom Navigation Bar Matrix',
                          style: typography.hM_strong.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Complete design system matrix featuring Pill, Bar, and Plain active indicators across Labelled, Top-rounded, Icon only, Centre action (+ FAB), and Pill (floating) shapes matching the official design specification.',
                          style: typography.bS_default.copyWith(
                            color: colors.onSurface.withValues(alpha: 0.7),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 14),
                        // Last Action Bar
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: colors.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: colors.primary.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.touch_app_outlined,
                                size: 16,
                                color: colors.primary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _lastActionMessage,
                                  style: typography.bXS_strong.copyWith(
                                    color: colors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─── SECTION 1: 5x3 DESIGN SYSTEM MATRIX (Image 1) ───────────
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colors.onSurface.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Design System Matrix (5 Rows × 3 Indicators)',
                          style: typography.hS_strong.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Interactive reference gallery. Tap any tab within any cell to switch its active state.',
                          style: typography.bS_default.copyWith(
                            color: colors.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Horizontal Scroll for Responsive Matrix Table
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 1100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ─── Column Header Row ───
                                Row(
                                  children: [
                                    const SizedBox(width: 130), // Label space
                                    for (final col in matrixCols)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                col.title,
                                                style: typography.hS_strong.copyWith(
                                                  color: colors.onSurface,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Container(
                                                height: 2,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  color: colors.primary.withValues(alpha: 0.4),
                                                  borderRadius: BorderRadius.circular(1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // ─── 5 Matrix Rows ───
                                for (int rIdx = 0; rIdx < matrixRows.length; rIdx++) ...[
                                  Builder(builder: (c) {
                                    final row = matrixRows[rIdx];
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 24),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Row Label
                                          SizedBox(
                                            width: 130,
                                            child: Text(
                                              row.label,
                                              style: typography.bM_strong.copyWith(
                                                color: colors.onSurface,
                                              ),
                                            ),
                                          ),

                                          // 3 Columns: Pill, Bar, Plain
                                          for (int cIdx = 0; cIdx < matrixCols.length; cIdx++) ...[
                                            Builder(builder: (c2) {
                                              final col = matrixCols[cIdx];
                                              final selectedIdx = _matrixIndices[rIdx][cIdx];

                                              return Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: _isDark
                                                          ? Ux4gColors.neutral950
                                                          : Ux4gColors.neutral50,
                                                      borderRadius: BorderRadius.circular(12),
                                                      border: Border.all(
                                                        color: _isDark
                                                            ? Ux4gColors.neutral800
                                                            : Ux4gColors.neutral200,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black.withValues(
                                                            alpha: _isDark ? 0.25 : 0.05,
                                                          ),
                                                          blurRadius: 6,
                                                          offset: const Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        // Top Mock Placeholder
                                                        Container(
                                                          height: 38,
                                                          alignment: Alignment.center,
                                                          child: Container(
                                                            width: 100,
                                                            height: 6,
                                                            decoration: BoxDecoration(
                                                              color: (_isDark
                                                                      ? Ux4gColors.neutral800
                                                                      : Ux4gColors.neutral300)
                                                                  .withValues(alpha: 0.5),
                                                              borderRadius:
                                                                  BorderRadius.circular(3),
                                                            ),
                                                          ),
                                                        ),

                                                        // Bottom Navigation Bar
                                                        Ux4gBottomNavigationBar(
                                                          items: row.items,
                                                          variant: row.variant,
                                                          indicatorVariant: col.indicator,
                                                          showLabels: row.showLabels,
                                                          selectedIndex: selectedIdx,
                                                          onTabChange: (idx, item) {
                                                            _updateMatrixIndex(
                                                              rIdx,
                                                              cIdx,
                                                              idx,
                                                              item.label,
                                                            );
                                                          },
                                                          centerAction: row.variant ==
                                                                  Ux4gBottomNavVariant.centreAction
                                                              ? Ux4gBottomNavCenterAction(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      _lastActionMessage =
                                                                          '[Row ${rIdx + 1}, Col ${cIdx + 1}] Center Action (+) pressed!';
                                                                    });
                                                                  },
                                                                )
                                                              : null,
                                                          useSafeArea: false,
                                                        ),

                                                        // iOS Home Indicator Line
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            top: 4,
                                                            bottom: 8,
                                                          ),
                                                          child: Container(
                                                            width: 72,
                                                            height: 4,
                                                            decoration: BoxDecoration(
                                                              color: _isDark
                                                                  ? Colors.white38
                                                                  : Colors.black87,
                                                              borderRadius:
                                                                  BorderRadius.circular(2),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─── SECTION 2: INTERACTIVE LIVE PLAYGROUND ───────────────────
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colors.onSurface.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Interactive Live Playground',
                          style: typography.hS_strong.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Customize indicator style, shape variants, labels, and badges in real-time.',
                          style: typography.bS_default.copyWith(
                            color: colors.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Indicator Selector
                        Text(
                          '1. Indicator Style:',
                          style: typography.bXS_strong.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final ind in Ux4gBottomNavIndicatorVariant.values)
                              Ux4gChoiceChip(
                                text: ind.name.toUpperCase(),
                                selected: _playgroundIndicator == ind,
                                onClick: () =>
                                    setState(() => _playgroundIndicator = ind),
                              ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // Shape / Variant Selector
                        Text(
                          '2. Shape & Layout Variant:',
                          style: typography.bXS_strong.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final v in Ux4gBottomNavVariant.values)
                              Ux4gChoiceChip(
                                text: v.name,
                                selected: _playgroundVariant == v,
                                onClick: () => setState(() {
                                  _playgroundVariant = v;
                                  _playgroundIndex = 0;
                                }),
                              ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // Badges & Labels Toggles
                        Row(
                          children: [
                            Expanded(
                              child: Ux4gCheckbox(
                                value: _showBadges,
                                onChanged: (v) =>
                                    setState(() => _showBadges = v ?? true),
                                label: 'Show Badges',
                              ),
                            ),
                            Expanded(
                              child: Ux4gCheckbox(
                                value: _showLabels,
                                onChanged: (v) =>
                                    setState(() => _showLabels = v ?? true),
                                label: 'Show Labels',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Live Simulated Phone Frame
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _isDark
                                ? Ux4gColors.neutral950
                                : Ux4gColors.neutral100,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _isDark
                                  ? Ux4gColors.neutral800
                                  : Ux4gColors.neutral300,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Simulator Header & Tab Content
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(builder: (c) {
                                      final items = _playgroundVariant ==
                                              Ux4gBottomNavVariant.centreAction
                                          ? _buildCentreActionItems(showBadges: _showBadges)
                                          : _buildStandardItems(showBadges: _showBadges);
                                      final safeIdx = _playgroundIndex.clamp(0, items.length - 1);
                                      final current = items[safeIdx];

                                      return Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: colors.surface,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: colors.onSurface.withValues(alpha: 0.08),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                color: colors.primary.withValues(alpha: 0.12),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                current.activeIcon as IconData? ?? Icons.home,
                                                color: colors.primary,
                                                size: 24,
                                              ),
                                            ),
                                            const SizedBox(width: 14),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${current.label} Screen',
                                                    style: typography.hS_strong.copyWith(
                                                      color: colors.onSurface,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Text(
                                                    'Variant: ${_playgroundVariant.name} • Indicator: ${_playgroundIndicator.name}',
                                                    style: typography.bXS_default.copyWith(
                                                      color: colors.onSurface.withValues(alpha: 0.6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),

                              // Bottom Nav Component inside Simulator
                              Builder(builder: (c) {
                                final items = _playgroundVariant ==
                                        Ux4gBottomNavVariant.centreAction
                                    ? _buildCentreActionItems(showBadges: _showBadges)
                                    : _buildStandardItems(showBadges: _showBadges);
                                final safeIdx = _playgroundIndex.clamp(0, items.length - 1);

                                return Ux4gBottomNavigationBar(
                                  items: items,
                                  selectedIndex: safeIdx,
                                  indicatorVariant: _playgroundIndicator,
                                  variant: _playgroundVariant,
                                  showLabels: _showLabels,
                                  onTabChange: (idx, item) {
                                    setState(() {
                                      _playgroundIndex = idx;
                                      _lastActionMessage =
                                          'Playground tab switched to: ${item.label} (Index $idx)';
                                    });
                                  },
                                  centerAction: _playgroundVariant ==
                                          Ux4gBottomNavVariant.centreAction
                                      ? Ux4gBottomNavCenterAction(
                                          onPressed: () {
                                            setState(() {
                                              _lastActionMessage =
                                                  'Center Action (+) pressed in Live Playground!';
                                            });
                                          },
                                        )
                                      : null,
                                  useSafeArea: false,
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─── SECTION 3: CODE SNIPPET REFERENCE ───────────────────────
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colors.onSurface.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Developer Usage & Component Presets',
                          style: typography.hS_strong.copyWith(
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Use modular props on Ux4gBottomNavigationBar or convenient preset widgets:',
                          style: typography.bS_default.copyWith(
                            color: colors.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _isDark
                                ? Ux4gColors.neutral950
                                : Ux4gColors.neutral900,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '''// 1. Standard Pill Navigation Bar
Ux4gBottomNavigationBar(
  items: items,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
  variant: Ux4gBottomNavVariant.labelled,
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
)

// 2. Top-Rounded Bar Indicator
Ux4gBarBottomNavBar(
  items: items,
  variant: Ux4gBottomNavVariant.topRounded,
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
)

// 3. Centre Action Button Bar (+)
Ux4gCenterActionBottomNavBar(
  items: items,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
  centerAction: Ux4gBottomNavCenterAction(
    onPressed: () => openQuickActionSheet(),
  ),
)

// 4. Floating Capsule Navigation Bar
Ux4gFloatingBottomNavBar(
  items: items,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
)''',
                            style: const TextStyle(
                              color: Color(0xFF86E1FC),
                              fontFamily: 'monospace',
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ─── FULL SCREEN LIVE DEMO DIALOG ───────────────────────────────────────────

  void _openFullScreenDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (modalCtx, setModalState) {
            final colors = Ux4gTheme.colors(modalCtx);
            final typography = Ux4gTheme.typography(modalCtx);

            final items = _fullScreenVariant == Ux4gBottomNavVariant.centreAction
                ? _buildCentreActionItems(showBadges: true)
                : _buildStandardItems(showBadges: true);
            final clampedIdx = _fullScreenIndex.clamp(0, items.length - 1);
            final activeTab = items[clampedIdx];

            return Container(
              height: MediaQuery.of(context).size.height * 0.95,
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Scaffold(
                backgroundColor: colors.background,
                appBar: AppBar(
                  backgroundColor: colors.surface,
                  elevation: 0,
                  title: Text(
                    'Live Citizen Portal App',
                    style: typography.hS_strong.copyWith(color: colors.onSurface),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.close, color: colors.onSurface),
                    onPressed: () => Navigator.of(modalCtx).pop(),
                  ),
                ),
                body: Column(
                  children: [
                    // Controller Strip
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: colors.surface,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              'INDICATOR: ',
                              style: typography.bXS_strong.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            for (final ind in Ux4gBottomNavIndicatorVariant.values)
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: ChoiceChip(
                                  label: Text(ind.name.toUpperCase()),
                                  selected: _fullScreenIndicator == ind,
                                  onSelected: (sel) {
                                    if (sel) {
                                      setModalState(() => _fullScreenIndicator = ind);
                                      setState(() => _fullScreenIndicator = ind);
                                    }
                                  },
                                ),
                              ),
                            const SizedBox(width: 8),
                            Text(
                              'SHAPE: ',
                              style: typography.bXS_strong.copyWith(
                                color: colors.onSurface.withValues(alpha: 0.6),
                              ),
                            ),
                            for (final v in Ux4gBottomNavVariant.values)
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: ChoiceChip(
                                  label: Text(v.name),
                                  selected: _fullScreenVariant == v,
                                  onSelected: (sel) {
                                    if (sel) {
                                      setModalState(() {
                                        _fullScreenVariant = v;
                                        _fullScreenIndex = 0;
                                      });
                                      setState(() {
                                        _fullScreenVariant = v;
                                        _fullScreenIndex = 0;
                                      });
                                    }
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    // Active Tab Screen Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Greeting Hero Card
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: colors.primary,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DIGITAL CITIZEN PORTAL',
                                    style: typography.bXS_strong.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Welcome, Priya Sharma 👋',
                                    style: typography.hM_strong.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Active Tab: ${activeTab.label} • Key: "${activeTab.key}"',
                                    style: typography.bS_default.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Quick Service Cards
                            Text(
                              'Popular Services',
                              style: typography.hS_strong.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                            const SizedBox(height: 12),
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1.4,
                              children: [
                                _buildServiceCard(colors, typography, 'Apply Certificate', '📄'),
                                _buildServiceCard(colors, typography, 'Pay Utility Bill', '⚡'),
                                _buildServiceCard(colors, typography, 'Locker & Aadhaar', '🔒'),
                                _buildServiceCard(colors, typography, 'File Grievance', '📢'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Navigation Bar
                    Ux4gBottomNavigationBar(
                      items: items,
                      selectedIndex: clampedIdx,
                      indicatorVariant: _fullScreenIndicator,
                      variant: _fullScreenVariant,
                      onTabChange: (idx, item) {
                        setModalState(() => _fullScreenIndex = idx);
                        setState(() => _fullScreenIndex = idx);
                      },
                      centerAction: _fullScreenVariant ==
                              Ux4gBottomNavVariant.centreAction
                          ? Ux4gBottomNavCenterAction(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Centre Action (+) pressed!'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildServiceCard(
    Ux4gThemeColors colors,
    Ux4gTypography typography,
    String title,
    String icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors.onSurface.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            title,
            style: typography.bS_strong.copyWith(color: colors.onSurface),
          ),
        ],
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  _DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.dashWidth = 5.0,
    this.dashSpace = 4.0,
    this.borderRadius = 16.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );
    final path = Path()..addRRect(rrect);

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double len = math.min(dashWidth, metric.length - distance);
        final extractPath = metric.extractPath(distance, distance + len);
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.dashWidth != dashWidth ||
      oldDelegate.dashSpace != dashSpace ||
      oldDelegate.borderRadius != borderRadius;
}

