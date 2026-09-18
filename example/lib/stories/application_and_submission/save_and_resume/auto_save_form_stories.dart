import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral400 : const Color(0xFF4B5563);
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB);
Color _getSurface(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : Colors.white;
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.primary900 : Ux4gColors.primary100;

final autoSaveFormComponent = WidgetbookComponent(
  name: 'Auto-save Form',
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
            ? _autoSaveFormCardCode
            : _autoSaveFormCode;
        final child = variant == 'Card style'
            ? const _AutoSaveFormCardMockup()
            : const _AutoSaveFormMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Auto-save Form',
          description:
              'A pattern showing a multi-step form with an auto-save banner at the top.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

const _autoSaveFormCode = '''
class _AutoSaveFormMockup extends StatelessWidget {
  const _AutoSaveFormMockup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getSurface(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem, 
                  height: 40,
                  colorFilter: _isDark(context)
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
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
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
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
                        color: _isDark(context) ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: _isDark(context) ? Ux4gColors.primary400 : Ux4gColors.primary600,
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
            Ux4gDivider(color: _getBorderColor(context)),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Auto-save Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _isDark(context)
                            ? Ux4gColors.green900.withValues(alpha: 0.2)
                            : const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: _isDark(context)
                                ? Ux4gColors.green400
                                : Ux4gColors.green600,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Saved 3:14 PM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _isDark(context)
                                  ? Ux4gColors.green400
                                  : Ux4gColors.green700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Progress Pipeline
                    SizedBox(
                      height: 80,
                      child: Ux4gStatusPipeline(
                        orientation: Ux4gPipelineOrientation.horizontal,
                        size: Ux4gPipelineSize.s,
                        currentStep: 1,
                        completedColor: _isDark(context)
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        completedLineColor: _isDark(context)
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        steps: const [
                          Ux4gPipelineStep(label: 'Eligibility'),
                          Ux4gPipelineStep(label: 'Personal'),
                          Ux4gPipelineStep(),
                          Ux4gPipelineStep(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      'Section 2: Personal\ninformation',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: _getTitleColor(context),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'Provide the personal details below.\\nWe will use this to verify your application.',
                      style: TextStyle(
                        fontSize: 14,
                        color: _getSubtleText(context),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Form Fields
                    Text(
                      'Full name',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(
                      value: 'Ramesh Kumar',
                      onValueChange: (_) {},
                      enabled: false,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Date of birth',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(value: '', onValueChange: (_) {}),
                    const SizedBox(height: 16),

                    Text(
                      'Mobile number',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(value: '', onValueChange: (_) {}),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(
                    text: 'Continue',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                  ),
                  const SizedBox(height: 12),
                  Ux4gButton(
                    text: 'Back',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: _getSubtleText(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng, 
                    height: 22,
                    color: _isDark(context) ? Colors.white : null,
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
''';

const _autoSaveFormCardCode = '''
class _AutoSaveFormCardMockup extends StatelessWidget {
  const _AutoSaveFormCardMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardBg(context),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        backgroundColor: _getCardBg(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with white background
            Container(
              color: _isDark(context) ? Ux4gColors.neutral950 : Colors.white,
              child: Column(
                children: [
                  Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem, 
                  height: 40,
                  colorFilter: _isDark(context)
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
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
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
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
                        color: _isDark(context) ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: _isDark(context) ? Ux4gColors.primary400 : Ux4gColors.primary600,
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
            Ux4gDivider(color: _getBorderColor(context)),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Container(
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
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Auto-save Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _isDark(context)
                            ? Ux4gColors.green900.withValues(alpha: 0.2)
                            : const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: _isDark(context)
                                ? Ux4gColors.green400
                                : Ux4gColors.green600,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Saved 3:14 PM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _isDark(context)
                                  ? Ux4gColors.green400
                                  : Ux4gColors.green700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Progress Pipeline
                    SizedBox(
                      height: 80,
                      child: Ux4gStatusPipeline(
                        orientation: Ux4gPipelineOrientation.horizontal,
                        size: Ux4gPipelineSize.s,
                        currentStep: 1,
                        completedColor: _isDark(context)
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        completedLineColor: _isDark(context)
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        steps: const [
                          Ux4gPipelineStep(label: 'Eligibility'),
                          Ux4gPipelineStep(label: 'Personal'),
                          Ux4gPipelineStep(),
                          Ux4gPipelineStep(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      'Section 2: Personal\ninformation',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: _getTitleColor(context),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'Provide the personal details below.\\nWe will use this to verify your application.',
                      style: TextStyle(
                        fontSize: 14,
                        color: _getSubtleText(context),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Form Fields
                    Text(
                      'Full name',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(
                      value: 'Ramesh Kumar',
                      onValueChange: (_) {},
                      enabled: false,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Date of birth',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(value: '', onValueChange: (_) {}),
                    const SizedBox(height: 16),

                    Text(
                      'Mobile number',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(value: '', onValueChange: (_) {}),
                    const SizedBox(height: 24),

                    // Actions
                    Ux4gButton(
                      text: 'Continue',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 48,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      height: 48,
                      contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                      borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Footer
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
                      color: _getSubtleText(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng, 
                    height: 22,
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
''';

class _AutoSaveFormMockup extends StatelessWidget {
  const _AutoSaveFormMockup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getSurface(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem, 
                  height: 40,
                  colorFilter: _isDark(context)
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
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
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
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
                        color: _isDark(context) ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: _isDark(context) ? Ux4gColors.primary400 : Ux4gColors.primary600,
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
            Ux4gDivider(color: _getBorderColor(context)),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Auto-save Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: _isDark(context)
                            ? Ux4gColors.green900.withValues(alpha: 0.2)
                            : const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: _isDark(context)
                                ? Ux4gColors.green400
                                : Ux4gColors.green600,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Saved 3:14 PM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _isDark(context)
                                  ? Ux4gColors.green400
                                  : Ux4gColors.green700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Progress Pipeline
                    SizedBox(
                      height: 80,
                      child: Ux4gStatusPipeline(
                        orientation: Ux4gPipelineOrientation.horizontal,
                        size: Ux4gPipelineSize.s,
                        currentStep: 1,
                        completedColor: _isDark(context)
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        completedLineColor: _isDark(context)
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        steps: const [
                          Ux4gPipelineStep(label: 'Eligibility'),
                          Ux4gPipelineStep(label: 'Personal'),
                          Ux4gPipelineStep(),
                          Ux4gPipelineStep(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      'Section 2: Personal\ninformation',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: _getTitleColor(context),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'Provide the personal details below.\nWe will use this to verify your application.',
                      style: TextStyle(
                        fontSize: 14,
                        color: _getSubtleText(context),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Form Fields
                    Text(
                      'Full name',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(
                      value: 'Ramesh Kumar',
                      onValueChange: (_) {},
                      enabled: false,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'Date of birth',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(value: '', onValueChange: (_) {}),
                    const SizedBox(height: 16),

                    Text(
                      'Mobile number',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gInputField(value: '', onValueChange: (_) {}),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(
                    text: 'Continue',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                  ),
                  const SizedBox(height: 12),
                  Ux4gButton(
                    text: 'Back',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    height: 48,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: _getSubtleText(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng, 
                    height: 22,
                    color: _isDark(context) ? Colors.white : null,
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

class _AutoSaveFormCardMockup extends StatelessWidget {
  const _AutoSaveFormCardMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardBg(context),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        backgroundColor: _getCardBg(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with white background
              Container(
                color: _isDark(context) ? Ux4gColors.neutral950 : Colors.white,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: Ux4gAppHeaderVariant.light,
                      leadingWidgets: [
                        SvgPicture.asset(
                          Ux4gIcons.nationalEmblem, 
                          height: 40,
                          colorFilter: _isDark(context)
                              ? const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )
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
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
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
                                color: _isDark(context) ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.menu,
                                color: _isDark(context) ? Ux4gColors.primary400 : Ux4gColors.primary600,
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
                    Ux4gDivider(color: _getBorderColor(context)),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Container(
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
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Auto-save Banner
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: _isDark(context)
                                ? Ux4gColors.green900.withValues(alpha: 0.2)
                                : const Color(0xFFF0FDF4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: _isDark(context)
                                    ? Ux4gColors.green400
                                    : Ux4gColors.green600,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Saved 3:14 PM',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: _isDark(context)
                                      ? Ux4gColors.green400
                                      : Ux4gColors.green700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Progress Pipeline
                        SizedBox(
                          height: 80,
                          child: Ux4gStatusPipeline(
                            orientation: Ux4gPipelineOrientation.horizontal,
                            size: Ux4gPipelineSize.s,
                            currentStep: 1,
                            completedColor: _isDark(context)
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                            completedLineColor: _isDark(context)
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                            steps: const [
                              Ux4gPipelineStep(label: 'Eligibility'),
                              Ux4gPipelineStep(label: 'Personal'),
                              Ux4gPipelineStep(),
                              Ux4gPipelineStep(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Title
                        Text(
                          'Section 2: Personal\ninformation',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: _getTitleColor(context),
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Subtitle
                        Text(
                          'Provide the personal details below.\nWe will use this to verify your application.',
                          style: TextStyle(
                            fontSize: 14,
                            color: _getSubtleText(context),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Form Fields
                        Text(
                          'Full name',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: _getSubtleText(context),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Ux4gInputField(
                          value: 'Ramesh Kumar',
                          onValueChange: (_) {},
                          enabled: false,
                        ),
                        const SizedBox(height: 16),

                        Text(
                          'Date of birth',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: _getSubtleText(context),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Ux4gInputField(value: '', onValueChange: (_) {}),
                        const SizedBox(height: 16),

                        Text(
                          'Mobile number',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: _getSubtleText(context),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Ux4gInputField(value: '', onValueChange: (_) {}),
                        const SizedBox(height: 24),

                        // Actions
                        Ux4gButton(
                          text: 'Continue',
                          onPressed: () {},
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 48,
                        ),
                        const SizedBox(height: 12),
                        Ux4gButton(
                          text: 'Back',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 48,
                          contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                          borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer
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
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      Ux4gIcons.digitalIndiaLogoPng, 
                      height: 22,
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
