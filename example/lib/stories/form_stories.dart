import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ── Input Field ──────────────────────────────────────────────────────────────

final inputFieldComponent = WidgetbookComponent(
  name: 'Input',
  isInitiallyExpanded: false,
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) => ComponentDocs(
        name: 'Input',
        description:
            'Input - Text Field allow users to enter, edit and submit information such as names, emails, passwords or search queries. They support user interaction by enabling data input in forms, searches and workflows, ensuring a smooth and efficient user experience.',
        showPreview: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'States',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Ux4gInputField(
              label: 'Default',
              placeholder: 'Enter text...',
              value: '',
              onValueChange: (_) {},
            ),
            const SizedBox(height: 16),
            Ux4gInputField(
              label: 'Error state',
              placeholder: 'Enter text...',
              value: 'Invalid input',
              onValueChange: (_) {},
              status: Ux4gInputFieldStatus.error,
              caption: 'Error message here',
            ),
            const SizedBox(height: 16),
            Ux4gInputField(
              label: 'Success state',
              placeholder: 'Enter text...',
              value: 'Valid input',
              onValueChange: (_) {},
              status: Ux4gInputFieldStatus.success,
              caption: 'Looks good!',
            ),
            const SizedBox(height: 16),
            Ux4gInputField(
              label: 'Disabled',
              placeholder: 'Enter text...',
              value: '',
              onValueChange: (_) {},
              enabled: false,
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        String value = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            final labelText = context.knobs.string(
              label: 'Label',
              initialValue: 'Email',
            );
            final placeholderText = context.knobs.string(
              label: 'Placeholder',
              initialValue: 'Enter your email',
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gInputFieldStatus.values,
              initialOption: Ux4gInputFieldStatus.defaultStatus,
              labelBuilder: (v) => v.name,
            );
            final size = context.knobs.list(
              label: 'Size',
              options: Ux4gInputFieldSize.values,
              initialOption: Ux4gInputFieldSize.medium,
              labelBuilder: (v) => v.name,
            );
            final enabled = context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            );
            final isRequired = context.knobs.boolean(
              label: 'Required',
              initialValue: false,
            );
            final captionText = context.knobs.stringOrNull(
              label: 'Caption Text',
              initialValue: 'Helper text description',
            );

            final dynamicCode =
                '''import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class Ux4gInputFieldDefaultExample extends StatefulWidget {
  const Ux4gInputFieldDefaultExample({super.key});

  @override
  State<Ux4gInputFieldDefaultExample> createState() => _Ux4gInputFieldDefaultExampleState();
}

class _Ux4gInputFieldDefaultExampleState extends State<Ux4gInputFieldDefaultExample> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Ux4gInputField(
      value: value,
      onValueChange: (v) => setState(() => value = v),
      label: '$labelText',
      placeholder: '$placeholderText',
      status: Ux4gInputFieldStatus.${status.name},
      size: Ux4gInputFieldSize.${size.name},
      enabled: $enabled,
      required: $isRequired,${captionText != null ? "\n      caption: '$captionText'," : ""}
    );
  }
}''';

            return ComponentDocs(
              name: 'InputField',
              description:
                  'Input - Text Field allow users to enter, edit and submit information such as names, emails, passwords or search queries. They support user interaction by enabling data input in forms, searches and workflows, ensuring a smooth and efficient user experience.',
              code: dynamicCode,
              props: const [
                PropRow(
                  name: 'value',
                  type: 'String',
                  description: 'Current text value.',
                  required: true,
                ),
                PropRow(
                  name: 'onValueChange',
                  type: 'ValueChanged<String>',
                  description: 'Called on text change.',
                  required: true,
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gInputFieldSize',
                  description: 'small / medium / large / xl.',
                  defaultValue: 'medium',
                ),
                PropRow(
                  name: 'type',
                  type: 'Ux4gInputFieldType',
                  description: 'text / password / number / email.',
                  defaultValue: 'text',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gInputFieldStatus',
                  description: 'defaultStatus / error / warning / success.',
                  defaultValue: 'defaultStatus',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label above the field.',
                ),
                PropRow(
                  name: 'required',
                  type: 'bool',
                  description: 'Shows asterisk on label.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'placeholder',
                  type: 'String?',
                  description: 'Hint text.',
                ),
                PropRow(
                  name: 'caption',
                  type: 'String?',
                  description: 'Helper text below field.',
                ),
                PropRow(
                  name: 'leadingIcon',
                  type: 'IconData?',
                  description: 'Icon on the left.',
                ),
                PropRow(
                  name: 'trailingIcon',
                  type: 'IconData?',
                  description: 'Icon on the right.',
                ),
                PropRow(
                  name: 'onTrailingIconPressed',
                  type: 'VoidCallback?',
                  description: 'Called when trailing icon is tapped.',
                ),
                PropRow(
                  name: 'prefixText',
                  type: 'String?',
                  description: 'Text before input.',
                ),
                PropRow(
                  name: 'postfixText',
                  type: 'String?',
                  description: 'Text after input.',
                ),
                PropRow(
                  name: 'trailingIconLabel',
                  type: 'IconData?',
                  description: 'Icon beside label.',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'readOnly',
                  type: 'bool',
                  description: 'Non-editable state.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'singleLine',
                  type: 'bool',
                  description: 'Whether to restrict to one line.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'maxLines',
                  type: 'int?',
                  description: 'Max lines if multi-line.',
                ),
                PropRow(
                  name: 'maxLength',
                  type: 'int?',
                  description: 'Max character count.',
                ),
                PropRow(
                  name: 'borderWidth',
                  type: 'double',
                  description: 'Border width of the input field.',
                  defaultValue: '1.0',
                ),
                PropRow(
                  name: 'disabledBorderWidth',
                  type: 'double',
                  description: 'Border width when disabled.',
                  defaultValue: '0.0',
                ),
                PropRow(
                  name: 'disabledBorderColor',
                  type: 'Color?',
                  description: 'Border color when disabled.',
                ),
                PropRow(
                  name: 'inputFormatters',
                  type: 'List<TextInputFormatter>?',
                  description: 'Custom input filters.',
                ),
                PropRow(
                  name: 'textAlign',
                  type: 'TextAlign',
                  description: 'Text alignment.',
                  defaultValue: 'start',
                ),
                PropRow(
                  name: 'style',
                  type: 'TextStyle?',
                  description: 'Custom text style for the input value.',
                ),
                PropRow(
                  name: 'placeholderStyle',
                  type: 'TextStyle?',
                  description: 'Custom text style for placeholder text.',
                ),
                PropRow(
                  name: 'labelStyle',
                  type: 'TextStyle?',
                  description: 'Custom text style for the label.',
                ),
                PropRow(
                  name: 'captionStyle',
                  type: 'TextStyle?',
                  description: 'Custom text style for the caption.',
                ),
                PropRow(
                  name: 'backgroundColor',
                  type: 'Color?',
                  description: 'Custom background color override.',
                ),
                PropRow(
                  name: 'borderColor',
                  type: 'Color?',
                  description: 'Custom border color override.',
                ),
              ],
              child: SizedBox(
                width: 320,
                child: Ux4gInputField(
                  value: value,
                  onValueChange: (v) => setState(() => value = v),
                  label: context.knobs.string(
                    label: 'Label',
                    initialValue: 'Email',
                  ),
                  placeholder: context.knobs.string(
                    label: 'Placeholder',
                    initialValue: 'Enter your email',
                  ),
                  status: context.knobs.list(
                    label: 'Status',
                    options: Ux4gInputFieldStatus.values,
                    initialOption: Ux4gInputFieldStatus.defaultStatus,
                    labelBuilder: (v) => v.name,
                  ),
                  size: context.knobs.list(
                    label: 'Size',
                    options: Ux4gInputFieldSize.values,
                    initialOption: Ux4gInputFieldSize.medium,
                    labelBuilder: (v) => v.name,
                  ),
                  enabled: context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  ),
                  required: context.knobs.boolean(
                    label: 'Required',
                    initialValue: false,
                  ),
                  caption: context.knobs.stringOrNull(
                    label: 'Caption Text',
                    initialValue: 'Helper text description',
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'All statuses',
      builder: (context) => ComponentDocs(
        name: 'InputField — Statuses',
        description:
            'Visual status variations: default, error, warning, success, and disabled.',
        code: '''import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class Ux4gInputFieldStatusesExample extends StatefulWidget {
  const Ux4gInputFieldStatusesExample({super.key});

  @override
  State<Ux4gInputFieldStatusesExample> createState() => _Ux4gInputFieldStatusesExampleState();
}

class _Ux4gInputFieldStatusesExampleState extends State<Ux4gInputFieldStatusesExample> {
  String errorValue = '';
  String defaultValue = '';
  String successValue = '';
  String warningValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gInputField(
          value: errorValue,
          onValueChange: (v) => setState(() => errorValue = v),
          label: 'Label',
          placeholder: 'Placeholder',
          status: Ux4gInputFieldStatus.error,
          caption: 'Error message',
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: defaultValue,
          onValueChange: (v) => setState(() => defaultValue = v),
          label: 'Label',
          placeholder: 'Placeholder',
          status: Ux4gInputFieldStatus.defaultStatus,
          caption: 'Description',
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: successValue,
          onValueChange: (v) => setState(() => successValue = v),
          label: 'Label',
          placeholder: 'Placeholder',
          status: Ux4gInputFieldStatus.success,
          caption: 'Success message',
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: warningValue,
          onValueChange: (v) => setState(() => warningValue = v),
          label: 'Label',
          placeholder: 'Placeholder',
          status: Ux4gInputFieldStatus.warning,
          caption: 'Warning message',
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: 'Placeholder',
          onValueChange: (_) {},
          label: 'Label',
          status: Ux4gInputFieldStatus.defaultStatus,
          caption: 'Description',
          enabled: false,
        ),
      ],
    );
  }
}''',
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Ux4gInputField(
                value: '',
                onValueChange: (_) {},
                label: 'Label',
                placeholder: 'Placeholder',
                status: Ux4gInputFieldStatus.error,
                caption: 'Error message',
              ),
              const SizedBox(height: 16),
              Ux4gInputField(
                value: '',
                onValueChange: (_) {},
                label: 'Label',
                placeholder: 'Placeholder',
                status: Ux4gInputFieldStatus.defaultStatus,
                caption: 'Description',
              ),
              const SizedBox(height: 16),
              Ux4gInputField(
                value: '',
                onValueChange: (_) {},
                label: 'Label',
                placeholder: 'Placeholder',
                status: Ux4gInputFieldStatus.success,
                caption: 'Success message',
              ),
              const SizedBox(height: 16),
              Ux4gInputField(
                value: '',
                onValueChange: (_) {},
                label: 'Label',
                placeholder: 'Placeholder',
                status: Ux4gInputFieldStatus.warning,
                caption: 'Warning message',
              ),
              const SizedBox(height: 16),
              Ux4gInputField(
                value: 'Placeholder',
                onValueChange: (_) {},
                label: 'Label',
                status: Ux4gInputFieldStatus.defaultStatus,
                caption: 'Description',
                enabled: false,
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Password field',
      builder: (context) {
        String value = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'InputField — Password',
              description:
                  'Password type hides input and shows a visibility-toggle icon.',
              code: '''import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class Ux4gInputFieldPasswordExample extends StatefulWidget {
  const Ux4gInputFieldPasswordExample({super.key});

  @override
  State<Ux4gInputFieldPasswordExample> createState() => _Ux4gInputFieldPasswordExampleState();
}

class _Ux4gInputFieldPasswordExampleState extends State<Ux4gInputFieldPasswordExample> {
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Ux4gInputField(
      value: password,
      onValueChange: (v) => setState(() => password = v),
      label: 'Password',
      placeholder: 'Enter your password',
      type: Ux4gInputFieldType.password,
    );
  }
}''',
              child: SizedBox(
                width: 320,
                child: Ux4gInputField(
                  value: value,
                  onValueChange: (v) => setState(() => value = v),
                  label: 'Password',
                  placeholder: 'Enter your password',
                  type: Ux4gInputFieldType.password,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'With icons',
      builder: (context) {
        String value = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'InputField — Icons',
              description:
                  'Leading and trailing icon slots inside the input border.',
              code: '''import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class Ux4gInputFieldIconsExample extends StatefulWidget {
  const Ux4gInputFieldIconsExample({super.key});

  @override
  State<Ux4gInputFieldIconsExample> createState() => _Ux4gInputFieldIconsExampleState();
}

class _Ux4gInputFieldIconsExampleState extends State<Ux4gInputFieldIconsExample> {
  String leadingValue = '';
  String trailingValue = '';
  String bothValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gInputField(
          value: leadingValue,
          onValueChange: (v) => setState(() => leadingValue = v),
          label: 'Leading icon',
          placeholder: 'Search…',
          leadingIcon: Icons.search,
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: trailingValue,
          onValueChange: (v) => setState(() => trailingValue = v),
          label: 'Trailing icon',
          placeholder: 'Enter amount',
          trailingIcon: Icons.currency_rupee,
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: bothValue,
          onValueChange: (v) => setState(() => bothValue = v),
          label: 'Both icons',
          placeholder: 'Location',
          leadingIcon: Icons.location_on_outlined,
          trailingIcon: Icons.my_location,
        ),
      ],
    );
  }
}''',
              child: SizedBox(
                width: 320,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ux4gInputField(
                      value: value,
                      onValueChange: (v) => setState(() => value = v),
                      label: 'Leading icon',
                      placeholder: 'Search…',
                      leadingIcon: Icons.search,
                    ),
                    const SizedBox(height: 16),
                    Ux4gInputField(
                      value: value,
                      onValueChange: (v) => setState(() => value = v),
                      label: 'Trailing icon',
                      placeholder: 'Enter amount',
                      trailingIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(height: 16),
                    Ux4gInputField(
                      value: value,
                      onValueChange: (v) => setState(() => value = v),
                      label: 'Both icons',
                      placeholder: 'Location',
                      leadingIcon: Icons.location_on_outlined,
                      trailingIcon: Icons.my_location,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Prefix and Postfix',
      builder: (context) {
        String value = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'InputField — Prefix / Postfix',
              description:
                  'Text decorations prepended or appended inside the field border.',
              code: '''import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class Ux4gInputFieldPrefixPostfixExample extends StatefulWidget {
  const Ux4gInputFieldPrefixPostfixExample({super.key});

  @override
  State<Ux4gInputFieldPrefixPostfixExample> createState() => _Ux4gInputFieldPrefixPostfixExampleState();
}

class _Ux4gInputFieldPrefixPostfixExampleState extends State<Ux4gInputFieldPrefixPostfixExample> {
  String amountValue = '';
  String websiteValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gInputField(
          value: amountValue,
          onValueChange: (v) => setState(() => amountValue = v),
          label: 'Amount',
          placeholder: '0',
          prefixText: '₹',
          postfixText: '.00',
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: websiteValue,
          onValueChange: (v) => setState(() => websiteValue = v),
          label: 'Website',
          placeholder: 'example.com',
          prefixText: 'https://',
        ),
      ],
    );
  }
}''',
              child: SizedBox(
                width: 320,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ux4gInputField(
                      value: value,
                      onValueChange: (v) => setState(() => value = v),
                      label: 'Amount',
                      placeholder: '0',
                      prefixText: '₹',
                      postfixText: '.00',
                    ),
                    const SizedBox(height: 16),
                    Ux4gInputField(
                      value: value,
                      onValueChange: (v) => setState(() => value = v),
                      label: 'Website',
                      placeholder: 'example.com',
                      prefixText: 'https://',
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Read-only and Required',
      builder: (context) => ComponentDocs(
        name: 'InputField — Read-only and Required',
        description:
            'readOnly and enabled=false disable editing so user can only read the value; required shows an asterisk on the label.',
        code: '''import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class Ux4gInputFieldReadOnlyRequiredExample extends StatefulWidget {
  const Ux4gInputFieldReadOnlyRequiredExample({super.key});

  @override
  State<Ux4gInputFieldReadOnlyRequiredExample> createState() => _Ux4gInputFieldReadOnlyRequiredExampleState();
}

class _Ux4gInputFieldReadOnlyRequiredExampleState extends State<Ux4gInputFieldReadOnlyRequiredExample> {
  String fullNameValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ux4gInputField(
          value: 'GOV/2025/001',
          onValueChange: (_) {},
          label: 'Application ID',
          readOnly: true,
          enabled: false,
        ),
        const SizedBox(height: 16),
        Ux4gInputField(
          value: fullNameValue,
          onValueChange: (v) => setState(() => fullNameValue = v),
          label: 'Full Name',
          required: true,
          placeholder: 'Enter full name',
        ),
      ],
    );
  }
}''',
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Ux4gInputField(
                value: 'GOV/2025/001',
                onValueChange: (_) {},
                label: 'Application ID',
                readOnly: true,
                enabled: false,
              ),
              const SizedBox(height: 16),
              Ux4gInputField(
                value: '',
                onValueChange: (_) {},
                label: 'Full Name',
                required: true,
                placeholder: 'Enter full name',
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);

// ── Text Area ─────────────────────────────────────────────────────────────────

String _buildTextAreaCode({
  required String label,
  required String placeholder,
  required Ux4gTextAreaSize size,
  required Ux4gTextAreaMinHeight minHeight,
  required Ux4gInputFieldStatus status,
  required bool required,
  required bool enabled,
  required bool readOnly,
  required int maxLength,
  String? caption,
}) {
  final buf = StringBuffer();
  buf.writeln("// String value = '';  ← declare this in your widget state");
  buf.writeln("Ux4gTextArea(");
  buf.writeln("  value: value,");
  buf.writeln("  onValueChange: (v) => setState(() => value = v),");
  if (label.isNotEmpty) {
    buf.writeln("  label: '$label',");
  }
  if (placeholder.isNotEmpty) {
    buf.writeln("  placeholder: '$placeholder',");
  }
  if (size != Ux4gTextAreaSize.large) {
    buf.writeln("  size: Ux4gTextAreaSize.${size.name},");
  }
  if (minHeight != Ux4gTextAreaMinHeight.medium) {
    buf.writeln("  minHeight: Ux4gTextAreaMinHeight.${minHeight.name},");
  }
  if (status != Ux4gInputFieldStatus.defaultStatus) {
    buf.writeln("  status: Ux4gInputFieldStatus.${status.name},");
  }
  if (required) {
    buf.writeln("  required: true,");
  }
  if (!enabled) {
    buf.writeln("  enabled: false,");
  }
  if (readOnly) {
    buf.writeln("  readOnly: true,");
  }
  if (maxLength != 200) {
    buf.writeln("  maxLength: $maxLength,");
  }
  if (caption != null && caption.isNotEmpty) {
    buf.writeln("  caption: '$caption',");
  }
  buf.write(");");
  return buf.toString();
}

final textAreaComponent = WidgetbookComponent(
  name: 'TextArea',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        String value = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'TextArea',
              description:
                  'Textareas support longer-form text entry with counters, helper messaging, and validation feedback using the UX4G design system.',
              showPreview: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Example',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 400,
                      child: Ux4gTextArea(
                        label: 'Description',
                        placeholder: 'Write something...',
                        value: value,
                        onValueChange: (v) => setState(() => value = v),
                        size: Ux4gTextAreaSize.large,
                        minHeight: Ux4gTextAreaMinHeight.medium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Interactive',
      builder: (context) {
        String value = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            final label = context.knobs.string(
              label: 'Label',
              initialValue: 'Description',
            );
            final placeholder = context.knobs.string(
              label: 'Placeholder',
              initialValue: 'Write something...',
            );
            final size = context.knobs.list(
              label: 'Size',
              options: Ux4gTextAreaSize.values,
              initialOption: Ux4gTextAreaSize.large,
            );
            final minHeight = context.knobs.list(
              label: 'Min Height',
              options: Ux4gTextAreaMinHeight.values,
              initialOption: Ux4gTextAreaMinHeight.medium,
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gInputFieldStatus.values,
              initialOption: Ux4gInputFieldStatus.defaultStatus,
            );
            final required = context.knobs.boolean(
              label: 'Required',
              initialValue: false,
            );
            final enabled = context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            );
            final readOnly = context.knobs.boolean(
              label: 'Read Only',
              initialValue: false,
            );
            final maxLength = context.knobs.int.input(
              label: 'Max Length',
              initialValue: 200,
            );
            final caption = context.knobs.stringOrNull(
              label: 'Caption',
              initialValue: 'Helper text description',
            );

            final code = _buildTextAreaCode(
              label: label,
              placeholder: placeholder,
              size: size,
              minHeight: minHeight,
              status: status,
              required: required,
              enabled: enabled,
              readOnly: readOnly,
              maxLength: maxLength,
              caption: caption,
            );

            return ComponentDocs(
              name: 'TextArea',
              description:
                  'A multi-line text input with label and placeholder.',
              code: code,
              props: const [
                PropRow(
                  name: 'value',
                  type: 'String',
                  description: 'Current text value.',
                  required: true,
                ),
                PropRow(
                  name: 'onValueChange',
                  type: 'ValueChanged<String>',
                  description: 'Called on text change.',
                  required: true,
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gTextAreaSize',
                  description: 'small / large.',
                  defaultValue: 'large',
                ),
                PropRow(
                  name: 'minHeight',
                  type: 'Ux4gTextAreaMinHeight',
                  description: 'small / medium / large.',
                  defaultValue: 'medium',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gInputFieldStatus',
                  description: 'defaultStatus / error / warning / success.',
                  defaultValue: 'defaultStatus',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label above the field.',
                ),
                PropRow(
                  name: 'required',
                  type: 'bool',
                  description: 'Shows asterisk on label.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'placeholder',
                  type: 'String?',
                  description: 'Hint text.',
                ),
                PropRow(
                  name: 'caption',
                  type: 'String?',
                  description: 'Helper text below field.',
                ),
                PropRow(
                  name: 'showCaptionIcon',
                  type: 'bool',
                  description: 'Show status icon with caption.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'trailingIconLabel',
                  type: 'IconData?',
                  description: 'Icon beside label.',
                ),
                PropRow(
                  name: 'characterCountText',
                  type: 'String?',
                  description: 'Text for character counter.',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'readOnly',
                  type: 'bool',
                  description: 'Non-editable state.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'maxLength',
                  type: 'int?',
                  description: 'Max character count.',
                ),
                PropRow(
                  name: 'borderWidth',
                  type: 'double',
                  description: 'Border width of the input field.',
                  defaultValue: '1.0',
                ),
                PropRow(
                  name: 'disabledBorderWidth',
                  type: 'double',
                  description: 'Border width when disabled.',
                  defaultValue: '0.0',
                ),
                PropRow(
                  name: 'disabledBorderColor',
                  type: 'Color?',
                  description: 'Border color when disabled.',
                ),
              ],
              child: SizedBox(
                width: 320,
                child: Ux4gTextArea(
                  value: value,
                  onValueChange: (v) => setState(() => value = v),
                  label: label,
                  placeholder: placeholder,
                  size: size,
                  minHeight: minHeight,
                  status: status,
                  required: required,
                  enabled: enabled,
                  readOnly: readOnly,
                  maxLength: maxLength,
                  caption: caption,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Sizes and Heights',
      builder: (context) => ComponentDocs(
        name: 'TextArea — Sizes',
        description: 'Small and Large sizes with different minimum heights.',
        code: '''// String value = '';  ← declare this in your widget state
Ux4gTextArea(
  value: value,
  onValueChange: (v) => setState(() => value = v),
  label: 'Small size (80px min-height)',
  placeholder: 'Small area...',
  size: Ux4gTextAreaSize.small,
  minHeight: Ux4gTextAreaMinHeight.small,
);

// String value = '';  ← declare this in your widget state
Ux4gTextArea(
  value: value,
  onValueChange: (v) => setState(() => value = v),
  label: 'Large size (160px min-height)',
  placeholder: 'Large area...',
  size: Ux4gTextAreaSize.large,
  minHeight: Ux4gTextAreaMinHeight.large,
);''',
        child: SizedBox(
          width: 320,
          child: Column(
            children: [
              Ux4gTextArea(
                value: '',
                onValueChange: (_) {},
                label: 'Small size (80px min-height)',
                size: Ux4gTextAreaSize.small,
                minHeight: Ux4gTextAreaMinHeight.small,
                placeholder: 'Small area...',
              ),
              const SizedBox(height: 24),
              Ux4gTextArea(
                value: '',
                onValueChange: (_) {},
                label: 'Large size (160px min-height)',
                size: Ux4gTextAreaSize.large,
                minHeight: Ux4gTextAreaMinHeight.large,
                placeholder: 'Large area...',
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Statuses',
      builder: (context) => ComponentDocs(
        name: 'TextArea — Statuses',
        description: 'Visual feedback for different validation states.',
        code: '''// String value = '';  ← declare this in your widget state
Ux4gTextArea(
  value: value,
  onValueChange: (v) => setState(() => value = v),
  label: 'Success Status',
  status: Ux4gInputFieldStatus.success,
  caption: 'Information saved successfully',
);

// String value = '';  ← declare this in your widget state
Ux4gTextArea(
  value: value,
  onValueChange: (v) => setState(() => value = v),
  label: 'Warning Status',
  status: Ux4gInputFieldStatus.warning,
  caption: 'Please double check this entry',
);

// String value = '';  ← declare this in your widget state
Ux4gTextArea(
  value: value,
  onValueChange: (v) => setState(() => value = v),
  label: 'Error Status',
  status: Ux4gInputFieldStatus.error,
  caption: 'This field is required',
  required: true,
);''',
        child: SizedBox(
          width: 320,
          child: Column(
            children: [
              Ux4gTextArea(
                value: 'Valid input',
                onValueChange: (_) {},
                label: 'Success Status',
                status: Ux4gInputFieldStatus.success,
                caption: 'Information saved successfully',
              ),
              const SizedBox(height: 24),
              Ux4gTextArea(
                value: 'Incomplete data',
                onValueChange: (_) {},
                label: 'Warning Status',
                status: Ux4gInputFieldStatus.warning,
                caption: 'Please double check this entry',
              ),
              const SizedBox(height: 24),
              Ux4gTextArea(
                value: '',
                onValueChange: (_) {},
                label: 'Error Status',
                status: Ux4gInputFieldStatus.error,
                caption: 'This field is required',
                required: true,
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Metadata',
      builder: (context) => ComponentDocs(
        name: 'TextArea — Metadata',
        description: 'Showing character counts and helper icons.',
        code: '''// String value = '';  ← declare this in your widget state
Ux4gTextArea(
  value: value,
  onValueChange: (v) => setState(() => value = v),
  label: 'With Character Count',
  characterCountText: '12 / 500',
  maxLength: 500,
);

// String value = '';  ← declare this in your widget state
Ux4gTextArea(
  value: value,
  onValueChange: (v) => setState(() => value = v),
  label: 'With Info Icon',
  trailingIconLabel: Icons.help_outline,
  placeholder: 'Tap the icon for help',
);''',
        child: SizedBox(
          width: 320,
          child: Column(
            children: [
              Ux4gTextArea(
                value: 'Example text',
                onValueChange: (_) {},
                label: 'With Character Count',
                characterCountText: '12 / 500',
                maxLength: 500,
              ),
              const SizedBox(height: 24),
              Ux4gTextArea(
                value: '',
                onValueChange: (_) {},
                label: 'With Info Icon',
                trailingIconLabel: Icons.help_outline,
                placeholder: 'Tap the icon for help',
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);

// ── Search Field ──────────────────────────────────────────────────────────────

String _buildSearchFieldCode({
  required String placeholder,
  required Ux4gSearchFieldVariant variant,
  required Ux4gSearchFilterType filterType,
  required Ux4gSearchFieldSize size,
  required Ux4gSearchFieldStatus status,
  required bool showVoiceIcon,
  required bool showClearIcon,
  required bool enabled,
  required bool readOnly,
  required List<String> options,
  required double dropdownMinHeight,
  required double dropdownMaxHeight,
  String? label,
  String? caption,
}) {
  final buf = StringBuffer();
  buf.writeln("// String value = '';  ← declare this in your widget state");
  buf.writeln("Ux4gSearchField(");
  buf.writeln("  value: value,");
  buf.writeln("  onValueChange: (v) => setState(() => value = v),");
  if (dropdownMinHeight != 0.0) {
    buf.writeln("  dropdownMinHeight: $dropdownMinHeight,");
  }
  if (dropdownMaxHeight != 350.0) {
    buf.writeln("  dropdownMaxHeight: $dropdownMaxHeight,");
  }
  if (placeholder.isNotEmpty) {
    buf.writeln("  placeholder: '$placeholder',");
  }
  if (filterType != Ux4gSearchFilterType.contains) {
    buf.writeln("  filterType: Ux4gSearchFilterType.${filterType.name},");
  }
  if (variant != Ux4gSearchFieldVariant.basicSearch) {
    buf.writeln("  variant: Ux4gSearchFieldVariant.${variant.name},");
  }
  if (options.isNotEmpty) {
    buf.writeln("  options: const [");
    for (final opt in options) {
      buf.writeln("    '$opt',");
    }
    buf.writeln("  ],");
  }
  if (size != Ux4gSearchFieldSize.medium) {
    buf.writeln("  size: Ux4gSearchFieldSize.${size.name},");
  }
  if (status != Ux4gSearchFieldStatus.defaultStatus) {
    buf.writeln("  status: Ux4gSearchFieldStatus.${status.name},");
  }
  if (label != null && label.isNotEmpty) {
    buf.writeln("  label: '$label',");
  }
  if (caption != null && caption.isNotEmpty) {
    buf.writeln("  caption: '$caption',");
  }
  if (!showVoiceIcon) {
    buf.writeln("  showVoiceIcon: false,");
  }
  if (!showClearIcon) {
    buf.writeln("  showClearIcon: false,");
  }
  if (!enabled) {
    buf.writeln("  enabled: false,");
  }
  if (readOnly) {
    buf.writeln("  readOnly: true,");
  }
  buf.write(");");
  return buf.toString();
}

// ── Search Introduction ────────────────────────────────────────────────────────

final searchIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return const ComponentDocs(
          name: 'Search',
          description:
              'Search component allows users to quickly find relevant information within an application. It enhances navigation, improves content discoverability and supports text based, voice or filter-assisted search functionality.',
          showPreview: false,
          child: _SearchVisualShowcase(),
        );
      },
    ),
  ],
);
final searchFieldComponent = WidgetbookComponent(
  name: 'Search',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        String value = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            final placeholder = context.knobs.string(
              label: 'Placeholder',
              initialValue: 'Search...',
            );
            final variant = context.knobs.list(
              label: 'Variant',
              options: Ux4gSearchFieldVariant.values,
              initialOption: Ux4gSearchFieldVariant.basicSearch,
            );
            final filterType = context.knobs.list(
              label: 'Filter Type',
              options: Ux4gSearchFilterType.values,
              initialOption: Ux4gSearchFilterType.contains,
            );
            final options = context.knobs.list<List<String>>(
              label: 'Suggestions / Options',
              options: const [
                [
                  'Label for the list item',
                  'Label for the list item 2',
                  'Label for the list item 3',
                  'Label for the list item 4',
                ],
                [
                  'Apple',
                  'Apricot',
                  'Avocado',
                  'Banana',
                  'Blackberry',
                  'Blueberry',
                  'Cherry',
                  'Cranberry',
                  'Date',
                  'Dragonfruit',
                  'Elderberry',
                  'Fig',
                  'Grape',
                  'Guava',
                ],
                [
                  'Aadhaar Update',
                  'PAN Card Application',
                  'Passport Renewal',
                  'Voter ID Registration',
                  'Driving License',
                  'Ration Card',
                  'Birth Certificate',
                ],
                [],
              ],
              initialOption: const [
                'Label for the list item',
                'Label for the list item 2',
                'Label for the list item 3',
                'Label for the list item 4',
              ],
            );
            final size = context.knobs.list(
              label: 'Size',
              options: Ux4gSearchFieldSize.values,
              initialOption: Ux4gSearchFieldSize.medium,
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gSearchFieldStatus.values,
              initialOption: Ux4gSearchFieldStatus.defaultStatus,
            );
            final label = context.knobs.stringOrNull(
              label: 'Label',
              initialValue: null,
              defaultToNull: true,
            );
            final caption = context.knobs.stringOrNull(
              label: 'Caption',
              initialValue: null,
              defaultToNull: true,
            );
            final showVoiceIcon = context.knobs.boolean(
              label: 'Show Voice Icon',
              initialValue: true,
            );
            final showClearIcon = context.knobs.boolean(
              label: 'Show Clear Icon',
              initialValue: true,
            );
            final enabled = context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            );
            final readOnly = context.knobs.boolean(
              label: 'Read Only',
              initialValue: false,
            );
            final dropdownMinHeight = context.knobs.double.input(
              label: 'Dropdown Min Height',
              initialValue: 0.0,
            );
            final dropdownMaxHeight = context.knobs.double.input(
              label: 'Dropdown Max Height',
              initialValue: 350.0,
            );

            final code = _buildSearchFieldCode(
              placeholder: placeholder,
              variant: variant,
              filterType: filterType,
              options: options,
              size: size,
              status: status,
              label: label,
              caption: caption,
              showVoiceIcon: showVoiceIcon,
              showClearIcon: showClearIcon,
              enabled: enabled,
              readOnly: readOnly,
              dropdownMinHeight: dropdownMinHeight,
              dropdownMaxHeight: dropdownMaxHeight,
            );

            return ComponentDocs(
              name: 'SearchField',
              description:
                  'Search component allows users to quickly find relevant information within an application. It enhances navigation, improves content discoverability and supports text based, voice or filter-assisted search functionality.',
              code: code,
              props: const [
                PropRow(
                  name: 'value',
                  type: 'String',
                  description: 'Current text value.',
                  required: true,
                ),
                PropRow(
                  name: 'onValueChange',
                  type: 'ValueChanged<String>',
                  description: 'Called on text change.',
                  required: true,
                ),
                PropRow(
                  name: 'variant',
                  type: 'Ux4gSearchFieldVariant',
                  description: 'basicSearch / searchWithSubmit / autocomplete.',
                  defaultValue: 'basicSearch',
                ),
                PropRow(
                  name: 'filterType',
                  type: 'Ux4gSearchFilterType',
                  description: 'contains / startsWith / startsWithPerTerm.',
                  defaultValue: 'contains',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gSearchFieldSize',
                  description: 'small / medium / large / xl.',
                  defaultValue: 'medium',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gSearchFieldStatus',
                  description: 'defaultStatus / error / warning / success.',
                  defaultValue: 'defaultStatus',
                ),
                PropRow(
                  name: 'buttonStyle',
                  type: 'Ux4gSearchFieldButtonStyle',
                  description: 'filled / tonal.',
                  defaultValue: 'filled',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label above the field.',
                ),
                PropRow(
                  name: 'placeholder',
                  type: 'String?',
                  description: 'Hint text.',
                ),
                PropRow(
                  name: 'caption',
                  type: 'String?',
                  description: 'Helper text below field.',
                ),
                PropRow(
                  name: 'options',
                  type: 'List<String>',
                  description: 'Autocomplete suggestions.',
                  defaultValue: '[]',
                ),
                PropRow(
                  name: 'showVoiceIcon',
                  type: 'bool',
                  description: 'Show microphone icon.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'showClearIcon',
                  type: 'bool',
                  description: 'Show clear (X) icon.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'isLoading',
                  type: 'bool',
                  description: 'Show loading spinner.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'onVoiceClick',
                  type: 'VoidCallback?',
                  description: 'Called on voice icon tap.',
                ),
                PropRow(
                  name: 'onClearClick',
                  type: 'VoidCallback?',
                  description: 'Called on clear icon tap.',
                ),
                PropRow(
                  name: 'onSubmitClick',
                  type: 'ValueChanged<String>?',
                  description: 'Called when search button or enter is pressed.',
                ),
                PropRow(
                  name: 'onOptionSelected',
                  type: 'ValueChanged<String>?',
                  description: 'Called when an autocomplete option is chosen.',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'readOnly',
                  type: 'bool',
                  description: 'Non-editable state.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'dropdownMinHeight',
                  type: 'double',
                  description: 'Minimum height of autocomplete dropdown.',
                  defaultValue: '0.0',
                ),
                PropRow(
                  name: 'dropdownMaxHeight',
                  type: 'double',
                  description: 'Maximum height of autocomplete dropdown.',
                  defaultValue: '350.0',
                ),
              ],
              child: SizedBox(
                width: 320,
                child: Ux4gSearchField(
                  value: value,
                  onValueChange: (v) => setState(() => value = v),
                  placeholder: placeholder,
                  filterType: filterType,
                  variant: variant,
                  size: size,
                  status: status,
                  label: label,
                  caption: caption,
                  options: options,
                  showVoiceIcon: showVoiceIcon,
                  showClearIcon: showClearIcon,
                  enabled: enabled,
                  readOnly: readOnly,
                  dropdownMinHeight: dropdownMinHeight,
                  dropdownMaxHeight: dropdownMaxHeight,
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Checkbox ──────────────────────────────────────────────────────────────────

final checkboxComponent = WidgetbookComponent(
  name: 'Checkbox',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) => ComponentDocs(
        name: 'Checkbox',
        description:
            'Checkbox present a list of options where users can make multiple selections, a single selection or none at all. They support user interaction by allowing the selection of independent items ensuring that users can easily customize settings, filter search results and submit multi choice forms with clarity.',
        showPreview: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'States',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Ux4gCheckbox(value: true, onChanged: (_) {}, label: 'Checked'),
            const SizedBox(height: 8),
            Ux4gCheckbox(value: false, onChanged: (_) {}, label: 'Unchecked'),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: null,
              onChanged: (_) {},
              label: 'Indeterminate',
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: false,
              onChanged: (_) {},
              label: 'Error state',
              isRequired: true,
              hasError: true,
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Disabled',
              enabled: false,
            ),
            const SizedBox(height: 32),
            Text(
              'Sizes',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Small',
              size: Ux4gCheckboxSize.small,
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Medium',
              size: Ux4gCheckboxSize.medium,
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Large',
              size: Ux4gCheckboxSize.large,
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Interactive',
      builder: (context) {
        bool? value = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Checkbox',
              description:
                  'Checkbox present a list of options where users can make multiple selections, a single selection or none at all. They support user interaction by allowing the selection of independent items ensuring that users can easily customize settings, filter search results and submit multi choice forms with clarity.',
              code: '''class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Ux4gCheckbox(
      value: value,
      onChanged: (newValue) {
        setState(() => value = newValue);
      },
      label: 'Accept terms',
      description: '',
      size: Ux4gCheckboxSize.medium,
      isRequired: false,
      hasError: false,
      descriptionVariant: Ux4gCheckboxDescriptionVariant.helper,
      enabled: true,
    );
  }
}''',
              props: const [
                PropRow(
                  name: 'value',
                  type: 'bool?',
                  description:
                      'true (checked), false (unchecked), null (indeterminate).',
                  required: true,
                ),
                PropRow(
                  name: 'onChanged',
                  type: 'ValueChanged<bool?>',
                  description: 'Called on state change.',
                  required: true,
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Primary label text.',
                ),
                PropRow(
                  name: 'description',
                  type: 'String?',
                  description: 'Secondary helper text.',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gCheckboxSize',
                  description: 'small / medium / large.',
                  defaultValue: 'medium',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Shows asterisk on label.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'hasError',
                  type: 'bool',
                  description: 'Highlights border in error color.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'descriptionVariant',
                  type: 'Ux4gCheckboxDescriptionVariant',
                  description: 'helper / error / warning / success.',
                  defaultValue: 'helper',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
              ],
              child: Ux4gCheckbox(
                value: value,
                onChanged: (v) => setState(() => value = v),
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Accept terms',
                ),
                description: context.knobs.string(
                  label: 'Description',
                  initialValue: '',
                ),
                size: context.knobs.list(
                  label: 'Size',
                  options: Ux4gCheckboxSize.values,
                  initialOption: Ux4gCheckboxSize.medium,
                  labelBuilder: (v) => v.name,
                ),
                isRequired: context.knobs.boolean(
                  label: 'Required',
                  initialValue: false,
                ),
                hasError: context.knobs.boolean(
                  label: 'Has Error',
                  initialValue: false,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'All states',
      builder: (context) => ComponentDocs(
        name: 'Checkbox — All States',
        description:
            'Checked, unchecked, indeterminate, error, and disabled states.',
        code:
            'Ux4gCheckbox(value: true,  onChanged: (_) {}, label: \'Checked\');\n'
            'Ux4gCheckbox(value: false, onChanged: (_) {}, label: \'Unchecked\');\n'
            'Ux4gCheckbox(value: null,  onChanged: (_) {}, label: \'Indeterminate\');\n'
            'Ux4gCheckbox(value: false, onChanged: (_) {}, label: \'Error state\', isRequired: true, hasError: true);\n'
            'Ux4gCheckbox(value: true,  onChanged: (_) {}, label: \'Disabled\', enabled: false);',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ux4gCheckbox(value: true, onChanged: (_) {}, label: 'Checked'),
            const SizedBox(height: 8),
            Ux4gCheckbox(value: false, onChanged: (_) {}, label: 'Unchecked'),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: null,
              onChanged: (_) {},
              label: 'Indeterminate',
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: false,
              onChanged: (_) {},
              label: 'Error state',
              isRequired: true,
              hasError: true,
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Disabled (checked)',
              enabled: false,
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: false,
              onChanged: (_) {},
              label: 'Disabled (unchecked)',
              enabled: false,
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'All sizes',
      builder: (context) => ComponentDocs(
        name: 'Checkbox — Sizes',
        description: 'Small, medium, and large checkbox.',
        code:
            'Ux4gCheckbox(value: true, onChanged: (_) {}, label: \'Small\',  size: Ux4gCheckboxSize.small);',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Small',
              size: Ux4gCheckboxSize.small,
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Medium',
              size: Ux4gCheckboxSize.medium,
            ),
            const SizedBox(height: 8),
            Ux4gCheckbox(
              value: true,
              onChanged: (_) {},
              label: 'Large',
              size: Ux4gCheckboxSize.large,
            ),
          ],
        ),
      ),
    ),
  ],
);

// ── Switch ────────────────────────────────────────────────────────────────────

final toggleComponent = WidgetbookComponent(
  name: 'Toggle',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Toggle',
          description:
              'Toggle (Switch) component allows users to switch between two states typically representing on/off, enabled/disabled, or active/inactive settings. Switches provide a quick and intuitive way to modify system or feature preferences with a single action.',
          showPreview: false,
          child: _SwitchVisualShowcase(),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Interactive',
      builder: (context) {
        bool checked = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Toggle',
              description:
                  'Toggle (Switch) component allows users to switch between two states typically representing on/off, enabled/disabled, or active/inactive settings. Switchs provide a quick and intuitive way to modify system or feature preferences with a single action.',
              code: '''Ux4gSwitch(
  checked: checked,
  onCheckedChange: (v) => setState(() => checked = v),
  label: 'Enable notifications',
  size: Ux4gSwitchSize.m,
);''',
              props: const [
                PropRow(
                  name: 'checked',
                  type: 'bool',
                  description: 'Current toggle state.',
                  required: true,
                ),
                PropRow(
                  name: 'onCheckedChange',
                  type: 'ValueChanged<bool>?',
                  description: 'Called on toggle.',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Primary label text.',
                ),
                PropRow(
                  name: 'description',
                  type: 'String?',
                  description: 'Secondary helper text.',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gSwitchSize',
                  description: 's / m / l.',
                  defaultValue: 'm',
                ),
                PropRow(
                  name: 'labelPosition',
                  type: 'Ux4gSwitchLabelPosition',
                  description: 'left / right / bothSides / noLabel.',
                  defaultValue: 'right',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Shows a required asterisk.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'secondaryLabel',
                  type: 'String?',
                  description: 'Secondary label for bothSides.',
                ),
                PropRow(
                  name: 'isSecondaryRequired',
                  type: 'bool',
                  description: 'Asterisk for secondary label.',
                  defaultValue: 'false',
                ),
              ],
              child: Ux4gSwitch(
                checked: checked,
                onCheckedChange: (v) => setState(() => checked = v),
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Enable notifications',
                ),
                isRequired: context.knobs.boolean(
                  label: 'Required',
                  initialValue: false,
                ),
                size: context.knobs.list(
                  label: 'Size',
                  options: Ux4gSwitchSize.values,
                  initialOption: Ux4gSwitchSize.m,
                  labelBuilder: (v) => v.name,
                ),
                labelPosition: context.knobs.list(
                  label: 'Label Position',
                  options: Ux4gSwitchLabelPosition.values,
                  initialOption: Ux4gSwitchLabelPosition.right,
                  labelBuilder: (v) => v.name,
                ),
                secondaryLabel:
                    context.knobs
                        .string(label: 'Secondary Label', initialValue: '')
                        .isEmpty
                    ? null
                    : context.knobs.string(
                        label: 'Secondary Label',
                        initialValue: '',
                      ),
                isSecondaryRequired: context.knobs.boolean(
                  label: 'Secondary Required',
                  initialValue: false,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'All sizes',
      builder: (context) => ComponentDocs(
        name: 'Toggle — Sizes',
        description: 'Small (s), medium (m), and large (l) switches.',
        code:
            'Ux4gSwitch(checked: true, onCheckedChange: (_) {}, label: \'Small\',  size: Ux4gSwitchSize.s);',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ux4gSwitch(
              checked: true,
              onCheckedChange: (_) {},
              label: 'Small',
              size: Ux4gSwitchSize.s,
            ),
            const SizedBox(height: 8),
            Ux4gSwitch(
              checked: true,
              onCheckedChange: (_) {},
              label: 'Medium',
              size: Ux4gSwitchSize.m,
            ),
            const SizedBox(height: 8),
            Ux4gSwitch(
              checked: true,
              onCheckedChange: (_) {},
              label: 'Large',
              size: Ux4gSwitchSize.l,
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => ComponentDocs(
        name: 'Toggle — Disabled',
        description: 'Toggle with onCheckedChange=null renders as disabled.',
        code:
            'Ux4gSwitch(checked: false, onCheckedChange: null, label: \'Off (disabled)\');',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ux4gSwitch(
              checked: false,
              onCheckedChange: null,
              label: 'Off (disabled)',
            ),
            const SizedBox(height: 8),
            Ux4gSwitch(
              checked: true,
              onCheckedChange: null,
              label: 'On  (disabled)',
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Layout Variants',
      builder: (context) {
        final textColor = Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black87;
        final iconColor = Theme.of(context).brightness == Brightness.dark
            ? Colors.white70
            : Colors.black54;

        return ComponentDocs(
          name: 'Toggle — Layout Variants',
          description:
              'Demonstrates native label compositions using the new built-in properties.',
          code: '''// Native dual-sided labels
Ux4gSwitch(
  checked: false,
  labelPosition: Ux4gSwitchLabelPosition.bothSides,
  label: 'Label text',
  isRequired: true,
  icon: Icon(Icons.category_outlined, size: 16),
  secondaryLabel: 'Label text',
  isSecondaryRequired: true,
  secondaryIcon: Icon(Icons.category_outlined, size: 16),
)''',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. No label
              Ux4gSwitch(
                checked: false,
                onCheckedChange: (_) {},
                labelPosition: Ux4gSwitchLabelPosition.noLabel,
              ),
              const SizedBox(height: 24),
              // 2. Right label
              Ux4gSwitch(
                checked: false,
                onCheckedChange: (_) {},
                labelPosition: Ux4gSwitchLabelPosition.right,
                label: 'Label text',
                isRequired: true,
                icon: Icon(Icons.category_outlined, size: 16, color: iconColor),
                labelStyle: TextStyle(color: textColor, fontSize: 14),
              ),
              const SizedBox(height: 24),
              // 3. Left label
              Ux4gSwitch(
                checked: false,
                onCheckedChange: (_) {},
                labelPosition: Ux4gSwitchLabelPosition.left,
                label: 'Label text',
                isRequired: true,
                icon: Icon(Icons.category_outlined, size: 16, color: iconColor),
                labelStyle: TextStyle(color: textColor, fontSize: 14),
              ),
              const SizedBox(height: 24),
              // 4. Both sides label
              Ux4gSwitch(
                checked: false,
                onCheckedChange: (_) {},
                labelPosition: Ux4gSwitchLabelPosition.bothSides,
                label: 'Label text',
                isRequired: true,
                icon: Icon(Icons.category_outlined, size: 16, color: iconColor),
                labelStyle: TextStyle(color: textColor, fontSize: 14),
                secondaryLabel: 'Label text',
                isSecondaryRequired: true,
                secondaryIcon: Icon(
                  Icons.category_outlined,
                  size: 16,
                  color: iconColor,
                ),
              ),
            ],
          ),
        );
      },
    ),
  ],
);

// ── Slider ────────────────────────────────────────────────────────────────────

final sliderComponent = WidgetbookComponent(
  name: 'Slider',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Slider',
          description:
              'Slider is an interactive input control that allows users to select a value or a range of values by dragging a handle along a horizontal track. It provides an intuitive, visually appealing way to adjust continuous settings or explore approximate ranges.',
          showPreview: false,
          child: _SliderVisualShowcase(),
        );
      },
    ),
    // ── 1. Basic Single Slider (Small) ─────────────────────────────────
    WidgetbookUseCase(
      name: 'Slider',
      builder: (context) {
        double value = 50;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Slider',
              description:
                  'Slider is an interactive input control that allows users to select a value or a range of values by dragging a handle along a horizontal track. It provides an intuitive, visually appealing way to adjust continuous settings or explore approximate ranges.',
              code: '''Ux4gSlider(
  value: value,
  min: 0,
  max: 100,
  steps: 9,                        // 9 intermediate ticks → 0,10,20…100
  size: Ux4gSliderSize.small,
  showMarksAndValues: true,
  onValueChange: (v) => setState(() => value = v),
);''',
              props: const [
                PropRow(
                  name: 'value',
                  type: 'double',
                  description: 'Current thumb position.',
                  required: true,
                ),
                PropRow(
                  name: 'onValueChange',
                  type: 'ValueChanged<double>?',
                  description: 'Called when the user drags the thumb.',
                  required: true,
                ),
                PropRow(
                  name: 'min',
                  type: 'double',
                  description: 'Minimum selectable value.',
                  defaultValue: '0.0',
                ),
                PropRow(
                  name: 'max',
                  type: 'double',
                  description: 'Maximum selectable value.',
                  defaultValue: '100.0',
                ),
                PropRow(
                  name: 'steps',
                  type: 'int?',
                  description:
                      'Number of intermediate tick marks between min and max.',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gSliderSize',
                  description: 'small (16 dp thumb) or medium (20 dp thumb).',
                  defaultValue: 'small',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Disables interaction when false.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Text label shown above the slider.',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Appends a red asterisk to the label.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'labelIcon',
                  type: 'IconData?',
                  description: 'Optional icon shown beside the label.',
                ),
                PropRow(
                  name: 'startValueText',
                  type: 'String?',
                  description:
                      'Custom text for the left end of the value row (overrides default %).',
                ),
                PropRow(
                  name: 'endValueText',
                  type: 'String?',
                  description:
                      'Custom text for the right end of the value row (overrides default %).',
                ),
                PropRow(
                  name: 'caption',
                  type: 'String?',
                  description:
                      'Helper / error / warning / success text shown below the track.',
                ),
                PropRow(
                  name: 'captionVariant',
                  type: 'Ux4gSliderCaptionVariant',
                  description: 'helper · error · warning · success.',
                  defaultValue: 'helper',
                ),
                PropRow(
                  name: 'showMarksAndValues',
                  type: 'bool',
                  description:
                      'Shows tick marks and numeric labels below the track. Requires steps.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'showIndicator',
                  type: 'bool',
                  description:
                      'Shows a floating bubble with the current value while dragging.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'showInputFields',
                  type: 'bool',
                  description:
                      'Replaces the value label row with editable text-field inputs.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'showValueLabels',
                  type: 'bool',
                  description:
                      'Shows current-value % and max-value % labels above the track.',
                  defaultValue: 'false',
                ),
              ],
              child: SizedBox(
                width: 320,
                child: Ux4gSlider(
                  value: value,
                  min: 0,
                  max: 100,
                  steps: 9,
                  size: Ux4gSliderSize.small,
                  showMarksAndValues: true,
                  onValueChange: (v) => setState(() => value = v),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 2. Basic Range Slider (Medium) ─────────────────────────────────
    WidgetbookUseCase(
      name: 'Range Slider',
      builder: (context) {
        RangeValues range = const RangeValues(20, 90);
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'RangeSlider',
              description:
                  'Range Slider component allows users to select a value or a range within a predefined scale by dragging a handle. It provides a more interactive and visual alternative to numeric input fields, making it ideal for adjustable settings, pricing filters, volume controls and progress tracking.',
              code: '''Ux4gRangeSlider(
  values: RangeValues(20, 90),
  min: 0,
  max: 100,
  steps: 9,
  size: Ux4gSliderSize.medium,
  showValueLabels: true,
  showMarksAndValues: true,
  onValueChange: (v) => setState(() => range = v),
);''',
              props: const [
                PropRow(
                  name: 'values',
                  type: 'RangeValues',
                  description: 'Current start and end positions.',
                  required: true,
                ),
                PropRow(
                  name: 'onValueChange',
                  type: 'ValueChanged<RangeValues>?',
                  description: 'Called when either thumb is dragged.',
                  required: true,
                ),
                PropRow(
                  name: 'min',
                  type: 'double',
                  description: 'Minimum selectable value.',
                  defaultValue: '0.0',
                ),
                PropRow(
                  name: 'max',
                  type: 'double',
                  description: 'Maximum selectable value.',
                  defaultValue: '100.0',
                ),
                PropRow(
                  name: 'steps',
                  type: 'int?',
                  description: 'Number of intermediate tick marks.',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gSliderSize',
                  description: 'small or medium.',
                  defaultValue: 'small',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Disables interaction when false.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Text label shown above the slider.',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Appends a red asterisk to the label.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'startValueText',
                  type: 'String?',
                  description: 'Custom left-end label text.',
                ),
                PropRow(
                  name: 'endValueText',
                  type: 'String?',
                  description: 'Custom right-end label text.',
                ),
                PropRow(
                  name: 'showMarksAndValues',
                  type: 'bool',
                  description:
                      'Tick marks + numeric labels below track. Requires steps.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'showInputFields',
                  type: 'bool',
                  description:
                      'Editable input fields replace the value label row.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'showValueLabels',
                  type: 'bool',
                  description: 'Shows start/end % labels above the track.',
                  defaultValue: 'false',
                ),
              ],
              child: SizedBox(
                width: 320,
                child: Ux4gRangeSlider(
                  values: range,
                  min: 0,
                  max: 100,
                  steps: 9,
                  size: Ux4gSliderSize.medium,
                  showValueLabels: true,
                  showMarksAndValues: true,
                  onValueChange: (v) => setState(() => range = v),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 3. With Value Indicator ─────────────────────────────────────────
    WidgetbookUseCase(
      name: 'With Value Indicator',
      builder: (context) {
        double value = 40;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Slider — Value Indicator',
              description:
                  'showIndicator: true shows a floating bubble above the thumb '
                  'with the current value while the user is dragging.',
              code: '''Ux4gSlider(
  value: value,
  min: 0,
  max: 100,
  steps: 4,
  size: Ux4gSliderSize.small,
  showIndicator: true,
  showMarksAndValues: true,
  onValueChange: (v) => setState(() => value = v),
);''',
              child: SizedBox(
                width: 320,
                child: Ux4gSlider(
                  value: value,
                  min: 0,
                  max: 100,
                  steps: 4,
                  size: Ux4gSliderSize.small,
                  showIndicator: true,
                  showMarksAndValues: true,
                  onValueChange: (v) => setState(() => value = v),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 4. With Editable Input Fields ──────────────────────────────────
    WidgetbookUseCase(
      name: 'With Editable Input Fields',
      builder: (context) {
        double value = 50;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Slider — Input Fields',
              description:
                  'showInputFields: true replaces the value label row with two '
                  'text-field inputs. The left field shows and edits the current '
                  'value; the right field shows the max (read-only).',
              code: '''Ux4gSlider(
  value: value,
  min: 0,
  max: 100,
  steps: 5,
  size: Ux4gSliderSize.small,
  showInputFields: true,
  showMarksAndValues: true,
  onValueChange: (v) => setState(() => value = v),
);''',
              child: SizedBox(
                width: 320,
                child: Ux4gSlider(
                  value: value,
                  min: 0,
                  max: 100,
                  steps: 5,
                  size: Ux4gSliderSize.small,
                  showInputFields: true,
                  showMarksAndValues: true,
                  onValueChange: (v) => setState(() => value = v),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 5. Disabled State ───────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Disabled State',
      builder: (context) => ComponentDocs(
        name: 'Slider — Disabled',
        description:
            'Set enabled: false to prevent interaction. '
            'The track and thumb render at reduced opacity. '
            'Use caption to explain why it is disabled.',
        code: '''Ux4gSlider(
  value: 50,
  min: 0,
  max: 100,
  enabled: false,
  caption: 'Component is disabled',
  onValueChange: null,
);''',
        child: const SizedBox(
          width: 320,
          child: Ux4gSlider(
            value: 50,
            min: 0,
            max: 100,
            enabled: false,
            caption: 'Component is disabled',
            onValueChange: null,
          ),
        ),
      ),
    ),

    // ── 6. Error State ──────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Error State',
      builder: (context) {
        double value = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Slider — Error',
              description:
                  'captionVariant: error changes the track to the error color '
                  'and shows an error icon beside the caption text.',
              code: '''Ux4gSlider(
  value: value,
  min: 0,
  max: 100,
  caption: 'Value is out of budget',
  captionVariant: Ux4gSliderCaptionVariant.error,
  onValueChange: (v) => setState(() => value = v),
);''',
              child: SizedBox(
                width: 320,
                child: Ux4gSlider(
                  value: value,
                  min: 0,
                  max: 100,
                  caption: 'Value is out of budget',
                  captionVariant: Ux4gSliderCaptionVariant.error,
                  onValueChange: (v) => setState(() => value = v),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 7. Warning State ────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Warning State',
      builder: (context) {
        double value = 60;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Slider — Warning',
              description:
                  'captionVariant: warning renders the caption in orange with a '
                  'warning icon, signalling that the selected value needs attention.',
              code: '''Ux4gSlider(
  value: value,
  min: 0,
  max: 100,
  label: 'Budget Limit',
  caption: 'Approaching the maximum limit',
  captionVariant: Ux4gSliderCaptionVariant.warning,
  onValueChange: (v) => setState(() => value = v),
);''',
              child: SizedBox(
                width: 320,
                child: Ux4gSlider(
                  value: value,
                  min: 0,
                  max: 100,
                  label: 'Budget Limit',
                  caption: 'Approaching the maximum limit',
                  captionVariant: Ux4gSliderCaptionVariant.warning,
                  onValueChange: (v) => setState(() => value = v),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 8. Success State ────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Success State',
      builder: (context) {
        double value = 45;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Slider — Success',
              description:
                  'captionVariant: success renders the caption in green with a '
                  'check icon, confirming that the selected value is valid.',
              code: '''Ux4gSlider(
  value: value,
  min: 0,
  max: 100,
  label: 'Budget Allocation',
  caption: 'Value is within the acceptable range',
  captionVariant: Ux4gSliderCaptionVariant.success,
  onValueChange: (v) => setState(() => value = v),
);''',
              child: SizedBox(
                width: 320,
                child: Ux4gSlider(
                  value: value,
                  min: 0,
                  max: 100,
                  label: 'Budget Allocation',
                  caption: 'Value is within the acceptable range',
                  captionVariant: Ux4gSliderCaptionVariant.success,
                  onValueChange: (v) => setState(() => value = v),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── OTP Input ─────────────────────────────────────────────────────────────────

final otpInputComponent = WidgetbookComponent(
  name: 'Input-OTP',
  isInitiallyExpanded: false,
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) => ComponentDocs(
        name: 'Input-OTP',
        description:
            'Input - OTP component consists of multiple input fields designed for entering a one-time password. It automatically advances focus between fields and provides clear feedback for a secure and seamless verification experience.',
        showPreview: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'States',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Ux4gOtpInput(
              length: 6,
              value: '',
              onChanged: (_) {},
              label: 'Default',
              status: Ux4gOtpInputStatus.defaultStatus,
            ),
            const SizedBox(height: 16),
            Ux4gOtpInput(
              length: 6,
              value: '123456',
              onChanged: (_) {},
              label: 'Error state',
              status: Ux4gOtpInputStatus.error,
              captionVariant: Ux4gOtpCaptionVariant.plain,
              captionText: 'Invalid OTP entered',
            ),
            const SizedBox(height: 16),
            Ux4gOtpInput(
              length: 6,
              value: '123456',
              onChanged: (_) {},
              label: 'Success state',
              status: Ux4gOtpInputStatus.success,
            ),
            const SizedBox(height: 16),
            Ux4gOtpInput(
              length: 6,
              value: '',
              onChanged: (_) {},
              label: 'Disabled',
              enabled: false,
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        String otpValue = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            // ── Read knob values ────────────────────────────────
            final length = context.knobs.int.input(
              label: 'Length',
              initialValue: 6,
            );

            final variant = context.knobs.list<String>(
              label: 'Variant',
              options: const [
                'Default',
                'Error state',
                'Success state',
                'Warning state',
                'Disabled',
                'Resend timer',
                'Resend action',
                'Attempt with timer',
                'Account locked',
                'Obscured (Password)',
                'With separator',
              ],
              initialOption: 'Default',
            );

            Widget childWidget;
            String codeStr;

            switch (variant) {
              case 'Error state':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: '12345',
  status: Ux4gOtpInputStatus.error,
  captionVariant: Ux4gOtpCaptionVariant.plain,
  captionText: 'Invalid OTP entered. Please try again.',
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: '12345',
                  status: Ux4gOtpInputStatus.error,
                  captionVariant: Ux4gOtpCaptionVariant.plain,
                  captionText: 'Invalid OTP entered. Please try again.',
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Success state':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: '123456',
  status: Ux4gOtpInputStatus.success,
  captionVariant: Ux4gOtpCaptionVariant.success,
  captionText: 'OTP verified successfully',
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: '123456',
                  status: Ux4gOtpInputStatus.success,
                  captionVariant: Ux4gOtpCaptionVariant.success,
                  captionText: 'OTP verified successfully',
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Warning state':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: '12345',
  status: Ux4gOtpInputStatus.warning,
  captionVariant: Ux4gOtpCaptionVariant.warning,
  captionText: 'Only 1 attempt remaining',
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: '12345',
                  status: Ux4gOtpInputStatus.warning,
                  captionVariant: Ux4gOtpCaptionVariant.warning,
                  captionText: 'Only 1 attempt remaining',
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Disabled':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: '',
  enabled: false,
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: '',
                  enabled: false,
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Resend timer':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: otpValue,
  captionVariant: Ux4gOtpCaptionVariant.resendTimer,
  captionLeadingText: "Didn't receive OTP?",
  captionTrailingText: 'Resend in 00:30',
  autoCountdownSeconds: 30,
  onChanged: (v) => setState(() => otpValue = v),
  onCountdownComplete: () {
    // Timer finished
  },
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: otpValue,
                  captionVariant: Ux4gOtpCaptionVariant.resendTimer,
                  captionLeadingText: "Didn't receive OTP?",
                  captionTrailingText: 'Resend in 00:30',
                  autoCountdownSeconds: 30,
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Resend action':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: otpValue,
  captionVariant: Ux4gOtpCaptionVariant.resendAction,
  captionLeadingText: "Didn't receive OTP?",
  captionTrailingText: 'Resend OTP',
  onCaptionTrailingTap: () {
    // Resend OTP logic
  },
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: otpValue,
                  captionVariant: Ux4gOtpCaptionVariant.resendAction,
                  captionLeadingText: "Didn't receive OTP?",
                  captionTrailingText: 'Resend OTP',
                  onCaptionTrailingTap: () {},
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Attempt with timer':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: '1234',
  status: Ux4gOtpInputStatus.error,
  captionVariant: Ux4gOtpCaptionVariant.attemptWithTimer,
  captionLeadingText: 'Attempt 2 of 3',
  captionTrailingText: 'Resend in 00:17',
  autoCountdownSeconds: 17,
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: '1234',
                  status: Ux4gOtpInputStatus.error,
                  captionVariant: Ux4gOtpCaptionVariant.attemptWithTimer,
                  captionLeadingText: 'Attempt 2 of 3',
                  captionTrailingText: 'Resend in 00:17',
                  autoCountdownSeconds: 17,
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Account locked':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: '',
  enabled: false,
  status: Ux4gOtpInputStatus.locked,
  captionVariant: Ux4gOtpCaptionVariant.locked,
  captionLeadingText: 'Locked for 28:43',
  captionTrailingText: 'Resend OTP',
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: '',
                  enabled: false,
                  status: Ux4gOtpInputStatus.locked,
                  captionVariant: Ux4gOtpCaptionVariant.locked,
                  captionLeadingText: 'Locked for 28:43',
                  captionTrailingText: 'Resend OTP',
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Obscured (Password)':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: otpValue,
  obscure: true,
  label: 'Secure PIN',
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: otpValue,
                  obscure: true,
                  label: 'Secure PIN',
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'With separator':
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: otpValue,
  showSeparator: true,
  label: 'Verification Code',
  onChanged: (v) => setState(() => otpValue = v),
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: otpValue,
                  showSeparator: true,
                  label: 'Verification Code',
                  onChanged: (v) => setState(() => otpValue = v),
                );
                break;
              case 'Default':
              default:
                codeStr =
                    '''Ux4gOtpInput(
  length: $length,
  value: otpValue,
  onChanged: (v) => setState(() => otpValue = v),
  onCompleted: (pin) {
    // verify pin
  },
)''';
                childWidget = Ux4gOtpInput(
                  length: length,
                  value: otpValue,
                  onChanged: (v) => setState(() => otpValue = v),
                  onCompleted: (_) {},
                );
                break;
            }

            return ComponentDocs(
              name: 'OtpInput',
              description:
                  'Input - OTP component consists of multiple input fields designed for entering a one-time password. It automatically advances focus between fields and provides clear feedback for a secure and seamless verification experience.',
              code: codeStr,
              props: const [
                PropRow(
                  name: 'value',
                  type: 'String',
                  description: 'Current OTP string (controlled).',
                  required: true,
                ),
                PropRow(
                  name: 'onChanged',
                  type: 'ValueChanged<String>',
                  description:
                      'Called on each digit change with the full current OTP string.',
                  required: true,
                ),
                PropRow(
                  name: 'length',
                  type: 'int',
                  description: 'Number of OTP digit boxes.',
                  defaultValue: '6',
                ),
                PropRow(
                  name: 'onCompleted',
                  type: 'ValueChanged<String>?',
                  description:
                      'Called when all digits are filled with the complete OTP.',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label text shown above the OTP boxes.',
                ),
                PropRow(
                  name: 'required',
                  type: 'bool',
                  description:
                      'When true, shows a red asterisk (*) next to the label.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'labelTrailingIcon',
                  type: 'IconData?',
                  description:
                      'Optional trailing icon next to the label (e.g. info icon).',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gOtpInputStatus',
                  description:
                      'Overall status — drives box border colours and caption icon. '
                      'Values: defaultStatus, error, warning, success, locked.',
                  defaultValue: 'defaultStatus',
                ),
                PropRow(
                  name: 'obscure',
                  type: 'bool',
                  description:
                      'When true, entered digits are shown as dots (password mode).',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'boxSize',
                  type: 'double',
                  description:
                      'Width and height of each individual OTP box in logical pixels.',
                  defaultValue: '48',
                ),
                PropRow(
                  name: 'gap',
                  type: 'double',
                  description: 'Spacing between adjacent OTP boxes.',
                  defaultValue: '8',
                ),
                PropRow(
                  name: 'showSeparator',
                  type: 'bool',
                  description:
                      'When true, shows a "–" dash separator between boxes.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'keyboardType',
                  type: 'TextInputType',
                  description:
                      'Keyboard type for the input. Use TextInputType.number for digits only.',
                  defaultValue: 'TextInputType.number',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description:
                      'When false, all boxes appear disabled and cannot receive input.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'captionVariant',
                  type: 'Ux4gOtpCaptionVariant?',
                  description:
                      'Caption variant rendered below the boxes. '
                      'Values: resendTimer, resendAction, attemptWithTimer, locked, success, warning, plain.',
                ),
                PropRow(
                  name: 'captionLeadingText',
                  type: 'String?',
                  description:
                      'Leading label text for the caption (e.g. "Didn\'t receive OTP?").',
                ),
                PropRow(
                  name: 'captionTrailingText',
                  type: 'String?',
                  description:
                      'Trailing label text for the caption (e.g. "Resend in 00:17").',
                ),
                PropRow(
                  name: 'onCaptionTrailingTap',
                  type: 'VoidCallback?',
                  description:
                      'Callback when caption trailing text is tapped (e.g. "Resend OTP" link).',
                ),
                PropRow(
                  name: 'captionText',
                  type: 'String?',
                  description:
                      'Plain text caption (used with OtpCaptionVariant.plain).',
                ),
                PropRow(
                  name: 'autoCountdownSeconds',
                  type: 'int?',
                  description:
                      'When set, auto-counts down from this value and shows formatted "mm:ss" timer. '
                      'On expiry, switches caption to resendAction variant.',
                ),
                PropRow(
                  name: 'onCountdownComplete',
                  type: 'VoidCallback?',
                  description: 'Called when the auto-countdown reaches zero.',
                ),
              ],
              child: SizedBox(width: 380, child: childWidget),
            );
          },
        );
      },
    ),
  ],
);

// ── Dropdown Introduction ──────────────────────────────────────────────────────

final dropdownIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        List<String> selectedSelectionIds = [];
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Dropdown',
              description:
                  'Dropdown menu is a user interface element that reveals a hidden list of options, links or actions when you click or hover over a trigger button.',
              showPreview: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'States',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Action Dropdown'),
                  const SizedBox(height: 8),
                  Ux4gActionDropdown(
                    options: const [
                      Ux4gActionDropdownOption(id: '1', label: 'Action 1'),
                      Ux4gActionDropdownOption(id: '2', label: 'Action 2'),
                    ],
                    onOptionClick: (_) {},
                    triggerBuilder: (context, toggle) => Ux4gButton(
                      text: 'Actions',
                      variant: Ux4gButtonVariant.outline,
                      onPressed: toggle,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Selection Dropdown'),
                  const SizedBox(height: 8),
                  Ux4gSelectionDropdown(
                    label: 'Selection',
                    placeholder: 'Select option',
                    options: const [
                      Ux4gDropdownOption(id: '1', label: 'Option 1'),
                      Ux4gDropdownOption(id: '2', label: 'Option 2'),
                    ],
                    selectedOptionIds: selectedSelectionIds,
                    onSelectionChange: (ids) =>
                        setState(() => selectedSelectionIds = ids),
                    mode: Ux4gDropdownMode.single,
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Action Dropdown ───────────────────────────────────────────────────────────
String? _actionDropdownDefaultSelectedId;
String? _actionDropdownMoreSelectedId;
List<String> _selectionDropdownSingleSelected = [];
List<String> _selectionDropdownMultiSelected = [];

final actionDropdownComponent = WidgetbookComponent(
  name: 'ActionDropdown',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            final options = const [
              Ux4gActionDropdownOption(id: '1', label: 'Edit'),
              Ux4gActionDropdownOption(id: '2', label: 'Duplicate'),
              Ux4gActionDropdownOption(
                id: '3',
                label: 'Delete',
                showTrailingArrow: false,
              ),
            ];
            final selectedOpt = _actionDropdownDefaultSelectedId == null
                ? null
                : options.firstWhere(
                    (o) => o.id == _actionDropdownDefaultSelectedId,
                    orElse: () => options.first,
                  );

            return ComponentDocs(
              name: 'ActionDropdown',
              description:
                  'Dropdown menu is a user interface element that reveals a hidden list of options, links or actions when you click a trigger button.',
              code: '''Ux4gActionDropdown(
  options: [
    Ux4gActionDropdownOption(id: '1', label: 'Edit'),
    Ux4gActionDropdownOption(id: '2', label: 'Duplicate'),
    Ux4gActionDropdownOption(id: '3', label: 'Delete', showTrailingArrow: false),
  ],
  selectedOptionId: selectedId,
  onOptionClick: (option) {
    setState(() => selectedId = option.id);
  },
  triggerBuilder: (context, toggle) => Ux4gButton(
    text: selectedOption?.label ?? 'Actions',
    variant: Ux4gButtonVariant.outline,
    onPressed: toggle,
  ),
);''',
              props: const [
                PropRow(
                  name: 'options',
                  type: 'List<Ux4gActionDropdownOption>',
                  description: 'Menu items.',
                  required: true,
                ),
                PropRow(
                  name: 'onOptionClick',
                  type: 'ValueChanged<Ux4gActionDropdownOption>',
                  description: 'Called when an option is tapped.',
                  required: true,
                ),
                PropRow(
                  name: 'triggerBuilder',
                  type: 'Ux4gDropdownTriggerBuilder',
                  description:
                      'Builds the trigger widget; receives a toggle callback.',
                  required: true,
                ),
                PropRow(
                  name: 'selectedOptionId',
                  type: 'String?',
                  description: 'ID of currently selected action option.',
                ),
              ],
              child: Ux4gActionDropdown(
                options: options,
                selectedOptionId: _actionDropdownDefaultSelectedId,
                onOptionClick: (opt) {
                  setState(() => _actionDropdownDefaultSelectedId = opt.id);
                },
                triggerBuilder: (context, toggle) => Ux4gButton(
                  text: selectedOpt?.label ?? 'Open Actions',
                  variant: Ux4gButtonVariant.outline,
                  onPressed: toggle,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'More Options Trigger',
      builder: (context) {
        final primaryColor =
            Theme.of(context).extension<Ux4gThemeColors>()?.primary ??
            Theme.of(context).colorScheme.primary;

        return StatefulBuilder(
          builder: (ctx, setState) {
            final options = const [
              Ux4gActionDropdownOption(
                id: '1',
                label: 'Label for the list item',
              ),
              Ux4gActionDropdownOption(
                id: '2',
                label: 'Label for the list item',
              ),
              Ux4gActionDropdownOption(
                id: '3',
                label: 'Label for the list item',
              ),
              Ux4gActionDropdownOption(
                id: '4',
                label: 'Label for the list item',
              ),
            ];

            return ComponentDocs(
              name: 'ActionDropdown — More Options',
              description:
                  'A custom trigger button with an icon and custom styling.',
              code: '''Ux4gActionDropdown(
  options: const [
    Ux4gActionDropdownOption(id: '1', label: 'Label for the list item'),
    Ux4gActionDropdownOption(id: '2', label: 'Label for the list item'),
    Ux4gActionDropdownOption(id: '3', label: 'Label for the list item'),
    Ux4gActionDropdownOption(id: '4', label: 'Label for the list item'),
  ],
  selectedOptionId: selectedId,
  onOptionClick: (option) => setState(() => selectedId = option.id),
  triggerBuilder: (context, toggle) => InkWell(
    onTap: toggle,
    borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5),
        borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
      ),
      child: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.primary),
    ),
  ),
);''',
              child: Ux4gActionDropdown(
                options: options,
                selectedOptionId: _actionDropdownMoreSelectedId,
                onOptionClick: (opt) {
                  setState(() => _actionDropdownMoreSelectedId = opt.id);
                },
                triggerBuilder: (context, toggle) => InkWell(
                  onTap: toggle,
                  borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.15),
                      border: Border.all(color: primaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                    ),
                    child: Icon(Icons.more_vert, color: primaryColor),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Selection Dropdown ────────────────────────────────────────────────────────

final selectionDropdownComponent = WidgetbookComponent(
  name: 'SelectionDropdown',
  useCases: [
    WidgetbookUseCase(
      name: 'Single select',
      builder: (context) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            final searchEnabled = context.knobs.boolean(
              label: 'Search enabled',
              initialValue: false,
            );
            final isRequired = context.knobs.boolean(
              label: 'Required',
              initialValue: false,
            );
            final size = context.knobs.list(
              label: 'Size',
              options: Ux4gDropdownSize.values,
              initialOption: Ux4gDropdownSize.m,
              labelBuilder: (v) => v.name,
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gDropdownStatus.values,
              initialOption: Ux4gDropdownStatus.defaultStatus,
              labelBuilder: (v) => v.name,
            );
            final description = context.knobs.string(
              label: 'Description',
              initialValue: '',
            );

            return ComponentDocs(
              name: 'SelectionDropdown',
              description:
                  'A dropdown for selecting one or multiple options from a list. '
                  'Supports search filtering, single/multi mode, and three sizes.',
              code: () {
                final buf = StringBuffer();
                buf.writeln("Ux4gSelectionDropdown(");
                buf.writeln("  label: 'Country',");
                buf.writeln("  placeholder: 'Select country',");
                buf.writeln("  options: const [");
                buf.writeln(
                  "    Ux4gDropdownOption(id: 'in', label: 'India'),",
                );
                buf.writeln(
                  "    Ux4gDropdownOption(id: 'us', label: 'United States'),",
                );
                buf.writeln(
                  "    Ux4gDropdownOption(id: 'uk', label: 'United Kingdom'),",
                );
                buf.writeln(
                  "    Ux4gDropdownOption(id: 'au', label: 'Australia'),",
                );
                buf.writeln(
                  "    Ux4gDropdownOption(id: 'ca', label: 'Canada'),",
                );
                buf.writeln("  ],");
                buf.writeln("  selectedOptionIds: selectedIds,");
                buf.writeln(
                  "  onSelectionChange: (ids) => setState(() => selectedIds = ids),",
                );
                buf.writeln("  mode: Ux4gDropdownMode.single,");
                buf.writeln("  searchEnabled: $searchEnabled,");
                if (isRequired) {
                  buf.writeln("  isRequired: true,");
                }
                if (size != Ux4gDropdownSize.m) {
                  buf.writeln("  size: Ux4gDropdownSize.${size.name},");
                }
                if (status != Ux4gDropdownStatus.defaultStatus) {
                  buf.writeln("  status: Ux4gDropdownStatus.${status.name},");
                }
                if (description.isNotEmpty) {
                  buf.writeln("  description: '$description',");
                }
                buf.writeln(");");
                return buf.toString();
              }(),
              props: const [
                PropRow(
                  name: 'options',
                  type: 'List<Ux4gDropdownOption>',
                  description: 'Available choices.',
                  required: true,
                ),
                PropRow(
                  name: 'selectedOptionIds',
                  type: 'List<String>',
                  description: 'IDs of currently selected options.',
                  required: true,
                ),
                PropRow(
                  name: 'onSelectionChange',
                  type: 'ValueChanged<List<String>>',
                  description: 'Called with new selection.',
                  required: true,
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label above dropdown.',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Shows a required asterisk if true.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'description',
                  type: 'String?',
                  description: 'Supporting text below the dropdown.',
                ),
                PropRow(
                  name: 'placeholder',
                  type: 'String',
                  description: 'Hint text.',
                  defaultValue: '"Please select.."',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gDropdownSize',
                  description: 's / m / l.',
                  defaultValue: 'm',
                ),
                PropRow(
                  name: 'mode',
                  type: 'Ux4gDropdownMode',
                  description: 'single or multi.',
                  defaultValue: 'single',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gDropdownStatus',
                  description: 'defaultStatus / error / disabled / warning / success.',
                  defaultValue: 'defaultStatus',
                ),
                PropRow(
                  name: 'searchEnabled',
                  type: 'bool',
                  description: 'Show search filter box.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'filterType',
                  type: 'Ux4gDropdownFilterType',
                  description: 'Search matching logic.',
                  defaultValue: 'contains',
                ),
                PropRow(
                  name: 'labelTextStyle',
                  type: 'TextStyle?',
                  description: 'Custom text style for the dropdown label.',
                ),
                PropRow(
                  name: 'valueTextStyle',
                  type: 'TextStyle?',
                  description: 'Custom text style for the selected value.',
                ),
                PropRow(
                  name: 'leadingIcon',
                  type: 'IconData?',
                  description:
                      'Optional icon shown at the start of the trigger button.',
                ),
              ],
              child: SizedBox(
                width: 300,
                child: Ux4gSelectionDropdown(
                  label: 'Country',
                  placeholder: 'Select country',
                  options: const [
                    Ux4gDropdownOption(id: 'in', label: 'India'),
                    Ux4gDropdownOption(id: 'us', label: 'United States'),
                    Ux4gDropdownOption(id: 'uk', label: 'United Kingdom'),
                    Ux4gDropdownOption(id: 'au', label: 'Australia'),
                    Ux4gDropdownOption(id: 'ca', label: 'Canada'),
                  ],
                  selectedOptionIds: _selectionDropdownSingleSelected,
                  onSelectionChange: (ids) =>
                      setState(() => _selectionDropdownSingleSelected = ids),
                  mode: Ux4gDropdownMode.single,
                  searchEnabled: searchEnabled,
                  isRequired: isRequired,
                  size: size,
                  status: status,
                  description: description.isEmpty ? null : description,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Multi select',
      builder: (context) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            final isRequired = context.knobs.boolean(
              label: 'Required',
              initialValue: false,
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gDropdownStatus.values,
              initialOption: Ux4gDropdownStatus.defaultStatus,
              labelBuilder: (v) => v.name,
            );
            final description = context.knobs.string(
              label: 'Description',
              initialValue: '',
            );

            return ComponentDocs(
              name: 'SelectionDropdown — Multi',
              description:
                  'Multi-select mode shows chips for each selected option.',
              code: () {
                final buf = StringBuffer();
                buf.writeln("Ux4gSelectionDropdown(");
                buf.writeln("  label: 'Tags',");
                buf.writeln("  placeholder: 'Select tags',");
                buf.writeln("  options: const [");
                buf.writeln("    Ux4gDropdownOption(id: 'flutter', label: 'Flutter'),");
                buf.writeln("    Ux4gDropdownOption(id: 'dart', label: 'Dart'),");
                buf.writeln("    Ux4gDropdownOption(id: 'design', label: 'Design System'),");
                buf.writeln("    Ux4gDropdownOption(id: 'mobile', label: 'Mobile'),");
                buf.writeln("    Ux4gDropdownOption(id: 'web', label: 'Web'),");
                buf.writeln("  ],");
                buf.writeln("  selectedOptionIds: selectedIds,");
                buf.writeln("  onSelectionChange: (ids) => setState(() => selectedIds = ids),");
                buf.writeln("  mode: Ux4gDropdownMode.multi,");
                buf.writeln("  searchEnabled: true,");
                if (isRequired) {
                  buf.writeln("  isRequired: true,");
                }
                if (status != Ux4gDropdownStatus.defaultStatus) {
                  buf.writeln("  status: Ux4gDropdownStatus.${status.name},");
                }
                if (description.isNotEmpty) {
                  buf.writeln("  description: '$description',");
                }
                buf.writeln(");");
                return buf.toString();
              }(),
              child: SizedBox(
                width: 300,
                child: Ux4gSelectionDropdown(
                  label: 'Tags',
                  placeholder: 'Select tags',
                  options: const [
                    Ux4gDropdownOption(id: 'flutter', label: 'Flutter'),
                    Ux4gDropdownOption(id: 'dart', label: 'Dart'),
                    Ux4gDropdownOption(id: 'design', label: 'Design System'),
                    Ux4gDropdownOption(id: 'mobile', label: 'Mobile'),
                    Ux4gDropdownOption(id: 'web', label: 'Web'),
                  ],
                  selectedOptionIds: _selectionDropdownMultiSelected,
                  onSelectionChange: (ids) =>
                      setState(() => _selectionDropdownMultiSelected = ids),
                  mode: Ux4gDropdownMode.multi,
                  searchEnabled: true,
                  isRequired: isRequired,
                  status: status,
                  description: description.isEmpty ? null : description,
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Date Picker ───────────────────────────────────────────────────────────────
final datePickerComponent = WidgetbookComponent(
  name: 'Date Picker',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Date Picker',
          description:
              'Date Picker component allows users to select a single date or a range of dates using a calendar interface. It ensures accurate and consistent date selection across workflows.',
          showPreview: false,
          child: _DatePickerVisualShowcase(),
        );
      },
    ),
    // ── 1. Single Date ───────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Single Date',
      builder: (context) {
        DateTime? selected;
        return StatefulBuilder(
          builder: (ctx, setState) {
            final label = context.knobs.string(
              label: 'Label',
              initialValue: 'Date of Birth',
            );
            final description = context.knobs.string(
              label: 'Description',
              initialValue: 'Please enter your date of birth.',
            );
            final isRequired = context.knobs.boolean(
              label: 'Required',
              initialValue: false,
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gInputFieldStatus.values,
              initialOption: Ux4gInputFieldStatus.defaultStatus,
              labelBuilder: (s) => s.name,
            );
            final placeholder = context.knobs.string(
              label: 'Placeholder',
              initialValue: 'Select DOB',
            );
            final enabled = context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            );

            return ComponentDocs(
              name: 'DatePicker — Single',
              description:
                  'Date Picker component allows users to select a single date or a range of dates using a calendar interface. It ensures accurate and consistent date selection across workflows.',
              code:
                  '''Ux4gDatePicker(
  mode: Ux4gDatePickerMode.single,
  label: ${label.isEmpty ? 'null' : "'$label'"},
  description: ${description.isEmpty ? 'null' : "'$description'"},
  isRequired: $isRequired,
  status: $status,
  placeholder: '$placeholder',
  enabled: $enabled,
  maxDate: DateTime.now(),
  onDateSelected: (date) {
    print('Selected: \$date');
  },
);''',
              props: const [
                PropRow(
                  name: 'mode',
                  type: 'Ux4gDatePickerMode',
                  description: 'single or range selection.',
                  defaultValue: 'single',
                ),
                PropRow(
                  name: 'initialDate',
                  type: 'DateTime?',
                  description: 'Pre-selected date for single mode.',
                ),
                PropRow(
                  name: 'initialDateRange',
                  type: 'DateTimeRange?',
                  description: 'Pre-selected range for range mode.',
                ),
                PropRow(
                  name: 'minDate',
                  type: 'DateTime?',
                  description: 'Earliest selectable date.',
                ),
                PropRow(
                  name: 'maxDate',
                  type: 'DateTime?',
                  description: 'Latest selectable date.',
                ),
                PropRow(
                  name: 'onDateSelected',
                  type: 'ValueChanged<DateTime>?',
                  description: 'Callback with the chosen date (single mode).',
                  required: true,
                ),
                PropRow(
                  name: 'onDateRangeSelected',
                  type: 'ValueChanged<DateTimeRange>?',
                  description: 'Callback with the chosen range (range mode).',
                  required: true,
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label above the picker.',
                ),
                PropRow(
                  name: 'description',
                  type: 'String?',
                  description: 'Supporting text below the picker.',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Shows a required asterisk.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gInputFieldStatus',
                  description: 'defaultStatus / error / warning / success.',
                  defaultValue: 'defaultStatus',
                ),
                PropRow(
                  name: 'placeholder',
                  type: 'String',
                  description: 'Hint text shown when nothing is selected.',
                  defaultValue: '"Select date"',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Whether interaction is enabled.',
                  defaultValue: 'true',
                ),
              ],
              child: SizedBox(
                width: 300,
                child: Ux4gDatePicker(
                  mode: Ux4gDatePickerMode.single,
                  label: label.isEmpty ? null : label,
                  description: description.isEmpty ? null : description,
                  isRequired: isRequired,
                  status: status,
                  placeholder: placeholder,
                  maxDate: DateTime.now(),
                  enabled: enabled,
                  onDateSelected: (d) => setState(() => selected = d),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 2. Date Range ────────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Date Range',
      builder: (context) {
        DateTimeRange? selectedRange;
        return StatefulBuilder(
          builder: (ctx, setState) {
            final label = context.knobs.string(
              label: 'Label',
              initialValue: 'Travel Dates',
            );
            final description = context.knobs.string(
              label: 'Description',
              initialValue: 'Select your travel dates.',
            );
            final isRequired = context.knobs.boolean(
              label: 'Required',
              initialValue: false,
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gInputFieldStatus.values,
              initialOption: Ux4gInputFieldStatus.defaultStatus,
              labelBuilder: (s) => s.name,
            );
            final placeholder = context.knobs.string(
              label: 'Placeholder',
              initialValue: 'Select range',
            );
            final enabled = context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            );

            return ComponentDocs(
              name: 'DatePicker — Range',
              description:
                  'Date range selection. First tap sets the start date, second tap sets '
                  'the end date. The selected range is displayed as "DD/MM/YYYY – DD/MM/YYYY".',
              code:
                  '''Ux4gDatePicker(
  mode: Ux4gDatePickerMode.range,
  label: ${label.isEmpty ? 'null' : "'$label'"},
  description: ${description.isEmpty ? 'null' : "'$description'"},
  isRequired: $isRequired,
  status: $status,
  placeholder: '$placeholder',
  enabled: $enabled,
  maxDate: DateTime.now(),
  onDateRangeSelected: (range) {
    print('From \${range.start} to \${range.end}');
  },
);''',
              props: const [
                PropRow(
                  name: 'mode',
                  type: 'Ux4gDatePickerMode',
                  description: 'range — start + end date selection.',
                  defaultValue: 'single',
                ),
                PropRow(
                  name: 'placeholder',
                  type: 'String',
                  description: 'Hint text shown when no range is selected.',
                  defaultValue: '"Select date"',
                ),
                PropRow(
                  name: 'initialDateRange',
                  type: 'DateTimeRange?',
                  description: 'Pre-selected date range.',
                ),
                PropRow(
                  name: 'onDateRangeSelected',
                  type: 'ValueChanged<DateTimeRange>?',
                  description: 'Callback with the chosen range.',
                  required: true,
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label above the picker.',
                ),
                PropRow(
                  name: 'description',
                  type: 'String?',
                  description: 'Supporting text below the picker.',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Shows a required asterisk.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gInputFieldStatus',
                  description: 'defaultStatus / error / warning / success.',
                  defaultValue: 'defaultStatus',
                ),
                PropRow(
                  name: 'minDate',
                  type: 'DateTime?',
                  description: 'Earliest selectable date.',
                ),
                PropRow(
                  name: 'maxDate',
                  type: 'DateTime?',
                  description: 'Latest selectable date.',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Set false to disable tapping.',
                  defaultValue: 'true',
                ),
              ],
              child: SizedBox(
                width: 300,
                child: Ux4gDatePicker(
                  mode: Ux4gDatePickerMode.range,
                  label: label.isEmpty ? null : label,
                  description: description.isEmpty ? null : description,
                  isRequired: isRequired,
                  status: status,
                  placeholder: placeholder,
                  enabled: enabled,
                  maxDate: DateTime.now(),
                  onDateRangeSelected: (r) => setState(() => selectedRange = r),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Time Picker ───────────────────────────────────────────────────────────────
final timePickerComponent = WidgetbookComponent(
  name: 'TimePicker',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Time Picker',
          description:
              'Time picker allows users to select a specific time or time range. It ensures inputs are formatted correctly and eliminates the need for manual typing. They are frequently used for booking appointments, setting alarms and scheduling calendar events.',
          showPreview: false,
          child: _TimePickerVisualShowcase(),
        );
      },
    ),
    // ── 1. Standard ──────────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Standard',
      builder: (context) {
        TimeOfDay? selected;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'TimePicker — Standard',
              description:
                  'Time picker allows users to select a specific time or time range. It ensures inputs are formatted correctly and eliminates the need for manual typing. They are frequently used for booking appointments, setting alarms and scheduling calendar events.',
              code: '''Ux4gTimePicker(
  placeholder: 'Select time',
  onTimeSelected: (time) {
    print('Selected: \$time');
  },
);''',
              props: const [
                PropRow(
                  name: 'placeholder',
                  type: 'String',
                  description: 'Hint text shown when no time is selected.',
                  defaultValue: '"Select time"',
                ),
                PropRow(
                  name: 'initialTime',
                  type: 'TimeOfDay?',
                  description: 'Pre-selected time.',
                ),
                PropRow(
                  name: 'onTimeSelected',
                  type: 'ValueChanged<TimeOfDay>?',
                  description: 'Callback with the chosen time.',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Set false to disable tapping.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'minuteInterval',
                  type: 'int',
                  description: 'Minute step granularity (1, 5, 10, 15, 30).',
                  defaultValue: '1',
                ),
              ],
              child: SizedBox(
                width: 300,
                child: Ux4gTimePicker(
                  placeholder: 'Select time',
                  enabled: context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  ),
                  onTimeSelected: (t) => setState(() => selected = t),
                ),
              ),
            );
          },
        );
      },
    ),

    // ── 2. 5-Minute Interval ─────────────────────────────────────────────
    WidgetbookUseCase(
      name: '5-Minute Interval',
      builder: (context) {
        TimeOfDay? selected;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'TimePicker — Interval',
              description:
                  'minuteInterval: 5 restricts minute selection to 5-minute steps '
                  '(00, 05, 10 … 55), useful for scheduling UIs.',
              code: '''Ux4gTimePicker(
  placeholder: 'Select time (5m intervals)',
  minuteInterval: 5,
  onTimeSelected: (time) {
    print('Selected: \$time');
  },
);''',
              child: SizedBox(
                width: 300,
                child: Ux4gTimePicker(
                  placeholder: 'Select time (5m intervals)',
                  minuteInterval: context.knobs.list(
                    label: 'Minute interval',
                    options: const [5, 10, 15, 30],
                    initialOption: 5,
                    labelBuilder: (v) => '$v min',
                  ),
                  enabled: context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  ),
                  onTimeSelected: (t) => setState(() => selected = t),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── File Upload ───────────────────────────────────────────────────────────────

final fileUploadComponent = WidgetbookComponent(
  name: 'File Upload',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) => ComponentDocs(
        name: 'File Upload',
        description:
            'File upload allows users to upload and attach one or more files. It shows the upload progress and status of each file.',
        showPreview: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Border Styles',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 360,
              child: Ux4gFileUpload(
                maxFiles: 5,
                maxFileSize: 5 * 1024 * 1024,
                borderStyle: Ux4gFileUploadBorderStyle.solid,
                onFilesChanged: (_) {},
                onUpload: (file) async => true,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 360,
              child: Ux4gFileUpload(
                maxFiles: 5,
                maxFileSize: 5 * 1024 * 1024,
                borderStyle: Ux4gFileUploadBorderStyle.dashed,
                onFilesChanged: (_) {},
                onUpload: (file) async => true,
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final borderStyle = context.knobs.object
            .dropdown<Ux4gFileUploadBorderStyle>(
              label: 'Border Style',
              options: Ux4gFileUploadBorderStyle.values,
              initialOption: Ux4gFileUploadBorderStyle.solid,
            );

        final errorTitle = context.knobs.string(
          label: 'Error Title',
          initialValue: 'Could not scan',
        );

        final errorText = context.knobs.string(
          label: 'Error Text',
          initialValue:
              '[File Name] exceeds the 5MB upload limit. Please compress it or select a smaller file.',
        );

        return ComponentDocs(
          name: 'FileUpload',
          description:
              'File upload allows users to upload and attach one or more files. It shows the upload progress and status of each file.',
          code:
              '''Ux4gFileUpload(
  maxFiles: 5,
  maxFileSize: 5 * 1024 * 1024,  // 5 MB
  allowedExtensions: const ['jpg', 'png', 'pdf'],
  borderStyle: Ux4gFileUploadBorderStyle.${borderStyle.name},
  errorTitle: '$errorTitle',
  errorText: '$errorText',
  onFilesChanged: (files) {
    // files is List<UploadedFile>
  },
  onUpload: (file) async {
    // perform upload logic; return true on success
    return true;
  },
);''',
          props: const [
            PropRow(
              name: 'onFilesChanged',
              type: 'ValueChanged<List<UploadedFile>>?',
              description: 'Called whenever the file list changes.',
              required: true,
            ),
            PropRow(
              name: 'onUpload',
              type: 'Future<bool> Function(UploadedFile)?',
              description:
                  'Handles uploading a single file; return true on success.',
              required: true,
            ),
            PropRow(
              name: 'maxFiles',
              type: 'int',
              description: 'Max number of files allowed.',
              defaultValue: '5',
            ),
            PropRow(
              name: 'maxFileSize',
              type: 'int',
              description: 'Max file size in bytes.',
              defaultValue: '5 MB',
            ),
            PropRow(
              name: 'allowedExtensions',
              type: 'List<String>',
              description: 'List of allowed file extensions.',
              defaultValue: "['jpg', 'png', 'pdf']",
            ),
            PropRow(
              name: 'borderStyle',
              type: 'Ux4gFileUploadBorderStyle',
              description:
                  'Border style for the upload area. Options: solid, dashed.',
              defaultValue: 'solid',
            ),
            PropRow(
              name: 'buttonBorderRadius',
              type: 'double',
              description: 'Border radius for upload buttons.',
              defaultValue: '8',
            ),
            PropRow(
              name: 'buttonColor',
              type: 'Color?',
              description:
                  'Custom color for upload buttons (icon, text, and filled background).',
            ),
            PropRow(
              name: 'buttonBorderColor',
              type: 'Color?',
              description: 'Custom border color for outlined upload buttons.',
            ),
            PropRow(
              name: 'buttonStyle',
              type: 'ButtonStyle?',
              description:
                  'Fully custom ButtonStyle for the upload button. Overrides other button params when provided.',
            ),
            PropRow(
              name: 'errorTitle',
              type: 'String?',
              description: 'Custom title for the error state.',
            ),
            PropRow(
              name: 'errorText',
              type: 'String?',
              description: 'Custom description for the error state.',
            ),
            PropRow(
              name: 'errorTitleStyle',
              type: 'TextStyle?',
              description: 'Custom text style for the error title.',
            ),
            PropRow(
              name: 'errorTextStyle',
              type: 'TextStyle?',
              description: 'Custom text style for the error text.',
            ),
          ],
          child: SizedBox(
            width: 360,
            child: Ux4gFileUpload(
              maxFiles: 5,
              maxFileSize: 5 * 1024 * 1024,
              borderStyle: borderStyle,
              errorTitle: errorTitle,
              errorText: errorText,
              onFilesChanged: (_) {},
              onUpload: (file) async => true,
            ),
          ),
        );
      },
    ),
  ],
);

// ── Radio Introduction ────────────────────────────────────────────────────────

final radioButtonComponent = WidgetbookComponent(
  name: 'Radio',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Radio Button',
          description:
              'Radio Button presents a list of mutually exclusive options where users can make exactly one selection from the group. It supports user interaction by allowing the selection of a single choice out of multiple predefined items, ensuring that users can easily define precise preferences, answer single choice binary questions, and submit forms with distinct clarity.',
          showPreview: false,
          child: _RadioButtonVisualShowcase(),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Interactive',
      builder: (context) {
        String selected = 'Option A';
        return StatefulBuilder(
          builder: (ctx, setState) {
            final isRequired = context.knobs.boolean(
              label: 'Required',
              initialValue: false,
            );
            final enabled = context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            );
            final description = context.knobs.string(
              label: 'Description',
              initialValue: '',
            );
            final size = context.knobs.list(
              label: 'Size',
              options: Ux4gRadioButtonSize.values,
              initialOption: Ux4gRadioButtonSize.medium,
              labelBuilder: (s) => s.name,
            );
            final descriptionVariant = context.knobs.list(
              label: 'Description Variant',
              options: Ux4gRadioButtonDescriptionVariant.values,
              initialOption: Ux4gRadioButtonDescriptionVariant.helper,
              labelBuilder: (s) => s.name,
            );
            final status = context.knobs.list(
              label: 'Status',
              options: Ux4gRadioButtonStatus.values,
              initialOption: Ux4gRadioButtonStatus.defaultStatus,
              labelBuilder: (s) => s.name,
            );

            final descStr = description.isEmpty ? 'null' : "'$description'";
            final codeStr =
                '''Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Ux4gRadioButton(
      value: 'Option A',
      groupValue: selected,
      onChanged: (val) => setState(() => selected = val!),
      label: 'Option A',
      description: $descStr,
      size: Ux4gRadioButtonSize.${size.name},
      isRequired: $isRequired,
      enabled: $enabled,
      descriptionVariant: Ux4gRadioButtonDescriptionVariant.${descriptionVariant.name},
      status: Ux4gRadioButtonStatus.${status.name},
    ),
    const SizedBox(height: 8),
    Ux4gRadioButton(
      value: 'Option B',
      groupValue: selected,
      onChanged: (val) => setState(() => selected = val!),
      label: 'Option B',
      description: $descStr,
      size: Ux4gRadioButtonSize.${size.name},
      isRequired: $isRequired,
      enabled: $enabled,
      descriptionVariant: Ux4gRadioButtonDescriptionVariant.${descriptionVariant.name},
      status: Ux4gRadioButtonStatus.${status.name},
    ),
    const SizedBox(height: 8),
    Ux4gRadioButton(
      value: 'Option C',
      groupValue: selected,
      onChanged: (val) => setState(() => selected = val!),
      label: 'Option C',
      description: $descStr,
      size: Ux4gRadioButtonSize.${size.name},
      isRequired: $isRequired,
      enabled: $enabled,
      descriptionVariant: Ux4gRadioButtonDescriptionVariant.${descriptionVariant.name},
      status: Ux4gRadioButtonStatus.${status.name},
    ),
  ],
)''';

            return ComponentDocs(
              name: 'RadioButton',
              description:
                  'Radio Button presents a list of mutually exclusive options where users can make exactly one selection from the group. It supports user interaction by allowing the selection of a single choice out of multiple predefined items, ensuring that users can easily define precise preferences, answer single choice binary questions, and submit forms with distinct clarity.',
              code: codeStr,
              props: const [
                PropRow(
                  name: 'value',
                  type: 'String',
                  description: "This radio's value.",
                  required: true,
                ),
                PropRow(
                  name: 'groupValue',
                  type: 'String?',
                  description: 'Currently selected value in the group.',
                  required: true,
                ),
                PropRow(
                  name: 'onChanged',
                  type: 'ValueChanged<String>?',
                  description: 'Called when this radio is selected.',
                ),
                PropRow(
                  name: 'label',
                  type: 'String?',
                  description: 'Label text.',
                ),
                PropRow(
                  name: 'description',
                  type: 'String?',
                  description: 'Helper / status text below label.',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gRadioButtonSize',
                  description: 'small / medium / large.',
                  defaultValue: 'medium',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'isRequired',
                  type: 'bool',
                  description: 'Shows a required asterisk.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'descriptionVariant',
                  type: 'Ux4gRadioButtonDescriptionVariant',
                  description: 'helper / error / warning / success.',
                  defaultValue: 'helper',
                ),
                PropRow(
                  name: 'status',
                  type: 'Ux4gRadioButtonStatus',
                  description: 'Status of the radio outline (error/warning).',
                  defaultValue: 'defaultStatus',
                ),
              ],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ['Option A', 'Option B', 'Option C']
                    .map(
                      (v) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Ux4gRadioButton(
                          value: v,
                          groupValue: selected,
                          onChanged: (val) => setState(() => selected = val!),
                          label: v,
                          description: description.isEmpty ? null : description,
                          isRequired: isRequired,
                          enabled: enabled,
                          size: size,
                          descriptionVariant: descriptionVariant,
                          status: status,
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'All sizes',
      builder: (context) => ComponentDocs(
        name: 'RadioButton — Sizes',
        description: 'Small, medium, and large radio buttons shown together.',
        code:
            '''Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Small',  size: Ux4gRadioButtonSize.small);
Ux4gRadioButton(value: 'b', groupValue: 'b', onChanged: (_) {}, label: 'Medium', size: Ux4gRadioButtonSize.medium);
Ux4gRadioButton(value: 'c', groupValue: 'c', onChanged: (_) {}, label: 'Large',  size: Ux4gRadioButtonSize.large);''',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Small',
              size: Ux4gRadioButtonSize.small,
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'b',
              groupValue: 'b',
              onChanged: (_) {},
              label: 'Medium',
              size: Ux4gRadioButtonSize.medium,
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'c',
              groupValue: 'c',
              onChanged: (_) {},
              label: 'Large',
              size: Ux4gRadioButtonSize.large,
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Description variants',
      builder: (context) => ComponentDocs(
        name: 'RadioButton — Description Variants',
        description:
            'Each variant applies a semantic colour to the helper text. '
            'Pair with [status] so the radio circle colour matches.',
        code:
            '''Ux4gRadioButton(value: 'helper', groupValue: 'helper', onChanged: (_) {}, label: 'Helper',  description: 'helper description text');
Ux4gRadioButton(value: 'error',  groupValue: 'error',  onChanged: (_) {}, label: 'Error',   description: 'error description text',  descriptionVariant: Ux4gRadioButtonDescriptionVariant.error,  status: Ux4gRadioButtonStatus.error);
Ux4gRadioButton(value: 'warning', groupValue: 'warning', onChanged: (_) {}, label: 'Warning', description: 'warning description text', descriptionVariant: Ux4gRadioButtonDescriptionVariant.warning, status: Ux4gRadioButtonStatus.warning);
Ux4gRadioButton(value: 'success', groupValue: 'success', onChanged: (_) {}, label: 'Success', description: 'success description text', descriptionVariant: Ux4gRadioButtonDescriptionVariant.success, status: Ux4gRadioButtonStatus.success);''',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Ux4gRadioButtonDescriptionVariant.values.map((
            Ux4gRadioButtonDescriptionVariant v,
          ) {
            // Map description variant → matching radio status so the
            // circle uses the same semantic colour from our palette.
            final status = switch (v) {
              Ux4gRadioButtonDescriptionVariant.error =>
                Ux4gRadioButtonStatus.error,
              Ux4gRadioButtonDescriptionVariant.warning =>
                Ux4gRadioButtonStatus.warning,
              Ux4gRadioButtonDescriptionVariant.success =>
                Ux4gRadioButtonStatus.success,
              Ux4gRadioButtonDescriptionVariant.helper =>
                Ux4gRadioButtonStatus.defaultStatus,
            };
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Ux4gRadioButton(
                value: v.name,
                groupValue: v.name,
                onChanged: (_) {},
                label: v.name[0].toUpperCase() + v.name.substring(1),
                description: '${v.name} description text',
                descriptionVariant: v,
                status: status,
              ),
            );
          }).toList(),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => ComponentDocs(
        name: 'RadioButton — Disabled',
        description: 'Disabled radio buttons cannot be interacted with.',
        code:
            '''Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Disabled (selected)',            enabled: false);
Ux4gRadioButton(value: 'b', groupValue: 'a', onChanged: (_) {}, label: 'Disabled (unselected)',          enabled: false);
Ux4gRadioButton(value: 'c', groupValue: 'c', onChanged: (_) {}, label: 'Disabled (selected) required',   enabled: false, isRequired: true);
Ux4gRadioButton(value: 'd', groupValue: 'a', onChanged: (_) {}, label: 'Disabled (unselected) required', enabled: false, isRequired: true);''',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Disabled (selected)',
              enabled: false,
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'b',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Disabled (unselected)',
              enabled: false,
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'c',
              groupValue: 'c',
              onChanged: (_) {},
              label: 'Disabled (selected) required',
              enabled: false,
              isRequired: true,
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'd',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Disabled (unselected) required',
              enabled: false,
              isRequired: true,
            ),
          ],
        ),
      ),
    ),

    // ── Status: error / warning / success ───────────────────────────────
    WidgetbookUseCase(
      name: 'Status states',
      builder: (context) => ComponentDocs(
        name: 'RadioButton — Status',
        description:
            'The [status] prop drives the radio circle color so callers '
            'can show error / warning / success states alongside selection. '
            'Works for both selected and unselected radios.',
        code: '''// Selected
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Default (purple)'),
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Error',  status: Ux4gRadioButtonStatus.error),
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Warning', status: Ux4gRadioButtonStatus.warning),
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Success', status: Ux4gRadioButtonStatus.success),

// Unselected
Ux4gRadioButton(value: 'a', groupValue: 'b', onChanged: (_) {}, label: 'Default'),
Ux4gRadioButton(value: 'a', groupValue: 'b', onChanged: (_) {}, label: 'Error',  status: Ux4gRadioButtonStatus.error),
Ux4gRadioButton(value: 'a', groupValue: 'b', onChanged: (_) {}, label: 'Warning', status: Ux4gRadioButtonStatus.warning),
Ux4gRadioButton(value: 'a', groupValue: 'b', onChanged: (_) {}, label: 'Success', status: Ux4gRadioButtonStatus.success),''',
        props: const [
          PropRow(
            name: 'status',
            type: 'Ux4gRadioButtonStatus',
            description:
                'defaultStatus / error / warning / success — drives the radio circle color.',
            defaultValue: 'defaultStatus',
          ),
        ],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selected',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Default (purple)',
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Error',
              status: Ux4gRadioButtonStatus.error,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Warning',
              status: Ux4gRadioButtonStatus.warning,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Success',
              status: Ux4gRadioButtonStatus.success,
            ),
            const SizedBox(height: 16),
            const Text(
              'Unselected',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'b',
              onChanged: (_) {},
              label: 'Default',
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'b',
              onChanged: (_) {},
              label: 'Error',
              status: Ux4gRadioButtonStatus.error,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'b',
              onChanged: (_) {},
              label: 'Warning',
              status: Ux4gRadioButtonStatus.warning,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'b',
              onChanged: (_) {},
              label: 'Success',
              status: Ux4gRadioButtonStatus.success,
            ),
          ],
        ),
      ),
    ),

    // ── Custom color override ───────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Custom color',
      builder: (context) => ComponentDocs(
        name: 'RadioButton — Custom Color',
        description:
            'Use [color] to override the radio circle color (overrides '
            '[status] and theme primary). Use [labelColor] to override '
            'the label text color. Useful for brand-specific accents '
            'outside the standard status palette.',
        code:
            '''Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Teal',   color: Colors.teal,       labelColor: Colors.teal.shade700),
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Pink',   color: Colors.pink,       labelColor: Colors.pink.shade700),
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Orange', color: Colors.deepOrange,  labelColor: Colors.deepOrange.shade700),
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Indigo', color: Colors.indigo),

// Mixed selected + unselected
Ux4gRadioButton(value: 'a', groupValue: 'a', onChanged: (_) {}, label: 'Teal (selected)',   color: Colors.teal),
Ux4gRadioButton(value: 'a', groupValue: 'b', onChanged: (_) {}, label: 'Teal (unselected)', color: Colors.teal),''',
        props: const [
          PropRow(
            name: 'color',
            type: 'Color?',
            description:
                'Override for the radio circle color. Takes precedence over status and theme primary.',
          ),
          PropRow(
            name: 'labelColor',
            type: 'Color?',
            description: 'Override for the label text color.',
          ),
        ],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Teal',
              color: Colors.teal,
              labelColor: Colors.teal.shade700,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Pink',
              color: Colors.pink,
              labelColor: Colors.pink.shade700,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Orange',
              color: Colors.deepOrange,
              labelColor: Colors.deepOrange.shade700,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Indigo',
              color: Colors.indigo,
            ),
            const SizedBox(height: 16),
            const Text(
              'Mixed selected + unselected',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'a',
              onChanged: (_) {},
              label: 'Teal (selected)',
              color: Colors.teal,
            ),
            const SizedBox(height: 4),
            Ux4gRadioButton(
              value: 'a',
              groupValue: 'b',
              onChanged: (_) {},
              label: 'Teal (unselected)',
              color: Colors.teal,
            ),
          ],
        ),
      ),
    ),
  ],
);

class _DatePickerVisualShowcase extends StatefulWidget {
  const _DatePickerVisualShowcase();

  @override
  State<_DatePickerVisualShowcase> createState() =>
      _DatePickerVisualShowcaseState();
}

class _DatePickerVisualShowcaseState extends State<_DatePickerVisualShowcase> {
  DateTime? _singleDate;
  DateTimeRange? _dateRange;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of single date picker and date range picker components with explicit labels.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),
          // Single Date Picker Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2130) : Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: isDark
                    ? const Color(0xFF2D3348)
                    : const Color(0xFFE5E7EB),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Single Date Picker',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Ux4gDatePicker(
                    mode: Ux4gDatePickerMode.single,
                    label: 'Select Date',
                    placeholder: 'DD/MM/YYYY',
                    isRequired: true,
                    description: 'Select a single date from the calendar.',
                    initialDate: _singleDate,
                    onDateSelected: (date) {
                      setState(() {
                        _singleDate = date;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Date Range Picker Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2130) : Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: isDark
                    ? const Color(0xFF2D3348)
                    : const Color(0xFFE5E7EB),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date Range Picker',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Ux4gDatePicker(
                    mode: Ux4gDatePickerMode.range,
                    label: 'Select Date Range',
                    placeholder: 'DD/MM/YYYY – DD/MM/YYYY',
                    isRequired: true,
                    description:
                        'Select start and end dates for your trip or reservation.',
                    initialDateRange: _dateRange,
                    onDateRangeSelected: (range) {
                      setState(() {
                        _dateRange = range;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioButtonVisualShowcase extends StatefulWidget {
  const _RadioButtonVisualShowcase();

  @override
  State<_RadioButtonVisualShowcase> createState() =>
      _RadioButtonVisualShowcaseState();
}

class _RadioButtonVisualShowcaseState
    extends State<_RadioButtonVisualShowcase> {
  String _leftSelected = 'success';
  String _rightSelected = 'opt3';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of radio button options with helper descriptions, success status, and interactive states.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2130) : Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: isDark
                    ? const Color(0xFF2D3348)
                    : const Color(0xFFE5E7EB),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Wrap(
              spacing: 64,
              runSpacing: 24,
              children: [
                // Left Column
                SizedBox(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ux4gRadioButton<String>(
                        label: 'Helper',
                        description: 'Helper text',
                        descriptionVariant:
                            Ux4gRadioButtonDescriptionVariant.helper,
                        value: 'helper',
                        groupValue: _leftSelected,
                        onChanged: (val) {
                          if (val != null) setState(() => _leftSelected = val);
                        },
                      ),
                      const SizedBox(height: 24),
                      Ux4gRadioButton<String>(
                        label: 'Success',
                        description: 'Success text',
                        descriptionVariant:
                            Ux4gRadioButtonDescriptionVariant.success,
                        status: Ux4gRadioButtonStatus.success,
                        value: 'success',
                        groupValue: _leftSelected,
                        onChanged: (val) {
                          if (val != null) setState(() => _leftSelected = val);
                        },
                      ),
                    ],
                  ),
                ),

                // Right Column
                SizedBox(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ux4gRadioButton<String>(
                        label: 'Option One',
                        description: 'First option description',
                        descriptionVariant:
                            Ux4gRadioButtonDescriptionVariant.helper,
                        value: 'opt1',
                        groupValue: _rightSelected,
                        onChanged: (val) {
                          if (val != null) setState(() => _rightSelected = val);
                        },
                      ),
                      const SizedBox(height: 24),
                      Ux4gRadioButton<String>(
                        label: 'Option Three',
                        description: 'Third option description',
                        descriptionVariant:
                            Ux4gRadioButtonDescriptionVariant.helper,
                        value: 'opt3',
                        groupValue: _rightSelected,
                        onChanged: (val) {
                          if (val != null) setState(() => _rightSelected = val);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchVisualShowcase extends StatefulWidget {
  const _SearchVisualShowcase();

  @override
  State<_SearchVisualShowcase> createState() => _SearchVisualShowcaseState();
}

class _SearchVisualShowcaseState extends State<_SearchVisualShowcase> {
  String _basicQuery = '';
  String _submitQuery = '';
  String _submittedText = '';
  String _autocompleteQuery = '';
  String _selectedOption = '';

  final List<String> _govServices = const [
    'Aadhaar Card Update',
    'PAN Card Application',
    'Passport Renewal',
    'Voter ID Registration',
    'Driving License Renewal',
    'Ration Card Transfer',
    'Birth Certificate Download',
    'Income Certificate Verification',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of search field variants including basic search, search with submit button, autocomplete with live dropdown, and status validation.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),

          // 1. Basic Instant Search
          _buildSearchCard(
            title: '1. Basic Search',
            description:
                'Instant live filtering search bar with clear & voice action triggers.',
            isDark: isDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ux4gSearchField(
                  value: _basicQuery,
                  onValueChange: (v) => setState(() => _basicQuery = v),
                  placeholder: 'Search government services...',
                  variant: Ux4gSearchFieldVariant.basicSearch,
                ),
                if (_basicQuery.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    'Searching for: "$_basicQuery"',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4F46E5),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 2. Search with Submit Button
          _buildSearchCard(
            title: '2. Search with Submit Button',
            description:
                'Search field with an integrated submit CTA button to fire explicit queries.',
            isDark: isDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ux4gSearchField(
                  value: _submitQuery,
                  onValueChange: (v) => setState(() => _submitQuery = v),
                  placeholder: 'Enter application reference ID...',
                  variant: Ux4gSearchFieldVariant.searchWithSubmit,
                  onSubmitClick: (q) => setState(() => _submittedText = q),
                ),
                if (_submittedText.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Submitted Query: "$_submittedText"',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3730A3),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 3. Autocomplete Search
          _buildSearchCard(
            title: '3. Autocomplete Dropdown Search',
            description:
                'Search field with live dropdown autocomplete suggestions list.',
            isDark: isDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ux4gSearchField(
                  value: _autocompleteQuery,
                  onValueChange: (v) => setState(() => _autocompleteQuery = v),
                  placeholder:
                      'Type to search services (e.g. Aadhaar, Passport)...',
                  variant: Ux4gSearchFieldVariant.autocomplete,
                  options: _govServices,
                  onOptionSelected: (selected) =>
                      setState(() => _selectedOption = selected),
                ),
                if (_selectedOption.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    'Selected Option: "$_selectedOption"',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF166534),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 4. Status Validation Variants
          _buildSearchCard(
            title: '4. Status & Validation States',
            description:
                'Search fields indicating error, warning, and success validation feedback.',
            isDark: isDark,
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                SizedBox(
                  width: 320,
                  child: Ux4gSearchField(
                    value: '12345',
                    onValueChange: (_) {},
                    placeholder: 'Enter valid ID',
                    label: 'Error State',
                    caption: 'Invalid reference number format',
                    status: Ux4gSearchFieldStatus.error,
                  ),
                ),
                SizedBox(
                  width: 320,
                  child: Ux4gSearchField(
                    value: 'APP-99',
                    onValueChange: (_) {},
                    placeholder: 'Search ID',
                    label: 'Success State',
                    caption: 'Application found and verified',
                    status: Ux4gSearchFieldStatus.success,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard({
    required String title,
    required String description,
    required Widget child,
    bool isDark = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Colors.white60 : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _SliderVisualShowcase extends StatefulWidget {
  const _SliderVisualShowcase();

  @override
  State<_SliderVisualShowcase> createState() => _SliderVisualShowcaseState();
}

class _SliderVisualShowcaseState extends State<_SliderVisualShowcase> {
  double _smallVal = 40.0;
  double _mediumVal = 60.0;
  RangeValues _rangeVals = const RangeValues(20.0, 80.0);
  double _inputVal = 45.0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of slider size variants, tick marks, range selectors, and editable input fields.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),

          // 1. Small Slider (Matching Design Image)
          _buildSliderCard(
            title: 'Small',
            isDark: isDark,
            child: Ux4gSlider(
              value: _smallVal,
              min: 0,
              max: 100,
              steps: 9,
              size: Ux4gSliderSize.small,
              label: 'Label',
              isRequired: true,
              labelIcon: Icons.info_outline,
              showMarksAndValues: true,
              showValueLabels: true,
              caption: 'Description',
              onValueChange: (v) => setState(() => _smallVal = v),
            ),
          ),
          const SizedBox(height: 24),

          // 2. Medium Slider
          _buildSliderCard(
            title: 'Medium',
            isDark: isDark,
            child: Ux4gSlider(
              value: _mediumVal,
              min: 0,
              max: 100,
              steps: 9,
              size: Ux4gSliderSize.medium,
              label: 'Label',
              isRequired: true,
              labelIcon: Icons.info_outline,
              showMarksAndValues: true,
              showValueLabels: true,
              caption: 'Description',
              onValueChange: (v) => setState(() => _mediumVal = v),
            ),
          ),
          const SizedBox(height: 24),

          // 3. Range Slider
          _buildSliderCard(
            title: 'Range Slider',
            isDark: isDark,
            child: Ux4gRangeSlider(
              values: _rangeVals,
              min: 0,
              max: 100,
              steps: 9,
              size: Ux4gSliderSize.medium,
              label: 'Selection Range',
              showMarksAndValues: true,
              onValueChange: (v) => setState(() => _rangeVals = v),
            ),
          ),
          const SizedBox(height: 24),

          // 4. Slider with Editable Input Fields
          _buildSliderCard(
            title: 'With Editable Input Fields',
            isDark: isDark,
            child: Ux4gSlider(
              value: _inputVal,
              min: 0,
              max: 100,
              steps: 9,
              size: Ux4gSliderSize.medium,
              label: 'Custom Value',
              showInputFields: true,
              showMarksAndValues: true,
              caption: 'Type value directly or drag handle',
              onValueChange: (v) => setState(() => _inputVal = v),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderCard({
    required String title,
    required Widget child,
    bool isDark = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _SwitchVisualShowcase extends StatefulWidget {
  const _SwitchVisualShowcase();

  @override
  State<_SwitchVisualShowcase> createState() => _SwitchVisualShowcaseState();
}

class _SwitchVisualShowcaseState extends State<_SwitchVisualShowcase> {
  bool _rightLabelVal = true;
  bool _leftLabelVal = true;
  bool _bothSidesVal = true;
  bool _noLabelVal = true;

  bool _smallVal = true;
  bool _mediumVal = true;
  bool _largeVal = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of switch layout variants (Right, Left, Both Sides, No Label), sizes, and state configurations.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),

          // 1. Layout Variants
          _buildSwitchCard(
            title: 'Layout & Label Position Variants',
            description:
                'Support for right-aligned label, left-aligned label, dual-sided labels, and standalone icon switch.',
            isDark: isDark,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Right Label',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    Ux4gSwitch(
                      checked: _rightLabelVal,
                      onCheckedChange: (v) =>
                          setState(() => _rightLabelVal = v),
                      label: 'Push Notifications',
                      labelPosition: Ux4gSwitchLabelPosition.right,
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Left Label',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    Ux4gSwitch(
                      checked: _leftLabelVal,
                      onCheckedChange: (v) => setState(() => _leftLabelVal = v),
                      label: 'Dark Mode Theme',
                      labelPosition: Ux4gSwitchLabelPosition.left,
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Both Sides Labels',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    Ux4gSwitch(
                      checked: _bothSidesVal,
                      onCheckedChange: (v) => setState(() => _bothSidesVal = v),
                      labelPosition: Ux4gSwitchLabelPosition.bothSides,
                      label: 'Off',
                      secondaryLabel: 'On',
                    ),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No Label (Standalone)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    Ux4gSwitch(
                      checked: _noLabelVal,
                      onCheckedChange: (v) => setState(() => _noLabelVal = v),
                      labelPosition: Ux4gSwitchLabelPosition.noLabel,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 2. Sizes & Disabled States
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              SizedBox(
                width: 360,
                child: _buildSwitchCard(
                  title: 'Size Scale',
                  description:
                      'Small (S), Medium (M), and Large (L) switch dimensions.',
                  isDark: isDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ux4gSwitch(
                        checked: _smallVal,
                        onCheckedChange: (v) => setState(() => _smallVal = v),
                        label: 'Small Switch',
                        size: Ux4gSwitchSize.s,
                      ),
                      const SizedBox(height: 16),
                      Ux4gSwitch(
                        checked: _mediumVal,
                        onCheckedChange: (v) => setState(() => _mediumVal = v),
                        label: 'Medium Switch',
                        size: Ux4gSwitchSize.m,
                      ),
                      const SizedBox(height: 16),
                      Ux4gSwitch(
                        checked: _largeVal,
                        onCheckedChange: (v) => setState(() => _largeVal = v),
                        label: 'Large Switch',
                        size: Ux4gSwitchSize.l,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 360,
                child: _buildSwitchCard(
                  title: 'Disabled States',
                  description: 'Non-interactive switch states.',
                  isDark: isDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Ux4gSwitch(
                        checked: true,
                        onCheckedChange: null,
                        label: 'Disabled (On)',
                        size: Ux4gSwitchSize.m,
                      ),
                      SizedBox(height: 16),
                      Ux4gSwitch(
                        checked: false,
                        onCheckedChange: null,
                        label: 'Disabled (Off)',
                        size: Ux4gSwitchSize.m,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchCard({
    required String title,
    required String description,
    required Widget child,
    bool isDark = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white60 : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class _TimePickerVisualShowcase extends StatefulWidget {
  const _TimePickerVisualShowcase();

  @override
  State<_TimePickerVisualShowcase> createState() =>
      _TimePickerVisualShowcaseState();
}

class _TimePickerVisualShowcaseState extends State<_TimePickerVisualShowcase> {
  TimeOfDay? _t1;
  TimeOfDay? _t2 = const TimeOfDay(hour: 9, minute: 30);
  TimeOfDay? _t3;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of time picker fields with pre-selected times, custom minute intervals, and interactive selection.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              // 1. Default Time Picker
              _buildTimePickerCard(
                title: 'Default Time Picker',
                description: 'Standard interactive time selector field.',
                isDark: isDark,
                child: SizedBox(
                  width: 340,
                  child: Ux4gTimePicker(
                    placeholder: 'Select preferred appointment time...',
                    onTimeSelected: (t) => setState(() => _t1 = t),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Pre-Selected Time Field
              _buildTimePickerCard(
                title: 'Pre-Selected Time',
                description: 'Time picker initialized with 09:30 AM.',
                isDark: isDark,
                child: SizedBox(
                  width: 340,
                  child: Ux4gTimePicker(
                    initialTime: _t2,
                    onTimeSelected: (t) => setState(() => _t2 = t),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 3. 15-Minute Interval
              _buildTimePickerCard(
                title: '15-Minute Interval Slot',
                description:
                    'Time selector restricted to 15-minute slot increments.',
                isDark: isDark,
                child: SizedBox(
                  width: 340,
                  child: Ux4gTimePicker(
                    placeholder: 'Select slot time (15-min intervals)...',
                    minuteInterval: 15,
                    onTimeSelected: (t) => setState(() => _t3 = t),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimePickerCard({
    required String title,
    required String description,
    required Widget child,
    bool isDark = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white60 : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
