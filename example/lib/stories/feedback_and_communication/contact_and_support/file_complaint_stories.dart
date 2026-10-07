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
Color _getScaffoldBg(BuildContext context) => _isDark(context) ? Ux4gColors.neutral950 : Colors.white;

// ignore: unused_element
Color _getCardBg(BuildContext context) => _isDark(context) ? Ux4gColors.neutral800 : Colors.white;

// ignore: unused_element
Color _getBreadcrumbColor(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

// ignore: unused_element
const _primaryColor = Color(0xFF432CBB);

// ── Component ────────────────────────────────────────────────────────────

final fileComplaintComponent = WidgetbookComponent(
  name: 'File a Complaint',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card Style'],
          initialOption: 'Default',
          description:
              'Switch between the standard form and the card-style layout '
              'with a light purple background.',
        );

        final isCard = variant == 'Card Style';

        return ComponentDocs(
          mobileMockup: true,
          name: 'File a Complaint ($variant)',
          description: isCard
              ? 'File a complaint form inside a card container with light purple background.'
              : 'File a complaint form with subject, category, and description fields.',
          code: isCard
              ? _fileComplaintCardCode
              : _fileComplaintDefaultCode,
          center: true,
          child: _FileComplaintMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _fileComplaintDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class FileComplaintScreen extends StatelessWidget {
  const FileComplaintScreen({super.key});

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
                const SizedBox(width: 8),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                const SizedBox(width: 8),
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
                    Text(
                      'File a complaint',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Submit your grievance regarding any portal service or transaction.',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Subject field
                    Text('Subject', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Ux4gInputField(
                      value: '',
                      onValueChange: (_) {},
                      placeholder: 'Briefly describe the issue',
                    ),
                    const SizedBox(height: 20),
                    // Category dropdown
                    Text('Category', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Ux4gInputField(
                      value: '',
                      onValueChange: (_) {},
                      placeholder: 'Select Category',
                      trailingIcon: Icons.keyboard_arrow_down,
                      readOnly: true,
                    ),
                    const SizedBox(height: 20),
                    // Description field
                    Text('Description', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Ux4gInputField(
                      value: '',
                      onValueChange: (_) {},
                      placeholder: 'Tell us what happened, when, and what you expect',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 28),
                    // Buttons
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Submit complaint',
                        variant: Ux4gButtonVariant.primary,
                        backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                        contentColor: isDark ? Colors.black : Colors.white,
                        borderRadius: 10,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Cancel',
                        variant: Ux4gButtonVariant.outline,
                        borderColor: isDark ? Ux4gColors.primary600 : const Color(0xFFC7D2FE),
                        contentColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                        borderRadius: 10,
                      ),
                    ),
                    const SizedBox(width: 8),
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

const _fileComplaintCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — file complaint form inside a white card on purple background.
class FileComplaintCardScreen extends StatelessWidget {
  const FileComplaintCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.primary800 : const Color(0xFFE2DCFF),
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
                const SizedBox(width: 8),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                const SizedBox(width: 8),
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
                        Text(
                          'File a complaint',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Submit your grievance regarding any portal service or transaction.',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Subject field
                        Text('Subject', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Ux4gInputField(
                          value: '',
                          onValueChange: (_) {},
                          placeholder: 'Briefly describe the issue',
                        ),
                        const SizedBox(height: 20),
                        // Category dropdown
                        Text('Category', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Ux4gInputField(
                          value: '',
                          onValueChange: (_) {},
                          placeholder: 'Select Category',
                          trailingIcon: Icons.keyboard_arrow_down,
                          readOnly: true,
                        ),
                        const SizedBox(height: 20),
                        // Description field
                        Text('Description', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Ux4gInputField(
                          value: '',
                          onValueChange: (_) {},
                          placeholder: 'Tell us what happened, when, and what you expect',
                          maxLines: 4,
                        ),
                        const SizedBox(height: 28),
                        // Buttons inside card
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Ux4gButton(
                            onPressed: () {},
                            text: 'Submit complaint',
                            variant: Ux4gButtonVariant.primary,
                            backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                            contentColor: isDark ? Colors.black : Colors.white,
                            borderRadius: 10,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Ux4gButton(
                            onPressed: () {},
                            text: 'Cancel',
                            variant: Ux4gButtonVariant.outline,
                            borderColor: isDark ? Ux4gColors.primary600 : const Color(0xFFC7D2FE),
                            contentColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                            borderRadius: 10,
                          ),
                        ),
                        const SizedBox(height: 16),
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

class _FileComplaintMockup extends StatelessWidget {
  final bool isCard;

  const _FileComplaintMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isCard ? (isDark ? Ux4gColors.primary800 : const Color(0xFFE2DCFF)) : _getScaffoldBg(context),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                elevation: 2,
                verticalPadding: 16,
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingSpacing: 8,
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
        Text(
          'File a complaint',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Submit your grievance regarding any portal service or transaction.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        SizedBox(height: 24),

        // Subject field
        Text('Subject', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _getTitleColor(context))),
        SizedBox(height: 6),
        Ux4gInputField(
          value: '',
          onValueChange: (_) {},
          placeholder: 'Briefly describe the issue',
        ),
        SizedBox(height: 20),

        // Category dropdown
        Text('Category', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _getTitleColor(context))),
        SizedBox(height: 6),
        Ux4gInputField(
          value: '',
          onValueChange: (_) {},
          placeholder: 'Select Category',
          trailingIcon: Icons.keyboard_arrow_down,
          readOnly: true,
        ),
        SizedBox(height: 20),

        // Description field
        Text('Description', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _getTitleColor(context))),
        SizedBox(height: 6),
        Ux4gInputField(
          value: '',
          onValueChange: (_) {},
          placeholder: 'Tell us what happened, when, and what you expect',
          maxLines: 4,
        ),
        SizedBox(height: 28),

        // Buttons
        SizedBox(
          width: double.infinity,
          height: 48,
          child: Ux4gButton(
            onPressed: () {},
            text: 'Submit complaint',
            variant: Ux4gButtonVariant.primary,
            backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
            contentColor: isDark ? Colors.black : Colors.white,
            borderRadius: 10,
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: Ux4gButton(
            onPressed: () {},
            text: 'Cancel',
            variant: Ux4gButtonVariant.outline,
            borderColor: isDark ? Ux4gColors.primary600 : const Color(0xFFC7D2FE),
            contentColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
            borderRadius: 10,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
