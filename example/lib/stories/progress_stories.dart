import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ── Introduction ──────────────────────────────────────────────────────────────

final progressIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Overview',
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Progress Indicator',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Progress indicators inform users about the status of ongoing processes by providing visual feedback about the progress of a task or operation. It is commonly seen in design patterns like: File uploads, Password strength etc.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black87,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Examples',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Linear Progress Bar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    const SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Basic',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Ux4gLinearProgressBar(value: 0.4),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'With Labels & Percentage',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Ux4gLinearProgressBar(
                            value: 0.75,
                            label: 'Uploading...',
                            hint: 'Almost done',
                            showPercentage: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Inside Label',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Ux4gLinearProgressBar(
                            value: 0.8,
                            showPercentage: true,
                            labelPosition: Ux4gProgressLabelPosition.inside,
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                const Text(
                  'Circular Progress Indicator',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const Wrap(
                  spacing: 48,
                  runSpacing: 32,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Small',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16),
                        Ux4gCircularProgress(
                          value: 0.4,
                          size: Ux4gCircularProgressSize.s,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Medium w/ Text',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16),
                        Ux4gCircularProgress(
                          value: 0.65,
                          centerValueText: '65%',
                          size: Ux4gCircularProgressSize.m,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Large w/ Label',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16),
                        Ux4gCircularProgress(
                          value: 0.8,
                          centerValueText: '80%',
                          label: 'Loading',
                          size: Ux4gCircularProgressSize.l,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Extra Large',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16),
                        Ux4gCircularProgress(
                          value: 0.9,
                          centerValueText: '90%',
                          label: 'Almost Done',
                          size: Ux4gCircularProgressSize.xl,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                const Text(
                  'Half Circle Progress',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const Wrap(
                  spacing: 48,
                  runSpacing: 32,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Standard',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16),
                        Ux4gHalfCircleProgress(
                          value: 0.5,
                          size: Ux4gHalfCircleProgressSize.m,
                          valueText: '50%',
                          description: 'Halfway there',
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'With Scale',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 16),
                        Ux4gHalfCircleProgress(
                          value: 0.85,
                          size: Ux4gHalfCircleProgressSize.l,
                          valueText: '85%',
                          description: 'Excellent',
                          showScale: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  ],
);

// ── Linear Progress ───────────────────────────────────────────────────────────
final linearProgressComponent = WidgetbookComponent(
  name: 'Standard',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'LinearProgressBar',
        description:
            'Linear Progress indicators inform users about the status of ongoing processes by providing visual feedback about the progress of a task or operation. It is commonly seen in design patterns like: File uploads, Password strength etc.',
        code: '''Ux4gLinearProgressBar(
  value: 0.6,                       // 0.0 – 1.0
  showPercentage: true,
  shape: Ux4gProgressShape.rounded,
);

// With label and icon
Ux4gLinearProgressBar(
  value: 0.75,
  label: 'Uploading...',
  hint: 'Almost done',
  icon: Icons.cloud_upload_outlined,
  showPercentage: true,
);

// Animated
Ux4gAnimatedLinearProgressBar(value: 0.6);''',
        props: const [
          PropRow(
            name: 'value',
            type: 'double',
            description: 'Progress from 0.0 to 1.0.',
            required: true,
          ),
          PropRow(
            name: 'icon',
            type: 'IconData?',
            description: 'Leading icon above the bar.',
          ),
          PropRow(
            name: 'iconColor',
            type: 'Color?',
            description: 'Color of the leading icon.',
          ),
          PropRow(
            name: 'iconBackgroundColor',
            type: 'Color?',
            description: 'Background circle color for the icon.',
          ),
          PropRow(
            name: 'label',
            type: 'String?',
            description: 'Text above the bar.',
          ),
          PropRow(
            name: 'hint',
            type: 'String?',
            description: 'Secondary text below.',
          ),
          PropRow(
            name: 'height',
            type: 'double',
            description: 'Thickness of the bar.',
            defaultValue: '8',
          ),
          PropRow(
            name: 'shape',
            type: 'Ux4gProgressShape',
            description: 'sharp or rounded.',
            defaultValue: 'rounded',
          ),
          PropRow(
            name: 'customBorderRadius',
            type: 'double?',
            description: 'Override for corner roundness.',
          ),
          PropRow(
            name: 'color',
            type: 'Color?',
            description: 'Solid fill color.',
          ),
          PropRow(
            name: 'gradientColors',
            type: 'List<Color>?',
            description: 'Gradient fill colors (overrides color).',
          ),
          PropRow(
            name: 'trackColor',
            type: 'Color?',
            description: 'Background track color.',
          ),
          PropRow(
            name: 'showPercentage',
            type: 'bool',
            description: 'Show percentage text.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'labelPosition',
            type: 'Ux4gProgressLabelPosition',
            description: 'outside or inside.',
            defaultValue: 'outside',
          ),
          PropRow(
            name: 'insideLabelStyle',
            type: 'TextStyle?',
            description: 'Style for percentage text when inside.',
          ),
        ],
        child: SizedBox(
          width: 300,
          child: Ux4gLinearProgressBar(
            value: context.knobs.double.slider(
              label: 'Value',
              initialValue: 0.6,
              min: 0,
              max: 1,
            ),
            showPercentage: context.knobs.boolean(
              label: 'Show %',
              initialValue: true,
            ),
            shape: context.knobs.list(
              label: 'Shape',
              options: Ux4gProgressShape.values,
              initialOption: Ux4gProgressShape.rounded,
              labelBuilder: (v) => v.name,
            ),
          ),
        ),
      ),
    ),
  ],
);

final animatedLinearProgressComponent = WidgetbookComponent(
  name: 'AnimatedLinearProgress',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'AnimatedLinearProgressBar',
        description: 'Animated version of the linear progress bar.',
        code: '''Ux4gAnimatedLinearProgressBar(value: 0.6);''',
        props: const [
          PropRow(
            name: 'value',
            type: 'double',
            description: 'Progress from 0.0 to 1.0.',
            required: true,
          ),
          PropRow(
            name: 'icon',
            type: 'IconData?',
            description: 'Leading icon above the bar.',
          ),
          PropRow(
            name: 'iconColor',
            type: 'Color?',
            description: 'Color of the leading icon.',
          ),
          PropRow(
            name: 'iconBackgroundColor',
            type: 'Color?',
            description: 'Background circle color for the icon.',
          ),
          PropRow(
            name: 'label',
            type: 'String?',
            description: 'Text above the bar.',
          ),
          PropRow(
            name: 'hint',
            type: 'String?',
            description: 'Secondary text below.',
          ),
          PropRow(
            name: 'height',
            type: 'double',
            description: 'Thickness of the bar.',
            defaultValue: '8',
          ),
          PropRow(
            name: 'shape',
            type: 'Ux4gProgressShape',
            description: 'sharp or rounded.',
            defaultValue: 'rounded',
          ),
          PropRow(
            name: 'customBorderRadius',
            type: 'double?',
            description: 'Override for corner roundness.',
          ),
          PropRow(
            name: 'color',
            type: 'Color?',
            description: 'Solid fill color.',
          ),
          PropRow(
            name: 'gradientColors',
            type: 'List<Color>?',
            description: 'Gradient fill colors (overrides color).',
          ),
          PropRow(
            name: 'trackColor',
            type: 'Color?',
            description: 'Background track color.',
          ),
          PropRow(
            name: 'showPercentage',
            type: 'bool',
            description: 'Show percentage text.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'labelPosition',
            type: 'Ux4gProgressLabelPosition',
            description: 'outside or inside.',
            defaultValue: 'outside',
          ),
          PropRow(
            name: 'insideLabelStyle',
            type: 'TextStyle?',
            description: 'Style for percentage text when inside.',
          ),
          PropRow(
            name: 'duration',
            type: 'Duration',
            description: 'Animation duration.',
            defaultValue: '600ms',
          ),
          PropRow(
            name: 'curve',
            type: 'Curve',
            description: 'Animation curve.',
            defaultValue: 'easeInOut',
          ),
        ],
        child: SizedBox(
          width: 300,
          child: Ux4gAnimatedLinearProgressBar(
            value: context.knobs.double.slider(
              label: 'Value',
              initialValue: 0.6,
              min: 0,
              max: 1,
            ),
          ),
        ),
      ),
    ),
  ],
);

final linearProgressBarComponent = linearProgressComponent;
final animatedLinearProgressBarComponent = animatedLinearProgressComponent;

// ── Circular Progress ─────────────────────────────────────────────────────────

final circularProgressComponent = WidgetbookComponent(
  name: 'Standard',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'CircularProgress',
        description:
            'Circular Progress indicators inform users about the status of ongoing processes by providing visual feedback about the progress of a task or operation. It is commonly seen in design patterns like: File uploads, Password strength etc.',
        code: '''Ux4gCircularProgress(
  value: 0.65,
  centerValueText: '65%',
  label: 'Progress',
  size: Ux4gCircularProgressSize.m,
);''',
        props: const [
          PropRow(
            name: 'value',
            type: 'double',
            description: 'Progress from 0.0 to 1.0.',
            required: true,
          ),
          PropRow(
            name: 'size',
            type: 'Ux4gCircularProgressSize',
            description: 'xs / s / m / l / xl / xxl / xxxl.',
            defaultValue: 'l',
          ),
          PropRow(
            name: 'diameter',
            type: 'double?',
            description: 'Custom diameter override.',
          ),
          PropRow(
            name: 'strokeWidth',
            type: 'double?',
            description: 'Custom arc thickness override.',
          ),
          PropRow(
            name: 'progressColor',
            type: 'Color?',
            description: 'Color of the progress arc.',
          ),
          PropRow(
            name: 'trackColor',
            type: 'Color?',
            description: 'Color of the background track.',
          ),
          PropRow(
            name: 'progressGradient',
            type: 'Gradient?',
            description: 'Gradient fill for the progress arc.',
          ),
          PropRow(
            name: 'strokeCap',
            type: 'StrokeCap',
            description: 'butt / round / square.',
            defaultValue: 'butt',
          ),
          PropRow(
            name: 'startAngle',
            type: 'double',
            description: 'Starting angle in radians.',
            defaultValue: '-π/2',
          ),
          PropRow(
            name: 'centerValueText',
            type: 'String?',
            description: 'Large text inside/below the circle.',
          ),
          PropRow(
            name: 'centerDescription',
            type: 'String?',
            description: 'Smaller text below centerValueText.',
          ),
          PropRow(
            name: 'center',
            type: 'Widget?',
            description: 'Custom widget inside the circle.',
          ),
          PropRow(
            name: 'label',
            type: 'String?',
            description: 'Main title below the circle.',
          ),
          PropRow(
            name: 'description',
            type: 'String?',
            description: 'Supporting text below the label.',
          ),
          PropRow(
            name: 'footer',
            type: 'Widget?',
            description: 'Widget shown at the very bottom.',
          ),
          PropRow(
            name: 'padding',
            type: 'EdgeInsetsGeometry?',
            description: 'Outer padding.',
          ),
          PropRow(
            name: 'mainAxisSize',
            type: 'MainAxisSize',
            description: 'Column size.',
            defaultValue: 'min',
          ),
          PropRow(
            name: 'crossAxisAlignment',
            type: 'CrossAxisAlignment',
            description: 'Alignment.',
            defaultValue: 'center',
          ),
          PropRow(
            name: 'textAlign',
            type: 'TextAlign',
            description: 'Text alignment.',
            defaultValue: 'center',
          ),
          PropRow(
            name: 'gap',
            type: 'double',
            description: 'Spacing between elements.',
            defaultValue: '8',
          ),
          PropRow(
            name: 'backgroundColor',
            type: 'Color?',
            description: 'Background color behind the ring.',
          ),
          PropRow(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Style for the label.',
          ),
          PropRow(
            name: 'descriptionStyle',
            type: 'TextStyle?',
            description: 'Style for the description.',
          ),
        ],
        child: Ux4gCircularProgress(
          value: context.knobs.double.slider(
            label: 'Value',
            initialValue: 0.65,
            min: 0,
            max: 1,
          ),
          centerValueText: '65%',
          label: 'Progress',
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'All variants',
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final sizes = Ux4gCircularProgressSize.values;
        final typography = Ux4gTheme.typography(context);

        final gradientColors = isDark
            ? [Ux4gColors.primary700, Ux4gColors.primary300]
            : [Ux4gColors.primary200, Ux4gColors.primary600];

        Widget buildRow({
          required bool showGradient,
          required bool showBackground,
          required bool innerDescription,
          StrokeCap strokeCap = StrokeCap.butt,
        }) {
          return Wrap(
            spacing: 24,
            runSpacing: 24,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: sizes.map((size) {
              return SizedBox(
                width: 100,
                child: Ux4gCircularProgress(
                  value: 0.5,
                  size: size,
                  strokeCap: strokeCap,
                  trackColor: isDark
                      ? Ux4gColors.neutral600
                      : Ux4gColors.neutral300,
                  backgroundColor: showBackground
                      ? (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral100)
                      : null,
                  progressGradient: showGradient
                      ? SweepGradient(
                          transform: const GradientRotation(-1.57079632679),
                          colors: gradientColors,
                        )
                      : null,
                  centerValueText: '50%',
                  centerDescription: innerDescription ? 'Description' : null,
                  description: innerDescription ? null : 'Description',
                  gap:
                      (size == Ux4gCircularProgressSize.xl ||
                          size == Ux4gCircularProgressSize.xxl ||
                          size == Ux4gCircularProgressSize.xxxl)
                      ? 4
                      : 8,
                ),
              );
            }).toList(),
          );
        }

        return ComponentDocs(
          name: 'CircularProgress — Variants',
          description:
              'All sizes with different style configurations. '
              'Gradient: primary200→primary600 (light) / primary700→primary300 (dark). '
              'Track: neutral300 (light) / neutral600 (dark).',
          code: '''// 1. Default (auto gradient + track from theme)
Ux4gCircularProgress(
  value: 0.5,
  size: Ux4gCircularProgressSize.l,
  centerValueText: '50%',
  description: 'Description',
),

// 2. Custom Gradient
Ux4gCircularProgress(
  value: 0.5,
  size: Ux4gCircularProgressSize.l,
  progressGradient: SweepGradient(
    transform: GradientRotation(-pi / 2),
    colors: [Ux4gColors.primary200, Ux4gColors.primary600],
  ),
  trackColor: Ux4gColors.neutral300,
  centerValueText: '50%',
  description: 'Description',
),

// 3. With Background Fill
Ux4gCircularProgress(
  value: 0.5,
  size: Ux4gCircularProgressSize.xl,
  backgroundColor: Ux4gColors.neutral100,
  centerValueText: '50%',
  description: 'Description',
),

// 4. Inner Description (large sizes)
Ux4gCircularProgress(
  value: 0.5,
  size: Ux4gCircularProgressSize.xxl,
  backgroundColor: Ux4gColors.neutral100,
  centerValueText: '50%',
  centerDescription: 'Description',
),

// 5. Rounded Stroke Cap
Ux4gCircularProgress(
  value: 0.5,
  size: Ux4gCircularProgressSize.l,
  strokeCap: StrokeCap.round,
  centerValueText: '50%',
  description: 'Description',
),''',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Default', style: typography.lS_strong),
              const SizedBox(height: 16),
              buildRow(
                showGradient: false,
                showBackground: false,
                innerDescription: false,
              ),
              const SizedBox(height: 48),

              Text('Gradient', style: typography.lS_strong),
              const SizedBox(height: 16),
              buildRow(
                showGradient: true,
                showBackground: false,
                innerDescription: false,
              ),
              const SizedBox(height: 48),

              Text('With Background Track', style: typography.lS_strong),
              const SizedBox(height: 16),
              buildRow(
                showGradient: false,
                showBackground: true,
                innerDescription: false,
              ),
              const SizedBox(height: 48),

              Text(
                'Gradient + Background + Inner Description',
                style: typography.lS_strong,
              ),
              const SizedBox(height: 16),
              buildRow(
                showGradient: true,
                showBackground: true,
                innerDescription: true,
              ),
              const SizedBox(height: 48),

              Text('Rounded Cap', style: typography.lS_strong),
              const SizedBox(height: 16),
              buildRow(
                showGradient: true,
                showBackground: false,
                innerDescription: false,
                strokeCap: StrokeCap.round,
              ),
              const SizedBox(height: 48),

              Text('Rounded Cap + Background', style: typography.lS_strong),
              const SizedBox(height: 16),
              buildRow(
                showGradient: true,
                showBackground: true,
                innerDescription: false,
                strokeCap: StrokeCap.round,
              ),
            ],
          ),
        );
      },
    ),
  ],
);

