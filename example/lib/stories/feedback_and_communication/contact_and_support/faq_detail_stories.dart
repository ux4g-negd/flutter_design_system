import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────

// ignore: unused_element
bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

// ignore: unused_element
Color _getTitleColor(BuildContext context) => _isDark(context) ? Colors.white : const Color(0xFF111827);

// ignore: unused_element
Color _getSubtleText(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563);

// ignore: unused_element
Color _getBorderColor(BuildContext context) => _isDark(context) ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB);

// ignore: unused_element
Color _getScaffoldBg(BuildContext context) => _isDark(context) ? Ux4gColors.neutral900 : Colors.white;

// ignore: unused_element
Color _getCardBg(BuildContext context) => _isDark(context) ? Ux4gColors.neutral800 : Colors.white;

// ignore: unused_element
const _primaryColor = Color(0xFF432CBB);

class _FaqItem {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});
}

const _faqItems = [
  _FaqItem(
    question: 'How do I track my application ?',
    answer:
        'Sign in to the portal, open My Applications, and tap your active application. '
        'The Status Tracker shows every milestone — Submitted, Documents Verified, Under Review, Decision. '
        'SLA timer shows expected completion date.',
  ),
  _FaqItem(
    question: 'My application was rejected — what next?',
    answer:
        'If your application was rejected, you can review the rejection reason in your application details. '
        'You may reapply after addressing the issues mentioned, or file a grievance if you believe the decision was incorrect.',
  ),
  _FaqItem(
    question: 'How do I upload missing documents?',
    answer:
        'Go to My Applications, select the application, and tap "Upload Documents". '
        'You can upload scanned copies or photos of the required documents. Supported formats: PDF, JPG, PNG (max 5MB each).',
  ),
  _FaqItem(
    question: 'When will I receive my certificate?',
    answer:
        'Certificate issuance typically takes 7-15 working days after approval. '
        'You will receive an SMS and email notification once your certificate is ready for download.',
  ),
  _FaqItem(
    question: 'How do I contact a Revenue officer?',
    answer:
        'You can contact the Revenue officer through the Help section in the app, '
        'or visit your nearest Tehsil office during working hours (10 AM - 5 PM, Mon-Fri).',
  ),
];

// ── Component ────────────────────────────────────────────────────────────

