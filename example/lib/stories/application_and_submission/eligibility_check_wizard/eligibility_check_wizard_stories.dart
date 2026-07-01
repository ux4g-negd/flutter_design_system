import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import '../../../widgets/component_docs.dart';

// ── Asset paths (referenced from example/assets/) ───────────────────────
const _nationalEmblemPath = Ux4gIcons.nationalEmblem;
const _unionLogoPath = Ux4gIcons.union;
const _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

// ── Shared design tokens ───────────────────────────────────────────────
// ───────────────────────────────────────────────────────────────────────
// Eligibility Check Wizard – Landing Screen
// ───────────────────────────────────────────────────────────────────────

final eligibilityCheckWizardComponent = WidgetbookComponent(
  name: 'Eligibility Check Landing',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout on a soft-purple background.',
        );

        final code = variant == 'Card style'
            ? _eligibilityCheckCardCode
            : _eligibilityCheckCode;
        final child = variant == 'Card style'
            ? const _EligibilityCheckCardMockup()
            : const _EligibilityCheckMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Eligibility Check Landing',
          description:
              'A landing screen for the Eligibility Check Wizard flow. '
              'Introduces the user to a short questionnaire before starting the application process. '
              'Use the [Variant] knob on the right to toggle layouts.',
          code: code,
          center: true,
          child: child,
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
    return Container(
      width: 360,
      height: 760,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gPalette.neutral900
            : Ux4gPalette.neutral50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Ux4gPalette.neutral800
              : Color(0xFFE5E7EB),
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

class _EligibilityHeader extends StatelessWidget {
  const _EligibilityHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gAppHeader(
          variant: Ux4gAppHeaderVariant.light,
          title: '',
          leadingWidgets: [
            SvgPicture.asset(
              _nationalEmblemPath,
              height: 32,
              colorFilter: Theme.of(context).brightness == Brightness.dark
                  ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : null,
            ),
            SizedBox(
              height: 20,
              child: Ux4gDivider(
                orientation: Ux4gDividerOrientation.vertical,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Ux4gPalette.neutral700
                    : Ux4gPalette.neutral200,
              ),
            ),
            SvgPicture.asset(
              _unionLogoPath,
              height: 32,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? Ux4gPalette.primary300
                    : Ux4gPalette.primary600,
                BlendMode.srcIn,
              ),
            ),
          ],
          actions: const [],
          horizontalPadding: 16,
          leadingSpacing: 8,
        ),
        Ux4gDivider(
          thickness: 1,
          color: Theme.of(context).brightness == Brightness.dark
              ? Ux4gPalette.neutral800
              : Color(0xFFE5E7EB),
        ),
      ],
    );
  }
}

/// Builds a single bullet-point info row.
// ───────────────────────────────────────────────────────────────────────
// Default (Flat) Layout Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityCheckMockup extends StatelessWidget {
  const _EligibilityCheckMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    'Income Certificate\nCheck Eligibility',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .extension<Ux4gTypography>()
                        ?.hS_strong
                        ?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral50
                              : Ux4gPalette.neutral900,
                        ),
                  ),
                  const SizedBox(height: 14),

                  // Subtitle
                  Text(
                    'Answer a few quick questions to see if you qualify.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .extension<Ux4gTypography>()
                        ?.bS_default
                        ?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral200
                              : Ux4gPalette.neutral700,
                        ),
                  ),
                  const SizedBox(height: 32),

                  // Info bullets
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Icon(
                                  Icons.circle,
                                  size: 8,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.primary300
                                      : Ux4gPalette.primary600,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '5 questions',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Icon(
                                  Icons.circle,
                                  size: 8,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.primary300
                                      : Ux4gPalette.primary600,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '~2 minutes to complete',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Icon(
                                  Icons.circle,
                                  size: 8,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.primary300
                                      : Ux4gPalette.primary600,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'No documents needed at this step',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom actions
          Ux4gDivider(
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gPalette.neutral800
                : Color(0xFFE5E7EB),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              children: [
                Ux4gButton(
                  height: 48,
                  text: 'Start Eligibility Check',
                  onPressed: () {},
                  size: Ux4gButtonSize.large,
                  width: double.infinity,
                ),
                const SizedBox(height: 8),
                Ux4gButton(
                  height: 48,
                  text: 'Skip and Apply Directly',
                  onPressed: () {},
                  variant: Ux4gButtonVariant.ghost,
                  size: Ux4gButtonSize.large,
                  width: double.infinity,
                  contentColor: Theme.of(context).brightness == Brightness.dark
                      ? Ux4gPalette.primary300
                      : Ux4gPalette.primary600,
                ),
                const SizedBox(height: 16),
                Text(
                  'Already applied? Track your application →',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral200
                        : Ux4gPalette.neutral700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral500
                        : Ux4gPalette.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Image.asset(
                  _digitalIndiaLogoPath,
                  height: 22,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Card Style Layout Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityCheckCardMockup extends StatelessWidget {
  const _EligibilityCheckCardMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary900
                  : Ux4gPalette.primary50,
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverFillRemaining(
                            hasScrollBody: false,
                            child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral900
                              : Ux4gPalette.neutral0,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Title
                            Text(
                              'Income Certificate\nCheck Eligibility',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                                height: 1.25,
                                letterSpacing: -0.4,
                              ),
                            ),
                            const SizedBox(height: 14),

                            // Subtitle
                            Text(
                              'Answer a few quick questions to see if you qualify.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Info bullets
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 6),
                                          child: Icon(
                                            Icons.circle,
                                            size: 8,
                                            color:
                                                Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Ux4gPalette.primary300
                                                : Ux4gPalette.primary600,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            '5 questions',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 6),
                                          child: Icon(
                                            Icons.circle,
                                            size: 8,
                                            color:
                                                Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Ux4gPalette.primary300
                                                : Ux4gPalette.primary600,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            '~2 minutes to complete',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 6),
                                          child: Icon(
                                            Icons.circle,
                                            size: 8,
                                            color:
                                                Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Ux4gPalette.primary300
                                                : Ux4gPalette.primary600,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            'No documents needed at this step',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                                                ),
                          ),
                        ],
                      ),
                  ),

                  // Actions (outside card, in purple area)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                    child: Column(
                      children: [
                        Ux4gButton(
                          height: 48,
                          text: 'Start Eligibility Check',
                          onPressed: () {},
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 8),
                        Ux4gButton(
                          height: 48,
                          text: 'Skip and Apply Directly',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.primary300
                              : Ux4gPalette.primary600,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Already applied? Track your application →',
                          style: TextStyle(
                            fontSize: 13,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral200
                                : Ux4gPalette.neutral700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral500
                                : Ux4gPalette.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets
// ───────────────────────────────────────────────────────────────────────

const _eligibilityCheckCode =
    r'''// Eligibility Check Wizard – Landing Screen (Flat Layout)
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32, colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                SizedBox(height: 20, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200)),
                SvgPicture.asset(
                          Ux4gIcons.union, 
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
              ],
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      'Income Certificate\nCheck Eligibility',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                        height: 1.25,
                        letterSpacing: -0.4,
                      ),
                    ),
                    SizedBox(height: 14),

                    // Subtitle
                    Text(
                      'Answer a few quick questions to see if you qualify.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.5),
                    ),
                    SizedBox(height: 32),

                    // Info bullets
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle, size: 8, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)),
                          SizedBox(width: 12),
                          Expanded(child: Text('5 questions', style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle, size: 8, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)),
                          SizedBox(width: 12),
                          Expanded(child: Text('~2 minutes to complete', style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle, size: 8, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)),
                          SizedBox(width: 12),
                          Expanded(child: Text('No documents needed at this step', style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Column(
                children: [
                  Ux4gButton(height: 48, 
                    text: 'Start Eligibility Check',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 8),
                  Ux4gButton(height: 48, 
                    text: 'Skip and Apply Directly',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Already applied? Track your application →',
                    style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400, fontWeight: FontWeight.w500)),
                  SizedBox(height: 6),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

const _eligibilityCheckCardCode =
    r'''// Eligibility Check Wizard – Landing Screen (Card Style Layout)
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32, colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                SizedBox(height: 20, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200)),
                SvgPicture.asset(
                          Ux4gIcons.union, 
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
              ],
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),

            Expanded(
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50, // Soft purple background
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverFillRemaining(
                              hasScrollBody: false,
                              child: Container(
                          padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 16,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Title
                              Text(
                                'Income Certificate\nCheck Eligibility',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                                  height: 1.25,
                                ),
                              ),
                              SizedBox(height: 14),

                              // Subtitle
                              Text(
                                'Answer a few quick questions to see if you qualify.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.5),
                              ),
                              SizedBox(height: 20),

                              // Info bullets
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle, size: 8, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)),
                          SizedBox(width: 12),
                          Expanded(child: Text('5 questions', style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle, size: 8, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)),
                          SizedBox(width: 12),
                          Expanded(child: Text('~2 minutes to complete', style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 6), child: Icon(Icons.circle, size: 8, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)),
                          SizedBox(width: 12),
                          Expanded(child: Text('No documents needed at this step', style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                        ],
                      ),
                    ),

                              SizedBox(height: 24),

                              // Actions
                              Ux4gButton(height: 48, 
                                text: 'Start Eligibility Check',
                                onPressed: () {},
                                size: Ux4gButtonSize.large,
                                width: double.infinity,
                              ),
                              SizedBox(height: 8),
                              Ux4gButton(height: 48, 
                                text: 'Skip and Apply Directly',
                                onPressed: () {},
                                variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Already applied? Track your application →',
                                style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                                                    ),
                            ),
                          ],
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400, fontWeight: FontWeight.w500)),
                          SizedBox(height: 6),
                          Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

