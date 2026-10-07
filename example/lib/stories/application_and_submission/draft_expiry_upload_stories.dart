import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : Colors.white;
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.primary900 : Ux4gColors.primary100;
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral400 : const Color(0xFF4B5563);
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB);
Color _getPrimaryColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.primary600 : const Color(0xFF432CBB);
Color _getGreenColor(BuildContext context) => _isDark(context)
    ? Ux4gColors.green600
    : (_isDark(context) ? Ux4gColors.green500 : Ux4gColors.green600);
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;

bool _isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getUploadedBg(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green900 : Ux4gColors.green50;
Color _getUploadedBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green800 : const Color(0xFFDCFCE7);
Color _getUploadedIcon(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green500 : Ux4gColors.green600;
Color _getUploadedTitle(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
Color _getUploadedDesc(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.neutral200 : Ux4gColors.neutral700;
Color _getUploadedBtnText(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.primary300 : Ux4gColors.primary600;
Color _getUploadedBtnBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.primary600 : Ux4gColors.primary300;

const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final draftExpiryUploadComponent = WidgetbookComponent(
  name: 'Draft Expiry Upload',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _draftExpiryUploadCardCode
            : _draftExpiryUploadDefaultCode;
        final child = variant == 'Card style'
            ? const _DraftExpiryUploadCardMockup()
            : const _DraftExpiryUploadMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Draft Expiry Upload',
          description:
              'A pattern showing document upload with a draft expiry warning banner, '
              'allowing users to complete uploads before their saved draft expires.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Shared widgets
// ───────────────────────────────────────────────────────────────────────

class _ExpiryBanner extends StatelessWidget {
  const _ExpiryBanner();

  @override
  Widget build(BuildContext context) {
    return Ux4gStatusBanner(
      variant: Ux4gBannerVariant.warningLight,
      title: 'Your draft expires in 5 days',
      margin: EdgeInsets.zero,
      leadingIcon: Icon(
        Icons.error,
        color: _isDark(context)
            ? Ux4gColors.yellow400
            : const Color(0xFFF59E0B),
        size: 20,
      ),
      titleStyle: TextStyle(
        color: _isDark(context)
            ? Ux4gColors.yellow400
            : const Color(0xFFAD530A),
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      trailingIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: _isDark(context)
              ? Ux4gColors.yellow900.withOpacity(0.3)
              : const Color(0xFFFFEDD5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '16 Apr',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: _isDark(context)
                ? Ux4gColors.yellow400
                : const Color(0xFF9A3412),
          ),
        ),
      ),
    );
  }
}

class _UploadedDocItem extends StatelessWidget {
  const _UploadedDocItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isDark(context)
            ? Ux4gColors.green900.withOpacity(0.2)
            : const Color(0xFFF0FDF4),
        border: Border.all(
          color: _isDark(context)
              ? Ux4gColors.green800
              : const Color(0xFFBBF7D0),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getGreenColor(context),
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 14),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aadhaar Card',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: _getTitleColor(context),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'aadhaar_card.pdf · 1.2 MB · Uploaded just now',
                      style: TextStyle(
                        fontSize: 13,
                        color: _getSubtleText(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: _getBorderColor(context)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'View',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _getTitleColor(context),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: _getBorderColor(context)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Re-upload',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _getTitleColor(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingDocItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isRequired;
  final bool showDigiLocker;

  const _PendingDocItem({
    required this.title,
    required this.subtitle,
    this.isRequired = true,
    this.showDigiLocker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _getBorderColor(context),
                    width: 1.5,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: _getTitleColor(context),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: isRequired
                                ? (_isDark(context)
                                      ? Ux4gColors.red900.withOpacity(0.3)
                                      : const Color(0xFFFEE2E2))
                                : (_isDark(context)
                                      ? Ux4gColors.neutral800
                                      : const Color(0xFFF3F4F6)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            isRequired ? 'Required' : 'Optional',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: isRequired
                                  ? (_isDark(context)
                                        ? Ux4gColors.red400
                                        : const Color(0xFFDC2626))
                                  : (_isDark(context)
                                        ? Ux4gColors.neutral400
                                        : const Color(0xFF6B7280)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: _getSubtleText(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ux4gButton(
                  height: 48,
                  text: 'Upload',
                  onPressed: () {},
                  variant: Ux4gButtonVariant.outline,
                  size: Ux4gButtonSize.small,
                  contentColor: _getPrimaryColor(context),
                  borderColor: _getPrimaryColor(context),
                ),
                if (showDigiLocker) ...[
                  const SizedBox(height: 8),
                  Ux4gButton(
                    height: 48,
                    text: 'Fetch from DigiLocker',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.small,
                    contentColor: _getSubtleText(context),
                    borderColor: _getBorderColor(context),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentList extends StatelessWidget {
  const _DocumentList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _UploadedDocItem(),
        SizedBox(height: 16),
        _PendingDocItem(
          title: 'Proof of Income',
          subtitle: 'Salary slip or income tax return',
          isRequired: true,
          showDigiLocker: true,
        ),
        SizedBox(height: 16),
        _PendingDocItem(
          title: 'Residence proof',
          subtitle: 'Electricity bill, gas bill or ration card',
          isRequired: true,
          showDigiLocker: true,
        ),
        SizedBox(height: 16),
        _PendingDocItem(
          title: 'Caste certificate',
          subtitle: 'SC/ST/OBC applicants only',
          isRequired: false,
          showDigiLocker: false,
        ),
      ],
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _draftExpiryUploadDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DraftExpiryUploadScreen extends StatelessWidget {
  const DraftExpiryUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    const greenColor = Color(0xFF16A34A);
    const titleColor = Color(0xFF111827);
    const subtleText = Color(0xFF4B5563);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                Container(height: 32, width: 1, color: const Color(0xFFD1D5DB)),
                SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Draft expiry warning banner
                    Ux4gStatusBanner(
                      variant: Ux4gBannerVariant.warningLight,
                      title: 'Your draft expires in 5 days',
                      margin: EdgeInsets.zero,
                      leadingIcon: const Icon(Icons.error, color: Color(0xFFF59E0B), size: 20),
                      titleStyle: const TextStyle(color: Color(0xFFAD530A), fontWeight: FontWeight.w500, fontSize: 13),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      trailingWidget: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFFFFEDD5), borderRadius: BorderRadius.circular(4)),
                        child: const Text('16 Apr', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF9A3412))),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Stepper
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: const [
                        Ux4gStepItem(title: 'Eligibility', titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF4B5563))),
                        Ux4gStepItem(title: 'Personal', titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF4B5563))),
                        Ux4gStepItem(title: 'Documents', titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF4B5563))),
                        Ux4gStepItem(title: ''),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Title
                    const Text(
                      'Upload documents',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: titleColor, height: 1.2),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'PDF or JPG, max 5 MB each. Self-attested.',
                      style: TextStyle(fontSize: 14, color: subtleText),
                    ),
                    const SizedBox(height: 20),

                    // Required count
                    const Text(
                      'Required documents — 1 of 4 uploaded',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor),
                    ),
                    const SizedBox(height: 20),

                    // Uploaded document card (green background)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _getUploadedBg(context),
                        border: Border.all(color: const Color(0xFFBBF7D0)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20, height: 20,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: greenColor),
                                child: const Icon(Icons.check, color: Colors.white, size: 14),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Aadhaar Card', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                                    SizedBox(height: 4),
                                    Text('aadhaar_card.pdf · 1.2 MB · Uploaded just now', style: TextStyle(fontSize: 13, color: subtleText)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD1D5DB)), borderRadius: BorderRadius.circular(6)),
                                  child: const Text('View', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: titleColor)),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD1D5DB)), borderRadius: BorderRadius.circular(6)),
                                  child: const Text('Re-upload', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: titleColor)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Pending: Proof of Income
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5))),
                              const SizedBox(width: 12),
                              const Text('Proof of Income', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(color: const Color(0xFFFEE2E2), borderRadius: BorderRadius.circular(4)),
                                child: const Text('Required', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFDC2626))),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(left: 40, top: 4), child: Text('Salary slip or income tax return', style: TextStyle(fontSize: 13, color: subtleText))),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Ux4gButton(height: 48, text: 'Upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: primaryColor, borderColor: primaryColor),
                                const SizedBox(height: 8),
                                Ux4gButton(height: 48, text: 'Fetch from DigiLocker', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: subtleText, borderColor: const Color(0xFFD1D5DB)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Pending: Residence proof
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5))),
                              const SizedBox(width: 12),
                              const Text('Residence proof', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(color: const Color(0xFFFEE2E2), borderRadius: BorderRadius.circular(4)),
                                child: const Text('Required', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFDC2626))),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(left: 40, top: 4), child: Text('Electricity bill, gas bill or ration card', style: TextStyle(fontSize: 13, color: subtleText))),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Ux4gButton(height: 48, text: 'Upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: primaryColor, borderColor: primaryColor),
                                const SizedBox(height: 8),
                                Ux4gButton(height: 48, text: 'Fetch from DigiLocker', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: subtleText, borderColor: const Color(0xFFD1D5DB)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Optional: Caste certificate
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5))),
                              const SizedBox(width: 12),
                              const Text('Caste certificate', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(4)),
                                child: const Text('Optional', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF6B7280))),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(left: 40, top: 4), child: Text('SC/ST/OBC applicants only', style: TextStyle(fontSize: 13, color: subtleText))),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Ux4gButton(height: 48, text: 'Upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: primaryColor, borderColor: primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Disclaimer
                    Builder(
                      builder: (context) {
                        bool isChecked = true;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                      });
                                    },
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(text: 'Continue', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                  const SizedBox(height: 12),
                  Ux4gButton(height: 48, text: 'Save draft', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: const Color(0xFF6B7280), borderColor: const Color(0xFFD1D5DB)),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                  const SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
""";

const _draftExpiryUploadCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DraftExpiryUploadCardScreen extends StatelessWidget {
  const DraftExpiryUploadCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    const greenColor = Color(0xFF16A34A);
    const titleColor = Color(0xFF111827);
    const subtleText = Color(0xFF4B5563);

    return Scaffold(
      backgroundColor: const Color(0xFFDCD4FF),
      body: SafeArea(
        child: Column(
          children: [
            // Header with white background
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Ux4gAppHeaderVariant.light,
                    leadingWidgets: [
                      SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                      Container(height: 32, width: 1, color: const Color(0xFFD1D5DB)),
                      SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                ),
                    ],
                  ),
                  const Divider(height: 1, color: Color(0xFFE5E7EB)),
                ],
              ),
            ),

            // White card with all content inside
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, spreadRadius: 2, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Draft expiry warning banner inside card
                      Ux4gStatusBanner(
                        variant: Ux4gBannerVariant.warningLight,
                        title: 'Your draft expires in 5 days',
                        margin: EdgeInsets.zero,
                        leadingIcon: const Icon(Icons.error, color: Color(0xFFF59E0B), size: 20),
                        titleStyle: const TextStyle(color: Color(0xFFAD530A), fontWeight: FontWeight.w500, fontSize: 13),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        trailingWidget: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: const Color(0xFFFFEDD5), borderRadius: BorderRadius.circular(4)),
                          child: const Text('16 Apr', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF9A3412))),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Stepper inside card
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 3,
                        stepSize: 20,
                        steps: const [
                          Ux4gStepItem(title: 'Eligibility', titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF4B5563))),
                          Ux4gStepItem(title: 'Personal', titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF4B5563))),
                          Ux4gStepItem(title: 'Documents', titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF4B5563))),
                          Ux4gStepItem(title: ''),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Title
                      const Text(
                        'Upload documents',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: titleColor, height: 1.2),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'PDF or JPG, max 5 MB each. Self-attested.',
                        style: TextStyle(fontSize: 14, color: subtleText),
                      ),
                      const SizedBox(height: 20),

                      // Required count
                      const Text(
                        'Required documents — 1 of 4 uploaded',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor),
                      ),
                      const SizedBox(height: 20),

                      // Uploaded document card (green background)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _getUploadedBg(context),
                          border: Border.all(color: const Color(0xFFBBF7D0)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20, height: 20,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: greenColor),
                                  child: const Icon(Icons.check, color: Colors.white, size: 14),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Aadhaar Card', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                                      SizedBox(height: 4),
                                      Text('aadhaar_card.pdf · 1.2 MB · Uploaded just now', style: TextStyle(fontSize: 13, color: subtleText)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                    decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD1D5DB)), borderRadius: BorderRadius.circular(6)),
                                    child: const Text('View', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: titleColor)),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                    decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD1D5DB)), borderRadius: BorderRadius.circular(6)),
                                    child: const Text('Re-upload', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: titleColor)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Pending: Proof of Income
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5))),
                                const SizedBox(width: 12),
                                const Text('Proof of Income', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFFFEE2E2), borderRadius: BorderRadius.circular(4)),
                                  child: const Text('Required', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFDC2626))),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(left: 40, top: 4), child: Text('Salary slip or income tax return', style: TextStyle(fontSize: 13, color: subtleText))),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Ux4gButton(height: 48, text: 'Upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: primaryColor, borderColor: primaryColor),
                                  const SizedBox(height: 8),
                                  Ux4gButton(height: 48, text: 'Fetch from DigiLocker', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: subtleText, borderColor: const Color(0xFFD1D5DB)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Pending: Residence proof
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5))),
                                const SizedBox(width: 12),
                                const Text('Residence proof', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFFFEE2E2), borderRadius: BorderRadius.circular(4)),
                                  child: const Text('Required', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFDC2626))),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(left: 40, top: 4), child: Text('Electricity bill, gas bill or ration card', style: TextStyle(fontSize: 13, color: subtleText))),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Ux4gButton(height: 48, text: 'Upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: primaryColor, borderColor: primaryColor),
                                  const SizedBox(height: 8),
                                  Ux4gButton(height: 48, text: 'Fetch from DigiLocker', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: subtleText, borderColor: const Color(0xFFD1D5DB)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Optional: Caste certificate
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5))),
                                const SizedBox(width: 12),
                                const Text('Caste certificate', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: titleColor)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(4)),
                                  child: const Text('Optional', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF6B7280))),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(left: 40, top: 4), child: Text('SC/ST/OBC applicants only', style: TextStyle(fontSize: 13, color: subtleText))),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Ux4gButton(height: 48, text: 'Upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, contentColor: primaryColor, borderColor: primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Disclaimer
                      Builder(
                      builder: (context) {
                        bool isChecked = true;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                      });
                                    },
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    ],
                  ),
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(text: 'Continue', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                  const SizedBox(height: 12),
                  Ux4gButton(height: 48, text: 'Save draft', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: const Color(0xFF6B7280), borderColor: const Color(0xFFD1D5DB)),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                  const SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _DraftExpiryUploadMockup extends StatelessWidget {
  const _DraftExpiryUploadMockup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBg(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: _isDark(context)
                  ? Ux4gAppHeaderVariant.light
                  : Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  _nationalEmblemLogoPath,
                  height: 40,
                  colorFilter: _isDark(context)
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : null,
                  errorBuilder: (c, e, s) => const Icon(
                    Icons.account_balance,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 32,
                  width: 1,
                  color: _isDark(context)
                      ? Ux4gColors.neutral700
                      : const Color(0xFFD1D5DB),
                ),
                SvgPicture.asset(
                  _unionLogoPath,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                  height: 32,
                  errorBuilder: (c, e, s) =>
                      const Icon(Icons.blur_on, size: 32, color: Colors.blue),
                ),
              ],
            ),
            Divider(height: 1, color: _getBorderColor(context)),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Expiry banner
                    const _ExpiryBanner(),
                    const SizedBox(height: 20),

                    // Stepper
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: const [
                        Ux4gStepItem(
                          title: 'Eligibility',
                          titleStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Personal',
                          titleStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Documents',
                          titleStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                        Ux4gStepItem(title: ''),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Title
                    Text(
                      'Upload documents',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: _getTitleColor(context),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'PDF or JPG, max 5 MB each. Self-attested.',
                      style: TextStyle(
                        fontSize: 14,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Required count
                    Text(
                      'Required documents — 1 of 4 uploaded',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: _getPrimaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Document list
                    const _DocumentList(),
                    const SizedBox(height: 24),

                    // Disclaimer
                    Builder(
                      builder: (context) {
                        bool isChecked = true;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                      });
                                    },
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(
                    height: 48,
                    text: 'Continue',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 12),
                  Ux4gButton(
                    height: 48,
                    text: 'Save draft',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    contentColor: _isDark(context)
                        ? Ux4gColors.neutral400
                        : const Color(0xFF6B7280),
                    borderColor: _isDark(context)
                        ? Ux4gColors.neutral700
                        : const Color(0xFFD1D5DB),
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
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
                          : const Color(0xFF9CA3AF),
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    _digitalIndiaLogoPath,
                    height: 24,
                    color: _isDark(context) ? Colors.white : null,
                    errorBuilder: (c, e, s) => const Text(
                      'Digital India',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DraftExpiryUploadCardMockup extends StatelessWidget {
  const _DraftExpiryUploadCardMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardBg(context),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        backgroundColor: _getCardBg(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with white background
              Container(
                color: _isDark(context) ? Ux4gColors.neutral950 : Colors.white,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: _isDark(context)
                          ? Ux4gAppHeaderVariant.light
                          : Ux4gAppHeaderVariant.light,
                      title: '',
                      leadingWidgets: [
                        SvgPicture.asset(
                          _nationalEmblemLogoPath,
                          height: 40,
                          colorFilter: _isDark(context)
                              ? const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )
                              : null,
                          errorBuilder: (c, e, s) => const Icon(
                            Icons.account_balance,
                            size: 32,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 32,
                          width: 1,
                          color: _isDark(context)
                              ? Ux4gColors.neutral700
                              : const Color(0xFFD1D5DB),
                        ),
                        SvgPicture.asset(
                          _unionLogoPath,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                            BlendMode.srcIn,
                          ),
                          height: 32,
                          errorBuilder: (c, e, s) => const Icon(
                            Icons.blur_on,
                            size: 32,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1, color: _getBorderColor(context)),
                  ],
                ),
              ),

              // White card with all content inside
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: _isDark(context)
                          ? Ux4gColors.neutral900
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: _isDark(context)
                          ? Border.all(color: Ux4gColors.neutral800)
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expiry banner inside card
                        const _ExpiryBanner(),
                        const SizedBox(height: 20),

                        // Stepper inside card
                        Ux4gStepper(
                          totalSteps: 4,
                          currentStep: 3,
                          stepSize: 20,
                          steps: const [
                            Ux4gStepItem(
                              title: 'Eligibility',
                              titleStyle: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                            Ux4gStepItem(
                              title: 'Personal',
                              titleStyle: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                            Ux4gStepItem(
                              title: 'Documents',
                              titleStyle: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                            Ux4gStepItem(title: ''),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Title
                        Text(
                          'Upload documents',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: _getTitleColor(context),
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'PDF or JPG, max 5 MB each. Self-attested.',
                          style: TextStyle(
                            fontSize: 14,
                            color: _getSubtleText(context),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Required count
                        Text(
                          'Required documents — 1 of 4 uploaded',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: _getPrimaryColor(context),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Document list
                        const _DocumentList(),
                        const SizedBox(height: 24),

                        // Disclaimer
                        Builder(
                      builder: (context) {
                        bool isChecked = true;
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                      });
                                    },
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                        const SizedBox(height: 24),
                        Ux4gButton(
                        height: 48,
                        text: 'Continue',
                        onPressed: () {},
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        ),
                        const SizedBox(height: 12),
                        Ux4gButton(
                        height: 48,
                        text: 'Save draft',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        contentColor: _isDark(context)
                        ? Ux4gColors.neutral400
                        : const Color(0xFF6B7280),
                        borderColor: _isDark(context)
                        ? Ux4gColors.neutral700
                        : const Color(0xFFD1D5DB),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Actions
                            Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(
                        fontSize: 11,
                        color: _isDark(context)
                            ? Ux4gColors.neutral500
                            : Ux4gColors.neutral400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 22,
                      color: _isDark(context) ? Colors.white : null,
                      errorBuilder: (c, e, s) => const Text(
                        'Digital India',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
    );
  }
}
