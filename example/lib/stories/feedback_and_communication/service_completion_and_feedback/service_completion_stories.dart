import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

// ── Component ────────────────────────────────────────────────────────────

final serviceCompletionComponent = WidgetbookComponent(
  name: 'Service Completed',
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
          name: 'Service Completed ($variant)',
          description: isCard
              ? 'Service completion confirmation with downloaded certificate info '
                    'inside a card container with light purple background.'
              : 'Service completion confirmation with downloaded certificate info '
                    'on a white background.',
          code: isCard
              ? _serviceCompletionCardCode
              : _serviceCompletionDefaultCode,
          center: true,
          child: _ServiceCompletionMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _serviceCompletionDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class ServiceCompletionScreen extends StatelessWidget {
  const ServiceCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Colors.white,
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
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Ux4gPalette.neutral50, BlendMode.srcIn)
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
                    Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    Ux4gButton(
                      onPressed: () {},
                      text: 'Back',
                      variant: Ux4gButtonVariant.ghost,
                      size: Ux4gButtonSize.small,
                      leadingIcon: Icons.arrow_back,
                      contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                    ),
                    const SizedBox(height: 20),
                    Text('Service Completed',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                    const SizedBox(height: 6),
                    Text('Your income certificate has been downloaded.',
                        style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                    const SizedBox(height: 20),
                    // Success banner
                    Builder(
                      builder: (context) {
                        final isDark = Theme.of(context).brightness == Brightness.dark;
                        final successBg = isDark ? Ux4gPalette.green900 : Ux4gPalette.green50;
                        final successBorder = isDark ? Ux4gPalette.green600 : Ux4gPalette.green300;
                        final successTextColor = isDark ? Ux4gPalette.green300 : Ux4gPalette.green800;
                        final successIconColor = isDark ? Ux4gPalette.green50 : Ux4gPalette.green600;

                        return Ux4gCard(
                          backgroundColor: successBg,
                          borderColor: successBorder,
                          borderWidth: 1,
                          cornerRadius: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.check_circle, size: 20, color: successIconColor),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Income Certificate Downloaded.',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: successTextColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.only(left: 28),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your certificate has been saved to your device.',
                                        style: TextStyle(fontSize: 13, color: successTextColor),
                                      ),
                                      const SizedBox(height: 4),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'View',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: successTextColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 16),
                    // File info
                    Builder(
                      builder: (context) {
                        final isDark = Theme.of(context).brightness == Brightness.dark;
                        final fileCardBg = isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral50;
                        final fileCardTitleColor = isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
                        final fileCardSubColor = isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700;

                        return Ux4gCard(
                          backgroundColor: fileCardBg,
                          cornerRadius: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  'income_certificate_2026.pdf',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: fileCardTitleColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '28 KB · PDF',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: fileCardSubColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            // Save to DigiLocker button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Ux4gButton(
                onPressed: () {},
                text: 'Save to DigiLocker',
                variant: Ux4gButtonVariant.outline,
                size: Ux4gButtonSize.large,
                height: 48,
                width: double.infinity,
                borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                borderRadius: 8,
              ),
            ),
            // Download Again button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Ux4gButton(
                onPressed: () {},
                text: 'Download Again',
                variant: Ux4gButtonVariant.primary,
                size: Ux4gButtonSize.large,
                height: 48,
                width: double.infinity,
                backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                contentColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                borderRadius: 8,
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
""";

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _serviceCompletionCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — content inside a white card on purple background.
class ServiceCompletionCardScreen extends StatelessWidget {
  const ServiceCompletionCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary800 : Ux4gPalette.primary100,
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
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Ux4gPalette.neutral50, BlendMode.srcIn)
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
                    Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            // White card content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Ux4gCard(
                backgroundColor: Colors.white,
                cornerRadius: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back button
                      Ux4gButton(
                        onPressed: () {},
                        text: 'Back',
                        variant: Ux4gButtonVariant.ghost,
                        size: Ux4gButtonSize.small,
                        leadingIcon: Icons.arrow_back,
                        contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                      ),
                      const SizedBox(height: 20),
                      Text('Service Completed',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                      const SizedBox(height: 6),
                      Text('Your income certificate has been downloaded.',
                          style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                      const SizedBox(height: 20),
                      // Success banner
                      Builder(
                        builder: (context) {
                          final isDark = Theme.of(context).brightness == Brightness.dark;
                          final successBg = isDark ? Ux4gPalette.green900 : Ux4gPalette.green50;
                          final successBorder = isDark ? Ux4gPalette.green600 : Ux4gPalette.green300;
                          final successTextColor = isDark ? Ux4gPalette.green300 : Ux4gPalette.green800;
                          final successIconColor = isDark ? Ux4gPalette.green50 : Ux4gPalette.green600;

                          return Ux4gCard(
                            backgroundColor: successBg,
                            borderColor: successBorder,
                            borderWidth: 1,
                            cornerRadius: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle, size: 20, color: successIconColor),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Income Certificate Downloaded.',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: successTextColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 28),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your certificate has been saved to your device.',
                                          style: TextStyle(fontSize: 13, color: successTextColor),
                                        ),
                                        const SizedBox(height: 4),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: successTextColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                      const SizedBox(height: 16),
                    // File info
                    Builder(
                      builder: (context) {
                        final isDark = Theme.of(context).brightness == Brightness.dark;
                        final fileCardBg = isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral50;
                        final fileCardTitleColor = isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
                        final fileCardSubColor = isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700;

                        return Ux4gCard(
                          backgroundColor: fileCardBg,
                          cornerRadius: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  'income_certificate_2026.pdf',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: fileCardTitleColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '28 KB · PDF',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: fileCardSubColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Save to DigiLocker button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Ux4gButton(
                onPressed: () {},
                text: 'Save to DigiLocker',
                variant: Ux4gButtonVariant.outline,
                size: Ux4gButtonSize.large,
                height: 48,
                width: double.infinity,
                borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                borderRadius: 8,
              ),
            ),
            // Download Again button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Ux4gButton(
                onPressed: () {},
                text: 'Download Again',
                variant: Ux4gButtonVariant.primary,
                size: Ux4gButtonSize.large,
                height: 48,
                width: double.infinity,
                backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                contentColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                borderRadius: 8,
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
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _ServiceCompletionMockup extends StatelessWidget {
  final bool isCard;

  const _ServiceCompletionMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Ux4gTheme.themeData(isDark: Theme.of(context).brightness == Brightness.dark),
      child: Scaffold(
        backgroundColor: isCard ? (Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary800 : Ux4gPalette.primary100) : (Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Colors.white),
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
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Ux4gPalette.neutral50, BlendMode.srcIn)
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
                      Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),


              // Content
              if (!isCard)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildMainContent(context),
                  ),
                ),
              if (isCard)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildCardContent(context),
                ),

              if (isCard) const Spacer(),

              // Buttons + Powered by at bottom
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: _buildSaveButton(context),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: _buildDownloadButton(context),
              ),

              // Powered by
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(width: 4),
                    Image.asset(
                      Ux4gIcons.digitalIndiaLogoPng, 
                      height: 20,
                      errorBuilder: (_, __, ___) => const Text(
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

  Widget _buildMainContent(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button using Ux4gButton
        Ux4gButton(
          onPressed: () {},
          text: 'Back',
          variant: Ux4gButtonVariant.ghost,
          size: Ux4gButtonSize.small,
          leadingIcon: Icons.arrow_back,
          contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
        ),
        const SizedBox(height: 20),

        // Title
        Text(
          'Service Completed',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Your income certificate has been downloaded.',
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
          ),
        ),
        const SizedBox(height: 20),

        // Success banner using Ux4gCard
        (() {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final successBg = isDark ? Ux4gPalette.green900 : Ux4gPalette.green50;
          final successBorder = isDark ? Ux4gPalette.green600 : Ux4gPalette.green300;
          final successTextColor = isDark ? Ux4gPalette.green300 : Ux4gPalette.green800;
          final successIconColor = isDark ? Ux4gPalette.green50 : Ux4gPalette.green600;

          return Ux4gCard(
            backgroundColor: successBg,
            borderColor: successBorder,
            borderWidth: 1,
            cornerRadius: 10,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle, size: 20, color: successIconColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Income Certificate Downloaded.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: successTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your certificate has been saved to your device.',
                          style: TextStyle(fontSize: 13, color: successTextColor),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: successTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        })(),
        const SizedBox(height: 16),

        // File info row using Ux4gCard
        (() {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final fileCardBg = isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral50;
          final fileCardTitleColor = isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
          final fileCardSubColor = isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700;

          return Ux4gCard(
            backgroundColor: fileCardBg,
            cornerRadius: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Text(
                    'income_certificate_2026.pdf',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: fileCardTitleColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '28 KB · PDF',
                    style: TextStyle(
                      fontSize: 12,
                      color: fileCardSubColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        })(),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Ux4gButton(
      onPressed: () {},
      text: 'Save to DigiLocker',
      variant: Ux4gButtonVariant.outline,
      size: Ux4gButtonSize.large,
      height: 48,
      width: double.infinity,
      borderColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
      contentColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
      borderRadius: 8,
    );
  }

  Widget _buildDownloadButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Ux4gButton(
      onPressed: () {},
      text: 'Download Again',
      variant: Ux4gButtonVariant.primary,
      size: Ux4gButtonSize.large,
      height: 48,
      width: double.infinity,
      backgroundColor: isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
      contentColor: isDark ? Colors.black : Colors.white,
      borderRadius: 8,
    );
  }

  Widget _buildCardContent(context) {
    return Ux4gCard(
      backgroundColor: Colors.white,
      cornerRadius: 16,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildMainContent(context),
      ),
    );
  }
}
