import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral400 : const Color(0xFF4B5563);
Color _getBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral950 : const Color(0xFFF9FAFB);
Color _getDialogBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral900 : Colors.white;

final discardDraftDialogComponent = WidgetbookComponent(
  name: 'Discard Draft Dialog',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Discard Draft Dialog',
          description:
              'A destructive confirmation dialog shown when the user wants to discard their saved draft '
              'and start the application from scratch. This action cannot be undone.',
          code: _discardDraftDialogCode,
          center: true,
          child: const _DiscardDraftDialogMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _discardDraftDialogCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

void showDiscardDraftDialog(BuildContext context) {
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
              'Discard draft?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF111827)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your saved progress will be deleted.\nThis cannot be undone.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Color(0xFF4B5563), height: 1.4),
            ),
            const SizedBox(height: 24),
            Ux4gButton(height: 48, 
              text: 'Discard and start again',
              onPressed: () => Navigator.pop(context),
              size: Ux4gButtonSize.large,
              width: double.infinity,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.red300
                  : Ux4gPalette.red600,
              borderColor: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.red300
                  : Ux4gPalette.red600,
              contentColor: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.neutral900
                  : Ux4gPalette.neutral50,
            ),
            const SizedBox(height: 12),
            Ux4gButton(height: 48, 
              text: 'Keep my draft',
              onPressed: () => Navigator.pop(context),
              variant: Ux4gButtonVariant.outline,
              size: Ux4gButtonSize.large,
              width: double.infinity,
              contentColor: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary300
                  : Ux4gPalette.primary600,
              borderColor: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gPalette.primary600
                  : Ux4gPalette.primary300,
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

class _DiscardDraftDialogMockup extends StatelessWidget {
  const _DiscardDraftDialogMockup();

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
                ? Border.all(color: Ux4gPalette.neutral800)
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
                'Discard draft?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: _getTitleColor(context),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your saved progress will be deleted.\nThis cannot be undone.',
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
                text: 'Discard and start again',
                onPressed: () {},
                size: Ux4gButtonSize.large,
                width: double.infinity,
                backgroundColor: _isDark(context)
                    ? Ux4gPalette.red300
                    : Ux4gPalette.red600,
                borderColor: _isDark(context)
                    ? Ux4gPalette.red300
                    : Ux4gPalette.red600,
                contentColor: _isDark(context)
                    ? Ux4gPalette.neutral900
                    : Ux4gPalette.neutral50,
              ),
              const SizedBox(height: 12),
              Ux4gButton(
                height: 48,
                text: 'Keep my draft',
                onPressed: () {},
                variant: Ux4gButtonVariant.outline,
                size: Ux4gButtonSize.large,
                width: double.infinity,
                contentColor: _isDark(context)
                    ? Ux4gPalette.primary300
                    : Ux4gPalette.primary600,
                borderColor: _isDark(context)
                    ? Ux4gPalette.primary600
                    : Ux4gPalette.primary300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
