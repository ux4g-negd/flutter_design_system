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
    Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green900 : Ux4gColors.green50;
Color _getUploadedBorder(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green600 : Ux4gColors.green300;
Color _getUploadedText(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green300 : Ux4gColors.green800;
Color _getUploadedIcon(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green500 : Ux4gColors.green600;
Color _getSuccessTagBg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green800 : Ux4gColors.green100;
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
              ? _DocumentUploadSuccessCardMockup()
              : _DocumentUploadSuccessMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Shared helpers
// ───────────────────────────────────────────────────────────────────────

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 760,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
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

const _documentUploadSuccessDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentUploadSuccessScreen extends StatelessWidget {
  const DocumentUploadSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.neutral900
          : Ux4gColors.neutral50,
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
            Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),

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
                    const SizedBox(height: 32),

                    Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 4),
                    Text('PDF or JPG, max 5 MB each. Self-attested.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                    const SizedBox(height: 20),

                    const Text('All 4 documents uploaded', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 20),

                    // Success Banner
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _getUploadedBg(context),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _getUploadedBorder(context), width: 1.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: _getUploadedIcon(context), size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('All required documents uploaded.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(color: _getUploadedText(context))),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: _getSuccessTagBg(context), borderRadius: BorderRadius.circular(4)),
                                  child: Text('Success', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: _getUploadedText(context))),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Document Cards
                    _UploadedItem(title: 'Aadhaar Card', fileName: 'aadhaar_card.pdf', size: '1.2 MB'),
                    const SizedBox(height: 16),
                    _UploadedItem(title: 'Proof of Income', fileName: 'income_proof.pdf', size: '1.8 MB'),
                    const SizedBox(height: 16),
                    _UploadedItem(title: 'Residence proof', fileName: 'electricity_bill.jpg', size: '920 KB'),
                    const SizedBox(height: 16),
                    _UploadedItem(title: 'Caste certificate', fileName: 'caste_cert.pdf', size: '1.1 MB'),

                    const SizedBox(height: 32),
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
                  Ux4gButton(text: 'Proceed to review', onPressed: () {}, size: Ux4gButtonSize.medium, width: double.infinity, height: 48),
                  const SizedBox(height: 12),
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
                  const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                  const SizedBox(height: 6),
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

class _UploadedItem extends StatelessWidget {
  final String title, fileName, size;
  const _UploadedItem({required this.title, required this.fileName, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 4),
                    Text('$fileName · $size · Uploaded just now', style: const TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Ux4gButton(text: 'View', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 100, height: 48, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
              const SizedBox(width: 12),
              Ux4gButton(text: 'Re-upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 120, height: 48, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
            ],
          ),
        ],
      ),
    );
  }
}
""";

const _documentUploadSuccessCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentUploadSuccessCardScreen extends StatelessWidget {
  const DocumentUploadSuccessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F3FF),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
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
                  Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),
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
                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ux4gStepper(
                        totalSteps: 4, currentStep: 3, stepSize: 20,
                        steps: const [
                          Ux4gStepItem(title: 'Eligibility', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: 'Personal', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: 'Documents', titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                          Ux4gStepItem(title: ''),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900, height: 1.2)),
                      const SizedBox(height: 4),
                      Text('All required documents uploaded.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                      const SizedBox(height: 32),

                      _UploadedItem(title: 'Aadhaar Card', fileName: 'aadhaar_card.pdf', size: '1.2 MB'),
                      const SizedBox(height: 16),
                      _UploadedItem(title: 'Residence proof', fileName: 'electricity_bill.jpg', size: '920 KB'),
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
                  Ux4gButton(text: 'Proceed to review', onPressed: () {}, size: Ux4gButtonSize.medium, width: double.infinity, height: 48),
                  const SizedBox(height: 12),
                  Ux4gButton(text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.medium, width: double.infinity, height: 48),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                  const SizedBox(height: 6),
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

class _UploadedItem extends StatelessWidget {
  final String title, fileName, size;
  const _UploadedItem({required this.title, required this.fileName, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                    const SizedBox(height: 4),
                    Text('$fileName · $size · Uploaded', style: const TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Ux4gButton(text: 'View', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 80, height: 48),
              const SizedBox(width: 12),
              Ux4gButton(text: 'Re-upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 110, height: 48),
            ],
          ),
        ],
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _DocumentUploadSuccessMockup extends StatelessWidget {
  _DocumentUploadSuccessMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(_nationalEmblemLogoPath, height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                  Container(
                    height: 32,
                    width: 1,
                    color: Color(0xFFD1D5DB),
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
              Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),
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
    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
  ),
),
SizedBox(height: 4),
                      Text(
  'PDF or JPG, max 5 MB each. Self-attested.',
  style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
  ),
),
                      SizedBox(height: 20),
                      Text(
                        'All 4 documents uploaded',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Success Banner
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _getUploadedBg(context),
                          borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _getUploadedBorder(context), width: 1.0),
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
                                    style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
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

                      const _UploadedMockItem(
                        title: 'Aadhaar Card',
                        fileName: 'aadhaar_card.pdf',
                        size: '1.2 MB',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedMockItem(
                        title: 'Proof of Income',
                        fileName: 'income_proof.pdf',
                        size: '1.8 MB',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedMockItem(
                        title: 'Residence proof',
                        fileName: 'electricity_bill.jpg',
                        size: '920 KB',
                      ),
                      const SizedBox(height: 16),
                      const _UploadedMockItem(
                        title: 'Caste certificate',
                        fileName: 'caste_cert.pdf',
                        size: '1.1 MB',
                      ),

                      const SizedBox(height: 32),
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
                      size: Ux4gButtonSize.medium,
                      width: double.infinity,
                      height: 48,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.medium,
                      width: double.infinity,
                      height: 48,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                    ),
                    const SizedBox(height: 6),
                    Image.asset(_digitalIndiaLogoPath, height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
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
  _DocumentUploadSuccessCardMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: _getCardBg(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: Ux4gAppHeaderVariant.light,
                      title: '',
                      leadingWidgets: [
                        SvgPicture.asset(_nationalEmblemLogoPath, height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                        Container(
                          height: 32,
                          width: 1,
                          color: Color(0xFFD1D5DB),
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
                    Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200),
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
                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
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
    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
  ),
),
SizedBox(height: 4),
                        Text(
  'All required documents uploaded.',
  style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
  ),
),
                        const SizedBox(height: 32),

                        const _UploadedMockItem(
                          title: 'Aadhaar Card',
                          fileName: 'aadhaar_card.pdf',
                          size: '1.2 MB',
                        ),
                        const SizedBox(height: 16),
                        const _UploadedMockItem(
                          title: 'Residence proof',
                          fileName: 'electricity_bill.jpg',
                          size: '920 KB',
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
                      text: 'Proceed to review',
                      onPressed: () {},
                      size: Ux4gButtonSize.medium,
                      width: double.infinity,
                      height: 48,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.medium,
                      width: double.infinity,
                      height: 48,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                    ),
                    const SizedBox(height: 6),
                    Image.asset(_digitalIndiaLogoPath, height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
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

class _UploadedMockItem extends StatelessWidget {
  final String title, fileName, size;
  const _UploadedMockItem({
    required this.title,
    required this.fileName,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '$fileName · $size · Uploaded just now',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Ux4gButton(
                text: 'View',
                onPressed: () {},
                variant: Ux4gButtonVariant.outline,
                size: Ux4gButtonSize.small,
                width: 80,
              ),
              const SizedBox(width: 12),
              Ux4gButton(
                text: 'Re-upload',
                onPressed: () {},
                variant: Ux4gButtonVariant.outline,
                size: Ux4gButtonSize.small,
                width: 110,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
