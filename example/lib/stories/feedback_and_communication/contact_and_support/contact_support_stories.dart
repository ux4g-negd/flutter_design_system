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

Color _getBorderColor(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral700 : const Color(0xFFE5E7EB);

// ignore: unused_element

Color _getScaffoldBg(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral950 : Colors.white;

// ignore: unused_element

Color _getCardBg(BuildContext context) => _isDark(context) ? const Color(0xFF1A1A1A) : Colors.white;

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
                      Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
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
                    Text('Still need help?',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('Contact our support team — we are here to help.',
                        style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
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
                      icon: Ux4gIcons.liveChat,
                      title: 'Live Chat',
                      subtitle: 'Available now · Estimated wait 1-2 minutes',
                      buttonText: 'Start Chat',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    // Email Support
                    SupportCard(
                      icon: Icons.email_outlined,
                      title: 'Email Support',
                      subtitle: 'Response within 2 working days',
                      buttonText: 'Send Email',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    // Walk-in Centre
                    SupportCard(
                      icon: Icons.person_pin_circle_outlined,
                      title: 'Walk-in Centre',
                      subtitle: 'Visit your nearest Common Service Centre',
                      buttonText: 'Find CSC',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    // File complaint link
                    Center(
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'File a complaint about this portal',
                        variant: Ux4gButtonVariant.ghost,
                        contentColor: const Color(0xFF432CBB),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
    return Ux4gCard(
      backgroundColor: isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral0,
      cornerRadius: 12,
      borderColor: isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200,
      borderWidth: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDark ? Ux4gPalette.primary800 : Ux4gPalette.primary100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: icon is IconData
                  ? Icon(
                      icon as IconData,
                      size: 20,
                      color: isDark ? Ux4gPalette.primary500 : Ux4gPalette.primary600,
                    )
                  : Center(
                      child: SvgPicture.asset(
                        icon as String,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          isDark ? Ux4gPalette.primary500 : Ux4gPalette.primary600,
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
                      color: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
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
                    borderColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    contentColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    borderRadius: 8,
                  )
                : Ux4gButton(
                    onPressed: onPressed,
                    text: buttonText,
                    variant: Ux4gButtonVariant.primary,
                    size: Ux4gButtonSize.small,
                    backgroundColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
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
                      Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
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
                        Text('Still need help?',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text('Contact our support team — we are here to help.',
                            style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                        const SizedBox(height: 24),
                        // Support cards
                        SupportCard(
                          icon: Icons.phone,
                          title: 'Phone Support',
                          subtitle: '1800-XXX-XXXX · Toll free · Mon-Sat 9AM-6PM',
                          buttonText: 'Call Now',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 12),
                        SupportCard(
                          icon: Ux4gIcons.liveChat,
                          title: 'Live Chat',
                          subtitle: 'Available now · Estimated wait 1-2 minutes',
                          buttonText: 'Start Chat',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 12),
                        SupportCard(
                          icon: Icons.email_outlined,
                          title: 'Email Support',
                          subtitle: 'Response within 2 working days',
                          buttonText: 'Send Email',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 12),
                        SupportCard(
                          icon: Icons.person_pin_circle_outlined,
                          title: 'Walk-in Centre',
                          subtitle: 'Visit your nearest Common Service Centre',
                          buttonText: 'Find CSC',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 24),
                        // File complaint link
                        Center(
                          child: Ux4gButton(
                            onPressed: () {},
                            text: 'File a complaint about this portal',
                            variant: Ux4gButtonVariant.ghost,
                            contentColor: const Color(0xFF432CBB),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
    return Ux4gCard(
      backgroundColor: isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral0,
      cornerRadius: 12,
      borderColor: isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200,
      borderWidth: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDark ? Ux4gPalette.primary800 : Ux4gPalette.primary100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: icon is IconData
                  ? Icon(
                      icon as IconData,
                      size: 20,
                      color: isDark ? Ux4gPalette.primary500 : Ux4gPalette.primary600,
                    )
                  : Center(
                      child: SvgPicture.asset(
                        icon as String,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          isDark ? Ux4gPalette.primary500 : Ux4gPalette.primary600,
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
                      color: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
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
                    borderColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    contentColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    borderRadius: 8,
                  )
                : Ux4gButton(
                    onPressed: onPressed,
                    text: buttonText,
                    variant: Ux4gButtonVariant.primary,
                    size: Ux4gButtonSize.small,
                    backgroundColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
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
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _ContactSupportMockup extends StatelessWidget {
  final bool isCard;

  const _ContactSupportMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Ux4gTheme.themeData(isDark: _isDark(context)),
      child: Scaffold(
        backgroundColor: isCard ? (_isDark(context) ? Ux4gPalette.primary800 : Ux4gPalette.primary100) : _getScaffoldBg(context),
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
                      _isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
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
          icon: Ux4gIcons.liveChat,
          title: 'Live Chat',
          subtitle: 'Available now · Estimated wait 1-2 minutes',
          buttonText: 'Start Chat',
          onPressed: () {},
        ),
        SizedBox(height: 12),

        // Email Support
        _SupportCard(
          icon: Icons.email_outlined,
          title: 'Emai Support',
          subtitle: 'Response within 2 working days',
          buttonText: 'Send Email',
          onPressed: () {},
        ),
        SizedBox(height: 12),

        // Walk-in Centre
        _SupportCard(
          icon: Icons.person_pin_circle_outlined,
          title: 'Walk-in Centre',
          subtitle: 'Visit your nearest Common Service Centre',
          buttonText: 'Find CSC',
          isOutline: true,
          onPressed: () {},
        ),
        SizedBox(height: 24),

        // File complaint link
        Center(
          child: Ux4gButton(
            onPressed: () {},
            text: 'File a complaint about this portal',
            variant: Ux4gButtonVariant.ghost,
            contentColor: _primaryColor,
          ),
        ),
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
    return Ux4gCard(
      backgroundColor: _isDark(context) ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
      cornerRadius: 12,
      borderColor: _isDark(context) ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200,
      borderWidth: 1,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _isDark(context) ? Ux4gPalette.primary800 : Ux4gPalette.primary100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: icon is IconData
                  ? Icon(
                      icon as IconData,
                      size: 20,
                      color: _isDark(context) ? Ux4gPalette.primary500 : Ux4gPalette.primary600,
                    )
                  : Center(
                      child: SvgPicture.asset(
                        icon as String,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          _isDark(context) ? Ux4gPalette.primary500 : Ux4gPalette.primary600,
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
                      color: _isDark(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: _isDark(context) ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
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
                    borderColor: _isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    contentColor: _isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    borderRadius: 8,
                  )
                : Ux4gButton(
                    onPressed: onPressed,
                    text: buttonText,
                    variant: Ux4gButtonVariant.primary,
                    size: Ux4gButtonSize.small,
                    backgroundColor: _isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    contentColor: _isDark(context) ? Colors.black : Colors.white,
                    borderRadius: 8,
                  ),
          ],
        ),
      ),
    );
  }
}