// ── Half-circle Progress ──────────────────────────────────────────────────────

final halfCircleProgressComponent = WidgetbookComponent(
  name: 'HalfCircleProgress',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'HalfCircleProgress',
        description: 'A semi-circular gauge with optional description text.',
        code: '''Ux4gHalfCircleProgress(
  value: 0.6,
  description: 'Progress',
  size: Ux4gHalfCircleProgressSize.m,
);''',
        props: const [
          PropRow(
            name: 'value',
            type: 'double',
            description: 'Progress from 0.0 to 1.0.',
            required: true,
          ),
          PropRow(
            name: 'size',
            type: 'Ux4gHalfCircleProgressSize',
            description: 's / m / l / xl.',
            defaultValue: 'l',
          ),
          PropRow(
            name: 'width',
            type: 'double?',
            description: 'Custom width override.',
          ),
          PropRow(
            name: 'strokeWidth',
            type: 'double?',
            description: 'Custom arc thickness override.',
          ),
          PropRow(
            name: 'progressColor',
            type: 'Color?',
            description: 'Color of the progress arc.',
          ),
          PropRow(
            name: 'trackColor',
            type: 'Color?',
            description: 'Color of the background track.',
          ),
          PropRow(
            name: 'progressGradient',
            type: 'Gradient?',
            description: 'Gradient for the progress arc.',
          ),
          PropRow(
            name: 'strokeCap',
            type: 'StrokeCap',
            description: 'butt / round / square.',
            defaultValue: 'round',
          ),
          PropRow(
            name: 'valueText',
            type: 'String?',
            description: 'Text shown inside the arc (defaults to %).',
          ),
          PropRow(
            name: 'description',
            type: 'String?',
            description: 'Supporting text below/inside the arc.',
          ),
          PropRow(
            name: 'showScale',
            type: 'bool',
            description: 'Show 0% and 100% labels.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'valueStyle',
            type: 'TextStyle?',
            description: 'Style for valueText.',
          ),
          PropRow(
            name: 'descriptionStyle',
            type: 'TextStyle?',
            description: 'Style for description.',
          ),
          PropRow(
            name: 'scaleStyle',
            type: 'TextStyle?',
            description: 'Style for scale labels.',
          ),
          PropRow(
            name: 'gap',
            type: 'double',
            description: 'Gap between arc and content.',
            defaultValue: '4',
          ),
        ],
        child: Ux4gHalfCircleProgress(
          value: context.knobs.double.slider(
            label: 'Value',
            initialValue: 0.6,
            min: 0,
            max: 1,
          ),
          description: 'Progress',
        ),
      ),
    ),
  ],
);

