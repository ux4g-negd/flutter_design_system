import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';
import '../showcase_app.dart'; // ── Stepper ───────────────────────────────────────────────────────────────────

const _stepperProps = [
  PropRow(
    name: 'totalSteps',
    type: 'int',
    description: 'Total number of steps.',
    required: true,
  ),
  PropRow(
    name: 'currentStep',
    type: 'int',
    description: 'Zero-based active step index.',
    required: true,
  ),
  PropRow(
    name: 'steps',
    type: 'List<Ux4gStepItem>',
    description: 'Step data items.',
    required: true,
  ),
  PropRow(
    name: 'orientation',
    type: 'StepperOrientation',
    description: 'horizontal or vertical.',
    defaultValue: 'horizontal',
  ),
  PropRow(
    name: 'lineStyle',
    type: 'StepperLineStyle',
    description: 'solid or dashed.',
    defaultValue: 'solid',
  ),
  PropRow(
    name: 'linePlacement',
    type: 'StepperLinePlacement',
    description: 'center or bottom.',
    defaultValue: 'center',
  ),
  PropRow(
    name: 'stepSize',
    type: 'double?',
    description: 'Custom size for the step indicator circle.',
  ),
  PropRow(
    name: 'showLabels',
    type: 'bool',
    description: 'Whether to show the labels or just the icons.',
    defaultValue: 'true',
  ),
  PropRow(
    name: 'edgeLabelAlignment',
    type: 'bool',
    description: 'Aligns the first and last labels with the edges.',
    defaultValue: 'false',
  ),
  PropRow(
    name: 'activeStepBackground',
    type: 'bool',
    description: 'Adds a background color to the active step.',
    defaultValue: 'false',
  ),
  PropRow(
    name: 'stepSpacing',
    type: 'double',
    description: 'Spacing between steps, mainly for vertical stepper.',
    defaultValue: '24.0',
  ),
  PropRow(
    name: 'alignIconWithDescription',
    type: 'bool',
    description:
        'Aligns the step icon vertically with the description instead of the title.',
    defaultValue: 'false',
  ),
];

