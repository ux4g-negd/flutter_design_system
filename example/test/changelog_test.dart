import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/stories/changelog_page.dart';

void main() {
  testWidgets('Ux4gChangelogPage renders header, spotlight card, and release cards on desktop', (tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(
      const MaterialApp(
        home: Ux4gChangelogPage(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Title and Subtitle
    expect(find.text('Changes Logs'), findsOneWidget);
    expect(find.text('UX4G Design System'), findsWidgets);
    expect(find.text('Flutter Component Library'), findsOneWidget);

    // Verify Latest Version Spotlight Card and Release Card title
    expect(find.textContaining('Latest Version Highlights • v1.5.2'), findsOneWidget);
    expect(find.text('Navigation, Gesture & Layout Refinements'), findsNWidgets(2));

    // Verify Controls & Filters
    expect(find.text('All Releases'), findsOneWidget);
    expect(find.text('Filter Category:'), findsOneWidget);
    expect(find.text('Added'), findsWidgets);
    expect(find.text('Fixed'), findsWidgets);

    // Verify Search Box filtering
    final searchInput = find.byType(TextField);
    expect(searchInput, findsOneWidget);

    await tester.enterText(searchInput, 'Ux4gBottomSheet');
    await tester.pumpAndSettle();

    expect(find.textContaining('Ux4gBottomSheet'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  final testViewports = <String, Size>{
    'Small Mobile (320x568)': const Size(320, 568),
    'Compact Mobile (375x667)': const Size(375, 667),
    'Standard Mobile (412x915)': const Size(412, 915),
    'Tablet Portrait (768x1024)': const Size(768, 1024),
    'Desktop (1200x800)': const Size(1200, 800),
    'Ultra-Wide Desktop (1920x1080)': const Size(1920, 1080),
  };

  for (final entry in testViewports.entries) {
    testWidgets('Ux4gChangelogPage renders without overflow on ${entry.key}', (tester) async {
      tester.view.physicalSize = entry.value;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: Ux4gChangelogPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Ensure page title is rendered
      expect(find.text('Changes Logs'), findsOneWidget);

      // Verify no layout overflow exception on initial load
      expect(tester.takeException(), isNull);

      // Test scroll down through cards on the main vertical scroll view without overflow
      final verticalScrollView = find.byWidgetPredicate(
        (w) => w is SingleChildScrollView && w.scrollDirection == Axis.vertical,
      );
      expect(verticalScrollView, findsOneWidget);

      await tester.drag(verticalScrollView, const Offset(0, -500));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
}
