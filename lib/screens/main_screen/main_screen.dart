import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tasty_cook/routing/app_router.dart';
import 'package:tasty_cook/screens/main_screen/main_screen_body.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/widgets/logo_widget.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TastyCook', style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        drawer: SizedBox(
          width: 60.w,
          child: Drawer(
            backgroundColor: constants.Colors.primaryGrey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: constants.Colors.primaryGrey,
                  ),
                  child: LogoWidget(),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: constants.Colors.white,
                  ),
                  title: Text('My profile', style: constants.Styles.listTileMainScreen,),
                  onTap: () {
                    context.router.push(const MyProfileRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: constants.Colors.white,
                  ),
                  title: Text('Settings', style: constants.Styles.listTileMainScreen,),
                  onTap: () {
                    context.router.push(const SettingsRoute());
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: constants.Colors.white,
                  ),
                  title: Text('Log out', style: constants.Styles.listTileMainScreen,),
                  onTap: () {
                    context.router.pop();
                    context.router.pop();
                  },
                ),
              ],
            ),
          ),
        ),
        body: const MainScreenBody(),
      ),
    );
  }
}
