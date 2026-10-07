import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';
import '../widgets/component_docs.dart';

// ── Asset paths (copied into example/assets/) ──────────────────────────
const _nationalEmblemPath = Ux4gIcons.nationalEmblem;
const _unionLogoPath = Ux4gIcons.union;
const _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;
// ── Shared design tokens used across all Consent patterns ───────────────
bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
// ───────────────────────────────────────────────────────────────────────
// Consent Capture pattern
// ───────────────────────────────────────────────────────────────────────
final consentCaptureComponent = WidgetbookComponent(
  name: 'Consent Capture',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout on a soft-purple background.',
        );
        final code = variant == 'Card style'
            ? _consentCaptureCardCode
            : _consentCaptureCode;
        final child = variant == 'Card style'
            ? const _ConsentCaptureCardMockup()
            : const _ConsentCaptureMobileMockup();
        return ComponentDocs(
          name: 'Consent Capture',
          description:
              'Pattern for capturing user consent to share data and optionally receive updates. '
              'Use the [Variant] knob on the right to toggle layouts. Mobile-sized layout (360px).',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Shared helpers
// ───────────────────────────────────────────────────────────────────────
class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 760,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: (_isDark(context) ? Ux4gColors.gray900 : Ux4gColors.gray100),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: (_isDark(context)
              ? Ux4gColors.neutral800
              : Ux4gColors.neutral200),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ConsentHeader extends StatelessWidget {
  _ConsentHeader();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gAppHeader(
          variant: Ux4gAppHeaderVariant.light,
          title: '',
          verticalPadding: 16,
          leadingWidgets: [
            SvgPicture.asset(
              _nationalEmblemPath,
              height: 32,
              colorFilter: _isDark(context)
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : null,
            ),
            Container(
              width: 1,
              height: 28,
              color: _isDark(context)
                  ? Ux4gColors.neutral600
                  : _isDark(context)
                  ? Ux4gColors.neutral600
                  : (_isDark(context)
                        ? Ux4gColors.neutral600
                        : Ux4gColors.neutral300),
            ),
            SvgPicture.asset(
              _unionLogoPath,
              height: 32,
              colorFilter: ColorFilter.mode(
                _isDark(context)
                    ? Ux4gColors.primary300
                    : Ux4gColors.primary600,
                BlendMode.srcIn,
              ),
            ),
          ],
          actions: [
            Ux4gAppHeaderAction(
              customWidget: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _isDark(context)
                        ? Ux4gColors.neutral700
                        : (_isDark(context)
                              ? Ux4gColors.neutral800
                              : Ux4gColors.neutral200),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.menu,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
          horizontalPadding: 16,
          leadingSpacing: 8,
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: (_isDark(context)
              ? Ux4gColors.neutral800
              : Ux4gColors.neutral200),
        ),
      ],
    );
  }
}

class _ConsentFooter extends StatelessWidget {
  const _ConsentFooter();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Powered by -',
            style: TextStyle(
              fontSize: 11,
              color: (_isDark(context)
                  ? Ux4gColors.neutral500
                  : Ux4gColors.neutral400),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            _digitalIndiaLogoPath,
            height: 22,
            color: _isDark(context) ? Colors.white : null,
          ),
        ],
      ),
    );
  }
}

class _ConsentCaptureItemsList extends StatefulWidget {
  const _ConsentCaptureItemsList();

  @override
  State<_ConsentCaptureItemsList> createState() =>
      _ConsentCaptureItemsListState();
}

class _ConsentCaptureItemsListState extends State<_ConsentCaptureItemsList> {
  bool _docsExpanded = true;
  bool _aadhaar = true;
  bool _pan = false;
  bool _drivingLicense = false;
  bool _profileInfo = true;
  bool _email = true;
  bool _profilePicture = false;
  bool _location = false;

