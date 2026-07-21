import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

final avatarComponent = WidgetbookComponent(
  name: 'Standard',
  useCases: [
    WidgetbookUseCase(
      name: 'Default (icon)',
      builder: (context) => ComponentDocs(
        name: 'Avatar',
        description:
            'Mobile App Header serves as the top navigation area of an application, providing users with key contextual information, navigation controls and quick access to important actions while ensuring a consistent and intuitive user experience.',
        code: '''// Icon placeholder (default)
Ux4gAvatar(size: Ux4gAvatarSize.m);

// With initials
Ux4gAvatar(initials: 'AB', size: Ux4gAvatarSize.m);

// With network image
Ux4gAvatar(imageUrl: 'https://example.com/photo.jpg', size: Ux4gAvatarSize.l);''',
        props: const [
          PropRow(
            name: 'size',
            type: 'Ux4gAvatarSize',
            description: 'Avatar size (xs to xxxl).',
            defaultValue: 'm',
          ),
          PropRow(
            name: 'shape',
            type: 'ShapeBorder',
            description: 'Custom shape for the avatar.',
            defaultValue: 'CircleBorder()',
          ),
          PropRow(
            name: 'imageUrl',
            type: 'String?',
            description: 'Network URL for the avatar image.',
          ),
          PropRow(
            name: 'initials',
            type: 'String?',
            description: 'Up to 2-letter initials shown as fallback.',
          ),
          PropRow(
            name: 'icon',
            type: 'IconData?',
            description: 'Icon to show if no image or initials.',
            defaultValue: 'Icons.person',
          ),
          PropRow(
            name: 'containerColor',
            type: 'Color?',
            description: 'Custom background color.',
          ),
          PropRow(
            name: 'contentColor',
            type: 'Color?',
            description: 'Custom color for initials.',
          ),
          PropRow(
            name: 'iconColor',
            type: 'Color?',
            description: 'Custom color for the icon.',
          ),
        ],
        child: Ux4gAvatar(
          size: context.knobs.list(
            label: 'Size',
            options: Ux4gAvatarSize.values,
            initialOption: Ux4gAvatarSize.m,
            labelBuilder: (v) => v.name,
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'All sizes',
      builder: (context) {
        final displaySizes = [
          Ux4gAvatarSize.l,
          Ux4gAvatarSize.xl,
          Ux4gAvatarSize.xxl,
          Ux4gAvatarSize.xxxl,
        ];
        return ComponentDocs(
          name: 'Avatar — All Sizes',
          description: 'Large to XXXL sizes rendered side-by-side.',
          code: '''Row(
  children: [Ux4gAvatarSize.l, Ux4gAvatarSize.xl, Ux4gAvatarSize.xxl, Ux4gAvatarSize.xxxl]
      .map((s) => Ux4gAvatar(size: s, initials: 'AB'))
      .toList(),
);''',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: displaySizes
                .map(
                  (s) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Ux4gAvatar(size: s, initials: 'AB'),
                  ),
                )
                .toList(),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'With initials',
      builder: (context) => ComponentDocs(
        name: 'Avatar — Initials',
        description:
            'Pass up to 2 letters via initials to show a text-based avatar.',
        code: 'Ux4gAvatar(initials: \'AB\', size: Ux4gAvatarSize.l)',
        child: Ux4gAvatar(
          initials: context.knobs.string(label: 'Initials', initialValue: 'AB'),
          size: context.knobs.list(
            label: 'Size',
            options: Ux4gAvatarSize.values,
            initialOption: Ux4gAvatarSize.l,
            labelBuilder: (v) => v.name,
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With image',
      builder: (context) => ComponentDocs(
        name: 'Avatar — Image',
        description:
            'Provide an imageUrl to display a network photo in the avatar.',
        code:
            'Ux4gAvatar(imageUrl: \'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg\', size: Ux4gAvatarSize.l)',
        child: Ux4gAvatar(
          imageUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          size: context.knobs.list(
            label: 'Size',
            options: Ux4gAvatarSize.values,
            initialOption: Ux4gAvatarSize.l,
            labelBuilder: (v) => v.name,
          ),
        ),
      ),
    ),
  ],
);

final profileAvatarComponent = WidgetbookComponent(
  name: 'ProfileAvatar',
  useCases: [
    WidgetbookUseCase(
      name: 'Badge variants',
      builder: (context) => ComponentDocs(
        name: 'ProfileAvatar',
        description:
            'Avatar with a status or role badge overlay. Supports verified, star, and admin badges, '
            'plus edit / camera / remove action overlays.',
        code: '''// Verified badge
Ux4gProfileAvatar(
  imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  variant: Ux4gProfileBadge.verified,
  size: Ux4gAvatarSize.xl,
);

// Action overlay
Ux4gProfileAvatar(
  initials: 'AB',
  variant: Ux4gProfileAction.edit,
  size: Ux4gAvatarSize.l,
  onVariantClick: () {},
);''',
        props: const [
          PropRow(
            name: 'size',
            type: 'Ux4gAvatarSize',
            description: 'Avatar size.',
            defaultValue: 'm',
          ),
          PropRow(
            name: 'imageUrl',
            type: 'String?',
            description: 'Network image URL.',
          ),
          PropRow(
            name: 'initials',
            type: 'String?',
            description: 'Fallback initials.',
          ),
          PropRow(
            name: 'avatarIcon',
            type: 'IconData?',
            description: 'Custom icon for the avatar.',
          ),
          PropRow(
            name: 'variant',
            type: 'dynamic',
            description: 'ProfileBadge or ProfileAction.',
            required: true,
          ),
          PropRow(
            name: 'badgeSize',
            type: 'double?',
            description: 'Custom size for the badge/action icon.',
          ),
          PropRow(
            name: 'onVariantClick',
            type: 'VoidCallback?',
            description: 'Called when action overlay is tapped.',
          ),
        ],
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: Ux4gProfileBadge.values
              .map(
                (b) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Ux4gProfileAvatar(
                    imageUrl:
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    initials: 'AB',
                    variant: b,
                    size: Ux4gAvatarSize.l,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Action overlays',
      builder: (context) => ComponentDocs(
        name: 'ProfileAvatar — Actions',
        description:
            'Edit, camera, and remove action overlays appear as tappable icons on the avatar.',
        code: '''Ux4gProfileAvatar(
  initials: 'AB',
  variant: Ux4gProfileAction.edit,
  size: Ux4gAvatarSize.l,
  onVariantClick: () {},
);''',
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: Ux4gProfileAction.values
              .map(
                (a) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ux4gProfileAvatar(
                        imageUrl:
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        initials: 'AB',
                        variant: a,
                        size: Ux4gAvatarSize.l,
                        onVariantClick: () {},
                      ),
                      const SizedBox(height: 4),
                      Text(a.name, style: const TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ),
  ],
);

final statusAvatarComponent = WidgetbookComponent(
  name: 'StatusAvatar',
  useCases: [
    WidgetbookUseCase(
      name: 'All statuses',
      builder: (context) => ComponentDocs(
        name: 'StatusAvatar',
        description:
            'Avatar with a presence/status dot: online, offline, busy, success, error, warning.',
        code: '''Ux4gStatusAvatar(
  initials: 'AB',
  variant: Ux4gStatusVariant.online,
  size: Ux4gAvatarSize.l,
);''',
        props: const [
          PropRow(
            name: 'size',
            type: 'Ux4gAvatarSize',
            description: 'Avatar size.',
            defaultValue: 'm',
          ),
          PropRow(
            name: 'imageUrl',
            type: 'String?',
            description: 'Network image URL.',
          ),
          PropRow(
            name: 'initials',
            type: 'String?',
            description: 'Fallback initials.',
          ),
          PropRow(
            name: 'avatarIcon',
            type: 'IconData?',
            description: 'Custom icon for the avatar.',
          ),
          PropRow(
            name: 'variant',
            type: 'Ux4gStatusVariant',
            description: 'online / offline / busy / success / error / warning.',
            defaultValue: 'online',
          ),
          PropRow(
            name: 'statusSize',
            type: 'double?',
            description: 'Custom size for the status dot.',
          ),
        ],
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: Ux4gStatusVariant.values
              .map(
                (s) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Ux4gStatusAvatar(
                    initials: 'AB',
                    variant: s,
                    size: Ux4gAvatarSize.l,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ),
  ],
);

final avatarGroupComponent = WidgetbookComponent(
  name: 'AvatarGroup',
  useCases: [
    WidgetbookUseCase(
      name: 'Image group',
      builder: (context) => ComponentDocs(
        name: 'AvatarGroup',
        description:
            'A stacked row of avatars with an overflow count pill when items exceed maxLimit.',
        code: '''Ux4gAvatarGroup(
  items: List.generate(
    5,
    (i) => Ux4gAvatarGroupItem(imageUrl: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
  ),
  maxLimit: 3,   // shows "+2" overflow
);''',
        props: const [
          PropRow(
            name: 'items',
            type: 'List<Ux4gAvatarGroupItem>',
            description: 'List of avatar data items.',
            required: true,
          ),
          PropRow(
            name: 'size',
            type: 'Ux4gAvatarSize',
            description: 'Size of avatars in the group.',
            defaultValue: 'm',
          ),
          PropRow(
            name: 'maxLimit',
            type: 'int?',
            description: 'Max visible avatars before overflow pill.',
          ),
          PropRow(
            name: 'collapsed',
            type: 'bool',
            description: 'Whether avatars should overlap.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'borderColor',
            type: 'Color?',
            description: 'Custom border color for overlapped avatars.',
          ),
          PropRow(
            name: 'borderWidth',
            type: 'double',
            description: 'Border width for overlapped avatars.',
            defaultValue: '2',
          ),
          PropRow(
            name: 'onRemainingClick',
            type: 'VoidCallback?',
            description: 'Called when overflow pill is tapped.',
          ),
        ],
        child: Ux4gAvatarGroup(
          items: List.generate(
            5,
            (i) => Ux4gAvatarGroupItem(
              imageUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            ),
          ),
          maxLimit: context.knobs.int.input(
            label: 'Max visible',
            initialValue: 3,
          ),
        ),
      ),
    ),
  ],
);
