import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ── Feedback Introduction ────────────────────────────────────────────────────────

final feedbackIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Feedback',
              description:
                  'Feedback allows users to provide ratings and share opinions about their experience. It supports multiple feedback formats, including thumbs, stars, NPS, and emoji ratings.',
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
                  SizedBox(
                    width: 320,
                    child: Ux4gFeedbackFormStar(
                      improvementOptions: const ['App speed', 'UI design'],
                      onSubmit: (rating, chip, comment) {},
                      onSkip: () {},
                    ),
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

// ── Ux4gFeedbackFormStar ───────────────────────────────────────────────────────────────

final feedbackFormStarComponent = WidgetbookComponent(
  name: 'FeedbackFormStar',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'Ux4gFeedbackFormStar',
        description:
            'Feedback allows users to provide ratings and share opinions about their experience. It supports multiple feedback formats, including Stars, NPS, and emoji ratings.',
        code: '''Ux4gFeedbackFormStar(
  improvementOptions: [
    'App speed',
    'UI design',
    'Content quality',
    'Navigation',
  ],
  onSubmit: (rating, chip, comment) {
    print('Rating: \$rating, Issue: \$chip, Comment: \$comment');
  },
  onSkip: () {},
);''',
        props: const [
          PropRow(
            name: 'improvementOptions',
            type: 'List<String>',
            description: 'Chip choices for "what can we improve".',
            required: true,
          ),
          PropRow(
            name: 'onSubmit',
            type: 'Function(int, String, String)',
            description: 'Called with rating, selected chip, and comment.',
            required: true,
          ),
          PropRow(
            name: 'minWords',
            type: 'int',
            description: 'Minimum word count for comment.',
            defaultValue: '0',
          ),
          PropRow(
            name: 'maxLength',
            type: 'int',
            description: 'Max character length.',
            defaultValue: '200',
          ),
          PropRow(
            name: 'onSkip',
            type: 'VoidCallback?',
            description: 'Called when user skips.',
          ),
          PropRow(
            name: 'onCloseSuccess',
            type: 'VoidCallback?',
            description: 'Called when closing success screen.',
          ),
          PropRow(
            name: 'chipBorderRadius',
            type: 'double',
            description: 'Border radius of improvement chips.',
            defaultValue: '4.0',
          ),
          PropRow(
            name: 'title',
            type: 'String',
            description: 'Form heading.',
            defaultValue: '"Rate your experience"',
          ),
          PropRow(
            name: 'improvementTitle',
            type: 'String',
            description: 'Improvement section title.',
            defaultValue: '"What can we improve?"',
          ),
          PropRow(
            name: 'commentPlaceholder',
            type: 'String',
            description: 'Text area placeholder.',
            defaultValue: '"Tell us more..."',
          ),
          PropRow(
            name: 'submitButtonText',
            type: 'String',
            description: 'Submit button label.',
            defaultValue: '"Submit"',
          ),
          PropRow(
            name: 'skipButtonText',
            type: 'String',
            description: 'Skip button label.',
            defaultValue: '"Skip"',
          ),
          PropRow(
            name: 'successTitle',
            type: 'String',
            description: 'Title on success screen.',
            defaultValue: '"Feedback submitted"',
          ),
          PropRow(
            name: 'successMessage',
            type: 'String',
            description: 'Message on success screen.',
            defaultValue: '"Thank you..."',
          ),
          PropRow(
            name: 'titleStyle',
            type: 'TextStyle?',
            description: 'Style for main title.',
          ),
          PropRow(
            name: 'improvementTitleStyle',
            type: 'TextStyle?',
            description: 'Style for improvement title.',
          ),
          PropRow(
            name: 'successTitleStyle',
            type: 'TextStyle?',
            description: 'Style for success title.',
          ),
          PropRow(
            name: 'successMessageStyle',
            type: 'TextStyle?',
            description: 'Style for success message.',
          ),
          PropRow(
            name: 'ratingIcon',
            type: 'IconData',
            description: 'Icon used for rating stars.',
            defaultValue: 'Icons.star',
          ),
          PropRow(
            name: 'successIcon',
            type: 'IconData',
            description: 'Icon on success screen.',
            defaultValue: 'Icons.thumb_up',
          ),
          PropRow(
            name: 'activeRatingColor',
            type: 'Color?',
            description: 'Color of active stars.',
          ),
          PropRow(
            name: 'inactiveRatingColor',
            type: 'Color?',
            description: 'Color of inactive stars.',
          ),
          PropRow(
            name: 'successIconColor',
            type: 'Color?',
            description: 'Color of success icon.',
          ),
          PropRow(
            name: 'successBackgroundColor',
            type: 'Color?',
            description: 'Background of success screen.',
          ),
        ],
        child: SizedBox(
          width: 380,
          child: Ux4gFeedbackFormStar(
            improvementOptions: const [
              'App speed',
              'UI design',
              'Content quality',
              'Navigation',
            ],
            onSubmit: (rating, chip, comment) {},
            onSkip: () {},
          ),
        ),
      ),
    ),
  ],
);