// ── ux4gSpinner ──────────────────────────────────────────────────────────────────

@Deprecated('Use Ux4gSpinnerGradientTheme instead')
typedef Ux4gLoaderGradientTheme = Ux4gSpinnerGradientTheme;

enum Ux4gSpinnerGradientTheme {
  brand('Brand'),
  neutral('Neutral'),
  destructive('Destructive');

  final String label;
  const Ux4gSpinnerGradientTheme(this.label);
}

final spinnerComponent = WidgetbookComponent(
  name: 'Spinner (Loader)',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Spinner (Loader)',
          description:
              'Spinner component is a visual indicator used to represent loading, processing or system activity. It provides feedback to users that an operation is in progress and helps prevent confusion when waiting for content to load.',
          showPreview: false,
          child: _SpinnerVisualShowcase(),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final selectedTheme = context.knobs.list(
          label: 'Color Theme',
          options: Ux4gSpinnerGradientTheme.values,
          initialOption: Ux4gSpinnerGradientTheme.brand,
          labelBuilder: (v) => v.label,
        );

        final gradientColors = switch (selectedTheme) {
          Ux4gSpinnerGradientTheme.brand =>
            isDark
                ? [Ux4gColors.primary300, Ux4gColors.primary800]
                : [Ux4gColors.primary600, Ux4gColors.primary100],
          Ux4gSpinnerGradientTheme.neutral =>
            isDark
                ? [Ux4gColors.neutral950A, Ux4gColors.neutral900]
                : [Ux4gColors.neutral0, Ux4gColors.neutral50],
          Ux4gSpinnerGradientTheme.destructive =>
            isDark
                ? [Ux4gColors.red800, Ux4gColors.red300]
                : [Ux4gColors.red200, Ux4gColors.red600],
        };

        return ComponentDocs(
          name: 'ux4gSpinner',
          description:
              'Spinner component is a visual indicator used to represent loading, processing or system activity. It provides feedback to users that an operation is in progress and helps prevent confusion when waiting for content to load.',
          code: '''// Basic spinner
Ux4gSpinner(size: 40);

// Customised with Gradient
Ux4gSpinner(
  size: 48,
  strokeWidth: 5,
  percentage: 75,
  gradientColors: [Ux4gColors.primary600, Ux4gColors.primary100],
);''',
          props: const [
            PropRow(
              name: 'size',
              type: 'double',
              description: 'Diameter of the spinner.',
              defaultValue: '40',
            ),
            PropRow(
              name: 'color',
              type: 'Color?',
              description: 'Color of the spinner.',
            ),
            PropRow(
              name: 'gradientColors',
              type: 'List<Color>?',
              description: 'Custom gradient colors for the spinner.',
            ),
            PropRow(
              name: 'percentage',
              type: 'double',
              description: 'Arc fill amount (0–100).',
              defaultValue: '100',
            ),
            PropRow(
              name: 'strokeWidth',
              type: 'double',
              description: 'Arc stroke thickness.',
              defaultValue: '4',
            ),
            PropRow(
              name: 'rotationDurationMillis',
              type: 'int',
              description: 'Speed of rotation.',
              defaultValue: '1200',
            ),
          ],
          child: Ux4gSpinner(
            size: context.knobs.double.slider(
              label: 'Size',
              initialValue: 40,
              min: 20,
              max: 80,
            ),
            percentage: context.knobs.double.slider(
              label: 'Percentage',
              initialValue: 100,
              min: 0,
              max: 100,
            ),
            strokeWidth: context.knobs.double.slider(
              label: 'Stroke width',
              initialValue: 4,
              min: 2,
              max: 10,
            ),
            gradientColors: gradientColors,
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Variants',
      builder: (context) {
        return ComponentDocs(
          name: 'ux4gSpinner — Variants',
          description:
              'Various color and percentage variations of the Ux4gSpinner indicator.',
          code: '''// Primary Color
Ux4gSpinner(size: 40, percentage: 100, color: Ux4gColors.primary);

// Secondary Color (60%)
Ux4gSpinner(size: 40, percentage: 60, color: Ux4gColors.secondary);

// Danger / Red (30%)
Ux4gSpinner(size: 40, percentage: 30, color: Ux4gColors.red);

// Success / Green (75%)
Ux4gSpinner(size: 40, percentage: 75, color: Ux4gColors.green);''',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Ux4gSpinner(size: 40, percentage: 100, color: Ux4gColors.primary),
              Ux4gSpinner(
                size: 40,
                percentage: 60,
                color: Ux4gColors.secondary,
              ),
              Ux4gSpinner(size: 40, percentage: 30, color: Ux4gColors.red),
              Ux4gSpinner(size: 40, percentage: 75, color: Ux4gColors.green),
            ],
          ),
        );
      },
    ),
  ],
);