  bool? get _selectAllValue {
    if (_aadhaar && _pan && _drivingLicense) return true;
    if (_aadhaar || _pan || _drivingLicense) return null;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    final titleColor = isDark ? Ux4gColors.neutral50 : Ux4gColors.gray900;
    final subtitleColor =
        isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor =
        isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final primary = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headline
        Text(
          'Please provide your consent to share the following information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: titleColor,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),

        // Options Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.gray900 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Documents dropdown
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _docsExpanded = !_docsExpanded),
                    child: Icon(
                      _docsExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,
                      size: 20,
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Documents',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Select all',
                    style: TextStyle(
                      fontSize: 12,
                      color: subtitleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Ux4gCheckbox(
                    value: _selectAllValue,
                    onChanged: (val) {
                      setState(() {
                        final all = _aadhaar && _pan && _drivingLicense;
                        _aadhaar = !all;
                        _pan = !all;
                        _drivingLicense = !all;
                      });
                    },
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              if (_docsExpanded) ...[
                const SizedBox(height: 12),
                // Aadhaar Card
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aadhaar Card',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      Ux4gCheckbox(
                        value: _aadhaar,
                        onChanged: (val) =>
                            setState(() => _aadhaar = val ?? false),
                        size: Ux4gCheckboxSize.small,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // PAN
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PAN',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      Ux4gCheckbox(
                        value: _pan,
                        onChanged: (val) => setState(() => _pan = val ?? false),
                        size: Ux4gCheckboxSize.small,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Driving License
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Driving License',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      Ux4gCheckbox(
                        value: _drivingLicense,
                        onChanged: (val) =>
                            setState(() => _drivingLicense = val ?? false),
                        size: Ux4gCheckboxSize.small,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // View all link
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                  ),
                ),
              ],
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 2. Profile information
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile information',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Name, Date of Birth, Gender',
                          style: TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _profileInfo,
                    onChanged: (val) =>
                        setState(() => _profileInfo = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 3. Get your email
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail_outline,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Get your email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _email,
                    onChanged: (val) => setState(() => _email = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 4. Get your profile picture
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Get your profile picture',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _profilePicture,
                    onChanged: (val) =>
                        setState(() => _profilePicture = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 5. Location
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _location,
                    onChanged: (val) =>
                        setState(() => _location = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 6. Consent validity date
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Consent validity date',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '(Today + 30 days)\n08-Oct-2026',
                          style: TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Legal Text
        Text(
          'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),

        // Allow & Deny Buttons
        Ux4gButton(
          text: 'Allow',
          onPressed: () {},
          height: 48,
          size: Ux4gButtonSize.large,
          width: double.infinity,
          variant: Ux4gButtonVariant.primary,
        ),
        const SizedBox(height: 10),
        Ux4gButton(
          text: 'Deny',
          onPressed: () {},
          height: 48,
          size: Ux4gButtonSize.large,
          width: double.infinity,
          variant: Ux4gButtonVariant.outline,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _ConsentCaptureMobileMockup extends StatelessWidget {
  const _ConsentCaptureMobileMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: const _ConsentCaptureItemsList(),
            ),
          ),
          const _ConsentFooter(),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Card Style Layout Mockup
// ───────────────────────────────────────────────────────────────────────
class _ConsentCaptureCardMockup extends StatelessWidget {
  const _ConsentCaptureCardMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: Container(
              color: isDark ? Ux4gColors.primary900 : Ux4gColors.primary100,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isDark
                                ? Ux4gColors.neutral800
                                : Ux4gColors.neutral200,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const _ConsentCaptureItemsList(),
                      ),
                    ),
                  ),
                  const _ConsentFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets
// ───────────────────────────────────────────────────────────────────────
const _consentCaptureCode = r'''class ConsentCapturePage extends StatefulWidget {
  const ConsentCapturePage({super.key});

  @override
  State<ConsentCapturePage> createState() => _ConsentCapturePageState();
}

class _ConsentCapturePageState extends State<ConsentCapturePage> {
  bool _docsExpanded = true;
  bool _aadhaar = true;
  bool _pan = false;
  bool _drivingLicense = false;
  bool _profileInfo = true;
  bool _email = true;
  bool _profilePicture = false;
  bool _location = false;

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  bool? get _selectAllValue {
    if (_aadhaar && _pan && _drivingLicense) return true;
    if (_aadhaar || _pan || _drivingLicense) return null;
    return false;
  }

  void _onToggleSelectAll(bool? val) {
    setState(() {
      final all = _aadhaar && _pan && _drivingLicense;
      _aadhaar = !all;
      _pan = !all;
      _drivingLicense = !all;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleColor = _isDark ? Ux4gColors.neutral50 : Ux4gColors.gray900;
    final subtitleColor = _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor = _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final primary = _isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

    return Scaffold(
      body: Column(
        children: [
          // Header
          Ux4gAppHeader(
            variant: Ux4gAppHeaderVariant.light,
            title: '',
            leadingWidgets: [
              SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
              Container(width: 1, height: 28, color: _isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300),
              SvgPicture.asset(Ux4gIcons.union, height: 32),
            ],
            actions: [
              Ux4gAppHeaderAction(
                customWidget: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary, size: 20),
                  ),
                ),
              ),
            ],
            horizontalPadding: 16,
            leadingSpacing: 8,
          ),
          Divider(height: 1, thickness: 1, color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Headline
                  Text(
                    'Please provide your consent to share the following information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Options Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDark ? Ux4gColors.gray900 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Documents dropdown
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => _docsExpanded = !_docsExpanded),
                              child: Icon(
                                _docsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                                size: 20,
                                color: titleColor,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Documents',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                            ),
                            const Spacer(),
                            Text(
                              'Select all',
                              style: TextStyle(fontSize: 12, color: subtitleColor, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 8),
                            Ux4gCheckbox(
                              value: _selectAllValue,
                              onChanged: _onToggleSelectAll,
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        if (_docsExpanded) ...[
                          const SizedBox(height: 12),
                          // Aadhaar Card
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Aadhaar Card',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                  ),
                                ),
                                Ux4gCheckbox(
                                  value: _aadhaar,
                                  onChanged: (val) => setState(() => _aadhaar = val ?? false),
                                  size: Ux4gCheckboxSize.small,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // PAN
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'PAN',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                  ),
                                ),
                                Ux4gCheckbox(
                                  value: _pan,
                                  onChanged: (val) => setState(() => _pan = val ?? false),
                                  size: Ux4gCheckboxSize.small,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Driving License
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Driving License',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                  ),
                                ),
                                Ux4gCheckbox(
                                  value: _drivingLicense,
                                  onChanged: (val) => setState(() => _drivingLicense = val ?? false),
                                  size: Ux4gCheckboxSize.small,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // View all link
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'View all',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                              ),
                            ),
                          ),
                        ],
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 2. Profile information
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.account_circle_outlined, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Profile information',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Name, Date of Birth, Gender',
                                    style: TextStyle(fontSize: 12, color: subtitleColor),
                                  ),
                                ],
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _profileInfo,
                              onChanged: (val) => setState(() => _profileInfo = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 3. Get your email
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.mail_outline, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Get your email',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _email,
                              onChanged: (val) => setState(() => _email = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 4. Get your profile picture
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.account_circle, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Get your profile picture',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _profilePicture,
                              onChanged: (val) => setState(() => _profilePicture = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 5. Location
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Location',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _location,
                              onChanged: (val) => setState(() => _location = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 6. Consent validity date
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consent validity date',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '(Today + 30 days)\n08-Oct-2026',
                                    style: TextStyle(fontSize: 12, color: subtitleColor, height: 1.3),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Legal Text
                  Text(
                    'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
                    style: TextStyle(
                      fontSize: 12,
                      color: _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Allow & Deny Buttons
                  Ux4gButton(
                    text: 'Allow',
                    onPressed: () {},
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    variant: Ux4gButtonVariant.primary,
                  ),
                  const SizedBox(height: 10),
                  Ux4gButton(
                    text: 'Deny',
                    onPressed: () {},
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    variant: Ux4gButtonVariant.outline,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: _isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}''';
const _consentCaptureCardCode = r'''class ConsentCaptureCardPage extends StatefulWidget {
  const ConsentCaptureCardPage({super.key});

  @override
  State<ConsentCaptureCardPage> createState() => _ConsentCaptureCardPageState();
}

class _ConsentCaptureCardPageState extends State<ConsentCaptureCardPage> {
  bool _docsExpanded = true;
  bool _aadhaar = true;
  bool _pan = false;
  bool _drivingLicense = false;
  bool _profileInfo = true;
  bool _email = true;
  bool _profilePicture = false;
  bool _location = false;

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  bool? get _selectAllValue {
    if (_aadhaar && _pan && _drivingLicense) return true;
    if (_aadhaar || _pan || _drivingLicense) return null;
    return false;
  }

  void _onToggleSelectAll(bool? val) {
    setState(() {
      final all = _aadhaar && _pan && _drivingLicense;
      _aadhaar = !all;
      _pan = !all;
      _drivingLicense = !all;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleColor = _isDark ? Ux4gColors.neutral50 : Ux4gColors.gray900;
    final subtitleColor = _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor = _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final primary = _isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

    return Scaffold(
      body: Column(
        children: [
          // Header
          Ux4gAppHeader(
            variant: Ux4gAppHeaderVariant.light,
            title: '',
            leadingWidgets: [
              SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
              Container(width: 1, height: 28, color: _isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300),
              SvgPicture.asset(Ux4gIcons.union, height: 32),
            ],
            actions: [
              Ux4gAppHeaderAction(
                customWidget: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary, size: 20),
                  ),
                ),
              ),
            ],
            horizontalPadding: 16,
            leadingSpacing: 8,
          ),
          Expanded(
            child: Container(
              color: _isDark ? Ux4gColors.primary900 : Ux4gColors.primary100, // Soft purple background
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Headline
                            Text(
                              'Please provide your consent to share the following information',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: titleColor,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Options Card
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _isDark ? Ux4gColors.gray800 : Ux4gColors.gray50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 1. Documents dropdown
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => setState(() => _docsExpanded = !_docsExpanded),
                                        child: Icon(
                                          _docsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                                          size: 20,
                                          color: titleColor,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Documents',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Select all',
                                        style: TextStyle(fontSize: 12, color: subtitleColor, fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 8),
                                      Ux4gCheckbox(
                                        value: _selectAllValue,
                                        onChanged: _onToggleSelectAll,
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  if (_docsExpanded) ...[
                                    const SizedBox(height: 12),
                                    // Aadhaar Card
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Aadhaar Card',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                            ),
                                          ),
                                          Ux4gCheckbox(
                                            value: _aadhaar,
                                            onChanged: (val) => setState(() => _aadhaar = val ?? false),
                                            size: Ux4gCheckboxSize.small,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // PAN
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'PAN',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                            ),
                                          ),
                                          Ux4gCheckbox(
                                            value: _pan,
                                            onChanged: (val) => setState(() => _pan = val ?? false),
                                            size: Ux4gCheckboxSize.small,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Driving License
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Driving License',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                            ),
                                          ),
                                          Ux4gCheckbox(
                                            value: _drivingLicense,
                                            onChanged: (val) => setState(() => _drivingLicense = val ?? false),
                                            size: Ux4gCheckboxSize.small,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // View all link
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'View all',
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                                        ),
                                      ),
                                    ),
                                  ],
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 2. Profile information
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.account_circle_outlined, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Profile information',
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              'Name, Date of Birth, Gender',
                                              style: TextStyle(fontSize: 12, color: subtitleColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _profileInfo,
                                        onChanged: (val) => setState(() => _profileInfo = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 3. Get your email
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mail_outline, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Get your email',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _email,
                                        onChanged: (val) => setState(() => _email = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 4. Get your profile picture
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.account_circle, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Get your profile picture',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _profilePicture,
                                        onChanged: (val) => setState(() => _profilePicture = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 5. Location
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on_outlined, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Location',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _location,
                                        onChanged: (val) => setState(() => _location = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 6. Consent validity date
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.calendar_today_outlined, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Consent validity date',
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              '(Today + 30 days)\n08-Oct-2026',
                                              style: TextStyle(fontSize: 12, color: subtitleColor, height: 1.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Legal Text
                            Text(
                              'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
                              style: TextStyle(
                                fontSize: 12,
                                color: _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Allow & Deny Buttons
                            Ux4gButton(
                              text: 'Allow',
                              onPressed: () {},
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                              variant: Ux4gButtonVariant.primary,
                            ),
                            const SizedBox(height: 10),
                            Ux4gButton(
                              text: 'Deny',
                              onPressed: () {},
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                              variant: Ux4gButtonVariant.outline,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color: _isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}''';
// ───────────────────────────────────────────────────────────────────────
// Consent Capture (Consent Not Given) pattern
// ───────────────────────────────────────────────────────────────────────
final consentCaptureWithWarningComponent = WidgetbookComponent(
  name: 'Consent Capture (Consent Not Given)',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout with warning banner.',
        );
        final code = variant == 'Card style'
            ? _consentCaptureWarningCardCode
            : _consentCaptureWarningCode;
        final child = variant == 'Card style'
            ? const _ConsentCaptureWarningCardMockup()
            : const _ConsentCaptureWarningMobileMockup();
        return ComponentDocs(
          name: 'Consent Capture (Consent Not Given)',
          description:
              'Pattern showing the error state when the required consent is not selected. '
              'Displays the warning banner and disables the Proceed button.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Mockups for Consent Not Given
// ───────────────────────────────────────────────────────────────────────
class _ConsentCaptureWarningItemsList extends StatefulWidget {
  const _ConsentCaptureWarningItemsList();

  @override
  State<_ConsentCaptureWarningItemsList> createState() =>
      _ConsentCaptureWarningItemsListState();
}

class _ConsentCaptureWarningItemsListState
    extends State<_ConsentCaptureWarningItemsList> {
  bool _docsExpanded = true;
  bool _aadhaar = false;
  bool _pan = false;
  bool _drivingLicense = false;
  bool _profileInfo = false;
  bool _email = false;
  bool _profilePicture = false;
  bool _location = false;

  bool? get _selectAllValue {
    if (_aadhaar && _pan && _drivingLicense) return true;
    if (_aadhaar || _pan || _drivingLicense) return null;
    return false;
  }

  bool get _hasAnyConsent =>
      _aadhaar ||
      _pan ||
      _drivingLicense ||
      _profileInfo ||
      _email ||
      _profilePicture ||
      _location;

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    final titleColor = isDark ? Ux4gColors.neutral50 : Ux4gColors.gray900;
    final subtitleColor =
        isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor =
        isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final primary = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headline
        Text(
          'Please provide your consent to share the following information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: titleColor,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),

        // Options Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.gray900 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Documents dropdown
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _docsExpanded = !_docsExpanded),
                    child: Icon(
                      _docsExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,
                      size: 20,
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Documents',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Select all',
                    style: TextStyle(
                      fontSize: 12,
                      color: subtitleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Ux4gCheckbox(
                    value: _selectAllValue,
                    onChanged: (val) {
                      setState(() {
                        final all = _aadhaar && _pan && _drivingLicense;
                        _aadhaar = !all;
                        _pan = !all;
                        _drivingLicense = !all;
                      });
                    },
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              if (_docsExpanded) ...[
                const SizedBox(height: 12),
                // Aadhaar Card
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aadhaar Card',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      Ux4gCheckbox(
                        value: _aadhaar,
                        onChanged: (val) =>
                            setState(() => _aadhaar = val ?? false),
                        size: Ux4gCheckboxSize.small,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // PAN
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PAN',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      Ux4gCheckbox(
                        value: _pan,
                        onChanged: (val) => setState(() => _pan = val ?? false),
                        size: Ux4gCheckboxSize.small,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Driving License
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Driving License',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      Ux4gCheckbox(
                        value: _drivingLicense,
                        onChanged: (val) =>
                            setState(() => _drivingLicense = val ?? false),
                        size: Ux4gCheckboxSize.small,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // View all link
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                  ),
                ),
              ],
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 2. Profile information
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile information',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Name, Date of Birth, Gender',
                          style: TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _profileInfo,
                    onChanged: (val) =>
                        setState(() => _profileInfo = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 3. Get your email
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail_outline,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Get your email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _email,
                    onChanged: (val) => setState(() => _email = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 4. Get your profile picture
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Get your profile picture',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _profilePicture,
                    onChanged: (val) =>
                        setState(() => _profilePicture = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 5. Location
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  Ux4gCheckbox(
                    value: _location,
                    onChanged: (val) =>
                        setState(() => _location = val ?? false),
                    size: Ux4gCheckboxSize.small,
                  ),
                ],
              ),
              Divider(height: 28, thickness: 1, color: dividerColor),

              // 6. Consent validity date
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 22,
                    color: titleColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Consent validity date',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '(Today + 30 days)\n08-Oct-2026',
                          style: TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Legal Text
        Text(
          'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),

        // Warning Banner
        if (!_hasAnyConsent) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF332005) : const Color(0xFFFFF7EB),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color:
                    isDark ? const Color(0xFF66400A) : const Color(0xFFFFD599),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  color: Ux4gColors.orange600,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'You have not given consent. Nothing will be shared and you cannot continue.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? const Color(0xFFFFCC80)
                          : const Color(0xFF975A16),
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Allow & Deny Buttons
        Ux4gButton(
          text: 'Allow',
          onPressed: _hasAnyConsent ? () {} : null,
          height: 48,
          size: Ux4gButtonSize.large,
          width: double.infinity,
          variant: Ux4gButtonVariant.primary,
        ),
        const SizedBox(height: 10),
        Ux4gButton(
          text: 'Deny',
          onPressed: () {},
          height: 48,
          size: Ux4gButtonSize.large,
          width: double.infinity,
          variant: Ux4gButtonVariant.outline,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _ConsentCaptureWarningMobileMockup extends StatelessWidget {
  const _ConsentCaptureWarningMobileMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: const _ConsentCaptureWarningItemsList(),
            ),
          ),
          const _ConsentFooter(),
        ],
      ),
    );
  }
}

class _ConsentCaptureWarningCardMockup extends StatelessWidget {
  const _ConsentCaptureWarningCardMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: Container(
              color: isDark ? Ux4gColors.primary900 : Ux4gColors.primary100,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isDark
                                ? Ux4gColors.neutral800
                                : Ux4gColors.neutral200,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const _ConsentCaptureWarningItemsList(),
                      ),
                    ),
                  ),
                  const _ConsentFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets for Consent Not Given
// ───────────────────────────────────────────────────────────────────────
const _consentCaptureWarningCode = r'''class ConsentCaptureWarningPage extends StatefulWidget {
  const ConsentCaptureWarningPage({super.key});

  @override
  State<ConsentCaptureWarningPage> createState() => _ConsentCaptureWarningPageState();
}

class _ConsentCaptureWarningPageState extends State<ConsentCaptureWarningPage> {
  bool _docsExpanded = true;
  bool _aadhaar = false;
  bool _pan = false;
  bool _drivingLicense = false;
  bool _profileInfo = false;
  bool _email = false;
  bool _profilePicture = false;
  bool _location = false;

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  bool? get _selectAllValue {
    if (_aadhaar && _pan && _drivingLicense) return true;
    if (_aadhaar || _pan || _drivingLicense) return null;
    return false;
  }

  bool get _hasAnyConsent =>
      _aadhaar ||
      _pan ||
      _drivingLicense ||
      _profileInfo ||
      _email ||
      _profilePicture ||
      _location;

  void _onToggleSelectAll(bool? val) {
    setState(() {
      final all = _aadhaar && _pan && _drivingLicense;
      _aadhaar = !all;
      _pan = !all;
      _drivingLicense = !all;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleColor = _isDark ? Ux4gColors.neutral50 : Ux4gColors.gray900;
    final subtitleColor = _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor = _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final primary = _isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

    return Scaffold(
      body: Column(
        children: [
          // Header
          Ux4gAppHeader(
            variant: Ux4gAppHeaderVariant.light,
            title: '',
            leadingWidgets: [
              SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
              Container(width: 1, height: 28, color: _isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300),
              SvgPicture.asset(Ux4gIcons.union, height: 32),
            ],
            actions: [
              Ux4gAppHeaderAction(
                customWidget: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary, size: 20),
                  ),
                ),
              ),
            ],
            horizontalPadding: 16,
            leadingSpacing: 8,
          ),
          Divider(height: 1, thickness: 1, color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Headline
                  Text(
                    'Please provide your consent to share the following information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Options Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDark ? Ux4gColors.gray900 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Documents dropdown
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => _docsExpanded = !_docsExpanded),
                              child: Icon(
                                _docsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                                size: 20,
                                color: titleColor,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Documents',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                            ),
                            const Spacer(),
                            Text(
                              'Select all',
                              style: TextStyle(fontSize: 12, color: subtitleColor, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 8),
                            Ux4gCheckbox(
                              value: _selectAllValue,
                              onChanged: _onToggleSelectAll,
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        if (_docsExpanded) ...[
                          const SizedBox(height: 12),
                          // Aadhaar Card
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Aadhaar Card',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                  ),
                                ),
                                Ux4gCheckbox(
                                  value: _aadhaar,
                                  onChanged: (val) => setState(() => _aadhaar = val ?? false),
                                  size: Ux4gCheckboxSize.small,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // PAN
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'PAN',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                  ),
                                ),
                                Ux4gCheckbox(
                                  value: _pan,
                                  onChanged: (val) => setState(() => _pan = val ?? false),
                                  size: Ux4gCheckboxSize.small,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Driving License
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Driving License',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                  ),
                                ),
                                Ux4gCheckbox(
                                  value: _drivingLicense,
                                  onChanged: (val) => setState(() => _drivingLicense = val ?? false),
                                  size: Ux4gCheckboxSize.small,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          // View all link
                          Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'View all',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                              ),
                            ),
                          ),
                        ],
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 2. Profile information
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.account_circle_outlined, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Profile information',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Name, Date of Birth, Gender',
                                    style: TextStyle(fontSize: 12, color: subtitleColor),
                                  ),
                                ],
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _profileInfo,
                              onChanged: (val) => setState(() => _profileInfo = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 3. Get your email
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.mail_outline, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Get your email',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _email,
                              onChanged: (val) => setState(() => _email = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 4. Get your profile picture
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.account_circle, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Get your profile picture',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _profilePicture,
                              onChanged: (val) => setState(() => _profilePicture = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 5. Location
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Location',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                              ),
                            ),
                            Ux4gCheckbox(
                              value: _location,
                              onChanged: (val) => setState(() => _location = val ?? false),
                              size: Ux4gCheckboxSize.small,
                            ),
                          ],
                        ),
                        Divider(height: 28, thickness: 1, color: dividerColor),

                        // 6. Consent validity date
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 22, color: titleColor),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consent validity date',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '(Today + 30 days)\n08-Oct-2026',
                                    style: TextStyle(fontSize: 12, color: subtitleColor, height: 1.3),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Edit',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Legal Text
                  Text(
                    'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
                    style: TextStyle(
                      fontSize: 12,
                      color: _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Warning Banner
                  if (!_hasAnyConsent) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: _isDark ? const Color(0xFF332005) : const Color(0xFFFFF7EB),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _isDark ? const Color(0xFF66400A) : const Color(0xFFFFD599),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Ux4gColors.orange600, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'You have not given consent. Nothing will be shared and you cannot continue.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: _isDark ? const Color(0xFFFFCC80) : const Color(0xFF975A16),
                                height: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Allow & Deny Buttons
                  Ux4gButton(
                    text: 'Allow',
                    onPressed: _hasAnyConsent ? () {} : null,
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    variant: Ux4gButtonVariant.primary,
                  ),
                  const SizedBox(height: 10),
                  Ux4gButton(
                    text: 'Deny',
                    onPressed: () {},
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    variant: Ux4gButtonVariant.outline,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: _isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}''';
const _consentCaptureWarningCardCode = r'''class ConsentCaptureWarningCardPage extends StatefulWidget {
  const ConsentCaptureWarningCardPage({super.key});

  @override
  State<ConsentCaptureWarningCardPage> createState() => _ConsentCaptureWarningCardPageState();
}

class _ConsentCaptureWarningCardPageState extends State<ConsentCaptureWarningCardPage> {
  bool _docsExpanded = true;
  bool _aadhaar = false;
  bool _pan = false;
  bool _drivingLicense = false;
  bool _profileInfo = false;
  bool _email = false;
  bool _profilePicture = false;
  bool _location = false;

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  bool? get _selectAllValue {
    if (_aadhaar && _pan && _drivingLicense) return true;
    if (_aadhaar || _pan || _drivingLicense) return null;
    return false;
  }

  bool get _hasAnyConsent =>
      _aadhaar ||
      _pan ||
      _drivingLicense ||
      _profileInfo ||
      _email ||
      _profilePicture ||
      _location;

  void _onToggleSelectAll(bool? val) {
    setState(() {
      final all = _aadhaar && _pan && _drivingLicense;
      _aadhaar = !all;
      _pan = !all;
      _drivingLicense = !all;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleColor = _isDark ? Ux4gColors.neutral50 : Ux4gColors.gray900;
    final subtitleColor = _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor = _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final primary = _isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

    return Scaffold(
      body: Column(
        children: [
          // Header
          Ux4gAppHeader(
            variant: Ux4gAppHeaderVariant.light,
            title: '',
            leadingWidgets: [
              SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
              Container(width: 1, height: 28, color: _isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300),
              SvgPicture.asset(Ux4gIcons.union, height: 32),
            ],
            actions: [
              Ux4gAppHeaderAction(
                customWidget: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(Icons.menu, color: Theme.of(context).colorScheme.primary, size: 20),
                  ),
                ),
              ),
            ],
            horizontalPadding: 16,
            leadingSpacing: 8,
          ),
          Expanded(
            child: Container(
              color: _isDark ? Ux4gColors.primary900 : Ux4gColors.primary100, // Soft purple background
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: _isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Headline
                            Text(
                              'Please provide your consent to share the following information',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: titleColor,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Options Card
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _isDark ? Ux4gColors.gray800 : Ux4gColors.gray50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 1. Documents dropdown
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => setState(() => _docsExpanded = !_docsExpanded),
                                        child: Icon(
                                          _docsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                                          size: 20,
                                          color: titleColor,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Documents',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Select all',
                                        style: TextStyle(fontSize: 12, color: subtitleColor, fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 8),
                                      Ux4gCheckbox(
                                        value: _selectAllValue,
                                        onChanged: _onToggleSelectAll,
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  if (_docsExpanded) ...[
                                    const SizedBox(height: 12),
                                    // Aadhaar Card
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Aadhaar Card',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                            ),
                                          ),
                                          Ux4gCheckbox(
                                            value: _aadhaar,
                                            onChanged: (val) => setState(() => _aadhaar = val ?? false),
                                            size: Ux4gCheckboxSize.small,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // PAN
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'PAN',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                            ),
                                          ),
                                          Ux4gCheckbox(
                                            value: _pan,
                                            onChanged: (val) => setState(() => _pan = val ?? false),
                                            size: Ux4gCheckboxSize.small,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Driving License
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Driving License',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: _isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800,
                                            ),
                                          ),
                                          Ux4gCheckbox(
                                            value: _drivingLicense,
                                            onChanged: (val) => setState(() => _drivingLicense = val ?? false),
                                            size: Ux4gCheckboxSize.small,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // View all link
                                    Padding(
                                      padding: const EdgeInsets.only(left: 26),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'View all',
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                                        ),
                                      ),
                                    ),
                                  ],
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 2. Profile information
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.account_circle_outlined, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Profile information',
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              'Name, Date of Birth, Gender',
                                              style: TextStyle(fontSize: 12, color: subtitleColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _profileInfo,
                                        onChanged: (val) => setState(() => _profileInfo = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 3. Get your email
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mail_outline, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Get your email',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _email,
                                        onChanged: (val) => setState(() => _email = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 4. Get your profile picture
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.account_circle, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Get your profile picture',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _profilePicture,
                                        onChanged: (val) => setState(() => _profilePicture = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 5. Location
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on_outlined, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Location',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                        ),
                                      ),
                                      Ux4gCheckbox(
                                        value: _location,
                                        onChanged: (val) => setState(() => _location = val ?? false),
                                        size: Ux4gCheckboxSize.small,
                                      ),
                                    ],
                                  ),
                                  Divider(height: 28, thickness: 1, color: dividerColor),

                                  // 6. Consent validity date
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.calendar_today_outlined, size: 22, color: titleColor),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Consent validity date',
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: titleColor),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              '(Today + 30 days)\n08-Oct-2026',
                                              style: TextStyle(fontSize: 12, color: subtitleColor, height: 1.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Legal Text
                            Text(
                              'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
                              style: TextStyle(
                                fontSize: 12,
                                color: _isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Warning Banner
                            if (!_hasAnyConsent) ...[
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                decoration: BoxDecoration(
                                  color: _isDark ? const Color(0xFF332005) : const Color(0xFFFFF7EB),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: _isDark ? const Color(0xFF66400A) : const Color(0xFFFFD599),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error, color: Ux4gColors.orange600, size: 20),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        'You have not given consent. Nothing will be shared and you cannot continue.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: _isDark ? const Color(0xFFFFCC80) : const Color(0xFF975A16),
                                          height: 1.35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],

                            // Allow & Deny Buttons
                            Ux4gButton(
                              text: 'Allow',
                              onPressed: _hasAnyConsent ? () {} : null,
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                              variant: Ux4gButtonVariant.primary,
                            ),
                            const SizedBox(height: 10),
                            Ux4gButton(
                              text: 'Deny',
                              onPressed: () {},
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                              variant: Ux4gButtonVariant.outline,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color: _isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}''';

// ───────────────────────────────────────────────────────────────────────
// Consent Management pattern
// ───────────────────────────────────────────────────────────────────────
final consentManagementComponent = WidgetbookComponent(
  name: 'Consent Management',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout for managing active/withdrawn consents.',
        );
        final code = variant == 'Card style'
            ? _consentManagementCardCode
            : _consentManagementCode;
        final child = variant == 'Card style'
            ? const _ConsentManagementCardMockup()
            : const _ConsentManagementMobileMockup();
        return ComponentDocs(
          name: 'Consent Management',
          description:
              'Pattern for viewing consent history, downloading PDF records, and toggling (withdrawing/restoring) active consents.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Mockups for Consent Management
// ───────────────────────────────────────────────────────────────────────
class _ConsentManagementContent extends StatefulWidget {
  const _ConsentManagementContent();

  @override
  State<_ConsentManagementContent> createState() =>
      _ConsentManagementContentState();
}

class _ConsentManagementContentState extends State<_ConsentManagementContent> {
  bool _docsExpanded = true;

  Widget _buildStatusBadge(BuildContext context, String status) {
    final isDark = _isDark(context);
    Color bg;
    Color text;
    if (status == 'Shared') {
      bg = isDark ? const Color(0xFF14532D) : const Color(0xFFDCFCE7);
      text = isDark ? const Color(0xFF86EFAC) : const Color(0xFF166534);
    } else if (status == 'Partly shared') {
      bg = isDark ? const Color(0xFF452205) : const Color(0xFFFFE8C6);
      text = isDark ? const Color(0xFFFFB74D) : const Color(0xFF975A16);
    } else {
      // 'Not shared'
      bg = isDark ? Ux4gColors.neutral800 : const Color(0xFFE9ECEF);
      text = isDark ? Ux4gColors.neutral300 : const Color(0xFF495057);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    final titleColor = isDark ? Ux4gColors.neutral50 : Ux4gColors.gray900;
    final subtitleColor =
        isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor =
        isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final iconColor = isDark ? Ux4gColors.neutral300 : Ux4gColors.neutral800;
    final primary = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headline
        Text(
          'You gave consent to share the following information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: titleColor,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 16),

        // Items Card
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.gray900 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Documents (collapsible)
              InkWell(
                onTap: () => setState(() => _docsExpanded = !_docsExpanded),
                borderRadius: BorderRadius.circular(4),
                child: Row(
                  children: [
                    Icon(
                      _docsExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,
                      color: iconColor,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Documents',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                    const Spacer(),
                    _buildStatusBadge(context, 'Partly shared'),
                  ],
                ),
              ),
              if (_docsExpanded) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Aadhaar Card',
                            style: TextStyle(
                              fontSize: 13,
                              color: titleColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          _buildStatusBadge(context, 'Shared'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'PAN',
                            style: TextStyle(
                              fontSize: 13,
                              color: titleColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          _buildStatusBadge(context, 'Not shared'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            'Driving License',
                            style: TextStyle(
                              fontSize: 13,
                              color: titleColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          _buildStatusBadge(context, 'Not shared'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              Divider(height: 24, thickness: 1, color: dividerColor),

              // 2. Profile Information
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_outlined, size: 22, color: iconColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile information',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Name, Date of Birth, Gender',
                          style: TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(context, 'Shared'),
                ],
              ),
              Divider(height: 24, thickness: 1, color: dividerColor),

              // 3. Get your email
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline, size: 22, color: iconColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Get your email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  _buildStatusBadge(context, 'Shared'),
                ],
              ),
              Divider(height: 24, thickness: 1, color: dividerColor),

              // 4. Get your profile picture
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, size: 22, color: iconColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Get your profile picture',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  _buildStatusBadge(context, 'Not shared'),
                ],
              ),
              Divider(height: 24, thickness: 1, color: dividerColor),

              // 5. Location
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined, size: 22, color: iconColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),
                  ),
                  _buildStatusBadge(context, 'Not shared'),
                ],
              ),
              Divider(height: 24, thickness: 1, color: dividerColor),

              // 6. Consent validity date
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: iconColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Consent validity date',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '(Today + 30 days)\n08-Oct-2026',
                          style: TextStyle(
                            fontSize: 12,
                            color: subtitleColor,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Legal notice
        Text(
          'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 16),

        // Full consent history link
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View full consent history',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.open_in_new, size: 14, color: primary),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Close & Revoke Buttons
        Ux4gButton(
          text: 'Close',
          onPressed: () {},
          height: 44,
          size: Ux4gButtonSize.large,
          width: double.infinity,
          variant: Ux4gButtonVariant.primary,
        ),
        const SizedBox(height: 10),
        Ux4gButton(
          text: 'Revoke consent',
          onPressed: () {},
          height: 44,
          size: Ux4gButtonSize.large,
          width: double.infinity,
          variant: Ux4gButtonVariant.outline,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _ConsentManagementMobileMockup extends StatelessWidget {
  const _ConsentManagementMobileMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: const _ConsentManagementContent(),
            ),
          ),
          const _ConsentFooter(),
        ],
      ),
    );
  }
}

class _ConsentManagementCardMockup extends StatelessWidget {
  const _ConsentManagementCardMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: Container(
              color: isDark ? Ux4gColors.primary900 : const Color(0xFFE5DEFF),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const _ConsentManagementContent(),
                      ),
                    ),
                  ),
                  const _ConsentFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets for Consent Management
// ───────────────────────────────────────────────────────────────────────
const _consentManagementCode = r'''// Consent Management – Flat Layout
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
        Container(width: 1, height: 28, color: Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union, height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.menu, color: Ux4gColors.primary600, size: 20),
          ),
        ),
      ],
      horizontalPadding: 16,
      verticalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, thickness: 1, color: Ux4gColors.neutral200),
    Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline
            Text(
              'You gave consent to share the following information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Ux4gColors.gray900,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 16),

            // Items Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Ux4gColors.neutral200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Documents (collapsible)
                  Row(
                    children: [
                      Icon(Icons.keyboard_arrow_down, color: Ux4gColors.neutral800, size: 22),
                      const SizedBox(width: 8),
                      Text('Documents', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: Color(0xFFFFE8C6), borderRadius: BorderRadius.circular(6)),
                        child: Text('Partly shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF975A16))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Aadhaar Card', style: TextStyle(fontSize: 13, color: Ux4gColors.gray900, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(color: Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(6)),
                              child: Text('Shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF166534))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text('PAN', style: TextStyle(fontSize: 13, color: Ux4gColors.gray900, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                              child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text('Driving License', style: TextStyle(fontSize: 13, color: Ux4gColors.gray900, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                              child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text('View all', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Ux4gColors.primary600)),
                      ],
                    ),
                  ),
                  Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                  // 2. Profile Information
                  Row(
                    children: [
                      Icon(Icons.account_circle_outlined, size: 22, color: Ux4gColors.neutral800),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Profile information', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                            const SizedBox(height: 2),
                            Text('Name, Date of Birth, Gender', style: TextStyle(fontSize: 12, color: Ux4gColors.neutral600)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(6)),
                        child: Text('Shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF166534))),
                      ),
                    ],
                  ),
                  Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                  // 3. Get your email
                  Row(
                    children: [
                      Icon(Icons.mail_outline, size: 22, color: Ux4gColors.neutral800),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Get your email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(6)),
                        child: Text('Shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF166534))),
                      ),
                    ],
                  ),
                  Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                  // 4. Get your profile picture
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 22, color: Ux4gColors.neutral800),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Get your profile picture', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                        child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                      ),
                    ],
                  ),
                  Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                  // 5. Location
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 22, color: Ux4gColors.neutral800),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Location', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                        child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                      ),
                    ],
                  ),
                  Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                  // 6. Consent validity date
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 20, color: Ux4gColors.neutral800),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Consent validity date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                            const SizedBox(height: 2),
                            Text('(Today + 30 days)\n08-Oct-2026', style: TextStyle(fontSize: 12, color: Ux4gColors.neutral600, height: 1.3)),
                          ],
                        ),
                      ),
                      Text('Edit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Ux4gColors.primary600)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Legal notice
            Text(
              'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
              style: TextStyle(fontSize: 12, color: Ux4gColors.neutral600, height: 1.35),
            ),
            const SizedBox(height: 16),

            // History link
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('View full consent history', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Ux4gColors.primary600)),
                const SizedBox(width: 4),
                Icon(Icons.open_in_new, size: 14, color: Ux4gColors.primary600),
              ],
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Ux4gButton(
              text: 'Close',
              onPressed: () {},
              height: 44,
              size: Ux4gButtonSize.large,
              width: double.infinity,
              variant: Ux4gButtonVariant.primary,
            ),
            const SizedBox(height: 10),
            Ux4gButton(
              text: 'Revoke consent',
              onPressed: () {},
              height: 44,
              size: Ux4gButtonSize.large,
              width: double.infinity,
              variant: Ux4gButtonVariant.outline,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    ),
    // Footer
    Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Powered by -', style: TextStyle(fontSize: 11, color: Ux4gColors.neutral400, fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22),
        ],
      ),
    ),
  ],
)''';

const _consentManagementCardCode = r'''// Consent Management – Card Style Layout
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
        Container(width: 1, height: 28, color: Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union, height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.menu, color: Ux4gColors.primary600, size: 20),
          ),
        ),
      ],
      horizontalPadding: 16,
      verticalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, thickness: 1, color: Ux4gColors.neutral200),
    Expanded(
      child: Container(
        color: const Color(0xFFE5DEFF), // Soft purple background
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Headline
                      Text(
                        'You gave consent to share the following information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Ux4gColors.gray900,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Items Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Ux4gColors.neutral200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1. Documents (collapsible)
                            Row(
                              children: [
                                Icon(Icons.keyboard_arrow_down, color: Ux4gColors.neutral800, size: 22),
                                const SizedBox(width: 8),
                                Text('Documents', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(color: Color(0xFFFFE8C6), borderRadius: BorderRadius.circular(6)),
                                  child: Text('Partly shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF975A16))),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Aadhaar Card', style: TextStyle(fontSize: 13, color: Ux4gColors.gray900, fontWeight: FontWeight.w500)),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(color: Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(6)),
                                        child: Text('Shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF166534))),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Text('PAN', style: TextStyle(fontSize: 13, color: Ux4gColors.gray900, fontWeight: FontWeight.w500)),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                                        child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Text('Driving License', style: TextStyle(fontSize: 13, color: Ux4gColors.gray900, fontWeight: FontWeight.w500)),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                                        child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text('View all', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Ux4gColors.primary600)),
                                ],
                              ),
                            ),
                            Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                            // 2. Profile Information
                            Row(
                              children: [
                                Icon(Icons.account_circle_outlined, size: 22, color: Ux4gColors.neutral800),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Profile information', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                                      const SizedBox(height: 2),
                                      Text('Name, Date of Birth, Gender', style: TextStyle(fontSize: 12, color: Ux4gColors.neutral600)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(color: Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(6)),
                                  child: Text('Shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF166534))),
                                ),
                              ],
                            ),
                            Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                            // 3. Get your email
                            Row(
                              children: [
                                Icon(Icons.mail_outline, size: 22, color: Ux4gColors.neutral800),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text('Get your email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(color: Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(6)),
                                  child: Text('Shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF166534))),
                                ),
                              ],
                            ),
                            Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                            // 4. Get your profile picture
                            Row(
                              children: [
                                Icon(Icons.account_circle, size: 22, color: Ux4gColors.neutral800),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text('Get your profile picture', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                                  child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                                ),
                              ],
                            ),
                            Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                            // 5. Location
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 22, color: Ux4gColors.neutral800),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text('Location', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(color: Color(0xFFE9ECEF), borderRadius: BorderRadius.circular(6)),
                                  child: Text('Not shared', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF495057))),
                                ),
                              ],
                            ),
                            Divider(height: 24, thickness: 1, color: Ux4gColors.neutral200),

                            // 6. Consent validity date
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 20, color: Ux4gColors.neutral800),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Consent validity date', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Ux4gColors.gray900)),
                                      const SizedBox(height: 2),
                                      Text('(Today + 30 days)\n08-Oct-2026', style: TextStyle(fontSize: 12, color: Ux4gColors.neutral600, height: 1.3)),
                                    ],
                                  ),
                                ),
                                Text('Edit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Ux4gColors.primary600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Legal notice
                      Text(
                        'Consent validity is subject to applicable laws.\nBy selecting Allow, you are giving consent to share the items above.',
                        style: TextStyle(fontSize: 12, color: Ux4gColors.neutral600, height: 1.35),
                      ),
                      const SizedBox(height: 16),

                      // History link
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('View full consent history', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Ux4gColors.primary600)),
                          const SizedBox(width: 4),
                          Icon(Icons.open_in_new, size: 14, color: Ux4gColors.primary600),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Action Buttons
                      Ux4gButton(
                        text: 'Close',
                        onPressed: () {},
                        height: 44,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        variant: Ux4gButtonVariant.primary,
                      ),
                      const SizedBox(height: 10),
                      Ux4gButton(
                        text: 'Revoke consent',
                        onPressed: () {},
                        height: 44,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: (_isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral400),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22),
                ],
              ),
            ),
          ],
        ),
      ),
  ],
)''';
// ───────────────────────────────────────────────────────────────────────
// Data Sharing Consent pattern
// ───────────────────────────────────────────────────────────────────────
final dataSharingConsentComponent = WidgetbookComponent(
  name: 'Data Sharing Consent',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout for data sharing consent.',
        );
        final code = variant == 'Card style'
            ? _dataSharingConsentCardCode
            : _dataSharingConsentCode;
        final child = variant == 'Card style'
            ? const _DataSharingConsentCardMockup()
            : const _DataSharingConsentMobileMockup();
        return ComponentDocs(
          name: 'Data Sharing Consent',
          description:
              'Pattern for displaying data sharing consent details under the DPDP Act 2023, listing third-party sharing details, warning banners, and Manage/Cancel actions.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Mockups for Data Sharing Consent
// ───────────────────────────────────────────────────────────────────────
class _DataSharingConsentMobileMockup extends StatelessWidget {
  const _DataSharingConsentMobileMockup();
  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shield icon indicator
                  Center(
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: _isDark(context)
                            ? Ux4gColors.gray800
                            : const Color(0xFFEEF2F6),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shield_outlined,
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Headline
                  Center(
                    child: Text(
                      'Your Data, Your Control',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .extension<Ux4gTypography>()!
                          .hM_default
                          .copyWith(
                            color: _isDark(context)
                                ? Ux4gColors.neutral50
                                : Ux4gColors.gray900,
                          ),
                    ),
                  ),
                  SizedBox(height: 12),
                  // Title & Badge Row
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Data Sharing Consent',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: (_isDark(context)
                              ? Ux4gColors.neutral50
                              : Ux4gColors.gray900),
                        ),
                      ),
                      SizedBox(height: 8),
                      Ux4gTag(
                        text: 'DPDP Act 2023',
                        customBackgroundColor: _isDark(context)
                            ? Ux4gColors.primary900
                            : (_isDark(context)
                                  ? Ux4gColors.primary900
                                  : Ux4gColors.primary100),
                        customContentColor: (_isDark(context)
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600),
                        shape: Ux4gTagShape.circular,
                        size: Ux4gTagSize.m,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // Scheme Info
                  Text(
                    'Scheme: PM Kisan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: (_isDark(context)
                          ? Ux4gColors.primary300
                          : Ux4gColors.primary600),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Description
                  Text(
                    'To enable Direct Benefit Transfer for PM Kisan, the Agriculture Department will share your details with the following third parties.',
                    style: TextStyle(
                      fontSize: 14,
                      color: (_isDark(context)
                          ? Ux4gColors.neutral400
                          : Ux4gColors.neutral500),
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Sharing cards
                  _buildSharingCard(
                    context: context,
                    title: 'Bank of India',
                    shared: 'Aadhaar, Name',
                    purpose: 'Account matching',
                    duration: '1 year',
                    isRequired: true,
                  ),
                  SizedBox(height: 12),
                  _buildSharingCard(
                    context: context,
                    title: 'Payment Corp',
                    shared: 'Transaction ID',
                    purpose: 'Payment processing',
                    duration: '90 days',
                    isRequired: true,
                  ),
                  SizedBox(height: 12),
                  _buildSharingCard(
                    context: context,
                    title: 'SMS Gateway',
                    shared: 'Mobile Number',
                    purpose: 'Status alerts',
                    duration: 'Scheme duration',
                    isRequired: false,
                  ),
                  SizedBox(height: 20),
                  // Warning banner
                  Ux4gStatusBanner(
                    variant: Ux4gBannerVariant.warningLight,
                    title:
                        'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
                    leadingIcon: Icon(
                      Icons.error,
                      color: _isDark(context)
                          ? Ux4gColors.orange300
                          : const Color(0xFFD97706),
                      size: 22,
                    ),
                    titleStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _isDark(context)
                          ? Ux4gColors.orange300
                          : const Color(0xFFB45309),
                    ),
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  SizedBox(height: 24),
                  Divider(
                    height: 1,
                    color: (_isDark(context)
                        ? Ux4gColors.neutral800
                        : Ux4gColors.neutral200),
                  ),
                  SizedBox(height: 20),
                  // Actions
                  Ux4gButton(
                    text: 'Manage',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    leadingIcon: Icons.edit_outlined,
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 4),
                  Ux4gButton(
                    text: 'Cancel',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    contentColor: _isDark(context)
                        ? Ux4gColors.neutral400
                        : (_isDark(context)
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral700),
                    borderColor: _isDark(context)
                        ? Ux4gColors.neutral600
                        : (_isDark(context)
                              ? Ux4gColors.neutral600
                              : Ux4gColors.neutral300),
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const _ConsentFooter(),
        ],
      ),
    );
  }
}

class _DataSharingConsentCardMockup extends StatelessWidget {
  const _DataSharingConsentCardMockup();
  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: Container(
              color: _isDark(context)
                  ? Ux4gColors.primary900
                  : (_isDark(context)
                        ? Ux4gColors.primary900
                        : Ux4gColors.primary100),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: _isDark(context)
                              ? Ux4gColors.gray900
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Shield icon indicator
                            Center(
                              child: Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: _isDark(context)
                                      ? Ux4gColors.gray800
                                      : const Color(0xFFEEF2F6),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.shield_outlined,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            // Headline
                            Center(
                              child: Text(
                                'Your Data, Your Control',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .extension<Ux4gTypography>()!
                                    .hM_default
                                    .copyWith(
                                      color: _isDark(context)
                                          ? Ux4gColors.neutral50
                                          : Ux4gColors.gray900,
                                    ),
                              ),
                            ),
                            SizedBox(height: 12),
                            // Title & Badge Row
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Data Sharing Consent',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: (_isDark(context)
                                        ? Ux4gColors.neutral50
                                        : Ux4gColors.gray900),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Ux4gTag(
                                  text: 'DPDP Act 2023',
                                  customBackgroundColor: _isDark(context)
                                      ? Ux4gColors.primary900
                                      : (_isDark(context)
                                            ? Ux4gColors.primary900
                                            : Ux4gColors.primary100),
                                  customContentColor: (_isDark(context)
                                      ? Ux4gColors.primary300
                                      : Ux4gColors.primary600),
                                  shape: Ux4gTagShape.circular,
                                  size: Ux4gTagSize.m,
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            // Scheme Info
                            Text(
                              'Scheme: PM Kisan',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: (_isDark(context)
                                    ? Ux4gColors.primary300
                                    : Ux4gColors.primary600),
                              ),
                            ),
                            SizedBox(height: 8),
                            // Description
                            Text(
                              'To enable Direct Benefit Transfer for PM Kisan, the Agriculture Department will share your details with the following third parties.',
                              style: TextStyle(
                                fontSize: 13,
                                color: (_isDark(context)
                                    ? Ux4gColors.neutral400
                                    : Ux4gColors.neutral500),
                                height: 1.45,
                              ),
                            ),
                            SizedBox(height: 20),
                            // Sharing cards
                            _buildSharingCard(
                              context: context,
                              title: 'Bank of India',
                              shared: 'Aadhaar, Name',
                              purpose: 'Account matching',
                              duration: '1 year',
                              isRequired: true,
                            ),
                            SizedBox(height: 12),
                            _buildSharingCard(
                              context: context,
                              title: 'Payment Corp',
                              shared: 'Transaction ID',
                              purpose: 'Payment processing',
                              duration: '90 days',
                              isRequired: true,
                            ),
                            SizedBox(height: 12),
                            _buildSharingCard(
                              context: context,
                              title: 'SMS Gateway',
                              shared: 'Mobile Number',
                              purpose: 'Status alerts',
                              duration: 'Scheme duration',
                              isRequired: false,
                            ),
                            SizedBox(height: 20),
                            // Warning banner
                            Ux4gStatusBanner(
                              variant: Ux4gBannerVariant.warningLight,
                              title:
                                  'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
                              leadingIcon: Icon(
                                Icons.error,
                                color: _isDark(context)
                                    ? Ux4gColors.orange300
                                    : const Color(0xFFD97706),
                                size: 22,
                              ),
                              titleStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: _isDark(context)
                                    ? Ux4gColors.orange300
                                    : const Color(0xFFB45309),
                              ),
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(
                              height: 1,
                              color: (_isDark(context)
                                  ? Ux4gColors.neutral800
                                  : Ux4gColors.neutral200),
                            ),
                            SizedBox(height: 16),
                            // Actions
                            Ux4gButton(
                              text: 'Manage',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.outline,
                              leadingIcon: Icons.edit_outlined,
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                            ),
                            SizedBox(height: 4),
                            Ux4gButton(
                              text: 'Cancel',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.outline,
                              contentColor: _isDark(context)
                                  ? Ux4gColors.neutral400
                                  : (_isDark(context)
                                        ? Ux4gColors.neutral400
                                        : Ux4gColors.neutral700),
                              borderColor: _isDark(context)
                                  ? Ux4gColors.neutral600
                                  : (_isDark(context)
                                        ? Ux4gColors.neutral600
                                        : Ux4gColors.neutral300),
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const _ConsentFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Helper method used by mockups to build individual sharing cards.
Widget _buildSharingCard({
  required BuildContext context,
  required String title,
  required String shared,
  required String purpose,
  required String duration,
  required bool isRequired,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: (_isDark(context)
            ? Ux4gColors.neutral800
            : Ux4gColors.neutral200),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: (_isDark(context)
                    ? Ux4gColors.neutral50
                    : Ux4gColors.gray900),
              ),
            ),
            Ux4gTag(
              text: isRequired ? 'Required' : 'Optional',
              customBackgroundColor: isRequired
                  ? _isDark(context)
                        ? Ux4gColors.red900
                        : const Color(0xFFFFF0F0)
                  : _isDark(context)
                  ? Ux4gColors.gray800
                  : const Color(0xFFF3F4F6),
              customContentColor: isRequired
                  ? _isDark(context)
                        ? Ux4gColors.red300
                        : const Color(0xFF8A1A16)
                  : _isDark(context)
                  ? Ux4gColors.neutral400
                  : (_isDark(context)
                        ? Ux4gColors.neutral400
                        : Ux4gColors.neutral600),
              shape: Ux4gTagShape.circular,
              size: Ux4gTagSize.m,
            ),
          ],
        ),
        SizedBox(height: 6),
        Text(
          'Data shared · $shared',
          style: TextStyle(
            fontSize: 13,
            color: (_isDark(context)
                ? Ux4gColors.neutral400
                : Ux4gColors.neutral500),
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Purpose · $purpose',
          style: TextStyle(
            fontSize: 13,
            color: (_isDark(context)
                ? Ux4gColors.neutral400
                : Ux4gColors.neutral500),
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Duration · $duration',
          style: TextStyle(
            fontSize: 13,
            color: (_isDark(context)
                ? Ux4gColors.neutral400
                : Ux4gColors.neutral500),
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
      ],
    ),
  );
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets for Data Sharing Consent
// ───────────────────────────────────────────────────────────────────────
const _dataSharingConsentCode = r'''// Data Sharing Consent – Flat Layout
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32),
        Container(width: 1, height: 28, color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union,  height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.menu, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 20),
            ),
          ),
        ),
      ],
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, thickness: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
    Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shield icon indicator
            Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: _isDark(context) ? Ux4gColors.gray800 : Ux4gColors.gray100,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.shield_outlined, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 28),
              ),
            ),
            SizedBox(height: 16),
            // Headline
            Center(
              child: Text(
                'Your Data, Your Control',
                textAlign: TextAlign.center,
                style: Theme.of(context).extension<Ux4gTypography>()!.hM_default.copyWith(color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
              ),
            ),
            SizedBox(height: 12),
            // Title & Badge Row
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Data Sharing Consent',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                  ),
                ),
                SizedBox(height: 8),
                Ux4gTag(
                  text: 'DPDP Act 2023',
                  customBackgroundColor: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100,
                  customContentColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                  shape: Ux4gTagShape.circular,
                ),
              ],
            ),
            SizedBox(height: 12),
            // Scheme Info
            Text(
              'Scheme: PM Kisan',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
              ),
            ),
            SizedBox(height: 8),
            // Description
            Text(
              'To enable Direct Benefit Transfer for PM Kisan, the Agriculture Department will share your details with the following third parties.',
              style: TextStyle(fontSize: 14, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.4),
            ),
            SizedBox(height: 20),
            // 1. Bank of India Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bank of India',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      Ux4gTag(
                        text: 'Required',
                        customBackgroundColor: _isDark(context) ? Ux4gColors.red900 : Ux4gColors.red50,
                        customContentColor: _isDark(context) ? Ux4gColors.red300 : Ux4gColors.red800,
                        shape: Ux4gTagShape.circular,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text('Data shared · Aadhaar, Name', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Purpose · Account matching', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Duration · 1 year', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                ],
              ),
            ),
            SizedBox(height: 12),
            // 2. Payment Corp Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Corp',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      Ux4gTag(
                        text: 'Required',
                        customBackgroundColor: _isDark(context) ? Ux4gColors.red900 : Ux4gColors.red50,
                        customContentColor: _isDark(context) ? Ux4gColors.red300 : Ux4gColors.red800,
                        shape: Ux4gTagShape.circular,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text('Data shared · Transaction ID', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Purpose · Payment processing', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Duration · 90 days', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                ],
              ),
            ),
            SizedBox(height: 12),
            // 3. SMS Gateway Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SMS Gateway',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      Ux4gTag(
                        text: 'Optional',
                        customBackgroundColor: _isDark(context) ? Ux4gColors.gray800 : Ux4gColors.gray100,
                        customContentColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                        shape: Ux4gTagShape.circular,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text('Data shared · Mobile Number', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Purpose · Status alerts', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Duration · Scheme duration', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Warning banner
            Ux4gStatusBanner(
              variant: Ux4gBannerVariant.warningLight,
              title: 'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
              leadingIcon: Icon(
                Icons.error,
                color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange600,
                size: 22,
              ),
              titleStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange700,
              ),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            SizedBox(height: 24),
            Divider(height: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
            SizedBox(height: 20),
            // Actions
            Ux4gButton(
              text: 'Manage',
              onPressed: () {},
              variant: Ux4gButtonVariant.outline,
              leadingIcon: Icons.edit_outlined,
              height: 48,
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
            SizedBox(height: 4),
            Ux4gButton(
              text: 'Cancel',
              onPressed: () {},
              variant: Ux4gButtonVariant.outline,
              contentColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
              borderColor: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300,
              height: 48,
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    ),
    // Footer
    Padding(
      padding: EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Powered by -',
            style: TextStyle(
              fontSize: 11,
              color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22),
        ],
      ),
    ),
  ],
)''';
const _dataSharingConsentCardCode =
    r'''// Data Sharing Consent – Card Style Layout
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32),
        Container(width: 1, height: 28, color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union,  height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.menu, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 20),
            ),
          ),
        ),
      ],
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, thickness: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
    Expanded(
      child: Container(
        color: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100, // Soft purple/blue card style bg
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shield icon indicator
                      Center(
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: _isDark(context) ? Ux4gColors.gray800 : Ux4gColors.gray100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.shield_outlined, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 28),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Headline
                      Center(
                        child: Text(
                          'Your Data, Your Control',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).extension<Ux4gTypography>()!.hM_default.copyWith(color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                        ),
                      ),
                      SizedBox(height: 12),
                      // Title & Badge Row
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Data Sharing Consent',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                            ),
                          ),
                          SizedBox(height: 8),
                          Ux4gTag(
                            text: 'DPDP Act 2023',
                            customBackgroundColor: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100,
                            customContentColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            shape: Ux4gTagShape.circular,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // Scheme Info
                      Text(
                        'Scheme: PM Kisan',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Description
                      Text(
                        'To enable Direct Benefit Transfer for PM Kisan, the Agriculture Department will share your details with the following third parties.',
                        style: TextStyle(
                          fontSize: 13,
                          color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: 20),
                      // 1. Bank of India Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bank of India',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: 'Required',
                                  customBackgroundColor: _isDark(context) ? Ux4gColors.red900 : Ux4gColors.red50,
                                  customContentColor: _isDark(context) ? Ux4gColors.red300 : Ux4gColors.red800,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text('Data shared · Aadhaar, Name', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Purpose · Account matching', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Duration · 1 year', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      // 2. Payment Corp Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Payment Corp',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: 'Required',
                                  customBackgroundColor: _isDark(context) ? Ux4gColors.red900 : Ux4gColors.red50,
                                  customContentColor: _isDark(context) ? Ux4gColors.red300 : Ux4gColors.red800,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text('Data shared · Transaction ID', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Purpose · Payment processing', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Duration · 90 days', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      // 3. SMS Gateway Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SMS Gateway',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: 'Optional',
                                  customBackgroundColor: _isDark(context) ? Ux4gColors.gray800 : Ux4gColors.gray100,
                                  customContentColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text('Data shared · Mobile Number', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Purpose · Status alerts', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Duration · Scheme duration', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Warning banner
                      Ux4gStatusBanner(
                        variant: Ux4gBannerVariant.warningLight,
                        title: 'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
                        leadingIcon: Icon(
                          Icons.error,
                          color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange600,
                          size: 22,
                        ),
                        titleStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange700,
                        ),
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      SizedBox(height: 20),
                      Divider(height: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                      SizedBox(height: 16),
                      // Actions
                      Ux4gButton(
                        text: 'Manage',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        leadingIcon: Icons.edit_outlined,
                        height: 48,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      SizedBox(height: 4),
                      Ux4gButton(
                        text: 'Cancel',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        contentColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                        borderColor: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300,
                        height: 48,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
)''';
// ───────────────────────────────────────────────────────────────────────
// Manage Data Sharing Consents pattern
// ───────────────────────────────────────────────────────────────────────
final dataSharingConsentManagementComponent = WidgetbookComponent(
  name: 'Manage Data Sharing Consents',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout for managing consents.',
        );
        final code = variant == 'Card style'
            ? _manageDataSharingConsentsCardCode
            : _manageDataSharingConsentsCode;
        final child = variant == 'Card style'
            ? const _ManageDataSharingConsentsCardMockup()
            : const _ManageDataSharingConsentsMobileMockup();
        return ComponentDocs(
          name: 'Manage Data Sharing Consents',
          description:
              'Pattern for managing and withdrawing data sharing consents under the DPDP Act 2023.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Mockups for Manage Data Sharing Consents
// ───────────────────────────────────────────────────────────────────────
class _ManageDataSharingConsentsMobileMockup extends StatefulWidget {
  const _ManageDataSharingConsentsMobileMockup();
  @override
  State<_ManageDataSharingConsentsMobileMockup> createState() =>
      _ManageDataSharingConsentsMobileMockupState();
}

class _ManageDataSharingConsentsMobileMockupState
    extends State<_ManageDataSharingConsentsMobileMockup> {
  bool _isSmsGatewayWithdrawn = false;
  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Headline
                  Text(
                    'Manage Your Data Sharing Consents',
                    style: Theme.of(context)
                        .extension<Ux4gTypography>()!
                        .hM_default
                        .copyWith(
                          color: _isDark(context)
                              ? Ux4gColors.neutral50
                              : Ux4gColors.gray900,
                        ),
                  ),
                  SizedBox(height: 8),
                  // Scheme Info
                  Text(
                    'Scheme: PM Kisan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: (_isDark(context)
                          ? Ux4gColors.primary300
                          : Ux4gColors.primary600),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Description
                  Text(
                    'You can review and withdraw optional consents below.',
                    style: TextStyle(
                      fontSize: 14,
                      color: (_isDark(context)
                          ? Ux4gColors.neutral400
                          : Ux4gColors.neutral500),
                      height: 1.45,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Sharing cards
                  _buildDataSharingManagementCard(
                    context: context,
                    title: 'Bank of India',
                    shared: 'Aadhaar, Name',
                    status: 'Required',
                  ),
                  SizedBox(height: 12),
                  _buildDataSharingManagementCard(
                    context: context,
                    title: 'Payment Corp',
                    shared: 'Transaction ID',
                    status: 'Required',
                  ),
                  SizedBox(height: 12),
                  _buildDataSharingManagementCard(
                    context: context,
                    title: 'SMS Gateway',
                    shared: 'Mobile Number',
                    isOptional: true,
                    isWithdrawn: _isSmsGatewayWithdrawn,
                    onWithdrawToggle: () {
                      setState(() {
                        _isSmsGatewayWithdrawn = !_isSmsGatewayWithdrawn;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Warning banner
                  Ux4gStatusBanner(
                    variant: Ux4gBannerVariant.warningLight,
                    title:
                        'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
                    leadingIcon: Icon(
                      Icons.error,
                      color: _isDark(context)
                          ? Ux4gColors.orange300
                          : const Color(0xFFD97706),
                      size: 22,
                    ),
                    titleStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _isDark(context)
                          ? Ux4gColors.orange300
                          : const Color(0xFFB45309),
                    ),
                    margin: EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    height: 1,
                    color: (_isDark(context)
                        ? Ux4gColors.neutral800
                        : Ux4gColors.neutral200),
                  ),
                  SizedBox(height: 16),
                  // Actions
                  Ux4gButton(
                    text: 'Confirm changes',
                    onPressed: _isSmsGatewayWithdrawn ? () {} : null,
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 4),
                  Ux4gButton(
                    text: 'Cancel',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.ghost,
                    contentColor: _isDark(context)
                        ? Ux4gColors.neutral50
                        : Ux4gColors.neutral900,
                    height: 48,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          const _ConsentFooter(),
        ],
      ),
    );
  }
}

class _ManageDataSharingConsentsCardMockup extends StatefulWidget {
  const _ManageDataSharingConsentsCardMockup();
  @override
  State<_ManageDataSharingConsentsCardMockup> createState() =>
      _ManageDataSharingConsentsCardMockupState();
}

class _ManageDataSharingConsentsCardMockupState
    extends State<_ManageDataSharingConsentsCardMockup> {
  bool _isSmsGatewayWithdrawn = false;
  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: Container(
              color: _isDark(context)
                  ? Ux4gColors.primary900
                  : (_isDark(context)
                        ? Ux4gColors.primary900
                        : Ux4gColors.primary100),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: _isDark(context)
                              ? Ux4gColors.gray900
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Headline
                            Text(
                              'Manage Your Data Sharing Consents',
                              style: Theme.of(context)
                                  .extension<Ux4gTypography>()!
                                  .hM_default
                                  .copyWith(
                                    color: _isDark(context)
                                        ? Ux4gColors.neutral50
                                        : Ux4gColors.gray900,
                                  ),
                            ),
                            SizedBox(height: 8),
                            // Scheme Info
                            Text(
                              'Scheme: PM Kisan',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: (_isDark(context)
                                    ? Ux4gColors.primary300
                                    : Ux4gColors.primary600),
                              ),
                            ),
                            SizedBox(height: 8),
                            // Description
                            Text(
                              'You can review and withdraw optional consents below.',
                              style: TextStyle(
                                fontSize: 13,
                                color: (_isDark(context)
                                    ? Ux4gColors.neutral400
                                    : Ux4gColors.neutral500),
                                height: 1.45,
                              ),
                            ),
                            SizedBox(height: 20),
                            // Sharing cards
                            _buildDataSharingManagementCard(
                              context: context,
                              title: 'Bank of India',
                              shared: 'Aadhaar, Name',
                              status: 'Required',
                            ),
                            SizedBox(height: 12),
                            _buildDataSharingManagementCard(
                              context: context,
                              title: 'Payment Corp',
                              shared: 'Transaction ID',
                              status: 'Required',
                            ),
                            SizedBox(height: 12),
                            _buildDataSharingManagementCard(
                              context: context,
                              title: 'SMS Gateway',
                              shared: 'Mobile Number',
                              isOptional: true,
                              isWithdrawn: _isSmsGatewayWithdrawn,
                              onWithdrawToggle: () {
                                setState(() {
                                  _isSmsGatewayWithdrawn =
                                      !_isSmsGatewayWithdrawn;
                                });
                              },
                            ),
                            SizedBox(height: 20),
                            // Warning banner
                            Ux4gStatusBanner(
                              variant: Ux4gBannerVariant.warningLight,
                              title:
                                  'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
                              leadingIcon: Icon(
                                Icons.error,
                                color: _isDark(context)
                                    ? Ux4gColors.orange300
                                    : const Color(0xFFD97706),
                                size: 22,
                              ),
                              titleStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: _isDark(context)
                                    ? Ux4gColors.orange300
                                    : const Color(0xFFB45309),
                              ),
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(
                              height: 1,
                              color: (_isDark(context)
                                  ? Ux4gColors.neutral800
                                  : Ux4gColors.neutral200),
                            ),
                            SizedBox(height: 16),
                            // Actions
                            Ux4gButton(
                              text: 'Confirm changes',
                              onPressed: _isSmsGatewayWithdrawn ? () {} : null,
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                            ),
                            SizedBox(height: 4),
                            Ux4gButton(
                              text: 'Cancel',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.ghost,
                              contentColor: _isDark(context)
                                  ? Ux4gColors.neutral50
                                  : Ux4gColors.neutral900,
                              height: 48,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const _ConsentFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Helper method used by mockups to build individual management cards.
Widget _buildDataSharingManagementCard({
  required BuildContext context,
  required String title,
  required String shared,
  String? status,
  bool isOptional = false,
  bool isWithdrawn = false,
  VoidCallback? onWithdrawToggle,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: (_isDark(context)
            ? Ux4gColors.neutral800
            : Ux4gColors.neutral200),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: (_isDark(context)
                    ? Ux4gColors.neutral50
                    : Ux4gColors.gray900),
              ),
            ),
            Ux4gTag(
              text: isWithdrawn ? 'Withdrawn' : 'Active',
              customBackgroundColor: isWithdrawn
                  ? _isDark(context)
                        ? Ux4gColors.gray800
                        : const Color(0xFFF3F4F6)
                  : _isDark(context)
                  ? Ux4gColors.green900
                  : (_isDark(context)
                        ? Ux4gColors.green900
                        : Ux4gColors.green50),
              customContentColor: isWithdrawn
                  ? _isDark(context)
                        ? Ux4gColors.neutral400
                        : (_isDark(context)
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral600)
                  : _isDark(context)
                  ? Ux4gColors.green300
                  : (_isDark(context)
                        ? Ux4gColors.green300
                        : Ux4gColors.green700),
              shape: Ux4gTagShape.circular,
              size: Ux4gTagSize.m,
            ),
          ],
        ),
        SizedBox(height: 6),
        Text(
          'Data shared · $shared',
          style: TextStyle(
            fontSize: 13,
            color: (_isDark(context)
                ? Ux4gColors.neutral400
                : Ux4gColors.neutral500),
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
        if (status != null) ...[
          SizedBox(height: 2),
          Text(
            'Status · $status',
            style: TextStyle(
              fontSize: 13,
              color: (_isDark(context)
                  ? Ux4gColors.neutral400
                  : Ux4gColors.neutral500),
              fontWeight: FontWeight.w400,
              height: 1.25,
            ),
          ),
        ],
        if (isOptional) ...[
          SizedBox(height: 8),
          GestureDetector(
            onTap: onWithdrawToggle,
            child: Text(
              isWithdrawn ? 'Undo' : 'Withdraw',
              style: TextStyle(
                fontSize: 14,
                color: (_isDark(context)
                    ? Ux4gColors.primary300
                    : Ux4gColors.primary600),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    ),
  );
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets for Manage Data Sharing Consents
// ───────────────────────────────────────────────────────────────────────
const _manageDataSharingConsentsCode =
    r'''// Manage Data Sharing Consents – Flat Layout
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32),
        Container(width: 1, height: 28, color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union,  height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.menu, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 20),
            ),
          ),
        ),
      ],
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, thickness: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
    Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline
            Text(
              'Manage Your Data Sharing Consents',
              style: Theme.of(context).extension<Ux4gTypography>()!.hM_default.copyWith(color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
            ),
            SizedBox(height: 8),
            // Scheme Info
            Text(
              'Scheme: PM Kisan',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
              ),
            ),
            SizedBox(height: 8),
            // Description
            Text(
              'You can review and withdraw optional consents below.',
              style: TextStyle(
                fontSize: 14,
                color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                height: 1.45,
              ),
            ),
            SizedBox(height: 20),
            // 1. Bank of India Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bank of India',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      Ux4gTag(
                        text: 'Active',
                        customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                        customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                        shape: Ux4gTagShape.circular,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text('Data shared · Aadhaar, Name', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Status · Required', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                ],
              ),
            ),
            SizedBox(height: 12),
            // 2. Payment Corp Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Corp',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      Ux4gTag(
                        text: 'Active',
                        customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                        customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                        shape: Ux4gTagShape.circular,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text('Data shared · Transaction ID', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 2),
                  Text('Status · Required', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                ],
              ),
            ),
            SizedBox(height: 12),
            // 3. SMS Gateway Card (Optional)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SMS Gateway',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      Ux4gTag(
                        text: _isSmsGatewayWithdrawn ? 'Withdrawn' : 'Active',
                        customBackgroundColor: _isSmsGatewayWithdrawn ? _isDark(context) ? Ux4gColors.gray800 : Ux4gColors.gray100 : _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                        customContentColor: _isSmsGatewayWithdrawn ? _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600 : _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                        shape: Ux4gTagShape.circular,
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text('Data shared · Mobile Number', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSmsGatewayWithdrawn = !_isSmsGatewayWithdrawn;
                      });
                    },
                    child: Text(
                      _isSmsGatewayWithdrawn ? 'Undo' : 'Withdraw',
                      style: TextStyle(fontSize: 14, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Warning banner
            Ux4gStatusBanner(
              variant: Ux4gBannerVariant.warningLight,
              title: 'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
              leadingIcon: Icon(
                Icons.error,
                color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange600,
                size: 22,
              ),
              titleStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange700,
              ),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            SizedBox(height: 20),
            Divider(height: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
            SizedBox(height: 16),
            // Actions
            Ux4gButton(
              text: 'Confirm changes',
              onPressed: _isSmsGatewayWithdrawn ? () {} : null,
              height: 48,
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
            SizedBox(height: 4),
            Ux4gButton(
              text: 'Cancel',
              onPressed: () {},
              variant: Ux4gButtonVariant.ghost,
                    contentColor: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                    height: 48,
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    ),
    // Footer
    Padding(
      padding: EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Powered by -',
            style: TextStyle(
              fontSize: 11,
              color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22),
        ],
      ),
    ),
  ],
)''';
const _manageDataSharingConsentsCardCode =
    r'''// Manage Data Sharing Consents – Card Style Layout
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32),
        Container(width: 1, height: 28, color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union,  height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.menu, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 20),
            ),
          ),
        ),
      ],
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, thickness: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
    Expanded(
      child: Container(
        color: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100, // Soft purple/blue bg
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Headline
                      Text(
                        'Manage Your Data Sharing Consents',
                        style: Theme.of(context).extension<Ux4gTypography>()!.hM_default.copyWith(color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      SizedBox(height: 8),
                      // Scheme Info
                      Text(
                        'Scheme: PM Kisan',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Description
                      Text(
                        'You can review and withdraw optional consents below.',
                        style: TextStyle(
                          fontSize: 13,
                          color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: 20),
                      // 1. Bank of India Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bank of India',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: 'Active',
                                  customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                                  customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text('Data shared · Aadhaar, Name', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Status · Required', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      // 2. Payment Corp Card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Payment Corp',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: 'Active',
                                  customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                                  customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text('Data shared · Transaction ID', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 2),
                            Text('Status · Required', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      // 3. SMS Gateway Card (Optional)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SMS Gateway',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: _isSmsGatewayWithdrawn ? 'Withdrawn' : 'Active',
                                  customBackgroundColor: _isSmsGatewayWithdrawn ? _isDark(context) ? Ux4gColors.gray800 : Ux4gColors.gray100 : _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                                  customContentColor: _isSmsGatewayWithdrawn ? _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600 : _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Text('Data shared · Mobile Number', style: TextStyle(color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.25)),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isSmsGatewayWithdrawn = !_isSmsGatewayWithdrawn;
                                });
                              },
                              child: Text(
                                _isSmsGatewayWithdrawn ? 'Undo' : 'Withdraw',
                                style: TextStyle(fontSize: 14, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Warning banner
                      Ux4gStatusBanner(
                        variant: Ux4gBannerVariant.warningLight,
                        title: 'Required consents cannot be withdrawn as they are necessary for the scheme to function.',
                        leadingIcon: Icon(
                          Icons.error,
                          color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange600,
                          size: 22,
                        ),
                        titleStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: _isDark(context) ? Ux4gColors.orange300 : Ux4gColors.orange700,
                        ),
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      SizedBox(height: 20),
                      Divider(height: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                      SizedBox(height: 16),
                      // Actions
                      Ux4gButton(
                        text: 'Confirm changes',
                        onPressed: _isSmsGatewayWithdrawn ? () {} : null,
                        height: 48,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      SizedBox(height: 4),
                      Ux4gButton(
                        text: 'Cancel',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.ghost,
                    contentColor: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                    height: 48,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ],
)''';
// ───────────────────────────────────────────────────────────────────────
// Withdraw Consent Dialog pattern
// ───────────────────────────────────────────────────────────────────────
final withdrawConsentDialogComponent = WidgetbookComponent(
  name: 'Withdraw Consent Dialog',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          name: 'Withdraw Consent Dialog',
          description:
              'A modal dialog pattern used to confirm the withdrawal of data sharing consents.',
          code: _withdrawConsentDialogCode,
          center: true,
          child: const _WithdrawConsentDialogMockup(),
        );
      },
    ),
  ],
);

class _WithdrawConsentDialogMockup extends StatelessWidget {
  const _WithdrawConsentDialogMockup();
  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Stack(
        children: [
          // Simulated background content (the Manage Consents screen blurred or dimmed)
          Positioned.fill(
            child: Container(
              color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manage Your Data Sharing Consents',
                    style: Theme.of(context)
                        .extension<Ux4gTypography>()!
                        .hM_default
                        .copyWith(
                          color: _isDark(context)
                              ? Ux4gColors.neutral50
                              : Ux4gColors.gray900,
                        ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Scheme: PM Kisan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: (_isDark(context)
                          ? Ux4gColors.primary300
                          : Ux4gColors.primary600),
                    ),
                  ),
                  SizedBox(height: 12),
                  // Mock cards representing background items
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _isDark(context)
                          ? Ux4gColors.gray900
                          : (_isDark(context)
                                ? Ux4gColors.gray900
                                : Ux4gColors.gray100),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _isDark(context)
                            ? Ux4gColors.neutral700
                            : (_isDark(context)
                                  ? Ux4gColors.neutral800
                                  : Ux4gColors.neutral200),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _isDark(context)
                          ? Ux4gColors.gray900
                          : (_isDark(context)
                                ? Ux4gColors.gray900
                                : Ux4gColors.gray100),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _isDark(context)
                            ? Ux4gColors.neutral700
                            : (_isDark(context)
                                  ? Ux4gColors.neutral800
                                  : Ux4gColors.neutral200),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Dimmed dialog backdrop using the design system's modal component
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Ux4gModalContent(
                onDismiss: () {},
                backgroundColor: _isDark(context)
                    ? Ux4gColors.gray900
                    : Colors.white,
                cornerRadius: 16,
                alignment: Ux4gModalAlignment.centered,
                showHeader:
                    false, // Custom header inside bodyContent to achieve exact spacing/size
                showCloseButton: false,
                showDividers: false,
                showSubtitle: false,
                showFooter: false,
                showBody: true,
                bodyContent: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 8),
                      // Centered warning icon in a soft peach/amber circle
                      Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          color: _isDark(context)
                              ? Ux4gColors.orange800
                              : Ux4gColors
                                    .orange100, // Soft peach/amber matching mockup
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.warning_rounded, // Solid warning triangle
                            color: _isDark(context)
                                ? Ux4gColors.orange500
                                : Ux4gColors
                                      .orange600, // Vivid warning orange/amber
                            size: 38,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Centered title
                      Text(
                        'Withdraw Consent?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .extension<Ux4gTypography>()!
                            .hM_default
                            .copyWith(
                              color: _isDark(context)
                                  ? Ux4gColors.neutral50
                                  : Ux4gColors.gray900,
                            ),
                      ),
                      SizedBox(height: 12),
                      // Centered description
                      Text(
                        'Withdrawing consent for SMS Gateway will stop sending status alerts to your mobile number. This will not affect your PM Kisan bank transfers.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5,
                          color: _isDark(context)
                              ? Ux4gColors.neutral400
                              : (_isDark(context)
                                    ? Ux4gColors.neutral400
                                    : Ux4gColors.neutral600),
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: 28),
                      // Primary action button: Withdraw Consent
                      Ux4gButton(
                        text: 'Withdraw Consent',
                        onPressed: () {},
                        backgroundColor: const Color(
                          0xFF4B2BD9,
                        ), // Deep violet/indigo purple from mockup
                        contentColor: Colors.white,
                        height: 48,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      SizedBox(height: 8),
                      // Cancel button
                      Ux4gButton(
                        text: 'Cancel',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.ghost,
                        contentColor: _isDark(context)
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                        height: 48,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      SizedBox(height: 16),
                      // Footer disclaimer
                      Text(
                        'You can re-enable this consent at any time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: _isDark(context)
                              ? Ux4gColors.neutral400
                              : (_isDark(context)
                                    ? Ux4gColors.neutral400
                                    : Ux4gColors.neutral600),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _withdrawConsentDialogCode = r'''// Withdraw Consent Dialog Pattern
// Show custom design-system dialog using Ux4gModal
Ux4gModal.show(
  context,
  modal: Ux4gModal(
    onDismiss: () => Navigator.of(context).pop(),
    backgroundColor: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
    cornerRadius: 16,
    alignment: Ux4gModalAlignment.centered,
    showHeader: false,
    showCloseButton: false,
    showDividers: false,
    showSubtitle: false,
    showFooter: false,
    bodyContent: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          // Centered warning icon in a soft peach/amber circle
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: _isDark(context) ? Ux4gColors.orange800 : Ux4gColors.orange100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.warning_rounded,
                color: _isDark(context) ? Ux4gColors.orange500 : Ux4gColors.orange600,
                size: 38,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Centered title
          Text(
            'Withdraw Consent?',
            textAlign: TextAlign.center,
            style: Theme.of(context).extension<Ux4gTypography>()!.hM_default.copyWith(color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
          ),
          SizedBox(height: 12),
          // Centered description
          Text(
            'Withdrawing consent for SMS Gateway will stop sending status alerts to your mobile number. This will not affect your PM Kisan bank transfers.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.5,
              color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
              height: 1.45,
            ),
          ),
          SizedBox(height: 28),
          // Primary action button: Withdraw Consent
          Ux4gButton(
            text: 'Withdraw Consent',
            onPressed: () {
              Navigator.of(context).pop();
            },
            backgroundColor: const Color(0xFF4B2BD9),
            contentColor: Colors.white,
            height: 48,
            size: Ux4gButtonSize.large,
            width: double.infinity,
          ),
          SizedBox(height: 8),
          // Cancel button
          Ux4gButton(
            text: 'Cancel',
            onPressed: () {
              Navigator.of(context).pop();
            },
            variant: Ux4gButtonVariant.ghost,
                    contentColor: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                    height: 48,
            size: Ux4gButtonSize.large,
            width: double.infinity,
          ),
          SizedBox(height: 16),
          // Footer disclaimer
          Text(
            'You can re-enable this consent at any time.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    ),
  ),
);''';
// ───────────────────────────────────────────────────────────────────────
// Consent History pattern
// ───────────────────────────────────────────────────────────────────────
final consentHistoryComponent = WidgetbookComponent(
  name: 'Consent History',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout on a soft-purple background.',
        );
        final code = variant == 'Card style'
            ? _consentHistoryCardCode
            : _consentHistoryCode;
        final child = variant == 'Card style'
            ? const _ConsentHistoryCardMockup()
            : const _ConsentHistoryMockup();
        return ComponentDocs(
          name: 'Consent History',
          description:
              'A screen pattern displaying all data sharing consents history with scheme filter chips. '
              'Use the [Variant] knob on the right to toggle layouts.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);
const _consentHistoryCode = r'''// Consent History Screen Pattern
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32),
        Container(width: 1, height: 28, color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union,  height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.menu, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 20),
            ),
          ),
        ),
      ],
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
    // Scrollable Content
    Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Consent History',
                    style: Theme.of(context).extension<Ux4gTypography>()!.hM_default.copyWith(color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A complete audit trail of all your data sharing consents for government schemes.',
                    style: TextStyle(
                      fontSize: 14,
                      color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Horizontal Scrollable Choice Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Ux4gChoiceChip(
                    text: 'All',
                    selected: false,
                    borderRadius: 8.0,
                    onClick: () {},
                    unselectedBackgroundColor: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                    unselectedBorderColor: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                    unselectedTextColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                  ),
                  SizedBox(width: 8),
                  Ux4gChoiceChip(
                    text: 'PM-Kisan',
                    selected: true,
                    borderRadius: 8.0,
                    onClick: () {},
                    selectedBackgroundColor: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100,
                    selectedBorderColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                    selectedTextColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                  ),
                  SizedBox(width: 8),
                  Ux4gChoiceChip(
                    text: 'PM-MKSSY',
                    selected: false,
                    borderRadius: 8.0,
                    onClick: () {},
                    unselectedBackgroundColor: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                    unselectedBorderColor: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                    unselectedTextColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                  ),
                  SizedBox(width: 8),
                  Ux4gChoiceChip(
                    text: 'PMAY',
                    selected: true,
                    borderRadius: 8.0,
                    onClick: () {},
                    selectedBackgroundColor: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100,
                    selectedBorderColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                    selectedTextColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                  ),
                  SizedBox(width: 8),
                  Ux4gChoiceChip(
                    text: 'PM-Ajay',
                    selected: false,
                    borderRadius: 8.0,
                    onClick: () {},
                    unselectedBackgroundColor: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                    unselectedBorderColor: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                    unselectedTextColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Cards List (All inlined for copy-paste)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Card 1: Bank of India
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bank of India',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                              ),
                            ),
                            Ux4gTag(
                              text: 'Active',
                              customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                              customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                              shape: Ux4gTagShape.circular,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Scheme',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'PM Kisan',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Data',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'Aadhaar, Name',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Given',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                '12 Jan 2024',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontSize: 14,
                              color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Card 2: Payment Corp
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Corp',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                              ),
                            ),
                            Ux4gTag(
                              text: 'Active',
                              customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                              customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                              shape: Ux4gTagShape.circular,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Scheme',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'PM Kisan',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Data',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'Transaction ID',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Given',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                '12 Jan 2024',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontSize: 14,
                              color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Card 3: SMS Gateway
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SMS Gateway',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                              ),
                            ),
                            Ux4gTag(
                              text: 'Withdrawn',
                              customBackgroundColor: _isDark(context) ? Ux4gColors.red900 : Ux4gColors.red50,
                              customContentColor: _isDark(context) ? Ux4gColors.red300 : Ux4gColors.red800,
                              shape: Ux4gTagShape.circular,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Scheme',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'PM Kisan',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Data',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'Mobile Number',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Given',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                '15 Jan 2024',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontSize: 14,
                              color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // Card 4: Housing Board
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Housing Board',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                              ),
                            ),
                            Ux4gTag(
                              text: 'Expired',
                              customBackgroundColor: _isDark(context) ? Ux4gColors.gray800 : Ux4gColors.gray100,
                              customContentColor: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray800,
                              shape: Ux4gTagShape.circular,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Scheme',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'PMAY',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Data',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                'Address, Income',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Given',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text('· ', style: TextStyle(fontSize: 13.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(
                                '03 Mar 2023',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontSize: 14,
                              color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Footer / Navigation Actions
            Center(
              child: Column(
                children: [
                  Text(
                    'Showing 4 of 4 consents',
                    style: TextStyle(
                      fontSize: 13,
                      color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Download Consent History (PDF)',
                      style: Theme.of(context).extension<Ux4gTypography>()!.lL_default.copyWith(color: _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                    ),
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16,
                        color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    // Footer Logo
    Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Powered by -',
            style: TextStyle(
              fontSize: 11,
              color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22),
        ],
      ),
    ),
  ],
)''';

class _ConsentHistoryMockup extends StatefulWidget {
  const _ConsentHistoryMockup();
  @override
  State<_ConsentHistoryMockup> createState() => _ConsentHistoryMockupState();
}

class _ConsentHistoryMockupState extends State<_ConsentHistoryMockup> {
  final Set<String> _selectedFilters = {'PM-Kisan', 'PMAY'};
  void _toggleFilter(String filter) {
    setState(() {
      if (filter == 'All') {
        _selectedFilters.clear();
        _selectedFilters.add('All');
      } else {
        _selectedFilters.remove('All');
        if (_selectedFilters.contains(filter)) {
          _selectedFilters.remove(filter);
        } else {
          _selectedFilters.add(filter);
        }
        if (_selectedFilters.isEmpty) {
          _selectedFilters.add('All');
        }
      }
    });
  }

  bool _isChipSelected(String filter) {
    if (filter == 'All') {
      return _selectedFilters.contains('All') || _selectedFilters.isEmpty;
    }
    return _selectedFilters.contains(filter);
  }

  @override
  Widget build(BuildContext context) {
    final allConsents = [
      _ConsentHistoryItem(
        title: 'Bank of India',
        scheme: 'PM Kisan',
        filterKey: 'PM-Kisan',
        dataShared: 'Aadhaar, Name',
        givenDate: '12 Jan 2024',
        status: 'Active',
        statusColor: _isDark(context)
            ? Ux4gColors.green900
            : (_isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50),
        textColor: _isDark(context)
            ? Ux4gColors.green300
            : (_isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700),
      ),
      _ConsentHistoryItem(
        title: 'Payment Corp',
        scheme: 'PM Kisan',
        filterKey: 'PM-Kisan',
        dataShared: 'Transaction ID',
        givenDate: '12 Jan 2024',
        status: 'Active',
        statusColor: _isDark(context)
            ? Ux4gColors.green900
            : (_isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50),
        textColor: _isDark(context)
            ? Ux4gColors.green300
            : (_isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700),
      ),
      _ConsentHistoryItem(
        title: 'SMS Gateway',
        scheme: 'PM Kisan',
        filterKey: 'PM-Kisan',
        dataShared: 'Mobile Number',
        givenDate: '15 Jan 2024',
        status: 'Withdrawn',
        statusColor: _isDark(context)
            ? Ux4gColors.red900
            : const Color(0xFFFCE8E6),
        textColor: _isDark(context)
            ? Ux4gColors.red300
            : const Color(0xFFC5221F),
      ),
      _ConsentHistoryItem(
        title: 'Housing Board',
        scheme: 'PMAY',
        filterKey: 'PMAY',
        dataShared: 'Address, Income',
        givenDate: '03 Mar 2023',
        status: 'Expired',
        statusColor: _isDark(context)
            ? Ux4gColors.gray800
            : const Color(0xFFF1F3F4),
        textColor: _isDark(context)
            ? Ux4gColors.neutral50
            : Ux4gColors.gray800,
      ),
    ];
    final displayedConsents = allConsents.where((item) {
      if (_selectedFilters.contains('All')) return true;
      return _selectedFilters.contains(item.filterKey);
    }).toList();
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Consent History',
                          style: Theme.of(context)
                              .extension<Ux4gTypography>()!
                              .hM_default
                              .copyWith(
                                color: _isDark(context)
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.gray900,
                              ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'A complete audit trail of all your data sharing consents for government schemes.',
                          style: TextStyle(
                            fontSize: 14,
                            color: _isDark(context)
                                ? Ux4gColors.neutral400
                                : (_isDark(context)
                                      ? Ux4gColors.neutral400
                                      : Ux4gColors.neutral500),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                        PointerDeviceKind.stylus,
                      },
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          _buildFilterChip('All'),
                          SizedBox(width: 8),
                          _buildFilterChip('PM-Kisan'),
                          SizedBox(width: 8),
                          _buildFilterChip('PM-MKSSY'),
                          SizedBox(width: 8),
                          _buildFilterChip('PMAY'),
                          SizedBox(width: 8),
                          _buildFilterChip('PM-Ajay'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: displayedConsents.isEmpty
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40),
                              child: Text(
                                'No consents found for the selected filters.',
                                style: TextStyle(
                                  color: _isDark(context)
                                      ? Ux4gColors.neutral400
                                      : (_isDark(context)
                                            ? Ux4gColors.neutral400
                                            : Ux4gColors.neutral500),
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: displayedConsents.map((item) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: _isDark(context)
                                        ? Ux4gColors.gray900
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: _isDark(context)
                                          ? Ux4gColors.neutral700
                                          : (_isDark(context)
                                                ? Ux4gColors.neutral800
                                                : Ux4gColors.neutral200),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.02,
                                        ),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: _isDark(context)
                                                  ? Colors.white
                                                  : (_isDark(context)
                                                        ? Ux4gColors.neutral50
                                                        : Ux4gColors.gray900),
                                            ),
                                          ),
                                          Ux4gTag(
                                            text: item.status,
                                            customBackgroundColor:
                                                item.statusColor,
                                            customContentColor: item.textColor,
                                            shape: Ux4gTagShape.circular,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      _buildCardRow('Scheme', item.scheme),
                                      SizedBox(height: 4),
                                      _buildCardRow('Data', item.dataShared),
                                      SizedBox(height: 4),
                                      _buildCardRow('Given', item.givenDate),
                                      SizedBox(height: 12),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: (_isDark(context)
                                                ? Ux4gColors.primary300
                                                : Ux4gColors.primary600),
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Showing ${displayedConsents.length} of ${allConsents.length} consents',
                          style: TextStyle(
                            fontSize: 13,
                            color: _isDark(context)
                                ? Ux4gColors.neutral400
                                : (_isDark(context)
                                      ? Ux4gColors.neutral400
                                      : Ux4gColors.neutral500),
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Download Consent History (PDF)',
                            style: Theme.of(context)
                                .extension<Ux4gTypography>()!
                                .lL_default
                                .copyWith(
                                  color: _isDark(context)
                                      ? Ux4gColors.primary300
                                      : Ux4gColors.primary600,
                                ),
                          ),
                        ),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 16,
                              color: (_isDark(context)
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: _isDark(context)
                        ? Ux4gColors.neutral500
                        : (_isDark(context)
                              ? Ux4gColors.neutral500
                              : Ux4gColors.neutral400),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Image.asset(
                  _digitalIndiaLogoPath,
                  height: 22,
                  color: _isDark(context) ? Colors.white : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _isChipSelected(label);
    return Ux4gChoiceChip(
      text: label,
      selected: isSelected,
      borderRadius: 8.0,
      onClick: () => _toggleFilter(label),
      selectedBackgroundColor: _isDark(context)
          ? Ux4gColors.primary900
          : (_isDark(context)
                ? Ux4gColors.primary900
                : Ux4gColors.primary100),
      selectedBorderColor: (_isDark(context)
          ? Ux4gColors.primary300
          : Ux4gColors.primary600),
      selectedTextColor: (_isDark(context)
          ? Ux4gColors.primary300
          : Ux4gColors.primary600),
      unselectedBackgroundColor: _isDark(context)
          ? Ux4gColors.gray900
          : Colors.white,
      unselectedBorderColor: _isDark(context)
          ? Ux4gColors.neutral700
          : (_isDark(context)
                ? Ux4gColors.neutral800
                : Ux4gColors.neutral200),
      unselectedTextColor: _isDark(context)
          ? Ux4gColors.neutral400
          : (_isDark(context)
                ? Ux4gColors.neutral400
                : Ux4gColors.neutral600),
    );
  }

  Widget _buildCardRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.5,
              color: _isDark(context)
                  ? Ux4gColors.neutral400
                  : (_isDark(context)
                        ? Ux4gColors.neutral400
                        : Ux4gColors.neutral500),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          '· ',
          style: TextStyle(
            fontSize: 13.5,
            color: _isDark(context)
                ? Ux4gColors.neutral400
                : (_isDark(context)
                      ? Ux4gColors.neutral400
                      : Ux4gColors.neutral500),
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13.5,
              color: _isDark(context)
                  ? Ux4gColors.neutral50
                  : Ux4gColors.gray900,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConsentHistoryCardMockup extends StatefulWidget {
  const _ConsentHistoryCardMockup();
  @override
  State<_ConsentHistoryCardMockup> createState() =>
      _ConsentHistoryCardMockupState();
}

class _ConsentHistoryCardMockupState extends State<_ConsentHistoryCardMockup> {
  final Set<String> _selectedFilters = {'PM-Kisan', 'PMAY'};
  void _toggleFilter(String filter) {
    setState(() {
      if (filter == 'All') {
        _selectedFilters.clear();
        _selectedFilters.add('All');
      } else {
        _selectedFilters.remove('All');
        if (_selectedFilters.contains(filter)) {
          _selectedFilters.remove(filter);
        } else {
          _selectedFilters.add(filter);
        }
        if (_selectedFilters.isEmpty) {
          _selectedFilters.add('All');
        }
      }
    });
  }

  bool _isChipSelected(String filter) {
    if (filter == 'All') {
      return _selectedFilters.contains('All') || _selectedFilters.isEmpty;
    }
    return _selectedFilters.contains(filter);
  }

  @override
  Widget build(BuildContext context) {
    final allConsents = [
      _ConsentHistoryItem(
        title: 'Bank of India',
        scheme: 'PM Kisan',
        filterKey: 'PM-Kisan',
        dataShared: 'Aadhaar, Name',
        givenDate: '12 Jan 2024',
        status: 'Active',
        statusColor: _isDark(context)
            ? Ux4gColors.green900
            : (_isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50),
        textColor: _isDark(context)
            ? Ux4gColors.green300
            : (_isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700),
      ),
      _ConsentHistoryItem(
        title: 'Payment Corp',
        scheme: 'PM Kisan',
        filterKey: 'PM-Kisan',
        dataShared: 'Transaction ID',
        givenDate: '12 Jan 2024',
        status: 'Active',
        statusColor: _isDark(context)
            ? Ux4gColors.green900
            : (_isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50),
        textColor: _isDark(context)
            ? Ux4gColors.green300
            : (_isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700),
      ),
      _ConsentHistoryItem(
        title: 'SMS Gateway',
        scheme: 'PM Kisan',
        filterKey: 'PM-Kisan',
        dataShared: 'Mobile Number',
        givenDate: '15 Jan 2024',
        status: 'Withdrawn',
        statusColor: _isDark(context)
            ? Ux4gColors.red900
            : const Color(0xFFFCE8E6),
        textColor: _isDark(context)
            ? Ux4gColors.red300
            : const Color(0xFFC5221F),
      ),
      _ConsentHistoryItem(
        title: 'Housing Board',
        scheme: 'PMAY',
        filterKey: 'PMAY',
        dataShared: 'Address, Income',
        givenDate: '03 Mar 2023',
        status: 'Expired',
        statusColor: _isDark(context)
            ? Ux4gColors.gray800
            : const Color(0xFFF1F3F4),
        textColor: _isDark(context)
            ? Ux4gColors.neutral50
            : Ux4gColors.gray800,
      ),
    ];
    final displayedConsents = allConsents.where((item) {
      if (_selectedFilters.contains('All')) return true;
      return _selectedFilters.contains(item.filterKey);
    }).toList();
    return _PhoneFrame(
      child: Column(
        children: [
          _ConsentHeader(),
          Expanded(
            child: Container(
              color: _isDark(context)
                  ? Ux4gColors.primary900
                  : (_isDark(context)
                        ? Ux4gColors.primary900
                        : Ux4gColors.primary100),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context)
                              ? Ux4gColors.gray900
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Consent History',
                              style: Theme.of(context)
                                  .extension<Ux4gTypography>()!
                                  .hM_default
                                  .copyWith(
                                    color: _isDark(context)
                                        ? Ux4gColors.neutral50
                                        : Ux4gColors.gray900,
                                  ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'A complete audit trail of all your data sharing consents for government schemes.',
                              style: TextStyle(
                                fontSize: 13,
                                color: _isDark(context)
                                    ? Ux4gColors.neutral400
                                    : (_isDark(context)
                                          ? Ux4gColors.neutral400
                                          : Ux4gColors.neutral500),
                                height: 1.45,
                              ),
                            ),
                            SizedBox(height: 20),
                            ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(
                                    dragDevices: {
                                      PointerDeviceKind.mouse,
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.stylus,
                                    },
                                  ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildFilterChip('All'),
                                    SizedBox(width: 8),
                                    _buildFilterChip('PM-Kisan'),
                                    SizedBox(width: 8),
                                    _buildFilterChip('PM-MKSSY'),
                                    SizedBox(width: 8),
                                    _buildFilterChip('PMAY'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            if (displayedConsents.isEmpty)
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40),
                                  child: Text(
                                    'No consents found.',
                                    style: TextStyle(
                                      color: _isDark(context)
                                          ? Ux4gColors.neutral400
                                          : (_isDark(context)
                                                ? Ux4gColors.neutral400
                                                : Ux4gColors.neutral500),
                                    ),
                                  ),
                                ),
                              )
                            else
                              Column(
                                children: displayedConsents.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: _isDark(context)
                                            ? Ux4gColors.gray900
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: _isDark(context)
                                              ? Ux4gColors.neutral700
                                              : (_isDark(context)
                                                    ? Ux4gColors.neutral800
                                                    : Ux4gColors.neutral200),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item.title,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  color: _isDark(context)
                                                      ? Colors.white
                                                      : (_isDark(context)
                                                            ? Ux4gColors
                                                                  .neutral50
                                                            : Ux4gColors
                                                                  .gray900),
                                                ),
                                              ),
                                              Ux4gTag(
                                                text: item.status,
                                                customBackgroundColor:
                                                    item.statusColor,
                                                customContentColor:
                                                    item.textColor,
                                                shape: Ux4gTagShape.circular,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          _buildCardRow('Scheme', item.scheme),
                                          SizedBox(height: 4),
                                          _buildCardRow(
                                            'Data',
                                            item.dataShared,
                                          ),
                                          SizedBox(height: 4),
                                          _buildCardRow(
                                            'Given',
                                            item.givenDate,
                                          ),
                                          SizedBox(height: 8),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Text(
                                              'View',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: (_isDark(context)
                                                    ? Ux4gColors.primary300
                                                    : Ux4gColors.primary600),
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            SizedBox(height: 12),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Showing ${displayedConsents.length} of ${allConsents.length} consents',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _isDark(context)
                                          ? Ux4gColors.neutral400
                                          : (_isDark(context)
                                                ? Ux4gColors.neutral400
                                                : Ux4gColors.neutral500),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Download Consent History (PDF)',
                                      style: Theme.of(context)
                                          .extension<Ux4gTypography>()!
                                          .lL_default
                                          .copyWith(
                                            color: _isDark(context)
                                                ? Ux4gColors.primary300
                                                : Ux4gColors.primary600,
                                          ),
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  Ux4gButton(
                                    text: 'Back',
                                    onPressed: () {},
                                    variant: Ux4gButtonVariant.ghost,
                                    textStyle: Theme.of(context)
                                        .extension<Ux4gTypography>()!
                                        .lXL_default
                                        .copyWith(
                                          color: _isDark(context)
                                              ? Ux4gColors.primary300
                                              : Ux4gColors.primary600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 8),
                    child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color: _isDark(context)
                                ? Ux4gColors.neutral500
                                : (_isDark(context)
                                      ? Ux4gColors.neutral500
                                      : Ux4gColors.neutral400),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: _isDark(context) ? Colors.white : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _isChipSelected(label);
    return Ux4gChoiceChip(
      text: label,
      selected: isSelected,
      borderRadius: 8.0,
      onClick: () => _toggleFilter(label),
      selectedBackgroundColor: _isDark(context)
          ? Ux4gColors.primary900
          : (_isDark(context)
                ? Ux4gColors.primary900
                : Ux4gColors.primary100),
      selectedBorderColor: (_isDark(context)
          ? Ux4gColors.primary300
          : Ux4gColors.primary600),
      selectedTextColor: (_isDark(context)
          ? Ux4gColors.primary300
          : Ux4gColors.primary600),
      unselectedBackgroundColor: _isDark(context)
          ? Ux4gColors.gray900
          : Colors.white,
      unselectedBorderColor: _isDark(context)
          ? Ux4gColors.neutral700
          : (_isDark(context)
                ? Ux4gColors.neutral800
                : Ux4gColors.neutral200),
      unselectedTextColor: _isDark(context)
          ? Ux4gColors.neutral400
          : (_isDark(context)
                ? Ux4gColors.neutral400
                : Ux4gColors.neutral600),
    );
  }

  Widget _buildCardRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.5,
              color: _isDark(context)
                  ? Ux4gColors.neutral400
                  : (_isDark(context)
                        ? Ux4gColors.neutral400
                        : Ux4gColors.neutral500),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          '· ',
          style: TextStyle(
            fontSize: 12.5,
            color: _isDark(context)
                ? Ux4gColors.neutral400
                : (_isDark(context)
                      ? Ux4gColors.neutral400
                      : Ux4gColors.neutral500),
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12.5,
              color: _isDark(context)
                  ? Ux4gColors.neutral50
                  : Ux4gColors.gray900,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConsentHistoryItem {
  final String title;
  final String scheme;
  final String filterKey;
  final String dataShared;
  final String givenDate;
  final String status;
  final Color statusColor;
  final Color textColor;
  _ConsentHistoryItem({
    required this.title,
    required this.scheme,
    required this.filterKey,
    required this.dataShared,
    required this.givenDate,
    required this.status,
    required this.statusColor,
    required this.textColor,
  });
}

const _consentHistoryCardCode = r'''// Consent History – Card Style Layout
Column(
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32),
        Container(width: 1, height: 28, color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral300),
        SvgPicture.asset(Ux4gIcons.union,  height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(Icons.menu, color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 20),
            ),
          ),
        ),
      ],
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    Divider(height: 1, color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
    Expanded(
      child: Container(
        color: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100, // Soft purple background
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consent History',
                        style: Theme.of(context).extension<Ux4gTypography>()!.hM_default.copyWith(color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'A complete audit trail of all your data sharing consents for government schemes.',
                        style: TextStyle(
                          fontSize: 13,
                          color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Horizontal Scrollable Choice Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Ux4gChoiceChip(
                              text: 'All',
                              selected: false,
                              borderRadius: 8.0,
                              onClick: () {},
                              unselectedBackgroundColor: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                              unselectedTextColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.gray900,
                              unselectedBorderColor: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                            ),
                            SizedBox(width: 8),
                            Ux4gChoiceChip(
                              text: 'PM-Kisan',
                              selected: true,
                              borderRadius: 8.0,
                              onClick: () {},
                              selectedBackgroundColor: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100,
                              selectedBorderColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              selectedTextColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            ),
                            SizedBox(width: 8),
                            Ux4gChoiceChip(
                              text: 'PM-MKSSY',
                              selected: false,
                              borderRadius: 8.0,
                              onClick: () {},
                              unselectedBackgroundColor: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                              unselectedTextColor: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.gray900,
                              unselectedBorderColor: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
                            ),
                            SizedBox(width: 8),
                            Ux4gChoiceChip(
                              text: 'PMAY',
                              selected: true,
                              borderRadius: 8.0,
                              onClick: () {},
                              selectedBackgroundColor: _isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100,
                              selectedBorderColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              selectedTextColor: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Card 1: Bank of India
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bank of India',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: 'Active',
                                  customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                                  customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            _ConsentRow(label: 'Scheme', value: 'PM Kisan'),
                            SizedBox(height: 4),
                            _ConsentRow(label: 'Data', value: 'Aadhaar, Name'),
                            SizedBox(height: 4),
                            _ConsentRow(label: 'Given', value: '12 Jan 2024'),
                            SizedBox(height: 8),
                            Text(
                              'View',
                              style: TextStyle(
                                fontSize: 13,
                                color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      // Card 2: Payment Corp
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.gray900 : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: _isDark(context) ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Payment Corp',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900),
                                ),
                                Ux4gTag(
                                  text: 'Active',
                                  customBackgroundColor: _isDark(context) ? Ux4gColors.green900 : Ux4gColors.green50,
                                  customContentColor: _isDark(context) ? Ux4gColors.green300 : Ux4gColors.green700,
                                  shape: Ux4gTagShape.circular,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            _ConsentRow(label: 'Scheme', value: 'PM Kisan'),
                            SizedBox(height: 4),
                            _ConsentRow(label: 'Data', value: 'Transaction ID'),
                            SizedBox(height: 4),
                            _ConsentRow(label: 'Given', value: '12 Jan 2024'),
                            SizedBox(height: 8),
                            Text(
                              'View',
                              style: TextStyle(
                                fontSize: 13,
                                color: (_isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Footer Actions
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Showing 4 of 4 consents',
                              style: TextStyle(fontSize: 12, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Download Consent History (PDF)',
                              style: Theme.of(context).extension<Ux4gTypography>()!.lL_default.copyWith(color: _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            ),
                            SizedBox(height: 24),
                            Ux4gButton(
                              text: 'Back',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.ghost,
                              textStyle: Theme.of(context).extension<Ux4gTypography>()!.lXL_default.copyWith(color: _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Powered by
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(fontSize: 11, color: _isDark(context) ? Ux4gColors.neutral500 : Ux4gColors.neutral400, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ],
)
// Helper widget for Consent History code strings
class _ConsentRow extends StatelessWidget {
  final String label;
  final String value;
  _ConsentRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Text(
            label,
            style: TextStyle(fontSize: 12.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          '· ',
          style: TextStyle(fontSize: 12.5, color: _isDark(context) ? Ux4gColors.neutral400 : Ux4gColors.neutral500, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12.5, color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.gray900, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}''';
