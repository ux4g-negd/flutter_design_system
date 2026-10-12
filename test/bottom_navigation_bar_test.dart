import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

void main() {
  final standardItems = [
    const Ux4gBottomNavItem(
      key: 'home',
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    const Ux4gBottomNavItem(
      key: 'services',
      label: 'Services',
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view,
    ),
    const Ux4gBottomNavItem(
      key: 'status',
      label: 'Status',
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment,
    ),
    const Ux4gBottomNavItem(
      key: 'alerts',
      label: 'Alerts',
      icon: Icons.notifications_none_outlined,
      activeIcon: Icons.notifications,
    ),
    const Ux4gBottomNavItem(
      key: 'profile',
      label: 'Profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person,
    ),
  ];

  final centreActionItems = [
    const Ux4gBottomNavItem(
      key: 'home',
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    const Ux4gBottomNavItem(
      key: 'services',
      label: 'Services',
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view,
    ),
    const Ux4gBottomNavItem(
      key: 'status',
      label: 'Status',
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment,
    ),
    const Ux4gBottomNavItem(
      key: 'alerts',
      label: 'Alerts',
      icon: Icons.notifications_none_outlined,
      activeIcon: Icons.notifications,
    ),
  ];

  group('Ux4gBottomNavigationBar', () {
    testWidgets('renders all 5 labels including Services without clipping', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          theme: Ux4gTheme.themeData(),
          home: Scaffold(
            bottomNavigationBar: Ux4gBottomNavigationBar(
              items: standardItems,
              variant: Ux4gBottomNavVariant.labelled,
              indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Services'), findsOneWidget);
      expect(find.text('Status'), findsOneWidget);
      expect(find.text('Alerts'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);

      final servicesFinder = find.text('Services');
      expect(tester.widget<Text>(servicesFinder).data, 'Services');
    });

    testWidgets('Floating pill variant with 5 items renders Services label', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          theme: Ux4gTheme.themeData(),
          home: Scaffold(
            bottomNavigationBar: Ux4gBottomNavigationBar(
              items: standardItems,
              variant: Ux4gBottomNavVariant.floatingPill,
              indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Services'), findsOneWidget);
    });

    testWidgets('Centre Action variant has dedicated clearance between FAB and adjacent Services tab', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          theme: Ux4gTheme.themeData(),
          home: Scaffold(
            bottomNavigationBar: Ux4gBottomNavigationBar(
              items: centreActionItems,
              variant: Ux4gBottomNavVariant.centreAction,
              centerAction: Ux4gBottomNavCenterAction(
                onPressed: () {},
                tooltip: 'Add',
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final servicesFinder = find.text('Services');
      expect(servicesFinder, findsOneWidget);

      final fabFinder = find.byType(InkWell).at(2); // Center button InkWell
      final servicesRect = tester.getRect(servicesFinder);
      final fabRect = tester.getRect(fabFinder);

      // Verify that the right edge of Services text is separated from the left edge of FAB
      expect(fabRect.left, greaterThan(servicesRect.right));
      final gap = fabRect.left - servicesRect.right;
      // Gap should be distinct and not flush (at least 8px clearance)
      expect(gap, greaterThanOrEqualTo(8.0));
    });
  });
}
