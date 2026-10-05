import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

void main() {
  group('Ux4gSideMenu', () {
    testWidgets('renders standard side menu correctly with default sections and header', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenu(
                title: 'Revenue Department',
                subtitle: 'Government of India',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Revenue Department'), findsOneWidget);
      expect(find.text('Government of India'), findsOneWidget);
      expect(find.text('SERVICES'), findsOneWidget);
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Applications'), findsOneWidget);
      expect(find.text('In progress'), findsOneWidget);
      expect(find.text('Approved'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('ACCOUNT'), findsOneWidget);
      expect(find.text('My account'), findsOneWidget);
      expect(find.text('Help & support'), findsOneWidget);
      expect(find.text('Sign out'), findsOneWidget);
    });

    testWidgets('handles accordion expand and collapse', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenu(
                title: 'Revenue Department',
                sections: [
                  const Ux4gSideMenuSection(
                    title: 'SERVICES',
                    items: [
                      Ux4gSideMenuItem(
                        key: 'services',
                        label: 'Services',
                        defaultExpanded: false,
                        children: [
                          Ux4gSideMenuItem(
                            key: 'sub-service-1',
                            label: 'Sub Service 1',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Initially collapsed
      expect(find.text('Sub Service 1'), findsNothing);

      // Tap to expand
      await tester.tap(find.text('Services'));
      await tester.pumpAndSettle();

      expect(find.text('Sub Service 1'), findsOneWidget);

      // Tap to collapse
      await tester.tap(find.text('Services'));
      await tester.pumpAndSettle();

      expect(find.text('Sub Service 1'), findsNothing);
    });

    testWidgets('filters items when search query is entered', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenu(
                title: 'Revenue Department',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);

      // Enter search query
      await tester.enterText(find.byType(TextField), 'Notif');
      await tester.pumpAndSettle();

      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Dashboard'), findsNothing);
    });

    testWidgets('renders officer inbox preset', (tester) async {
      bool customized = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenuPresets.officerInbox(
                name: 'Ramesh Kumar',
                email: 'ramesh.kumar@gov.in',
                onCustomizeInbox: () {
                  customized = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Ramesh Kumar'), findsOneWidget);
      expect(find.text('ramesh.kumar@gov.in'), findsOneWidget);
      expect(find.text('Inbox'), findsOneWidget);
      expect(find.text('9'), findsOneWidget); // Badge
      expect(find.text('Assigned to me'), findsOneWidget);
      expect(find.text('Customize inbox'), findsOneWidget);
      expect(find.text('Inbox settings'), findsOneWidget);
      expect(find.text('Kanpur division'), findsOneWidget);

      await tester.tap(find.text('Customize inbox'));
      expect(customized, isTrue);
    });

    testWidgets('renders citizen profile preset with action button', (tester) async {
      bool profileViewed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenuPresets.citizenProfile(
                name: 'Ramesh Kumar',
                role: 'Citizen',
                metaText: '12 applications · 3 actions required',
                onViewProfile: () {
                  profileViewed = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Ramesh Kumar'), findsOneWidget);
      expect(find.text('Citizen'), findsOneWidget);
      expect(find.text('12 applications · 3 actions required'), findsOneWidget);
      expect(find.text('View profile'), findsOneWidget);
      expect(find.text('Profile & settings'), findsOneWidget);
      expect(find.text('Saved items'), findsOneWidget);
      expect(find.text('My applications'), findsOneWidget);

      await tester.tap(find.text('View profile'));
      expect(profileViewed, isTrue);
    });

    testWidgets('renders action required preset with CTA button', (tester) async {
      bool verified = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenuPresets.actionRequired(
                onVerifyAadhaar: () {
                  verified = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('ACTION REQUIRED'), findsOneWidget);
      expect(find.text('Verify your Aadhaar'), findsOneWidget);
      expect(find.text('Verify now'), findsOneWidget);

      await tester.ensureVisible(find.text('Verify now'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Verify now'));
      expect(verified, isTrue);
    });

    testWidgets('renders department switcher preset with cards and tags', (tester) async {
      String? selected;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenuPresets.departmentSwitcher(
                onSelectDepartment: (item) {
                  selected = item.key;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Departments'), findsOneWidget);
      expect(find.text('Revenue Department'), findsOneWidget);
      expect(find.text('Transport Department'), findsOneWidget);
      expect(find.text('3 applications pending'), findsOneWidget);
      expect(find.text('Request department access'), findsOneWidget);

      await tester.tap(find.text('Transport Department'));
      expect(selected, equals('dept-transport'));
    });

    testWidgets('renders citizen simple preset with bottom branding', (tester) async {
      bool signedOut = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Ux4gTheme(
              child: Ux4gSideMenuPresets.citizenSimple(
                name: 'Ramesh Kumar',
                role: 'Citizen',
                onSignOut: () {
                  signedOut = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Ramesh Kumar'), findsOneWidget);
      expect(find.text('Citizen'), findsOneWidget);
      expect(find.text('My applications'), findsOneWidget);
      expect(find.text('My documents'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Profile & settings'), findsOneWidget);
      expect(find.text('Help & support'), findsOneWidget);
      expect(find.text('Sign out'), findsOneWidget);
      expect(find.text('Revenue Department'), findsOneWidget);
      expect(find.text('Government of India'), findsOneWidget);

      await tester.tap(find.text('Sign out'));
      expect(signedOut, isTrue);
    });
  });
}

