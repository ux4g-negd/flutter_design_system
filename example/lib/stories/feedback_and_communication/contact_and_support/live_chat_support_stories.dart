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

final liveChatSupportComponent = WidgetbookComponent(
  name: 'Live Chat Support',
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
          name: 'Live Chat Support ($variant)',
          description: isCard
              ? 'Live chat support inside a card container with light purple background.'
              : 'Live chat support interface with queue status and action buttons.',
          code: isCard
              ? _liveChatCardCode
              : _liveChatDefaultCode,
          center: true,
          child: _LiveChatMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _liveChatDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class LiveChatSupportScreen extends StatelessWidget {
  const LiveChatSupportScreen({super.key});

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
                      'Live Chat Support',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Chat with a support agent for real-time help with your application.',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Status card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.green900 : Ux4gColors.green50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark ? Ux4gColors.green600 : Ux4gColors.green300,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: isDark ? Ux4gColors.green400 : Ux4gColors.green600,
                            size: 22,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Queue agent available',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Estimated wait time: 1-2 mins',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Connect now to discuss your application with our support team. Average response time under 2 minutes.',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Start Chat button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Start Chat Session',
                        variant: Ux4gButtonVariant.primary,
                        backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                        contentColor: isDark ? Colors.black : Colors.white,
                        borderRadius: 10,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Email support button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Email support instead',
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

const _liveChatCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — live chat support inside a white card on purple background.
class LiveChatSupportCardScreen extends StatelessWidget {
  const LiveChatSupportCardScreen({super.key});

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
                          'Live Chat Support',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Chat with a support agent for real-time help with your application.',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Status card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isDark ? Ux4gColors.green900 : Ux4gColors.green50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDark ? Ux4gColors.green600 : Ux4gColors.green300,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: isDark ? Ux4gColors.green400 : Ux4gColors.green600,
                                size: 22,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Queue agent available',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Estimated wait time: 1-2 mins',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Connect now to discuss your application with our support team. Average response time under 2 minutes.',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Start Chat button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Ux4gButton(
                            onPressed: () {},
                            text: 'Start Chat Session',
                            variant: Ux4gButtonVariant.primary,
                            backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
                            contentColor: isDark ? Colors.black : Colors.white,
                            borderRadius: 10,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Email support button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: Ux4gButton(
                            onPressed: () {},
                            text: 'Email support instead',
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

class _LiveChatMockup extends StatelessWidget {
  final bool isCard;

  const _LiveChatMockup({this.isCard = false});

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
          'Live Chat Support',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Chat with a support agent for real-time help with your application.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        SizedBox(height: 24),

        // Status card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.green900 : Ux4gColors.green50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Ux4gColors.green600 : Ux4gColors.green300,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle,
                color: isDark ? Ux4gColors.green400 : Ux4gColors.green600,
                size: 22,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Queue agent available',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Estimated wait time: 1-2 mins',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Text(
          'Connect now to discuss your application with our support team. Average response time under 2 minutes.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        SizedBox(height: 32),

        // Start Chat button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: Ux4gButton(
            onPressed: () {},
            text: 'Start Chat Session',
            variant: Ux4gButtonVariant.primary,
            backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB),
            contentColor: isDark ? Colors.black : Colors.white,
            borderRadius: 10,
          ),
        ),
        SizedBox(height: 12),

        // Email support button
        SizedBox(
          width: double.infinity,
          height: 48,
          child: Ux4gButton(
            onPressed: () {},
            text: 'Email support instead',
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
