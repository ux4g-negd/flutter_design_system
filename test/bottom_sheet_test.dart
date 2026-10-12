import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

void main() {
  testWidgets('Tapping the backdrop dismisses the bottom sheet', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Ux4gBottomSheet.show(
                  context,
                  title: 'Test Sheet',
                  content: const Text('Sheet Content'),
                );
              },
              child: const Text('Open Sheet'),
            ),
          ),
        ),
      ),
    );

    // Tap to open the sheet
    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    expect(find.text('Test Sheet'), findsOneWidget);
    expect(find.text('Sheet Content'), findsOneWidget);

    // Tap the backdrop (top of the screen at (100, 50))
    await tester.tapAt(const Offset(100, 50));
    await tester.pumpAndSettle();

    // Verify sheet is dismissed
    expect(find.text('Test Sheet'), findsNothing);
  });

  testWidgets('Tapping inside the sheet content does not dismiss the sheet', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Ux4gBottomSheet.show(
                  context,
                  title: 'Test Sheet',
                  content: const Text('Sheet Content'),
                );
              },
              child: const Text('Open Sheet'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    // Tap inside the content of the sheet
    await tester.tap(find.text('Sheet Content'));
    await tester.pumpAndSettle();

    // Sheet should still be present
    expect(find.text('Test Sheet'), findsOneWidget);
  });

  testWidgets('dismissOnBackdropPress: false prevents backdrop dismiss', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Ux4gBottomSheet.show(
                  context,
                  title: 'Persistent Sheet',
                  dismissOnBackdropPress: false,
                  content: const Text('Do Not Dismiss On Backdrop'),
                );
              },
              child: const Text('Open Persistent'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open Persistent'));
    await tester.pumpAndSettle();

    expect(find.text('Persistent Sheet'), findsOneWidget);

    // Tap the backdrop
    await tester.tapAt(const Offset(100, 50));
    await tester.pumpAndSettle();

    // Sheet should still remain open
    expect(find.text('Persistent Sheet'), findsOneWidget);
  });

  testWidgets('Header description renders full multiline text without clamp ellipsis', (WidgetTester tester) async {
    const longDesc =
        'A modal bottom sheet is an interactive overlay anchored to the bottom of the screen with complete details displayed.';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Ux4gBottomSheet.show(
                  context,
                  title: 'Multiline Sheet',
                  description: longDesc,
                  content: const Text('Sheet Content'),
                );
              },
              child: const Text('Open Sheet'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    final descTextFinder = find.text(longDesc);
    expect(descTextFinder, findsOneWidget);

    final Text descWidget = tester.widget<Text>(descTextFinder);
    expect(descWidget.maxLines, isNull);
    expect(descWidget.overflow, isNull);
  });
}