final feedbackFormComponent = feedbackFormStarComponent;

// ── Feedback Form NPS ─────────────────────────────────────────────────────────

final feedbackFormNpsComponent = WidgetbookComponent(
  name: 'FeedbackFormNps',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'FeedbackFormNps',
        description:
            'Feedback allows users to provide ratings and share opinions about their experience. It supports multiple feedback formats, including Stars, NPS, and emoji ratings.',
        code: '''Ux4gFeedbackFormNps(
  onSubmit: (score, comment) {
    print('NPS Score: \$score, Comment: \$comment');
  },
  onSkip: () {},
);''',
        props: const [
          PropRow(
            name: 'onSubmit',
            type: 'Function(int, String)',
            description: 'Called with NPS score (0–10) and comment.',
            required: true,
          ),
          PropRow(
            name: 'minWords',
            type: 'int',
            description: 'Minimum word count for comment.',
            defaultValue: '0',
          ),
          PropRow(
            name: 'maxLength',
            type: 'int',
            description: 'Max character length.',
            defaultValue: '200',
          ),
          PropRow(
            name: 'onSkip',
            type: 'VoidCallback?',
            description: 'Called when user skips.',
          ),
          PropRow(
            name: 'onCloseSuccess',
            type: 'VoidCallback?',
            description: 'Called when closing success screen.',
          ),
          PropRow(
            name: 'title',
            type: 'String',
            description: 'Form heading.',
            defaultValue: '"How likely are you..."',
          ),
          PropRow(
            name: 'unlikelyLabel',
            type: 'String',
            description: 'Left scale label.',
            defaultValue: '"0 - Extremely Unlikely"',
          ),
          PropRow(
            name: 'likelyLabel',
            type: 'String',
            description: 'Right scale label.',
            defaultValue: '"10 - Extremely Likely"',
          ),
          PropRow(
            name: 'commentPlaceholder',
            type: 'String',
            description: 'Text area placeholder.',
            defaultValue: '"Please tell us why..."',
          ),
          PropRow(
            name: 'submitButtonText',
            type: 'String',
            description: 'Submit button label.',
            defaultValue: '"Submit"',
          ),
          PropRow(
            name: 'skipButtonText',
            type: 'String',
            description: 'Skip button label.',
            defaultValue: '"Skip"',
          ),
          PropRow(
            name: 'successTitle',
            type: 'String',
            description: 'Title on success screen.',
            defaultValue: '"Feedback submitted"',
          ),
          PropRow(
            name: 'successMessage',
            type: 'String',
            description: 'Message on success screen.',
            defaultValue: '"Thank you..."',
          ),
          PropRow(
            name: 'titleStyle',
            type: 'TextStyle?',
            description: 'Style for main title.',
          ),
          PropRow(
            name: 'successTitleStyle',
            type: 'TextStyle?',
            description: 'Style for success title.',
          ),
          PropRow(
            name: 'successMessageStyle',
            type: 'TextStyle?',
            description: 'Style for success message.',
          ),
          PropRow(
            name: 'successIcon',
            type: 'IconData',
            description: 'Icon on success screen.',
            defaultValue: 'Icons.thumb_up',
          ),
          PropRow(
            name: 'successIconColor',
            type: 'Color?',
            description: 'Color of success icon.',
          ),
          PropRow(
            name: 'successBackgroundColor',
            type: 'Color?',
            description: 'Background of success screen.',
          ),
          PropRow(
            name: 'selectedScoreBackgroundColor',
            type: 'Color?',
            description: 'Background color for selected score.',
          ),
          PropRow(
            name: 'selectedScoreTextColor',
            type: 'Color?',
            description: 'Text color for selected score.',
          ),
        ],
        child: SizedBox(
          width: 380,
          child: Ux4gFeedbackFormNps(
            onSubmit: (score, comment) {},
            onSkip: () {},
          ),
        ),
      ),
    ),
  ],
);

