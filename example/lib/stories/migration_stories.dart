import 'package:widgetbook/widgetbook.dart';
import 'migration_page.dart';

// ── Migration / Component Mapping Component ──────────────────────────────────

final migrationComponent = WidgetbookComponent(
  name: 'Migration',
  useCases: [
    WidgetbookUseCase(
      name: 'Component Mapping & Migration Guide',
      builder: (context) => const Ux4gMigrationPage(),
    ),
  ],
);
