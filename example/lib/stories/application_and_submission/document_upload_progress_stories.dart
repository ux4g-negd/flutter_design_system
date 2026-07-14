import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/component_docs.dart';

const Color _bg = Color(0xFFFAFAFA);
const Color _cardBg = Color(0xFFF4F3FF);
const Color _titleColor = Color(0xFF111827);
const Color _subtleText = Color(0xFF4B5563);
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;

bool _isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getCardBg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50;


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

final documentUploadProgressComponent = WidgetbookComponent(
  name: 'Document upload with progress',
  useCases: [
    WidgetbookUseCase(
      name: 'Interactive Preview',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Layout Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
        );

        final isCardStyle = variant == 'Card style';
        final code = isCardStyle
            ? _documentUploadProgressCardCode
            : _documentUploadProgressDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Document upload with progress',
          description:
              'A document upload pattern demonstrating an active "Uploading" state with progress and cancel actions.',
          code: code,
          center: true,
          child: isCardStyle
              ? _DocumentUploadProgressCardMockup()
              : _DocumentUploadProgressMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Shared helpers
// ───────────────────────────────────────────────────────────────────────

class _PhoneFrame extends StatelessWidget {
  _PhoneFrame({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 760,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.neutral900
            : Ux4gColors.neutral50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Ux4gColors.neutral700
              : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _documentUploadProgressDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentUploadProgressScreen extends StatelessWidget {
  const DocumentUploadProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Theme.of(context).brightness == Brightness.dark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                Container(height: 32, width: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),
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
            Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB)),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stepper
                    Ux4gStepper(
                      totalSteps: 4, currentStep: 3, stepSize: 20,
                      steps: const [
                        Ux4gStepItem(title: 'Eligibility', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                        Ux4gStepItem(title: 'Personal', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                        Ux4gStepItem(title: 'Documents', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                        Ux4gStepItem(title: ''),
                      ],
                    ),
                    SizedBox(height: 32),

                    Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    SizedBox(height: 4),
                    Text('PDF or JPG, max 5 MB each. Self-attested.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500)),
                    SizedBox(height: 24),

                    Text('Required documents — uploading 2 of 4', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    SizedBox(height: 24),

                    // Aadhaar Card (Uploaded)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _getUploadedBg(context),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_circle, color: _getUploadedIcon(context), size: 20),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Aadhaar Card', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _getUploadedTitle(context))),
                                    SizedBox(height: 4),
                                    Text('aadhaar_card.pdf · 1.2 MB · Uploaded just now', style: TextStyle(fontSize: 13, color: _getUploadedDesc(context))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              Ux4gButton(text: 'View', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 100, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
                              Ux4gButton(text: 'Re-upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 120, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    // Proof of Income (Uploading Progress)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _isDark(context) ? Ux4gColors.primary900 : Ux4gColors.primary50,
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
    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary400 : Ux4gColors.primary600,
    shape: BoxShape.circle,
  ),
  child: Center(
    child: Icon(
      Icons.hourglass_bottom,
      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
      size: 12,
    ),
  ),
),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Proof of Income', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                                        SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red900 : Ux4gColors.red50, borderRadius: BorderRadius.circular(4)),
                                          child: Text('Required', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red300 : Ux4gColors.red800)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text('Uploading income_proof.pdf... 65%', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Ux4gButton(text: 'Cancel', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 100),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    // Residence Proof
                    _DocumentItem(
                      title: 'Residence proof',
                      subtitle: 'Electricity bill, gas bill or ration card',
                      badge: 'Required',
                      badgeColor: const Color(0xFFFEE2E2),
                      badgeTextColor: const Color(0xFF991B1B),
                    ),
                    SizedBox(height: 24),

                    // Caste Certificate
                    _DocumentItem(
                      title: 'Caste certificate',
                      subtitle: 'SC/ST/OBC applicants only',
                      badge: 'Optional',
                      badgeColor: const Color(0xFFF3F4F6),
                      badgeTextColor: const Color(0xFF374151),
                      showDigiLocker: false,
                    ),
                    SizedBox(height: 32),

                    Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
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
                  SizedBox(height: 12),
                  Ux4gButton(text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.medium, width: double.infinity, height: 48),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400)),
                  SizedBox(height: 6),
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

class _DocumentItem extends StatelessWidget {
  final String title, subtitle, badge;
  final Color badgeColor, badgeTextColor;
  final bool showDigiLocker;

  _DocumentItem({
    required this.title, required this.subtitle, required this.badge,
    required this.badgeColor, required this.badgeTextColor,
    this.showDigiLocker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200))),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                        SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(4)),
                          child: Text(badge, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: badgeTextColor)),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Ux4gButton(text: 'Upload', onPressed: () {}, size: Ux4gButtonSize.small, width: 100),
          if (showDigiLocker) ...[
            SizedBox(height: 12),
            Ux4gButton(text: 'Fetch from DigiLocker', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 220),
          ],
        ],
      ),
    );
  }
}
""";

const _documentUploadProgressCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentUploadProgressCardScreen extends StatelessWidget {
  const DocumentUploadProgressCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Theme.of(context).brightness == Brightness.dark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
                    title: '',
                    leadingWidgets: [
                      SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                      Container(height: 32, width: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),
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
                  Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB)),
                ],
              ),
            ),

            // Card Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Stepper
                      Ux4gStepper(
                        totalSteps: 4, currentStep: 3, stepSize: 20,
                        steps: const [
                          Ux4gStepItem(title: 'Eligibility', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: 'Personal', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: 'Documents', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: ''),
                        ],
                      ),
                      SizedBox(height: 32),

                      Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900, height: 1.2)),
                      SizedBox(height: 4),
                      Text('PDF or JPG, max 5 MB each. Self-attested.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500, height: 1.4)),
                      SizedBox(height: 24),

                      Text('Required documents — uploading 2 of 4', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                      SizedBox(height: 24),

                      // Aadhaar Card (Uploaded)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _getUploadedBg(context),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle, color: _getUploadedIcon(context), size: 20),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Aadhaar Card', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _getUploadedTitle(context))),
                                      SizedBox(height: 4),
                                      Text('aadhaar_card.pdf · 1.2 MB · Uploaded just now', style: TextStyle(fontSize: 13, color: _getUploadedDesc(context))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                Ux4gButton(text: 'View', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 100, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
                                Ux4gButton(text: 'Re-upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 120, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),

                      // Proof of Income (Uploading Progress)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isDark(context) ? Ux4gColors.primary900 : Ux4gColors.primary50,
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
    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary400 : Ux4gColors.primary600,
    shape: BoxShape.circle,
  ),
  child: Center(
    child: Icon(
      Icons.hourglass_bottom,
      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
      size: 12,
    ),
  ),
),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Proof of Income', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                                          SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red900 : Ux4gColors.red50, borderRadius: BorderRadius.circular(4)),
                                            child: Text('Required', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red300 : Ux4gColors.red800)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text('Uploading income_proof.pdf... 65%', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Ux4gButton(text: 'Cancel', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 100),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      _DocumentItem(title: 'Residence proof', subtitle: 'Electricity bill or Ration card', badge: 'Required', badgeColor: const Color(0xFFFEE2E2), badgeTextColor: const Color(0xFF991B1B)),
                      SizedBox(height: 24),
                      _DocumentItem(title: 'Caste certificate', subtitle: 'SC/ST/OBC applicants only', badge: 'Optional', badgeColor: const Color(0xFFF3F4F6), badgeTextColor: const Color(0xFF374151), showDigiLocker: false),
                      SizedBox(height: 32),
                      Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
                                  ),
                    ],
                  ),
                ),
              ),
            ),

            // Actions & Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(text: 'Continue', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                  SizedBox(height: 12),
                  Ux4gButton(text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.medium, width: double.infinity, height: 48),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400)),
                  SizedBox(height: 6),
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

class _DocumentItem extends StatelessWidget {
  final String title, subtitle, badge;
  final Color badgeColor, badgeTextColor;
  final bool showDigiLocker;

  _DocumentItem({
    required this.title, required this.subtitle, required this.badge,
    required this.badgeColor, required this.badgeTextColor,
    this.showDigiLocker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200))),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                        SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(4)),
                          child: Text(badge, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: badgeTextColor)),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Ux4gButton(text: 'Upload', onPressed: () {}, size: Ux4gButtonSize.small, width: 100),
          if (showDigiLocker) ...[
            SizedBox(height: 12),
            Ux4gButton(text: 'Fetch from DigiLocker', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 220),
          ],
        ],
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _DocumentUploadProgressMockup extends StatelessWidget {
  _DocumentUploadProgressMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.neutral900
            : Ux4gColors.neutral50,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Ux4gAppHeader(
                variant: Theme.of(context).brightness == Brightness.dark
                    ? Ux4gAppHeaderVariant.light
                    : Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(
                    _nationalEmblemLogoPath,
                    height: 40,
                    colorFilter: Theme.of(context).brightness == Brightness.dark
                        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                        : null,
                  ),
                  Container(
                    height: 32,
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral700
                        : Ux4gColors.neutral200,
                  ),
                  SvgPicture.asset(
                    _unionLogoPath,
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
              Divider(
                height: 1,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Ux4gColors.neutral700
                    : const Color(0xFFE5E7EB),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 3,
                        stepSize: 20,
                        steps: const [
                          Ux4gStepItem(
                            title: 'Eligibility',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Personal',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Documents',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(title: ''),
                        ],
                      ),
                      SizedBox(height: 32),
                      Text(
  'Upload documents',
  style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
  ),
),
SizedBox(height: 4),
                      Text(
  'PDF or JPG, max 5 MB each. Self-attested.',
  style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral500,
  ),
),
                      SizedBox(height: 24),
                      Text(
                        'Required documents — uploading 2 of 4',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 24),

                      // Aadhaar Card (Uploaded)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _getUploadedBg(context),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: _getUploadedIcon(context),
                                  size: 20,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Aadhaar Card',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: _getUploadedTitle(context),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'aadhaar_card.pdf · 1.2 MB · Uploaded just now',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: _getUploadedDesc(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                Ux4gButton(
                                  text: 'View',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  width: 100,
                                  height: 40,
                                ),
                                Ux4gButton(
                                  text: 'Re-upload',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  width: 120,
                                  height: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      // Proof of Income (Uploading Progress)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.primary900
                              : Ux4gColors.primary50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary800
                                : Ux4gColors.primary100,
                          ),
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
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary400 : Ux4gColors.primary600,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.hourglass_bottom,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Proof of Income',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gColors.neutral50
                                                  : Ux4gColors.neutral900,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gColors.red900
                                                  : Ux4gColors.red50,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              'Required',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gColors.red300
                                                    : Ux4gColors.red800,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Uploading income_proof.pdf... 65%',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Ux4gColors.neutral400
                                              : Ux4gColors.neutral500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Ux4gButton(
                              text: 'Cancel',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.outline,
                              size: Ux4gButtonSize.small,
                              width: 100,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      _MockDocumentItem(
                        title: 'Residence proof',
                        subtitle: 'Electricity bill, gas bill or ration card',
                        badge: 'Required',
                        badgeColor: const Color(0xFFFEE2E2),
                        badgeTextColor: const Color(0xFF991B1B),
                      ),
                      SizedBox(height: 24),

                      _MockDocumentItem(
                        title: 'Caste certificate',
                        subtitle: 'SC/ST/OBC applicants only',
                        badge: 'Optional',
                        badgeColor: const Color(0xFFF3F4F6),
                        badgeTextColor: const Color(0xFF374151),
                        showDigiLocker: false,
                      ),
                      SizedBox(height: 32),
                      Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
                                  ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Ux4gButton(
                      text: 'Continue',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 40,
                    ),
                    SizedBox(height: 12),
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 40,
                      contentColor: primaryColor,
                      borderColor: primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral500
                            : Ux4gColors.neutral400,
                      ),
                    ),
                    SizedBox(height: 6),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 24,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : null,
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

class _DocumentUploadProgressCardMockup extends StatelessWidget {
  _DocumentUploadProgressCardMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: _getCardBg(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Ux4gColors.neutral900
                    : Ux4gColors.neutral0,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gAppHeaderVariant.light
                          : Ux4gAppHeaderVariant.light,
                      title: '',
                      leadingWidgets: [
                        SvgPicture.asset(
                          _nationalEmblemLogoPath,
                          height: 40,
                          colorFilter:
                              Theme.of(context).brightness == Brightness.dark
                              ? const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                        Container(
                          height: 32,
                          width: 1,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral700
                              : Ux4gColors.neutral200,
                        ),
                        SvgPicture.asset(
                          _unionLogoPath,
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
                    Divider(
                      height: 1,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral700
                          : const Color(0xFFE5E7EB),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral900
                          : Ux4gColors.neutral0,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Ux4gStepper(
                          totalSteps: 4,
                          currentStep: 3,
                          stepSize: 20,
                          steps: const [
                            Ux4gStepItem(
                              title: 'Eligibility',
                              titleStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Ux4gStepItem(
                              title: 'Personal',
                              titleStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Ux4gStepItem(
                              title: 'Documents',
                              titleStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Ux4gStepItem(title: ''),
                          ],
                        ),
                        SizedBox(height: 32),
                        Text(
  'Upload documents',
  style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral50
                                : Ux4gColors.neutral900,
  ),
),
SizedBox(height: 4),
                        Text(
  'PDF or JPG, max 5 MB each. Self-attested.',
  style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral400
                                : Ux4gColors.neutral500,
  ),
),
                        SizedBox(height: 24),

                        Text(
                          'Required documents — uploading 2 of 4',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral50
                                : Ux4gColors.neutral900,
                          ),
                        ),
                        SizedBox(height: 24),

                        // Aadhaar Card (Uploaded)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _getUploadedBg(context),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: _getUploadedIcon(context),
                                    size: 20,
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Aadhaar Card',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: _getUploadedTitle(context),
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'aadhaar_card.pdf · 1.2 MB · Uploaded just now',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: _getUploadedDesc(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: [
                                  Ux4gButton(
                                    text: 'View',
                                    onPressed: () {},
                                    variant: Ux4gButtonVariant.outline,
                                    size: Ux4gButtonSize.small,
                                    width: 100,
                                    height: 40,
                                  ),
                                  Ux4gButton(
                                    text: 'Re-upload',
                                    onPressed: () {},
                                    variant: Ux4gButtonVariant.outline,
                                    size: Ux4gButtonSize.small,
                                    width: 120,
                                    height: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),

                        // Proof of Income (Uploading Progress)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary900
                                : Ux4gColors.primary50,
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
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary400 : Ux4gColors.primary600,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.hourglass_bottom,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Proof of Income',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gColors.neutral50
                                                    : Ux4gColors.neutral900,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color:
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gColors.red900
                                                    : Ux4gColors.red50,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                'Required',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      Theme.of(
                                                            context,
                                                          ).brightness ==
                                                          Brightness.dark
                                                      ? Ux4gColors.red300
                                                      : Ux4gColors.red800,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Uploading income_proof.pdf... 65%',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Ux4gColors.neutral400
                                                : Ux4gColors.neutral500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Ux4gButton(
                                text: 'Cancel',
                                onPressed: () {},
                                variant: Ux4gButtonVariant.outline,
                                size: Ux4gButtonSize.small,
                                width: 100,
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),

                        _MockDocumentItem(
                          title: 'Residence proof',
                          subtitle: 'Electricity bill or Ration card',
                          badge: 'Required',
                          badgeColor: const Color(0xFFFEE2E2),
                          badgeTextColor: const Color(0xFF991B1B),
                        ),
                        SizedBox(height: 24),
                        _MockDocumentItem(
                          title: 'Caste certificate',
                          subtitle: 'SC/ST/OBC applicants only',
                          badge: 'Optional',
                          badgeColor: const Color(0xFFF3F4F6),
                          badgeTextColor: const Color(0xFF374151),
                          showDigiLocker: false,
                        ),
                        SizedBox(height: 32),
                        Text(
                                    'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
                                      height: 1.4,
                                    ),
                                  ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Ux4gButton(
                      text: 'Continue',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 40,
                    ),
                    SizedBox(height: 12),
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 40,
                      contentColor: primaryColor,
                      borderColor: primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral500
                            : Ux4gColors.neutral400,
                      ),
                    ),
                    SizedBox(height: 6),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 24,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : null,
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

class _MockDocumentItem extends StatelessWidget {
  final String title, subtitle, badge;
  final Color badgeColor, badgeTextColor;
  final bool showDigiLocker;

  const _MockDocumentItem({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.badgeColor,
    required this.badgeTextColor,
    this.showDigiLocker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.neutral900
            : Ux4gColors.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Ux4gColors.neutral700
              : const Color(0xFFE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral700
                        : Ux4gColors.neutral200,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral50
                                : Ux4gColors.neutral900,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: badgeTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral400
                            : Ux4gColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Ux4gButton(
            text: 'Upload',
            onPressed: () {},
            size: Ux4gButtonSize.small,
            width: 100,
            height: 40,
          ),
          if (showDigiLocker) ...[
            SizedBox(height: 12),
            Ux4gButton(
              text: 'Fetch from DigiLocker',
              onPressed: () {},
              variant: Ux4gButtonVariant.outline,
              size: Ux4gButtonSize.small,
              width: 220,
              height: 40,
            ),
          ],
        ],
      ),
    );
  }
}
