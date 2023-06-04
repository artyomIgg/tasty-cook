import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/app_state_cubit/app_state_cubit.dart';
import 'package:tasty_cook/screens/my_profile_screen/my_profile_screen_body.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;

@RoutePage()
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Profile', style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
          actions: [
            CupertinoButton(
              onPressed: () => onLogout(context),
              child: const Icon(
                Icons.logout,
                color: constants.Colors.white,
              ),
            )
          ],
        ),
        body: const MyProfileScreenBody(),
      ),
    );
  }

  Future<void> onLogout(BuildContext context) async {
    final AppStateCubit cubit = BlocProvider.of<AppStateCubit>(context);

    await cubit.logOut();
  }
}
