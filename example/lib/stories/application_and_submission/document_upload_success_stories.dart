import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/component_docs.dart';

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

bool _isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getCardBg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
        ? Ux4gColors.primary900
        : Ux4gColors.primary50;

Color _getUploadedBg(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green900 : Ux4gColors.green50;
Color _getUploadedBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green800 : const Color(0xFFDCFCE7);
Color _getUploadedText(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green300 : Ux4gColors.green800;
Color _getUploadedIcon(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green500 : Ux4gColors.green600;
Color _getSuccessTagBg(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green800 : Ux4gColors.green100;
Color _getUploadedTitle(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
Color _getUploadedDesc(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.neutral200 : Ux4gColors.neutral700;
Color _getUploadedBtnText(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.primary300 : Ux4gColors.primary600;
Color _getUploadedBtnBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.primary600 : Ux4gColors.primary300;

final documentUploadSuccessComponent = WidgetbookComponent(
  name: 'Document upload success',
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
            ? _documentUploadSuccessCardCode
            : _documentUploadSuccessDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Document upload success',
          description:
              'A pattern showing the completed state where all required documents are successfully uploaded.',
          code: code,
          center: true,
          child: isCardStyle
              ? const _DocumentUploadSuccessCardMockup()
              : const _DocumentUploadSuccessMockup(),
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

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _documentUploadSuccessDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentUploadSuccessScreen extends StatelessWidget {
  const DocumentUploadSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: isDark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: isDark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
                ),
                Container(height: 32, width: 1, color: isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),
                SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
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
                        color: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: isDark ? Ux4gColors.primary400 : Ux4gColors.primary600,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
              verticalPadding: 16,
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Divider(height: 1, color: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB)),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stepper
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: const [
                        Ux4gStepItem(title: 'Eligibility', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                        Ux4gStepItem(title: 'Personal', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                        Ux4gStepItem(title: 'Documents', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                        Ux4gStepItem(title: 'Submit', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 32),

                    Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith(color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 4),
                    Text('PDF or JPG, max 5 MB each. Self-attested.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral500)),
                    const SizedBox(height: 20),

                    Text('All required documents uploaded — 4 of 4', style: Theme.of(context).extension<Ux4gTypography>()?.lL_strong?.copyWith(color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 12),
                    Ux4gLinearProgressBar(
                      value: 1.0,
                      height: 6,
                      shape: Ux4gProgressShape.rounded,
                      gradientColors: isDark
                          ? const [Ux4gColors.primary400, Ux4gColors.primary200]
                          : const [Ux4gColors.primary300, Ux4gColors.primary600],
                      trackColor: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                    ),
                    const SizedBox(height: 24),

                    // Success Banner
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.green900 : Ux4gColors.green50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark ? Ux4gColors.green800 : const Color(0xFFDCFCE7),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: isDark ? Ux4gColors.green500 : Ux4gColors.green600,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'All required documents uploaded.',
                                  style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
                                    color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Success',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
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

                    // Document Cards
                    const _UploadedItem(
                      title: 'Aadhaar Card',
                      fileName: 'aadhaar_card.pdf',
                      size: '1.2 MB',
                      uploadedText: 'Uploaded just now',
                    ),
                    const SizedBox(height: 16),
                    const _UploadedItem(
                      title: 'Proof of Income',
                      fileName: 'income_proof.pdf',
                      size: '1.8 MB',
                      uploadedText: 'Uploaded',
                    ),
                    const SizedBox(height: 16),
                    const _UploadedItem(
                      title: 'Residence proof',
                      fileName: 'electricity_bill.jpg',
                      size: '920 KB',
                      uploadedText: 'Uploaded',
                    ),
                    const SizedBox(height: 16),
                    const _UploadedItem(
                      title: 'Caste certificate',
                      fileName: 'caste_cert.pdf',
                      size: '1.1 MB',
                      uploadedText: 'Uploaded',
                    ),

                    const SizedBox(height: 32),
                    Text(
                      'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Ux4gColors.neutral300 : Ux4gColors.neutral600,
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
                  Ux4gButton(text: 'Proceed to review', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 40),
                  const SizedBox(height: 12),
                  Ux4gButton(text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, height: 40),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: isDark ? Colors.white : null),
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

const _documentUploadSuccessCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentUploadSuccessCardScreen extends StatelessWidget {
  const DocumentUploadSuccessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.primary900 : Ux4gColors.primary50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: isDark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
                    leadingWidgets: [
                      SvgPicture.asset(
                        Ux4gIcons.nationalEmblem,
                        height: 40,
                        colorFilter: isDark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
                      ),
                      Container(height: 32, width: 1, color: isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),
                      SvgPicture.asset(
                        Ux4gIcons.union, 
                        height: 32,
                        colorFilter: ColorFilter.mode(
                          isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
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
                              color: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.menu,
                              color: isDark ? Ux4gColors.primary400 : Ux4gColors.primary600,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                    verticalPadding: 16,
                    horizontalPadding: 16,
                    leadingSpacing: 8,
                  ),
                  Divider(height: 1, color: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB)),
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
                    color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
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
                          Ux4gStepItem(title: 'Eligibility', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: 'Personal', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: 'Documents', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: 'Submit', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith(color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                      const SizedBox(height: 4),
                      Text('PDF or JPG, max 5 MB each. Self-attested.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral500)),
                      const SizedBox(height: 20),

                      Text('All required documents uploaded — 4 of 4', style: Theme.of(context).extension<Ux4gTypography>()?.lL_strong?.copyWith(color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                      const SizedBox(height: 12),
                      Ux4gLinearProgressBar(
                        value: 1.0,
                        height: 6,
                        shape: Ux4gProgressShape.rounded,
                        gradientColors: isDark
                            ? const [Ux4gColors.primary400, Ux4gColors.primary200]
                            : const [Ux4gColors.primary300, Ux4gColors.primary600],
                        trackColor: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                      ),
                      const SizedBox(height: 24),

                      // Success Banner
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.green900 : Ux4gColors.green50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDark ? Ux4gColors.green800 : const Color(0xFFDCFCE7),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: isDark ? Ux4gColors.green500 : Ux4gColors.green600,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'All required documents uploaded.',
                                    style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
                                      color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Success',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
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

                      // Document Cards
                      const _UploadedItem(
                        title: 'Aadhaar Card',
                        fileName: 'aadhaar_card.pdf',
                        size: '1.2 MB',
                        uploadedText: 'Uploaded just now',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedItem(
                        title: 'Proof of Income',
                        fileName: 'income_proof.pdf',
                        size: '1.8 MB',
                        uploadedText: 'Uploaded',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedItem(
                        title: 'Residence proof',
                        fileName: 'electricity_bill.jpg',
                        size: '920 KB',
                        uploadedText: 'Uploaded',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedItem(
                        title: 'Caste certificate',
                        fileName: 'caste_cert.pdf',
                        size: '1.1 MB',
                        uploadedText: 'Uploaded',
                      ),

                      const SizedBox(height: 24),
                      Ux4gButton(text: 'Proceed to review', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 40),
                      const SizedBox(height: 12),
                      Ux4gButton(text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, height: 40),
                    ],
                  ),
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: isDark ? Colors.white : null),
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

class _DocumentUploadSuccessMockup extends StatelessWidget {
  const _DocumentUploadSuccessMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Ux4gAppHeader(
                variant:
                    isDark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(
                    _nationalEmblemLogoPath,
                    height: 40,
                    colorFilter: isDark
                        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                        : null,
                  ),
                  Container(
                    height: 32,
                    width: 1,
                    color: isDark
                        ? Ux4gColors.neutral700
                        : Ux4gColors.neutral200,
                  ),
                  SvgPicture.asset(
                    _unionLogoPath,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      isDark
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
                          color: isDark
                              ? Ux4gColors.neutral800
                              : const Color(0xFFE5E7EB),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu,
                          color: isDark
                              ? Ux4gColors.primary400
                              : Ux4gColors.primary600,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
                verticalPadding: 16,
                horizontalPadding: 16,
                leadingSpacing: 8,
              ),
              Divider(
                height: 1,
                color: isDark
                    ? Ux4gColors.neutral800
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
                          Ux4gStepItem(
                            title: 'Submit',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Upload documents',
                        style: (Theme.of(context)
                                    .extension<Ux4gTypography>()
                                    ?.hM_strong ??
                                defaultUx4gTypography.hM_strong)
                            .copyWith(
                          color: isDark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'PDF or JPG, max 5 MB each. Self-attested.',
                        style: (Theme.of(context)
                                    .extension<Ux4gTypography>()
                                    ?.bS_default ??
                                defaultUx4gTypography.bS_default)
                            .copyWith(
                          color: isDark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'All required documents uploaded — 4 of 4',
                        style: (Theme.of(context)
                                    .extension<Ux4gTypography>()
                                    ?.lL_strong ??
                                defaultUx4gTypography.lL_strong)
                            .copyWith(
                          color: isDark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Ux4gLinearProgressBar(
                        value: 1.0,
                        height: 6,
                        shape: Ux4gProgressShape.rounded,
                        gradientColors: isDark
                            ? const [Ux4gColors.primary400, Ux4gColors.primary200]
                            : const [Ux4gColors.primary300, Ux4gColors.primary600],
                        trackColor: isDark
                            ? Ux4gColors.neutral800
                            : const Color(0xFFE5E7EB),
                      ),
                      const SizedBox(height: 24),

                      // Success Banner
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _getUploadedBg(context),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _getUploadedBorder(context),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: _getUploadedIcon(context),
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'All required documents uploaded.',
                                    style: (Theme.of(context)
                                                .extension<Ux4gTypography>()
                                                ?.bS_default ??
                                            defaultUx4gTypography.bS_default)
                                        .copyWith(
                                      color: _getUploadedText(context),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getSuccessTagBg(context),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Success',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: _getUploadedText(context),
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

                      const _UploadedItem(
                        title: 'Aadhaar Card',
                        fileName: 'aadhaar_card.pdf',
                        size: '1.2 MB',
                        uploadedText: 'Uploaded just now',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedItem(
                        title: 'Proof of Income',
                        fileName: 'income_proof.pdf',
                        size: '1.8 MB',
                        uploadedText: 'Uploaded',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedItem(
                        title: 'Residence proof',
                        fileName: 'electricity_bill.jpg',
                        size: '920 KB',
                        uploadedText: 'Uploaded',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedItem(
                        title: 'Caste certificate',
                        fileName: 'caste_cert.pdf',
                        size: '1.1 MB',
                        uploadedText: 'Uploaded',
                      ),

                      const SizedBox(height: 32),
                      Text(
                        'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark
                              ? Ux4gColors.neutral300
                              : Ux4gColors.neutral600,
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
                      text: 'Proceed to review',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 40,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 40,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(
                        fontSize: 11,
                        color: isDark
                            ? Ux4gColors.neutral500
                            : Ux4gColors.neutral400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 22,
                      color: isDark
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

class _DocumentUploadSuccessCardMockup extends StatelessWidget {
  const _DocumentUploadSuccessCardMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: _getCardBg(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: isDark
                    ? Ux4gColors.neutral900
                    : Ux4gColors.neutral0,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant:
                          isDark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
                      title: '',
                      leadingWidgets: [
                        SvgPicture.asset(
                          _nationalEmblemLogoPath,
                          height: 40,
                          colorFilter: isDark
                              ? const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                        Container(
                          height: 32,
                          width: 1,
                          color: isDark
                              ? Ux4gColors.neutral700
                              : Ux4gColors.neutral200,
                        ),
                        SvgPicture.asset(
                          _unionLogoPath,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            isDark
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
                                color: isDark
                                    ? Ux4gColors.neutral800
                                    : const Color(0xFFE5E7EB),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.menu,
                                color: isDark
                                    ? Ux4gColors.primary400
                                    : Ux4gColors.primary600,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                      verticalPadding: 16,
                      horizontalPadding: 16,
                      leadingSpacing: 8,
                    ),
                    Divider(
                      height: 1,
                      color: isDark
                          ? Ux4gColors.neutral800
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
                      color: isDark
                          ? Ux4gColors.neutral900
                          : Ux4gColors.neutral0,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
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
                            Ux4gStepItem(
                              title: 'Submit',
                              titleStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Upload documents',
                          style: (Theme.of(context)
                                      .extension<Ux4gTypography>()
                                      ?.hM_strong ??
                                  defaultUx4gTypography.hM_strong)
                              .copyWith(
                            color: isDark
                                ? Ux4gColors.neutral50
                                : Ux4gColors.neutral900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'PDF or JPG, max 5 MB each. Self-attested.',
                          style: (Theme.of(context)
                                      .extension<Ux4gTypography>()
                                      ?.bS_default ??
                                  defaultUx4gTypography.bS_default)
                              .copyWith(
                            color: isDark
                                ? Ux4gColors.neutral400
                                : Ux4gColors.neutral500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'All required documents uploaded — 4 of 4',
                          style: (Theme.of(context)
                                      .extension<Ux4gTypography>()
                                      ?.lL_strong ??
                                  defaultUx4gTypography.lL_strong)
                              .copyWith(
                            color: isDark
                                ? Ux4gColors.neutral50
                                : Ux4gColors.neutral900,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Ux4gLinearProgressBar(
                          value: 1.0,
                          height: 6,
                          shape: Ux4gProgressShape.rounded,
                          gradientColors: isDark
                              ? const [Ux4gColors.primary400, Ux4gColors.primary200]
                              : const [Ux4gColors.primary300, Ux4gColors.primary600],
                          trackColor: isDark
                              ? Ux4gColors.neutral800
                              : const Color(0xFFE5E7EB),
                        ),
                        const SizedBox(height: 24),

                        // Success Banner
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _getUploadedBg(context),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _getUploadedBorder(context),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: _getUploadedIcon(context),
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'All required documents uploaded.',
                                      style: (Theme.of(context)
                                                  .extension<Ux4gTypography>()
                                                  ?.bS_default ??
                                              defaultUx4gTypography.bS_default)
                                          .copyWith(
                                        color: _getUploadedText(context),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getSuccessTagBg(context),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        'Success',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: _getUploadedText(context),
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

                        const _UploadedItem(
                          title: 'Aadhaar Card',
                          fileName: 'aadhaar_card.pdf',
                          size: '1.2 MB',
                          uploadedText: 'Uploaded just now',
                        ),
                        const SizedBox(height: 16),
                        const _UploadedItem(
                          title: 'Proof of Income',
                          fileName: 'income_proof.pdf',
                          size: '1.8 MB',
                          uploadedText: 'Uploaded',
                        ),
                        const SizedBox(height: 16),
                        const _UploadedItem(
                          title: 'Residence proof',
                          fileName: 'electricity_bill.jpg',
                          size: '920 KB',
                          uploadedText: 'Uploaded',
                        ),
                        const SizedBox(height: 16),
                        const _UploadedItem(
                          title: 'Caste certificate',
                          fileName: 'caste_cert.pdf',
                          size: '1.1 MB',
                          uploadedText: 'Uploaded',
                        ),

                        const SizedBox(height: 24),
                        Ux4gButton(
                          text: 'Proceed to review',
                          onPressed: () {},
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 40,
                        ),
                        const SizedBox(height: 12),
                        Ux4gButton(
                          text: 'Back',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                        color: isDark
                            ? Ux4gColors.neutral500
                            : Ux4gColors.neutral400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 22,
                      color: isDark
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

class _UploadedItem extends StatelessWidget {
  final String title, fileName, size, uploadedText;
  const _UploadedItem({
    required this.title,
    required this.fileName,
    required this.size,
    required this.uploadedText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getUploadedBg(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getUploadedBorder(context),
        ),
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _getUploadedTitle(context),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$fileName · $size · $uploadedText',
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
          const SizedBox(height: 16),
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
                contentColor: _getUploadedBtnText(context),
                borderColor: _getUploadedBtnBorder(context),
              ),
              Ux4gButton(
                text: 'Re-upload',
                onPressed: () {},
                variant: Ux4gButtonVariant.outline,
                size: Ux4gButtonSize.small,
                width: 120,
                height: 40,
                contentColor: _getUploadedBtnText(context),
                borderColor: _getUploadedBtnBorder(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
