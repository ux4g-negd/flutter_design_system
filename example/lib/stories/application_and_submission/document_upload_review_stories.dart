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
    Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50;


Color _getUploadedBg(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.green900 : Ux4gPalette.green50;
Color _getUploadedBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.green800 : const Color(0xFFDCFCE7);
Color _getUploadedIcon(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.green500 : Ux4gPalette.green600;
Color _getUploadedTitle(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
Color _getUploadedDesc(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700;
Color _getUploadedBtnText(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
Color _getUploadedBtnBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.primary600 : Ux4gPalette.primary300;

Color _getReviewBg(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.orange900 : const Color(0xFFFFF7E6);
Color _getReviewBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.orange800 : const Color(0xFFFFD591);
Color _getReviewIcon(BuildContext context) =>
    _isDarkMode(context) ? Ux4gPalette.orange500 : const Color(0xFFD46B08);

const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final documentUploadReviewComponent = WidgetbookComponent(
  name: 'Document upload with review',
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
            ? _documentReviewCardCode
            : _documentReviewDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Document upload with review',
          description:
              'A pattern demonstrating documents that require review or re-upload action.',
          code: code,
          center: true,
          child: isCardStyle
              ? _DocumentReviewCardMockup()
              : _DocumentReviewMockup(),
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
            ? Ux4gPalette.neutral900
            : Ux4gPalette.neutral50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Ux4gPalette.neutral700
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

const _documentReviewDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentReviewScreen extends StatelessWidget {
  const DocumentReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Theme.of(context).brightness == Brightness.dark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                Container(height: 32, width: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200),
                SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.primary300
                        : Ux4gPalette.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : const Color(0xFFE5E7EB)),

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

                    Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                    SizedBox(height: 4),
                    Text('PDF or JPG, max 5 MB each. Self-attested.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500)),
                    SizedBox(height: 24),

                    Text('Required documents — 1 of 4 uploaded', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                    SizedBox(height: 24),

                    // Aadhaar Card (Uploaded)
                    
                      ],
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 12, runSpacing: 12,
                            children: [
                              Ux4gButton(text: 'Re-upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 120,
                      height: 40, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
                              Ux4gButton(text: 'View', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 90),
                              Ux4gButton(text: 'Keep', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 90),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Caste Certificate
                    _PendingItem(title: 'Caste certificate', subtitle: 'SC/ST/OBC applicants only', badge: 'Optional'),

                    SizedBox(height: 32),
                    Text(
                      'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                      style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral600, height: 1.4),
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
                  Ux4gButton(text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
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

class _UploadedItem extends StatelessWidget {
  final String title, fileName, size;
  
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Ux4gButton(text: 'Upload', onPressed: () {}, size: Ux4gButtonSize.small, width: 100),
        ],
      ),
    );
  }
}
""";

const _documentReviewCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentReviewCardScreen extends StatelessWidget {
  const DocumentReviewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Theme.of(context).brightness == Brightness.dark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
                    leadingWidgets: [
                      SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                      Container(height: 32, width: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200),
                      SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.primary300
                        : Ux4gPalette.primary600,
                    BlendMode.srcIn,
                  ),
                ),
                    ],
                  ),
                  Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : const Color(0xFFE5E7EB)),
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
                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
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
                      SizedBox(height: 32),
                      Text('Upload documents', style: Theme.of(context).extension<Ux4gTypography>()?.hM_strong?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                      SizedBox(height: 4),
                      Text('Please review flagged items.', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith( color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500)),
                      SizedBox(height: 24),

                      _UploadedItem(title: 'Aadhaar Card', fileName: 'aadhaar_card.pdf', size: '1.2 MB'),
                      SizedBox(height: 16),

                      // Residence proof (Review State)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _getReviewBg(context),
                          borderRadius: BorderRadius.circular(12),
                          
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.error, color: _getReviewIcon(context), size: 20),
                                SizedBox(width: 12),
                                Text('Residence proof', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                              ],
                            ),
                            SizedBox(height: 16),
                            Wrap(
                              spacing: 12, runSpacing: 12,
                              children: [
                                Ux4gButton(text: 'Re-upload', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 120,
                      height: 40, contentColor: _getUploadedBtnText(context), borderColor: _getUploadedBtnBorder(context)),
                                Ux4gButton(text: 'View', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 90),
                                Ux4gButton(text: 'Keep', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.small, width: 90),
                              ],
                            ),
                          ],
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
                  Ux4gButton(text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
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
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _DocumentReviewMockup extends StatelessWidget {
  _DocumentReviewMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Ux4gPalette.neutral900
            : Ux4gPalette.neutral50,
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
                        ? Ux4gPalette.neutral700
                        : Ux4gPalette.neutral200,
                  ),
                  SvgPicture.asset(
                    _unionLogoPath,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.primary300
                          : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Ux4gPalette.neutral700
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
                              ? Ux4gPalette.neutral50
                              : Ux4gPalette.neutral900,
  ),
),
SizedBox(height: 4),
                      Text(
  'PDF or JPG, max 5 MB each. Self-attested.',
  style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral400
                              : Ux4gPalette.neutral500,
  ),
),
                      SizedBox(height: 24),
                      Text(
                        'Required documents — 1 of 4 uploaded',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral50
                              : Ux4gPalette.neutral900,
                        ),
                      ),
                      SizedBox(height: 24),

                      _UploadedItem(
                        title: 'Aadhaar Card',
                        fileName: 'aadhaar_card.pdf',
                        size: '1.2 MB',
                      ),
                      SizedBox(height: 16),
                      _UploadedItem(
                        title: 'Proof of Income',
                        fileName: 'income_proof.pdf',
                        size: '1.8 MB',
                      ),
                      SizedBox(height: 16),

                      // Residence proof (Review State)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _getReviewBg(context),
                          borderRadius: BorderRadius.circular(12),
                          
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.error,
                                  color: _getReviewIcon(context),
                                  size: 20,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Residence proof',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral50
                                        : Ux4gPalette.neutral900,
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
                                  text: 'Re-upload',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  width: 120,
                                  height: 40,
                                ),
                                Ux4gButton(
                                  text: 'View',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  width: 90,
                                  height: 40,
                                ),
                                Ux4gButton(
                                  text: 'Keep',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                  size: Ux4gButtonSize.small,
                                  width: 90,
                                  height: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),

                      const _PendingItem(
                        title: 'Caste certificate',
                        subtitle: 'SC/ST/OBC applicants only',
                        badge: 'Optional',
                      ),

                      SizedBox(height: 32),
                      Text(
                        'All documents must be self-attested. AI flags quality issues; officers make the final call.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral300
                              : Ux4gPalette.neutral600,
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
                            ? Ux4gPalette.neutral500
                            : Ux4gPalette.neutral400,
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

class _DocumentReviewCardMockup extends StatelessWidget {
  _DocumentReviewCardMockup();

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
                    ? Ux4gPalette.neutral900
                    : Ux4gPalette.neutral0,
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
                              ? Ux4gPalette.neutral700
                              : Ux4gPalette.neutral200,
                        ),
                        SvgPicture.asset(
                          _unionLogoPath,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.neutral700
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
                          ? Ux4gPalette.neutral900
                          : Ux4gPalette.neutral0,
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
                                ? Ux4gPalette.neutral50
                                : Ux4gPalette.neutral900,
  ),
),
SizedBox(height: 4),
                        Text(
  'Please review flagged items.',
  style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(
    color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral400
                                : Ux4gPalette.neutral500,
  ),
),
                        SizedBox(height: 24),

                        _UploadedItem(
                          title: 'Aadhaar Card',
                          fileName: 'aadhaar_card.pdf',
                          size: '1.2 MB',
                        ),
                        SizedBox(height: 16),

                        // Residence proof (Review State)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _getReviewBg(context),
                            borderRadius: BorderRadius.circular(12),
                            
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: _getReviewIcon(context),
                                    size: 20,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Residence proof',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.neutral50
                                          : Ux4gPalette.neutral900,
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
                                    text: 'Re-upload',
                                    onPressed: () {},
                                    variant: Ux4gButtonVariant.outline,
                                    size: Ux4gButtonSize.small,
                                    width: 120,
                                    height: 40,
                                  ),
                                  Ux4gButton(
                                    text: 'View',
                                    onPressed: () {},
                                    variant: Ux4gButtonVariant.outline,
                                    size: Ux4gButtonSize.small,
                                    width: 90,
                                    height: 40,
                                  ),
                                  Ux4gButton(
                                    text: 'Keep',
                                    onPressed: () {},
                                    variant: Ux4gButtonVariant.outline,
                                    size: Ux4gButtonSize.small,
                                    width: 90,
                                    height: 40,
                                  ),
                                ],
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
                            ? Ux4gPalette.neutral500
                            : Ux4gPalette.neutral400,
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

class _UploadedItem extends StatelessWidget {
  final String title, fileName, size;
  _UploadedItem({
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
        border: Border.all(color: const Color(0xFFDCFCE7)),
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral50
                            : Ux4gPalette.neutral900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '$fileName · $size · Uploaded just now',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral400
                            : Ux4gPalette.neutral500,
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
    );
  }
}

class _PendingItem extends StatelessWidget {
  final String title, subtitle, badge;
  const _PendingItem({
    required this.title,
    required this.subtitle,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gPalette.neutral900
            : Ux4gPalette.neutral0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Ux4gPalette.neutral700
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
                        ? Ux4gPalette.neutral700
                        : Ux4gPalette.neutral200,
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
                                ? Ux4gPalette.neutral50
                                : Ux4gPalette.neutral900,
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
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral800
                                : Ux4gPalette.neutral100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral300
                                  : Ux4gPalette.neutral700,
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
                            ? Ux4gPalette.neutral400
                            : Ux4gPalette.neutral500,
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
        ],
      ),
    );
  }
}
