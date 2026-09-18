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
Color _getBreadcrumbColor(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

// ignore: unused_element
const _primaryColor = Color(0xFF432CBB);

// ── Component ────────────────────────────────────────────────────────────

final contactSupportComponent = WidgetbookComponent(
  name: 'Contact Support',
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
          name: 'Contact Support ($variant)',
          description: isCard
              ? 'Contact support page with multiple support channels inside a '
                    'card container with light purple background.'
              : 'Contact support page with multiple support channels on white background.',
          code: isCard ? _contactSupportCardCode : _contactSupportDefaultCode,
          center: true,
          child: _ContactSupportMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _contactSupportDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

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
                    Text(
                      'Still need help?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Contact our support team — we are here to help.',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Phone Support
                    SupportCard(
                      icon: Icons.phone,
                      title: 'Phone Support',
                      subtitle: '1800-XXX-XXXX · Toll free · Mon-Sat 9AM-6PM',
                      buttonText: 'Call Now',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    // Live Chat
                    SupportCard(
                      icon: Icons.chat_bubble_outline,
                      title: 'Live Chat',
                      subtitle: 'Available now · Estimated wait 1-2 minutes',
                      buttonText: 'Start Chat',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    // Email Support
                    SupportCard(
                      icon: Icons.mail_outline,
                      title: 'Emai Support',
                      subtitle: 'Response within 2 working days',
                      buttonText: 'Send Email',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    // Walk-in Centre
                    SupportCard(
                      icon: Icons.directions_walk,
                      title: 'Walk-in Centre',
                      subtitle: 'Visit your nearest Common Service Centre',
                      buttonText: 'Find CSC',
                      isOutline: true,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 28),
                    // File complaint link
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'File a complaint about this portal',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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

class SupportCard extends StatelessWidget {
  final dynamic icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isOutline;

  const SupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral800 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDark ? Ux4gColors.primary800 : const Color(0xFFEDE9FE),
                shape: BoxShape.circle,
              ),
              child: icon is IconData
                  ? Icon(
                      icon as IconData,
                      size: 20,
                      color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                    )
                  : Center(
                      child: SvgPicture.asset(
                        icon as String,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
            ),
            const SizedBox(width: 12),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Button
            isOutline
                ? Ux4gButton(
                    onPressed: onPressed,
                    text: buttonText,
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.small,
                    borderColor: isDark ? Ux4gColors.primary600 : const Color(0xFFC7D2FE),
                    contentColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                    borderRadius: 8,
                  )
                : Ux4gButton(
                    onPressed: onPressed,
                    text: buttonText,
                    variant: Ux4gButtonVariant.primary,
                    size: Ux4gButtonSize.small,
                    backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                    contentColor: isDark ? Colors.black : Colors.white,
                    borderRadius: 8,
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

const _contactSupportCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — contact support inside a white card on purple background.
class ContactSupportCardScreen extends StatelessWidget {
  const ContactSupportCardScreen({super.key});

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
                        Text(
                          'Still need help?',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Contact our support team — we are here to help.',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Phone Support
                        SupportCard(
                          icon: Icons.phone,
                          title: 'Phone Support',
                          subtitle: '1800-XXX-XXXX · Toll free · Mon-Sat 9AM-6PM',
                          buttonText: 'Call Now',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 12),
                        // Live Chat
                        SupportCard(
                          icon: Icons.chat_bubble_outline,
                          title: 'Live Chat',
                          subtitle: 'Available now · Estimated wait 1-2 minutes',
                          buttonText: 'Start Chat',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 12),
                        // Email Support
                        SupportCard(
                          icon: Icons.mail_outline,
                          title: 'Emai Support',
                          subtitle: 'Response within 2 working days',
                          buttonText: 'Send Email',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 12),
                        // Walk-in Centre
                        SupportCard(
                          icon: Icons.directions_walk,
                          title: 'Walk-in Centre',
                          subtitle: 'Visit your nearest Common Service Centre',
                          buttonText: 'Find CSC',
                          isOutline: true,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 28),
                        // File complaint link
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'File a complaint about this portal',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                              ),
                            ),
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

class _ContactSupportMockup extends StatelessWidget {
  final bool isCard;

  const _ContactSupportMockup({this.isCard = false});

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
        Text(
          'Still need help?',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Contact our support team — we are here to help.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        SizedBox(height: 24),

        // Phone Support
        _SupportCard(
          icon: Icons.phone,
          title: 'Phone Support',
          subtitle: '1800-XXX-XXXX · Toll free · Mon-Sat 9AM-6PM',
          buttonText: 'Call Now',
          onPressed: () {},
        ),
        SizedBox(height: 12),

        // Live Chat
        _SupportCard(
          icon: Icons.chat_bubble_outline,
          title: 'Live Chat',
          subtitle: 'Available now · Estimated wait 1-2 minutes',
          buttonText: 'Start Chat',
          onPressed: () {},
        ),
        SizedBox(height: 12),

        // Email Support
        _SupportCard(
          icon: Icons.mail_outline,
          title: 'Emai Support',
          subtitle: 'Response within 2 working days',
          buttonText: 'Send Email',
          onPressed: () {},
        ),
        SizedBox(height: 12),

        // Walk-in Centre
        _SupportCard(
          icon: Icons.directions_walk,
          title: 'Walk-in Centre',
          subtitle: 'Visit your nearest Common Service Centre',
          buttonText: 'Find CSC',
          isOutline: true,
          onPressed: () {},
        ),
        SizedBox(height: 28),

        // File complaint link
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'File a complaint about this portal',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// ── Support Card Widget ──────────────────────────────────────────────────

class _SupportCard extends StatelessWidget {
  final dynamic icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isOutline;

  const _SupportCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral800 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDark ? Ux4gColors.primary800 : const Color(0xFFEDE9FE),
                shape: BoxShape.circle,
              ),
              child: icon is IconData
                  ? Icon(
                      icon as IconData,
                      size: 20,
                      color: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                    )
                  : Center(
                      child: SvgPicture.asset(
                        icon as String,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
            ),
            SizedBox(width: 12),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: _getTitleColor(context),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: _getSubtleText(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Button
            isOutline
                ? Ux4gButton(
                    onPressed: onPressed,
                    text: buttonText,
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.small,
                    borderColor: isDark ? Ux4gColors.primary600 : const Color(0xFFC7D2FE),
                    contentColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                    borderRadius: 8,
                  )
                : Ux4gButton(
                    onPressed: onPressed,
                    text: buttonText,
                    variant: Ux4gButtonVariant.primary,
                    size: Ux4gButtonSize.small,
                    backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                    contentColor: isDark ? Colors.black : Colors.white,
                    borderRadius: 8,
                  ),
          ],
        ),
      ),
    );
  }
}
