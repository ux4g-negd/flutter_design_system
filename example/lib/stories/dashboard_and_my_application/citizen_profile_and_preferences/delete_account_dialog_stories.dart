import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700;
Color _getScaffoldBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral950 : Ux4gPalette.neutral300;
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0;

const Color _dangerColor = Ux4gPalette.red600;

final deleteAccountDialogComponent = WidgetbookComponent(
  name: 'Delete Account Dialog',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Delete Account Dialog',
          description:
              'A destructive confirmation dialog shown when the user taps '
              '"Delete my account". Uses Ux4gModal with isDestructive style.',
          code: _deleteAccountDialogCode,
          center: true,
          child: const _DeleteAccountDialogMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _deleteAccountDialogCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

/// Show the delete account confirmation dialog
void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: Ux4gModal(
        onDismiss: () => Navigator.pop(context),
        showHeader: true,
        headerTitle: 'Delete your account?',
        alignment: Ux4gModalAlignment.centered,
        showSubtitle: false,
        showBody: true,
        bodyText:
            'This permanently deletes your account and all associated data. '
            'You will have a 30-day grace period to restore it — after that, '
            'deletion is final and cannot be undone.',
        showDividers: false,
        showFooter: true,
        footerButtons: Ux4gModalFooterButtons.twoButtons,
        footerAlign: Ux4gModalFooterAlign.center,
        isDestructive: true,
        primaryButtonText: 'Delete account',
        secondaryButtonText: 'Cancel',
        showCloseButton: false,
        onPrimaryClick: () {
          // Handle delete
          Navigator.pop(context);
        },
        onSecondaryClick: () => Navigator.pop(context),
      ),
    ),
  );
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _DeleteAccountDialogMockup extends StatelessWidget {
  const _DeleteAccountDialogMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    final typography = Ux4gTheme.typography(context);
    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Container(
        width: 360,
        height: 400,
        decoration: BoxDecoration(
          color: _getScaffoldBg(context),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            decoration: BoxDecoration(
              color: _getCardBg(context),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark ? Ux4gPalette.red800 : Ux4gPalette.red300,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Delete your account?',
                  style: typography.hS_default.copyWith(
                    color: _getTitleColor(context),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                // Description
                Text(
                  'This permanently deletes your account and all associated data. You will have a 30-day grace period to restore it — after that, deletion is final and cannot be undone.',
                  style: typography.bM_default.copyWith(
                    color: _getSubtleText(context),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Delete account button (red filled)
                SizedBox(
                  width: double.infinity,
                  child: Ux4gButton(
                    text: 'Delete account',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: _dangerColor,
                    contentColor: Colors.white,
                    height: 40,
                    textStyle: typography.lL_default,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: Ux4gButton(
                    text: 'Cancel',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.outline,
                    height: 40,
                    borderColor: isDark
                        ? Ux4gPalette.neutral600
                        : Ux4gPalette.neutral300,
                    contentColor: isDark
                        ? Ux4gPalette.neutral50
                        : Ux4gPalette.neutral900,
                    textStyle: typography.lL_default,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
