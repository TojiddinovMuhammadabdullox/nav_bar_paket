import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_navigation_bar/modern_navigation_bar.dart';

void main() {
  group('ModernBottomNavBar', () {
    testWidgets('renders all items', (WidgetTester tester) async {
      final items = [
        BottomNavItem(icon: Icons.home, label: 'Home', color: Colors.blue),
        BottomNavItem(icon: Icons.search, label: 'Search', color: Colors.green),
        BottomNavItem(icon: Icons.person, label: 'Profile', color: Colors.red),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: ModernBottomNavBar(
              items: items,
              onItemSelected: (index) {},
            ),
          ),
        ),
      );

      for (var item in items) {
        expect(find.byIcon(item.icon), findsOneWidget);
      }
    });

    testWidgets('calls onItemSelected when an item is tapped',
        (WidgetTester tester) async {
      final items = [
        BottomNavItem(icon: Icons.home, label: 'Home', color: Colors.blue),
        BottomNavItem(icon: Icons.search, label: 'Search', color: Colors.green),
        BottomNavItem(icon: Icons.person, label: 'Profile', color: Colors.red),
      ];

      var selectedIndex = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: ModernBottomNavBar(
              items: items,
              onItemSelected: (index) {
                selectedIndex = index;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      expect(selectedIndex, 1);
    });

    testWidgets('updates selected index and animates transition',
        (WidgetTester tester) async {
      final items = [
        BottomNavItem(icon: Icons.home, label: 'Home', color: Colors.blue),
        BottomNavItem(icon: Icons.search, label: 'Search', color: Colors.green),
        BottomNavItem(icon: Icons.person, label: 'Profile', color: Colors.red),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: ModernBottomNavBar(
              items: items,
              onItemSelected: (index) {},
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Home'), findsNothing);

      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Search'), findsNothing);
    });
  });
}
