import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

final rateExperienceComponent = WidgetbookComponent(
  name: 'Rate Experience Card',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card Style'],
          initialOption: 'Default',
          description: 'Switch between the standard layout and the card-style layout.',
        );

        final isCard = variant == 'Card Style';

        return ComponentDocs(
          mobileMockup: true,
          name: 'Rate Experience ($variant)',
          description: isCard
              ? 'Rate experience card container with light purple background.'
              : 'Rate experience card container on a white background.',
          code: isCard ? _rateExperienceCardCode : _rateExperienceDefaultCode,
          center: true,
          child: _RateExperienceMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _rateExperienceDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class RateExperienceScreen extends StatefulWidget {
  const RateExperienceScreen({super.key});

  @override
  State<RateExperienceScreen> createState() => _RateExperienceScreenState();
}

class _RateExperienceScreenState extends State<RateExperienceScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final onSurface = isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
    
    // Star Colors matching Ux4gFeedbackForm
    Color activeStarColor;
    if (_rating == 0) {
      activeStarColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300;
    } else if (_rating <= 2) {
      activeStarColor = isDark ? Ux4gColors.red300 : Ux4gColors.red600;
    } else {
      activeStarColor = isDark ? Ux4gColors.yellow500 : Ux4gColors.yellow600;
    }
    
    final inactiveStarColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300;

    final cardBg = isDark ? Ux4gColors.neutral900 : Colors.white;
    final cardBorder = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral900 : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 360),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: cardBorder),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Rate your experience',
                            style: Theme.of(context).extension<Ux4gTypography>()?.hS_strong.copyWith(
                              color: onSurface,
                            ) ?? TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final starIndex = index + 1;
                            final isSelected = starIndex <= _rating;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _rating = starIndex;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.star,
                                  size: 24,
                                  color: isSelected ? activeStarColor : inactiveStarColor,
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: Ux4gButton(
                            onPressed: _rating > 0 ? () {} : null,
                            text: 'Submit',
                            variant: Ux4gButtonVariant.primary,
                            size: Ux4gButtonSize.large,
                            height: 40,
                            backgroundColor: _rating > 0
                                ? (isDark ? Ux4gColors.primary300 : Ux4gColors.primary600)
                                : (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                            contentColor: _rating > 0
                                ? (isDark ? Colors.black : Colors.white)
                                : (isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400),
                            borderRadius: 8,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                    style: TextStyle(fontSize: 11, color: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280)),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,
                    height: 20,
                  ),
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

const _rateExperienceCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class RateExperienceCardScreen extends StatefulWidget {
  const RateExperienceCardScreen({super.key});

  @override
  State<RateExperienceCardScreen> createState() => _RateExperienceCardScreenState();
}

class _RateExperienceCardScreenState extends State<RateExperienceCardScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final onSurface = isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
    
    // Star Colors matching Ux4gFeedbackForm
    Color activeStarColor;
    if (_rating == 0) {
      activeStarColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300;
    } else if (_rating <= 2) {
      activeStarColor = isDark ? Ux4gColors.red300 : Ux4gColors.red600;
    } else {
      activeStarColor = isDark ? Ux4gColors.yellow500 : Ux4gColors.yellow600;
    }
    
    final inactiveStarColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300;

    final cardBg = isDark ? Ux4gColors.neutral900 : Colors.white;
    final cardBorder = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100,
      body: SafeArea(
        child: Column(
          children: [
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 360),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: cardBorder),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Rate your experience',
                            style: Theme.of(context).extension<Ux4gTypography>()?.hS_strong.copyWith(
                              color: onSurface,
                            ) ?? TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final starIndex = index + 1;
                            final isSelected = starIndex <= _rating;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _rating = starIndex;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  Icons.star,
                                  size: 24,
                                  color: isSelected ? activeStarColor : inactiveStarColor,
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: Ux4gButton(
                            onPressed: _rating > 0 ? () {} : null,
                            text: 'Submit',
                            variant: Ux4gButtonVariant.primary,
                            size: Ux4gButtonSize.large,
                            height: 40,
                            backgroundColor: _rating > 0
                                ? (isDark ? Ux4gColors.primary300 : Ux4gColors.primary600)
                                : (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                            contentColor: _rating > 0
                                ? (isDark ? Colors.black : Colors.white)
                                : (isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400),
                            borderRadius: 8,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                    style: TextStyle(fontSize: 11, color: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280)),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,
                    height: 20,
                  ),
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

class _RateExperienceMockup extends StatefulWidget {
  final bool isCard;

  const _RateExperienceMockup({this.isCard = false});

  @override
  State<_RateExperienceMockup> createState() => _RateExperienceMockupState();
}

class _RateExperienceMockupState extends State<_RateExperienceMockup> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final onSurface = isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
    
    // Star Colors matching Ux4gFeedbackForm
    Color activeStarColor;
    if (_rating == 0) {
      activeStarColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300;
    } else if (_rating <= 2) {
      activeStarColor = isDark ? Ux4gColors.red300 : Ux4gColors.red600;
    } else {
      activeStarColor = isDark ? Ux4gColors.yellow500 : Ux4gColors.yellow600;
    }
    
    final inactiveStarColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300;

    final cardBg = isDark ? Ux4gColors.neutral900 : Colors.white;
    final cardBorder = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200;

    Widget formContent = Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 360),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Rate your experience',
              style: Theme.of(context).extension<Ux4gTypography>()?.hS_strong.copyWith(
                color: onSurface,
              ) ?? TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: onSurface,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              final isSelected = starIndex <= _rating;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _rating = starIndex;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.star,
                    size: 24,
                    color: isSelected ? activeStarColor : inactiveStarColor,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: Ux4gButton(
              onPressed: _rating > 0 ? () {} : null,
              text: 'Submit',
              variant: Ux4gButtonVariant.primary,
              size: Ux4gButtonSize.large,
              height: 40,
              backgroundColor: _rating > 0
                  ? (isDark ? Ux4gColors.primary300 : Ux4gColors.primary600)
                  : (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              contentColor: _rating > 0
                  ? (isDark ? Colors.black : Colors.white)
                  : (isDark ? Ux4gColors.neutral500 : Ux4gColors.neutral400),
              borderRadius: 8,
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
              ),
            ),
          ),
        ],
      ),
    );

    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: widget.isCard 
            ? (isDark ? Ux4gColors.primary800 : Ux4gColors.primary100) 
            : (isDark ? Ux4gColors.neutral900 : Colors.white),
        body: SafeArea(
          child: Column(
            children: [
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
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: formContent,
                  ),
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
                      style: TextStyle(fontSize: 11, color: isDark ? Ux4gColors.neutral400 : const Color(0xFF6B7280)),
                    ),
                    const SizedBox(width: 4),
                    Image.asset(
                      Ux4gIcons.digitalIndiaLogoPng,
                      height: 20,
                      errorBuilder: (_, __, ___) => const Text('Digital India'),
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
