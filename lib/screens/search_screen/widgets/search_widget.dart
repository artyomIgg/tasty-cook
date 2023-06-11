import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_cook/bloc/recipe_cubit/recipe_cubit.dart';
import 'package:tasty_cook/widgets/text_fields/my_search_widget.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: MySearchWidget(
        controller: _searchController,
        autofocus: true,
        onChanged: (value) {
          _onSearch(value);
        },
      ),
    );
  }

  void _onSearch(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (text.length > 3) {
        final RecipeCubit cubit = BlocProvider.of<RecipeCubit>(context);

        cubit.searchRecipes(_searchController.text);
      }
    });
  }
}
