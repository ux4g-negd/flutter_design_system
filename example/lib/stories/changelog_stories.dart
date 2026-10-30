import 'package:widgetbook/widgetbook.dart';
import 'changelog_page.dart';

// ── Changelog / Changes Logs Component ────────────────────────────────────────

final changelogComponent = WidgetbookComponent(
  name: 'Changelog',
  useCases: [
    WidgetbookUseCase(
      name: 'Changes Logs',
      builder: (context) => const Ux4gChangelogPage(),
    ),
  ],
);