// ───────────────────────────────────────────────────────────────────────
// Eligibility Question Step
// ───────────────────────────────────────────────────────────────────────

final eligibilityQuestionStepComponent = WidgetbookComponent(
  name: 'Eligibility Question Step',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _eligibilityQuestionCardCode
            : _eligibilityQuestionCode;
        final child = variant == 'Card style'
            ? const _EligibilityQuestionCardMockup()
            : const _EligibilityQuestionMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Eligibility Question Step',
          description:
              'A single question step in the eligibility wizard flow. '
              'Shows a progress indicator, question with helper text, '
              'and radio options for the user to answer. '
              'Use the [Variant] knob to toggle layouts.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Eligibility Question – Default Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityQuestionMockup extends StatefulWidget {
  const _EligibilityQuestionMockup();

  @override
  State<_EligibilityQuestionMockup> createState() =>
      _EligibilityQuestionMockupState();
}

class _EligibilityQuestionMockupState
    extends State<_EligibilityQuestionMockup> {
  String? _selected = 'yes';

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress indicator
                  Text(
                    'Question 1 of 5',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.neutral200
                          : Ux4gPalette.neutral700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildGradientProgress(context, 0.2),
                  const SizedBox(height: 20),

                  // Question
                  Text(
                    'Are you a resident of Maharashtra?',
                    style: Theme.of(context)
                        .extension<Ux4gTypography>()
                        ?.hS_strong
                        ?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral50
                              : Ux4gPalette.neutral900,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You must be a resident to apply for a state-issued income certificate.',
                    style: Theme.of(context)
                        .extension<Ux4gTypography>()
                        ?.bS_default
                        ?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral200
                              : Ux4gPalette.neutral700,
                        ),
                  ),
                  const SizedBox(height: 24),

                  // Radio options
                  GestureDetector(
                    onTap: () => setState(() => _selected = 'yes'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: _selected == 'yes'
                            ? Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.primary900
                                  : Ux4gPalette.primary50
                            : Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral800
                            : Ux4gPalette.neutral100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selected == 'yes'
                                    ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.primary300
                                          : Ux4gPalette.primary600
                                    : Theme.of(context).brightness ==
                                          Brightness.dark
                                    ? Ux4gPalette.neutral700
                                    : Ux4gPalette.neutral200,
                                width: _selected == 'yes' ? 6 : 2,
                              ),
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral900
                                  : Ux4gPalette.neutral0,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: _selected == 'yes'
                                        ? Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Ux4gPalette.primary300
                                              : Ux4gPalette.primary600
                                        : Theme.of(context).brightness ==
                                              Brightness.dark
                                        ? Ux4gPalette.neutral50
                                        : Ux4gPalette.neutral900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'I am a resident of Maharashtra',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => setState(() => _selected = 'no'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: _selected == 'no'
                            ? Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.primary900
                                  : Ux4gPalette.primary50
                            : Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral800
                            : Ux4gPalette.neutral100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selected == 'no'
                                    ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.primary300
                                          : Ux4gPalette.primary600
                                    : Theme.of(context).brightness ==
                                          Brightness.dark
                                    ? Ux4gPalette.neutral700
                                    : Ux4gPalette.neutral200,
                                width: _selected == 'no' ? 6 : 2,
                              ),
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral900
                                  : Ux4gPalette.neutral0,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: _selected == 'no'
                                        ? Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Ux4gPalette.primary300
                                              : Ux4gPalette.primary600
                                        : Theme.of(context).brightness ==
                                              Brightness.dark
                                        ? Ux4gPalette.neutral50
                                        : Ux4gPalette.neutral900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'I reside in a different state',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom actions
          Ux4gDivider(
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gPalette.neutral800
                : Color(0xFFE5E7EB),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Column(
              children: [
                Ux4gButton(
                  height: 48,
                  text: 'Continue',
                  onPressed: _selected != null ? () {} : null,
                  size: Ux4gButtonSize.large,
                  width: double.infinity,
                ),
                const SizedBox(height: 4),
                Ux4gButton(
                  height: 48,
                  text: 'Back',
                  onPressed: () {},
                  variant: Ux4gButtonVariant.ghost,
                  size: Ux4gButtonSize.large,
                  width: double.infinity,
                  contentColor: Theme.of(context).brightness == Brightness.dark
                      ? Ux4gPalette.primary300
                      : Ux4gPalette.primary600,
                ),
              ],
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral500
                        : Ux4gPalette.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Image.asset(
                  _digitalIndiaLogoPath,
                  height: 22,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Eligibility Question – Card Style Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityQuestionCardMockup extends StatefulWidget {
  const _EligibilityQuestionCardMockup();

  @override
  State<_EligibilityQuestionCardMockup> createState() =>
      _EligibilityQuestionCardMockupState();
}

class _EligibilityQuestionCardMockupState
    extends State<_EligibilityQuestionCardMockup> {
  String? _selected = 'yes';

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary900
                  : Ux4gPalette.primary50,
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverFillRemaining(
                            hasScrollBody: false,
                            child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral900
                              : Ux4gPalette.neutral0,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Progress indicator
                            Text(
                              'Question 1 of 5',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildGradientProgress(context, 0.2),
                            const SizedBox(height: 20),

                            // Question
                            Text(
                              'Are you a resident of Maharashtra?',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                                height: 1.3,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'You must be a resident to apply for a state-issued income certificate.',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Radio options
                            GestureDetector(
                              onTap: () => setState(() => _selected = 'yes'),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: _selected == 'yes'
                                      ? Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.primary900
                                            : Ux4gPalette.primary50
                                      : Theme.of(context).brightness ==
                                            Brightness.dark
                                      ? Ux4gPalette.neutral800
                                      : Ux4gPalette.neutral100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selected == 'yes'
                                              ? Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gPalette.primary300
                                                    : Ux4gPalette.primary600
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Ux4gPalette.neutral700
                                              : Ux4gPalette.neutral200,
                                          width: _selected == 'yes' ? 6 : 2,
                                        ),
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral900
                                            : Ux4gPalette.neutral0,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Yes',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: _selected == 'yes'
                                                  ? Theme.of(
                                                              context,
                                                            ).brightness ==
                                                            Brightness.dark
                                                        ? Ux4gPalette.primary300
                                                        : Ux4gPalette.primary600
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Ux4gPalette.neutral50
                                                  : Ux4gPalette.neutral900,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'I am a resident of Maharashtra',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => setState(() => _selected = 'no'),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: _selected == 'no'
                                      ? Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.primary900
                                            : Ux4gPalette.primary50
                                      : Theme.of(context).brightness ==
                                            Brightness.dark
                                      ? Ux4gPalette.neutral800
                                      : Ux4gPalette.neutral100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selected == 'no'
                                              ? Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gPalette.primary300
                                                    : Ux4gPalette.primary600
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Ux4gPalette.neutral700
                                              : Ux4gPalette.neutral200,
                                          width: _selected == 'no' ? 6 : 2,
                                        ),
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral900
                                            : Ux4gPalette.neutral0,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'No',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: _selected == 'no'
                                                  ? Theme.of(
                                                              context,
                                                            ).brightness ==
                                                            Brightness.dark
                                                        ? Ux4gPalette.primary300
                                                        : Ux4gPalette.primary600
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Ux4gPalette.neutral50
                                                  : Ux4gPalette.neutral900,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'I reside in a different state',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                                                ),
                          ),
                        ],
                      ),
                  ),

                  // Actions (outside card, in purple area)
                  Ux4gDivider(
                    thickness: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: Column(
                      children: [
                        Ux4gButton(
                          height: 48,
                          text: 'Continue',
                          onPressed: _selected != null ? () {} : null,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 4),
                        Ux4gButton(
                          height: 48,
                          text: 'Back',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.primary300
                              : Ux4gPalette.primary600,
                        ),
                      ],
                    ),
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral500
                                : Ux4gPalette.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets – Question Step
// ───────────────────────────────────────────────────────────────────────

const _eligibilityQuestionCode = r'''// Eligibility Question Step – Flat Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32, colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                SizedBox(height: 20, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200)),
                SvgPicture.asset(
                          Ux4gIcons.union, 
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
              ],
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress
                    Text('Question 1 of 5', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                    SizedBox(height: 8),
                    Ux4gLinearProgress(
                      value: 0.2,
                      height: 6,
                      gradientColors: Theme.of(context).brightness == Brightness.dark ? const [Ux4gPalette.primary200A, Ux4gPalette.primary300] : const [Ux4gPalette.primary200A, Ux4gPalette.primary600],
                      trackColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB),
                    ),
                    SizedBox(height: 20),

                    // Question
                    Text(
                      'Are you a resident of Maharashtra?',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900, height: 1.3),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You must be a resident to apply for a state-issued income certificate.',
                      style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.5),
                    ),
                    SizedBox(height: 24),

                    // Radio option – Yes (selected)
                    GestureDetector(
                      onTap: () => setState(() => _selected = 'yes'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 22, height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600, width: 6),
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                              ),
                            ),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Yes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600)),
                                Text('I am a resident of Maharashtra', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Radio option – No (unselected)
                    GestureDetector(
                      onTap: () => setState(() => _selected = 'no'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 22, height: 22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200, width: 2),
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                              ),
                            ),
                            SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('No', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                                Text('I reside in a different state', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Column(
                children: [
                  Ux4gButton(height: 48, 
                    text: 'Continue',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 4),
                  Ux4gButton(height: 48, 
                    text: 'Back',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400, fontWeight: FontWeight.w500)),
                  SizedBox(height: 6),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

const _eligibilityQuestionCardCode =
    r'''// Eligibility Question Step – Card Style Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header ...
            // Same header as flat layout

            Expanded(
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50, // Soft purple background
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverFillRemaining(
                              hasScrollBody: false,
                              child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(0, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Progress indicator
                              Text('Question 1 of 5', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                              SizedBox(height: 8),
                              LinearProgressIndicator(value: 0.2, minHeight: 6),
                              SizedBox(height: 20),

                              // Question
                              Text('Are you a resident of Maharashtra?', style: Theme.of(context).extension<Ux4gTypography>()?.hS_strong),
                              SizedBox(height: 10),
                              Text('You must be a resident to apply...', style: Theme.of(context).extension<Ux4gTypography>()?.bS_default?.copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                              SizedBox(height: 24),

                              // Radio options (same as flat layout)
                              // ... Yes / No cards
                            ],
                          ),
                        ),
                                                    ),
                            ),
                          ],
                        ),
                    ),

                    // Continue / Back buttons (outside card)
                    Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                      child: Column(children: [
                        Ux4gButton(height: 48, text: 'Continue', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                        SizedBox(height: 4),
                        Ux4gButton(height: 48, text: 'Back', onPressed: () {}, variant: Ux4gButtonVariant.ghost, size: Ux4gButtonSize.large, width: double.infinity),
                      ]),
                    ),

                    // Footer
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 12),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
                        SizedBox(height: 6),
                        Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

