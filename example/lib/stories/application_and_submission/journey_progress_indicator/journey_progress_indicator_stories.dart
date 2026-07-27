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
  State<JourneyProgressIndicatorScreen> createState() => _JourneyProgressIndicatorScreenState();
}

class _JourneyProgressIndicatorScreenState extends State<JourneyProgressIndicatorScreen> {
  bool _acceptTerms = false;
  String _fullName = '';
  String _panNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
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
                        colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null, 
                  errorBuilder: (c, e, s) => Icon(Icons.account_balance, size: 32, color: Colors.grey)
                ),
                SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral300)),
                SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                        colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, BlendMode.srcIn), 
                  errorBuilder: (c, e, s) => Icon(Icons.blur_on, size: 32, color: Colors.blue)
                ),],
            ),
            Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: [Ux4gStepItem(title: ''),
                        Ux4gStepItem(title: ''),
                        Ux4gStepItem(
                          title: 'Documents', 
                          titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600),
                        ),
                        Ux4gStepItem(title: ''),],
                    ),
                    SizedBox(height: 40),

                    // Title & Subtitle
                    Text(
                      'Verify your details',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900, height: 1.2),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Confirm the information below to proceed.',
                      style: TextStyle(fontSize: 15, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600, height: 1.4),
                    ),
                    SizedBox(height: 32),

                    // Form Fields
                    Ux4gInputField(
                      label: 'Full name (as per Aadhaar)',
                      value: _fullName,
                      onValueChange: (val) => setState(() => _fullName = val),
                      placeholder: '',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    SizedBox(height: 24),

                    Ux4gPanInputField(
                      label: 'PAN number',
                      value: _panNumber,
                      onValueChange: (val) => setState(() => _panNumber = val),
                      placeholder: '',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    SizedBox(height: 32),

                    // Checkbox
                    Ux4gCheckbox(
                      label: 'Accept terms and conditions',
                      isRequired: true,
                      value: _acceptTerms,
                      onChanged: (val) => setState(() => _acceptTerms = val ?? false),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(
height: 48, text: 'Continue',
                    onPressed: _acceptTerms ? () {} : null,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 12),
                  Ux4gButton(
height: 48, text: 'Back',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral300,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400)),
                  SizedBox(height: 6),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,  
                    height: 24,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null, 
                    errorBuilder: (c, e, s) => Text('Digital India', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                  ),
                ],
              ),
            ),
          ],
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
  State<JourneyProgressIndicatorCardScreen> createState() => _JourneyProgressIndicatorCardScreenState();
}

