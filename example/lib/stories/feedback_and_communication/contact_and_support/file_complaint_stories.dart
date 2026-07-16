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

Color _getCardBg(BuildContext context) => _isDark(context) ? const Color(0xFF1A1A1A) : Colors.white;

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
              'Switch between the standard layout and the card-style layout '
              'with a light purple background.',
        );

        final isCard = variant == 'Card Style';

        return ComponentDocs(
          mobileMockup: true,
          name: 'File a Complaint ($variant)',
          description: isCard
              ? 'Complaint form with subject, category dropdown, and description '
                    'inside a card container with light purple background.'
              : 'Complaint form with subject, category dropdown, and description on white background.',
          code: isCard ? _fileComplaintCardCode : _fileComplaintDefaultCode,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
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
                      Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                      BlendMode.srcIn,
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
                    Text('File a complaint',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('Report a portal issue — we will respond within 2 working days.',
                        style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
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
                  ],
                ),
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'Submit complaint',
                      variant: Ux4gButtonVariant.primary,
                      size: Ux4gButtonSize.large,
                      height: 48,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'Cancel',
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      height: 48,
                      borderColor: const Color(0xFF432CBB),
                      contentColor: const Color(0xFF432CBB),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
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
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFFF),
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
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
                      Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
              ],
            ),
            // White card content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Ux4gCard(
                  backgroundColor: Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('File a complaint',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text('Report a portal issue — we will respond within 2 working days.',
                            style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'Submit complaint',
                      variant: Ux4gButtonVariant.primary,
                      size: Ux4gButtonSize.large,
                      height: 48,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'Cancel',
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      height: 48,
                      borderColor: const Color(0xFF432CBB),
                      contentColor: const Color(0xFF432CBB),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
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
    return Theme(
      data: Ux4gTheme.themeData(isDark: _isDark(context)),
      child: Scaffold(
        backgroundColor: isCard ? (_isDark(context) ? Ux4gColors.primary800 : Ux4gColors.primary100) : _getScaffoldBg(context),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                elevation: 2,
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingSpacing: 8,
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem,
                    height: 40,
                    colorFilter: _isDark(context) ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
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
                      _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600,
                      BlendMode.srcIn,
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
                            child: _buildContent(context),
                          ),
                        )
                      : _buildContent(context),
                ),
              ),

              // Buttons at bottom
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Submit complaint',
                        variant: Ux4gButtonVariant.primary,
                        size: Ux4gButtonSize.large,
                        height: 48,
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Cancel',
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        height: 48,
                        borderColor: _primaryColor,
                        contentColor: _primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              // Powered by
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
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
                      errorBuilder: (_, __, ___) => Text(
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

  Widget _buildContent(BuildContext context) {
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
          'Report a portal issue — we will respond within 2 working days.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        SizedBox(height: 24),

        // Subject
        Text(
          'Subject',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 6),
        Ux4gInputField(
          value: '',
          onValueChange: (_) {},
          placeholder: 'Briefly describe the issue',
          placeholderStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9CA3AF),
          ),
        ),
        SizedBox(height: 20),

        // Category
        Text(
          'Category',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 6),
        Ux4gInputField(
          value: '',
          onValueChange: (_) {},
          placeholder: 'Select Category',
          placeholderStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9CA3AF),
          ),
          trailingIcon: Icons.keyboard_arrow_down,
          readOnly: true,
        ),
        SizedBox(height: 20),

        // Description
        Text(
          'Description',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 6),
        Ux4gInputField(
          value: '',
          onValueChange: (_) {},
          placeholder: 'Tell us what happened, when, and what you expect',
          placeholderStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9CA3AF),
          ),
          maxLines: 4,
        ),
      ],
    );
  }
}
