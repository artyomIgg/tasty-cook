import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/constants/constants.dart' as constants;
import 'package:tasty_cook/screens/search_screen/search_screen_body.dart';
import 'package:tasty_cook/screens/search_screen/widgets/search_widget.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: SearchWidget(),
          backgroundColor: constants.Colors.primaryYellow,
          shadowColor: Colors.transparent,
        ),
        body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            if (state is RecipeSearchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RecipeSearchLoaded) {
              return SearchScreenBody(
                recipes: state.recipes,
              );
            }

            return Center(
              child: Container(
                  color: constants.Colors.primaryGrey,
                  alignment: Alignment.center,
                  child: Text('Something went wrong!')),
            );
          },
        ),
      ),
    );
  }
}