final loaderComponent = spinnerComponent;

// ── Animated Circular Progress ────────────────────────────────────────────────

final animatedCircularProgressComponent = WidgetbookComponent(
  name: 'AnimatedCircularProgress',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'AnimatedCircularProgress',
        description:
            'An animated version of CircularProgress. Smoothly transitions '
            'from 0 to the target value using a tween animation.',
        code: '''Ux4gAnimatedCircularProgress(
  value: 0.75,
  size: Ux4gCircularProgressSize.l,
  centerValueText: '75%',
  label: 'Progress',
  duration: Duration(milliseconds: 700),
  curve: Curves.easeInOut,
);''',
        props: const [
          PropRow(
            name: 'value',
            type: 'double',
            description: 'Progress from 0.0 to 1.0.',
            required: true,
          ),
          PropRow(
            name: 'size',
            type: 'Ux4gCircularProgressSize',
            description: 'xs / s / m / l / xl / xxl / xxxl.',
            defaultValue: 'l',
          ),
          PropRow(
            name: 'diameter',
            type: 'double?',
            description: 'Custom diameter override.',
          ),
          PropRow(
            name: 'strokeWidth',
            type: 'double?',
            description: 'Custom arc thickness override.',
          ),
          PropRow(
            name: 'progressColor',
            type: 'Color?',
            description: 'Color of the progress arc.',
          ),
          PropRow(
            name: 'trackColor',
            type: 'Color?',
            description: 'Color of the background track.',
          ),
          PropRow(
            name: 'progressGradient',
            type: 'Gradient?',
            description: 'Gradient fill for the progress arc.',
          ),
          PropRow(
            name: 'strokeCap',
            type: 'StrokeCap',
            description: 'butt / round / square.',
            defaultValue: 'butt',
          ),
          PropRow(
            name: 'startAngle',
            type: 'double',
            description: 'Starting angle in radians.',
            defaultValue: '-π/2',
          ),
          PropRow(
            name: 'centerValueText',
            type: 'String?',
            description: 'Large text inside/below the circle.',
          ),
          PropRow(
            name: 'centerDescription',
            type: 'String?',
            description: 'Smaller text below centerValueText.',
          ),
          PropRow(
            name: 'center',
            type: 'Widget?',
            description: 'Custom widget inside the circle.',
          ),
          PropRow(
            name: 'label',
            type: 'String?',
            description: 'Main title below the circle.',
          ),
          PropRow(
            name: 'description',
            type: 'String?',
            description: 'Supporting text below the label.',
          ),
          PropRow(
            name: 'footer',
            type: 'Widget?',
            description: 'Widget shown at the very bottom.',
          ),
          PropRow(
            name: 'padding',
            type: 'EdgeInsetsGeometry?',
            description: 'Outer padding.',
          ),
          PropRow(
            name: 'mainAxisSize',
            type: 'MainAxisSize',
            description: 'Column size.',
            defaultValue: 'min',
          ),
          PropRow(
            name: 'crossAxisAlignment',
            type: 'CrossAxisAlignment',
            description: 'Alignment.',
            defaultValue: 'center',
          ),
          PropRow(
            name: 'textAlign',
            type: 'TextAlign',
            description: 'Text alignment.',
            defaultValue: 'center',
          ),
          PropRow(
            name: 'gap',
            type: 'double',
            description: 'Spacing between elements.',
            defaultValue: '8',
          ),
          PropRow(
            name: 'backgroundColor',
            type: 'Color?',
            description: 'Background color behind the ring.',
          ),
          PropRow(
            name: 'labelStyle',
            type: 'TextStyle?',
            description: 'Style for the label.',
          ),
          PropRow(
            name: 'descriptionStyle',
            type: 'TextStyle?',
            description: 'Style for the description.',
          ),
          PropRow(
            name: 'duration',
            type: 'Duration',
            description: 'Animation duration.',
            defaultValue: '700ms',
          ),
          PropRow(
            name: 'curve',
            type: 'Curve',
            description: 'Animation curve.',
            defaultValue: 'easeInOut',
          ),
        ],
        child: Ux4gAnimatedCircularProgress(
          value: context.knobs.double.slider(
            label: 'Value',
            initialValue: 0.75,
            min: 0,
            max: 1,
          ),
          size: context.knobs.list(
            label: 'Size',
            options: Ux4gCircularProgressSize.values,
            initialOption: Ux4gCircularProgressSize.l,
            labelBuilder: (v) => v.name,
          ),
          centerValueText: '75%',
          label: 'Animated',
        ),
      ),
    ),
  ],
);