final stepperComponent = WidgetbookComponent(
  name: 'Standard',
  useCases: [
    WidgetbookUseCase(
      name: 'Horizontal',
      builder: (context) {
        int current = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper',
              description:
                  'A multi-step progress indicator for form wizards. '
                  'Supports horizontal and vertical orientations, solid or dashed lines.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 1,
  orientation: StepperOrientation.horizontal,
  steps: const [
    Ux4gStepItem(title: 'Personal'),
    Ux4gStepItem(title: 'Address'),
    Ux4gStepItem(title: 'Documents'),
    Ux4gStepItem(title: 'Review'),
  ],
);

// Capsule variant with prev/next
Ux4gCapsuleStepper(
  totalSteps: 5,
  currentStep: 1,
  stepLabel: 'Step 2 of 5',
  onNext: () {},
  onPrevious: () {},
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 380,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: current,
                      orientation: StepperOrientation.horizontal,
                      steps: const [
                        Ux4gStepItem(title: 'Personal'),
                        Ux4gStepItem(title: 'Address'),
                        Ux4gStepItem(title: 'Documents'),
                        Ux4gStepItem(title: 'Review'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: current > 0
                            ? () => setState(() => current--)
                            : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: current < 3
                            ? () => setState(() => current++)
                            : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Horizontal (No Labels)',
      builder: (context) {
        int current = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — No Labels',
              description: 'Horizontal stepper with showLabels: false.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.horizontal,
  showLabels: false,
  steps: const [
    Ux4gStepItem(title: 'Personal'),
    Ux4gStepItem(title: 'Address'),
    Ux4gStepItem(title: 'Documents'),
    Ux4gStepItem(title: 'Review'),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 380,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: current,
                      orientation: StepperOrientation.horizontal,
                      showLabels: false,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: current > 0
                            ? () => setState(() => current--)
                            : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: current < 4
                            ? () => setState(() => current++)
                            : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Horizontal (With Descriptions)',
      builder: (context) {
        int current = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — With Descriptions',
              description:
                  'Horizontal stepper with labels, descriptions, and custom statuses. All labels are center-aligned.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.horizontal,
  steps: const [
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Completed',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'In progress',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 600,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: current,
                      orientation: StepperOrientation.horizontal,
                      steps: [
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 1
                              ? 'Completed'
                              : (current == 1 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 2
                              ? 'Completed'
                              : (current == 2 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 3
                              ? 'Completed'
                              : (current == 3 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 4
                              ? 'Completed'
                              : (current == 4 ? 'In progress' : 'Label'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: current > 0
                            ? () => setState(() => current--)
                            : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: current < 4
                            ? () => setState(() => current++)
                            : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Horizontal (Bottom Lines)',
      builder: (context) {
        int current = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — Bottom Lines',
              description:
                  'Horizontal stepper with connecting lines rendered below the text.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.horizontal,
  linePlacement: StepperLinePlacement.bottom,
  steps: const [
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Completed',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'In progress',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: current,
                      orientation: StepperOrientation.horizontal,
                      linePlacement: StepperLinePlacement.bottom,
                      steps: [
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 1
                              ? 'Completed'
                              : (current == 1 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 2
                              ? 'Completed'
                              : (current == 2 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 3
                              ? 'Completed'
                              : (current == 3 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 4
                              ? 'Completed'
                              : (current == 4 ? 'In progress' : 'Label'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: current > 0
                            ? () => setState(() => current--)
                            : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: current < 4
                            ? () => setState(() => current++)
                            : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Horizontal (Bottom Lines + Active Bg)',
      builder: (context) {
        int current = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — Bottom Lines + Active Background',
              description:
                  'Horizontal stepper with bottom connecting lines and a background color for the active step.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.horizontal,
  linePlacement: StepperLinePlacement.bottom,
  activeStepBackground: true,
  steps: const [
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Completed',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'In progress',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: current,
                      orientation: StepperOrientation.horizontal,
                      linePlacement: StepperLinePlacement.bottom,
                      activeStepBackground: true,
                      steps: [
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 1
                              ? 'Completed'
                              : (current == 1 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 2
                              ? 'Completed'
                              : (current == 2 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 3
                              ? 'Completed'
                              : (current == 3 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 4
                              ? 'Completed'
                              : (current == 4 ? 'In progress' : 'Label'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: current > 0
                            ? () => setState(() => current--)
                            : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: current < 4
                            ? () => setState(() => current++)
                            : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Horizontal (Edge Aligned Labels)',
      builder: (context) {
        int current = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — Edge Aligned Labels',
              description:
                  'Horizontal stepper where the first step label is left-aligned and the last step label is right-aligned.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.horizontal,
  edgeLabelAlignment: true,
  steps: const [
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Completed',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'In progress',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 600,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: current,
                      orientation: StepperOrientation.horizontal,
                      edgeLabelAlignment: true,
                      steps: [
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 1
                              ? 'Completed'
                              : (current == 1 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 2
                              ? 'Completed'
                              : (current == 2 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 3
                              ? 'Completed'
                              : (current == 3 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: current > 4
                              ? 'Completed'
                              : (current == 4 ? 'In progress' : 'Label'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: current > 0
                            ? () => setState(() => current--)
                            : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: current < 4
                            ? () => setState(() => current++)
                            : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Vertical',
      builder: (context) {
        int cur = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — Vertical',
              description: 'Vertical orientation stacks steps top-to-bottom.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.vertical,
  steps: const [
    Ux4gStepItem(
      title: 'Personal',
      description: 'Name and contact',
    ),
    Ux4gStepItem(
      title: 'Address',
      description: 'Home address',
    ),
    Ux4gStepItem(title: 'Documents'),
    Ux4gStepItem(title: 'Review'),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: cur,
                      orientation: StepperOrientation.vertical,
                      steps: const [
                        Ux4gStepItem(
                          title: 'Personal',
                          description: 'Name and contact',
                        ),
                        Ux4gStepItem(
                          title: 'Address',
                          description: 'Home address',
                        ),
                        Ux4gStepItem(title: 'Documents'),
                        Ux4gStepItem(title: 'Review'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: cur > 1 ? () => setState(() => cur--) : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: cur < 4 ? () => setState(() => cur++) : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Vertical (No Labels)',
      builder: (context) {
        int cur = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — Vertical (No Labels)',
              description: 'Vertical orientation without any step labels.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.vertical,
  showLabels: false,
  stepSpacing: 48.0,
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: cur,
                      orientation: StepperOrientation.vertical,
                      showLabels: false,
                      stepSpacing: 48.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: cur > 1 ? () => setState(() => cur--) : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: cur < 4 ? () => setState(() => cur++) : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Vertical (Labels Only)',
      builder: (context) {
        int cur = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — Vertical (Labels Only)',
              description: 'Vertical orientation with only title labels.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.vertical,
  stepSpacing: 48.0,
  steps: const [
    Ux4gStepItem(title: 'Label'),
    Ux4gStepItem(title: 'Label'),
    Ux4gStepItem(title: 'Label'),
    Ux4gStepItem(title: 'Label'),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: cur,
                      orientation: StepperOrientation.vertical,
                      stepSpacing: 48.0,
                      steps: const [
                        Ux4gStepItem(title: 'Label'),
                        Ux4gStepItem(title: 'Label'),
                        Ux4gStepItem(title: 'Label'),
                        Ux4gStepItem(title: 'Label'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: cur > 1 ? () => setState(() => cur--) : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: cur < 4 ? () => setState(() => cur++) : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Vertical (Icon Aligned with Description)',
      builder: (context) {
        int cur = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Stepper — Vertical (Icon Aligned with Description)',
              description:
                  'Vertical orientation where the step icon aligns with the description text instead of the title.',
              code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  orientation: StepperOrientation.vertical,
  alignIconWithDescription: true,
  steps: const [
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Completed',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'In progress',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
    Ux4gStepItem(
      title: 'Label',
      description: 'Write description here',
      statusLabel: 'Label',
    ),
  ],
);''',
              props: _stepperProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280,
                    child: Ux4gStepper(
                      totalSteps: 4,
                      currentStep: cur,
                      orientation: StepperOrientation.vertical,
                      alignIconWithDescription: true,
                      steps: [
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: cur > 1
                              ? 'Completed'
                              : (cur == 1 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: cur > 2
                              ? 'Completed'
                              : (cur == 2 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: cur > 3
                              ? 'Completed'
                              : (cur == 3 ? 'In progress' : 'Label'),
                        ),
                        Ux4gStepItem(
                          title: 'Label',
                          description: 'Write description here',
                          statusLabel: cur > 4
                              ? 'Completed'
                              : (cur == 4 ? 'In progress' : 'Label'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gButton(
                        onPressed: cur > 1 ? () => setState(() => cur--) : null,
                        text: 'Back',
                        variant: Ux4gButtonVariant.outline,
                      ),
                      const SizedBox(width: 12),
                      Ux4gButton(
                        onPressed: cur < 4 ? () => setState(() => cur++) : null,
                        text: 'Next',
                        variant: Ux4gButtonVariant.primary,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),

    WidgetbookUseCase(
      name: 'Dashed line',
      builder: (context) => ComponentDocs(
        name: 'Stepper — Dashed Line',
        description: 'lineStyle=dashed renders dotted connector lines.',
        code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 2,
  lineStyle: StepperLineStyle.dashed,
  steps: const [
    Ux4gStepItem(title: 'Step 1'),
    Ux4gStepItem(title: 'Step 2'),
    Ux4gStepItem(title: 'Step 3'),
    Ux4gStepItem(title: 'Step 4'),
  ],
);''',
        props: _stepperProps,
        child: SizedBox(
          width: 380,
          child: Ux4gStepper(
            totalSteps: 4,
            currentStep: 2,
            lineStyle: StepperLineStyle.dashed,
            steps: const [
              Ux4gStepItem(title: 'Step 1'),
              Ux4gStepItem(title: 'Step 2'),
              Ux4gStepItem(title: 'Step 3'),
              Ux4gStepItem(title: 'Step 4'),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With error step',
      builder: (context) => ComponentDocs(
        name: 'Stepper — Error Step',
        description:
            'Mark a step as errored with isError: true on StepItem.',
        code: '''Ux4gStepper(
  totalSteps: 4,
  currentStep: 3,
  steps: const [
    Ux4gStepItem(title: 'Personal'),
    Ux4gStepItem(
      title: 'Address',
      isError: true,
      statusLabel: 'Needs review',
    ),
    Ux4gStepItem(title: 'Documents'),
    Ux4gStepItem(title: 'Review'),
  ],
);''',
        props: _stepperProps,
        child: SizedBox(
          width: 380,
          child: Ux4gStepper(
            totalSteps: 4,
            currentStep: 3,
            steps: const [
              Ux4gStepItem(title: 'Personal'),
              Ux4gStepItem(
                title: 'Address',
                isError: true,
                statusLabel: 'Needs review',
              ),
              Ux4gStepItem(title: 'Documents'),
              Ux4gStepItem(title: 'Review'),
            ],
          ),
        ),
      ),
    ),
  ],
);

final capsuleStepperComponent = WidgetbookComponent(
  name: 'CapsuleStepper (Compact Stepper)',
  useCases: [
    WidgetbookUseCase(
      name: 'Linear',
      builder: (context) {
        int cap = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'CapsuleStepper (Compact Stepper) — Linear',
              description:
                  'Capsules sandwiched between navigation arrows, labels aligned to start.',
              code: '''Ux4gCapsuleStepper(
  totalSteps: 12,
  currentStep: 1,
  stepLabel: 'Step label',
  description: 'Description',
  layout: Ux4gCapsuleStepperLayout.linear,
);''',
              props: const [],
              child: SizedBox(
                width: 380,
                child: Ux4gCapsuleStepper(
                  totalSteps: 12,
                  currentStep: cap,
                  stepLabel: 'Step label',
                  description: 'Description',
                  layout: Ux4gCapsuleStepperLayout.linear,
                  onNext: cap < 12 ? () => setState(() => cap++) : () {},
                  onPrevious: cap > 1 ? () => setState(() => cap--) : () {},
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Right Aligned',
      builder: (context) {
        int cap = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'CapsuleStepper (Compact Stepper) — Right Aligned',
              description:
                  'Capsules between arrows, step info on left, label/desc on right.',
              code: '''Ux4gCapsuleStepper(
  totalSteps: 12,
  currentStep: 1,
  stepLabel: 'Step label',
  description: 'Description',
  layout: Ux4gCapsuleStepperLayout.rightAligned,
);''',
              props: const [],
              child: SizedBox(
                width: 380,
                child: Ux4gCapsuleStepper(
                  totalSteps: 12,
                  currentStep: cap,
                  stepLabel: 'Step label',
                  description: 'Description',
                  layout: Ux4gCapsuleStepperLayout.rightAligned,
                  onNext: cap < 12 ? () => setState(() => cap++) : () {},
                  onPrevious: cap > 1 ? () => setState(() => cap--) : () {},
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Centered (Arrows Inside)',
      builder: (context) {
        int cap = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name:
                  'CapsuleStepper (Compact Stepper) — Centered (Arrows Inside)',
              description:
                  'Capsules at top, arrows surrounding step info in the center.',
              code: '''Ux4gCapsuleStepper(
  totalSteps: 12,
  currentStep: 1,
  stepLabel: 'Step label',
  description: 'Description',
  layout: Ux4gCapsuleStepperLayout.centered,
);''',
              props: const [],
              child: SizedBox(
                width: 380,
                child: Ux4gCapsuleStepper(
                  totalSteps: 12,
                  currentStep: cap,
                  stepLabel: 'Step label',
                  description: 'Description',
                  layout: Ux4gCapsuleStepperLayout.centered,
                  onNext: cap < 12 ? () => setState(() => cap++) : () {},
                  onPrevious: cap > 1 ? () => setState(() => cap--) : () {},
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Centered (Arrows Outside)',
      builder: (context) {
        int cap = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name:
                  'CapsuleStepper (Compact Stepper) — Centered (Arrows Outside)',
              description:
                  'Capsules at top, arrows pushed to the far edges of the container.',
              code: '''Ux4gCapsuleStepper(
  totalSteps: 12,
  currentStep: 1,
  stepLabel: 'Step label',
  description: 'Description',
  layout: Ux4gCapsuleStepperLayout.centeredBetween,
);''',
              props: const [],
              child: SizedBox(
                width: 380,
                child: Ux4gCapsuleStepper(
                  totalSteps: 12,
                  currentStep: cap,
                  stepLabel: 'Step label',
                  description: 'Description',
                  layout: Ux4gCapsuleStepperLayout.centeredBetween,
                  onNext: cap < 12 ? () => setState(() => cap++) : () {},
                  onPrevious: cap > 1 ? () => setState(() => cap--) : () {},
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Split',
      builder: (context) {
        int cap = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'CapsuleStepper (Compact Stepper) — Split',
              description:
                  'Capsules at top, labels spread across, arrows on the bottom right.',
              code: '''Ux4gCapsuleStepper(
  totalSteps: 12,
  currentStep: 1,
  stepLabel: 'Step label',
  description: 'Description',
  layout: Ux4gCapsuleStepperLayout.split,
);''',
              props: const [],
              child: SizedBox(
                width: 380,
                child: Ux4gCapsuleStepper(
                  totalSteps: 12,
                  currentStep: cap,
                  stepLabel: 'Step label',
                  description: 'Description',
                  layout: Ux4gCapsuleStepperLayout.split,
                  onNext: cap < 12 ? () => setState(() => cap++) : () {},
                  onPrevious: cap > 1 ? () => setState(() => cap--) : () {},
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Result Row ────────────────────────────────────────────────────────────────

final resultRowComponent = WidgetbookComponent(
  name: 'Result List',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'ResultRow',
        description:
            'An expandable list-row that summarises a record with a status tag, '
            'key-value detail pairs, and an optional action button.',
        code: '''Ux4gResultRow(
  title: 'Application #2024-001',
  statusTag: 'Approved',
  tagColorScheme: Ux4gTagColor.success,
  actionButtonText: 'View',
  onActionPressed: () {},
  details: const [
    Ux4gResultDetail(label: 'Applicant', value: 'Ravi Kumar'),
    Ux4gResultDetail(label: 'Date', value: '12 May 2025'),
    Ux4gResultDetail(
      label: 'Amount',
      value: '₹1,20,000',
      isBold: true,
    ),
  ],
);''',
        props: const [
          PropRow(
            name: 'title',
            type: 'String',
            description: 'Row heading.',
            required: true,
          ),
          PropRow(
            name: 'statusTag',
            type: 'String?',
            description: 'Tag label.',
          ),
          PropRow(
            name: 'tagColorScheme',
            type: 'Ux4gTagColor',
            description: 'Tag colour.',
            defaultValue: 'neutral',
          ),
          PropRow(
            name: 'metadataSegments',
            type: 'List<Ux4gPillSegment>?',
            description: 'Metadata pill segments.',
          ),
          PropRow(
            name: 'details',
            type: 'List<Ux4gResultDetail>',
            description: 'Key-value pairs shown when expanded.',
            defaultValue: '[]',
          ),
          PropRow(
            name: 'actionButtonText',
            type: 'String?',
            description: 'CTA button label.',
          ),
          PropRow(
            name: 'onActionPressed',
            type: 'VoidCallback?',
            description: 'Action button callback.',
          ),
          PropRow(
            name: 'actionButtonIcon',
            type: 'IconData?',
            description: 'Icon for action button.',
          ),
          PropRow(
            name: 'actionButtonColor',
            type: 'Color?',
            description: 'Color for action button.',
          ),
          PropRow(
            name: 'expandedChild',
            type: 'Widget?',
            description: 'Custom widget to show when expanded.',
          ),
          PropRow(
            name: 'detailsColumns',
            type: 'int',
            description: 'Number of columns for details.',
            defaultValue: '2',
          ),
          PropRow(
            name: 'initialExpanded',
            type: 'bool',
            description: 'Start in expanded state.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'onToggle',
            type: 'ValueChanged<bool>?',
            description: 'Called when expansion state changes.',
          ),
          PropRow(
            name: 'showBottomDivider',
            type: 'bool',
            description: 'Show divider at bottom.',
            defaultValue: 'true',
          ),
        ],
        child: SizedBox(
          width: 380,
          child: Ux4gResultRow(
            title: 'Application #2024-001',
            statusTag: 'Approved',
            tagColorScheme: Ux4gTagColor.success,
            actionButtonText: 'View',
            onActionPressed: () {},
            details: const [
              Ux4gResultDetail(label: 'Applicant', value: 'Ravi Kumar'),
              Ux4gResultDetail(label: 'Date', value: '12 May 2025'),
              Ux4gResultDetail(
                label: 'Amount',
                value: '₹1,20,000',
                isBold: true,
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With Background',
      builder: (context) => ComponentDocs(
        name: 'With Background (Card Style)',
        description:
            'Result rows wrapped inside a card container. Shows both collapsed and expanded states.',
        code: '''// Collapsed
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      actionButtonText: 'Track',
      onActionPressed: () {},
      initialExpanded: false,
      showBottomDivider: false,
      metadataSegments: [
        Ux4gPillSegment(
          text: '8 days left',

          leading: Container(
            width: 8, height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFF59E0B),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Ux4gPillSegment(
          text: 'Under review',
          textColor: Color(0xFFD97706),
        ),
      ],
      details: const [
        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
    ),
)

// Expanded
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      actionButtonText: 'Track',
      onActionPressed: () {},
      initialExpanded: true,
      showBottomDivider: false,
      metadataSegments: [
        Ux4gPillSegment(
          text: '8 days left',

          leading: Container(
            width: 8, height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFF59E0B),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Ux4gPillSegment(
          text: 'Under review',
          textColor: Color(0xFFD97706),
        ),
      ],
      details: const [
        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
      expandedChild: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escalation',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF7F1D1D),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Register grievance',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4338CA),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 16, color: Color(0xFF4338CA)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
)''',
        child: SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Collapsed
              Ux4gCard(
                cornerRadius: 12,
                child: Ux4gResultRow(
                  title: 'Income Certificate',
                  actionButtonText: 'Track',
                  onActionPressed: () {},
                  initialExpanded: false,
                  showBottomDivider: false,
                  metadataSegments: [
                    Ux4gPillSegment(
                      text: '8 days left',

                      leading: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF59E0B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Ux4gPillSegment(
                      text: 'Under review',
                      textColor: Color(0xFFD97706),
                    ),
                  ],
                  details: const [
                    Ux4gResultDetail(
                      label: 'Reference Number',
                      value: 'INC-2026-MH-04127',
                    ),
                    Ux4gResultDetail(
                      label: 'Last Updated Date',
                      value: '10 Apr 2026',
                    ),
                    Ux4gResultDetail(
                      label: 'Submitted Date',
                      value: '1 Apr 2026',
                    ),
                    Ux4gResultDetail(
                      label: 'Assigned Officer',
                      value: 'Rahul Sharma',
                    ),
                    Ux4gResultDetail(
                      label: 'Department',
                      value: 'Revenue Department',
                    ),
                    Ux4gResultDetail(
                      label: 'Documents',
                      value: 'ID Proof, Address Proof',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Expanded
              Ux4gCard(
                cornerRadius: 12,
                child: Ux4gResultRow(
                  title: 'Income Certificate',
                  actionButtonText: 'Track',
                  onActionPressed: () {},
                  initialExpanded: true,
                  showBottomDivider: false,
                  metadataSegments: [
                    Ux4gPillSegment(
                      text: '8 days left',

                      leading: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF59E0B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Ux4gPillSegment(
                      text: 'Under review',
                      textColor: Color(0xFFD97706),
                    ),
                  ],
                  details: const [
                    Ux4gResultDetail(
                      label: 'Reference Number',
                      value: 'INC-2026-MH-04127',
                    ),
                    Ux4gResultDetail(
                      label: 'Last Updated Date',
                      value: '10 Apr 2026',
                    ),
                    Ux4gResultDetail(
                      label: 'Submitted Date',
                      value: '1 Apr 2026',
                    ),
                    Ux4gResultDetail(
                      label: 'Assigned Officer',
                      value: 'Rahul Sharma',
                    ),
                    Ux4gResultDetail(
                      label: 'Department',
                      value: 'Revenue Department',
                    ),
                    Ux4gResultDetail(
                      label: 'Documents',
                      value: 'ID Proof, Address Proof',
                    ),
                  ],
                  expandedChild: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Escalation',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7F1D1D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Register grievance',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4338CA),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Color(0xFF4338CA),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Without Background',
      builder: (context) => ComponentDocs(
        name: 'Without Background (List Style)',
        description:
            'Result rows without a card wrapper, separated by dividers. Shows both collapsed and expanded states.',
        code: '''// Collapsed
Ux4gResultRow(
  title: 'Income Certificate',
  actionButtonText: 'Track',
  onActionPressed: () {},
  initialExpanded: false,
  showBottomDivider: true,
  metadataSegments: [
    Ux4gPillSegment(
      text: '8 days left',

      leading: Container(
        width: 8, height: 8,
        decoration: const BoxDecoration(
          color: Color(0xFFF59E0B),
          shape: BoxShape.circle,
        ),
      ),
    ),
    const Ux4gPillSegment(
      text: 'Under review',
      textColor: Color(0xFFD97706),
    ),
  ],
  details: const [
    Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
    Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
)

// Expanded
Ux4gResultRow(
  title: 'Income Certificate',
  actionButtonText: 'Track',
  onActionPressed: () {},
  initialExpanded: true,
  showBottomDivider: true,
  metadataSegments: [
    Ux4gPillSegment(
      text: '8 days left',

      leading: Container(
        width: 8, height: 8,
        decoration: const BoxDecoration(
          color: Color(0xFFF59E0B),
          shape: BoxShape.circle,
        ),
      ),
    ),
    const Ux4gPillSegment(
      text: 'Under review',
      textColor: Color(0xFFD97706),
    ),
  ],
  details: const [
    Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
    Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
  expandedChild: Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Escalation',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF7F1D1D),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Register grievance',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4338CA),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 16, color: Color(0xFF4338CA)),
            ],
          ),
        ),
      ],
    ),
  ),
)''',
        child: SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Collapsed
              Ux4gResultRow(
                title: 'Income Certificate',
                actionButtonText: 'Track',
                onActionPressed: () {},
                initialExpanded: false,
                showBottomDivider: true,
                metadataSegments: [
                  Ux4gPillSegment(
                    text: '8 days left',

                    leading: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF59E0B),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Ux4gPillSegment(
                    text: 'Under review',
                    textColor: Color(0xFFD97706),
                  ),
                ],
                details: const [
                  Ux4gResultDetail(
                    label: 'Reference Number',
                    value: 'INC-2026-MH-04127',
                  ),
                  Ux4gResultDetail(
                    label: 'Last Updated Date',
                    value: '10 Apr 2026',
                  ),
                  Ux4gResultDetail(
                    label: 'Submitted Date',
                    value: '1 Apr 2026',
                  ),
                  Ux4gResultDetail(
                    label: 'Assigned Officer',
                    value: 'Rahul Sharma',
                  ),
                  Ux4gResultDetail(
                    label: 'Department',
                    value: 'Revenue Department',
                  ),
                  Ux4gResultDetail(
                    label: 'Documents',
                    value: 'ID Proof, Address Proof',
                  ),
                ],
              ),
              // Expanded
              Ux4gResultRow(
                title: 'Income Certificate',
                actionButtonText: 'Track',
                onActionPressed: () {},
                initialExpanded: true,
                showBottomDivider: true,
                metadataSegments: [
                  Ux4gPillSegment(
                    text: '8 days left',

                    leading: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF59E0B),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Ux4gPillSegment(
                    text: 'Under review',
                    textColor: Color(0xFFD97706),
                  ),
                ],
                details: const [
                  Ux4gResultDetail(
                    label: 'Reference Number',
                    value: 'INC-2026-MH-04127',
                  ),
                  Ux4gResultDetail(
                    label: 'Last Updated Date',
                    value: '10 Apr 2026',
                  ),
                  Ux4gResultDetail(
                    label: 'Submitted Date',
                    value: '1 Apr 2026',
                  ),
                  Ux4gResultDetail(
                    label: 'Assigned Officer',
                    value: 'Rahul Sharma',
                  ),
                  Ux4gResultDetail(
                    label: 'Department',
                    value: 'Revenue Department',
                  ),
                  Ux4gResultDetail(
                    label: 'Documents',
                    value: 'ID Proof, Address Proof',
                  ),
                ],
                expandedChild: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Escalation',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF7F1D1D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Register grievance',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4338CA),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Color(0xFF4338CA),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Certificate Download',
      builder: (context) {
        final withBackground = context.knobs.boolean(
          label: 'With Background',
          initialValue: true,
        );

        final codeString = withBackground
            ? '''// Collapsed
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      titleTrailing: const Icon(Icons.check_circle, size: 20, color: Color(0xFF16A34A)),
      actionButtonText: 'Download',
      actionButtonIcon: Icons.download,
      onActionPressed: () {},
      initialExpanded: false,
      showBottomDivider: false,
      detailsColumns: 2,
      details: const [
        Ux4gResultDetail(label: 'Issued', value: '05 Apr 2026'),
        Ux4gResultDetail(label: 'Valid till', value: '05 Apr 2027'),
        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
    ),
)

// Expanded
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      titleTrailing: const Icon(Icons.check_circle, size: 20, color: Color(0xFF16A34A)),
      actionButtonText: 'Download',
      actionButtonIcon: Icons.download,
      onActionPressed: () {},
      initialExpanded: true,
      showBottomDivider: false,
      detailsColumns: 2,
      details: const [
        Ux4gResultDetail(label: 'Issued', value: '05 Apr 2026'),
        Ux4gResultDetail(label: 'Valid till', value: '05 Apr 2027'),
        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
    ),
)'''
            : '''// Collapsed
Ux4gResultRow(
  title: 'Income Certificate',
  titleTrailing: const Icon(Icons.check_circle, size: 20, color: Color(0xFF16A34A)),
  actionButtonText: 'Download',
  actionButtonIcon: Icons.download,
  onActionPressed: () {},
  initialExpanded: false,
  showBottomDivider: true,
  detailsColumns: 2,
  details: const [
    Ux4gResultDetail(label: 'Issued', value: '05 Apr 2026'),
    Ux4gResultDetail(label: 'Valid till', value: '05 Apr 2027'),
    Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
    Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
)

// Expanded
Ux4gResultRow(
  title: 'Income Certificate',
  titleTrailing: const Icon(Icons.check_circle, size: 20, color: Color(0xFF16A34A)),
  actionButtonText: 'Download',
  actionButtonIcon: Icons.download,
  onActionPressed: () {},
  initialExpanded: true,
  showBottomDivider: true,
  detailsColumns: 2,
  details: const [
    Ux4gResultDetail(label: 'Issued', value: '05 Apr 2026'),
    Ux4gResultDetail(label: 'Valid till', value: '05 Apr 2027'),
    Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
    Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
)''';

        Widget buildRow({required bool expanded}) {
          return Ux4gResultRow(
            title: 'Income Certificate',
            titleTrailing: const Icon(
              Icons.check_circle,
              size: 20,
              color: Color(0xFF16A34A),
            ),
            actionButtonText: 'Download',
            actionButtonIcon: Icons.download,
            onActionPressed: () {},
            initialExpanded: expanded,
            showBottomDivider: !withBackground,
            detailsColumns: 2,
            details: const [
              Ux4gResultDetail(label: 'Issued', value: '05 Apr 2026'),
              Ux4gResultDetail(label: 'Valid till', value: '05 Apr 2027'),
              Ux4gResultDetail(
                label: 'Reference Number',
                value: 'INC-2026-MH-04127',
              ),
              Ux4gResultDetail(
                label: 'Last Updated Date',
                value: '10 Apr 2026',
              ),
              Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
              Ux4gResultDetail(
                label: 'Assigned Officer',
                value: 'Rahul Sharma',
              ),
              Ux4gResultDetail(
                label: 'Department',
                value: 'Revenue Department',
              ),
              Ux4gResultDetail(
                label: 'Documents',
                value: 'ID Proof, Address Proof',
              ),
            ],
          );
        }

        return ComponentDocs(
          name: 'Certificate Download',
          description:
              'Result row with a green checkmark status icon, download button, and certificate details in a 2-column grid. Shows both collapsed and expanded states.',
          code: codeString,
          child: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (withBackground) ...[
                  Ux4gCard(cornerRadius: 12, child: buildRow(expanded: false)),
                  const SizedBox(height: 16),
                  Ux4gCard(cornerRadius: 12, child: buildRow(expanded: true)),
                ] else ...[
                  buildRow(expanded: false),
                  buildRow(expanded: true),
                ],
              ],
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Service Apply',
      builder: (context) {
        final withBackground = context.knobs.boolean(
          label: 'With Background',
          initialValue: true,
        );

        final codeString = withBackground
            ? '''// Collapsed
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      statusTag: 'Paid',
      tagColorScheme: Ux4gTagColor.neutral,
      actionButtonText: 'Apply',
      onActionPressed: () {},
      initialExpanded: false,
      showBottomDivider: false,
      detailsColumns: 2,
      customMetadata: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('₹ 120/-', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
          SizedBox(width: 12),
          Icon(Icons.schedule, size: 14, color: Color(0xFF6B7280)),
          SizedBox(width: 4),
          Text('20 mins', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
        ],
      ),
      details: const [
        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
    ),
)

// Expanded
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      statusTag: 'Paid',
      tagColorScheme: Ux4gTagColor.neutral,
      actionButtonText: 'Apply',
      onActionPressed: () {},
      initialExpanded: true,
      showBottomDivider: false,
      detailsColumns: 2,
      customMetadata: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('₹ 120/-', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
          SizedBox(width: 12),
          Icon(Icons.schedule, size: 14, color: Color(0xFF6B7280)),
          SizedBox(width: 4),
          Text('20 mins', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
        ],
      ),
      details: const [
        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
    ),
)'''
            : '''// Collapsed
Ux4gResultRow(
  title: 'Income Certificate',
  statusTag: 'Paid',
  tagColorScheme: Ux4gTagColor.neutral,
  actionButtonText: 'Apply',
  onActionPressed: () {},
  initialExpanded: false,
  showBottomDivider: true,
  detailsColumns: 2,
  customMetadata: const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('₹ 120/-', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
      SizedBox(width: 12),
      Icon(Icons.schedule, size: 14, color: Color(0xFF6B7280)),
      SizedBox(width: 4),
      Text('20 mins', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
    ],
  ),
  details: const [
    Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
    Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
)

// Expanded
Ux4gResultRow(
  title: 'Income Certificate',
  statusTag: 'Paid',
  tagColorScheme: Ux4gTagColor.neutral,
  actionButtonText: 'Apply',
  onActionPressed: () {},
  initialExpanded: true,
  showBottomDivider: true,
  detailsColumns: 2,
  customMetadata: const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('₹ 120/-', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
      SizedBox(width: 12),
      Icon(Icons.schedule, size: 14, color: Color(0xFF6B7280)),
      SizedBox(width: 4),
      Text('20 mins', style: TextStyle(color: Color(0xFF374151), fontSize: 14)),
    ],
  ),
  details: const [
    Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
    Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
)''';

        Widget buildRow({required bool expanded}) {
          return Ux4gResultRow(
            title: 'Income Certificate',
            statusTag: 'Paid',
            tagColorScheme: Ux4gTagColor.neutral,
            actionButtonText: 'Apply',
            onActionPressed: () {},
            initialExpanded: expanded,
            showBottomDivider: !withBackground,
            detailsColumns: 2,
            customMetadata: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '₹ 120/-',
                  style: TextStyle(color: Color(0xFF374151), fontSize: 14),
                ),
                SizedBox(width: 12),
                Icon(Icons.schedule, size: 14, color: Color(0xFF6B7280)),
                SizedBox(width: 4),
                Text(
                  '20 mins',
                  style: TextStyle(color: Color(0xFF374151), fontSize: 14),
                ),
              ],
            ),
            details: const [
              Ux4gResultDetail(
                label: 'Reference Number',
                value: 'INC-2026-MH-04127',
              ),
              Ux4gResultDetail(
                label: 'Last Updated Date',
                value: '10 Apr 2026',
              ),
              Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
              Ux4gResultDetail(
                label: 'Assigned Officer',
                value: 'Rahul Sharma',
              ),
              Ux4gResultDetail(
                label: 'Department',
                value: 'Revenue Department',
              ),
              Ux4gResultDetail(
                label: 'Documents',
                value: 'ID Proof, Address Proof',
              ),
            ],
          );
        }

        return ComponentDocs(
          name: 'Service Apply',
          description:
              'Result row showing service details with a status tag and metadata inline, and an apply button.',
          code: codeString,
          child: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (withBackground) ...[
                  Ux4gCard(cornerRadius: 12, child: buildRow(expanded: false)),
                  const SizedBox(height: 16),
                  Ux4gCard(cornerRadius: 12, child: buildRow(expanded: true)),
                ] else ...[
                  buildRow(expanded: false),
                  buildRow(expanded: true),
                ],
              ],
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'SLA Escalated',
      builder: (context) {
        final withBackground = context.knobs.boolean(
          label: 'With Background',
          initialValue: true,
        );

        final codeString = withBackground
            ? '''// Collapsed
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      statusTag: 'Escalated',
      tagColorScheme: Ux4gTagColor.brand,
      actionButtonText: 'Track',
      actionLeading: const Icon(Icons.priority_high, size: 16, color: Color(0xFFDC2626)),
      onActionPressed: () {},
      initialExpanded: false,
      showBottomDivider: false,
      detailsColumns: 2,
      details: const [
        Ux4gResultDetail(label: 'Reference Number', value: 'GRV-2026-04127'),
        Ux4gResultDetail(
          label: 'SLA Status',
          value: '',
          customValueWidget: Ux4gUnifiedPillTag(
            segments: [
              Ux4gPillSegment(
                text: '3 days overdue',
                bold: true,
                textColor: Color(0xFF374151),
                leading: Icon(Icons.circle, size: 8, color: Color(0xFFDC2626)),
              ),
            ],
            size: Ux4gTagSize.m,
          ),
        ),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
    ),
)

// Expanded
Ux4gCard(
  cornerRadius: 12,
  child: Ux4gResultRow(
      title: 'Income Certificate',
      statusTag: 'Escalated',
      tagColorScheme: Ux4gTagColor.brand,
      actionButtonText: 'Track',
      actionLeading: const Icon(Icons.priority_high, size: 16, color: Color(0xFFDC2626)),
      onActionPressed: () {},
      initialExpanded: true,
      showBottomDivider: false,
      detailsColumns: 2,
      details: const [
        Ux4gResultDetail(label: 'Reference Number', value: 'GRV-2026-04127'),
        Ux4gResultDetail(
          label: 'SLA Status',
          value: '',
          customValueWidget: Ux4gUnifiedPillTag(
            segments: [
              Ux4gPillSegment(
                text: '3 days overdue',
                bold: true,
                textColor: Color(0xFF374151),
                leading: Icon(Icons.circle, size: 8, color: Color(0xFFDC2626)),
              ),
            ],
            size: Ux4gTagSize.m,
          ),
        ),
        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
      ],
    ),
)'''
            : '''// Collapsed
Ux4gResultRow(
  title: 'Income Certificate',
  statusTag: 'Escalated',
  tagColorScheme: Ux4gTagColor.brand,
  actionButtonText: 'Track',
  actionLeading: const Icon(Icons.priority_high, size: 16, color: Color(0xFFDC2626)),
  onActionPressed: () {},
  initialExpanded: false,
  showBottomDivider: true,
  detailsColumns: 2,
  details: const [
    Ux4gResultDetail(label: 'Reference Number', value: 'GRV-2026-04127'),
    Ux4gResultDetail(
      label: 'SLA Status',
      value: '',
      customValueWidget: Ux4gUnifiedPillTag(
        segments: [
          Ux4gPillSegment(
            text: '3 days overdue',
            bold: true,
            textColor: Color(0xFF374151),
            leading: Icon(Icons.circle, size: 8, color: Color(0xFFDC2626)),
          ),
        ],
        size: Ux4gTagSize.m,
      ),
    ),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
)

// Expanded
Ux4gResultRow(
  title: 'Income Certificate',
  statusTag: 'Escalated',
  tagColorScheme: Ux4gTagColor.brand,
  actionButtonText: 'Track',
  actionLeading: const Icon(Icons.priority_high, size: 16, color: Color(0xFFDC2626)),
  onActionPressed: () {},
  initialExpanded: true,
  showBottomDivider: true,
  detailsColumns: 2,
  details: const [
    Ux4gResultDetail(label: 'Reference Number', value: 'GRV-2026-04127'),
    Ux4gResultDetail(
      label: 'SLA Status',
      value: '',
      customValueWidget: Ux4gUnifiedPillTag(
        segments: [
          Ux4gPillSegment(
            text: '3 days overdue',
            bold: true,
            textColor: Color(0xFF374151),
            leading: Icon(Icons.circle, size: 8, color: Color(0xFFDC2626)),
          ),
        ],
        size: Ux4gTagSize.m,
      ),
    ),
    Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
    Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
    Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
    Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
  ],
)''';

        Widget buildRow({required bool expanded}) {
          return Ux4gResultRow(
            title: 'Income Certificate',
            statusTag: 'Escalated',
            tagColorScheme: Ux4gTagColor.brand,
            actionButtonText: 'Track',
            actionLeading: const Icon(
              Icons.priority_high,
              size: 16,
              color: Color(0xFFDC2626),
            ),
            onActionPressed: () {},
            initialExpanded: expanded,
            showBottomDivider: !withBackground,
            detailsColumns: 2,
            details: const [
              Ux4gResultDetail(
                label: 'Reference Number',
                value: 'GRV-2026-04127',
              ),
              Ux4gResultDetail(
                label: 'SLA Status',
                value: '',
                customValueWidget: Ux4gUnifiedPillTag(
                  segments: [
                    Ux4gPillSegment(
                      text: '3 days overdue',
                      bold: true,
                      textColor: Color(0xFF374151),
                      leading: Icon(
                        Icons.circle,
                        size: 8,
                        color: Color(0xFFDC2626),
                      ),
                    ),
                  ],
                  size: Ux4gTagSize.m,
                ),
              ),
              Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
              Ux4gResultDetail(
                label: 'Assigned Officer',
                value: 'Rahul Sharma',
              ),
              Ux4gResultDetail(
                label: 'Department',
                value: 'Revenue Department',
              ),
              Ux4gResultDetail(
                label: 'Documents',
                value: 'ID Proof, Address Proof',
              ),
            ],
          );
        }

        return ComponentDocs(
          name: 'SLA Escalated',
          description:
              'Result row showing an escalated ticket with SLA status and action leading icon.',
          code: codeString,
          child: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (withBackground) ...[
                  Ux4gCard(cornerRadius: 12, child: buildRow(expanded: false)),
                  const SizedBox(height: 16),
                  Ux4gCard(cornerRadius: 12, child: buildRow(expanded: true)),
                ] else ...[
                  buildRow(expanded: false),
                  buildRow(expanded: true),
                ],
              ],
            ),
          ),
        );
      },
    ),
  ],
);

// ── Social Links ──────────────────────────────────────────────────────────────

final socialLinkComponent = WidgetbookComponent(
  name: 'Standard',
  useCases: [
    WidgetbookUseCase(
      name: 'Single Icon',
      builder: (context) {
        final icon = context.knobs.list<SocialMediaIcon>(
          label: 'Icon',
          options: SocialMediaIcon.values,
          initialOption: SocialMediaIcon.twitter,
          labelBuilder: (icon) => icon.name,
        );
        final size = context.knobs.list<SocialLinkSize>(
          label: 'Size',
          options: SocialLinkSize.values,
          initialOption: SocialLinkSize.m,
          labelBuilder: (size) => size.name,
        );
        final useColoredIcon = context.knobs.boolean(
          label: 'Use Colored Icon',
          initialValue: false,
        );
        final enableBackground = context.knobs.boolean(
          label: 'Enable Background',
          initialValue: false,
        );

        return ComponentDocs(
          name: 'SocialLink',
          description:
              'SVG social-media icon buttons. Choose from the SocialMediaIcon enum. '
              'Enable background for a contained pill appearance.',
          code:
              '''Ux4gSocialLink(
  icon: SocialMediaIcon.${icon.name},
  size: SocialLinkSize.${size.name},
  useColoredIcon: $useColoredIcon,
  enableBackground: $enableBackground,
);''',
          props: const [
            PropRow(
              name: 'icon',
              type: 'SocialMediaIcon',
              description: 'Social icon type.',
              required: true,
            ),
            PropRow(
              name: 'size',
              type: 'SocialLinkSize',
              description: 'xs / s / m / l / xl / xxl.',
              defaultValue: 'm',
            ),
            PropRow(
              name: 'color',
              type: 'Color?',
              description: 'Custom icon color.',
            ),
            PropRow(
              name: 'onPressed',
              type: 'VoidCallback?',
              description: 'Tap callback.',
            ),
            PropRow(
              name: 'tooltip',
              type: 'String?',
              description: 'Tooltip text.',
            ),
            PropRow(
              name: 'containerSize',
              type: 'double?',
              description: 'Custom background container size.',
            ),
            PropRow(
              name: 'containerColor',
              type: 'Color?',
              description: 'Custom background color.',
            ),
            PropRow(
              name: 'enableBackground',
              type: 'bool',
              description: 'Wrap in background container.',
              defaultValue: 'false',
            ),
            PropRow(
              name: 'useColoredIcon',
              type: 'bool',
              description: 'Show brand colour.',
              defaultValue: 'false',
            ),
          ],
          child: Center(
            child: Ux4gSocialLink(
              icon: icon,
              size: size,
              useColoredIcon: useColoredIcon,
              enableBackground: enableBackground,
            ),
          ),
        );
      },
    ),
  ],
);

// ── Journey Timeline ──────────────────────────────────────────────────────────

final journeyTimelineComponent = WidgetbookComponent(
  name: 'Journey Timeline',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'JourneyTimeline',
        description:
            'A vertical timeline showing the progress of a multi-stage journey. '
            'Steps are: completed, current, or upcoming.',
        code: '''Ux4gJourneyTimeline(
  currentStep: 1,
  steps: const [
    Ux4gJourneyStep(
      title: 'Application Submitted',
      date: '01 Jan 2025',
      state: Ux4gJourneyStepState.completed,
    ),
    Ux4gJourneyStep(
      title: 'Under Review',
      date: '05 Jan 2025',
      state: Ux4gJourneyStepState.current,
    ),
    Ux4gJourneyStep(
      title: 'Approval Pending',
      state: Ux4gJourneyStepState.upcoming,
    ),
  ],
);''',
        props: const [
          PropRow(
            name: 'steps',
            type: 'List<Ux4gJourneyStep>',
            description: 'Timeline steps.',
            required: true,
          ),
          PropRow(
            name: 'header',
            type: 'Ux4gJourneyHeader?',
            description: 'Header above the timeline.',
          ),
          PropRow(
            name: 'currentStep',
            type: 'int?',
            description: 'Index of the active step.',
          ),
          PropRow(
            name: 'orientation',
            type: 'Ux4gJourneyOrientation',
            description: 'vertical or horizontal.',
            defaultValue: 'vertical',
          ),
          PropRow(
            name: 'indicatorSize',
            type: 'double',
            description: 'Size of circle indicator.',
            defaultValue: '20',
          ),
          PropRow(
            name: 'lineWidth',
            type: 'double',
            description: 'Width of connector line.',
            defaultValue: '3',
          ),
          PropRow(
            name: 'indicatorCardSpacing',
            type: 'double',
            description: 'Gap between indicator and card.',
            defaultValue: '12',
          ),
          PropRow(
            name: 'stepSpacing',
            type: 'double',
            description: 'Gap between steps.',
            defaultValue: '12',
          ),
          PropRow(
            name: 'activeColor',
            type: 'Color?',
            description: 'Color for completed/current steps.',
          ),
          PropRow(
            name: 'inactiveColor',
            type: 'Color?',
            description: 'Color for upcoming steps.',
          ),
          PropRow(
            name: 'cardBorderRadius',
            type: 'double',
            description: 'Corner radius of step cards.',
            defaultValue: '8',
          ),
          PropRow(
            name: 'cardPadding',
            type: 'EdgeInsetsGeometry?',
            description: 'Padding inside cards.',
          ),
          PropRow(
            name: 'cardColor',
            type: 'Color?',
            description: 'Background color of cards.',
          ),
          PropRow(
            name: 'cardBorderColor',
            type: 'Color?',
            description: 'Border color of cards.',
          ),
        ],
        child: SizedBox(
          width: 340,
          child: Ux4gJourneyTimeline(
            currentStep: 1,
            steps: const [
              Ux4gJourneyStep(
                title: 'Application Submitted',
                date: '01 Jan 2025',
                state: Ux4gJourneyStepState.completed,
              ),
              Ux4gJourneyStep(
                title: 'Under Review',
                date: '05 Jan 2025',
                state: Ux4gJourneyStepState.current,
              ),
              Ux4gJourneyStep(
                title: 'Approval Pending',
                date: 'Upcoming',
                state: Ux4gJourneyStepState.upcoming,
              ),
              Ux4gJourneyStep(
                title: 'Disbursement',
                state: Ux4gJourneyStepState.upcoming,
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With Header',
      builder: (context) => ComponentDocs(
        name: 'Vertical Timeline with Header',
        description:
            'A vertical timeline that includes an optional header section.',
        code: '''Ux4gJourneyTimeline(
  header: const Ux4gJourneyHeader(
    title: 'Title',
    description: 'Description',
    icon: Icons.settings_outlined,
  ),
  currentStep: 1,
  steps: const [
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
  ],
);''',
        child: SizedBox(
          width: 340,
          child: Ux4gJourneyTimeline(
            header: const Ux4gJourneyHeader(
              title: 'Title',
              description: 'Description',
              icon: Icons.settings_outlined,
            ),
            currentStep: 1,
            steps: const [
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Card Variants',
      builder: (context) => ComponentDocs(
        name: 'Timeline Card Variants',
        description:
            'Demonstrates different step card features including helping text, icons, and status badges.',
        code: '''Ux4gJourneyTimeline(
  currentStep: 4,
  steps: [
    // Simple
    const Ux4gJourneyStep(
      title: 'Title', date: 'Date', tag: 'Tag'
    ),
    // With helping text
    const Ux4gJourneyStep(
      title: 'Title', date: 'Date', tag: 'Tag', helpingText: 'Helping Text'
    ),
    // With icon
    const Ux4gJourneyStep(
      title: 'Title', date: 'Date', tag: 'Tag', icon: Icons.link
    ),
    // With status
    Ux4gJourneyStep(
      title: 'Title', date: 'Date', tag: 'Tag',
      status: Ux4gJourneyStepStatus(
        text: '2 days remaining',
        dotColor: Ux4gPalette.secondary,
        badgeText: 'Pending',
        badgeColor: Ux4gPalette.secondary.withValues(alpha: 0.12),
        badgeTextColor: Ux4gPalette.secondary,
      ),
    ),
    // Upcoming
    const Ux4gJourneyStep(
      title: 'Title', date: 'Date', tag: 'Tag'
    ),
  ],
);''',
        child: SizedBox(
          width: 340,
          child: Ux4gJourneyTimeline(
            currentStep: 4,
            steps: [
              const Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              const Ux4gJourneyStep(
                title: 'Title',
                date: 'Date',
                tag: 'Tag',
                helpingText: 'Helping Text',
              ),
              const Ux4gJourneyStep(
                title: 'Title',
                date: 'Date',
                tag: 'Tag',
                icon: Icons.link,
              ),
              Ux4gJourneyStep(
                title: 'Title',
                date: 'Date',
                tag: 'Tag',
                status: Ux4gJourneyStepStatus(
                  text: '2 days remaining',
                  dotColor: Ux4gPalette.secondary,
                  badgeText: 'Pending',
                  badgeColor: Ux4gPalette.secondary.withValues(alpha: 0.12),
                  badgeTextColor: Ux4gPalette.secondary,
                ),
              ),
              const Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Horizontal',
      builder: (context) => ComponentDocs(
        name: 'Horizontal Timeline',
        description:
            'A timeline arranged horizontally, useful for wide spaces or scrolling views.',
        code: '''Ux4gJourneyTimeline(
  orientation: Ux4gJourneyOrientation.horizontal,
  header: const Ux4gJourneyHeader(
    title: 'Title',
    description: 'Description',
    icon: Icons.settings_outlined,
  ),
  currentStep: 1,
  steps: const [
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
    Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
  ],
);''',
        child: SizedBox(
          width: 600,
          child: Ux4gJourneyTimeline(
            orientation: Ux4gJourneyOrientation.horizontal,
            header: const Ux4gJourneyHeader(
              title: 'Title',
              description: 'Description',
              icon: Icons.settings_outlined,
            ),
            currentStep: 1,
            steps: const [
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
              Ux4gJourneyStep(title: 'Title', date: 'Date', tag: 'Tag'),
            ],
          ),
        ),
      ),
    ),
  ],
);

// ── Status Pipeline ───────────────────────────────────────────────────────────

final statusPipelineComponent = WidgetbookComponent(
  name: 'Status Pipeline',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'StatusPipeline',
        description:
            'A horizontal pipeline showing discrete processing stages. '
            'Steps can be completed, current, upcoming, error, or warning.',
        code: '''Ux4gStatusPipeline(
  currentStep: 2,
  steps: const [
    Ux4gPipelineStep(label: 'Submitted', description: '5 Apr'),
    Ux4gPipelineStep(label: 'Verified',  description: '6 Apr'),
    Ux4gPipelineStep(label: 'In Review', description: 'In progress'),
    Ux4gPipelineStep(label: 'Approved',  description: 'Est. 10 Apr'),
    Ux4gPipelineStep(label: 'Disbursed', description: 'Est. 12 Apr'),
  ],
);''',
        props: const [
          PropRow(
            name: 'steps',
            type: 'List<Ux4gPipelineStep>',
            description: 'Pipeline stages.',
            required: true,
          ),
          PropRow(
            name: 'currentStep',
            type: 'int',
            description: 'Active stage index.',
            required: true,
          ),
        ],
        child: SizedBox(
          width: 380,
          child: Ux4gStatusPipeline(
            currentStep: 2,
            steps: const [
              Ux4gPipelineStep(label: 'Submitted', description: '5 Apr'),
              Ux4gPipelineStep(label: 'Verified', description: '6 Apr'),
              Ux4gPipelineStep(label: 'In Review', description: 'In progress'),
              Ux4gPipelineStep(label: 'Approved', description: 'Est. 10 Apr'),
              Ux4gPipelineStep(label: 'Disbursed', description: 'Est. 12 Apr'),
            ],
          ),
        ),
      ),
    ),
  ],
);

// ── Carousel ──────────────────────────────────────────────────────────────────

final carouselComponent = WidgetbookComponent(
  name: 'Carousel',
  useCases: [
    WidgetbookUseCase(
      name: 'Image carousel',
      builder: (context) => ComponentDocs(
        name: 'Carousel',
        description:
            'A horizontal swipe carousel. Pass any list of widgets as items.',
        code: '''Ux4gCarousel(
  items: List.generate(
    4,
    (i) => Image.network(
      'https://picsum.photos/seed/\/360/200',
      fit: BoxFit.cover,
    ),
  ),
);''',
        props: const [
          PropRow(
            name: 'items',
            type: 'List<Widget>',
            description: 'Carousel slide widgets.',
            required: true,
          ),
          PropRow(
            name: 'autoPlay',
            type: 'bool',
            description: 'Automatically advances through carousel items.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'autoPlayInterval',
            type: 'Duration',
            description: 'Time between automatic page changes.',
            defaultValue: 'Duration(seconds: 3)',
          ),
          PropRow(
            name: 'showPagination',
            type: 'bool',
            description: 'Shows the pagination indicator over the carousel.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'height',
            type: 'double',
            description: 'Height of the carousel.',
            defaultValue: '200.0',
          ),
          PropRow(
            name: 'viewportFraction',
            type: 'double',
            description:
                'Fraction of the viewport occupied by each carousel item.',
            defaultValue: '1.0',
          ),
        ],
        child: SizedBox(
          width: 360,
          child: Ux4gCarousel(
            items: List.generate(
              4,
              (i) => Image.network(
                'https://picsum.photos/seed//360/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
);

// ── Social Link Group ─────────────────────────────────────────────────────────

final socialLinkGroupComponent = WidgetbookComponent(
  name: 'SocialLinkGroup',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'SocialLinkGroup',
        description:
            'A horizontal row of social media icon buttons rendered as a group. '
            'Supports size, background, color, and spacing customisation.',
        code: '''Ux4gSocialLinkGroup(
  icons: SocialMediaIcon.values,
  size: SocialLinkSize.m,
  enableBackground: false,
  spacing: 12,
);''',
        props: const [
          PropRow(
            name: 'icons',
            type: 'List<SocialMediaIcon>',
            description: 'Social icons to display.',
            required: true,
          ),
          PropRow(
            name: 'size',
            type: 'SocialLinkSize',
            description: 'xs / s / m / l / xl / xxl.',
            defaultValue: 'm',
          ),
          PropRow(
            name: 'enableBackground',
            type: 'bool',
            description: 'Show background circle per icon.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'spacing',
            type: 'double',
            description: 'Gap between icons.',
            defaultValue: '8',
          ),
          PropRow(
            name: 'onIconPressed',
            type: 'Function(SocialMediaIcon)?',
            description: 'Called when an icon is tapped.',
          ),
        ],
        child: Ux4gSocialLinkGroup(
          icons: SocialMediaIcon.values,
          size: context.knobs.list(
            label: 'Size',
            options: SocialLinkSize.values,
            initialOption: SocialLinkSize.m,
            labelBuilder: (v) => v.name,
          ),
          enableBackground: context.knobs.boolean(
            label: 'Background',
            initialValue: false,
          ),
          onIconPressed: (icon) => () {},
        ),
      ),
    ),
  ],
);

// ── Social Link List ──────────────────────────────────────────────────────────

final socialLinkListComponent = WidgetbookComponent(
  name: 'SocialLinkList',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'SocialLinkList',
        description:
            'A list of social media icon buttons that can be arranged horizontally or vertically '
            'with configurable alignment.',
        code: '''Ux4gSocialLinkList(
  icons: SocialMediaIcon.values,
  size: SocialLinkSize.m,
  direction: Axis.horizontal,
  alignment: MainAxisAlignment.center,
  enableBackground: true,
);''',
        props: const [
          PropRow(
            name: 'icons',
            type: 'List<SocialMediaIcon>',
            description: 'Social icons to display.',
            required: true,
          ),
          PropRow(
            name: 'size',
            type: 'SocialLinkSize',
            description: 'xs / s / m / l / xl / xxl.',
            defaultValue: 'm',
          ),
          PropRow(
            name: 'direction',
            type: 'Axis',
            description: 'horizontal or vertical.',
            defaultValue: 'horizontal',
          ),
          PropRow(
            name: 'alignment',
            type: 'MainAxisAlignment',
            description: 'Flex alignment.',
            defaultValue: 'start',
          ),
          PropRow(
            name: 'enableBackground',
            type: 'bool',
            description: 'Show background circle per icon.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'onIconPressed',
            type: 'Function(SocialMediaIcon)?',
            description: 'Called when an icon is tapped.',
          ),
        ],
        child: Ux4gSocialLinkList(
          icons: SocialMediaIcon.values,
          size: context.knobs.list(
            label: 'Size',
            options: SocialLinkSize.values,
            initialOption: SocialLinkSize.m,
            labelBuilder: (v) => v.name,
          ),
          enableBackground: context.knobs.boolean(
            label: 'Background',
            initialValue: true,
          ),
          direction: context.knobs.list(
            label: 'Direction',
            options: Axis.values,
            initialOption: Axis.horizontal,
            labelBuilder: (v) => v.name,
          ),
          onIconPressed: (icon) => () {},
        ),
      ),
    ),
  ],
);

// ── SlotGrid ──────────────────────────────────────────────────────────────────

// ── SlotGrid ──────────────────────────────────────────────────────────────────

final slotGridComponent = WidgetbookComponent(
  name: 'Slot Grid',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final viewMode = context.knobs.list<SlotPickerViewMode>(
          label: 'View Mode',
          options: SlotPickerViewMode.values,
          initialOption: SlotPickerViewMode.expanded,
          labelBuilder: (v) => v == SlotPickerViewMode.expanded
              ? 'Expanded View'
              : 'Compact View',
        );
        final isExpanded = viewMode == SlotPickerViewMode.expanded;
        final viewModeStr = isExpanded ? 'expanded' : 'compact';
        final enumStr = isExpanded
            ? 'SlotPickerViewMode.expanded'
            : 'SlotPickerViewMode.compact';

        return ComponentDocs(
          name: 'SlotGrid',
          description:
              'A calendar-style date picker that marks dates as available, '
              'no-slots, public holiday, or weekly-off. '
              'Optionally opens a time-slot bottom sheet when a date is tapped.\n'
              'Supports both Expanded and Compact view modes via viewMode property.',
          code:
              '''class SlotGridShowcase extends StatefulWidget {
  final SlotPickerViewMode viewMode;

  const SlotGridShowcase({
    super.key,
    this.viewMode = $enumStr,
  });

  @override
  State<SlotGridShowcase> createState() => _SlotGridShowcaseState();
}

class _SlotGridShowcaseState extends State<SlotGridShowcase> {
  DateTime? _selectedDate;
  late SlotGridData _data;

  Map<String, List<Map<String, dynamic>>> _mutableTimeSlots = {};

  Map<String, dynamic> _getJsonInput() {
    final now = DateTime.now();
    final tomorrow = now.add(const Duration(days: 1));
    final dayAfter = now.add(const Duration(days: 2));
    final day4 = now.add(const Duration(days: 3));

    return {
      "year": now.year,
      "month": now.month,
      "today":
          '\${now.year}-\${now.month.toString().padLeft(2, '0')}-\${now.day.toString().padLeft(2, '0')}',
      "weeklyOffWeekdays": [6, 7],
      "allowTapOnPublicHoliday": false,
      "allowTapOnWeeklyOff": false,
      "viewMode": "$viewModeStr",
      "dates": [
        {
          "date": '\${now.year}-\${now.month.toString().padLeft(2, '0')}-\${_pad(now.day + 2)}',
          "status": "publicHoliday",
        },
        {
          "date": '\${now.year}-\${now.month.toString().padLeft(2, '0')}-\${_pad(now.day + 4)}',
          "status": "noSlots",
        },
        {
          "date": '\${now.year}-\${now.month.toString().padLeft(2, '0')}-\${_pad(now.day + 6)}',
          "status": "noSlots",
        },
      ],
      "timeSlots": {
        '\${tomorrow.year}-\${tomorrow.month.toString().padLeft(2, '0')}-\${tomorrow.day.toString().padLeft(2, '0')}':
            [
              {"time": "9:00 AM", "slotCount": 2, "status": "available"},
              {"time": "10:00 AM", "slotCount": 1, "status": "limited"},
              {"time": "11:00 AM", "slotCount": 0, "status": "noSlots"},
              {"time": "2:00 PM", "slotCount": 3, "status": "available"},
            ],
        '\${dayAfter.year}-\${dayAfter.month.toString().padLeft(2, '0')}-\${dayAfter.day.toString().padLeft(2, '0')}':
            [
              {"time": "9:30 AM", "slotCount": 5, "status": "available"},
              {"time": "10:30 AM", "slotCount": 2, "status": "available"},
              {"time": "1:00 PM", "slotCount": 4, "status": "available"},
              {"time": "3:00 PM", "slotCount": 1, "status": "limited"},
              {"time": "4:00 PM", "slotCount": 0, "status": "noSlots"},
            ],
        '\${day4.year}-\${day4.month.toString().padLeft(2, '0')}-\${day4.day.toString().padLeft(2, '0')}':
            [
              {"time": "11:00 AM", "slotCount": 8, "status": "available"},
              {"time": "12:00 PM", "slotCount": 6, "status": "available"},
              {"time": "1:00 PM", "slotCount": 3, "status": "available"},
              {"time": "2:30 PM", "slotCount": 1, "status": "limited"},
            ],
        "default": [
          {"time": "9:00 AM", "slotCount": 4, "status": "available"},
          {"time": "9:30 AM", "slotCount": 6, "status": "available"},
          {"time": "10:00 AM", "slotCount": 3, "status": "available"},
          {"time": "10:30 AM", "slotCount": 0, "status": "noSlots"},
          {"time": "11:00 AM", "slotCount": 8, "status": "available"},
          {"time": "11:30 AM", "slotCount": 5, "status": "available"},
          {"time": "12:00 PM", "slotCount": 10, "status": "available"},
          {"time": "2:00 PM", "slotCount": 5, "status": "available"},
          {"time": "2:30 PM", "slotCount": 2, "status": "limited"},
          {"time": "3:00 PM", "slotCount": 2, "status": "limited"},
          {"time": "3:30 PM", "slotCount": 1, "status": "limited"},
          {"time": "4:00 PM", "slotCount": 7, "status": "available"},
          {"time": "4:30 PM", "slotCount": 2, "status": "limited"},
          {"time": "5:00 PM", "slotCount": 2, "status": "limited"},
          {"time": "5:30 PM", "slotCount": 0, "status": "noSlots"},
        ],
      },
    };
  }

  static String _pad(int day) => day.toString().padLeft(2, '0');

  Map<String, List<Map<String, dynamic>>> _buildMutableSlots() {
    final json = _getJsonInput();
    final raw = json['timeSlots'] as Map<String, dynamic>;
    return raw.map(
      (key, value) => MapEntry(
        key,
        (value as List)
            .map((e) => Map<String, dynamic>.from(e as Map))
            .toList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _mutableTimeSlots = _buildMutableSlots();
    _data = SlotGridData.fromJson(_getJsonInput());
  }

  @override
  void didUpdateWidget(SlotGridShowcase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewMode != widget.viewMode) {
      _data = SlotGridData.fromJson(_getJsonInput());
    }
  }

  List<SlotTimeEntry> _timeSlotsFor(DateTime date) {
    final dateStr =
        '\${date.year}-\${date.month.toString().padLeft(2, '0')}-\${date.day.toString().padLeft(2, '0')}';
    if (_mutableTimeSlots.isEmpty) {
      _mutableTimeSlots = _buildMutableSlots();
    }
    if (!_mutableTimeSlots.containsKey(dateStr)) {
      final defaultSlots = _mutableTimeSlots['default'] ?? [];
      _mutableTimeSlots[dateStr] = defaultSlots
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    return _mutableTimeSlots[dateStr]!
        .map((e) => SlotTimeEntry.fromJson(e))
        .toList();
  }

  void _onSlotBooked(DateTime date, SlotTimeEntry bookedTime) {
    final dateStr =
        '\${date.year}-\${date.month.toString().padLeft(2, '0')}-\${date.day.toString().padLeft(2, '0')}';
    if (_mutableTimeSlots.isEmpty) {
      _mutableTimeSlots = _buildMutableSlots();
    }
    final slots = _mutableTimeSlots[dateStr];
    if (slots == null) return;

    setState(() {
      for (final slot in slots) {
        if (slot['time'] == bookedTime.time) {
          final newCount = (slot['slotCount'] as int) + 1;
          slot['slotCount'] = newCount;
          if (newCount == 0) {
            slot['status'] = 'noSlots';
          } else if (newCount <= 2) {
            slot['status'] = 'limited';
          } else {
            slot['status'] = 'available';
          }
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlotGrid(
          data: _data,
          timeSlotProvider: _timeSlotsFor,
          onSlotConfirmed: (date, slot) => _onSlotBooked(date, slot),
          onDateSelected: (date) {
            setState(() {
              _selectedDate = date;
              final json = _getJsonInput();
              _data = SlotGridData.fromJson({
                ...json,
                'selectedDate':
                    '\${date.year}-\${date.month.toString().padLeft(2, '0')}-\${date.day.toString().padLeft(2, '0')}',
                'year': _data.year,
                'month': _data.month,
              });
            });
          },
          onMonthChanged: (year, month) {
            setState(() {
              final json = _getJsonInput();
              _data = SlotGridData.fromJson({
                ...json,
                'year': year,
                'month': month,
              });
            });
          },
        ),
      ],
    );
  }
}''',
          props: [
            PropRow(
              name: 'data',
              type: 'SlotGridData',
              description:
                  'Calendar data model (year, month, dates, view mode).',
              required: true,
            ),
            PropRow(
              name: 'onDateSelected',
              type: 'ValueChanged<DateTime>?',
              description:
                  'Called when user taps an available date (no timeSlotProvider).',
            ),
            PropRow(
              name: 'onMonthChanged',
              type: 'void Function(int year, int month)?',
              description: 'Called when the prev/next month arrow is tapped.',
            ),
            PropRow(
              name: 'timeSlotProvider',
              type: 'List<SlotTimeEntry> Function(DateTime)?',
              description:
                  'Supply time slots — auto-opens SlotTimePickerSheet on date tap.',
            ),
            PropRow(
              name: 'onSlotConfirmed',
              type: 'void Function(DateTime, SlotTimeEntry)?',
              description: 'Called when the user confirms a time slot.',
            ),
          ],
          child: SingleChildScrollView(
            child: SlotGridShowcase(viewMode: viewMode),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'With holidays & no-slots',
      builder: (context) {
        DateTime? selected;
        return StatefulBuilder(
          builder: (ctx, setState) {
            final data = SlotGridData(
              year: 2026,
              month: 5,
              today: DateTime(2026, 5, 21),
              selectedDate: selected,
              weeklyOffWeekdays: const [6, 7],
              dates: [
                SlotDateEntry(
                  date: DateTime(2026, 5, 1),
                  status: SlotDateStatus.publicHoliday,
                ),
                SlotDateEntry(
                  date: DateTime(2026, 5, 9),
                  status: SlotDateStatus.publicHoliday,
                ),
                SlotDateEntry(
                  date: DateTime(2026, 5, 14),
                  status: SlotDateStatus.noSlots,
                ),
                SlotDateEntry(
                  date: DateTime(2026, 5, 19),
                  status: SlotDateStatus.noSlots,
                ),
              ],
              viewMode: SlotPickerViewMode.expanded,
            );
            return ComponentDocs(
              name: 'SlotGrid - Holidays and No-Slots',
              description:
                  'publicHoliday and noSlots dates are styled differently and '
                  'are non-interactive by default.',
              code: '''SlotGridData(
  year: 2026, month: 5,
  weeklyOffWeekdays: [6, 7],
  dates: [
    SlotDateEntry(date: DateTime(2026, 5, 1),  status: SlotDateStatus.publicHoliday),
    SlotDateEntry(date: DateTime(2026, 5, 14), status: SlotDateStatus.noSlots),
  ],
  viewMode: SlotPickerViewMode.expanded,
);''',
              child: SingleChildScrollView(
                child: SlotGrid(
                  data: data,
                  onDateSelected: (date) => setState(() => selected = date),
                ),
              ),
            );
          },
        );
      },
    ),

    WidgetbookUseCase(
      name: 'JSON data source',
      builder: (context) {
        DateTime? selected;
        return StatefulBuilder(
          builder: (ctx, setState) {
            final data = SlotGridData.fromJson({
              'year': 2026,
              'month': 6,
              'today': '2026-06-01',
              'weeklyOffWeekdays': [6, 7],
              'viewMode': 'compact',
              'dates': [
                {'date': '2026-06-05', 'status': 'publicHoliday'},
                {'date': '2026-06-12', 'status': 'noSlots'},
              ],
            });
            return ComponentDocs(
              name: 'SlotGrid - JSON',
              description:
                  'SlotGridData.fromJson() deserialises a server response directly. '
                  'viewMode can be "expanded" or "compact".',
              code: '''final data = SlotGridData.fromJson({
  "year": 2026,
  "month": 6,
  "today": "2026-06-01",
  "weeklyOffWeekdays": [6, 7],
  "viewMode": "compact",
  "dates": [
    { "date": "2026-06-05", "status": "publicHoliday" },
    { "date": "2026-06-12", "status": "noSlots" },
  ],
});

SlotGrid(data: data, onDateSelected: (d) {});''',
              child: SingleChildScrollView(
                child: SlotGrid(
                  data: data,
                  onDateSelected: (date) => setState(() => selected = date),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);
