import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

// ───────────────────────────────────────────────────────────────────────
// Constants
// ───────────────────────────────────────────────────────────────────────

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final couldNotSubmitComponent = WidgetbookComponent(
  name: 'Could Not Submit',
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
            ? _couldNotSubmitCardCode
            : _couldNotSubmitDefaultCode;
        final child = variant == 'Card style'
            ? const _CouldNotSubmitCardMockup()
            : const _CouldNotSubmitMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Could Not Submit',
          description:
              'An error screen shown when the application could not be submitted due to '
              'a network or server error, with options to retry, save draft, or contact support.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Shared widgets
// ───────────────────────────────────────────────────────────────────────

class _ErrorIcon extends StatelessWidget {
  const _ErrorIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.red900
            : Ux4gColors.red50,
      ),
      child: Icon(
        Icons.error,
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.red500
            : Ux4gColors.red600,
        size: 30,
      ),
    );
  }
}

class _ErrorToastCard extends StatelessWidget {
  final VoidCallback? onClose;
  const _ErrorToastCard({this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.neutral900
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gColors.red500
                : Ux4gColors.red600,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Could not submit',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral50
                        : Ux4gColors.neutral900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Network or server issue',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral400
                        : Ux4gColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onClose,
            child: Icon(
              Icons.close,
              size: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral400
                  : Ux4gColors.neutral500,
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _couldNotSubmitDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CouldNotSubmitScreen extends StatelessWidget {
  const CouldNotSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    
    
    

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back link
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 18,
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Return to services',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        // Error icon
                        Center(
                          child: Container(
                            width: 56, height: 56,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red900 : Ux4gColors.red50),
                            child: const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 30),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Title
                        Center(
                          child: Text(
                            'Could Not Submit\nApplication',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'We could not submit your application due to\na network or server error. Your data is saved —\ntry again.',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // What happens next - Journey Timeline
                        Ux4gJourneyTimeline(
                          header: const Ux4gJourneyHeader(title: 'What happens next'),
                          steps: const [
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '1',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '2',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '3',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                          ],
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
                      Ux4gButton(text: 'Retry submission', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                      const SizedBox(height: 12),
                      Ux4gButton(text: 'Save draft', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: primaryColor, borderColor: primaryColor),
                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text('Contact support', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                        ),
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
                      const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                      const SizedBox(height: 6),
                      Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                    ],
                  ),
                ),
              ],
            ),

            // Error toast notification
            Positioned(
              left: 16,
              right: 16,
              top: 24,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 16, offset: const Offset(0, -4)),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Could not submit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          const SizedBox(height: 4),
                          Text('Network or server issue', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.close, size: 18, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
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
}
""";

const _couldNotSubmitCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CouldNotSubmitCardScreen extends StatelessWidget {
  const CouldNotSubmitCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    
    
    

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header with white background
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

                // White card with content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, spreadRadius: 2, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Back link
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  size: 18,
                                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Return to services',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          
                          // Error icon
                          Center(
                            child: Container(
                              width: 56, height: 56,
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red900 : Ux4gColors.red50),
                              child: const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 30),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Title
                          Center(
                            child: Text('Could Not Submit\nApplication', textAlign: TextAlign.center, style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text('We could not submit your application due to\na network or server error. Your data is saved —\ntry again.', textAlign: TextAlign.center, style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                          ),
                          const SizedBox(height: 32),

                          // Journey Timeline
                          Ux4gJourneyTimeline(
                            header: const Ux4gJourneyHeader(title: 'What happens next'),
                            steps: const [
                              Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.completed,
                                stepNumber: '1',
                                date: 'Date',
                                title: 'Title',
                                helpingText: 'Helping Text',
                              ),
                              Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.completed,
                                stepNumber: '2',
                                date: 'Date',
                                title: 'Title',
                                helpingText: 'Helping Text',
                              ),
                              Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.completed,
                                stepNumber: '3',
                                date: 'Date',
                                title: 'Title',
                                helpingText: 'Helping Text',
                              ),
                            ],
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
                      Ux4gButton(text: 'Retry submission', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                      const SizedBox(height: 12),
                      Ux4gButton(text: 'Save draft', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: primaryColor, borderColor: primaryColor),
                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text('Contact support', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                        ),
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
                      const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                      const SizedBox(height: 6),
                      Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                    ],
                  ),
                ),
              ],
            ),

            // Error toast notification
            Positioned(
              left: 16,
              right: 16,
              top: 24,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 16, offset: const Offset(0, -4)),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Could not submit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          const SizedBox(height: 4),
                          Text('Network or server issue', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.close, size: 18, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
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
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _CouldNotSubmitMockup extends StatefulWidget {
  const _CouldNotSubmitMockup();

  @override
  State<_CouldNotSubmitMockup> createState() => _CouldNotSubmitMockupState();
}

class _CouldNotSubmitMockupState extends State<_CouldNotSubmitMockup> {
  bool _showToast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.neutral900
          : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          SvgPicture.asset(
                            _nationalEmblemLogoPath,
                            height: 40,
                            colorFilter:
                                Theme.of(context).brightness == Brightness.dark
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
                            errorBuilder: (c, e, s) => const Icon(
                              Icons.blur_on,
                              size: 32,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back link
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 18,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gColors.primary300
                                    : Ux4gColors.primary600,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Return to services',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.primary300
                                      : Ux4gColors.primary600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Error icon
                        Center(child: _ErrorIcon()),
                        const SizedBox(height: 20),

                        // Title
                        Center(
                          child: Text(
                            'Could Not Submit\nApplication',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'We could not submit your application due to\na network or server error. Your data is saved —\ntry again.',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // What happens next - Journey Timeline
                        Ux4gJourneyTimeline(
                          header: const Ux4gJourneyHeader(
                            title: 'What happens next',
                          ),
                          steps: const [
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '1',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '2',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '3',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                          ],
                        ),
                      ],
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
                        text: 'Retry submission',
                        onPressed: () => setState(() => _showToast = true),
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        height: 48,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral900
                            : Ux4gColors.neutral50,
                      ),
                      const SizedBox(height: 12),
                      Ux4gButton(
                        text: 'Save draft',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        height: 48,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        borderColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.primary600
                            : Ux4gColors.primary300,
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Contact support',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.neutral50
                                  : Ux4gColors.neutral900,
                            ),
                          ),
                        ),
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
                      const Text(
                        'Powered by -',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Image.asset(
                        _digitalIndiaLogoPath,
                        height: 24,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : null,
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

            // Error toast
            if (_showToast)
              Positioned(
                left: 16,
                right: 16,
                top: 24,
                child: _ErrorToastCard(
                  onClose: () => setState(() => _showToast = false),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CouldNotSubmitCardMockup extends StatefulWidget {
  const _CouldNotSubmitCardMockup();

  @override
  State<_CouldNotSubmitCardMockup> createState() =>
      _CouldNotSubmitCardMockupState();
}

class _CouldNotSubmitCardMockupState extends State<_CouldNotSubmitCardMockup> {
  bool _showToast = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary900
            : Ux4gColors.primary50,
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
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary900
            : Ux4gColors.primary50,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header with white background
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Ux4gAppHeader(
                          variant: Ux4gAppHeaderVariant.light,
                          title: '',
                          leadingWidgets: [
                            SvgPicture.asset(
                              _nationalEmblemLogoPath,
                              height: 40,
                              colorFilter:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
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
                              errorBuilder: (c, e, s) => const Icon(
                                Icons.blur_on,
                                size: 32,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 1, color: Color(0xFFE5E7EB)),
                      ],
                    ),
                  ),

                  // White card with content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral900
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Back link
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    size: 18,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gColors.primary300
                                        : Ux4gColors.primary600,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Return to services',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gColors.primary300
                                          : Ux4gColors.primary600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),

                            // Error icon
                            Center(child: _ErrorIcon()),
                            const SizedBox(height: 20),

                            // Title
                            Center(
                              child: Text(
                                'Could Not Submit\nApplication',
                                textAlign: TextAlign.center,
                                style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: Text(
                                'We could not submit your application due to\na network or server error. Your data is saved —\ntry again.',
                                textAlign: TextAlign.center,
                                style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                              ),
                            ),
                            const SizedBox(height: 32),

                            // What happens next - Journey Timeline
                            Ux4gJourneyTimeline(
                              header: const Ux4gJourneyHeader(
                                title: 'What happens next',
                              ),
                              steps: const [
                                Ux4gJourneyStep(
                                  state: Ux4gJourneyStepState.completed,
                                  stepNumber: '1',
                                  date: 'Date',
                                  title: 'Title',
                                  helpingText: 'Helping Text',
                                ),
                                Ux4gJourneyStep(
                                  state: Ux4gJourneyStepState.completed,
                                  stepNumber: '2',
                                  date: 'Date',
                                  title: 'Title',
                                  helpingText: 'Helping Text',
                                ),
                                Ux4gJourneyStep(
                                  state: Ux4gJourneyStepState.completed,
                                  stepNumber: '3',
                                  date: 'Date',
                                  title: 'Title',
                                  helpingText: 'Helping Text',
                                ),
                              ],
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
                          text: 'Retry submission',
                          onPressed: () => setState(() => _showToast = true),
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 48,
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.primary300
                              : Ux4gColors.primary600,
                          contentColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral900
                              : Ux4gColors.neutral50,
                        ),
                        const SizedBox(height: 12),
                        Ux4gButton(
                          text: 'Save draft',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          height: 48,
                          contentColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.primary300
                              : Ux4gColors.primary600,
                          borderColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.primary600
                              : Ux4gColors.primary300,
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Contact support',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.neutral900,
                              ),
                            ),
                          ),
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
                        const Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 24,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
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

              // Error toast
              if (_showToast)
                Positioned(
                  left: 16,
                  right: 16,
                  top: 24,
                  child: _ErrorToastCard(
                    onClose: () => setState(() => _showToast = false),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
