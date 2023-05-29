import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/create_recipe_logic_cubit/create_recipe_logic_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/add_recipe_create/add_recipe_create_screen_body.dart';

@RoutePage()
class AddRecipeCreateScreen extends StatelessWidget {
  const AddRecipeCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateRecipeLogicCubit>(
          create: (context) => CreateRecipeLogicCubit(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Create new recipe',
              style: constants.Styles.mainScreenTitle),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        body: AddRecipeCreateBody(),
      ),
    );
  }
}
