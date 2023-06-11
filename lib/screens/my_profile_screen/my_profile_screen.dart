import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/user_cubit/user_cubit.dart';
import 'package:tasty_cook/l10n/locale_keys.g.dart';
import 'package:tasty_cook/models/user_model.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/my_profile_screen/widgets/favourite_recipe.dart';
import 'package:tasty_cook/screens/my_profile_screen/widgets/menu_item.dart';
import 'package:tasty_cook/screens/my_profile_screen/widgets/my_recipe.dart';

@RoutePage()
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final UserCubit userCubit = BlocProvider.of<UserCubit>(context);
        final UserModel? user = userCubit.user;
        return SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                    user != null
                        ? LocaleKeys.hello_user
                            .tr(namedArgs: {'userName': user.username})
                        : 'Hello',
                    style: constants.Styles.mainScreenTitle),
                backgroundColor: constants.Colors.primaryYellow,
                shadowColor: Colors.transparent,
                actions: [
                  // CupertinoButton(
                  //   onPressed: () => onLogout(context),
                  //   child: const Icon(
                  //     Icons.settings,
                  //     color: constants.Colors.white,
                  //   ),
                  // )
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: const Icon(
                        Icons.list,
                        size: 46,
                        color: Colors.white,
                      ),
                      items: [
                        ...MenuItems.firstItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: MenuItems.buildItem(item),
                          ),
                        ),
                        const DropdownMenuItem<Divider>(
                            enabled: false, child: Divider()),
                        ...MenuItems.secondItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: MenuItems.buildItem(item),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        MenuItems.onChanged(context, value as MenuItem);
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 200,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: constants.Colors.secondaryBlack,
                        ),
                        elevation: 8,
                        offset: const Offset(0, 8),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        customHeights: [
                          ...List<double>.filled(
                              MenuItems.firstItems.length, 48),
                          8,
                          ...List<double>.filled(
                              MenuItems.secondItems.length, 48),
                        ],
                        padding: const EdgeInsets.only(left: 16, right: 16),
                      ),
                    ),
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: const Icon(Icons.favorite),
                      text: LocaleKeys.favorites.tr(),
                    ),
                    Tab(
                      icon: const Icon(Icons.list_alt),
                      text: LocaleKeys.my.tr(),
                    ),
                  ],
                ),
              ),
              body: Container(
                color: constants.Colors.primaryGrey,
                alignment: Alignment.center,
                child: const TabBarView(
                  children: [
                    FavouriteRecipes(),
                    MyRecipes(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
