import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/stories/changelog_page.dart';

void main() {
  testWidgets('Ux4gChangelogPage renders header, spotlight card, and release cards', (tester) async {
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
  });
}
