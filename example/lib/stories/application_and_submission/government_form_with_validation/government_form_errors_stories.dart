import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final governmentFormWithErrorsComponent = WidgetbookComponent(
  name: 'Government form with errors',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Layout Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
        );

        final isCardStyle = variant == 'Card style';
        final code = isCardStyle
            ? _governmentFormErrorsCardCode
            : _governmentFormErrorsDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Government form with errors',
          description:
              'A government form pattern demonstrating field-level validation errors, toggle switches, and customized sliders.',
          code: code,
          center: true,
          child: isCardStyle
              ? const _GovernmentFormErrorsCardMockup()
              : const _GovernmentFormErrorsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const String _governmentFormErrorsDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GovernmentFormErrorsScreen extends StatefulWidget {
  const GovernmentFormErrorsScreen({super.key});

  @override
  State<GovernmentFormErrorsScreen> createState() =>
      _GovernmentFormErrorsScreenState();
}

class _GovernmentFormErrorsScreenState
    extends State<GovernmentFormErrorsScreen> {
  bool _confirmAccuracy = false;
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '+91 98765 43210';
  String _emailAddress = 'ramesh@example';
  String _aadhaarNumber = '1234 5678 9012';
  String? _selectedState;
  String? _maritalStatus = 'Married';
  String _reason = '';
  double _income = 40;

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back link
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 16,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary700,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Stepper with labels (Personal active)
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 2,
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
                    const SizedBox(height: 20),

                    // Saved Status Indicator Banner (Using Ux4gStatusBanner)
                    Ux4gStatusBanner(
                      height: 40,
                      variant: Ux4gBannerVariant.successLight,
                      title: '',
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF064E3B).withValues(alpha: 0.4)
                              : const Color(0xFFECFDF5),
                      borderColor: Colors.transparent,
                      trailingIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 15,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF34D399)
                                    : const Color(0xFF059669),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Saved 3:14 PM',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF34D399)
                                  : const Color(0xFF059669),
                            ),
                          ),
                        ],
                      ),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 20),

                    // Title & Subtitle
                    Text(
                      'Personal information',
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
                      'Please enter your details.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral400
                            : Ux4gColors.neutral600,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Full name (disabled)
                    Ux4gInputField(
                      label: 'Full name',
                      value: _fullName,
                      enabled: false,
                      onValueChange: (val) => setState(() => _fullName = val),
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          'From Aadhaar · Update via UIDAI',
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.open_in_new,
                          size: 11,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.primary300
                              : Ux4gColors.primary600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Mobile number (disabled prefilled)
                    Ux4gInputField(
                      label: 'Mobile number',
                      value: _mobileNumber,
                      enabled: false,
                      onValueChange: (val) => setState(() => _mobileNumber = val),
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 16),

                    // Email address (with error)
                    Ux4gInputField(
                      label: 'Email address',
                      value: _emailAddress,
                      onValueChange: (val) => setState(() => _emailAddress = val),
                      placeholder: 'ramesh@example',
                      size: Ux4gInputFieldSize.medium,
                      status: Ux4gInputFieldStatus.error,
                      caption: 'Enter a valid email.',
                    ),
                    const SizedBox(height: 16),

                    // Aadhaar number (disabled prefilled)
                    Ux4gInputField(
                      label: 'Aadhaar number',
                      value: _aadhaarNumber,
                      enabled: false,
                      onValueChange: (val) => setState(() => _aadhaarNumber = val),
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 16),

                    // State of residence
                    Ux4gSelectionDropdown(
                      label: 'State of residence',
                      placeholder: 'Please select..',
                      options: const [
                        Ux4gDropdownOption(id: 'dl', label: 'Delhi'),
                        Ux4gDropdownOption(id: 'mh', label: 'Maharashtra'),
                        Ux4gDropdownOption(id: 'up', label: 'Uttar Pradesh'),
                        Ux4gDropdownOption(id: 'ka', label: 'Karnataka'),
                      ],
                      selectedOptionIds: _selectedState != null ? [_selectedState!] : [],
                      onSelectionChange: (ids) => setState(
                        () => _selectedState = ids.isNotEmpty ? ids.first : null,
                      ),
                      size: Ux4gDropdownSize.m,
                    ),
                    const SizedBox(height: 20),

                    // Marital status
                    Text(
                      'Your marital status',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral200
                            : Ux4gColors.neutral800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Ux4gRadioButton(
                      value: 'Single',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Single',
                    ),
                    Ux4gRadioButton(
                      value: 'Married',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Married',
                    ),
                    Ux4gRadioButton(
                      value: 'Divorced',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Divorced or widowed',
                    ),
                    Ux4gRadioButton(
                      value: 'Option4',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Option 4',
                    ),
                    const SizedBox(height: 20),

                    // TextArea
                    Ux4gTextArea(
                      label: 'Brief reason (optional)',
                      value: _reason,
                      onValueChange: (v) => setState(() => _reason = v),
                      placeholder: 'Placeholder',
                    ),
                    const SizedBox(height: 20),

                    // Slider
                    Ux4gSlider(
                      label: 'Annual Income (Lakh ₹)',
                      isRequired: true,
                      rightLabelWidget: Text(
                        '₹3.2 Lakh',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      value: _income,
                      onValueChange: (v) => setState(() => _income = v),
                      min: 0,
                      max: 100,
                      steps: 9,
                      showMarksAndValues: true,
                    ),
                    const SizedBox(height: 24),

                    // Checkboxes
                    Ux4gCheckbox(
                      label:
                          'I confirm the above information is accurate and authorise verification.',
                      isRequired: true,
                      value: _confirmAccuracy,
                      onChanged: (v) => setState(() => _confirmAccuracy = v ?? false),
                    ),
                    const SizedBox(height: 12),
                    Ux4gCheckbox(
                      label: 'Accept terms and conditions',
                      isRequired: true,
                      value: _acceptTerms,
                      onChanged: (v) => setState(() => _acceptTerms = v ?? false),
                    ),
                    const SizedBox(height: 28),

                    // Actions
                    Ux4gButton(
                      height: 48,
                      text: 'Continue',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      height: 48,
                      text: 'Save as Draft',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      contentColor: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.primary300
                          : Ux4gColors.primary600,
                      borderColor: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.primary400
                          : Ux4gColors.primary500,
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

const String _governmentFormErrorsCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GovernmentFormErrorsCardScreen extends StatefulWidget {
  const GovernmentFormErrorsCardScreen({super.key});

  @override
  State<GovernmentFormErrorsCardScreen> createState() =>
      _GovernmentFormErrorsCardScreenState();
}

class _GovernmentFormErrorsCardScreenState
    extends State<GovernmentFormErrorsCardScreen> {
  bool _confirmAccuracy = false;
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '+91 98765 43210';
  String _emailAddress = 'ramesh@example';
  String _aadhaarNumber = '1234 5678 9012';
  String? _selectedState;
  String? _maritalStatus = 'Married';
  String _reason = '';
  double _income = 40;

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
                      // Back link inside card
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 16,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.primary300
                                      : Ux4gColors.primary700,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gColors.primary300
                                        : Ux4gColors.primary700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Stepper with labels inside card (Personal active)
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 2,
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
                      const SizedBox(height: 20),

                      // Saved Status Indicator Banner (Using Ux4gStatusBanner)
                      Ux4gStatusBanner(
                        height: 40,
                        variant: Ux4gBannerVariant.successLight,
                        title: '',
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? const Color(0xFF064E3B).withValues(alpha: 0.4)
                                : const Color(0xFFECFDF5),
                        borderColor: Colors.transparent,
                        trailingIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 15,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF34D399)
                                  : const Color(0xFF059669),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Saved 3:14 PM',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF34D399)
                                    : const Color(0xFF059669),
                              ),
                            ),
                          ],
                        ),
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20),

                      // Title & Subtitle
                      Text(
                        'Personal information',
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
                        'Please enter your details.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral600,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Full name (disabled)
                      Ux4gInputField(
                        label: 'Full name',
                        value: _fullName,
                        enabled: false,
                        onValueChange: (val) =>
                            setState(() => _fullName = val),
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            'From Aadhaar · Update via UIDAI',
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.open_in_new,
                            size: 11,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Mobile number (disabled)
                      Ux4gInputField(
                        label: 'Mobile number',
                        value: _mobileNumber,
                        enabled: false,
                        onValueChange: (val) =>
                            setState(() => _mobileNumber = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 16),

                      // Email address (with error)
                      Ux4gInputField(
                        label: 'Email address',
                        value: _emailAddress,
                        onValueChange: (val) =>
                            setState(() => _emailAddress = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Enter a valid email.',
                      ),
                      const SizedBox(height: 16),

                      // Aadhaar number (disabled)
                      Ux4gInputField(
                        label: 'Aadhaar number',
                        value: _aadhaarNumber,
                        enabled: false,
                        onValueChange: (val) =>
                            setState(() => _aadhaarNumber = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 16),

                      // State of residence
                      Ux4gSelectionDropdown(
                        label: 'State of residence',
                        placeholder: 'Please select..',
                        options: const [
                          Ux4gDropdownOption(id: 'dl', label: 'Delhi'),
                          Ux4gDropdownOption(id: 'mh', label: 'Maharashtra'),
                          Ux4gDropdownOption(id: 'up', label: 'Uttar Pradesh'),
                          Ux4gDropdownOption(id: 'ka', label: 'Karnataka'),
                        ],
                        selectedOptionIds: _selectedState != null
                            ? [_selectedState!]
                            : [],
                        onSelectionChange: (ids) => setState(
                          () =>
                              _selectedState = ids.isNotEmpty ? ids.first : null,
                        ),
                        size: Ux4gDropdownSize.m,
                      ),
                      const SizedBox(height: 20),

                      // Marital status
                      Text(
                        'Your marital status',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness ==
                                  Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Ux4gRadioButton(
                        value: 'Single',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Single',
                      ),
                      Ux4gRadioButton(
                        value: 'Married',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Married',
                      ),
                      Ux4gRadioButton(
                        value: 'Divorced',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Divorced or widowed',
                      ),
                      Ux4gRadioButton(
                        value: 'Option4',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Option 4',
                      ),
                      const SizedBox(height: 20),

                      // TextArea
                      Ux4gTextArea(
                        label: 'Brief reason (optional)',
                        value: _reason,
                        onValueChange: (v) => setState(() => _reason = v),
                        placeholder: 'Placeholder',
                      ),
                      const SizedBox(height: 20),

                      // Slider
                      Ux4gSlider(
                        label: 'Annual Income (Lakh ₹)',
                        isRequired: true,
                        rightLabelWidget: Text(
                          '₹3.2 Lakh',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Ux4gColors.neutral50
                                : Ux4gColors.neutral900,
                          ),
                        ),
                        value: _income,
                        onValueChange: (v) => setState(() => _income = v),
                        min: 0,
                        max: 100,
                        steps: 9,
                        showMarksAndValues: true,
                      ),
                      const SizedBox(height: 24),

                      // Checkboxes
                      Ux4gCheckbox(
                        label:
                            'I confirm the above information is accurate and authorise verification.',
                        isRequired: true,
                        value: _confirmAccuracy,
                        onChanged: (v) =>
                            setState(() => _confirmAccuracy = v ?? false),
                      ),
                      const SizedBox(height: 12),
                      Ux4gCheckbox(
                        label: 'Accept terms and conditions',
                        isRequired: true,
                        value: _acceptTerms,
                        onChanged: (v) =>
                            setState(() => _acceptTerms = v ?? false),
                      ),
                      const SizedBox(height: 28),

                      // Actions
                      Ux4gButton(
                        height: 48,
                        text: 'Continue',
                        onPressed: () {},
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 12),
                      Ux4gButton(
                        height: 48,
                        text: 'Save as Draft',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        contentColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        borderColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Ux4gColors.primary400
                            : Ux4gColors.primary500,
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

class _GovernmentFormErrorsMockup extends StatefulWidget {
  const _GovernmentFormErrorsMockup();

  @override
  State<_GovernmentFormErrorsMockup> createState() =>
      _GovernmentFormErrorsMockupState();
}

class _GovernmentFormErrorsMockupState
    extends State<_GovernmentFormErrorsMockup> {
  bool _confirmAccuracy = false;
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '+91 98765 43210';
  String _emailAddress = 'ramesh@example';
  String _aadhaarNumber = '1234 5678 9012';
  String? _selectedState;
  String? _maritalStatus = 'Married';
  String _reason = '';
  double _income = 40;

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back link
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 16,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary700,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Stepper with labels (Personal active)
                    Ux4gStepper(
                      totalSteps: 4,
                      currentStep: 2,
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
                    const SizedBox(height: 20),

                    // Saved Status Indicator Banner (Using Ux4gStatusBanner)
                    Ux4gStatusBanner(
                      height: 40,
                      variant: Ux4gBannerVariant.successLight,
                      title: '',
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF064E3B).withValues(alpha: 0.4)
                              : const Color(0xFFECFDF5),
                      borderColor: Colors.transparent,
                      trailingIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 15,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color(0xFF34D399)
                                    : const Color(0xFF059669),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Saved 3:14 PM',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF34D399)
                                  : const Color(0xFF059669),
                            ),
                          ),
                        ],
                      ),
                      width: double.infinity,
                    ),
                    const SizedBox(height: 20),

                    // Title & Subtitle
                    Text(
                      'Personal information',
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
                      'Please enter your details.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral400
                            : Ux4gColors.neutral600,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Full name (disabled)
                    Ux4gInputField(
                      label: 'Full name',
                      value: _fullName,
                      enabled: false,
                      onValueChange: (val) => setState(() => _fullName = val),
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          'From Aadhaar · Update via UIDAI',
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.open_in_new,
                          size: 11,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.primary300
                              : Ux4gColors.primary600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Mobile number (disabled prefilled)
                    Ux4gInputField(
                      label: 'Mobile number',
                      value: _mobileNumber,
                      enabled: false,
                      onValueChange: (val) => setState(() => _mobileNumber = val),
                      placeholder: 'Placeholder',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 16),

                    // Email address (with error)
                    Ux4gInputField(
                      label: 'Email address',
                      value: _emailAddress,
                      onValueChange: (val) => setState(() => _emailAddress = val),
                      placeholder: 'Placeholder',
                      size: Ux4gInputFieldSize.medium,
                      status: Ux4gInputFieldStatus.error,
                      caption: 'Enter a valid email.',
                    ),
                    const SizedBox(height: 16),

                    // Aadhaar number (disabled)
                    Ux4gInputField(
                      label: 'Aadhaar number',
                      value: _aadhaarNumber,
                      enabled: false,
                      onValueChange: (val) => setState(() => _aadhaarNumber = val),
                      placeholder: 'Placeholder',
                      size: Ux4gInputFieldSize.medium,
                    ),
                    const SizedBox(height: 16),

                    // State of residence
                    Ux4gSelectionDropdown(
                      label: 'State of residence',
                      placeholder: 'Please select..',
                      options: const [
                        Ux4gDropdownOption(id: 'dl', label: 'Delhi'),
                        Ux4gDropdownOption(id: 'mh', label: 'Maharashtra'),
                        Ux4gDropdownOption(id: 'up', label: 'Uttar Pradesh'),
                        Ux4gDropdownOption(id: 'ka', label: 'Karnataka'),
                      ],
                      selectedOptionIds: _selectedState != null ? [_selectedState!] : [],
                      onSelectionChange: (ids) => setState(
                        () => _selectedState = ids.isNotEmpty ? ids.first : null,
                      ),
                      size: Ux4gDropdownSize.m,
                    ),
                    const SizedBox(height: 20),

                    // Marital status
                    Text(
                      'Your marital status',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral200
                            : Ux4gColors.neutral800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Ux4gRadioButton(
                      value: 'Single',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Single',
                    ),
                    Ux4gRadioButton(
                      value: 'Married',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Married',
                    ),
                    Ux4gRadioButton(
                      value: 'Divorced',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Divorced or widowed',
                    ),
                    Ux4gRadioButton(
                      value: 'Option4',
                      groupValue: _maritalStatus,
                      onChanged: (v) => setState(() => _maritalStatus = v),
                      label: 'Option 4',
                    ),
                    const SizedBox(height: 20),

                    // TextArea
                    Ux4gTextArea(
                      label: 'Brief reason (optional)',
                      value: _reason,
                      onValueChange: (v) => setState(() => _reason = v),
                      placeholder: 'Placeholder',
                    ),
                    const SizedBox(height: 20),

                    // Slider
                    Ux4gSlider(
                      label: 'Annual Income (Lakh ₹)',
                      isRequired: true,
                      rightLabelWidget: Text(
                        '₹3.2 Lakh',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      value: _income,
                      onValueChange: (v) => setState(() => _income = v),
                      min: 0,
                      max: 100,
                      steps: 9,
                      showMarksAndValues: true,
                    ),
                    const SizedBox(height: 24),

                    // Checkboxes
                    Ux4gCheckbox(
                      label:
                          'I confirm the above information is accurate and authorise verification.',
                      isRequired: true,
                      value: _confirmAccuracy,
                      onChanged: (v) => setState(() => _confirmAccuracy = v ?? false),
                    ),
                    const SizedBox(height: 12),
                    Ux4gCheckbox(
                      label: 'Accept terms and conditions',
                      isRequired: true,
                      value: _acceptTerms,
                      onChanged: (v) => setState(() => _acceptTerms = v ?? false),
                    ),
                    const SizedBox(height: 28),

                    // Actions
                    Ux4gButton(
                      height: 48,
                      text: 'Continue',
                      onPressed: () {},
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Ux4gButton(
                      height: 48,
                      text: 'Save as Draft',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      width: double.infinity,
                      contentColor: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.primary300
                          : Ux4gColors.primary600,
                      borderColor: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.primary400
                          : Ux4gColors.primary500,
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

class _GovernmentFormErrorsCardMockup extends StatefulWidget {
  const _GovernmentFormErrorsCardMockup();

  @override
  State<_GovernmentFormErrorsCardMockup> createState() =>
      _GovernmentFormErrorsCardMockupState();
}

class _GovernmentFormErrorsCardMockupState
    extends State<_GovernmentFormErrorsCardMockup> {
  bool _confirmAccuracy = false;
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '+91 98765 43210';
  String _emailAddress = 'ramesh@example';
  String _aadhaarNumber = '1234 5678 9012';
  String? _selectedState;
  String? _maritalStatus = 'Married';
  String _reason = '';
  double _income = 40;

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
                      // Back link inside card
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 16,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.primary300
                                      : Ux4gColors.primary700,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gColors.primary300
                                        : Ux4gColors.primary700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Stepper with labels inside card (Personal active)
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 2,
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
                      const SizedBox(height: 20),

                      // Saved Status Indicator Banner (Using Ux4gStatusBanner)
                      Ux4gStatusBanner(
                        height: 40,
                        variant: Ux4gBannerVariant.successLight,
                        title: '',
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? const Color(0xFF064E3B).withValues(alpha: 0.4)
                                : const Color(0xFFECFDF5),
                        borderColor: Colors.transparent,
                        trailingIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 15,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF34D399)
                                  : const Color(0xFF059669),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Saved 3:14 PM',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF34D399)
                                    : const Color(0xFF059669),
                              ),
                            ),
                          ],
                        ),
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20),

                      // Title & Subtitle
                      Text(
                        'Personal information',
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
                        'Please enter your details.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral400
                              : Ux4gColors.neutral600,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Full name (disabled)
                      Ux4gInputField(
                        label: 'Full name',
                        value: _fullName,
                        enabled: false,
                        onValueChange: (val) =>
                            setState(() => _fullName = val),
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            'From Aadhaar · Update via UIDAI',
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.open_in_new,
                            size: 11,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Mobile number (disabled)
                      Ux4gInputField(
                        label: 'Mobile number',
                        value: _mobileNumber,
                        enabled: false,
                        onValueChange: (val) =>
                            setState(() => _mobileNumber = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 16),

                      // Email address (with error)
                      Ux4gInputField(
                        label: 'Email address',
                        value: _emailAddress,
                        onValueChange: (val) =>
                            setState(() => _emailAddress = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Enter a valid email.',
                      ),
                      const SizedBox(height: 16),

                      // Aadhaar number (disabled)
                      Ux4gInputField(
                        label: 'Aadhaar number',
                        value: _aadhaarNumber,
                        enabled: false,
                        onValueChange: (val) =>
                            setState(() => _aadhaarNumber = val),
                        placeholder: 'Placeholder',
                        size: Ux4gInputFieldSize.medium,
                      ),
                      const SizedBox(height: 16),

                      // State of residence
                      Ux4gSelectionDropdown(
                        label: 'State of residence',
                        placeholder: 'Please select..',
                        options: const [
                          Ux4gDropdownOption(id: 'dl', label: 'Delhi'),
                          Ux4gDropdownOption(id: 'mh', label: 'Maharashtra'),
                          Ux4gDropdownOption(id: 'up', label: 'Uttar Pradesh'),
                          Ux4gDropdownOption(id: 'ka', label: 'Karnataka'),
                        ],
                        selectedOptionIds: _selectedState != null
                            ? [_selectedState!]
                            : [],
                        onSelectionChange: (ids) => setState(
                          () =>
                              _selectedState = ids.isNotEmpty ? ids.first : null,
                        ),
                        size: Ux4gDropdownSize.m,
                      ),
                      const SizedBox(height: 20),

                      // Marital status
                      Text(
                        'Your marital status',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).brightness ==
                                  Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Ux4gRadioButton(
                        value: 'Single',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Single',
                      ),
                      Ux4gRadioButton(
                        value: 'Married',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Married',
                      ),
                      Ux4gRadioButton(
                        value: 'Divorced',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Divorced or widowed',
                      ),
                      Ux4gRadioButton(
                        value: 'Option4',
                        groupValue: _maritalStatus,
                        onChanged: (v) =>
                            setState(() => _maritalStatus = v),
                        label: 'Option 4',
                      ),
                      const SizedBox(height: 20),

                      // TextArea
                      Ux4gTextArea(
                        label: 'Brief reason (optional)',
                        value: _reason,
                        onValueChange: (v) => setState(() => _reason = v),
                        placeholder: 'Placeholder',
                      ),
                      const SizedBox(height: 20),

                      // Slider
                      Ux4gSlider(
                        label: 'Annual Income (Lakh ₹)',
                        isRequired: true,
                        rightLabelWidget: Text(
                          '₹3.2 Lakh',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Ux4gColors.neutral50
                                : Ux4gColors.neutral900,
                          ),
                        ),
                        value: _income,
                        onValueChange: (v) => setState(() => _income = v),
                        min: 0,
                        max: 100,
                        steps: 9,
                        showMarksAndValues: true,
                      ),
                      const SizedBox(height: 24),

                      // Checkboxes
                      Ux4gCheckbox(
                        label:
                            'I confirm the above information is accurate and authorise verification.',
                        isRequired: true,
                        value: _confirmAccuracy,
                        onChanged: (v) =>
                            setState(() => _confirmAccuracy = v ?? false),
                      ),
                      const SizedBox(height: 12),
                      Ux4gCheckbox(
                        label: 'Accept terms and conditions',
                        isRequired: true,
                        value: _acceptTerms,
                        onChanged: (v) =>
                            setState(() => _acceptTerms = v ?? false),
                      ),
                      const SizedBox(height: 28),

                      // Actions
                      Ux4gButton(
                        height: 48,
                        text: 'Continue',
                        onPressed: () {},
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 12),
                      Ux4gButton(
                        height: 48,
                        text: 'Save as Draft',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        contentColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        borderColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Ux4gColors.primary400
                            : Ux4gColors.primary500,
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