// ── Animated Half-Circle Progress ─────────────────────────────────────────────

final animatedHalfCircleProgressComponent = WidgetbookComponent(
  name: 'AnimatedHalfCircleProgress',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'AnimatedHalfCircleProgress',
        description:
            'An animated version of HalfCircleProgress. Smoothly transitions '
            'from 0 to the target value using a tween animation.',
        code: '''Ux4gAnimatedHalfCircleProgress(
  value: 0.65,
  size: Ux4gHalfCircleProgressSize.l,
  valueText: '65',
  description: 'Score',
  showScale: true,
  duration: Duration(milliseconds: 700),
);''',
        props: const [
          PropRow(
            name: 'value',
            type: 'double',
            description: 'Progress from 0.0 to 1.0.',
            required: true,
          ),
          PropRow(
            name: 'size',
            type: 'Ux4gHalfCircleProgressSize',
            description: 's / m / l / xl.',
            defaultValue: 'l',
          ),
          PropRow(
            name: 'width',
            type: 'double?',
            description: 'Custom width override.',
          ),
          PropRow(
            name: 'strokeWidth',
            type: 'double?',
            description: 'Custom arc thickness override.',
          ),
          PropRow(
            name: 'progressColor',
            type: 'Color?',
            description: 'Color of the progress arc.',
          ),
          PropRow(
            name: 'trackColor',
            type: 'Color?',
            description: 'Color of the background track.',
          ),
          PropRow(
            name: 'progressGradient',
            type: 'Gradient?',
            description: 'Gradient for the progress arc.',
          ),
          PropRow(
            name: 'strokeCap',
            type: 'StrokeCap',
            description: 'butt / round / square.',
            defaultValue: 'round',
          ),
          PropRow(
            name: 'valueText',
            type: 'String?',
            description: 'Text shown inside the arc (defaults to %).',
          ),
          PropRow(
            name: 'description',
            type: 'String?',
            description: 'Supporting text below/inside the arc.',
          ),
          PropRow(
            name: 'showScale',
            type: 'bool',
            description: 'Show 0% and 100% labels.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'valueStyle',
            type: 'TextStyle?',
            description: 'Style for valueText.',
          ),
          PropRow(
            name: 'descriptionStyle',
            type: 'TextStyle?',
            description: 'Style for description.',
          ),
          PropRow(
            name: 'scaleStyle',
            type: 'TextStyle?',
            description: 'Style for scale labels.',
          ),
          PropRow(
            name: 'gap',
            type: 'double',
            description: 'Gap between arc and content.',
            defaultValue: '4',
          ),
          PropRow(
            name: 'duration',
            type: 'Duration',
            description: 'Animation duration.',
            defaultValue: '700ms',
          ),
          PropRow(
            name: 'curve',
            type: 'Curve',
            description: 'Animation curve.',
            defaultValue: 'easeInOut',
          ),
        ],
        child: Ux4gAnimatedHalfCircleProgress(
          value: context.knobs.double.slider(
            label: 'Value',
            initialValue: 0.65,
            min: 0,
            max: 1,
          ),
          size: context.knobs.list(
            label: 'Size',
            options: Ux4gHalfCircleProgressSize.values,
            initialOption: Ux4gHalfCircleProgressSize.l,
            labelBuilder: (v) => v.name,
          ),
          valueText: '65',
          description: 'Animated',
          showScale: context.knobs.boolean(
            label: 'Show scale',
            initialValue: true,
          ),
        ),
      ),
    ),
  ],
);

// ── Progress SLA Indicator ────────────────────────────────────────────────────

