import 'package:flutter/material.dart';

const kBorderRadius = BorderRadius.vertical(top: Radius.circular(16));
const kBlurRadius = 25.0;
const kDefaultNavBarHeight = 48.0;
const kShadowColor = Color.fromRGBO(156, 200, 252, 0.56);

class BottomMenuEnum {
  BottomMenuEnum._();

  static const int home = 0;
  static const int profile = 1;
}

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      items: [
        _buildBottomNavBarItem(
          iconSelected: Icons.home_filled,
          iconDefault: Icons.home_outlined,
          tab: BottomMenuEnum.home,
        ),
        _buildBottomNavBarItem(
          iconSelected: Icons.person,
          iconDefault: Icons.person_outline,
          tab: BottomMenuEnum.profile,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem({
    required IconData iconSelected,
    required IconData iconDefault,
    required int tab,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.transparent,
      icon: _buildIcon(
        false,
        iconDefault,
      ),
      activeIcon: _buildIcon(
        true,
        iconSelected,
      ),
      label: "",
    );
  }

  Widget _buildIcon(bool isSelected, IconData iconData) {
    return Icon(
      iconData,
      color: Colors.white,
      size: 24,
    );
  }
}
