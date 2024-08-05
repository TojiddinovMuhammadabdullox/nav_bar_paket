# modern_nav_bar

`modern_nav_bar` is a customizable and modern bottom navigation bar widget for Flutter applications. It allows you to create a bottom navigation bar with animated transitions and customizable icons and labels.

## Features

- Customizable icons and labels
- Smooth animations
- Easy to integrate
- Lightweight and efficient

## Getting started

To start using the `modern_nav_bar` package, add it to your `pubspec.yaml`:

```yaml
dependencies:
  modern_nav_bar: ^0.0.1
```
## Usage
```
import 'package:flutter/material.dart';
import 'package:modern_nav_bar/modern_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Modern Bottom Nav Bar Example')),
        body: Center(child: Text('Content goes here')),
        bottomNavigationBar: ModernBottomNavBar(
          items: [
            BottomNavItem(icon: Icons.home, label: 'Home', color: Colors.blue),
            BottomNavItem(icon: Icons.search, label: 'Search', color: Colors.green),
            BottomNavItem(icon: Icons.person, label: 'Profile', color: Colors.red),
          ],
          onItemSelected: (index) {
            // Handle item selection
          },
        ),
      ),
    );
  }
}
```