final faqDetailComponent = WidgetbookComponent(
  name: 'FAQ Detail',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card Style'],
          initialOption: 'Default',
          description:
              'Switch between the standard layout and the card-style layout '
              'with a light purple background.',
        );

        final isCard = variant == 'Card Style';

        return ComponentDocs(
          mobileMockup: true,
          name: 'FAQ Detail ($variant)',
          description: isCard
              ? 'FAQ detail page with breadcrumb, answer content, and related '
                    'questions accordion inside a card with purple background.'
              : 'FAQ detail page with breadcrumb, answer content, and related '
                    'questions accordion on white background.',
          code: isCard ? _faqDetailCardCode : _faqDetailDefaultCode,
          center: true,
          child: _FaqDetailMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _faqDetailDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class FaqDetailScreen extends StatefulWidget {
  const FaqDetailScreen({super.key});

  @override
  State<FaqDetailScreen> createState() => _FaqDetailScreenState();
}

class _FaqDetailScreenState extends State<FaqDetailScreen> {
  int? _expandedIndex = 0;

  static const _faqList = [
    (
      'How do I track my application ?',
      'Sign in to the portal, open My Applications, and tap your active application. The Status Tracker shows every milestone — Submitted, Documents Verified, Under Review, Decision. SLA timer shows expected completion date.',
    ),
    (
      'My application was rejected — what next?',
      'If your application was rejected, you can review the rejection reason in your application details. You may reapply after addressing the issues mentioned, or file a grievance if you believe the decision was incorrect.',
    ),
    (
      'How do I upload missing documents?',
      'Go to My Applications, select the application, and tap "Upload Documents". You can upload scanned copies or photos of the required documents. Supported formats: PDF, JPG, PNG (max 5MB each).',
    ),
    (
      'When will I receive my certificate?',
      'Certificate issuance typically takes 7-15 working days after approval. You will receive an SMS and email notification once your certificate is ready for download.',
    ),
    (
      'How do I contact a Revenue officer?',
      'You can contact the Revenue officer through the Help section in the app, or visit your nearest Tehsil office during working hours (10 AM - 5 PM, Mon-Fri).',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral900 : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              verticalPadding: 16,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: isDark
                      ? const ColorFilter.mode(Ux4gColors.neutral50, BlendMode.srcIn)
                      : null,
                ),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
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
                  customWidget: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.neutral900 : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark
                              ? Ux4gColors.primary600
                              : const Color(0xFFC7D2FE),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Breadcrumb
                    Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 16,
                          color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          'Application Issues',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // FAQ Accordion List
                    for (int i = 0; i < _faqList.length; i++) ...[
                      InkWell(
                        onTap: () {
                          setState(() {
                            _expandedIndex = _expandedIndex == i ? null : i;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  _faqList[i].$1,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: isDark ? Colors.white : const Color(0xFF1F2937),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                _expandedIndex == i
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 22,
                                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF374151),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_expandedIndex == i)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            _faqList[i].$2,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                              height: 1.5,
                            ),
                          ),
                        ),
                      Ux4gDivider(
                        color: isDark ? Ux4gColors.neutral700 : const Color(0xFFF3F4F6),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 20),
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
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _faqDetailCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — FAQ detail inside a white card on purple background.
class FaqDetailCardScreen extends StatefulWidget {
  const FaqDetailCardScreen({super.key});

  @override
  State<FaqDetailCardScreen> createState() => _FaqDetailCardScreenState();
}

class _FaqDetailCardScreenState extends State<FaqDetailCardScreen> {
  int? _expandedIndex = 0;

  static const _faqList = [
    (
      'How do I track my application ?',
      'Sign in to the portal, open My Applications, and tap your active application. The Status Tracker shows every milestone — Submitted, Documents Verified, Under Review, Decision. SLA timer shows expected completion date.',
    ),
    (
      'My application was rejected — what next?',
      'If your application was rejected, you can review the rejection reason in your application details. You may reapply after addressing the issues mentioned, or file a grievance if you believe the decision was incorrect.',
    ),
    (
      'How do I upload missing documents?',
      'Go to My Applications, select the application, and tap "Upload Documents". You can upload scanned copies or photos of the required documents. Supported formats: PDF, JPG, PNG (max 5MB each).',
    ),
    (
      'When will I receive my certificate?',
      'Certificate issuance typically takes 7-15 working days after approval. You will receive an SMS and email notification once your certificate is ready for download.',
    ),
    (
      'How do I contact a Revenue officer?',
      'You can contact the Revenue officer through the Help section in the app, or visit your nearest Tehsil office during working hours (10 AM - 5 PM, Mon-Fri).',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.primary800 : const Color(0xFFF2EFFF),
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              verticalPadding: 16,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: isDark
                      ? const ColorFilter.mode(Ux4gColors.neutral50, BlendMode.srcIn)
                      : null,
                ),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
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
                  customWidget: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.neutral900 : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isDark
                              ? Ux4gColors.primary600
                              : const Color(0xFFC7D2FE),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              width: 16,
                              height: 2.2,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Ux4gColors.primary300
                                    : const Color(0xFF432CBB),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // White card content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Ux4gCard(
                  backgroundColor: isDark ? Ux4gColors.neutral800 : Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Breadcrumb
                        Row(
                          children: [
                            Icon(
                              Icons.home_outlined,
                              size: 16,
                              color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.chevron_right,
                                size: 16,
                                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                              ),
                            ),
                            Text(
                              'Help',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.chevron_right,
                                size: 16,
                                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
                              ),
                            ),
                            Text(
                              'Application Issues',
                              style: TextStyle(
                                fontSize: 14,
                                color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // FAQ Accordion List
                        for (int i = 0; i < _faqList.length; i++) ...[
                          InkWell(
                            onTap: () {
                              setState(() {
                                _expandedIndex = _expandedIndex == i ? null : i;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      _faqList[i].$1,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: isDark ? Colors.white : const Color(0xFF1F2937),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    _expandedIndex == i
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    size: 22,
                                    color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF374151),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_expandedIndex == i)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                _faqList[i].$2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          Ux4gDivider(
                            color: isDark ? Ux4gColors.neutral700 : const Color(0xFFF3F4F6),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 20),
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
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _FaqDetailMockup extends StatelessWidget {
  final bool isCard;

  const _FaqDetailMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isCard ? (isDark ? Ux4gColors.primary800 : const Color(0xFFF2EFFF)) : _getScaffoldBg(context),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                elevation: 2,
                verticalPadding: 16,
                leadingSpacing: 8,
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem,
                    height: 40,
                    colorFilter: isDark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
                  ),
                  SizedBox(
                    height: 32,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: const Color(0xFFD1D5DB),
                    ),
                  ),
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
                    customWidget: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.neutral900 : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isDark
                                ? Ux4gColors.primary600
                                : const Color(0xFFC7D2FE),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 16,
                                height: 2.2,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Ux4gColors.primary300
                                      : const Color(0xFF432CBB),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                width: 16,
                                height: 2.2,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Ux4gColors.primary300
                                      : const Color(0xFF432CBB),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                width: 16,
                                height: 2.2,
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? Ux4gColors.primary300
                                      : const Color(0xFF432CBB),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: isCard
                      ? Ux4gCard(
                          backgroundColor: _getCardBg(context),
                          cornerRadius: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: _buildContent(context, isDark),
                          ),
                        )
                      : _buildContent(context, isDark),
                ),
              ),

              // Powered by
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                    ),
                    SizedBox(width: 4),
                    Image.asset(
                      Ux4gIcons.digitalIndiaLogoPng, 
                      height: 20,
                      errorBuilder: (context, error, stackTrace) => Text(
                        'Digital India',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF432CBB),
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

  Widget _buildContent(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb
        Row(
          children: [
            Icon(
              Icons.home_outlined,
              size: 16,
              color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
            ),
            const SizedBox(width: 4),
            Text(
              'Home',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Icon(
                Icons.chevron_right,
                size: 16,
                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
              ),
            ),
            Text(
              'Help',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Icon(
                Icons.chevron_right,
                size: 16,
                color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
              ),
            ),
            Text(
              'Application Issues',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Related questions - Accordion
        _FaqAccordionList(isDark: isDark),
      ],
    );
  }
}

// ── FAQ Accordion with divider-only style ────────────────────────────────

class _FaqAccordionList extends StatefulWidget {
  final bool isDark;

  const _FaqAccordionList({required this.isDark});

  @override
  State<_FaqAccordionList> createState() => _FaqAccordionListState();
}

class _FaqAccordionListState extends State<_FaqAccordionList> {
  int? _expandedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_faqItems.length, (index) {
        final isExpanded = _expandedIndex == index;
        return Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _expandedIndex = isExpanded ? null : index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        _faqItems[index].question,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: widget.isDark ? Colors.white : const Color(0xFF1F2937),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      size: 22,
                      color: widget.isDark ? const Color(0xFF9CA3AF) : const Color(0xFF374151),
                    ),
                  ],
                ),
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  _faqItems[index].answer,
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                    height: 1.5,
                  ),
                ),
              ),
            Ux4gDivider(
              color: widget.isDark ? Ux4gColors.neutral700 : const Color(0xFFF3F4F6),
            ),
          ],
        );
      }),
    );
  }
}