// ───────────────────────────────────────────────────────────────────────
// Eligibility Success Step
// ───────────────────────────────────────────────────────────────────────

final eligibilitySuccessStepComponent = WidgetbookComponent(
  name: 'Eligibility Success Step',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _eligibilitySuccessCardCode
            : _eligibilitySuccessCode;
        final child = variant == 'Card style'
            ? const _EligibilitySuccessCardMockup()
            : const _EligibilitySuccessMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Eligibility Success Step',
          description:
              'The final success screen of the eligibility wizard flow. '
              'Shows a success message, a list of met criteria, and a call-to-action to apply.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Eligibility Success – Default Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilitySuccessMockup extends StatelessWidget {
  const _EligibilitySuccessMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Color(0xFFBBF7D0),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xFF15803D),
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'You\'re Eligible!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF065F46),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'All criteria have been met. You can now proceed to apply for this service.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.neutral200
                          : Ux4gPalette.neutral700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Ux4gDivider(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 20),

                  // Criteria list
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Eligibility Criteria',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral50
                            : Ux4gPalette.neutral900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Age requirement met (18 years or above)',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Valid government-issued ID submitted',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Residential address confirmed',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Income within eligible range',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'No outstanding dues or penalties',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom actions
          Ux4gDivider(
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gPalette.neutral800
                : Color(0xFFE5E7EB),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Ux4gButton(
              height: 48,
              text: 'Apply Now',
              onPressed: () {},
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral500
                        : Ux4gPalette.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Image.asset(
                  _digitalIndiaLogoPath,
                  height: 22,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Eligibility Success – Card Style Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilitySuccessCardMockup extends StatelessWidget {
  const _EligibilitySuccessCardMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary900
                  : Ux4gPalette.primary50,
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverFillRemaining(
                            hasScrollBody: false,
                            child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral900
                              : Ux4gPalette.neutral0,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color(0xFFBBF7D0),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check_circle,
                                color: Color(0xFF15803D),
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'You\'re Eligible!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF065F46),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'All criteria have been met. You can now proceed to apply for this service.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Ux4gDivider(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral800
                                  : Color(0xFFE5E7EB),
                            ),
                            const SizedBox(height: 20),

                            // Criteria list
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Eligibility Criteria',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.neutral50
                                      : Ux4gPalette.neutral900,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Age requirement met (18 years or above)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Valid government-issued ID submitted',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Residential address confirmed',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Income within eligible range',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'No outstanding dues or penalties',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                                                ),
                          ),
                        ],
                      ),
                  ),

                  // Bottom actions (outside card)
                  Ux4gDivider(
                    thickness: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Ux4gButton(
                      height: 48,
                      text: 'Apply Now',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral500
                                : Ux4gPalette.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Criteria Item Builder
// ───────────────────────────────────────────────────────────────────────

Widget _buildGradientProgress(BuildContext context, double value) {
  return Ux4gLinearProgress(
    value: value,
    height: 6,
    gradientColors: Theme.of(context).brightness == Brightness.dark
        ? const [Ux4gPalette.primary200A, Ux4gPalette.primary300]
        : const [Ux4gPalette.primary200A, Ux4gPalette.primary600],
    trackColor: Theme.of(context).brightness == Brightness.dark
        ? Ux4gPalette.neutral800
        : Color(0xFFE5E7EB),
  );
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Snippets – Success Step
// ───────────────────────────────────────────────────────────────────────

const _eligibilitySuccessCode = r'''// Eligibility Success Step – Flat Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32, colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                SizedBox(height: 20, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200)),
                SvgPicture.asset(
                          Ux4gIcons.union, 
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
              ],
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Success Icon
                    Container(
                      width: 64, height: 64,
                      decoration: BoxDecoration(color: Color(0xFFBBF7D0), shape: BoxShape.circle),
                      child: Icon(Icons.check_circle, color: Color(0xFF15803D), size: 32),
                    ),
                    SizedBox(height: 16),
            
                    // Title
                    Text(
                      "You're Eligible!",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF065F46)),
                    ),
                    SizedBox(height: 12),
            
                    // Subtitle
                    Text(
                      'All criteria have been met. You can now proceed to apply for this service.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.5),
                    ),
                    SizedBox(height: 24),
                    Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                    SizedBox(height: 20),
            
                    // Criteria List
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Eligibility Criteria', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Age requirement met (18 years or above)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Valid government-issued ID submitted', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Residential address confirmed', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Income within eligible range', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('No outstanding dues or penalties', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Ux4gButton(height: 48, 
                text: 'Apply Now',
                onPressed: () {},
                size: Ux4gButtonSize.large,
                width: double.infinity,
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400, fontWeight: FontWeight.w500)),
                  SizedBox(height: 6),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

const _eligibilitySuccessCardCode =
    r'''// Eligibility Success Step – Card Style Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header ...
            // Same header as flat layout

            Expanded(
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50, // Soft purple background
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverFillRemaining(
                              hasScrollBody: false,
                              child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(0, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Success Icon
                              Container(
                                width: 64, height: 64,
                                decoration: BoxDecoration(color: Color(0xFFBBF7D0), shape: BoxShape.circle),
                                child: Icon(Icons.check_circle, color: Color(0xFF15803D), size: 32),
                              ),
                              SizedBox(height: 16),
                      
                              // Title
                              Text("You're Eligible!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF065F46))),
                              SizedBox(height: 12),
                      
                              // Subtitle
                              Text('All criteria have been met. You can now proceed...', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                              SizedBox(height: 24),
                              Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                              SizedBox(height: 20),
                      
                              // Criteria list
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Eligibility Criteria', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                              ),
                              SizedBox(height: 16),
                              // ... Criteria items
                            ],
                          ),
                        ),
                                                    ),
                            ),
                          ],
                        ),
                    ),

                    // Apply Now button (outside card)
                    Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Ux4gButton(height: 48, text: 'Apply Now', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                    ),

                    // Footer
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 12),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
                        SizedBox(height: 6),
                        Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

