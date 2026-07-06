import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────
const _primaryColor = Color(0xFF432CBB);

// ── Component ────────────────────────────────────────────────────────────

final feedbackRatingComponent = WidgetbookComponent(
  name: 'Rate Your Experience',
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
          name: 'Rate Your Experience ($variant)',
          description: isCard
              ? 'Feedback rating form using Ux4gFeedbackForm inside a card '
                    'container with light purple background.'
              : 'Feedback rating form using Ux4gFeedbackForm on a white background.',
          code: isCard ? _feedbackRatingCardCode : _feedbackRatingDefaultCode,
          center: true,
          child: _FeedbackRatingMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _feedbackRatingDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class FeedbackRatingScreen extends StatelessWidget {
  const FeedbackRatingScreen({super.key});

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
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
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
            // Feedback form using Ux4gFeedbackForm
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Ux4gFeedbackForm(
                  improvementOptions: const [
                    'Content accuracy',
                    'Visual design',
                    'Visual design',
                  ],
                  commentPlaceholder:
                      'Please provide your valuable feedback on how we can improve our portal for you.',
                  onSubmit: (rating, chip, comment) {},
                  onSkip: () {},
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
""";

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _feedbackRatingCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — feedback form inside a white card on purple background.
class FeedbackRatingCardScreen extends StatelessWidget {
  const FeedbackRatingCardScreen({super.key});

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
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
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
            // White card with Ux4gFeedbackForm
            Padding(
              padding: const EdgeInsets.all(16),
              child: Ux4gCard(
                backgroundColor: Colors.white,
                cornerRadius: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Ux4gFeedbackForm(
                    improvementOptions: const [
                      'Content accuracy',
                      'Visual design',
                      'Visual design',
                    ],
                    commentPlaceholder:
                        'Please provide your valuable feedback on how we can improve our portal for you.',
                    onSubmit: (rating, chip, comment) {},
                    onSkip: () {},
                  ),
                ),
              ),
            ),
            const Spacer(),
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

class _FeedbackRatingMockup extends StatelessWidget {
  final bool isCard;

  const _FeedbackRatingMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Ux4gTheme.themeData(isDark: Theme.of(context).brightness == Brightness.dark),
      child: Scaffold(
        backgroundColor: isCard ? (Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary800 : Ux4gPalette.primary100) : (Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Colors.white),
        body: SafeArea(
          child: Column(
            children: [
              // App Header using Ux4gAppHeader
              Ux4gAppHeader(
                elevation: 2,
                leadingSpacing: 8,
                variant: Ux4gAppHeaderVariant.light,
                title: '',
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


              // Content - using Ux4gFeedbackForm directly
              if (!isCard)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Ux4gFeedbackForm(
                      improvementOptions: const [
                        'Content accuracy',
                        'Visual design',
                        'Visual design',
                      ],
                      commentPlaceholder:
                          'Please provide your valuable feedback on how we can improve our portal for you.',
                      onSubmit: (rating, chip, comment) {},
                      onSkip: () {},
                    ),
                  ),
                ),
              if (isCard)
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Ux4gCard(
                      backgroundColor: Colors.white,
                      cornerRadius: 16,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Ux4gFeedbackForm(
                          improvementOptions: const [
                            'Content accuracy',
                            'Visual design',
                            'Visual design',
                          ],
                          commentPlaceholder:
                              'Please provide your valuable feedback on how we can improve our portal for you.',
                          onSubmit: (rating, chip, comment) {},
                          onSkip: () {},
                        ),
                      ),
                    ),
                  ),
                ),

              if (isCard) const SizedBox.shrink(),

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
}
