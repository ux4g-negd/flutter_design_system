import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ── Modal ─────────────────────────────────────────────────────────────────────

final modalComponent = WidgetbookComponent(
  name: 'Modal',
  useCases: [
    WidgetbookUseCase(
      name: 'Interactive Trigger',
      builder: (context) => ComponentDocs(
        name: 'Ux4gModal — Trigger',
        description: 'Click the button below to see the actual modal dialog.',
        code: '''// Show via helper
Ux4gModal.show(
  context,
  modal: Ux4gModal(
    headerTitle: 'Confirmation',
    bodyText: 'Do you want to proceed with this action?',
    footerButtons: Ux4gModalFooterButtons.twoButtons,
    primaryButtonText: 'Proceed',
    secondaryButtonText: 'Cancel',
    onDismiss: () => Navigator.of(context, rootNavigator: true).pop(),
  ),
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
        name: 'Ux4gModal — Variants',
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
        name: 'Ux4gModal — Icon Centered',
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
  bodyText: 'A modal is a design element...',
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
          name: 'Ux4gModal — Hero Image Variants',
          description:
              'Showcases permutations of hero images with different alignments and button intents.',
          code: '''Ux4gModal(
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
  // Use red destructive colors if needed:
  // leadingIconTint: const Color(0xFFD32F2F),
  // isDestructive: true,
  alignment: Ux4gModalAlignment.leftAligned, // or centered
  headerTitle: 'Header',
  showDescription: true,
  descriptionText: 'Write description here',
  showSubtitle: true,
  subtitleText: 'Subtitle',
  bodyText: 'A modal is a design element that appears over the main content...',
  footerButtons: Ux4gModalFooterButtons.twoButtons,
  footerAlign: Ux4gModalFooterAlign.right, // or center
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
        name: 'Ux4gModal — All Props',
        description: 'Complete technical reference with a full visual example.',
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
        name: 'Ux4gBottomSheet — Trigger',
        description: 'Click the button to open the bottom sheet.',
        code: '''Ux4gBottomSheet.show(
  context,
  title: 'Settings',
  isDraggable: true,
  content: MyContent(),
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
        name: 'Ux4gBottomSheet',
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
  name: 'Switch(Toasts)',
  useCases: [
    WidgetbookUseCase(
      name: 'All Categories',
      builder: (context) => ComponentDocs(
        name: 'Ux4gToast',
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
  name: 'Ux4gTooltip',
  useCases: [
    WidgetbookUseCase(
      name: 'Interactive',
      builder: (context) => ComponentDocs(
        name: 'Ux4gTooltip — Interactive',
        description: 'Use knobs to test different placements and text.',
        code: '''Ux4gTooltip(
  tooltipText: 'Interactive Tooltip',
  title: 'Information', // Optional
  icon: Icons.view_in_ar_outlined, // Optional
  placement: Ux4gTooltipPlacement.top,
  backgroundColor: Ux4gPalette.neutral700, // Light: neutral700, Dark: neutral300
  contentColor: Ux4gPalette.neutral50, // Light: neutral50, Dark: neutral900
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
          name: 'Ux4gTooltip — All Variants',
          description:
              'Visual reference for all directional placements and alignments.',
          code: '''// Standard usage with all parameters
Ux4gTooltip(
  tooltipText: 'This is a standard tooltip.',
  title: 'Information', // Optional (makes it a rich tooltip)
  icon: Icons.info_outline, // Optional
  placement: Ux4gTooltipPlacement.top, // 12 placement options
  backgroundColor: Ux4gPalette.neutral700, // Default in light mode
  contentColor: Ux4gPalette.neutral50, // Default in light mode
  cornerRadius: Ux4gRadius.radius4, // Default: 4px
  arrowWidth: 10.0,
  arrowHeight: 6.0,
  enableUserInput: true,
  isPersistent: false,
  child: Icon(Icons.help_outline),
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

final richTooltipComponent = WidgetbookComponent(
  name: 'Ux4gRichTooltip',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'Ux4gRichTooltip',
        description: 'Rich tooltip with title, icon, and optional action.',
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
