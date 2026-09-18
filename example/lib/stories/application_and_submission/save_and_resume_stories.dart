import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';
import '../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final saveAndResumeComponent = WidgetbookComponent(
  name: 'Save and Resume',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
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
  const _PhoneFrame({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return Container(
      width: 360,
      height: 760,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.gray900 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _AppHeader extends StatelessWidget {
  const _AppHeader();

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gAppHeader(
          variant: Ux4gAppHeaderVariant.light,
          title: '',
          leadingWidgets: [
            SvgPicture.asset(
              _nationalEmblemLogoPath,
              height: 32,
              colorFilter: isDark
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : null,
            ),
            Container(
              height: 28,
              width: 1,
              color: isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300,
            ),
            SvgPicture.asset(
              _unionLogoPath,
              height: 32,
              colorFilter: ColorFilter.mode(
                isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                BlendMode.srcIn,
              ),
            ),
          ],
          actions: [
            Ux4gAppHeaderAction(
              customWidget: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isDark
                        ? Ux4gColors.neutral800
                        : Ux4gColors.neutral200,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.menu,
                    color: isDark
                        ? Ux4gColors.primary400
                        : Ux4gColors.primary600,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
          verticalPadding: 16,
          horizontalPadding: 16,
          leadingSpacing: 8,
        ),
        Divider(
          height: 1,
          color: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200,
        ),
      ],
    );
  }
}

class _StatusBannerCard extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const _StatusBannerCard({
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return Ux4gStatusBanner(
      variant: Ux4gBannerVariant.warningLight,
      backgroundColor: isDark ? Ux4gColors.orange900 : const Color(0xFFFFF9E6),
      borderColor: isDark ? Ux4gColors.orange800 : const Color(0xFFFFE8B3),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(16),
      title: 'Income Certificate Application',
      titleStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: isDark ? Ux4gColors.neutral50 : const Color(0xFF171717),
      ),
      trailingIcon: InkWell(
        onTap: onToggle,
        child: Icon(
          isExpanded
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          color: isDark ? Ux4gColors.neutral50 : const Color(0xFF171717),
          size: 22,
        ),
      ),
      subtitleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 3,
            ),
            decoration: BoxDecoration(
              color: isDark ? Ux4gColors.orange800 : const Color(0xFFFFE7BF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Step 3 of 5 Document Upload',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: isDark ? Ux4gColors.orange300 : const Color(0xFFAD4E00),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Last saved: 10 Apr 2026',
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Ux4gColors.neutral300 : const Color(0xFF404040),
            ),
          ),
        ],
      ),
      actions: isExpanded
          ? [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          child: Text(
                            'Discard',
                            style: TextStyle(
                              color: isDark
                                  ? Ux4gColors.red300
                                  : const Color(0xFF7A271A),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Ux4gButton(
                      text: 'Resume',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.primary,
                      size: Ux4gButtonSize.medium,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ]
          : null,
    );
  }
}

class _PoweredByFooter extends StatelessWidget {
  final Color? bgColor;
  const _PoweredByFooter({this.bgColor});

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);

    return Container(
      color: bgColor,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Powered by -',
            style: TextStyle(
              fontSize: 11,
              color: isDark ? Ux4gColors.neutral500 : const Color(0xFF9CA3AF),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            _digitalIndiaLogoPath,
            height: 22,
            color: isDark ? Colors.white : null,
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _saveAndResumeDefaultCode = r"""// Save and Resume Screen Pattern (Default)
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
        Container(width: 1, height: 28, color: Color(0xFFD1D5DB)),
        SvgPicture.asset(Ux4gIcons.union, height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(Icons.menu, color: Color(0xFF4A2BC2), size: 20),
            ),
          ),
        ),
      ],
      verticalPadding: 16,
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    const Divider(height: 1, color: Color(0xFFE5E7EB)),

    // Content
    Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Banner Component
            Ux4gStatusBanner(
              variant: Ux4gBannerVariant.warningLight,
              backgroundColor: const Color(0xFFFFF9E6),
              borderColor: const Color(0xFFFFE8B3),
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(16),
              title: 'Income Certificate Application',
              titleStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF171717),
              ),
              trailingIcon: const Icon(Icons.keyboard_arrow_up, color: Color(0xFF171717), size: 22),
              subtitleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE7BF),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Step 3 of 5 Document Upload',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFAD4E00),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Last saved: 10 Apr 2026',
                    style: TextStyle(fontSize: 13, color: Color(0xFF404040)),
                  ),
                ],
              ),
              actions: [
                Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Discard',
                          style: TextStyle(
                            color: Color(0xFF7A271A),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Ux4gButton(
                        text: 'Resume',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.primary,
                        size: Ux4gButtonSize.medium,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Skeletons
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE5E7EB),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    ),

    // Footer
    Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
          const SizedBox(width: 8),
          Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22),
        ],
      ),
    ),
  ],
)""";

const _saveAndResumeCardCode = r"""// Save and Resume Screen Pattern (Card Style)
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    // Header
    Ux4gAppHeader(
      variant: Ux4gAppHeaderVariant.light,
      title: '',
      leadingWidgets: [
        SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 32),
        Container(width: 1, height: 28, color: Color(0xFFD1D5DB)),
        SvgPicture.asset(Ux4gIcons.union, height: 32),
      ],
      actions: [
        Ux4gAppHeaderAction(
          customWidget: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(Icons.menu, color: Color(0xFF4A2BC2), size: 20),
            ),
          ),
        ),
      ],
      verticalPadding: 16,
      horizontalPadding: 16,
      leadingSpacing: 8,
    ),
    const Divider(height: 1, color: Color(0xFFE5E7EB)),

    // Card Style Content
    Expanded(
      child: Container(
        color: const Color(0xFFDCD4FF), // Soft purple background
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Banner Component
              Ux4gStatusBanner(
                variant: Ux4gBannerVariant.warningLight,
                backgroundColor: const Color(0xFFFFF9E6),
                borderColor: const Color(0xFFFFE8B3),
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(16),
                title: 'Income Certificate Application',
                titleStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF171717),
                ),
                trailingIcon: const Icon(Icons.keyboard_arrow_up, color: Color(0xFF171717), size: 22),
                subtitleWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE7BF),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Step 3 of 5 Document Upload',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFAD4E00),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Last saved: 10 Apr 2026',
                      style: TextStyle(fontSize: 13, color: Color(0xFF404040)),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Discard',
                            style: TextStyle(
                              color: Color(0xFF7A271A),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Ux4gButton(
                          text: 'Resume',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.primary,
                          size: Ux4gButtonSize.medium,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Skeletons
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.65),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.65),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    ),

    // Footer
    Container(
      color: const Color(0xFFDCD4FF),
      padding: const EdgeInsets.only(bottom: 20, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
          const SizedBox(width: 8),
          Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22),
        ],
      ),
    ),
  ],
)""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _SaveAndResumeMockup extends StatefulWidget {
  const _SaveAndResumeMockup();

  @override
  State<_SaveAndResumeMockup> createState() => _SaveAndResumeMockupState();
}

class _SaveAndResumeMockupState extends State<_SaveAndResumeMockup> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    final placeholderColor =
        isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB);

    return _PhoneFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _AppHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatusBannerCard(
                    isExpanded: _isExpanded,
                    onToggle: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: placeholderColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: placeholderColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: placeholderColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: placeholderColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const _PoweredByFooter(),
        ],
      ),
    );
  }
}

class _SaveAndResumeCardMockup extends StatefulWidget {
  const _SaveAndResumeCardMockup();

  @override
  State<_SaveAndResumeCardMockup> createState() =>
      _SaveAndResumeCardMockupState();
}

class _SaveAndResumeCardMockupState extends State<_SaveAndResumeCardMockup> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    final cardBg = isDark ? Ux4gColors.primary900 : Ux4gColors.primary100;
    final placeholderColor = isDark
        ? Ux4gColors.neutral800
        : Colors.white.withValues(alpha: 0.65);

    return _PhoneFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _AppHeader(),
          Expanded(
            child: Container(
              color: cardBg,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StatusBannerCard(
                      isExpanded: _isExpanded,
                      onToggle: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: placeholderColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            height: 28,
                            decoration: BoxDecoration(
                              color: placeholderColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: placeholderColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: placeholderColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _PoweredByFooter(bgColor: cardBg),
        ],
      ),
    );
  }
}
