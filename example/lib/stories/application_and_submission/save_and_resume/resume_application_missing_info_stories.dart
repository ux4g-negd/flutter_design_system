import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

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
Color _getStartFreshColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final resumeApplicationMissingInfoComponent = WidgetbookComponent(
  name: 'Resume Application Missing Info',
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
            ? _resumeApplicationMissingInfoCardCode
            : _resumeApplicationMissingInfoDefaultCode;
        final child = variant == 'Card style'
            ? const _ResumeApplicationMissingInfoCardMockup()
            : const _ResumeApplicationMissingInfoMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Resume Application Missing Info',
          description:
              'A pattern showing the user\'s saved application progress with step-by-step status, '
              'allowing them to continue from where they left off or start fresh.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Step status model
// ───────────────────────────────────────────────────────────────────────

enum _StepStatus { completed, inProgress, error, notStarted }

class _StepData {
  final String title;
  final String subtitle;
  final _StepStatus status;

  const _StepData({
    required this.title,
    required this.subtitle,
    required this.status,
  });
}

const List<_StepData> _steps = [
  _StepData(
    title: 'Personal information',
    subtitle: 'Completed',
    status: _StepStatus.completed,
  ),
  _StepData(
    title: 'Upload documents',
    subtitle: '1 required document missing',
    status: _StepStatus.error,
  ),
  _StepData(
    title: 'Review',
    subtitle: 'Not started',
    status: _StepStatus.notStarted,
  ),
  _StepData(
    title: 'Payment',
    subtitle: 'Not started',
    status: _StepStatus.notStarted,
  ),
];

// ───────────────────────────────────────────────────────────────────────
// Shared step list widget
// ───────────────────────────────────────────────────────────────────────

class _ProgressStepList extends StatelessWidget {
  const _ProgressStepList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_steps.length, (index) {
        final step = _steps[index];
        return Padding(
          padding: EdgeInsets.only(bottom: index < _steps.length - 1 ? 20 : 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status indicator
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: step.status == _StepStatus.completed
                      ? (_isDark(context)
                            ? Ux4gColors.green500
                            : Ux4gColors.green600)
                      : step.status == _StepStatus.error
                      ? (_isDark(context)
                            ? Ux4gColors.orange300
                            : Ux4gColors.orange600)
                      : step.status == _StepStatus.inProgress
                      ? (_isDark(context)
                            ? Ux4gColors.neutral800
                            : Colors.white)
                      : (_isDark(context)
                            ? Ux4gColors.neutral800
                            : Colors.white),
                  border: Border.all(
                    color: step.status == _StepStatus.completed
                        ? (_isDark(context)
                              ? Ux4gColors.green500
                              : Ux4gColors.green600)
                        : step.status == _StepStatus.error
                        ? (_isDark(context)
                              ? Ux4gColors.orange300
                              : Ux4gColors.orange600)
                        : step.status == _StepStatus.inProgress
                        ? (_isDark(context)
                              ? Ux4gColors.neutral500
                              : const Color(0xFFD1D5DB))
                        : (_isDark(context)
                              ? Ux4gColors.neutral700
                              : const Color(0xFFE5E7EB)),
                    width: step.status == _StepStatus.inProgress ? 2 : 1.5,
                  ),
                ),
                child: step.status == _StepStatus.completed
                    ? const Icon(Icons.check, color: Colors.white, size: 12)
                    : step.status == _StepStatus.error
                    ? const Icon(
                        Icons.priority_high,
                        color: Colors.white,
                        size: 12,
                      )
                    : null,
              ),
              const SizedBox(width: 14),
              // Step text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: (Theme.of(context).extension<Ux4gTypography>()?.bM_strong ?? const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)).copyWith(
                        color: _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      step.subtitle,
                      style: (Theme.of(context).extension<Ux4gTypography>()?.bS_default ?? const TextStyle(fontSize: 13)).copyWith(
                        color: _isDark(context) ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _resumeApplicationMissingInfoDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResumeApplicationMissingInfoScreen extends StatelessWidget {
  const ResumeApplicationMissingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
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

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Continue your\napplication?',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Color(0xFF111827), height: 1.2),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Some sections have missing information',
                      style: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Your progress',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF111827)),
                    ),
                    const SizedBox(height: 20),

                    // Progress steps list with status indicators
                    // ... (step items with completed/in-progress/not-started states)

                    const SizedBox(height: 20),
                    Text(
                      'Last saved 10 Apr 2026 at 3:12 PM',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.bS_default ?? const TextStyle(fontSize: 13)).copyWith(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                      ),
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
                  Ux4gButton(text: 'Go to incomplete section', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48),
                  const SizedBox(height: 12),
                  Ux4gButton(height: 48, text: 'Continue from beginning', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, height: 48),
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
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24),
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

const _resumeApplicationMissingInfoCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResumeApplicationMissingInfoCardScreen extends StatelessWidget {
  const ResumeApplicationMissingInfoCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
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
                child: Container(
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
                      const Text(
                        'Continue your\napplication?',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Color(0xFF111827), height: 1.2),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Some sections have missing information',
                        style: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Your progress',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF111827)),
                      ),
                      const SizedBox(height: 20),

                      // Progress steps list with status indicators
                      // ... (step items with completed/in-progress/not-started states)

                      const SizedBox(height: 20),
                      const Text(
                        'Last saved 10 Apr 2026 at 3:12 PM',
                        style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(text: 'Go to incomplete section', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48),
                  const SizedBox(height: 12),
                  Ux4gButton(height: 48, text: 'Continue from beginning', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, height: 48),
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
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24),
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

class _ResumeApplicationMissingInfoMockup extends StatelessWidget {
  const _ResumeApplicationMissingInfoMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return Scaffold(
      backgroundColor: _isDark(context) ? Ux4gColors.neutral950 : Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
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
                  errorBuilder: (c, e, s) => const Icon(
                    Icons.account_balance,
                    size: 32,
                    color: Colors.grey,
                  ),
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
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                  height: 32,
                  errorBuilder: (c, e, s) =>
                      const Icon(Icons.blur_on, size: 32, color: Colors.blue),
                ),
              ],
            ),
            Divider(height: 1, color: _getBorderColor(context)),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Continue your\napplication?',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: _getTitleColor(context),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Some sections have missing information',
                      style: TextStyle(
                        fontSize: 14,
                        color: _getSubtleText(context),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Your progress',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _getTitleColor(context),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const _ProgressStepList(),
                    const SizedBox(height: 20),
                    Text(
                      'Last saved 10 Apr 2026 at 3:12 PM',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.bS_default ?? const TextStyle(fontSize: 13)).copyWith(
                        color: _isDark(context) ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
                      ),
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
                  Ux4gButton(
                    height: 48,
                    text: 'Go to incomplete section',
                    onPressed: () {},
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 12),
                  Ux4gButton(
                    height: 48,
                    text: 'Continue from beginning',
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

            // Footer
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
                    errorBuilder: (c, e, s) => const Text(
                      'Digital India',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
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
}

class _ResumeApplicationMissingInfoCardMockup extends StatelessWidget {
  const _ResumeApplicationMissingInfoCardMockup();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return Container(
      decoration: BoxDecoration(
        color: _getCardBg(context),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
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
                          errorBuilder: (c, e, s) => const Icon(
                            Icons.account_balance,
                            size: 32,
                            color: Colors.grey,
                          ),
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
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                            BlendMode.srcIn,
                          ),
                          height: 32,
                          errorBuilder: (c, e, s) => const Icon(
                            Icons.blur_on,
                            size: 32,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1, color: _getBorderColor(context)),
                  ],
                ),
              ),

              // Card Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
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
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Continue your\napplication?',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: _getTitleColor(context),
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Some sections have missing information',
                          style: TextStyle(
                            fontSize: 14,
                            color: _getSubtleText(context),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Your progress',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: _getTitleColor(context),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const _ProgressStepList(),
                        const SizedBox(height: 20),
                        Text(
                          'Last saved 10 Apr 2026 at 3:12 PM',
                          style: TextStyle(
                            fontSize: 13,
                            color: _isDark(context)
                                ? Ux4gColors.neutral500
                                : const Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Actions
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Ux4gButton(
                      height: 48,
                      text: 'Go to incomplete section',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      height: 48,
                      text: 'Continue from beginning',
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

              // Footer
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
                      errorBuilder: (c, e, s) => const Text(
                        'Digital India',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
