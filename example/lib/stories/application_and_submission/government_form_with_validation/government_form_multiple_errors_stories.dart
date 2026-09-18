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

final governmentFormWithMultipleErrorsComponent = WidgetbookComponent(
  name: 'Government form with multiple errors',
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
            ? _governmentFormMultipleErrorsCardCode
            : _governmentFormMultipleErrorsDefaultCode;

        return ComponentDocs(
          mobileMockup: true,
          name: 'Government form with multiple errors',
          description:
              'A comprehensive government form pattern showing multiple field-level validation errors, a global error summary banner, and all form field types.',
          code: code,
          center: true,
          child: isCardStyle
              ? _GovernmentFormMultipleErrorsCardMockup()
              : _GovernmentFormMultipleErrorsMockup(),
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

const String _governmentFormMultipleErrorsDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GovernmentFormMultipleErrorsScreen extends StatefulWidget {
  GovernmentFormMultipleErrorsScreen({super.key});

  @override
  State<GovernmentFormMultipleErrorsScreen> createState() =>
      GovernmentFormMultipleErrorsScreenState();
}

class GovernmentFormMultipleErrorsScreenState
    extends State<GovernmentFormMultipleErrorsScreen> {
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '98765';
  String _emailAddress = 'ramesh@example';
  String? _maritalStatus = 'Married';
  String _reason = '';
  String _aadhaarNumber = '1234';
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
              Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              Ux4gStatusBanner(
                height: 44,
                variant: Ux4gBannerVariant.successLight,
                title: '',
                margin: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
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
                          Ux4gStepItem(
                            title: 'Submit',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

                      Ux4gStatusBanner(
                        width: double.infinity,
                        margin: EdgeInsets.zero,
                        variant: Ux4gBannerVariant.errorLight,
                        title:
                            '3 fields need your attention. Fix them to continue.',
                        leadingIcon: const Icon(Icons.error, color: Color(0xFFD92D20), size: 18),
                        backgroundColor: const Color(0xFFFFF8F8),
                        borderColor: const Color(0xFFFFDADC),
                        titleStyle: TextStyle(
                          color: Color(0xFF8A1A16),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitleWidget: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Jump to first error',
                            style: TextStyle(
                              color: Color(0xFF8A1A16),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),

                      Ux4gInputField(
                        label: 'Full name',
                        value: _fullName,
                        enabled: false,
                        placeholder: 'Enter your full name',
                        onValueChange: (val) => setState(() => _fullName = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
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
                        placeholder: 'Enter mobile number',
                        onValueChange: (val) =>
                            setState(() => _mobileNumber = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Mobile must be 10 digits.',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),

                      Ux4gInputField(
                        label: 'Email address',
                        value: _emailAddress,
                        placeholder: 'Enter email address',
                        onValueChange: (val) =>
                            setState(() => _emailAddress = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Enter a valid email.',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),

                      Ux4gInputField(
                        label: 'Aadhaar number',
                        value: _aadhaarNumber,
                        placeholder: 'Enter Aadhaar number',
                        onValueChange: (val) =>
                            setState(() => _aadhaarNumber = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Aadhaar must be 12 digits.',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
                        ),
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

                      Text(
                        'Your marital status',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral700,
                        ),
                      ),
                      SizedBox(height: 8),
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
                      SizedBox(height: 24),

                      Ux4gTextArea(
                        label: 'Brief reason (optional)',
                        value: _reason,
                        onValueChange: (v) => setState(() => _reason = v),
                        placeholder: 'Placeholder',
                      ),
                      SizedBox(height: 24),

                      Ux4gSlider(
                        label: 'Annual Income (Lakh ₹)',
                        isRequired: true,
                        rightLabelWidget: Text(
                          '₹3.2 Lakh',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
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

                      Text(
                        'Receive application status updates via SMS',
                        style: (Theme.of(context).extension<Ux4gTypography>()?.lXL_default ?? TextStyle(fontSize: 15, fontWeight: FontWeight.w600)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 16),

                      Ux4gCheckbox(
                        label: 'Accept terms and conditions',
                        isRequired: true,
                        value: _acceptTerms,
                        onChanged: (val) =>
                            setState(() => _acceptTerms = val ?? false),
                      ),
                      const SizedBox(height: 24),
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
                        text: 'Back',
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
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral600 : Ux4gColors.neutral400),
                    ),
                    SizedBox(width: 8),
                    Image.asset(_digitalIndiaLogoPath, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
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

const String _governmentFormMultipleErrorsCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';


""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _GovernmentFormMultipleErrorsMockup extends StatefulWidget {
  _GovernmentFormMultipleErrorsMockup({super.key});

  @override
  State<_GovernmentFormMultipleErrorsMockup> createState() =>
      _GovernmentFormMultipleErrorsMockupState();
}

class _GovernmentFormMultipleErrorsMockupState
    extends State<_GovernmentFormMultipleErrorsMockup> {
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '98765';
  String _emailAddress = 'ramesh@example';
  String? _maritalStatus = 'Married';
  String _reason = '';
  String _aadhaarNumber = '1234';
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
              Divider(height: 1, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200),
              Ux4gStatusBanner(
                height: 44,
                variant: Ux4gBannerVariant.successLight,
                title: '',
                margin: EdgeInsets.zero,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
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
                          Ux4gStepItem(
                            title: 'Submit',
                            titleStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

                      Ux4gStatusBanner(
                        width: double.infinity,
                        margin: EdgeInsets.zero,
                        variant: Ux4gBannerVariant.errorLight,
                        title:
                            '3 fields need your attention. Fix them to continue.',
                        leadingIcon: const Icon(Icons.error, color: Color(0xFFD92D20), size: 18),
                        backgroundColor: const Color(0xFFFFF8F8),
                        borderColor: const Color(0xFFFFDADC),
                        titleStyle: TextStyle(
                          color: Color(0xFF8A1A16),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitleWidget: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Jump to first error',
                            style: TextStyle(
                              color: Color(0xFF8A1A16),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),

                      Ux4gInputField(
                        label: 'Full name',
                        value: _fullName,
                        enabled: false,
                        placeholder: 'Enter your full name',
                        onValueChange: (val) => setState(() => _fullName = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
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
                        placeholder: 'Enter mobile number',
                        onValueChange: (val) =>
                            setState(() => _mobileNumber = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Mobile must be 10 digits.',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),

                      Ux4gInputField(
                        label: 'Email address',
                        value: _emailAddress,
                        placeholder: 'Enter email address',
                        onValueChange: (val) =>
                            setState(() => _emailAddress = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Enter a valid email.',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 24),

                      Ux4gInputField(
                        label: 'Aadhaar number',
                        value: _aadhaarNumber,
                        placeholder: 'Enter Aadhaar number',
                        onValueChange: (val) =>
                            setState(() => _aadhaarNumber = val),
                        labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                        status: Ux4gInputFieldStatus.error,
                        caption: 'Aadhaar must be 12 digits.',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                          fontSize: 14,
                        ),
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

                      Text(
                        'Your marital status',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral700,
                        ),
                      ),
                      SizedBox(height: 8),
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
                      SizedBox(height: 24),

                      Ux4gTextArea(
                        label: 'Brief reason (optional)',
                        value: _reason,
                        onValueChange: (v) => setState(() => _reason = v),
                        placeholder: 'Placeholder',
                      ),
                      SizedBox(height: 24),

                      Ux4gSlider(
                        label: 'Annual Income (Lakh ₹)',
                        isRequired: true,
                        rightLabelWidget: Text(
                          '₹3.2 Lakh',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
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

                      Text(
                        'Receive application status updates via SMS',
                        style: (Theme.of(context).extension<Ux4gTypography>()?.lXL_default ?? TextStyle(fontSize: 15, fontWeight: FontWeight.w600)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                        ),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral600 : Ux4gColors.neutral400),
                    ),
                    SizedBox(width: 8),
                    Image.asset(_digitalIndiaLogoPath, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
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

class _GovernmentFormMultipleErrorsCardMockup extends StatefulWidget {
  _GovernmentFormMultipleErrorsCardMockup({super.key});

  @override
  State<_GovernmentFormMultipleErrorsCardMockup> createState() =>
      _GovernmentFormMultipleErrorsCardMockupState();
}

class _GovernmentFormMultipleErrorsCardMockupState
    extends State<_GovernmentFormMultipleErrorsCardMockup> {
  bool _acceptTerms = true;
  String _fullName = 'Ramesh Kumar';
  String _mobileNumber = '98765';
  String _emailAddress = 'ramesh@example';
  String? _maritalStatus = 'Married';
  String _reason = '';
  String _aadhaarNumber = '1234';
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
                            // Saved Success Banner
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

                            // Stepper
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
                                Ux4gStepItem(
                                  title: 'Submit',
                                  titleStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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

                            // Global Error Banner
                            Ux4gStatusBanner(
                              width: double.infinity,
                              margin: EdgeInsets.zero,
                              variant: Ux4gBannerVariant.errorLight,
                              title:
                                  '3 fields need your attention. Fix them to continue.',
                              leadingIcon: const Icon(Icons.error, color: Color(0xFFD92D20), size: 18),
                              backgroundColor: const Color(0xFFFFF8F8),
                              borderColor: const Color(0xFFFFDADC),
                              titleStyle: TextStyle(
                                color: Color(0xFF8A1A16),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleWidget: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Jump to first error',
                                  style: TextStyle(
                                    color: Color(0xFF8A1A16),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 32),

                            Ux4gInputField(
                              label: 'Full name',
                              value: _fullName,
                        enabled: false,
                              placeholder: 'Enter your full name',
                              onValueChange: (val) =>
                                  setState(() => _fullName = val),
                              labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                                fontSize: 14,
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
                              placeholder: 'Enter mobile number',
                              onValueChange: (val) =>
                                  setState(() => _mobileNumber = val),
                              labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                              status: Ux4gInputFieldStatus.error,
                              caption: 'Mobile must be 10 digits.',
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 24),
                            Ux4gInputField(
                              label: 'Email address',
                              value: _emailAddress,
                              placeholder: 'Enter email address',
                              onValueChange: (val) =>
                                  setState(() => _emailAddress = val),
                              labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                              status: Ux4gInputFieldStatus.error,
                              caption: 'Enter a valid email.',
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 24),
                            Ux4gInputField(
                              label: 'Aadhaar number',
                              value: _aadhaarNumber,
                              placeholder: 'Enter Aadhaar number',
                              onValueChange: (val) =>
                                  setState(() => _aadhaarNumber = val),
                              labelStyle: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                              status: Ux4gInputFieldStatus.error,
                              caption: 'Aadhaar must be 12 digits.',
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                                fontSize: 14,
                              ),
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

                            Text(
                              'Your marital status',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral300 : Ux4gColors.neutral700,
                              ),
                            ),
                            SizedBox(height: 8),
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
                              label: 'Brief reason (optional)',
                              value: _reason,
                              onValueChange: (v) => setState(() => _reason = v),
                              placeholder: 'Placeholder',
                            ),
                            SizedBox(height: 24),

                            Ux4gSlider(
                              label: 'Annual Income (Lakh ₹)',
                              isRequired: true,
                              rightLabelWidget: Text(
                                '₹3.2 Lakh',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
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

                            Ux4gCheckbox(
                              label: 'Accept terms and conditions',
                              isRequired: true,
                              value: _acceptTerms,
                              onChanged: (val) =>
                                  setState(() => _acceptTerms = val ?? false),
                            ),
                            SizedBox(height: 24),
                            Ux4gButton(
                              height: 48,
                              text: 'Continue',
                              onPressed: () {},
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
                              contentColor: primaryColor,
                              borderColor: primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral600 : Ux4gColors.neutral400),
                    ),
                    SizedBox(width: 8),
                    Image.asset(_digitalIndiaLogoPath, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
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

