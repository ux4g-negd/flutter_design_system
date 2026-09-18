import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final journeyProgressIndicatorComponent = WidgetbookComponent(
  name: 'Journey Progress Indicator',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _journeyProgressIndicatorCardCode
            : _journeyProgressIndicatorDefaultCode;
        final child = variant == 'Card style'
            ? const _JourneyProgressIndicatorCardMockup()
            : const _JourneyProgressIndicatorMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Journey Progress Indicator',
          description:
              'A progress stepper component indicating the current stage of a multi-step journey, used primarily in application and submission flows. Use the [Variant] knob to toggle layouts.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code
// ───────────────────────────────────────────────────────────────────────

const _journeyProgressIndicatorDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JourneyProgressIndicatorScreen extends StatefulWidget {
  const JourneyProgressIndicatorScreen({super.key});

  @override
  State<JourneyProgressIndicatorScreen> createState() =>
      _JourneyProgressIndicatorScreenState();
}

class _JourneyProgressIndicatorScreenState
    extends State<JourneyProgressIndicatorScreen> {
  bool _confirmDetails = false;
  String _fullName = '';
  String? _selectedDomain;
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.neutral900
          : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : null,
                ),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral700
                        : Ux4gColors.neutral300,
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral800
                            : const Color(0xFFE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).brightness == Brightness.dark
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
            Ux4gDivider(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral800
                  : const Color(0xFFE5E7EB),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stepper with labels
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: const [
                        Ux4gStepItem(
                          title: 'Eligibility',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Personal',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Documents',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Submit',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Title & Subtitle
                    Text(
                      'Verify your details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Confirm the information below to proceed.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral400
                            : Ux4gColors.neutral600,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Form Fields
                    Ux4gInputField(
                      label: 'Full name (as per Aadhaar)',
                      value: _fullName,
                      onValueChange: (val) => setState(() => _fullName = val),
                      placeholder: 'Placeholder',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 16),

                    Ux4gSelectionDropdown(
                      label: 'Select domain',
                      placeholder: 'Please select..',
                      options: const [
                        Ux4gDropdownOption(id: 'agriculture', label: 'Agriculture'),
                        Ux4gDropdownOption(id: 'education', label: 'Education'),
                        Ux4gDropdownOption(id: 'finance', label: 'Finance'),
                        Ux4gDropdownOption(id: 'healthcare', label: 'Healthcare'),
                      ],
                      selectedOptionIds: _selectedDomain != null ? [_selectedDomain!] : [],
                      onSelectionChange: (selected) {
                        setState(() {
                          _selectedDomain = selected.isNotEmpty ? selected.first : null;
                        });
                      },
                      size: Ux4gDropdownSize.m,
                    ),
                    const SizedBox(height: 16),

                    Ux4gPanInputField(
                      label: 'PAN number',
                      value: _panNumber,
                      onValueChange: (val) => setState(() => _panNumber = val),
                      placeholder: 'ABCDE1234F',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 20),

                    // Checkbox
                    Ux4gCheckbox(
                      label: 'I confirm these details match my official documents.',
                      isRequired: true,
                      value: _confirmDetails,
                      onChanged: (val) =>
                          setState(() => _confirmDetails = val ?? false),
                    ),
                    const SizedBox(height: 28),

                    // Actions
                    Ux4gButton(
                      height: 48,
                      text: 'Continue',
                      onPressed: _confirmDetails ? () {} : null,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      height: 48,
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      contentColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral700,
                      borderColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral700
                              : const Color(0xFFE5E7EB),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral500
                          : Ux4gColors.neutral400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,
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
    );
  }
}
""";

const _journeyProgressIndicatorCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JourneyProgressIndicatorCardScreen extends StatefulWidget {
  const JourneyProgressIndicatorCardScreen({super.key});

  @override
  State<JourneyProgressIndicatorCardScreen> createState() =>
      _JourneyProgressIndicatorCardScreenState();
}

class _JourneyProgressIndicatorCardScreenState
    extends State<JourneyProgressIndicatorCardScreen> {
  bool _confirmDetails = false;
  String _fullName = '';
  String? _selectedDomain;
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.primary900
          : Ux4gColors.primary50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with white background
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral900
                  : Ux4gColors.neutral0,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Ux4gAppHeaderVariant.light,
                    title: '',
                    leadingWidgets: [
                      SvgPicture.asset(
                        Ux4gIcons.nationalEmblem,
                        height: 40,
                        colorFilter:
                            Theme.of(context).brightness == Brightness.dark
                                ? const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  )
                                : null,
                      ),
                      Container(
                        height: 32,
                        width: 1,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral700
                            : Ux4gColors.neutral300,
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
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.neutral800
                                      : const Color(0xFFE5E7EB),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.menu,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
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
                  Ux4gDivider(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral800
                        : const Color(0xFFE5E7EB),
                  ),
                ],
              ),
            ),

            // Main Content Card
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral900
                        : Ux4gColors.neutral0,
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
                      // Stepper with labels inside card
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 3,
                        stepSize: 20,
                        steps: const [
                          Ux4gStepItem(
                            title: 'Eligibility',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Personal',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Documents',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Submit',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Title & Subtitle
                      Text(
                        'Verify your details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Confirm the information below to proceed.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral600,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Form Fields
                      Ux4gInputField(
                        label: 'Full name (as per Aadhaar)',
                        value: _fullName,
                        onValueChange: (val) =>
                            setState(() => _fullName = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 16),

                      Ux4gSelectionDropdown(
                        label: 'Select domain',
                        placeholder: 'Please select..',
                        options: const [
                          Ux4gDropdownOption(
                              id: 'agriculture', label: 'Agriculture'),
                          Ux4gDropdownOption(
                              id: 'education', label: 'Education'),
                          Ux4gDropdownOption(
                              id: 'finance', label: 'Finance'),
                          Ux4gDropdownOption(
                              id: 'healthcare', label: 'Healthcare'),
                        ],
                        selectedOptionIds: _selectedDomain != null
                            ? [_selectedDomain!]
                            : [],
                        onSelectionChange: (selected) {
                          setState(() {
                            _selectedDomain =
                                selected.isNotEmpty ? selected.first : null;
                          });
                        },
                        size: Ux4gDropdownSize.m,
                      ),
                      const SizedBox(height: 16),

                      Ux4gPanInputField(
                        label: 'PAN number',
                        value: _panNumber,
                        onValueChange: (val) =>
                            setState(() => _panNumber = val),
                        placeholder: 'ABCDE1234F',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 20),

                      // Checkbox
                      Ux4gCheckbox(
                        label:
                            'I confirm these details match my official documents.',
                        isRequired: true,
                        value: _confirmDetails,
                        onChanged: (val) =>
                            setState(() => _confirmDetails = val ?? false),
                      ),
                      const SizedBox(height: 24),

                      // Actions
                      Ux4gButton(
                        height: 48,
                        text: 'Continue',
                        onPressed: _confirmDetails ? () {} : null,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 12),
                      Ux4gButton(
                        height: 48,
                        text: 'Back',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.ghost,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral300
                                : Ux4gColors.neutral800,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral500
                          : Ux4gColors.neutral400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,
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
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _JourneyProgressIndicatorMockup extends StatefulWidget {
  const _JourneyProgressIndicatorMockup();

  @override
  State<_JourneyProgressIndicatorMockup> createState() =>
      _JourneyProgressIndicatorMockupState();
}

class _JourneyProgressIndicatorMockupState
    extends State<_JourneyProgressIndicatorMockup> {
  bool _confirmDetails = false;
  String _fullName = '';
  String? _selectedDomain;
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.neutral900
          : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  _nationalEmblemLogoPath,
                  height: 40,
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : null,
                  errorBuilder: (c, e, s) =>
                      const Icon(Icons.account_balance, size: 32, color: Colors.grey),
                ),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral700
                        : Ux4gColors.neutral300,
                  ),
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
                  errorBuilder: (c, e, s) =>
                      const Icon(Icons.blur_on, size: 32, color: Colors.blue),
                ),
              ],
              actions: [
                Ux4gAppHeaderAction(
                  customWidget: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral800
                            : const Color(0xFFE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).brightness == Brightness.dark
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
            Ux4gDivider(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral800
                  : const Color(0xFFE5E7EB),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stepper with labels
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: const [
                        Ux4gStepItem(
                          title: 'Eligibility',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Personal',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Documents',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Ux4gStepItem(
                          title: 'Submit',
                          titleStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Title & Subtitle
                    Text(
                      'Verify your details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Confirm the information below to proceed.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral400
                            : Ux4gColors.neutral600,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Form Fields
                    Ux4gInputField(
                      label: 'Full name (as per Aadhaar)',
                      value: _fullName,
                      onValueChange: (val) => setState(() => _fullName = val),
                      placeholder: 'Placeholder',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 16),

                    Ux4gSelectionDropdown(
                      label: 'Select domain',
                      placeholder: 'Please select..',
                      options: const [
                        Ux4gDropdownOption(id: 'agriculture', label: 'Agriculture'),
                        Ux4gDropdownOption(id: 'education', label: 'Education'),
                        Ux4gDropdownOption(id: 'finance', label: 'Finance'),
                        Ux4gDropdownOption(id: 'healthcare', label: 'Healthcare'),
                      ],
                      selectedOptionIds: _selectedDomain != null ? [_selectedDomain!] : [],
                      onSelectionChange: (selected) {
                        setState(() {
                          _selectedDomain = selected.isNotEmpty ? selected.first : null;
                        });
                      },
                      size: Ux4gDropdownSize.m,
                    ),
                    const SizedBox(height: 16),

                    Ux4gPanInputField(
                      label: 'PAN number',
                      value: _panNumber,
                      onValueChange: (val) => setState(() => _panNumber = val),
                      placeholder: 'ABCDE1234F',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 20),

                    // Checkbox
                    Ux4gCheckbox(
                      label: 'I confirm these details match my official documents.',
                      isRequired: true,
                      value: _confirmDetails,
                      onChanged: (val) =>
                          setState(() => _confirmDetails = val ?? false),
                    ),
                    const SizedBox(height: 28),

                    // Actions
                    Ux4gButton(
                      height: 48,
                      text: 'Continue',
                      onPressed: _confirmDetails ? () {} : null,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      height: 48,
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      contentColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral700,
                      borderColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral700
                              : const Color(0xFFE5E7EB),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral500
                          : Ux4gColors.neutral400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
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
    );
  }
}

class _JourneyProgressIndicatorCardMockup extends StatefulWidget {
  const _JourneyProgressIndicatorCardMockup();

  @override
  State<_JourneyProgressIndicatorCardMockup> createState() =>
      _JourneyProgressIndicatorCardMockupState();
}

class _JourneyProgressIndicatorCardMockupState
    extends State<_JourneyProgressIndicatorCardMockup> {
  bool _confirmDetails = false;
  String _fullName = '';
  String? _selectedDomain;
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.primary900
          : Ux4gColors.primary50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with white background
            Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral900
                  : Ux4gColors.neutral0,
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral700
                            : Ux4gColors.neutral300,
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
                        errorBuilder: (c, e, s) =>
                            const Icon(Icons.blur_on, size: 32, color: Colors.blue),
                      ),
                    ],
                    actions: [
                      Ux4gAppHeaderAction(
                        customWidget: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.neutral800
                                      : const Color(0xFFE5E7EB),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.menu,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
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
                  Ux4gDivider(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral800
                        : const Color(0xFFE5E7EB),
                  ),
                ],
              ),
            ),

            // Main Content Card
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral900
                        : Ux4gColors.neutral0,
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
                      // Stepper with labels inside card
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 3,
                        stepSize: 20,
                        steps: const [
                          Ux4gStepItem(
                            title: 'Eligibility',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Personal',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Documents',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Ux4gStepItem(
                            title: 'Submit',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Title & Subtitle
                      Text(
                        'Verify your details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Confirm the information below to proceed.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral600,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Form Fields
                      Ux4gInputField(
                        label: 'Full name (as per Aadhaar)',
                        value: _fullName,
                        onValueChange: (val) =>
                            setState(() => _fullName = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 16),

                      Ux4gSelectionDropdown(
                        label: 'Select domain',
                        placeholder: 'Please select..',
                        options: const [
                          Ux4gDropdownOption(
                              id: 'agriculture', label: 'Agriculture'),
                          Ux4gDropdownOption(
                              id: 'education', label: 'Education'),
                          Ux4gDropdownOption(
                              id: 'finance', label: 'Finance'),
                          Ux4gDropdownOption(
                              id: 'healthcare', label: 'Healthcare'),
                        ],
                        selectedOptionIds: _selectedDomain != null
                            ? [_selectedDomain!]
                            : [],
                        onSelectionChange: (selected) {
                          setState(() {
                            _selectedDomain =
                                selected.isNotEmpty ? selected.first : null;
                          });
                        },
                        size: Ux4gDropdownSize.m,
                      ),
                      const SizedBox(height: 16),

                      Ux4gPanInputField(
                        label: 'PAN number',
                        value: _panNumber,
                        onValueChange: (val) =>
                            setState(() => _panNumber = val),
                        placeholder: 'ABCDE1234F',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 20),

                      // Checkbox
                      Ux4gCheckbox(
                        label:
                            'I confirm these details match my official documents.',
                        isRequired: true,
                        value: _confirmDetails,
                        onChanged: (val) =>
                            setState(() => _confirmDetails = val ?? false),
                      ),
                      const SizedBox(height: 24),

                      // Actions
                      Ux4gButton(
                        height: 48,
                        text: 'Continue',
                        onPressed: _confirmDetails ? () {} : null,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 12),
                      Ux4gButton(
                        height: 48,
                        text: 'Back',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.ghost,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral300
                                : Ux4gColors.neutral800,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral500
                          : Ux4gColors.neutral400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
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
    );
  }
}
