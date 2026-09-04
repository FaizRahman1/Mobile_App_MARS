import 'package:flutter/material.dart';

class ModuleBottomNavigation extends StatelessWidget {
  const ModuleBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.showModules = false,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool showModules;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search_rounded),
          label: 'Search',
        ),
        const NavigationDestination(
          icon: Icon(Icons.fact_check_outlined),
          selectedIcon: Icon(Icons.fact_check_rounded),
          label: 'Inspected',
        ),
        if (showModules)
          const NavigationDestination(
            icon: Icon(Icons.dashboard_customize_outlined),
            selectedIcon: Icon(Icons.dashboard_customize_rounded),
            label: 'Modules',
          ),
      ],
    );
  }
}