// ── Feedback Form CSAT ────────────────────────────────────────────────────────

final feedbackFormCsatComponent = WidgetbookComponent(
  name: 'FeedbackFormCsat',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'FeedbackFormCsat',
        description:
            'Feedback allows users to provide ratings and share opinions about their experience. It supports multiple feedback formats, including Stars, NPS, and emoji ratings.',
        code: '''Ux4gFeedbackFormCsat(
  onSubmit: (score, comment) {
    print('CSAT Score: \$score, Comment: \$comment');
  },
  onSkip: () {},
);''',
        props: const [
          PropRow(
            name: 'onSubmit',
            type: 'Function(int, String)',
            description: 'Called with CSAT score and comment.',
            required: true,
          ),
          PropRow(
            name: 'minWords',
            type: 'int',
            description: 'Minimum word count for comment.',
            defaultValue: '0',
          ),
          PropRow(
            name: 'maxLength',
            type: 'int',
            description: 'Max character length.',
            defaultValue: '200',
          ),
          PropRow(
            name: 'onSkip',
            type: 'VoidCallback?',
            description: 'Called when user skips.',
          ),
          PropRow(
            name: 'onCloseSuccess',
            type: 'VoidCallback?',
            description: 'Called when closing success screen.',
          ),
          PropRow(
            name: 'title',
            type: 'String',
            description: 'Form heading.',
            defaultValue: '"How do you feel..."',
          ),
          PropRow(
            name: 'badLabel',
            type: 'String',
            description: 'Left scale label.',
            defaultValue: '"← Bad"',
          ),
          PropRow(
            name: 'goodLabel',
            type: 'String',
            description: 'Right scale label.',
            defaultValue: '"Good →"',
          ),
          PropRow(
            name: 'commentPlaceholder',
            type: 'String',
            description: 'Text area placeholder.',
            defaultValue: '"Please tell us how..."',
          ),
          PropRow(
            name: 'submitButtonText',
            type: 'String',
            description: 'Submit button label.',
            defaultValue: '"Submit"',
          ),
          PropRow(
            name: 'skipButtonText',
            type: 'String',
            description: 'Skip button label.',
            defaultValue: '"Skip"',
          ),
          PropRow(
            name: 'successTitle',
            type: 'String',
            description: 'Title on success screen.',
            defaultValue: '"Feedback submitted"',
          ),
          PropRow(
            name: 'successMessage',
            type: 'String',
            description: 'Message on success screen.',
            defaultValue: '"Thank you..."',
          ),
          PropRow(
            name: 'ratingIcons',
            type: 'List<IconData>',
            description: 'Icons for CSAT levels.',
            defaultValue: 'Sentiment icons',
          ),
          PropRow(
            name: 'titleStyle',
            type: 'TextStyle?',
            description: 'Style for main title.',
          ),
          PropRow(
            name: 'successTitleStyle',
            type: 'TextStyle?',
            description: 'Style for success title.',
          ),
          PropRow(
            name: 'successMessageStyle',
            type: 'TextStyle?',
            description: 'Style for success message.',
          ),
          PropRow(
            name: 'successIcon',
            type: 'IconData',
            description: 'Icon on success screen.',
            defaultValue: 'Icons.thumb_up',
          ),
          PropRow(
            name: 'successIconColor',
            type: 'Color?',
            description: 'Color of success icon.',
          ),
          PropRow(
            name: 'successBackgroundColor',
            type: 'Color?',
            description: 'Background of success screen.',
          ),
          PropRow(
            name: 'selectedScoreBackgroundColor',
            type: 'Color?',
            description: 'Background color for selected score.',
          ),
          PropRow(
            name: 'selectedScoreIconColor',
            type: 'Color?',
            description: 'Icon color for selected score.',
          ),
          PropRow(
            name: 'unselectedScoreBackgroundColor',
            type: 'Color?',
            description: 'Background color for unselected scores.',
          ),
          PropRow(
            name: 'unselectedScoreIconColor',
            type: 'Color?',
            description: 'Icon color for unselected scores.',
          ),
        ],
        child: SizedBox(
          width: 380,
          child: Ux4gFeedbackFormCsat(
            onSubmit: (score, comment) {},
            onSkip: () {},
          ),
        ),
      ),
    ),
  ],
);