// ───────────────────────────────────────────────────────────────────────
// Eligibility Failure Step
// ───────────────────────────────────────────────────────────────────────

final eligibilityFailureStepComponent = WidgetbookComponent(
  name: 'Eligibility Failure Step',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _eligibilityFailureCardCode
            : _eligibilityFailureCode;
        final child = variant == 'Card style'
            ? const _EligibilityFailureCardMockup()
            : const _EligibilityFailureMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Eligibility Failure Step',
          description:
              'The failure screen of the eligibility wizard flow when criteria are not met. '
              'Shows a red cross, failure message, and a list of criteria highlighting failures.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Eligibility Failure – Default Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityFailureMockup extends StatelessWidget {
  const _EligibilityFailureMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.red900
                          : Ux4gPalette.red100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.cancel,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.red400
                          : Ux4gPalette.red600,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Not Eligible',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.red200
                          : Ux4gPalette.red800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Unfortunately, you do not meet all the required criteria for this service at this time.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.neutral200
                          : Ux4gPalette.neutral700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Ux4gDivider(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 20),

                  // Criteria list
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Eligibility Criteria',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral50
                            : Ux4gPalette.neutral900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Age requirement met (18 years or above)',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Valid government-issued ID submitted',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Residential address confirmed',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Income within eligible range',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.red900
                                : Ux4gPalette.red100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.red400
                                : Ux4gPalette.red600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'No outstanding dues or penalties',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom actions
          Ux4gDivider(
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gPalette.neutral800
                : Color(0xFFE5E7EB),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Ux4gButton(
              height: 48,
              text: 'Explore Alternatives',
              onPressed: () {},
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral500
                        : Ux4gPalette.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Image.asset(
                  _digitalIndiaLogoPath,
                  height: 22,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Eligibility Failure – Card Style Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityFailureCardMockup extends StatelessWidget {
  const _EligibilityFailureCardMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary900
                  : Ux4gPalette.primary50,
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverFillRemaining(
                            hasScrollBody: false,
                            child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral900
                              : Ux4gPalette.neutral0,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.red900
                                    : Ux4gPalette.red100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.red400
                                    : Ux4gPalette.red600,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Not Eligible',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.red200
                                    : Ux4gPalette.red800,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Unfortunately, you do not meet all the required criteria for this service at this time.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Ux4gDivider(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral800
                                  : Color(0xFFE5E7EB),
                            ),
                            const SizedBox(height: 20),

                            // Criteria list
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Eligibility Criteria',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.neutral50
                                      : Ux4gPalette.neutral900,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Age requirement met (18 years or above)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Valid government-issued ID submitted',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Residential address confirmed',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Income within eligible range',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.red900
                                          : Ux4gPalette.red100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.red400
                                          : Ux4gPalette.red600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'No outstanding dues or penalties',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                                                ),
                          ),
                        ],
                      ),
                  ),

                  // Bottom actions (outside card)
                  Ux4gDivider(
                    thickness: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Ux4gButton(
                      height: 48,
                      text: 'Explore Alternatives',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral500
                                : Ux4gPalette.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _eligibilityFailureCode = r'''// Eligibility Failure Step – Flat Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32, colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                SizedBox(height: 20, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200)),
                SvgPicture.asset(
                          Ux4gIcons.union, 
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
              ],
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Failure Icon
                    Container(
                      width: 64, height: 64,
                      decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red900 : Ux4gPalette.red100, shape: BoxShape.circle),
                      child: Icon(Icons.close, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red400 : Ux4gPalette.red600, size: 32),
                    ),
                    SizedBox(height: 16),
            
                    // Title
                    Text(
                      "Not Eligible",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red200 : Ux4gPalette.red800),
                    ),
                    SizedBox(height: 12),
            
                    // Subtitle
                    Text(
                      'Unfortunately, you do not meet all the required criteria for this service at this time.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.5),
                    ),
                    SizedBox(height: 24),
                    Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                    SizedBox(height: 20),
            
                    // Criteria List
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Eligibility Criteria', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Age requirement met (18 years or above)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Valid government-issued ID submitted', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Residential address confirmed', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Income within eligible range', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red900 : Ux4gPalette.red100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.close, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red400 : Ux4gPalette.red600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('No outstanding dues or penalties', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Ux4gButton(height: 48, 
                text: 'Explore Alternatives',
                onPressed: () {},
                size: Ux4gButtonSize.large,
                width: double.infinity,
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400, fontWeight: FontWeight.w500)),
                  SizedBox(height: 6),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

const _eligibilityFailureCardCode =
    r'''// Eligibility Failure Step – Card Style Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header ...
            // Same header as flat layout

            Expanded(
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50, // Soft purple background
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverFillRemaining(
                              hasScrollBody: false,
                              child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(0, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Failure Icon
                              Container(
                                width: 64, height: 64,
                                decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red900 : Ux4gPalette.red100, shape: BoxShape.circle),
                                child: Icon(Icons.close, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red400 : Ux4gPalette.red600, size: 32),
                              ),
                              SizedBox(height: 16),
                      
                              // Title
                              Text("Not Eligible", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.red200 : Ux4gPalette.red800)),
                              SizedBox(height: 12),
                      
                              // Subtitle
                              Text('Unfortunately, you do not meet all the required...', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                              SizedBox(height: 24),
                              Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                              SizedBox(height: 20),
                      
                              // Criteria list
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Eligibility Criteria', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                              ),
                              SizedBox(height: 16),
                              // ... Criteria items with isMet: false for failed ones
                            ],
                          ),
                        ),
                                                    ),
                            ),
                          ],
                        ),
                    ),

                    // Explore Alternatives button (outside card)
                    Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Ux4gButton(height: 48, text: 'Explore Alternatives', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                    ),

                    // Footer
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 12),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
                        SizedBox(height: 6),
                        Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

