import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/search/domain/use_cases/search_use_case.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/seach_cubit.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        onChanged: (value) {
          BlocProvider.of<SearchCubit>(
            context,
          ).searchByName(searchParams: SearchParams(value));
        },
        decoration: InputDecoration(
          hintText: 'search',
          prefixIcon: Icon(Icons.search, size: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
