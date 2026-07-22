import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ── Modal ─────────────────────────────────────────────────────────────────────

final modalComponent = WidgetbookComponent(
  name: 'Modal',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return ComponentDocs(
          name: 'Modal',
          description:
              'Modal component displays important information, confirmations, or actions in a focused overlay above the main interface. It requires user interaction before returning to the underlying content.',
          showPreview: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Example',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Ux4gModal(
                  headerTitle: 'Confirmation',
                  bodyText: 'This is an inline preview of the modal component.',
                  alignment: Ux4gModalAlignment.leftAligned,
                  footerButtons: Ux4gModalFooterButtons.twoButtons,
                  primaryButtonText: 'Confirm',
                  secondaryButtonText: 'Cancel',
                  onDismiss: () {},
                  onPrimaryClick: () {},
                  onSecondaryClick: () {},
                ),
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Interactive Trigger',
      builder: (context) => ComponentDocs(
        name: 'Modal — Trigger',
        description:
            'Modal component displays important information, confirmations, or actions in a focused overlay above the main interface. It requires user interaction before returning to the underlying content.',
        code: '''Ux4gButton(
  text: 'Show Modal',
  onPressed: () {
    Ux4gModal.show(
      context,
      modal: Ux4gModal(
        headerTitle: 'Confirmation',
        bodyText: 'This is a live interactive modal triggered by a button click.',
        alignment: Ux4gModalAlignment.leftAligned,
        footerButtons: Ux4gModalFooterButtons.twoButtons,
        primaryButtonText: 'Confirm',
        secondaryButtonText: 'Cancel',
        onPrimaryClick: () => Navigator.of(context, rootNavigator: true).pop(),
        onSecondaryClick: () => Navigator.of(context, rootNavigator: true).pop(),
        onDismiss: () => Navigator.of(context, rootNavigator: true).pop(),
      ),
    );
  },
);''',
        child: Ux4gButton(
          text: 'Show Modal',
          onPressed: () {
            Ux4gModal.show(
              context,
              modal: Ux4gModal(
                headerTitle: context.knobs.string(
                  label: 'Title',
                  initialValue: 'Confirmation',
                ),
                bodyText:
                    'This is a live interactive modal triggered by a button click.',
                alignment: context.knobs.list(
                  label: 'Alignment',
                  options: Ux4gModalAlignment.values,
                  initialOption: Ux4gModalAlignment.leftAligned,
                ),
                footerButtons: Ux4gModalFooterButtons.twoButtons,
                primaryButtonText: 'Confirm',
                secondaryButtonText: 'Cancel',
                onPrimaryClick: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                onSecondaryClick: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                onDismiss: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
              ),
            );
          },
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Static Variants',
      builder: (context) => ComponentDocs(
        name: 'Modal — Variants',
        description: 'Common modal patterns used in the design system.',
        code: '''// 1. Default (Left Aligned)
Ux4gModal(
  headerTitle: 'Default Modal',
  bodyText: 'This is the standard left-aligned modal with two footer buttons.',
  footerButtons: Ux4gModalFooterButtons.twoButtons,
  footerAlign: Ux4gModalFooterAlign.right,
  onDismiss: () {},
);

// 2. Destructive (Centered)
Ux4gModal(
  headerTitle: 'Warning',
  subtitleText: 'Delete Item?',
  bodyText: 'Are you sure you want to permanently delete this item?',
  alignment: Ux4gModalAlignment.centered,
  footerAlign: Ux4gModalFooterAlign.center,
  isDestructive: true,
  primaryButtonText: 'Delete',
  onDismiss: () {},
);

// 3. Minimal (No Image, No Header)
Ux4gModal(
  headerImageStyle: Ux4gModalHeaderImage.none,
  showHeader: false,
  subtitleText: 'Confirm Action',
  bodyText: 'This will permanently remove the selected items. Continue?',
  footerAlign: Ux4gModalFooterAlign.split,
  showCloseButton: false,
  onDismiss: () {},
);

// 4. Avatar (Padded Image)
Ux4gModal(
  headerImageContent: Container(
    color: const Color(0xFF6A4EFF).withValues(alpha: 0.1),
  ),
  headerImageStyle: Ux4gModalHeaderImage.padded,
  leadingItem: Ux4gModalLeadingItem.avatar,
  avatarInitials: 'JD',
  alignment: Ux4gModalAlignment.centered,
  headerTitle: 'John Doe',
  descriptionText: 'Administrator',
  showDescription: true,
  onDismiss: () {},
);

// 5. Full-Bleed Image Header
Ux4gModal(
  headerImageUrl: 'https://picsum.photos/seed/modal/600/300',
  headerImageStyle: Ux4gModalHeaderImage.fullBleed,
  headerTitle: 'Image Header',
  descriptionText: 'Optional description below header',
  showDescription: true,
  bodyText: 'Modals with full-bleed images are great for onboarding or marketing content.',
  footerButtons: Ux4gModalFooterButtons.twoButtons,
  primaryButtonText: 'Continue',
  secondaryButtonText: 'Back',
  onDismiss: () {},
);''',
        props: const [
          PropRow(
            name: 'onDismiss',
            type: 'VoidCallback',
            description: 'Called when backdrop or close button is tapped.',
            required: true,
          ),
          PropRow(
            name: 'showHeader',
            type: 'bool',
            description: 'Show the header section.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'alignment',
            type: 'Ux4gModalAlignment',
            description: 'leftAligned or centered.',
            defaultValue: 'leftAligned',
          ),
          PropRow(
            name: 'footerAlign',
            type: 'Ux4gModalFooterAlign',
            description: 'left, right, center, split.',
            defaultValue: 'right',
          ),
          PropRow(
            name: 'isDestructive',
            type: 'bool',
            description: 'Use error color for primary action.',
            defaultValue: 'false',
          ),
        ],
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              // 1. Default (Left Aligned)
              Ux4gModal(
                headerTitle: 'Default Modal',
                bodyText:
                    'This is the standard left-aligned modal with two footer buttons.',
                footerButtons: Ux4gModalFooterButtons.twoButtons,
                footerAlign: Ux4gModalFooterAlign.right,
                onDismiss: () {},
              ),
              const SizedBox(height: 32),
              // 2. Destructive (Centered)
              Ux4gModal(
                headerTitle: 'Warning',
                subtitleText: 'Delete Item?',
                bodyText:
                    'Are you sure you want to permanently delete this item?',
                alignment: Ux4gModalAlignment.centered,
                footerAlign: Ux4gModalFooterAlign.center,
                isDestructive: true,
                primaryButtonText: 'Delete',
                onDismiss: () {},
              ),
              const SizedBox(height: 32),
              // 3. Minimal (No Image, No Header)
              Ux4gModal(
                headerImageStyle: Ux4gModalHeaderImage.none,
                showHeader: false,
                subtitleText: 'Confirm Action',
                bodyText:
                    'This will permanently remove the selected items. Continue?',
                footerAlign: Ux4gModalFooterAlign.split,
                showCloseButton: false,
                onDismiss: () {},
              ),
              const SizedBox(height: 32),
              // 4. Avatar (Padded Image)
              Ux4gModal(
                headerImageContent: Container(
                  color: const Color(0xFF6A4EFF).withValues(alpha: 0.1),
                ),
                headerImageStyle: Ux4gModalHeaderImage.padded,
                leadingItem: Ux4gModalLeadingItem.avatar,
                avatarInitials: 'JD',
                alignment: Ux4gModalAlignment.centered,
                headerTitle: 'John Doe',
                descriptionText: 'Administrator',
                showDescription: true,
                onDismiss: () {},
              ),
              const SizedBox(height: 32),
              // 5. Full-Bleed Image Header
              Ux4gModal(
                headerImageUrl: 'https://picsum.photos/seed/modal/600/300',
                headerImageStyle: Ux4gModalHeaderImage.fullBleed,
                headerTitle: 'Image Header',
                descriptionText: 'Optional description below header',
                showDescription: true,
                bodyText:
                    'Modals with full-bleed images are great for onboarding or marketing content.',
                footerButtons: Ux4gModalFooterButtons.twoButtons,
                primaryButtonText: 'Continue',
                secondaryButtonText: 'Back',
                onDismiss: () {},
              ),
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Icon Centered',
      builder: (context) => ComponentDocs(
        name: 'Modal — Icon Centered',
        description:
            'Centered modal with top icon, header, description, and subtitle.',
        code: '''Ux4gModal(
  leadingItem: Ux4gModalLeadingItem.icon,
  leadingIcon: Icons.category_outlined,
  alignment: Ux4gModalAlignment.centered,
  headerTitle: 'Header',
  showDescription: true,
  descriptionText: 'Write description here',
  showSubtitle: true,
  subtitleText: 'Subtitle',
  bodyText: 'A modal is a design element that pops up over the main content of a webpage. It demands the user\\'s attention by temporarily disabling interaction with the rest of the page until the user addresses the content within the modal.',
  primaryButtonText: 'Save',
  secondaryButtonText: 'Close',
  onDismiss: () {},
);''',
        child: SizedBox(
          width: 400,
          child: Ux4gModal(
            leadingItem: Ux4gModalLeadingItem.icon,
            leadingIcon: Icons.category_outlined,
            alignment: Ux4gModalAlignment.centered,
            headerTitle: 'Header',
            showDescription: true,
            descriptionText: 'Write description here',
            showSubtitle: true,
            subtitleText: 'Subtitle',
            bodyText:
                'A modal is a design element that pops up over the main content of a webpage. '
                'It demands the user\'s attention by temporarily disabling interaction with the '
                'rest of the page until the user addresses the content within the modal.',
            primaryButtonText: 'Save',
            secondaryButtonText: 'Close',
            onDismiss: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Hero Image Variants',
      builder: (context) {
        const bodyContent =
            'A modal is a design element that appears over the main content of a webpage, capturing the user\'s attention by disabling interaction with the rest of the page until the modal is addressed.';

        Widget buildPromoModal(
          Ux4gModalAlignment align,
          bool destructive, {
          String? imageUrl,
        }) {
          return SizedBox(
            width: 400,
            child: Ux4gModal(
              headerImageUrl: imageUrl,
              headerImageContent: imageUrl == null
                  ? Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF8E2DE2),
                            Color(0xFF4A00E0),
                          ], // Purple gradient
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    )
                  : null,
              headerImageStyle: Ux4gModalHeaderImage.fullBleed,
              leadingItem: Ux4gModalLeadingItem.icon,
              leadingIcon: Icons.category_outlined,
              leadingIconTint: destructive ? const Color(0xFFD32F2F) : null,
              alignment: align,
              headerTitle: 'Header',
              showDescription: true,
              descriptionText: 'Write description here',
              showSubtitle: true,
              subtitleText: 'Subtitle',
              bodyText: bodyContent,
              footerButtons: Ux4gModalFooterButtons.twoButtons,
              footerAlign: align == Ux4gModalAlignment.centered
                  ? Ux4gModalFooterAlign.center
                  : Ux4gModalFooterAlign.right,
              isDestructive: destructive,
              primaryButtonText: 'Button',
              secondaryButtonText: 'Button',
              onDismiss: () {},
            ),
          );
        }

        return ComponentDocs(
          name: 'Modal — Hero Image Variants',
          description:
              'Showcases permutations of hero images with different alignments and button intents.',
          code: '''// 1. Left Aligned, Gradient Header
Ux4gModal(
  headerImageContent: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  headerImageStyle: Ux4gModalHeaderImage.fullBleed,
  leadingItem: Ux4gModalLeadingItem.icon,
  leadingIcon: Icons.category_outlined,
  alignment: Ux4gModalAlignment.leftAligned,
  headerTitle: 'Header',
  showDescription: true,
  descriptionText: 'Write description here',
  showSubtitle: true,
  subtitleText: 'Subtitle',
  bodyText: 'A modal is a design element that appears over the main content of a webpage, capturing the user\\'s attention by disabling interaction with the rest of the page until the modal is addressed.',
  footerButtons: Ux4gModalFooterButtons.twoButtons,
  footerAlign: Ux4gModalFooterAlign.right,
  primaryButtonText: 'Button',
  secondaryButtonText: 'Button',
  onDismiss: () {},
);

// 2. Left Aligned, Image Header (Destructive)
Ux4gModal(
  headerImageUrl: 'https://picsum.photos/seed/promo1/600/300',
  headerImageStyle: Ux4gModalHeaderImage.fullBleed,
  leadingItem: Ux4gModalLeadingItem.icon,
  leadingIcon: Icons.category_outlined,
  leadingIconTint: const Color(0xFFD32F2F),
  alignment: Ux4gModalAlignment.leftAligned,
  headerTitle: 'Header',
  showDescription: true,
  descriptionText: 'Write description here',
  showSubtitle: true,
  subtitleText: 'Subtitle',
  bodyText: 'A modal is a design element that appears over the main content of a webpage, capturing the user\\'s attention by disabling interaction with the rest of the page until the modal is addressed.',
  footerButtons: Ux4gModalFooterButtons.twoButtons,
  footerAlign: Ux4gModalFooterAlign.right,
  isDestructive: true,
  primaryButtonText: 'Button',
  secondaryButtonText: 'Button',
  onDismiss: () {},
);

// 3. Centered, Image Header
Ux4gModal(
  headerImageUrl: 'https://picsum.photos/seed/promo2/600/300',
  headerImageStyle: Ux4gModalHeaderImage.fullBleed,
  leadingItem: Ux4gModalLeadingItem.icon,
  leadingIcon: Icons.category_outlined,
  alignment: Ux4gModalAlignment.centered,
  headerTitle: 'Header',
  showDescription: true,
  descriptionText: 'Write description here',
  showSubtitle: true,
  subtitleText: 'Subtitle',
  bodyText: 'A modal is a design element that appears over the main content of a webpage, capturing the user\\'s attention by disabling interaction with the rest of the page until the modal is addressed.',
  footerButtons: Ux4gModalFooterButtons.twoButtons,
  footerAlign: Ux4gModalFooterAlign.center,
  primaryButtonText: 'Button',
  secondaryButtonText: 'Button',
  onDismiss: () {},
);

// 4. Centered, Gradient Header (Destructive)
Ux4gModal(
  headerImageContent: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  headerImageStyle: Ux4gModalHeaderImage.fullBleed,
  leadingItem: Ux4gModalLeadingItem.icon,
  leadingIcon: Icons.category_outlined,
  leadingIconTint: const Color(0xFFD32F2F),
  alignment: Ux4gModalAlignment.centered,
  headerTitle: 'Header',
  showDescription: true,
  descriptionText: 'Write description here',
  showSubtitle: true,
  subtitleText: 'Subtitle',
  bodyText: 'A modal is a design element that appears over the main content of a webpage, capturing the user\\'s attention by disabling interaction with the rest of the page until the modal is addressed.',
  footerButtons: Ux4gModalFooterButtons.twoButtons,
  footerAlign: Ux4gModalFooterAlign.center,
  isDestructive: true,
  primaryButtonText: 'Button',
  secondaryButtonText: 'Button',
  onDismiss: () {},
);''',
          child: Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              buildPromoModal(Ux4gModalAlignment.leftAligned, false),
              buildPromoModal(
                Ux4gModalAlignment.leftAligned,
                true,
                imageUrl: 'https://picsum.photos/seed/promo1/600/300',
              ),
              buildPromoModal(
                Ux4gModalAlignment.centered,
                false,
                imageUrl: 'https://picsum.photos/seed/promo2/600/300',
              ),
              buildPromoModal(Ux4gModalAlignment.centered, true),
            ],
          ),
        );
      },
    ),
    // ── Static Full Preview ───────────────────────────────────────
    WidgetbookUseCase(
      name: 'Static Full Preview',
      builder: (context) => ComponentDocs(
        name: 'Modal — All Props',
        description: 'Complete technical reference with a full visual example.',
        code: '''Ux4gModal(
  headerTitle: 'Full Preview Modal',
  bodyText: 'This modal is shown here so you can see the visual effect while browsing the Props tab.',
  onDismiss: () {},
);''',
        props: const [
          PropRow(
            name: 'onDismiss',
            type: 'VoidCallback',
            description: 'Called when backdrop or close button is tapped.',
            required: true,
          ),
          PropRow(
            name: 'headerImageContent',
            type: 'Widget?',
            description: 'Widget rendered as the header image.',
          ),
          PropRow(
            name: 'headerImageUrl',
            type: 'String?',
            description: 'URL for the header image.',
          ),
          PropRow(
            name: 'headerImageHeight',
            type: 'double',
            description: 'Height of the header image.',
            defaultValue: '160',
          ),
          PropRow(
            name: 'headerImageStyle',
            type: 'Ux4gModalHeaderImage',
            description: 'Style: fullBleed, padded, none.',
            defaultValue: 'fullBleed',
          ),
          PropRow(
            name: 'leadingItem',
            type: 'Ux4gModalLeadingItem',
            description: 'none, icon, avatar, image.',
            defaultValue: 'none',
          ),
          PropRow(
            name: 'headerTitle',
            type: 'String',
            description: 'Header title text.',
            defaultValue: '"Header"',
          ),
          PropRow(
            name: 'footerButtons',
            type: 'Ux4gModalFooterButtons',
            description: 'oneButton, twoButtons, etc.',
            defaultValue: 'twoButtons',
          ),
          PropRow(
            name: 'footerAlign',
            type: 'Ux4gModalFooterAlign',
            description: 'left, right, center, split.',
            defaultValue: 'right',
          ),
          PropRow(
            name: 'isDestructive',
            type: 'bool',
            description: 'Use error color for primary action.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'alignment',
            type: 'Ux4gModalAlignment',
            description: 'leftAligned or centered.',
            defaultValue: 'leftAligned',
          ),
          PropRow(
            name: 'backgroundColor',
            type: 'Color?',
            description: 'Background color of modal.',
          ),
          PropRow(
            name: 'cornerRadius',
            type: 'double',
            description: 'Corner radius of modal.',
            defaultValue: '16.0',
          ),
        ],
        child: SizedBox(
          width: 400,
          child: Ux4gModal(
            headerTitle: 'Full Preview Modal',
            bodyText:
                'This modal is shown here so you can see the visual effect while browsing the Props tab.',
            onDismiss: () {},
          ),
        ),
      ),
    ),
  ],
);

