import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/seach_cubit.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/search_state.dart';

import 'package:movies_app/feature/search/presentation/views/widgets/search_result_grid_view.dart';
import 'package:movies_app/feature/search/presentation/views/widgets/search_text_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create:
          (context) => sl<SearchCubit>(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SearchTextFormField(),
                    ),
                    SearchResultGridView(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