class _JourneyProgressIndicatorCardScreenState extends State<JourneyProgressIndicatorCardScreen> {
  bool _acceptTerms = false;
  String _fullName = '';
  String _panNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with white background
            Container(
              color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Ux4gAppHeaderVariant.light,
                    title: '',
                    leadingWidgets: [
                      SvgPicture.asset(
                        Ux4gIcons.nationalEmblem,  
                        height: 40,
                        colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null, 
                        errorBuilder: (c, e, s) => Icon(Icons.account_balance, size: 32, color: Colors.grey)
                      ),
                      SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral300)),
                      SvgPicture.asset(
                        Ux4gIcons.union, 
                        height: 32,
                        colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, BlendMode.srcIn), 
                        errorBuilder: (c, e, s) => Icon(Icons.blur_on, size: 32, color: Colors.blue)
                      ),
                    ],
                  ),
                  Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: [Ux4gStepItem(title: ''),
                        Ux4gStepItem(title: ''),
                        Ux4gStepItem(
                          title: 'Documents', 
                          titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600),
                        ),
                        Ux4gStepItem(title: ''),],
                    ),
                    SizedBox(height: 32),

                    // White Card
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title & Subtitle
                          Text(
                            'Verify your details',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900, height: 1.2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Confirm the information below to proceed.',
                            style: TextStyle(fontSize: 15, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral600, height: 1.4),
                          ),
                          SizedBox(height: 32),

                          // Form Fields
                          Ux4gInputField(
                            label: 'Full name (as per Aadhaar)',
                            value: _fullName,
                            onValueChange: (val) => setState(() => _fullName = val),
                            placeholder: '',
                            size: Ux4gInputFieldSize.medium,
                          ),
                          SizedBox(height: 24),

                          Ux4gPanInputField(
                            label: 'PAN number',
                            value: _panNumber,
                            onValueChange: (val) => setState(() => _panNumber = val),
                            placeholder: '',
                            size: Ux4gInputFieldSize.medium,
                          ),
                          SizedBox(height: 32),

                          // Checkbox
                          Ux4gCheckbox(
                            label: 'Accept terms and conditions',
                            isRequired: true,
                            value: _acceptTerms,
                            onChanged: (val) => setState(() => _acceptTerms = val ?? false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(
height: 48, text: 'Continue',
                    onPressed: _acceptTerms ? () {} : null,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 12),
                  Ux4gButton(
height: 48, text: 'Back',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral300,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400)),
                  SizedBox(height: 6),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,  
                    height: 24,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null, 
                    errorBuilder: (c, e, s) => Text('Digital India', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                  ),
                ],
              ),
            ),
          ],
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
  bool _acceptTerms = false;
  String _fullName = '';
  String _panNumber = '';

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
                      ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : null,
                  errorBuilder: (c, e, s) =>
                      Icon(Icons.account_balance, size: 32, color: Colors.grey),
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
                      Icon(Icons.blur_on, size: 32, color: Colors.blue),
                ),
              ],
            ),
            Ux4gDivider(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral800
                  : Ux4gColors.neutral200,
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: [
                        Ux4gStepItem(title: ''),
                        Ux4gStepItem(title: ''),
                        Ux4gStepItem(
                          title: 'Documents',
                          titleStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral300
                                : Ux4gColors.neutral600,
                          ),
                        ),
                        Ux4gStepItem(title: ''),
                      ],
                    ),
                    SizedBox(height: 40),

                    // Title & Subtitle
                    Text(
                      'Verify your details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Confirm the information below to proceed.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral400
                            : Ux4gColors.neutral500,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 32),

                    // Form Fields
                    Ux4gInputField(
                      label: 'Full name (as per Aadhaar)',
                      value: _fullName,
                      onValueChange: (val) => setState(() => _fullName = val),
                      placeholder: '',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    SizedBox(height: 24),

                    Ux4gPanInputField(
                      label: 'PAN number',
                      value: _panNumber,
                      onValueChange: (val) => setState(() => _panNumber = val),
                      placeholder: '',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    SizedBox(height: 32),

                    // Checkbox
                    Ux4gCheckbox(
                      label: 'Accept terms and conditions',
                      isRequired: true,
                      value: _acceptTerms,
                      onChanged: (val) =>
                          setState(() => _acceptTerms = val ?? false),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(
                    height: 48,
                    text: 'Continue',
                    onPressed: _acceptTerms ? () {} : null,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 12),
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
                        : Ux4gColors.neutral500,
                    borderColor: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral700
                        : Ux4gColors.neutral300,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral500
                          : Ux4gColors.neutral400,
                    ),
                  ),
                  SizedBox(height: 6),
                  Image.asset(
                    _digitalIndiaLogoPath,
                    height: 24,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : null,
                    errorBuilder: (c, e, s) => Text(
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

class _JourneyProgressIndicatorCardMockup extends StatefulWidget {
  const _JourneyProgressIndicatorCardMockup();

  @override
  State<_JourneyProgressIndicatorCardMockup> createState() =>
      _JourneyProgressIndicatorCardMockupState();
}

class _JourneyProgressIndicatorCardMockupState
    extends State<_JourneyProgressIndicatorCardMockup> {
  bool _acceptTerms = false;
  String _fullName = '';
  String _panNumber = '';

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
                            ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                            : null,
                        errorBuilder: (c, e, s) => Icon(
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
                            Icon(Icons.blur_on, size: 32, color: Colors.blue),
                      ),
                    ],
                  ),
                  Ux4gDivider(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral800
                        : Ux4gColors.neutral200,
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Stepper
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 3,
                      stepSize: 20,
                      steps: [
                        Ux4gStepItem(title: ''),
                        Ux4gStepItem(title: ''),
                        Ux4gStepItem(
                          title: 'Documents',
                          titleStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.neutral300
                                : Ux4gColors.neutral600,
                          ),
                        ),
                        Ux4gStepItem(title: ''),
                      ],
                    ),
                    SizedBox(height: 32),

                    // White Card
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral900
                            : Ux4gColors.neutral0,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title & Subtitle
                          Text(
                            'Verify your details',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.neutral50
                                  : Ux4gColors.neutral900,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Confirm the information below to proceed.',
                            style: TextStyle(
                              fontSize: 15,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.neutral400
                                  : Ux4gColors.neutral500,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 32),

                          // Form Fields
                          Ux4gInputField(
                            label: 'Full name (as per Aadhaar)',
                            value: _fullName,
                            onValueChange: (val) =>
                                setState(() => _fullName = val),
                            placeholder: '',
                            size: Ux4gInputFieldSize.medium,
                          ),
                          SizedBox(height: 24),

                          Ux4gPanInputField(
                            label: 'PAN number',
                            value: _panNumber,
                            onValueChange: (val) =>
                                setState(() => _panNumber = val),
                            placeholder: '',
                            size: Ux4gInputFieldSize.medium,
                          ),
                          SizedBox(height: 32),

                          // Checkbox
                          Ux4gCheckbox(
                            label: 'Accept terms and conditions',
                            isRequired: true,
                            value: _acceptTerms,
                            onChanged: (val) =>
                                setState(() => _acceptTerms = val ?? false),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(
                    height: 48,
                    text: 'Continue',
                    onPressed: _acceptTerms ? () {} : null,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 12),
                  Ux4gButton(
                    height: 48,
                    text: 'Back',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.ghost,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    contentColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral400
                        : Ux4gColors.neutral500,
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral500
                          : Ux4gColors.neutral400,
                    ),
                  ),
                  SizedBox(height: 6),
                  Image.asset(
                    _digitalIndiaLogoPath,
                    height: 24,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : null,
                    errorBuilder: (c, e, s) => Text(
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
