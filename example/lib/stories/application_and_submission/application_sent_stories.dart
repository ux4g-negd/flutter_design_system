import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/component_docs.dart';

const Color _bg = Color(0xFFFAFAFA);
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;

bool _isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getUploadedBg(BuildContext context) =>
    _isDarkMode(context) ? Ux4gColors.green800 : Ux4gColors.green100;
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

final applicationSentComponent = WidgetbookComponent(
  name: 'Application sent success',
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
            ? _applicationSentCardCode
            : _applicationSentDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Application sent success',
          description:
              'A success screen pattern shown after an application is submitted.',
          code: code,
          center: true,
          child: isCardStyle
              ? const _ApplicationSentCardMockup()
              : const _ApplicationSentMockup(),
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
        border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Colors.transparent : const Color(0xFFE5E7EB)),
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

const _applicationSentDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationSentScreen extends StatelessWidget {
  const ApplicationSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
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
            Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB)),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: _getUploadedBg(context),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.check_circle, color: _getUploadedIcon(context), size: 48),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Application sent!',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : const Color(0xFF111827)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'We will review and contact you within 3 working days.',
                      style: TextStyle(fontSize: 16, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : const Color(0xFF4B5563), height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(
                children: [
                  Ux4gButton(
                    text: 'View application status',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                    backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
                  ),
                  const SizedBox(height: 12),
                  Ux4gButton(
                    text: 'Back to dashboard',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : const Color(0xFF9CA3AF))),
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

const _applicationSentCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationSentCardScreen extends StatelessWidget {
  const ApplicationSentCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
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
                    title: '',
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
                  Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB)),
                ],
              ),
            ),

            // Card Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _getUploadedBg(context),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.check_circle, color: _getUploadedIcon(context), size: 48),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Application sent!',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : const Color(0xFF111827)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'We will review and contact you within 3 working days.',
                        style: TextStyle(fontSize: 16, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : const Color(0xFF4B5563), height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Actions & Footer
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Column(
                children: [
                  Ux4gButton(
                    text: 'View application status',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                    backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
                  ),
                  const SizedBox(height: 12),
                  Ux4gButton(
                    text: 'Back to dashboard',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : const Color(0xFF9CA3AF))),
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

class _ApplicationSentMockup extends StatelessWidget {
  const _ApplicationSentMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
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
                    color: const Color(0xFFD1D5DB),
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
              Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _getUploadedBg(context),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: _getUploadedIcon(context),
                            size: 48,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Application sent!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : const Color(0xFF111827),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'We will review and contact you within 3 working days.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : const Color(0xFF4B5563),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(
                  children: [
                    Ux4gButton(
                      text: 'View application status',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 48,
                      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                      contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      text: 'Back to dashboard',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 48,
                      contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
                      borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
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
                      style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : const Color(0xFF9CA3AF)),
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

class _ApplicationSentCardMockup extends StatelessWidget {
  const _ApplicationSentCardMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
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
                          color: const Color(0xFFD1D5DB),
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
                    Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB)),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: _getUploadedBg(context),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check_circle,
                              color: _getUploadedIcon(context),
                              size: 48,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Application sent!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : const Color(0xFF111827),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'We will review and contact you within 3 working days.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : const Color(0xFF4B5563),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Ux4gButton(
                          text: 'View application status',
                          onPressed: () {},
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 48,
                          backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                          contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
                        ),
                        const SizedBox(height: 12),
                        Ux4gButton(
                          text: 'Back to dashboard',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 48,
                          contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
                          borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 22,
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null,
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