final progressSlaIndicatorComponent = WidgetbookComponent(
  name: 'Progress SLA Indicator',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        final typography = Theme.of(context).extension<Ux4gTypography>()!;

        Widget buildLinearStack(Ux4gProgressShape shape) {
          return Column(
            children: [
              Ux4gLinearProgress(
                value: 0.50,
                icon: Icons.hexagon_outlined,
                iconColor: const Color(0xFF6A4EFF),
                iconBackgroundColor: const Color(0xFF6A4EFF).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: shape,
                showPercentage: true,
                gradientColors: const [Color(0xFF6A4EFF), Color(0xFF9B59B6)],
              ),
              const SizedBox(height: 16),
              Ux4gLinearProgress(
                value: 0.50,
                icon: Icons.hexagon_outlined,
                iconColor: const Color(0xFFF39C12),
                iconBackgroundColor: const Color(0xFFF39C12).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: shape,
                showPercentage: true,
                gradientColors: const [Color(0xFFFFAE00), Color(0xFFFF5F00)],
              ),
              const SizedBox(height: 16),
              Ux4gLinearProgress(
                value: 0.50,
                icon: Icons.hexagon_outlined,
                iconColor: const Color(0xFFE74C3C),
                iconBackgroundColor: const Color(0xFFE74C3C).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: shape,
                showPercentage: true,
                gradientColors: const [Color(0xFFFFB3AE), Color(0xFFE74C3C)],
              ),
              const SizedBox(height: 16),
              Ux4gLinearProgress(
                value: 0.50,
                icon: Icons.hexagon_outlined,
                iconColor: const Color(0xFF27AE60),
                iconBackgroundColor: const Color(0xFF27AE60).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: shape,
                showPercentage: true,
                gradientColors: const [Color(0xFF90EE90), Color(0xFF27AE60)],
              ),
            ],
          );
        }

        return ComponentDocs(
          name: 'Progress SLA Indicator',
          description:
              'An SLA progress indicator visually tracks the time remaining to fulfill a guaranteed service or task. It communicates progress and status through color and supporting information.',
          showPreview: false,
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visual Showcase',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Demonstration of circular and linear SLA progress indicators with status colors, badges, sharp, and rounded bars.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section 1: SLA Circular Progress
                      const Text(
                        'SLA Circular Progress',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _circularSlaVariant(
                              typography: typography,
                              progressColor: const Color(0xFF6A4EFF),
                              gradient: const SweepGradient(
                                transform: GradientRotation(-math.pi / 2),
                                colors: [Color(0xFFDCD4FF), Color(0xFF6A4EFF)],
                              ),
                              footerColor: const Color(0xFFEFEAFF),
                              footerTextColor: const Color(0xFF6A4EFF),
                            ),
                            const SizedBox(width: 48),
                            _circularSlaVariant(
                              typography: typography,
                              progressColor: const Color(0xFFFFA827),
                              gradient: const SweepGradient(
                                transform: GradientRotation(-math.pi / 2),
                                colors: [Color(0xFFFFF2D9), Color(0xFFFFA827)],
                              ),
                              footerColor: const Color(0xFFFFF7E6),
                              footerTextColor: const Color(0xFFFFA827),
                            ),
                            const SizedBox(width: 48),
                            _circularSlaVariant(
                              typography: typography,
                              progressColor: const Color(0xFFF55E57),
                              descriptionColor: const Color(0xFFB3251E),
                              gradient: const SweepGradient(
                                transform: GradientRotation(-math.pi / 2),
                                colors: [Color(0xFFFFECEE), Color(0xFFF55E57)],
                              ),
                              footerColor: const Color(0xFFFFF0F0),
                              footerTextColor: const Color(0xFFF55E57),
                            ),
                            const SizedBox(width: 48),
                            _circularSlaVariant(
                              typography: typography,
                              progressColor: const Color(0xFF1AA64A),
                              gradient: const SweepGradient(
                                transform: GradientRotation(-math.pi / 2),
                                colors: [Color(0xFFDFF9E8), Color(0xFF1AA64A)],
                              ),
                              footerColor: const Color(0xFFF2FCEF),
                              footerTextColor: const Color(0xFF1AA64A),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Section 2: Linear Progress
                      const Text(
                        'Linear Progress',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 24),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 700;
                          return isWide
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Sharp',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF6B7280),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          buildLinearStack(Ux4gProgressShape.sharp),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 48),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Rounded',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF6B7280),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          buildLinearStack(Ux4gProgressShape.rounded),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sharp',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF6B7280),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    buildLinearStack(Ux4gProgressShape.sharp),
                                    const SizedBox(height: 32),
                                    const Text(
                                      'Rounded',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF6B7280),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    buildLinearStack(Ux4gProgressShape.rounded),
                                  ],
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Circular Progress',
      builder: (context) {
        final typography = Theme.of(context).extension<Ux4gTypography>()!;
        return ComponentDocs(
          name: 'Progress SLA Indicator (Circular)',
          description:
              'An SLA progress indicator visually tracks the time remaining to fulfill a guaranteed service or task. It communicates progress and status through color and supporting information.',
          code: '''// ── Purple / Cloud Variant ──
Ux4gCircularProgress(
  value: 0.65,
  size: Ux4gCircularProgressSize.xl,
  strokeWidth: 6,
  strokeCap: StrokeCap.round,
  progressGradient: const SweepGradient(
    transform: GradientRotation(-math.pi / 2),
    colors: [
      Color(0xFFDCD4FF),
      Color(0xFF6A4EFF),
    ],
  ),
  centerValueText: '8',
  centerDescription: 'days left',
  label: 'Label',
  description: 'Description',
  footer: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFFEFEAFF),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text(
      'Label',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF6A4EFF),
      ),
    ),
  ),
);

// ── Orange / Warning Variant ──
Ux4gCircularProgress(
  value: 0.65,
  size: Ux4gCircularProgressSize.xl,
  strokeWidth: 6,
  strokeCap: StrokeCap.round,
  progressGradient: const SweepGradient(
    transform: GradientRotation(-math.pi / 2),
    colors: [
      Color(0xFFFFF2D9),
      Color(0xFFFFA827),
    ],
  ),
  centerValueText: '8',
  centerDescription: 'days left',
  label: 'Label',
  description: 'Description',
  footer: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF7E6),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text(
      'Label',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFFA827),
      ),
    ),
  ),
);

// ── Red / Critical Variant ──
Ux4gCircularProgress(
  value: 0.65,
  size: Ux4gCircularProgressSize.xl,
  strokeWidth: 6,
  strokeCap: StrokeCap.round,
  progressGradient: const SweepGradient(
    transform: GradientRotation(-math.pi / 2),
    colors: [
      Color(0xFFFFECEE),
      Color(0xFFF55E57),
    ],
  ),
  centerValueText: '8',
  centerDescription: 'days left',
  label: 'Label',
  description: 'Description',
  descriptionStyle: const TextStyle(
    fontSize: 14,
    color: Color(0xFFB3251E),
  ),
  footer: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF0F0),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text(
      'Label',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFFF55E57),
      ),
    ),
  ),
);

// ── Green / Success Variant ──
Ux4gCircularProgress(
  value: 0.65,
  size: Ux4gCircularProgressSize.xl,
  strokeWidth: 6,
  strokeCap: StrokeCap.round,
  progressGradient: const SweepGradient(
    transform: GradientRotation(-math.pi / 2),
    colors: [
      Color(0xFFDFF9E8),
      Color(0xFF1AA64A),
    ],
  ),
  centerValueText: '8',
  centerDescription: 'days left',
  label: 'Label',
  description: 'Description',
  footer: Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFFF2FCEF),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text(
      'Label',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1AA64A),
      ),
    ),
  ),
);''',
          props: const [
            PropRow(
              name: 'value',
              type: 'double',
              description: 'Progress from 0.0 to 1.0.',
              required: true,
            ),
            PropRow(
              name: 'size',
              type: 'Ux4gCircularProgressSize',
              description: 'xs / s / m / l / xl / xxl / xxxl.',
              defaultValue: 'l',
            ),
            PropRow(
              name: 'diameter',
              type: 'double?',
              description: 'Custom diameter override.',
            ),
            PropRow(
              name: 'strokeWidth',
              type: 'double?',
              description: 'Custom arc thickness override.',
            ),
            PropRow(
              name: 'progressColor',
              type: 'Color?',
              description: 'Color of the progress arc.',
            ),
            PropRow(
              name: 'trackColor',
              type: 'Color?',
              description: 'Color of the background track.',
            ),
            PropRow(
              name: 'progressGradient',
              type: 'Gradient?',
              description: 'Gradient fill for the progress arc.',
            ),
            PropRow(
              name: 'strokeCap',
              type: 'StrokeCap',
              description: 'butt / round / square.',
              defaultValue: 'butt',
            ),
            PropRow(
              name: 'startAngle',
              type: 'double',
              description: 'Starting angle in radians.',
              defaultValue: '-π/2',
            ),
            PropRow(
              name: 'centerValueText',
              type: 'String?',
              description: 'Large text inside/below the circle.',
            ),
            PropRow(
              name: 'centerDescription',
              type: 'String?',
              description: 'Smaller text below centerValueText.',
            ),
            PropRow(
              name: 'center',
              type: 'Widget?',
              description: 'Custom widget inside the circle.',
            ),
            PropRow(
              name: 'label',
              type: 'String?',
              description: 'Main title below the circle.',
            ),
            PropRow(
              name: 'description',
              type: 'String?',
              description: 'Supporting text below the label.',
            ),
            PropRow(
              name: 'descriptionStyle',
              type: 'TextStyle?',
              description: 'Custom text style for the description.',
            ),
            PropRow(
              name: 'footer',
              type: 'Widget?',
              description:
                  'Widget shown at the very bottom (e.g. status badge).',
            ),
            PropRow(
              name: 'padding',
              type: 'EdgeInsetsGeometry?',
              description: 'Outer padding around the gauge.',
            ),
            PropRow(
              name: 'mainAxisSize',
              type: 'MainAxisSize',
              description: 'Vertical layout column size.',
              defaultValue: 'min',
            ),
            PropRow(
              name: 'crossAxisAlignment',
              type: 'CrossAxisAlignment',
              description: 'Horizontal alignment.',
              defaultValue: 'center',
            ),
            PropRow(
              name: 'textAlign',
              type: 'TextAlign',
              description: 'Text alignment.',
              defaultValue: 'center',
            ),
            PropRow(
              name: 'gap',
              type: 'double',
              description: 'Spacing between circle and label.',
              defaultValue: '8',
            ),
            PropRow(
              name: 'backgroundColor',
              type: 'Color?',
              description: 'Background circle color behind progress.',
            ),
          ],
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _circularSlaVariant(
                  typography: typography,
                  progressColor: const Color(0xFF6A4EFF),
                  gradient: const SweepGradient(
                    transform: GradientRotation(-math.pi / 2),
                    colors: [Color(0xFFDCD4FF), Color(0xFF6A4EFF)],
                  ),
                  footerColor: const Color(0xFFEFEAFF),
                  footerTextColor: const Color(0xFF6A4EFF),
                ),
                const SizedBox(width: 24),
                _circularSlaVariant(
                  typography: typography,
                  progressColor: const Color(0xFFFFA827),
                  gradient: const SweepGradient(
                    transform: GradientRotation(-math.pi / 2),
                    colors: [Color(0xFFFFF2D9), Color(0xFFFFA827)],
                  ),
                  footerColor: const Color(0xFFFFF7E6),
                  footerTextColor: const Color(0xFFFFA827),
                ),
                const SizedBox(width: 24),
                _circularSlaVariant(
                  typography: typography,
                  progressColor: const Color(0xFFF55E57),
                  descriptionColor: const Color(0xFFB3251E),
                  gradient: const SweepGradient(
                    transform: GradientRotation(-math.pi / 2),
                    colors: [Color(0xFFFFECEE), Color(0xFFF55E57)],
                  ),
                  footerColor: const Color(0xFFFFF0F0),
                  footerTextColor: const Color(0xFFF55E57),
                ),
                const SizedBox(width: 24),
                _circularSlaVariant(
                  typography: typography,
                  progressColor: const Color(0xFF1AA64A),
                  gradient: const SweepGradient(
                    transform: GradientRotation(-math.pi / 2),
                    colors: [Color(0xFFDFF9E8), Color(0xFF1AA64A)],
                  ),
                  footerColor: const Color(0xFFF2FCEF),
                  footerTextColor: const Color(0xFF1AA64A),
                ),
              ],
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Linear Progress',
      builder: (context) => ComponentDocs(
        name: 'Progress SLA Indicator (Linear)',
        description:
            'An SLA progress indicator visually tracks the time remaining to fulfill a guaranteed service or task. It communicates progress and status through color and supporting information.',
        code: '''// ── Purple / Cloud Variant ──
Ux4gLinearProgress(
  value: 0.55,
  icon: Icons.cloud_upload_outlined,
  iconColor: const Color(0xFF6A4EFF),
  iconBackgroundColor: const Color(0xFF6A4EFF).withValues(alpha: 0.12),
  label: 'Label',
  hint: 'Hint',
  height: 10,
  shape: Ux4gProgressShape.rounded,
  gradientColors: const [
    Color(0xFF6A4EFF),
    Color(0xFF9B59B6),
  ],
);

// ── Orange / Bolt Variant ──
Ux4gLinearProgress(
  value: 0.45,
  icon: Icons.bolt_outlined,
  iconColor: const Color(0xFFF39C12),
  iconBackgroundColor: const Color(0xFFF39C12).withValues(alpha: 0.12),
  label: 'Label',
  hint: 'Hint',
  height: 10,
  shape: Ux4gProgressShape.rounded,
  gradientColors: const [
    Color(0xFFFFAE00),
    Color(0xFFFF5F00),
  ],
);

// ── Red / Warning Variant ──
Ux4gLinearProgress(
  value: 0.35,
  icon: Icons.warning_amber_rounded,
  iconColor: const Color(0xFFE74C3C),
  iconBackgroundColor: const Color(0xFFE74C3C).withValues(alpha: 0.12),
  label: 'Label',
  hint: 'Hint',
  height: 10,
  shape: Ux4gProgressShape.rounded,
  gradientColors: const [
    Color(0xFFFFB3AE),
    Color(0xFFE74C3C),
  ],
);

// ── Green / Check Variant ──
Ux4gLinearProgress(
  value: 0.60,
  icon: Icons.check_circle_outline,
  iconColor: const Color(0xFF27AE60),
  iconBackgroundColor: const Color(0xFF27AE60).withValues(alpha: 0.12),
  label: 'Label',
  hint: 'Hint',
  height: 10,
  shape: Ux4gProgressShape.rounded,
  gradientColors: const [
    Color(0xFF90EE90),
    Color(0xFF27AE60),
  ],
);''',
        props: const [
          PropRow(
            name: 'value',
            type: 'double',
            description: 'Progress from 0.0 to 1.0.',
            required: true,
          ),
          PropRow(
            name: 'icon',
            type: 'IconData?',
            description: 'Leading icon displayed above the bar.',
          ),
          PropRow(
            name: 'iconColor',
            type: 'Color?',
            description: 'Color of the leading icon.',
          ),
          PropRow(
            name: 'iconBackgroundColor',
            type: 'Color?',
            description: 'Background circle color for the icon badge.',
          ),
          PropRow(
            name: 'label',
            type: 'String?',
            description: 'Primary label above the bar.',
          ),
          PropRow(
            name: 'hint',
            type: 'String?',
            description: 'Secondary status text aligned to the right.',
          ),
          PropRow(
            name: 'height',
            type: 'double',
            description: 'Thickness of the progress bar.',
            defaultValue: '8',
          ),
          PropRow(
            name: 'shape',
            type: 'Ux4gProgressShape',
            description: 'sharp or rounded corners.',
            defaultValue: 'rounded',
          ),
          PropRow(
            name: 'customBorderRadius',
            type: 'double?',
            description: 'Custom corner radius override.',
          ),
          PropRow(
            name: 'color',
            type: 'Color?',
            description: 'Solid fill color.',
          ),
          PropRow(
            name: 'gradientColors',
            type: 'List<Color>?',
            description: 'Gradient fill colors (overrides color).',
          ),
          PropRow(
            name: 'trackColor',
            type: 'Color?',
            description: 'Background track color.',
          ),
          PropRow(
            name: 'showPercentage',
            type: 'bool',
            description: 'Show percentage display.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'labelPosition',
            type: 'Ux4gProgressLabelPosition',
            description: 'outside or inside.',
            defaultValue: 'outside',
          ),
          PropRow(
            name: 'insideLabelStyle',
            type: 'TextStyle?',
            description:
                'Text style for percentage when labelPosition is inside.',
          ),
        ],
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Ux4gLinearProgress(
                value: 0.55,
                icon: Icons.cloud_upload_outlined,
                iconColor: const Color(0xFF6A4EFF),
                iconBackgroundColor: const Color(
                  0xFF6A4EFF,
                ).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: Ux4gProgressShape.rounded,
                gradientColors: const [Color(0xFF6A4EFF), Color(0xFF9B59B6)],
              ),
              const SizedBox(height: 20),
              Ux4gLinearProgress(
                value: 0.45,
                icon: Icons.bolt_outlined,
                iconColor: const Color(0xFFF39C12),
                iconBackgroundColor: const Color(
                  0xFFF39C12,
                ).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: Ux4gProgressShape.rounded,
                gradientColors: const [Color(0xFFFFAE00), Color(0xFFFF5F00)],
              ),
              const SizedBox(height: 20),
              Ux4gLinearProgress(
                value: 0.35,
                icon: Icons.warning_amber_rounded,
                iconColor: const Color(0xFFE74C3C),
                iconBackgroundColor: const Color(
                  0xFFE74C3C,
                ).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: Ux4gProgressShape.rounded,
                gradientColors: const [Color(0xFFFFB3AE), Color(0xFFE74C3C)],
              ),
              const SizedBox(height: 20),
              Ux4gLinearProgress(
                value: 0.60,
                icon: Icons.check_circle_outline,
                iconColor: const Color(0xFF27AE60),
                iconBackgroundColor: const Color(
                  0xFF27AE60,
                ).withValues(alpha: 0.12),
                label: 'Label',
                hint: 'Hint',
                height: 10,
                shape: Ux4gProgressShape.rounded,
                gradientColors: const [Color(0xFF90EE90), Color(0xFF27AE60)],
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);

Widget _circularSlaVariant({
  required Ux4gTypography typography,
  required Color progressColor,
  required SweepGradient gradient,
  required Color footerColor,
  required Color footerTextColor,
  Color? descriptionColor,
}) {
  return Ux4gCircularProgress(
    value: 0.65,
    size: Ux4gCircularProgressSize.xl,
    strokeWidth: 6,
    strokeCap: StrokeCap.round,
    progressGradient: gradient,
    centerValueText: '8',
    centerDescription: 'days left',
    label: 'Label',
    description: 'Description',
    descriptionStyle: descriptionColor != null
        ? typography.bS_default.copyWith(color: descriptionColor)
        : null,
    footer: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: footerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Label',
        style: typography.bXS_strong.copyWith(color: footerTextColor),
      ),
    ),
  );
}

class _SpinnerVisualShowcase extends StatelessWidget {
  const _SpinnerVisualShowcase();

  @override
  Widget build(BuildContext context) {
    final sizes = [
      (size: 48.0, stroke: 4.5),
      (size: 36.0, stroke: 3.5),
      (size: 28.0, stroke: 3.0),
      (size: 20.0, stroke: 2.5),
      (size: 14.0, stroke: 2.0),
    ];

    final rows = [
      (label: 'Full', percentage: 90.0),
      (label: 'Split', percentage: 50.0),
      (label: 'Partial', percentage: 20.0),
    ];

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of spinner arc fill variations (Full, Split, Partial) across 5 standardized size scale steps.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: const Color(0xFFE5E7EB)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: rows.map((r) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          r.label,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: sizes.map((s) {
                            return SizedBox(
                              width: 56,
                              height: 56,
                              child: Center(
                                child: Ux4gSpinner(
                                  size: s.size,
                                  strokeWidth: s.stroke,
                                  percentage: r.percentage,
                                  color: Ux4gColors.primary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
