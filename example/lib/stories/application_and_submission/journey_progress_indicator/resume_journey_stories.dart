import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';




const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final resumeJourneyComponent = WidgetbookComponent(
  name: 'Resume Journey',
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
            ? _resumeJourneyCardCode
            : _resumeJourneyDefaultCode;
        final child = variant == 'Card style'
            ? const _ResumeJourneyCardMockup()
            : const _ResumeJourneyMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Resume Journey',
          description:
              'A pattern showing an application screen when a user resumes their journey from a previous step, featuring an alert banner and pre-filled data.',
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

const _resumeJourneyDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResumeJourneyScreen extends StatefulWidget {
  const ResumeJourneyScreen({super.key});

  @override
  State<ResumeJourneyScreen> createState() => _ResumeJourneyScreenState();
}

class _ResumeJourneyScreenState extends State<ResumeJourneyScreen> {
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
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
                SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300)),
                SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                        colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn), 
                  errorBuilder: (c, e, s) => Icon(Icons.blur_on, size: 32, color: Colors.blue)
                ),],
            ),
            Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral200),

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
                          titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral600),
                        ),
                        Ux4gStepItem(title: ''),],
                    ),
                    SizedBox(height: 32),

                    // Resume Alert Banner
                    Ux4gStatusBanner(
                      variant: Ux4gBannerVariant.warningLight,
                      title: 'Resuming from Step 3 — review before continuing.',
                      margin: EdgeInsets.zero,
                      leadingIcon: Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange400 : Ux4gPalette.orange500, size: 20),
                      // Custom colors to match image exactly
                      titleStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange200 : Ux4gPalette.orange800, fontWeight: FontWeight.w500),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    SizedBox(height: 40),

                    // Title & Subtitle
                    Text(
                      'Verify your details',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900, height: 1.2),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Confirm the information below to proceed.',
                      style: TextStyle(fontSize: 15, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral600, height: 1.4),
                    ),
                    SizedBox(height: 32),

                    // Form Fields
                    Ux4gInputField(
                      label: 'Full name (as per Aadhaar)',
                      value: _fullName,
                      onValueChange: (val) => setState(() => _fullName = val),
                      placeholder: '',
                      size: Ux4gInputFieldSize.medium,
                      style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500),
                    ),
                    SizedBox(height: 24),

                    Ux4gInputField(
                      label: 'PAN number',
                      value: _panNumber,
                      onValueChange: (val) => setState(() => _panNumber = val),
                      placeholder: '',
                      size: Ux4gInputFieldSize.medium,
                      style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500),
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
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300,
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
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
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
      ),
    );
  }
}
""";

const _resumeJourneyCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResumeJourneyCardScreen extends StatefulWidget {
  const ResumeJourneyCardScreen({super.key});

  @override
  State<ResumeJourneyCardScreen> createState() => _ResumeJourneyCardScreenState();
}

class _ResumeJourneyCardScreenState extends State<ResumeJourneyCardScreen> {
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with white background
            Container(
              color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
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
                      SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300)),
                      SvgPicture.asset(
                        Ux4gIcons.union, 
                        height: 32,
                        colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn), 
                        errorBuilder: (c, e, s) => Icon(Icons.blur_on, size: 32, color: Colors.blue)
                      ),
                    ],
                  ),
                  Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral200),
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
                          titleStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral600),
                        ),
                        Ux4gStepItem(title: ''),],
                    ),
                    SizedBox(height: 32),

                    // White Card
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Resume Alert Banner
                          Ux4gStatusBanner(
                            variant: Ux4gBannerVariant.warningLight,
                            title: 'Resuming from Step 3 — review before continuing.',
                            margin: EdgeInsets.zero,
                            leadingIcon: Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange400 : Ux4gPalette.orange500, size: 20),
                            // Custom colors to match image exactly
                            titleStyle: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange200 : Ux4gPalette.orange800, fontWeight: FontWeight.w500),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          SizedBox(height: 32),

                          // Title & Subtitle
                          Text(
                            'Verify your details',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900, height: 1.2),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Confirm the information below to proceed.',
                            style: TextStyle(fontSize: 15, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral600, height: 1.4),
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

                          Ux4gInputField(
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
                    variant: Ux4gButtonVariant.ghost,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
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
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400)),
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
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _ResumeJourneyMockup extends StatefulWidget {
  const _ResumeJourneyMockup();

  @override
  State<_ResumeJourneyMockup> createState() => _ResumeJourneyMockupState();
}

class _ResumeJourneyMockupState extends State<_ResumeJourneyMockup> {
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
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
                        colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
                  errorBuilder: (c, e, s) => Icon(
                    Icons.account_balance,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300)),
                SvgPicture.asset(
                  _unionLogoPath,
                  height: 32,
                        colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn),
                  errorBuilder: (c, e, s) =>
                      Icon(Icons.blur_on, size: 32, color: Colors.blue),
                ),
              ],
            ),
            Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral200),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
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
                          titleStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral600,
                          ),
                        ),
                        Ux4gStepItem(title: ''),],
                    ),
                    SizedBox(height: 32),

                    // Resume Alert Banner
                    Ux4gStatusBanner(
                      variant: Ux4gBannerVariant.warningLight,
                      title: 'Resuming from Step 3 — review before continuing.',
                      margin: EdgeInsets.zero,
                      leadingIcon: Icon(
                        Icons.error,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange400 : Ux4gPalette.orange500,
                        size: 20,
                      ),
                      // Custom colors to match image exactly
                      titleStyle: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange200 : Ux4gPalette.orange800,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    SizedBox(height: 40),

                    // Title & Subtitle
                    Text(
                      'Verify your details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Confirm the information below to proceed.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
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
                      style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500),
                    ),
                    SizedBox(height: 24),

                    Ux4gInputField(
                      label: 'PAN number',
                      value: _panNumber,
                      onValueChange: (val) => setState(() => _panNumber = val),
                      placeholder: '',
                      size: Ux4gInputFieldSize.medium,
                      style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500),
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
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
                    borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300,
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
                    style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400),
                  ),
                  SizedBox(height: 6),
                  Image.asset(
                    _digitalIndiaLogoPath,
                    height: 24,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null,
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

class _ResumeJourneyCardMockup extends StatefulWidget {
  const _ResumeJourneyCardMockup();

  @override
  State<_ResumeJourneyCardMockup> createState() =>
      _ResumeJourneyCardMockupState();
}

class _ResumeJourneyCardMockupState extends State<_ResumeJourneyCardMockup> {
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _panNumber = 'ABCDE1234F';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary900 : Ux4gPalette.primary50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with white background
            Container(
              color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Ux4gAppHeaderVariant.light,
                    title: '',
                    leadingWidgets: [
                      SvgPicture.asset(
                        _nationalEmblemLogoPath,
                        height: 40,
                        colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
                        errorBuilder: (c, e, s) => Icon(
                          Icons.account_balance,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 1,
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300,
                      ),
                      SvgPicture.asset(
                        _unionLogoPath,
                        height: 32,
                        colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn),
                        errorBuilder: (c, e, s) => Icon(
                          Icons.blur_on,
                          size: 32,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Ux4gDivider(color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral200),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
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
                          titleStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral600,
                          ),
                        ),
                        Ux4gStepItem(title: ''),],
                    ),
                    SizedBox(height: 32),

                    // White Card
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Resume Alert Banner
                          Ux4gStatusBanner(
                            variant: Ux4gBannerVariant.warningLight,
                            title:
                                'Resuming from Step 3 — review before continuing.',
                            margin: EdgeInsets.zero,
                            leadingIcon: Icon(
                              Icons.error,
                              color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange400 : Ux4gPalette.orange500,
                              size: 20,
                            ),
                            // Custom colors to match image exactly
                            titleStyle: TextStyle(
                              color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.orange200 : Ux4gPalette.orange800,
                              fontWeight: FontWeight.w500,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          SizedBox(height: 32),

                          // Title & Subtitle
                          Text(
                            'Verify your details',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Confirm the information below to proceed.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
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

                          Ux4gInputField(
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
height: 48, text: 'Continue',
                    onPressed: _acceptTerms ? () {} : null,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                  ),
                  SizedBox(height: 12),
                  Ux4gButton(
height: 48, text: 'Back',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.ghost,
                    size: Ux4gButtonSize.large,
                    width: double.infinity,
                    contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
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
                    style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral500 : Ux4gPalette.neutral400),
                  ),
                  SizedBox(height: 6),
                  Image.asset(
                    _digitalIndiaLogoPath,
                    height: 24,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null,
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
