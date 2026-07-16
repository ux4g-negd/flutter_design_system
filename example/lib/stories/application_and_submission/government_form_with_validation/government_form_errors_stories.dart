import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

Color _bg(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50;
Color _cardBg(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50;
Color _titleColor(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
Color _subtleText(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final governmentFormWithErrorsComponent = WidgetbookComponent(
  name: 'Government form with errors',
  useCases: [
    WidgetbookUseCase(
      name: 'Interactive Preview',
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
              ? _GovernmentFormErrorsCardMockup()
              : _GovernmentFormErrorsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Shared helpers
// ───────────────────────────────────────────────────────────────────────

class _PhoneFrame extends StatelessWidget {
  _PhoneFrame({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 760,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _bg(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
      ),
      child: child,
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const String _governmentFormErrorsDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GovernmentFormErrorsScreen extends StatefulWidget {
  GovernmentFormErrorsScreen({super.key});
  @override
  State<GovernmentFormErrorsScreen> createState() =>
      GovernmentFormErrorsScreenState();
}

class GovernmentFormErrorsScreenState
    extends State<GovernmentFormErrorsScreen> {
  bool _acceptTerms = true;
  bool _smsUpdates = false;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '+91 98765 43210';
  String _emailAddress = 'ramesh@example';
  String? _maritalStatus = 'Married';
  String _reason = '';
  String _aadhaarNumber = '1234 5678 9012';
  String? _selectedState;
  double _income = 40;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(_nationalEmblemLogoPath, height: 40),
                  SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral300)),
                  SvgPicture.asset(
                    _unionLogoPath,
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
              Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              Ux4gStatusBanner(
                height: 44,
                variant: Ux4gBannerVariant.successLight,
                title: '',
                backgroundColor: const Color(0xFFF0FDF4),
                borderColor: Colors.transparent,
                trailingIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF065F46),
                        size: 14,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Saved 3:14 PM',
                        style: TextStyle(
                          color: Color(0xFF065F46),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                width: double.infinity,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 2,
                        stepSize: 20,
                        steps: [
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
                          Ux4gStepItem(title: ''),
                        ],
                      ),
                      SizedBox(height: 32),
Text(
  'Personal information',
  style: (Theme.of(context).extension<Ux4gTypography>()?.hM_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: _titleColor(context)),
),
SizedBox(height: 8),
Text(
  'Please enter your details.',
  style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 15)).copyWith(color: _subtleText(context)),
),
                      SizedBox(height: 32),
                      Ux4gInputField(
                        label: 'Full name',
                        value: _fullName,
                        enabled: false,
                        onValueChange: (val) => setState(() => _fullName = val),
                        size: Ux4gInputFieldSize.medium,
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'From Aadhaar · Update via UIDAI',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.open_in_new,
                            size: 12,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Ux4gInputField(
                        label: 'Mobile number',
                        value: _mobileNumber,
                        onValueChange: (val) =>
                            setState(() => _mobileNumber = val),
                        size: Ux4gInputFieldSize.medium,
                      ),
                      SizedBox(height: 24),
                      Ux4gInputField(
                        label: 'Email address',
                        value: _emailAddress,
                        onValueChange: (val) =>
                            setState(() => _emailAddress = val),
                        size: Ux4gInputFieldSize.medium,
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Enter a valid email.',
                      ),
                      SizedBox(height: 24),
                      Ux4gSelectionDropdown(
                        label: 'State of residence',
                        options: [
                          Ux4gDropdownOption(id: 'dl', label: 'Delhi'),
                          Ux4gDropdownOption(id: 'mh', label: 'Maharashtra'),
                        ],
                        selectedOptionIds: _selectedState != null
                            ? [_selectedState!]
                            : [],
                        onSelectionChange: (ids) => setState(
                          () => _selectedState = ids.isNotEmpty
                              ? ids.first
                              : null,
                        ),
                        placeholder: 'Please select..',
                        size: Ux4gDropdownSize.m,
                      ),
                      SizedBox(height: 24),
                      Text('Your marital status', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral700)),
                      SizedBox(height: 8),
                      Ux4gRadioButton(value: 'Single', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Single'),
                      Ux4gRadioButton(value: 'Married', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Married'),
                      Ux4gRadioButton(value: 'Divorced', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Divorced or widowed'),
                      Ux4gRadioButton(value: 'Option4', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Option 4'),
                      SizedBox(height: 24),
                      Ux4gTextArea(label: 'Brief reason (optional)', value: _reason, onValueChange: (val) => setState(() => _reason = val), placeholder: 'Placeholder'),
                      SizedBox(height: 24),
                      Ux4gSlider(
                        label: 'Annual Income (Lakh ₹)',
                        isRequired: true,
                        rightLabelWidget: Text(
                          '₹3.2 Lakh',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        value: _income,
                        onValueChange: (val) => setState(() => _income = val),
                        min: 0,
                        max: 100,
                        steps: 9,
                        showMarksAndValues: true,
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          Text(
                            'Receive SMS updates',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Ux4gToggle(
                            checked: _smsUpdates,
                            onCheckedChange: (v) =>
                                setState(() => _smsUpdates = v),
                            size: Ux4gToggleSize.s,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Ux4gButton(
height: 48, text: 'Continue',
                      onPressed: () {},
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
                      contentColor: primaryColor,
                      borderColor: primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral600 : Ux4gColors.neutral400),
                    ),
                    SizedBox(height: 6),
                    Image.asset(_digitalIndiaLogoPath, height: 24),
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
""";

const String _governmentFormErrorsCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';


""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _GovernmentFormErrorsMockup extends StatefulWidget {
  _GovernmentFormErrorsMockup({super.key});
  @override
  State<_GovernmentFormErrorsMockup> createState() =>
      _GovernmentFormErrorsMockupState();
}

class _GovernmentFormErrorsMockupState
    extends State<_GovernmentFormErrorsMockup> {
  bool _acceptTerms = true;
  bool _smsUpdates = false;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '+91 98765 43210';
  String _emailAddress = 'ramesh@example';
  String? _maritalStatus = 'Married';
  String _reason = '';
  String _aadhaarNumber = '1234 5678 9012';
  String? _selectedState;
  double _income = 40;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(_nationalEmblemLogoPath, height: 40),
                  SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral300)),
                  SvgPicture.asset(
                    _unionLogoPath,
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
              Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              Ux4gStatusBanner(
                height: 44,
                variant: Ux4gBannerVariant.successLight,
                title: '',
                backgroundColor: const Color(0xFFF0FDF4),
                borderColor: Colors.transparent,
                trailingIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF065F46),
                        size: 14,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Saved 3:14 PM',
                        style: TextStyle(
                          color: Color(0xFF065F46),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                width: double.infinity,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ux4gStepper(
                        totalSteps: 4,
                        currentStep: 2,
                        stepSize: 20,
                        steps: [
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
                          Ux4gStepItem(title: ''),
                        ],
                      ),
                      SizedBox(height: 32),
Text(
  'Personal information',
  style: (Theme.of(context).extension<Ux4gTypography>()?.hM_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: _titleColor(context)),
),
SizedBox(height: 8),
Text(
  'Please enter your details.',
  style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 15)).copyWith(color: _subtleText(context)),
),
                      SizedBox(height: 32),
                      Ux4gInputField(
                        label: 'Full name',
                        value: _fullName,
                        enabled: false,
                        onValueChange: (val) => setState(() => _fullName = val),
                        size: Ux4gInputFieldSize.medium,
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'From Aadhaar · Update via UIDAI',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.open_in_new,
                            size: 12,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Ux4gInputField(
                        label: 'Mobile number',
                        value: _mobileNumber,
                        onValueChange: (val) =>
                            setState(() => _mobileNumber = val),
                        size: Ux4gInputFieldSize.medium,
                      ),
                      SizedBox(height: 24),
                      Ux4gInputField(
                        label: 'Email address',
                        value: _emailAddress,
                        onValueChange: (val) =>
                            setState(() => _emailAddress = val),
                        size: Ux4gInputFieldSize.medium,
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Enter a valid email.',
                      ),
                      SizedBox(height: 24),
                      Ux4gSelectionDropdown(
                        label: 'State of residence',
                        options: [
                          Ux4gDropdownOption(id: 'dl', label: 'Delhi'),
                          Ux4gDropdownOption(id: 'mh', label: 'Maharashtra'),
                        ],
                        selectedOptionIds: _selectedState != null
                            ? [_selectedState!]
                            : [],
                        onSelectionChange: (ids) => setState(
                          () => _selectedState = ids.isNotEmpty
                              ? ids.first
                              : null,
                        ),
                        placeholder: 'Please select..',
                        size: Ux4gDropdownSize.m,
                      ),
                      SizedBox(height: 24),
                      Text('Your marital status', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral700)),
                      SizedBox(height: 8),
                      Ux4gRadioButton(value: 'Single', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Single'),
                      Ux4gRadioButton(value: 'Married', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Married'),
                      Ux4gRadioButton(value: 'Divorced', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Divorced or widowed'),
                      Ux4gRadioButton(value: 'Option4', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Option 4'),
                      SizedBox(height: 24),
                      Ux4gTextArea(label: 'Brief reason (optional)', value: _reason, onValueChange: (val) => setState(() => _reason = val), placeholder: 'Placeholder'),
                      SizedBox(height: 24),
                      Ux4gSlider(
                        label: 'Annual Income (Lakh ₹)',
                        isRequired: true,
                        rightLabelWidget: Text(
                          '₹3.2 Lakh',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        value: _income,
                        onValueChange: (val) => setState(() => _income = val),
                        min: 0,
                        max: 100,
                        steps: 9,
                        showMarksAndValues: true,
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          Text(
                            'Receive SMS updates',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Ux4gToggle(
                            checked: _smsUpdates,
                            onCheckedChange: (v) =>
                                setState(() => _smsUpdates = v),
                            size: Ux4gToggleSize.s,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Ux4gButton(
height: 48, text: 'Continue',
                      onPressed: () {},
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
                      contentColor: primaryColor,
                      borderColor: primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral600 : Ux4gColors.neutral400),
                    ),
                    SizedBox(height: 6),
                    Image.asset(_digitalIndiaLogoPath, height: 24),
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

class _GovernmentFormErrorsCardMockup extends StatefulWidget {
  _GovernmentFormErrorsCardMockup({super.key});
  @override
  State<_GovernmentFormErrorsCardMockup> createState() =>
      _GovernmentFormErrorsCardMockupState();
}

class _GovernmentFormErrorsCardMockupState
    extends State<_GovernmentFormErrorsCardMockup> {
  bool _acceptTerms = true;
  bool _smsUpdates = false;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '+91 98765 43210';
  String _emailAddress = 'ramesh@example';
  String? _maritalStatus = 'Married';
  String _reason = '';
  String? _selectedState;
  double _income = 40;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);
    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: _cardBg(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: Ux4gAppHeaderVariant.light,
                      title: '',
                      leadingWidgets: [
                        SvgPicture.asset(_nationalEmblemLogoPath, height: 40),
                        SizedBox(height: 32, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral300)),
                        SvgPicture.asset(
                          _unionLogoPath,
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
                    Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ux4gStatusBanner(
                              height: 44,
                              variant: Ux4gBannerVariant.successLight,
                              title: '',
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              backgroundColor: const Color(0xFFF0FDF4),
                              borderColor: Colors.transparent,
                              trailingIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Color(0xFF065F46),
                                      size: 14,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Saved 3:14 PM',
                                      style: TextStyle(
                                        color: Color(0xFF065F46),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              width: double.infinity,
                            ),
                            SizedBox(height: 32),
                            Ux4gStepper(
                              totalSteps: 4,
                              currentStep: 2,
                              stepSize: 20,
                              steps: [
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
                                Ux4gStepItem(title: ''),
                              ],
                            ),
                            SizedBox(height: 32),
                            Text(
                              'Personal information',
                              style: (Theme.of(context).extension<Ux4gTypography>()?.hM_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: _titleColor(context)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Please enter your details.',
                              style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 15)).copyWith(color: _subtleText(context)),
                            ),
                            SizedBox(height: 32),
                            Ux4gInputField(
                              label: 'Full name',
                              value: _fullName,
                              enabled: false,
                              onValueChange: (val) => setState(() => _fullName = val),
                              size: Ux4gInputFieldSize.medium,
                              labelStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gColors.neutral200
                                    : Ux4gColors.neutral700,
                              ),
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.neutral900,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'From Aadhaar · Update via UIDAI',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Ux4gColors.primary300
                                        : Ux4gColors.primary600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.open_in_new,
                                  size: 12,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Ux4gColors.primary300
                                      : Ux4gColors.primary600,
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Ux4gInputField(
                              label: 'Email address',
                              value: _emailAddress,
                              onValueChange: (val) =>
                                  setState(() => _emailAddress = val),
                              size: Ux4gInputFieldSize.medium,
                              status: Ux4gInputFieldStatus.error,
                              caption: 'Enter a valid email.',
                            ),
                            SizedBox(height: 24),
                            Ux4gSelectionDropdown(
                              label: 'State of residence',
                              options: [
                                Ux4gDropdownOption(id: 'dl', label: 'Delhi'),
                                Ux4gDropdownOption(
                                  id: 'mh',
                                  label: 'Maharashtra',
                                ),
                              ],
                              selectedOptionIds: _selectedState != null
                                  ? [_selectedState!]
                                  : [],
                              onSelectionChange: (ids) => setState(
                                () => _selectedState = ids.isNotEmpty
                                    ? ids.first
                                    : null,
                              ),
                              placeholder: 'Please select..',
                              size: Ux4gDropdownSize.m,
                            ),
                            SizedBox(height: 24),
                            Text('Your marital status', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral700)),
                            SizedBox(height: 8),
                            Ux4gRadioButton(value: 'Single', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Single'),
                            Ux4gRadioButton(value: 'Married', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Married'),
                            Ux4gRadioButton(value: 'Divorced', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Divorced or widowed'),
                            Ux4gRadioButton(value: 'Option4', groupValue: _maritalStatus, onChanged: (val) => setState(() => _maritalStatus = val), label: 'Option 4'),
                            SizedBox(height: 24),
                            Ux4gTextArea(label: 'Brief reason (optional)', value: _reason, onValueChange: (val) => setState(() => _reason = val), placeholder: 'Placeholder'),
                            SizedBox(height: 24),
                            Ux4gSlider(
                              label: 'Annual Income (Lakh ₹)',
                              isRequired: true,
                              rightLabelWidget: Text(
                                '₹3.2 Lakh',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              value: _income,
                              onValueChange: (val) =>
                                  setState(() => _income = val),
                              min: 0,
                              max: 100,
                              steps: 9,
                              showMarksAndValues: true,
                            ),
                            SizedBox(height: 32),
                            Row(
                              children: [
                                Text(
                                  'Receive SMS updates',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                Ux4gToggle(
                                  checked: _smsUpdates,
                                  onCheckedChange: (v) =>
                                      setState(() => _smsUpdates = v),
                                  size: Ux4gToggleSize.s,
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
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
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Ux4gButton(
height: 48, text: 'Continue',
                      onPressed: () {},
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
                      contentColor: primaryColor,
                      borderColor: primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral600 : Ux4gColors.neutral400),
                    ),
                    SizedBox(height: 6),
                    Image.asset(_digitalIndiaLogoPath, height: 24),
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