// ───────────────────────────────────────────────────────────────────────
// Eligibility Warning Step
// ───────────────────────────────────────────────────────────────────────

final eligibilityWarningStepComponent = WidgetbookComponent(
  name: 'Eligibility Warning Step',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _eligibilityWarningCardCode
            : _eligibilityWarningCode;
        final child = variant == 'Card style'
            ? const _EligibilityWarningCardMockup()
            : const _EligibilityWarningMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Eligibility Warning Step',
          description:
              'The warning screen of the eligibility wizard flow when some criteria require manual review. '
              'Shows an orange warning icon, message, and a list of criteria highlighting unconfirmed ones.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Eligibility Warning – Default Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityWarningMockup extends StatelessWidget {
  const _EligibilityWarningMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.orange900
                          : Ux4gPalette.orange100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.warning,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.orange400
                          : Ux4gPalette.orange600,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'You May Be Eligible',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.orange200
                          : Ux4gPalette.orange800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'One or more criteria could not be confirmed automatically. An officer will review and verify your eligibility.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.neutral200
                          : Ux4gPalette.neutral700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Ux4gDivider(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 20),

                  // Criteria list
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Eligibility Criteria',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral50
                            : Ux4gPalette.neutral900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Age requirement met (18 years or above)',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Valid government-issued ID submitted',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Residential address confirmed',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Income within eligible range',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.orange900
                                : Ux4gPalette.orange100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.orange400
                                  : Ux4gPalette.orange600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'No outstanding dues or penalties',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green900
                                : Ux4gPalette.green100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.green400
                                : Ux4gPalette.green600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom actions
          Ux4gDivider(
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gPalette.neutral800
                : Color(0xFFE5E7EB),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Ux4gButton(
              height: 48,
              text: 'Proceed to Apply',
              onPressed: () {},
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral500
                        : Ux4gPalette.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Image.asset(
                  _digitalIndiaLogoPath,
                  height: 22,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Eligibility Warning – Card Style Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityWarningCardMockup extends StatelessWidget {
  const _EligibilityWarningCardMockup();

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary900
                  : Ux4gPalette.primary50,
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverFillRemaining(
                            hasScrollBody: false,
                            child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral900
                              : Ux4gPalette.neutral0,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.orange900
                                    : Ux4gPalette.orange100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.warning,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.orange400
                                    : Ux4gPalette.orange600,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'You May Be Eligible',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.orange200
                                    : Ux4gPalette.orange800,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'One or more criteria could not be confirmed automatically. An officer will review and verify your eligibility.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Ux4gDivider(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral800
                                  : Color(0xFFE5E7EB),
                            ),
                            const SizedBox(height: 20),

                            // Criteria list
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Eligibility Criteria',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.neutral50
                                      : Ux4gPalette.neutral900,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Age requirement met (18 years or above)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Valid government-issued ID submitted',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Residential address confirmed',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Income within eligible range',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.orange900
                                          : Ux4gPalette.orange100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      '?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.orange400
                                            : Ux4gPalette.orange600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'No outstanding dues or penalties',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral200
                                            : Ux4gPalette.neutral700,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green900
                                          : Ux4gPalette.green100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.green400
                                          : Ux4gPalette.green600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                                                ),
                          ),
                        ],
                      ),
                  ),

                  // Bottom actions (outside card)
                  Ux4gDivider(
                    thickness: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Ux4gButton(
                      height: 48,
                      text: 'Proceed to Apply',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral500
                                : Ux4gPalette.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _eligibilityWarningCode = r'''// Eligibility Warning Step – Flat Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32, colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                SizedBox(height: 20, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200)),
                SvgPicture.asset(
                          Ux4gIcons.union, 
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
              ],
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Warning Icon
                    Container(
                      width: 64, height: 64,
                      decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange900 : Ux4gPalette.orange100, shape: BoxShape.circle),
                      child: Icon(Icons.warning, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange400 : Ux4gPalette.orange600, size: 32),
                    ),
                    SizedBox(height: 16),
            
                    // Title
                    Text(
                      "You May Be Eligible",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange200 : Ux4gPalette.orange800),
                    ),
                    SizedBox(height: 12),
            
                    // Subtitle
                    Text(
                      'One or more criteria could not be confirmed automatically. An officer will review and verify your eligibility.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.5),
                    ),
                    SizedBox(height: 24),
                    Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                    SizedBox(height: 20),
            
                    // Criteria List
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Eligibility Criteria', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Age requirement met (18 years or above)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Valid government-issued ID submitted', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Residential address confirmed', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('Income within eligible range', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange900 : Ux4gPalette.orange100, borderRadius: BorderRadius.circular(4)), child: Text('?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange400 : Ux4gPalette.orange600))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text('No outstanding dues or penalties', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700, height: 1.4))),
                          SizedBox(width: 12),
                          Container(width: 20, height: 20, alignment: Alignment.center, decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green900 : Ux4gPalette.green100, borderRadius: BorderRadius.circular(4)), child: Icon(Icons.check, size: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.green400 : Ux4gPalette.green600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Ux4gButton(height: 48, 
                text: 'Proceed to Apply',
                onPressed: () {},
                size: Ux4gButtonSize.large,
                width: double.infinity,
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400, fontWeight: FontWeight.w500)),
                  SizedBox(height: 6),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

const _eligibilityWarningCardCode =
    r'''// Eligibility Warning Step – Card Style Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // Header ...
            // Same header as flat layout

            Expanded(
              child: Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50, // Soft purple background
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.all(16),
                            sliver: SliverFillRemaining(
                              hasScrollBody: false,
                              child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(0, 4))],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Warning Icon
                              Container(
                                width: 64, height: 64,
                                decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange900 : Ux4gPalette.orange100, shape: BoxShape.circle),
                                child: Icon(Icons.warning, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange400 : Ux4gPalette.orange600, size: 32),
                              ),
                              SizedBox(height: 16),
                      
                              // Title
                              Text("You May Be Eligible", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange200 : Ux4gPalette.orange800)),
                              SizedBox(height: 12),
                      
                              // Subtitle
                              Text('One or more criteria could not be confirmed...', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                              SizedBox(height: 24),
                              Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                              SizedBox(height: 20),
                      
                              // Criteria list
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Eligibility Criteria', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                              ),
                              SizedBox(height: 16),
                              // ... Criteria items with isMet: null for warnings
                            ],
                          ),
                        ),
                                                    ),
                            ),
                          ],
                        ),
                    ),

                    // Proceed to Apply button (outside card)
                    Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Ux4gButton(height: 48, text: 'Proceed to Apply', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                    ),

                    // Footer
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 12),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
                        SizedBox(height: 6),
                        Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''';

// ───────────────────────────────────────────────────────────────────────
// Eligibility Final Question Step
// ───────────────────────────────────────────────────────────────────────

final eligibilityFinalQuestionStepComponent = WidgetbookComponent(
  name: 'Eligibility Final Question Step',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _eligibilityFinalQuestionCardCode
            : _eligibilityFinalQuestionCode;
        final child = variant == 'Card style'
            ? const _EligibilityFinalQuestionCardMockup()
            : const _EligibilityFinalQuestionMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Eligibility Final Question Step',
          description:
              'The final question step in the eligibility wizard flow before checking eligibility. '
              'Shows a near-complete progress indicator, a question, '
              'multiple radio options, and a Check Eligibility call-to-action.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Eligibility Final Question – Default Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityFinalQuestionMockup extends StatefulWidget {
  const _EligibilityFinalQuestionMockup();

  @override
  State<_EligibilityFinalQuestionMockup> createState() =>
      _EligibilityFinalQuestionMockupState();
}

class _EligibilityFinalQuestionMockupState
    extends State<_EligibilityFinalQuestionMockup> {
  String? _selected = 'first_time';

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress indicator
                  Text(
                    'Question 5 of 5',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.neutral200
                          : Ux4gPalette.neutral700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildGradientProgress(context, 0.9),
                  const SizedBox(height: 20),

                  // Question
                  Text(
                    'Have you applied for this certificate before in the last 1 year?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gPalette.neutral50
                          : Ux4gPalette.neutral900,
                      height: 1.3,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Radio options
                  GestureDetector(
                    onTap: () => setState(() => _selected = 'first_time'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: _selected == 'first_time'
                            ? Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.primary900
                                  : Ux4gPalette.primary50
                            : Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral800
                            : Ux4gPalette.neutral100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selected == 'first_time'
                                    ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.primary300
                                          : Ux4gPalette.primary600
                                    : Theme.of(context).brightness ==
                                          Brightness.dark
                                    ? Ux4gPalette.neutral700
                                    : Ux4gPalette.neutral200,
                                width: _selected == 'first_time' ? 6 : 2,
                              ),
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral900
                                  : Ux4gPalette.neutral0,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No, I haven't applied before",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: _selected == 'first_time'
                                        ? Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Ux4gPalette.primary300
                                              : Ux4gPalette.primary600
                                        : Theme.of(context).brightness ==
                                              Brightness.dark
                                        ? Ux4gPalette.neutral50
                                        : Ux4gPalette.neutral900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'First-time applicant for this certificate',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => setState(() => _selected = 'expired_rejected'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: _selected == 'expired_rejected'
                            ? Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.primary900
                                  : Ux4gPalette.primary50
                            : Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral800
                            : Ux4gPalette.neutral100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selected == 'expired_rejected'
                                    ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.primary300
                                          : Ux4gPalette.primary600
                                    : Theme.of(context).brightness ==
                                          Brightness.dark
                                    ? Ux4gPalette.neutral700
                                    : Ux4gPalette.neutral200,
                                width: _selected == 'expired_rejected' ? 6 : 2,
                              ),
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral900
                                  : Ux4gPalette.neutral0,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Yes, but it expired or was rejected',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: _selected == 'expired_rejected'
                                        ? Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Ux4gPalette.primary300
                                              : Ux4gPalette.primary600
                                        : Theme.of(context).brightness ==
                                              Brightness.dark
                                        ? Ux4gPalette.neutral50
                                        : Ux4gPalette.neutral900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Previously held certificate has expired o...',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => setState(() => _selected = 'currently_valid'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: _selected == 'currently_valid'
                            ? Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.primary900
                                  : Ux4gPalette.primary50
                            : Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.neutral800
                            : Ux4gPalette.neutral100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selected == 'currently_valid'
                                    ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.primary300
                                          : Ux4gPalette.primary600
                                    : Theme.of(context).brightness ==
                                          Brightness.dark
                                    ? Ux4gPalette.neutral700
                                    : Ux4gPalette.neutral200,
                                width: _selected == 'currently_valid' ? 6 : 2,
                              ),
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral900
                                  : Ux4gPalette.neutral0,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Yes, I currently have a valid certificate',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: _selected == 'currently_valid'
                                        ? Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Ux4gPalette.primary300
                                              : Ux4gPalette.primary600
                                        : Theme.of(context).brightness ==
                                              Brightness.dark
                                        ? Ux4gPalette.neutral50
                                        : Ux4gPalette.neutral900,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Currently holding a valid certificate',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral200
                                        : Ux4gPalette.neutral700,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Actions
          Ux4gDivider(
            thickness: 1,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gPalette.neutral800
                : Color(0xFFE5E7EB),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Ux4gButton(
              height: 48,
              text: 'Check Eligibility',
              onPressed: _selected != null ? () {} : null,
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by -',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral500
                        : Ux4gPalette.neutral400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Image.asset(
                  _digitalIndiaLogoPath,
                  height: 22,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Eligibility Final Question – Card Style Mockup
// ───────────────────────────────────────────────────────────────────────

class _EligibilityFinalQuestionCardMockup extends StatefulWidget {
  const _EligibilityFinalQuestionCardMockup();

  @override
  State<_EligibilityFinalQuestionCardMockup> createState() =>
      _EligibilityFinalQuestionCardMockupState();
}

class _EligibilityFinalQuestionCardMockupState
    extends State<_EligibilityFinalQuestionCardMockup> {
  String? _selected = 'first_time';

  @override
  Widget build(BuildContext context) {
    return _PhoneFrame(
      child: Column(
        children: [
          const _EligibilityHeader(),
          Expanded(
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary900
                  : Ux4gPalette.primary50,
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverFillRemaining(
                            hasScrollBody: false,
                            child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral900
                              : Ux4gPalette.neutral0,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Progress indicator
                            Text(
                              'Question 5 of 5',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral200
                                    : Ux4gPalette.neutral700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildGradientProgress(context, 0.9),
                            const SizedBox(height: 20),

                            // Question
                            Text(
                              'Have you applied for this certificate before in the last 1 year?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                                height: 1.3,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Radio options
                            GestureDetector(
                              onTap: () =>
                                  setState(() => _selected = 'first_time'),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: _selected == 'first_time'
                                      ? Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.primary900
                                            : Ux4gPalette.primary50
                                      : Theme.of(context).brightness ==
                                            Brightness.dark
                                      ? Ux4gPalette.neutral800
                                      : Ux4gPalette.neutral100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selected == 'first_time'
                                              ? Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gPalette.primary300
                                                    : Ux4gPalette.primary600
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Ux4gPalette.neutral700
                                              : Ux4gPalette.neutral200,
                                          width: _selected == 'first_time'
                                              ? 6
                                              : 2,
                                        ),
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral900
                                            : Ux4gPalette.neutral0,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "No, I haven't applied before",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: _selected == 'first_time'
                                                  ? Theme.of(
                                                              context,
                                                            ).brightness ==
                                                            Brightness.dark
                                                        ? Ux4gPalette.primary300
                                                        : Ux4gPalette.primary600
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Ux4gPalette.neutral50
                                                  : Ux4gPalette.neutral900,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'First-time applicant for this certificate',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => setState(
                                () => _selected = 'expired_rejected',
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: _selected == 'expired_rejected'
                                      ? Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.primary900
                                            : Ux4gPalette.primary50
                                      : Theme.of(context).brightness ==
                                            Brightness.dark
                                      ? Ux4gPalette.neutral800
                                      : Ux4gPalette.neutral100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selected == 'expired_rejected'
                                              ? Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gPalette.primary300
                                                    : Ux4gPalette.primary600
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Ux4gPalette.neutral700
                                              : Ux4gPalette.neutral200,
                                          width: _selected == 'expired_rejected'
                                              ? 6
                                              : 2,
                                        ),
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral900
                                            : Ux4gPalette.neutral0,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Yes, but it expired or was rejected',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  _selected ==
                                                      'expired_rejected'
                                                  ? Theme.of(
                                                              context,
                                                            ).brightness ==
                                                            Brightness.dark
                                                        ? Ux4gPalette.primary300
                                                        : Ux4gPalette.primary600
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Ux4gPalette.neutral50
                                                  : Ux4gPalette.neutral900,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Previously held certificate has expired o...',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () =>
                                  setState(() => _selected = 'currently_valid'),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: _selected == 'currently_valid'
                                      ? Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.primary900
                                            : Ux4gPalette.primary50
                                      : Theme.of(context).brightness ==
                                            Brightness.dark
                                      ? Ux4gPalette.neutral800
                                      : Ux4gPalette.neutral100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _selected == 'currently_valid'
                                              ? Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Ux4gPalette.primary300
                                                    : Ux4gPalette.primary600
                                              : Theme.of(context).brightness ==
                                                    Brightness.dark
                                              ? Ux4gPalette.neutral700
                                              : Ux4gPalette.neutral200,
                                          width: _selected == 'currently_valid'
                                              ? 6
                                              : 2,
                                        ),
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.neutral900
                                            : Ux4gPalette.neutral0,
                                      ),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Yes, I currently have a valid certificate',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  _selected == 'currently_valid'
                                                  ? Theme.of(
                                                              context,
                                                            ).brightness ==
                                                            Brightness.dark
                                                        ? Ux4gPalette.primary300
                                                        : Ux4gPalette.primary600
                                                  : Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                  ? Ux4gPalette.neutral50
                                                  : Ux4gPalette.neutral900,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Currently holding a valid certificate',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Ux4gPalette.neutral200
                                                  : Ux4gPalette.neutral700,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                                                ),
                          ),
                        ],
                      ),
                  ),

                  // Actions (outside card)
                  Ux4gDivider(
                    thickness: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: Ux4gButton(
                      height: 48,
                      text: 'Check Eligibility',
                      onPressed: _selected != null ? () {} : null,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral500
                                : Ux4gPalette.neutral400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _eligibilityFinalQuestionCode =
    r'''// Eligibility Final Question Step – Flat Layout
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: class FinalQuestionScreen extends StatefulWidget {
          @override
          State<FinalQuestionScreen> createState() => _FinalQuestionScreenState();
        }

        class _FinalQuestionScreenState extends State<FinalQuestionScreen> {
          String? _selected = 'first_time';

          @override
          Widget build(BuildContext context) {
            return Column(
              children: [
                // Header
                Ux4gAppHeader(
                  variant: Ux4gAppHeaderVariant.light,
                  title: '',
                  leadingWidgets: [
                    SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 32, colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                    SizedBox(height: 20, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200)),
                    SvgPicture.asset(
                          Ux4gIcons.union, 
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.primary300
                                : Ux4gPalette.primary600,
                            BlendMode.srcIn,
                          ),
                        ),
                  ],
                  horizontalPadding: 16,
                  leadingSpacing: 8,
                ),
                Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Progress
                        Text('Question 5 of 5', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                        SizedBox(height: 8),
                        Ux4gLinearProgress(
                          value: 0.9,
                          height: 6,
                          gradientColors: Theme.of(context).brightness == Brightness.dark ? const [Ux4gPalette.primary200A, Ux4gPalette.primary300] : const [Ux4gPalette.primary200A, Ux4gPalette.primary600],
                          trackColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB),
                        ),
                        SizedBox(height: 20),

                        // Question
                        Text(
                          'Have you applied for this certificate before in the last 1 year?',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900, height: 1.3),
                        ),
                        SizedBox(height: 24),

                        // Radio Options
                        GestureDetector(
                          onTap: () => setState(() => _selected = 'first_time'),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: _selected == 'first_time' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 22, height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: _selected == 'first_time' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200, width: _selected == 'first_time' ? 6 : 2),
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("No, I haven't applied before", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _selected == 'first_time' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                                      SizedBox(height: 2),
                                      Text('First-time applicant for this certificate', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () => setState(() => _selected = 'expired_rejected'),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: _selected == 'expired_rejected' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 22, height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: _selected == 'expired_rejected' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200, width: _selected == 'expired_rejected' ? 6 : 2),
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Yes, but it expired or was rejected', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _selected == 'expired_rejected' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                                      SizedBox(height: 2),
                                      Text('Previously held certificate has expired o...', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        GestureDetector(
                          onTap: () => setState(() => _selected = 'currently_valid'),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: _selected == 'currently_valid' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 22, height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: _selected == 'currently_valid' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200, width: _selected == 'currently_valid' ? 6 : 2),
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Yes, I currently have a valid certificate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _selected == 'currently_valid' ? Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600 : Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900)),
                                      SizedBox(height: 2),
                                      Text('Currently holding a valid certificate', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Actions
                Ux4gDivider(thickness: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Color(0xFFE5E7EB)),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Ux4gButton(height: 48, 
                    text: 'Check Eligibility',
                    onPressed: _selected != null ? () {} : null,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                ),

                // Footer
                Padding(
                  padding: EdgeInsets.only(bottom: 20, top: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400, fontWeight: FontWeight.w500)),
                      SizedBox(height: 6),
                      Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                    ],
                  ),
                ),
              ],
            );
          }

          // Define _buildRadioOption similar to previous examples
        },
      ),
    );
  }
}''';

const _eligibilityFinalQuestionCardCode =
    r'''// Eligibility Final Question Step – Card Style Layout
// Code similar to Flat Layout but wrapped in a Card inside a Purple Container
// Follow the structure of EligibilityQuestionCardMockup

import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EligibilityWizardScreen extends StatelessWidget {
  const EligibilityWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: ,
      ),
    );
  }
}''';
