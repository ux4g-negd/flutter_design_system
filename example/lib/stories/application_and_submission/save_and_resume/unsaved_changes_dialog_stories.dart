import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral400 : const Color(0xFF4B5563);
Color _getBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : const Color(0xFFF9FAFB);
Color _getDialogBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Colors.white;

final unsavedChangesDialogComponent = WidgetbookComponent(
  name: 'Unsaved Changes Dialog',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Unsaved Changes Dialog',
          description:
              'A confirmation dialog shown when the user attempts to leave a page with unsaved changes, '
              'offering options to save draft or leave without saving.',
          code: _unsavedChangesDialogCode,
          center: true,
          child: const _UnsavedChangesDialogMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _unsavedChangesDialogCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

void showUnsavedChangesDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Unsaved changes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF111827)),
            ),
            const SizedBox(height: 12),
            const Text(
              'If you leave now, changes since your last save will be lost.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF4B5563), height: 1.4),
            ),
            const SizedBox(height: 24),
            Ux4gButton(height: 48, 
              text: 'Save draft and leave',
              onPressed: () => Navigator.pop(context),
              size: Ux4gButtonSize.large,
              width: double.infinity,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                'Leave without saving',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Ux4gColors.red300
                      : Ux4gColors.red800,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _UnsavedChangesDialogMockup extends StatelessWidget {
  const _UnsavedChangesDialogMockup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBg(context),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _getDialogBg(context),
            borderRadius: BorderRadius.circular(16),
            border: _isDark(context)
                ? Border.all(color: Ux4gColors.neutral800)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Unsaved changes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: _getTitleColor(context),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'If you leave now, changes since your last save will be lost.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: _getSubtleText(context),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Ux4gButton(
                height: 48,
                text: 'Save draft and leave',
                onPressed: () {},
                size: Ux4gButtonSize.large,
                width: double.infinity,
              ),
              const SizedBox(height: 12),
              Text(
                'Leave without saving',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _isDark(context)
                      ? Ux4gColors.red300
                      : Ux4gColors.red800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
