import 'package:flutter/material.dart';
import 'package:movies_app/feature/search/presentation/views/widgets/search_result_grid_view.dart';
import 'package:movies_app/feature/search/presentation/views/widgets/search_text_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                SearchTextFormField(),
                SearchResultGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
