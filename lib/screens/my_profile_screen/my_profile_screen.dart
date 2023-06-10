import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasty_cook/routing/app_router.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/my_profile_screen/widgets/favourite_recipe.dart';
import 'package:tasty_cook/screens/my_profile_screen/widgets/my_recipe.dart';

@RoutePage()
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:
                Text('HelloUserName', style: constants.Styles.mainScreenTitle),
            backgroundColor: constants.Colors.primaryYellow,
            shadowColor: Colors.transparent,
            actions: [
              CupertinoButton(
                onPressed: () => onLogout(context),
                child: const Icon(
                  Icons.settings,
                  color: constants.Colors.white,
                ),
              )
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.favorite),
                  text: 'Favourite',
                ),
                Tab(
                  icon: Icon(Icons.list_alt),
                  text: 'My',
                ),
              ],
            ),
          ),
          body: Container(
            color: constants.Colors.primaryGrey,
            alignment: Alignment.center,
            child: TabBarView(
              children: [
                const FavouriteRecipes(),
                const MyRecipes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLogout(BuildContext context) {
    context.router.push(const SettingsRoute());
    // final AppStateCubit cubit = BlocProvider.of<AppStateCubit>(context);
    //
    // await cubit.logOut();
  }
}
