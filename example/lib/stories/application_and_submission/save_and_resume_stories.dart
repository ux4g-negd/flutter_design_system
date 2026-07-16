import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : const Color(0xFFFAFAFA);
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.primary900 : Ux4gColors.primary100;
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral400 : const Color(0xFF4B5563);
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB);
Color _getPrimaryColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.primary600 : const Color(0xFF432CBB);
Color _getStartFreshColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;

bool _isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getUploadedBg(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green900 : Ux4gColors.green50;
Color _getUploadedBorder(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green800 : const Color(0xFFDCFCE7);
Color _getUploadedIcon(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green500 : Ux4gColors.green600;
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

final saveAndResumeComponent = WidgetbookComponent(
  name: 'Save and Resume',
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
            ? _saveAndResumeCardCode
            : _saveAndResumeDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Save and Resume',
          description:
              'A pattern allowing users to resume a previously saved application or start fresh.',
          code: code,
          center: true,
          child: isCardStyle
              ? const _SaveAndResumeCardMockup()
              : const _SaveAndResumeMockup(),
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
        color: _getBg(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _getBorderColor(context)),
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

const _saveAndResumeDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveAndResumeScreen extends StatelessWidget {
  const SaveAndResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: Colors.white,
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
            const Divider(height: 1, color: Color(0xFFE5E7EB)),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7E6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text('Income Certificate Application', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF171717))),
                              ),
                              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF171717)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: const Color(0xFFFFE7BF), borderRadius: BorderRadius.circular(4)),
                            child: const Text('Step 3 of 5 Document Upload', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFAD4E00))),
                          ),
                          const SizedBox(height: 12),
                          const Text('Last saved: 10 Apr 2026', style: TextStyle(fontSize: 14, color: Color(0xFF404040))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Placeholders
                    Shimmer.fromColors(
                      baseColor: const Color(0xFFE5E7EB),
                      highlightColor: const Color(0xFFF9FAFB),
                      child: Container(height: 140, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
                    ),
                    const SizedBox(height: 16),
                    Shimmer.fromColors(
                      baseColor: const Color(0xFFE5E7EB),
                      highlightColor: const Color(0xFFF9FAFB),
                      child: Container(height: 140, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
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
                  Ux4gButton(text: 'Resume application', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48),
                  const SizedBox(height: 12),
                  Ux4gButton(height: 48, text: 'Start fresh', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, height: 48),
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
""";

const _saveAndResumeCardCode = r"""import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveAndResumeCardScreen extends StatelessWidget {
  const SaveAndResumeCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: const Color(0xFFDCD4FF),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.white,
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
                  const Divider(height: 1, color: Color(0xFFE5E7EB)),
                ],
              ),
            ),

            // Card Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Status Header
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF7E6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      child: Text('Income Certificate Application', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF171717))),
                                    ),
                                    const Icon(Icons.keyboard_arrow_down, color: Color(0xFF171717)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: const Color(0xFFFFE7BF), borderRadius: BorderRadius.circular(4)),
                                  child: const Text('Step 3 of 5 Document Upload', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFFAD4E00))),
                                ),
                                const SizedBox(height: 8),
                                const Text('Last saved: 10 Apr 2026', style: TextStyle(fontSize: 14, color: Color(0xFF404040))),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Placeholders
                          Shimmer.fromColors(
                      baseColor: const Color(0xFFE5E7EB),
                      highlightColor: const Color(0xFFF9FAFB),
                      child: Container(height: 140, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
                    ),
                          const SizedBox(height: 16),
                          Shimmer.fromColors(
                      baseColor: const Color(0xFFE5E7EB),
                      highlightColor: const Color(0xFFF9FAFB),
                      child: Container(height: 140, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions & Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(text: 'Resume application', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48),
                  const SizedBox(height: 12),
                  Ux4gButton(height: 48, text: 'Start fresh', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, height: 48),
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
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _SaveAndResumeMockup extends StatelessWidget {
  const _SaveAndResumeMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: _getBg(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Ux4gAppHeader(
                variant: _isDark(context)
                    ? Ux4gAppHeaderVariant.light
                    : Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(
                    _nationalEmblemLogoPath,
                    height: 40,
                    colorFilter: _isDark(context)
                        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                        : null,
                  ),
                  Container(
                    height: 32,
                    width: 1,
                    color: _isDark(context)
                        ? Ux4gColors.neutral700
                        : const Color(0xFFD1D5DB),
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
              Divider(height: 1, color: _getBorderColor(context)),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: _isDark(context)
                              ? Ux4gColors.orange900
                              : Ux4gColors.orange50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Income Certificate Application',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: _isDark(context)
                                          ? Ux4gColors.neutral50
                                          : Ux4gColors.neutral900,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: _isDark(context)
                                      ? Ux4gColors.neutral50
                                      : Ux4gColors.neutral900,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _isDark(context)
                                    ? Ux4gColors.orange800
                                    : Ux4gColors.orange100,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Step 3 of 5 Document Upload',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: _isDark(context)
                                      ? Ux4gColors.orange300
                                      : Ux4gColors.orange800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Last saved: 10 Apr 2026',
                              style: TextStyle(
                                fontSize: 14,
                                color: _isDark(context)
                                    ? Ux4gColors.neutral200
                                    : Ux4gColors.neutral700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Shimmer.fromColors(
                        baseColor: _isDark(context)
                            ? Ux4gColors.neutral800
                            : const Color(0xFFE5E7EB),
                        highlightColor: _isDark(context)
                            ? Ux4gColors.neutral700
                            : const Color(0xFFF9FAFB),
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            color: _isDark(context)
                                ? Ux4gColors.neutral900
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Shimmer.fromColors(
                        baseColor: _isDark(context)
                            ? Ux4gColors.neutral800
                            : const Color(0xFFE5E7EB),
                        highlightColor: _isDark(context)
                            ? Ux4gColors.neutral700
                            : const Color(0xFFF9FAFB),
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                            color: _isDark(context)
                                ? Ux4gColors.neutral900
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                      height: 48,
                      text: 'Resume application',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      height: 48,
                      text: 'Start fresh',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      contentColor: _getStartFreshColor(context),
                      borderColor: _getStartFreshColor(context),
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
                        color: _isDark(context)
                            ? Ux4gColors.neutral500
                            : const Color(0xFF9CA3AF),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 24,
                      color: _isDark(context) ? Colors.white : null,
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

class _SaveAndResumeCardMockup extends StatelessWidget {
  const _SaveAndResumeCardMockup();

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
                color: _isDark(context) ? Ux4gColors.neutral950 : Colors.white,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: _isDark(context)
                          ? Ux4gAppHeaderVariant.light
                          : Ux4gAppHeaderVariant.light,
                      title: '',
                      leadingWidgets: [
                        SvgPicture.asset(
                          _nationalEmblemLogoPath,
                          height: 40,
                          colorFilter: _isDark(context)
                              ? const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                        Container(
                          height: 32,
                          width: 1,
                          color: _isDark(context)
                              ? Ux4gColors.neutral700
                              : const Color(0xFFD1D5DB),
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
                    Divider(height: 1, color: _getBorderColor(context)),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: _isDark(context)
                              ? Ux4gColors.neutral900
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: _isDark(context)
                              ? Border.all(color: Ux4gColors.neutral800)
                              : null,
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
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _isDark(context)
                                    ? Ux4gColors.orange900
                                    : Ux4gColors.orange50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Income Certificate Application',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: _isDark(context)
                                                ? Ux4gColors.neutral50
                                                : Ux4gColors.neutral900,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: _isDark(context)
                                            ? Ux4gColors.neutral50
                                            : Ux4gColors.neutral900,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _isDark(context)
                                          ? Ux4gColors.orange800
                                          : Ux4gColors.orange100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Step 3 of 5 Document Upload',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: _isDark(context)
                                            ? Ux4gColors.orange300
                                            : Ux4gColors.orange800,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Last saved: 10 Apr 2026',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: _isDark(context)
                                          ? Ux4gColors.neutral200
                                          : Ux4gColors.neutral700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Shimmer.fromColors(
                              baseColor: _isDark(context)
                                  ? Ux4gColors.neutral800
                                  : const Color(0xFFE5E7EB),
                              highlightColor: _isDark(context)
                                  ? Ux4gColors.neutral700
                                  : const Color(0xFFF9FAFB),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: _isDark(context)
                                      ? Ux4gColors.neutral900
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Shimmer.fromColors(
                              baseColor: _isDark(context)
                                  ? Ux4gColors.neutral800
                                  : const Color(0xFFE5E7EB),
                              highlightColor: _isDark(context)
                                  ? Ux4gColors.neutral700
                                  : const Color(0xFFF9FAFB),
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: _isDark(context)
                                      ? Ux4gColors.neutral900
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Ux4gButton(
                      height: 48,
                      text: 'Resume application',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      height: 48,
                      text: 'Start fresh',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      contentColor: _getStartFreshColor(context),
                      borderColor: _getStartFreshColor(context),
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
                        color: _isDark(context)
                            ? Ux4gColors.neutral500
                            : const Color(0xFF9CA3AF),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 24,
                      color: _isDark(context) ? Colors.white : null,
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
