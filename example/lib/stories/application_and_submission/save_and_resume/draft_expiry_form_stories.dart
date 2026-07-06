import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _surface(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral950 : Ux4gPalette.neutral0;
Color _title(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
Color _body(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral300 : Ux4gPalette.neutral700;
Color _border(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;
Color _primary(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
Color _cardBackground(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.primary900 : Ux4gPalette.primary100;

final draftExpiryFormComponent = WidgetbookComponent(
  name: 'Draft Expiry Form',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.object.dropdown<String>(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        return ComponentDocs(
          mobileMockup: true,
          name: 'Draft Expiry Form',
          description:
              'A save-and-resume form showing draft expiry, journey progress, personal details, and save actions.',
          code: variant == 'Card style'
              ? _draftExpiryFormCardCode
              : _draftExpiryFormCode,
          center: true,
          child: variant == 'Card style'
              ? const _DraftExpiryFormCardMockup()
              : const _DraftExpiryFormMockup(),
        );
      },
    ),
  ],
);

const _draftExpiryFormCode = r'''import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class DraftExpiryFormScreen extends StatelessWidget {
  const DraftExpiryFormScreen({super.key});

  bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  Color _surface(BuildContext context) =>
      _isDark(context) ? Ux4gPalette.neutral950 : Ux4gPalette.neutral0;

  Color _title(BuildContext context) =>
      _isDark(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;

  Color _body(BuildContext context) =>
      _isDark(context) ? Ux4gPalette.neutral300 : Ux4gPalette.neutral700;

  Color _border(BuildContext context) =>
      _isDark(context) ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;

  Color _primary(BuildContext context) =>
      _isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600;

  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);
    final primary = _primary(context);

    return Scaffold(
      backgroundColor: _surface(context),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _surface(context),
                border: Border(bottom: BorderSide(color: _border(context))),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                height: 62,
                horizontalPadding: 14,
                leadingSpacing: 8,
                elevation: 0,
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem,
                    height: 34,
                    colorFilter: dark
                        ? const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          )
                        : null,
                  ),
                  SizedBox(
                    height: 36,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: _border(context),
                    ),
                  ),
                  SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      dark
                          ? Ux4gPalette.primary300
                          : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 18, 14, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ux4gStatusBanner(
                      variant: Ux4gBannerVariant.warningLight,
                      title: 'Your draft expires in 5 days',
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      backgroundColor: dark
                          ? Ux4gPalette.orange950
                          : Ux4gPalette.orange50,
                      borderColor: Colors.transparent,
                      titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _title(context),
                      ),
                      leadingIcon: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: dark
                              ? Ux4gPalette.orange900
                              : Ux4gPalette.orange100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.inventory_2_outlined,
                          size: 16,
                          color: dark
                              ? Ux4gPalette.orange300
                              : Ux4gPalette.orange700,
                        ),
                      ),
                      trailingIcon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: dark
                              ? Ux4gPalette.orange900
                              : Ux4gPalette.orange100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '16 Apr',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: dark
                                ? Ux4gPalette.orange300
                                : Ux4gPalette.orange800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 54,
                      child: Ux4gStatusPipeline(
                        orientation: Ux4gPipelineOrientation.horizontal,
                        size: Ux4gPipelineSize.s,
                        currentStep: 1,
                        completedColor: primary,
                        completedLineColor: primary,
                        steps: const [
                          Ux4gPipelineStep(label: 'Eligibility'),
                          Ux4gPipelineStep(label: 'Personal'),
                          Ux4gPipelineStep(),
                          Ux4gPipelineStep(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Section 2: Personal\ninformation',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.15,
                        fontWeight: FontWeight.w700,
                        color: _title(context),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Provide the personal details below. We will use\n'
                      'this to verify your application.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: _body(context),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _LabeledInput(
                      label: 'Full name',
                      value: 'Ramesh Kumar',
                      readOnly: true,
                      backgroundColor: dark
                          ? Ux4gPalette.neutral900
                          : Ux4gPalette.neutral0,
                      borderColor: _border(context),
                      textColor: _title(context),
                      labelColor: _body(context),
                    ),
                    const SizedBox(height: 12),
                    _LabeledInput(
                      label: 'Date of birth',
                      backgroundColor: dark
                          ? Ux4gPalette.neutral900
                          : Ux4gPalette.neutral0,
                      borderColor: _border(context),
                      textColor: _title(context),
                      labelColor: _body(context),
                    ),
                    const SizedBox(height: 12),
                    _LabeledInput(
                      label: 'Mobile number',
                      type: Ux4gInputFieldType.number,
                      backgroundColor: dark
                          ? Ux4gPalette.neutral900
                          : Ux4gPalette.neutral0,
                      borderColor: _border(context),
                      textColor: _title(context),
                      labelColor: _body(context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
              child: Column(
                children: [
                  Ux4gButton(
                    text: 'Continue',
                    onPressed: () {},
                    width: double.infinity,
                    height: 40,
                    borderRadius: 6,
                  ),
                  const SizedBox(height: 7),
                  Ux4gButton(
                    text: 'Save draft',
                    onPressed: () {},
                    width: double.infinity,
                    height: 40,
                    borderRadius: 6,
                    variant: Ux4gButtonVariant.outline,
                    contentColor: primary,
                    borderColor: primary,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 7),
              child: Column(
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(fontSize: 10, color: _body(context)),
                  ),
                  const SizedBox(height: 4),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,
                    height: 22,
                    color: dark ? Colors.white : null,
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

class _LabeledInput extends StatelessWidget {
  const _LabeledInput({
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.labelColor,
    this.value = '',
    this.readOnly = false,
    this.type = Ux4gInputFieldType.text,
  });

  final String label;
  final String value;
  final bool readOnly;
  final Ux4gInputFieldType type;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: labelColor)),
        const SizedBox(height: 4),
        Ux4gInputField(
          value: value,
          onValueChange: (_) {},
          readOnly: readOnly,
          type: type,
          size: Ux4gInputFieldSize.medium,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          style: TextStyle(fontSize: 13, color: textColor),
        ),
      ],
    );
  }
}
''';

// The card variant uses the same design-system components and form structure;
// its Widgetbook preview demonstrates the alternate page composition.
const _draftExpiryFormCardCode = _draftExpiryFormCode;

class _DraftExpiryFormMockup extends StatelessWidget {
  const _DraftExpiryFormMockup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _surface(context),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _surface(context),
                border: Border(bottom: BorderSide(color: _border(context))),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                height: 62,
                horizontalPadding: 14,
                leadingSpacing: 8,
                elevation: 0,
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem,
                    height: 34,
                    colorFilter: _isDark(context)
                        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                        : null,
                  ),
                  SizedBox(
                    height: 36,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: _border(context),
                    ),
                  ),
                  SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      _isDark(context)
                          ? Ux4gPalette.primary300
                          : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 18, 14, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DraftExpiryBanner(),
                    SizedBox(height: 15),
                    _JourneyProgress(),
                    SizedBox(height: 12),
                    Text(
                      'Section 2: Personal\ninformation',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.15,
                        fontWeight: FontWeight.w700,
                        color: _title(context),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Provide the personal details below. We will use\nthis to verify your application.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: _body(context),
                      ),
                    ),
                    SizedBox(height: 15),
                    _FormField(
                      label: 'Full name',
                      value: 'Ramesh Kumar',
                      readOnly: true,
                    ),
                    SizedBox(height: 12),
                    _FormField(label: 'Date of birth'),
                    SizedBox(height: 12),
                    _FormField(
                      label: 'Mobile number',
                      type: Ux4gInputFieldType.number,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
              child: Column(
                children: [
                  Ux4gButton(
                    text: 'Continue',
                    onPressed: () {},
                    width: double.infinity,
                    height: 40,
                    borderRadius: 6,
                  ),
                  SizedBox(height: 7),
                  Ux4gButton(
                    text: 'Save draft',
                    onPressed: () {},
                    width: double.infinity,
                    height: 40,
                    borderRadius: 6,
                    variant: Ux4gButtonVariant.outline,
                    contentColor: _primary(context),
                    borderColor: _primary(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 7),
              child: Column(
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(fontSize: 10, color: _body(context)),
                  ),
                  SizedBox(height: 4),
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

class _DraftExpiryFormCardMockup extends StatelessWidget {
  const _DraftExpiryFormCardMockup();

  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);

    return Scaffold(
      backgroundColor: _cardBackground(context),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _surface(context),
                border: Border(bottom: BorderSide(color: _border(context))),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                height: 62,
                horizontalPadding: 14,
                leadingSpacing: 8,
                elevation: 0,
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem,
                    height: 34,
                    colorFilter: dark
                        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                        : null,
                  ),
                  SizedBox(
                    height: 36,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: _border(context),
                    ),
                  ),
                  SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 18, 14, 12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
                  decoration: BoxDecoration(
                    color: dark ? Ux4gPalette.neutral900 : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: dark
                        ? Border.all(color: Ux4gPalette.neutral800)
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DraftExpiryBanner(),
                      const SizedBox(height: 15),
                      _JourneyProgress(),
                      const SizedBox(height: 12),
                      Text(
                        'Section 2: Personal\ninformation',
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.15,
                          fontWeight: FontWeight.w700,
                          color: _title(context),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Provide the personal details below. We will use\nthis to verify your application.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: _body(context),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const _FormField(
                        label: 'Full name',
                        value: 'Ramesh Kumar',
                        readOnly: true,
                      ),
                      const SizedBox(height: 12),
                      const _FormField(label: 'Date of birth'),
                      const SizedBox(height: 12),
                      const _FormField(
                        label: 'Mobile number',
                        type: Ux4gInputFieldType.number,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
              child: Column(
                children: [
                  Ux4gButton(
                    text: 'Continue',
                    onPressed: () {},
                    width: double.infinity,
                    height: 40,
                    borderRadius: 6,
                  ),
                  const SizedBox(height: 7),
                  Ux4gButton(
                    text: 'Save draft',
                    onPressed: () {},
                    width: double.infinity,
                    height: 40,
                    borderRadius: 6,
                    variant: Ux4gButtonVariant.outline,
                    contentColor: _primary(context),
                    borderColor: _primary(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 7),
              child: Column(
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(fontSize: 10, color: _body(context)),
                  ),
                  const SizedBox(height: 4),
                  Image.asset(
                    Ux4gIcons.digitalIndiaLogoPng,
                    height: 22,
                    color: dark ? Colors.white : null,
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

class _DraftExpiryBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);
    return Ux4gStatusBanner(
      variant: Ux4gBannerVariant.warningLight,
      title: 'Your draft expires in 5 days',
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      backgroundColor: dark ? Ux4gPalette.orange950 : Ux4gPalette.orange50,
      borderColor: Colors.transparent,
      titleStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: _title(context),
      ),
      leadingIcon: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: dark ? Ux4gPalette.orange900 : Ux4gPalette.orange100,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.inventory_2_outlined,
          size: 16,
          color: dark ? Ux4gPalette.orange300 : Ux4gPalette.orange700,
        ),
      ),
      trailingIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: dark ? Ux4gPalette.orange900 : Ux4gPalette.orange100,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '16 Apr',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: dark ? Ux4gPalette.orange300 : Ux4gPalette.orange800,
          ),
        ),
      ),
    );
  }
}

class _JourneyProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = _primary(context);
    final muted = _isDark(context)
        ? Ux4gPalette.neutral700
        : Ux4gPalette.neutral200;
    return Column(
      children: [
        Row(
          children: [
            _StepCircle(
              color: primary,
              child: const Icon(Icons.check, size: 11, color: Colors.white),
            ),
            _StepLine(color: primary),
            _StepCircle(
              color: primary,
              outlined: true,
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            _StepLine(color: muted),
            _StepCircle(
              color: muted,
              outlined: true,
              child: Text(
                '3',
                style: TextStyle(fontSize: 9, color: _body(context)),
              ),
            ),
            _StepLine(color: muted),
            _StepCircle(
              color: muted,
              outlined: true,
              child: Text(
                '4',
                style: TextStyle(fontSize: 9, color: _body(context)),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Text(
                'Eligibility',
                style: TextStyle(fontSize: 11, color: _body(context)),
              ),
            ),
            Expanded(
              child: Text(
                'Personal',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: _body(context)),
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

class _StepCircle extends StatelessWidget {
  const _StepCircle({
    required this.color,
    required this.child,
    this.outlined = false,
  });

  final Color color;
  final Widget child;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: outlined ? _surface(context) : color,
        shape: BoxShape.circle,
        border: outlined ? Border.all(color: color, width: 2) : null,
      ),
      child: child,
    );
  }
}

class _StepLine extends StatelessWidget {
  const _StepLine({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 3,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        color: color,
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.label,
    this.value = '',
    this.readOnly = false,
    this.type = Ux4gInputFieldType.text,
  });

  final String label;
  final String value;
  final bool readOnly;
  final Ux4gInputFieldType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: _body(context))),
        SizedBox(height: 4),
        Ux4gInputField(
          value: value,
          onValueChange: (_) {},
          readOnly: readOnly,
          type: type,
          size: Ux4gInputFieldSize.medium,
          backgroundColor: _isDark(context)
              ? Ux4gPalette.neutral900
              : Ux4gPalette.neutral0,
          borderColor: _border(context),
          style: TextStyle(fontSize: 13, color: _title(context)),
        ),
      ],
    );
  }
}
