import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

Color _bg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
    ? Ux4gPalette.neutral900
    : Ux4gPalette.neutral50;
Color _cardBg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
    ? Ux4gPalette.primary900
    : Ux4gPalette.primary50;
Color _titleColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
    ? Ux4gPalette.neutral50
    : Ux4gPalette.neutral900;
Color _subtleText(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
    ? Ux4gPalette.neutral400
    : Ux4gPalette.neutral600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final governmentFormWithValidationComponent = WidgetbookComponent(
  name: 'Government form with validation',
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
            ? _governmentFormCardCode
            : _governmentFormDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Government form with validation',
          description:
              'A comprehensive government form pattern featuring validation, pre-filled data, status banners, and various input types.',
          code: code,
          center: true,
          child: isCardStyle
              ? _GovernmentFormCardMockup()
              : _GovernmentFormMockup(),
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
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? Ux4gPalette.neutral800
              : Ux4gPalette.neutral200,
        ),
      ),
      child: ScaffoldMessenger(child: child),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const String _governmentFormDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GovernmentFormScreen extends StatefulWidget {
  GovernmentFormScreen({super.key});

  @override
  State<GovernmentFormScreen> createState() => GovernmentFormScreenState();
}

class GovernmentFormScreenState extends State<GovernmentFormScreen> {
  bool _acceptTerms = false;
  bool _showBanner = false;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '';
  String _emailAddress = '';
  String _aadhaarNumber = '';
  String? _selectedState;
  String? _maritalStatus;
  String _reason = '';
  double _income = 0;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Ux4gPalette.neutral900
            : Ux4gPalette.neutral0,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Ux4gAppHeader(
                    variant: Ux4gAppHeaderVariant.light,
                    title: '',
                    leadingWidgets: [
                      SvgPicture.asset(_nationalEmblemLogoPath, height: 40),
                      SizedBox(
                        height: 32,
                        child: Ux4gDivider(
                          orientation: Ux4gDividerOrientation.vertical,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral700
                              : Ux4gPalette.neutral300,
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
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Ux4gPalette.neutral200,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Ux4gButton(
                        text: 'Back',
                        variant: Ux4gButtonVariant.ghost,
                        onPressed: () {},
                        leadingIcon: Icons.arrow_back,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.primary300
                            : Ux4gPalette.primary900,
                      ),
                    ),
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
                            onValueChange: (val) =>
                                setState(() => _fullName = val),
                            size: Ux4gInputFieldSize.medium,
                            labelStyle: TextStyle(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                            ),
                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral50
                                  : Ux4gPalette.neutral900,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'From Aadhaar · Update via UIDAI',
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.primary300
                                      : Ux4gPalette.primary600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.open_in_new,
                                size: 12,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.primary300
                                    : Ux4gPalette.primary600,
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
                          ),
                          SizedBox(height: 24),
                          Ux4gInputField(
                            label: 'Aadhaar number',
                            value: _aadhaarNumber,
                            onValueChange: (val) =>
                                setState(() => _aadhaarNumber = val),
                            size: Ux4gInputFieldSize.medium,
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
                              Ux4gDropdownOption(
                                id: 'up',
                                label: 'Uttar Pradesh',
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
                          Text(
                            'Your marital status',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral300
                                  : Ux4gPalette.neutral700,
                            ),
                          ),
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
                          SizedBox(height: 24),
                          Ux4gTextArea(
                            label: 'Brief reason for application (optional)',
                            value: _reason,
                            onValueChange: (v) => setState(() => _reason = v),
                            placeholder: 'Placeholder',
                          ),
                          SizedBox(height: 24),
                          Ux4gSlider(
                            label: 'Annual Income (Lakh ₹)',
                            isRequired: true,
                            rightLabelWidget: Text(
                              '₹${_income.toInt()}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                              ),
                            ),
                            value: _income,
                            onValueChange: (v) => setState(() => _income = v),
                            min: 0,
                            max: 10,
                            steps: 9,
                            showMarksAndValues: true,
                            valueFormatter: (val) => val == 10 ? '10+' : val.toInt().toString(),
                          ),
                          SizedBox(height: 32),
                          Text(
                            'Receive application status updates via SMS',
                            style: (Theme.of(context).extension<Ux4gTypography>()?.lXL_default ?? TextStyle(fontSize: 15, fontWeight: FontWeight.w600)).copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.neutral50
                                  : Ux4gPalette.neutral900,
                            ),
                          ),
                          SizedBox(height: 16),
                          Ux4gCheckbox(
                            label: 'Accept terms and conditions',
                            isRequired: true,
                            value: _acceptTerms,
                            onChanged: (v) =>
                                setState(() => _acceptTerms = v ?? false),
                          ),
      
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      children: [
                        Ux4gButton(
                          height: 48,
                          text: 'Continue',
                          onPressed: _acceptTerms
                              ? () {
                                  setState(() => _showBanner = true);
                                  Future.delayed(Duration(seconds: 3), () {
                                    if (mounted)
                                      setState(() => _showBanner = false);
                                  });
                                }
                              : null,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                        ),
                        SizedBox(height: 12),
                        Ux4gButton(
                          height: 48,
                          text: 'Save as Draft',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor: primaryColor,
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
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral600
                                : Ux4gPalette.neutral400,
                          ),
                        ),
                        SizedBox(height: 6),
                        Image.asset(_digitalIndiaLogoPath, height: 24),
                      ],
                    ),
                  ),
                ],
              ),
              if (_showBanner)
                Positioned(
                  top: 74,
                  left: 16,
                  right: 16,
                  child: Ux4gStatusBanner(
                    height: 44,
                    variant: Ux4gBannerVariant.successLight,
                    title: '',
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
""";

const String _governmentFormCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';


""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _GovernmentFormMockup extends StatefulWidget {
  _GovernmentFormMockup({super.key});

  @override
  State<_GovernmentFormMockup> createState() => _GovernmentFormMockupState();
}

class _GovernmentFormMockupState extends State<_GovernmentFormMockup> {
  bool _acceptTerms = false;
  bool _showBanner = false;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '';
  String _emailAddress = '';
  String _aadhaarNumber = '';
  String? _selectedState;
  String? _maritalStatus;
  String _reason = '';
  double _income = 0;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Ux4gPalette.neutral900
            : Ux4gPalette.neutral0,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Ux4gAppHeader(
                    variant: Ux4gAppHeaderVariant.light,
                    title: '',
                    leadingWidgets: [
                      SvgPicture.asset(_nationalEmblemLogoPath, height: 40),
                      SizedBox(
                        height: 32,
                        child: Ux4gDivider(
                          orientation: Ux4gDividerOrientation.vertical,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral700
                              : Ux4gPalette.neutral300,
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
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral800
                        : Ux4gPalette.neutral200,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Ux4gButton(
                        text: 'Back',
                        variant: Ux4gButtonVariant.ghost,
                        onPressed: () {},
                        leadingIcon: Icons.arrow_back,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gPalette.primary300
                            : Ux4gPalette.primary900,
                      ),
                    ),
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
                            onValueChange: (val) =>
                                setState(() => _fullName = val),
                            size: Ux4gInputFieldSize.medium,
                            labelStyle: TextStyle(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.neutral200
                                  : Ux4gPalette.neutral700,
                            ),
                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral50
                                  : Ux4gPalette.neutral900,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'From Aadhaar · Update via UIDAI',
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gPalette.primary300
                                      : Ux4gPalette.primary600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.open_in_new,
                                size: 12,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.primary300
                                    : Ux4gPalette.primary600,
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
                          ),
                          SizedBox(height: 24),
                          Ux4gInputField(
                            label: 'Aadhaar number',
                            value: _aadhaarNumber,
                            onValueChange: (val) =>
                                setState(() => _aadhaarNumber = val),
                            size: Ux4gInputFieldSize.medium,
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
                              Ux4gDropdownOption(
                                id: 'up',
                                label: 'Uttar Pradesh',
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
                          Text(
                            'Your marital status',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral300
                                  : Ux4gPalette.neutral700,
                            ),
                          ),
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
                          SizedBox(height: 24),
                          Ux4gTextArea(
                            label: 'Brief reason for application (optional)',
                            value: _reason,
                            onValueChange: (v) => setState(() => _reason = v),
                            placeholder: 'Placeholder',
                          ),
                          SizedBox(height: 24),
                          Ux4gSlider(
                            label: 'Annual Income (Lakh ₹)',
                            isRequired: true,
                            rightLabelWidget: Text(
                              '₹${_income.toInt()}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gPalette.neutral50
                                    : Ux4gPalette.neutral900,
                              ),
                            ),
                            value: _income,
                            onValueChange: (v) => setState(() => _income = v),
                            min: 0,
                            max: 10,
                            steps: 9,
                            showMarksAndValues: true,
                            valueFormatter: (val) => val == 10 ? '10+' : val.toInt().toString(),
                          ),
                          SizedBox(height: 32),
                          Text(
                            'Receive application status updates via SMS',
                            style: (Theme.of(context).extension<Ux4gTypography>()?.lXL_default ?? TextStyle(fontSize: 15, fontWeight: FontWeight.w600)).copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gPalette.neutral50
                                  : Ux4gPalette.neutral900,
                            ),
                          ),
                          SizedBox(height: 16),
                          Ux4gCheckbox(
                            label: 'Accept terms and conditions',
                            isRequired: true,
                            value: _acceptTerms,
                            onChanged: (v) =>
                                setState(() => _acceptTerms = v ?? false),
                          ),
      
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      children: [
                        Ux4gButton(
                          height: 48,
                          text: 'Continue',
                          onPressed: _acceptTerms
                              ? () {
                                  setState(() => _showBanner = true);
                                  Future.delayed(Duration(seconds: 3), () {
                                    if (mounted)
                                      setState(() => _showBanner = false);
                                  });
                                }
                              : null,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                        ),
                        SizedBox(height: 12),
                        Ux4gButton(
                          height: 48,
                          text: 'Save as Draft',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor: primaryColor,
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
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral600
                                : Ux4gPalette.neutral400,
                          ),
                        ),
                        SizedBox(height: 6),
                        Image.asset(_digitalIndiaLogoPath, height: 24),
                      ],
                    ),
                  ),
                ],
              ),
              if (_showBanner)
                Positioned(
                  top: 74,
                  left: 16,
                  right: 16,
                  child: Ux4gStatusBanner(
                    height: 44,
                    variant: Ux4gBannerVariant.successLight,
                    title: '',
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GovernmentFormCardMockup extends StatefulWidget {
  _GovernmentFormCardMockup({super.key});

  @override
  State<_GovernmentFormCardMockup> createState() =>
      _GovernmentFormCardMockupState();
}

class _GovernmentFormCardMockupState extends State<_GovernmentFormCardMockup> {
  bool _acceptTerms = false;
  bool _showBanner = false;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '';
  String _emailAddress = '';
  String _aadhaarNumber = '';
  String? _selectedState;
  String? _maritalStatus;
  String _reason = '';
  double _income = 0;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF432CBB);

    return _PhoneFrame(
      child: Scaffold(
        backgroundColor: _cardBg(context),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gPalette.neutral900
                        : Ux4gPalette.neutral0,
                    child: Column(
                      children: [
                        Ux4gAppHeader(
                          variant: Ux4gAppHeaderVariant.light,
                          title: '',
                          leadingWidgets: [
                            SvgPicture.asset(
                              _nationalEmblemLogoPath,
                              height: 40,
                            ),
                            SizedBox(
                              height: 32,
                              child: Ux4gDivider(
                                orientation: Ux4gDividerOrientation.vertical,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gPalette.neutral700
                                    : Ux4gPalette.neutral300,
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
                        ),
                        Divider(
                          height: 1,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gPalette.neutral800
                              : Ux4gPalette.neutral200,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Ux4gButton(
                              text: 'Back',
                              variant: Ux4gButtonVariant.ghost,
                              onPressed: () {},
                              leadingIcon: Icons.arrow_back,
                              contentColor:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.primary300
                                  : Ux4gPalette.primary900,
                            ),
                          ),
                        ),
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
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gPalette.neutral900
                                  : Ux4gPalette.neutral0,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  onValueChange: (v) =>
                                      setState(() => _fullName = v),
                                  size: Ux4gInputFieldSize.medium,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gPalette.neutral50
                                        : Ux4gPalette.neutral900,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      'From Aadhaar · Update via UIDAI',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Ux4gPalette.primary300
                                            : Ux4gPalette.primary600,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.open_in_new,
                                      size: 12,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Ux4gPalette.primary300
                                          : Ux4gPalette.primary600,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
                                Ux4gInputField(
                                  label: 'Mobile number',
                                  value: _mobileNumber,
                                  onValueChange: (v) =>
                                      setState(() => _mobileNumber = v),
                                  size: Ux4gInputFieldSize.medium,
                                ),
                                SizedBox(height: 24),
                                Ux4gSelectionDropdown(
                                  label: 'State of residence',
                                  options: [
                                    Ux4gDropdownOption(
                                      id: 'dl',
                                      label: 'Delhi',
                                    ),
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
                                Ux4gSlider(
                                  label: 'Annual Income (Lakh ₹)',
                                  isRequired: true,
                                  rightLabelWidget: Text(
                                    '₹${_income.toInt()}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? Ux4gPalette.neutral50
                                          : Ux4gPalette.neutral900,
                                    ),
                                  ),
                                  value: _income,
                                  onValueChange: (val) =>
                                      setState(() => _income = val),
                                  min: 0,
                                  max: 10,
                                  steps: 9,
                                  showMarksAndValues: true,
                                  valueFormatter: (val) => val == 10 ? '10+' : val.toInt().toString(),
                                ),
                                SizedBox(height: 32),
                                Ux4gCheckbox(
                                  label: 'Accept terms and conditions',
                                  isRequired: true,
                                  value: _acceptTerms,
                                  onChanged: (val) => setState(
                                    () => _acceptTerms = val ?? false,
                                  ),
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      children: [
                        Ux4gButton(
                          height: 48,
                          text: 'Continue',
                          onPressed: _acceptTerms
                              ? () {
                                  setState(() => _showBanner = true);
                                  Future.delayed(Duration(seconds: 3), () {
                                    if (mounted)
                                      setState(() => _showBanner = false);
                                  });
                                }
                              : null,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                        ),
                        SizedBox(height: 12),
                        Ux4gButton(
                          height: 48,
                          text: 'Save as Draft',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.ghost,
                          size: Ux4gButtonSize.large,
                          width: double.infinity,
                          contentColor: primaryColor,
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
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gPalette.neutral600
                                : Ux4gPalette.neutral400,
                          ),
                        ),
                        SizedBox(height: 6),
                        Image.asset(_digitalIndiaLogoPath, height: 24),
                      ],
                    ),
                  ),
                ],
              ),
              if (_showBanner)
                Positioned(
                  top: 74,
                  left: 16,
                  right: 16,
                  child: Ux4gStatusBanner(
                    height: 44,
                    variant: Ux4gBannerVariant.successLight,
                    title: '',
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
