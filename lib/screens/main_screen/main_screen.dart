import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tasty_cook/screens/add_recipe/add_recipe_screen.dart';
import 'package:tasty_cook/screens/main_screen/main_screen_body.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/my_profile_screen/my_profile_screen.dart';
import 'package:tasty_cook/screens/search_screen/search_screen.dart';
import 'package:tasty_cook/screens/settings_screen/settings_screen.dart';
import 'package:tasty_cook/widgets/text_fields/my_search_widget.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final PersistentTabController _controller = PersistentTabController();

  List<Widget> _buildScreens(BuildContext context) {
    return [
      _mainScreen(context),
      const SearchScreen(),
      const AddRecipeScreen(),
      const MyProfileScreen(),
      const SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.home,
          color: constants.Colors.white,
        ),
        title: ("Home"),
        activeColorPrimary: constants.Colors.primaryYellow,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.search,
          color: constants.Colors.white,
        ),
        title: ("Search"),
        activeColorPrimary: constants.Colors.primaryYellow,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.add_circled,
          color: constants.Colors.white,
        ),
        title: ("Add Recipe"),
        activeColorPrimary: constants.Colors.primaryYellow,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.person,
          color: constants.Colors.white,
        ),
        title: ("My Profile"),
        activeColorPrimary: constants.Colors.primaryYellow,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          CupertinoIcons.settings,
          color: constants.Colors.white,
        ),
        title: ("Settings"),
        activeColorPrimary: constants.Colors.primaryYellow,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(context),
        items: _navBarsItems(),
        backgroundColor: constants.Colors.primaryBlack,
        navBarStyle: NavBarStyle.style12,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
      ),
    );
  }

  Widget _mainScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 32,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              _controller.jumpToTab(1);
            },
            child: const IgnorePointer(child: MySearchWidget()),
          ),
        ),
        backgroundColor: constants.Colors.primaryYellow,
        shadowColor: Colors.transparent,
      ),
      body: const MainScreenBody(),
    );
  }
}
