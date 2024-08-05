library modern_navigation_bar;

import 'package:flutter/material.dart';

/// A Calculator.import 'package:flutter/material.dart';

class ModernBottomNavBar extends StatefulWidget {
  final List<BottomNavItem> items;
  final ValueChanged<int> onItemSelected;

  const ModernBottomNavBar({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  _ModernBottomNavBarState createState() => _ModernBottomNavBarState();
}

class _ModernBottomNavBarState extends State<ModernBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onItemSelected(index);
              _animationController.forward(from: 0);
            },
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? widget.items[index].color.withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        widget.items[index].icon,
                        color: _selectedIndex == index
                            ? widget.items[index].color
                            : Colors.grey,
                      ),
                      if (_selectedIndex == index)
                        SizeTransition(
                          sizeFactor: _animationController,
                          axis: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              widget.items[index].label,
                              style: TextStyle(
                                color: widget.items[index].color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;
  final Color color;

  BottomNavItem({
    required this.icon,
    required this.label,
    required this.color,
  });
}