// ── Bottom Sheet ──────────────────────────────────────────────────────────────

final bottomSheetComponent = WidgetbookComponent(
  name: 'BottomSheet',
  useCases: [
    WidgetbookUseCase(
      name: 'Interactive Trigger',
      builder: (context) => ComponentDocs(
        name: 'BottomSheet — Trigger',
        description: 'Click the button to open the bottom sheet.',
        code: '''Ux4gButton(
  text: 'Open Bottom Sheet',
  variant: Ux4gButtonVariant.outline,
  onPressed: () {
    Ux4gBottomSheet.show(
      context,
      title: 'Filter Options',
      description: 'Choose one of the sorting methods below.',
      isDraggable: true,
      footerType: Ux4gCardFooterType.primaryAndSecondary,
      onPrimaryClick: () => Navigator.of(context, rootNavigator: true).pop(),
      onSecondaryClick: () => Navigator.of(context, rootNavigator: true).pop(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.sort),
            title: const Text('Sort by date'),
          ),
          ListTile(
            leading: const Icon(Icons.filter_list),
            title: const Text('Filter by category'),
          ),
        ],
      ),
    );
  },
);''',
        child: Ux4gButton(
          text: 'Open Bottom Sheet',
          variant: Ux4gButtonVariant.outline,
          onPressed: () {
            Ux4gBottomSheet.show(
              context,
              title: context.knobs.string(
                label: 'Title',
                initialValue: 'Filter Options',
              ),
              description: 'Choose one of the sorting methods below.',
              isDraggable: context.knobs.boolean(
                label: 'Draggable',
                initialValue: true,
              ),
              footerType: Ux4gCardFooterType.primaryAndSecondary,
              onPrimaryClick: () =>
                  Navigator.of(context, rootNavigator: true).pop(),
              onSecondaryClick: () =>
                  Navigator.of(context, rootNavigator: true).pop(),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.sort),
                    title: const Text('Sort by date'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.filter_list),
                    title: const Text('Filter by category'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Static Preview',
      builder: (context) => ComponentDocs(
        name: 'BottomSheet',
        description: 'Static visual preview of the sheet surface.',
        props: const [
          PropRow(
            name: 'onDismiss',
            type: 'VoidCallback',
            description: 'Called when sheet is dismissed.',
            required: true,
          ),
          PropRow(
            name: 'headerTitle',
            type: 'String?',
            description: 'Title in header.',
          ),
          PropRow(
            name: 'headerSubtleText',
            type: 'String?',
            description: 'Subtle text next to title.',
          ),
          PropRow(
            name: 'headerIcon',
            type: 'IconData?',
            description: 'Icon in header.',
          ),
          PropRow(
            name: 'showCloseButton',
            type: 'bool',
            description: 'Show close icon.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'description',
            type: 'String?',
            description: 'Description below header.',
          ),
          PropRow(
            name: 'content',
            type: 'Widget',
            description: 'Main content widget.',
            required: true,
          ),
          PropRow(
            name: 'footerType',
            type: 'Ux4gCardFooterType',
            description: 'none, primaryOnly, etc.',
            defaultValue: 'none',
          ),
          PropRow(
            name: 'footerAlignment',
            type: 'Ux4gBottomSheetFooterAlignment',
            description: 'left, centered, right, justified.',
            defaultValue: 'left',
          ),
          PropRow(
            name: 'primaryButtonText',
            type: 'String',
            description: 'Primary button label.',
            defaultValue: '"Confirm"',
          ),
          PropRow(
            name: 'secondaryButtonText',
            type: 'String',
            description: 'Secondary button label.',
            defaultValue: '"Cancel"',
          ),
          PropRow(
            name: 'onPrimaryClick',
            type: 'VoidCallback?',
            description: 'Action for primary button.',
          ),
          PropRow(
            name: 'onSecondaryClick',
            type: 'VoidCallback?',
            description: 'Action for secondary button.',
          ),
          PropRow(
            name: 'showDividers',
            type: 'bool',
            description: 'Show top/bottom dividers.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'isDraggable',
            type: 'bool',
            description: 'Show drag handle and enable drag.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'containerColor',
            type: 'Color?',
            description: 'Background color of sheet.',
          ),
          PropRow(
            name: 'scrimColor',
            type: 'Color?',
            description: 'Color of the background scrim.',
          ),
        ],
        child: SizedBox(
          width: 380,
          child: Ux4gBottomSheet(
            headerTitle: 'Static Preview',
            isDraggable: true,
            onDismiss: () {},
            content: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('Surface content preview.'),
            ),
          ),
        ),
      ),
    ),
  ],
);

// ── Toast ─────────────────────────────────────────────────────────────────────

final toastComponent = WidgetbookComponent(
  name: 'Toasts',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) => ComponentDocs(
        name: 'Toast',
        description:
            'Toggle component allows users to switch between two states typically representing on/off, enabled/disabled, or active/inactive settings. Toggles provide a quick and intuitive way to modify system or feature preferences with a single action.',
        showPreview: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ...Ux4gToastCategory.values
                .where((c) => c != Ux4gToastCategory.slot)
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Ux4gToast(
                      category: c,
                      title:
                          '${c.name[0].toUpperCase()}${c.name.substring(1)} message',
                      subtitle: 'Supporting description text.',
                    ),
                  ),
                ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'All Categories',
      builder: (context) => ComponentDocs(
        name: 'Toast',
        description: 'Semantic categories for informative messages.',
        code: '''// 1. Setup Toast Host State
final toastState = Ux4gToastHostState();

// 2. Wrap your App Content with Toast Host in a Stack
Stack(
  children: [
    const MainAppContent(),
    
    // To show Toast at TOP:
    Positioned(
      top: 0, left: 0, right: 0,
      child: Ux4gToastHost(hostState: toastState, isBottom: false),
    ),
    
    // OR to show Toast at BOTTOM:
    /*
    Positioned(
      bottom: 0, left: 0, right: 0,
      child: Ux4gToastHost(hostState: toastState, isBottom: true),
    ),
    */
  ],
)

// 3. Trigger Toast programmatically
toastState.showToast(
  title: 'Success!',
  category: Ux4gToastCategory.success,
);''',
        props: const [
          PropRow(
            name: 'category',
            type: 'Ux4gToastCategory',
            description: 'info, success, warning, error, slot.',
            required: true,
          ),
          PropRow(
            name: 'title',
            type: 'String',
            description: 'Main toast title.',
            required: true,
          ),
          PropRow(
            name: 'subtitle',
            type: 'String?',
            description: 'Supporting description text.',
          ),
          PropRow(
            name: 'actionText',
            type: 'String?',
            description: 'Text for action button.',
          ),
          PropRow(
            name: 'onActionClick',
            type: 'VoidCallback?',
            description: 'Action button callback.',
          ),
          PropRow(
            name: 'onCloseClick',
            type: 'VoidCallback?',
            description: 'Close button callback.',
          ),
          PropRow(
            name: 'showCloseButton',
            type: 'bool',
            description: 'Whether to show close icon.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'layout',
            type: 'Ux4gToastLayout?',
            description: 'full or stacked. Defaults based on screen width.',
          ),
        ],
        child: SizedBox(
          width: 380,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: Ux4gToastCategory.values
                .where((c) => c != Ux4gToastCategory.slot)
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Ux4gToast(
                      category: c,
                      title:
                          '${c.name[0].toUpperCase()}${c.name.substring(1)} message',
                      subtitle: 'Supporting description text.',
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    ),
  ],
);

// ── Tooltip ───────────────────────────────────────────────────────────────────

final tooltipComponent = WidgetbookComponent(
  name: 'Tooltip',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return ComponentDocs(
          name: 'Tooltip',
          description:
              'Tooltip is a small, contextual popup that appears when you hover over, tap or focus on a UI element (like a button or icon).\nIt provides quick explanatory text or a hint about the element\'s function without permanently cluttering the screen.',
          showPreview: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Example',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 32),
              const Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  Ux4gTooltip(
                    tooltipText: 'Top Tooltip',
                    placement: Ux4gTooltipPlacement.top,
                    child: Ux4gButton(text: 'Top', onPressed: null),
                  ),
                  Ux4gTooltip(
                    tooltipText: 'Bottom Tooltip',
                    placement: Ux4gTooltipPlacement.bottom,
                    child: Ux4gButton(text: 'Bottom', onPressed: null),
                  ),
                  Ux4gTooltip(
                    tooltipText: 'Left Tooltip',
                    placement: Ux4gTooltipPlacement.left,
                    child: Ux4gButton(text: 'Left', onPressed: null),
                  ),
                  Ux4gTooltip(
                    tooltipText: 'Right Tooltip',
                    placement: Ux4gTooltipPlacement.right,
                    child: Ux4gButton(text: 'Right', onPressed: null),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Top Placement',
      builder: (context) => ComponentDocs(
        name: 'Top Placement',
        description: 'Tooltip placed at the top of the target element.',
        code: '''Ux4gTooltip(
  tooltipText: 'Top Tooltip',
  placement: Ux4gTooltipPlacement.top,
  child: const Ux4gButton(text: 'Top', onPressed: null),
);''',
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Ux4gTooltip(
              tooltipText: 'Top Tooltip',
              placement: Ux4gTooltipPlacement.top,
              child: Ux4gButton(text: 'Top', onPressed: null),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Bottom Placement',
      builder: (context) => ComponentDocs(
        name: 'Bottom Placement',
        description: 'Tooltip placed at the bottom of the target element.',
        code: '''Ux4gTooltip(
  tooltipText: 'Bottom Tooltip',
  placement: Ux4gTooltipPlacement.bottom,
  child: const Ux4gButton(text: 'Bottom', onPressed: null),
);''',
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Ux4gTooltip(
              tooltipText: 'Bottom Tooltip',
              placement: Ux4gTooltipPlacement.bottom,
              child: Ux4gButton(text: 'Bottom', onPressed: null),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Left Placement',
      builder: (context) => ComponentDocs(
        name: 'Left Placement',
        description: 'Tooltip placed to the left of the target element.',
        code: '''Ux4gTooltip(
  tooltipText: 'Left Tooltip',
  placement: Ux4gTooltipPlacement.left,
  child: const Ux4gButton(text: 'Left', onPressed: null),
);''',
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Ux4gTooltip(
              tooltipText: 'Left Tooltip',
              placement: Ux4gTooltipPlacement.left,
              child: Ux4gButton(text: 'Left', onPressed: null),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Right Placement',
      builder: (context) => ComponentDocs(
        name: 'Right Placement',
        description: 'Tooltip placed to the right of the target element.',
        code: '''Ux4gTooltip(
  tooltipText: 'Right Tooltip',
  placement: Ux4gTooltipPlacement.right,
  child: const Ux4gButton(text: 'Right', onPressed: null),
);''',
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Ux4gTooltip(
              tooltipText: 'Right Tooltip',
              placement: Ux4gTooltipPlacement.right,
              child: Ux4gButton(text: 'Right', onPressed: null),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Interactive',
      builder: (context) => ComponentDocs(
        name: 'Tooltip — Interactive',
        description:
            'Tooltip is a small, contextual popup that appears when you tap on a UI element (like a button or icon). It provides quick explanatory text or a hint about the element\'s function without permanently cluttering the screen.',
        code: '''Ux4gTooltip(
  tooltipText: 'Interactive Tooltip',
  title: 'Information', // Optional
  icon: Icons.view_in_ar_outlined, // Optional
  placement: Ux4gTooltipPlacement.top,
  backgroundColor: Ux4gColors.neutral700, // Light: neutral700, Dark: neutral300
  contentColor: Ux4gColors.neutral50, // Light: neutral50, Dark: neutral900
  cornerRadius: Ux4gRadius.radius4, // Default: 4.0
  arrowWidth: 10.0, // Default: 10.0
  arrowHeight: 6.0, // Default: 6.0
  isPersistent: false,
  child: const Ux4gButton(
    text: 'Long Press / Tap Me',
    onPressed: () {},
  ),
);''',
        props: const [
          PropRow(
            name: 'child',
            type: 'Widget',
            description: 'Trigger widget.',
            required: true,
          ),
          PropRow(
            name: 'tooltipText',
            type: 'String',
            description: 'Tooltip body text.',
            required: true,
          ),
          PropRow(
            name: 'placement',
            type: 'Ux4gTooltipPlacement',
            description: 'top / bottom / left / right alignments.',
            defaultValue: 'top',
          ),
          PropRow(
            name: 'title',
            type: 'String?',
            description: 'Optional title (makes tooltip rich/persistent).',
          ),
          PropRow(
            name: 'icon',
            type: 'IconData?',
            description: 'Optional leading icon.',
          ),
          PropRow(
            name: 'backgroundColor',
            type: 'Color?',
            description:
                'Custom background. Defaults to neutral700 (light) / neutral300 (dark).',
          ),
          PropRow(
            name: 'contentColor',
            type: 'Color?',
            description:
                'Custom text/icon color. Defaults to neutral50 (light) / neutral900 (dark).',
          ),
          PropRow(
            name: 'cornerRadius',
            type: 'double',
            description: 'Radius of the tooltip bubble.',
            defaultValue: '4.0',
          ),
          PropRow(
            name: 'arrowWidth',
            type: 'double',
            description: 'Width of the caret/arrow.',
            defaultValue: '10.0',
          ),
          PropRow(
            name: 'arrowHeight',
            type: 'double',
            description: 'Height of the caret/arrow.',
            defaultValue: '6.0',
          ),
          PropRow(
            name: 'isPersistent',
            type: 'bool',
            description: 'If true, tooltip does not auto-dismiss.',
            defaultValue: 'false',
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Ux4gTooltip(
            tooltipText: context.knobs.string(
              label: 'Text',
              initialValue: 'Interactive Tooltip',
            ),
            icon: Icons.view_in_ar_outlined,
            placement: context.knobs.list(
              label: 'Placement',
              options: Ux4gTooltipPlacement.values,
              initialOption: Ux4gTooltipPlacement.top,
              labelBuilder: (v) => v.name,
            ),
            child: Ux4gButton(text: 'Long Press / Tap Me', onPressed: () {}),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'All Variants',
      builder: (context) {
        final typography = Ux4gTheme.typography(context);

        Widget buildRow(String title, List<Ux4gTooltipPlacement> placements) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: typography.lS_strong),
              const SizedBox(height: 16),
              Wrap(
                spacing: 32,
                runSpacing: 32,
                children: placements.map((p) {
                  return Ux4gTooltip(
                    tooltipText: 'Tooltip',
                    icon: Icons.view_in_ar_outlined,
                    placement: p,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('Hover Me'),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 60),
            ],
          );
        }

        return ComponentDocs(
          name: 'Tooltip — All Variants',
          description:
              'Visual reference for all directional placements and alignments.',
          code:
              '''// ── Top Placements ──────────────────────────────────────────
// Top Start
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.topStart,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Top
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.top,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Top End
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.topEnd,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// ── Bottom Placements ───────────────────────────────────────
// Bottom Start
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.bottomStart,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Bottom
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.bottom,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Bottom End
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.bottomEnd,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// ── Left Placements ─────────────────────────────────────────
// Left Start
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.leftStart,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Left
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.left,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Left End
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.leftEnd,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// ── Right Placements ────────────────────────────────────────
// Right Start
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.rightStart,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Right
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.right,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);

// Right End
Ux4gTooltip(
  tooltipText: 'Tooltip',
  icon: Icons.view_in_ar_outlined,
  placement: Ux4gTooltipPlacement.rightEnd,
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(4),
    ),
    child: const Text('Hover Me'),
  ),
);''',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRow('Top Placements', [
                  Ux4gTooltipPlacement.topStart,
                  Ux4gTooltipPlacement.top,
                  Ux4gTooltipPlacement.topEnd,
                ]),
                buildRow('Bottom Placements', [
                  Ux4gTooltipPlacement.bottomStart,
                  Ux4gTooltipPlacement.bottom,
                  Ux4gTooltipPlacement.bottomEnd,
                ]),
                buildRow('Left Placements', [
                  Ux4gTooltipPlacement.leftStart,
                  Ux4gTooltipPlacement.left,
                  Ux4gTooltipPlacement.leftEnd,
                ]),
                buildRow('Right Placements', [
                  Ux4gTooltipPlacement.rightStart,
                  Ux4gTooltipPlacement.right,
                  Ux4gTooltipPlacement.rightEnd,
                ]),
              ],
            ),
          ),
        );
      },
    ),
  ],
);

// ── Popover ───────────────────────────────────────────────────────────────────

final popoverComponent = WidgetbookComponent(
  name: 'Popover',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return ComponentDocs(
          name: 'Popover',
          description:
              'Popover displays additional information or actions in a lightweight overlay triggered by user interaction. It can contain interactive content such as buttons, links, and form controls.',
          showPreview: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Example',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 32),
              const Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  Ux4gTooltip(
                    isPersistent: true,
                    enableUserInput: true,
                    placement: Ux4gTooltipPlacement.top,
                    backgroundColor: Colors.white,
                    contentColor: Colors.black,
                    maxWidth: 200,
                    customContent: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Top Popover',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    child: Ux4gButton(text: 'Top', onPressed: null),
                  ),
                  Ux4gTooltip(
                    isPersistent: true,
                    enableUserInput: true,
                    placement: Ux4gTooltipPlacement.bottom,
                    backgroundColor: Colors.white,
                    contentColor: Colors.black,
                    maxWidth: 200,
                    customContent: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Bottom Popover',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    child: Ux4gButton(text: 'Bottom', onPressed: null),
                  ),
                  Ux4gTooltip(
                    isPersistent: true,
                    enableUserInput: true,
                    placement: Ux4gTooltipPlacement.left,
                    backgroundColor: Colors.white,
                    contentColor: Colors.black,
                    maxWidth: 200,
                    customContent: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Left Popover',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    child: Ux4gButton(text: 'Left', onPressed: null),
                  ),
                  Ux4gTooltip(
                    isPersistent: true,
                    enableUserInput: true,
                    placement: Ux4gTooltipPlacement.right,
                    backgroundColor: Colors.white,
                    contentColor: Colors.black,
                    maxWidth: 200,
                    customContent: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Right Popover',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    child: Ux4gButton(text: 'Right', onPressed: null),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Top Placement',
      builder: (context) {
        return ComponentDocs(
          name: 'Top Placement',
          description: 'Popover placed at the top of the target element.',
          code: '''Ux4gTooltip(
  isPersistent: true,
  enableUserInput: true,
  placement: Ux4gTooltipPlacement.top,
  backgroundColor: Colors.white,
  contentColor: Colors.black,
  maxWidth: 200,
  customContent: const Padding(
    padding: EdgeInsets.all(12),
    child: Text('Top Popover', style: TextStyle(color: Colors.black87)),
  ),
  child: const Ux4gButton(text: 'Top', onPressed: () {}),
);''',
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Ux4gTooltip(
                isPersistent: true,
                enableUserInput: true,
                placement: Ux4gTooltipPlacement.top,
                backgroundColor: Colors.white,
                contentColor: Colors.black,
                maxWidth: 200,
                customContent: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Top Popover',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                child: Ux4gButton(text: 'Top', onPressed: () {}),
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Bottom Placement',
      builder: (context) {
        return ComponentDocs(
          name: 'Bottom Placement',
          description: 'Popover placed at the bottom of the target element.',
          code: '''Ux4gTooltip(
  isPersistent: true,
  enableUserInput: true,
  placement: Ux4gTooltipPlacement.bottom,
  backgroundColor: Colors.white,
  contentColor: Colors.black,
  maxWidth: 200,
  customContent: const Padding(
    padding: EdgeInsets.all(12),
    child: Text('Bottom Popover', style: TextStyle(color: Colors.black87)),
  ),
  child: const Ux4gButton(text: 'Bottom', onPressed: () {}),
);''',
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Ux4gTooltip(
                isPersistent: true,
                enableUserInput: true,
                placement: Ux4gTooltipPlacement.bottom,
                backgroundColor: Colors.white,
                contentColor: Colors.black,
                maxWidth: 200,
                customContent: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Bottom Popover',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                child: Ux4gButton(text: 'Bottom', onPressed: () {}),
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Left Placement',
      builder: (context) {
        return ComponentDocs(
          name: 'Left Placement',
          description: 'Popover placed to the left of the target element.',
          code: '''Ux4gTooltip(
  isPersistent: true,
  enableUserInput: true,
  placement: Ux4gTooltipPlacement.left,
  backgroundColor: Colors.white,
  contentColor: Colors.black,
  maxWidth: 200,
  customContent: const Padding(
    padding: EdgeInsets.all(12),
    child: Text('Left Popover', style: TextStyle(color: Colors.black87)),
  ),
  child: const Ux4gButton(text: 'Left', onPressed: () {}),
);''',
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Ux4gTooltip(
                isPersistent: true,
                enableUserInput: true,
                placement: Ux4gTooltipPlacement.left,
                backgroundColor: Colors.white,
                contentColor: Colors.black,
                maxWidth: 200,
                customContent: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Left Popover',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                child: Ux4gButton(text: 'Left', onPressed: () {}),
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Right Placement',
      builder: (context) {
        return ComponentDocs(
          name: 'Right Placement',
          description: 'Popover placed to the right of the target element.',
          code: '''Ux4gTooltip(
  isPersistent: true,
  enableUserInput: true,
  placement: Ux4gTooltipPlacement.right,
  backgroundColor: Colors.white,
  contentColor: Colors.black,
  maxWidth: 200,
  customContent: const Padding(
    padding: EdgeInsets.all(12),
    child: Text('Right Popover', style: TextStyle(color: Colors.black87)),
  ),
  child: const Ux4gButton(text: 'Right', onPressed: () {}),
);''',
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Center(
              child: Ux4gTooltip(
                isPersistent: true,
                enableUserInput: true,
                placement: Ux4gTooltipPlacement.right,
                backgroundColor: Colors.white,
                contentColor: Colors.black,
                maxWidth: 200,
                customContent: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Right Popover',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                child: Ux4gButton(text: 'Right', onPressed: () {}),
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Basic Popover',
      builder: (context) {
        return ComponentDocs(
          name: 'Basic Popover',
          description: 'A simple popover containing just text.',
          code: '''Ux4gTooltip(
  isPersistent: true,
  enableUserInput: true,
  placement: Ux4gTooltipPlacement.bottom,
  backgroundColor: Colors.white,
  contentColor: Colors.black,
  maxWidth: 300,
  customContent: const Padding(
    padding: EdgeInsets.all(12),
    child: Text('This is a basic popover.', style: TextStyle(color: Colors.black87)),
  ),
  child: const Ux4gButton(text: 'Basic', onPressed: () {}),
);''',
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Ux4gTooltip(
                isPersistent: true,
                enableUserInput: true,
                placement: Ux4gTooltipPlacement.bottom,
                backgroundColor: Colors.white,
                contentColor: Colors.black,
                maxWidth: 300,
                customContent: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'This is a basic popover.',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
                child: Ux4gButton(text: 'Basic Popover', onPressed: () {}),
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Complex Popover',
      builder: (context) {
        return ComponentDocs(
          name: 'Complex Popover',
          description:
              'A popover containing a complex layout with icons, titles, links, and multiple sections.',
          code: '''Ux4gTooltip(
  isPersistent: true,
  enableUserInput: true,
  placement: Ux4gTooltipPlacement.bottom,
  backgroundColor: Colors.white,
  contentColor: Colors.black,
  maxWidth: 400,
  customContent: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const Icon(Icons.grid_view_outlined, size: 20, color: Colors.black87),
          const SizedBox(width: 8),
          const Text('Popover Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(width: 8),
          const Text('Label', style: TextStyle(color: Colors.black54)),
          const Spacer(),
          const Icon(Icons.more_vert, size: 20, color: Colors.deepPurple),
        ],
      ),
      const SizedBox(height: 12),
      const Text('This is a subtitle text', style: TextStyle(color: Colors.black87)),
      const SizedBox(height: 8),
      const Text(
        'A Popover is a small overlay UI component that appears floating above the page content, anchored to a trigger element (like a button).',
        style: TextStyle(color: Colors.black87),
      ),
      const SizedBox(height: 12),
      InkWell(
        onTap: () {},
        child: const Text('Link', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
    ],
  ),
  child: const Ux4gButton(text: 'Complex Popover', onPressed: () {}),
);''',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Center(
              child: Ux4gTooltip(
                isPersistent: true,
                enableUserInput: true,
                placement: Ux4gTooltipPlacement.bottom,
                backgroundColor: Colors.white,
                contentColor: Colors.black,
                maxWidth: 400,
                customContent: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.grid_view_outlined,
                          size: 20,
                          color: Colors.black87,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Popover Title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Label',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.more_vert,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'This is a subtitle text',
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'A Popover is a small overlay UI component that appears floating above the page content, anchored to a trigger element (like a button).',
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Link',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                child: Ux4gButton(text: 'Complex Popover', onPressed: () {}),
              ),
            ),
          ),
        );
      },
    ),
  ],
);

final richTooltipComponent = WidgetbookComponent(
  name: 'RichTooltip',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'RichTooltip',
        description: 'Rich tooltip with title, icon, and optional action.',
        code: '''Ux4gRichTooltip(
  tooltipText: 'This is a rich tooltip with a title, icon, and action.',
  title: 'More Info',
  icon: Icons.info_outline,
  placement: Ux4gTooltipPlacement.bottom,
  action: TextButton(
    onPressed: () {},
    child: const Text('Learn more'),
  ),
  child: const Icon(Icons.help_outline, size: 28),
);''',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Ux4gRichTooltip(
              tooltipText:
                  'This is a rich tooltip with a title, icon, and action.',
              title: 'More Info',
              icon: Icons.info_outline,
              placement: Ux4gTooltipPlacement.bottom,
              action: TextButton(
                onPressed: () {},
                child: const Text('Learn more'),
              ),
              child: const Icon(Icons.help_outline, size: 28),
            ),
          ],
        ),
      ),
    ),
  ],
);
