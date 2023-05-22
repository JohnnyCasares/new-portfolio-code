import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Map<String, Icon> menuOptions;
  const BottomNavBar(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.menuOptions});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<BottomNavigationBarItem> _destinations = [];

  @override
  void initState() {
    super.initState();
    // Generate the list of NavigationDestination widgets
    _destinations = widget.menuOptions.entries
        .map((entry) => BottomNavigationBarItem(
              icon: entry.value,
              label: entry.key,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        onTap: widget.onDestinationSelected,
        items: _destinations);
  }
}

class SideNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final NavigationRailLabelType labelType;
  final Map<String, Icon> menuOptions;
  const SideNavBar(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.labelType,
      required this.menuOptions});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  List<NavigationRailDestination> _destinations = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _destinations = widget.menuOptions.entries
        .map((entry) => NavigationRailDestination(
              icon: entry.value,
              label: Text(entry.key),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: widget.onDestinationSelected,
        minWidth: 5,
        labelType: widget.labelType,
        destinations: _destinations);
  }
}
