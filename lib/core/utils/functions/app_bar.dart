import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/functions/navigation.dart';
import 'package:movies_app/feature/search/presentation/views/search_view.dart';

customAppBar({required String title, required BuildContext context}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.black54,
    title: Text(title),
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios),
    ),
    actions: [
      IconButton(
        onPressed: () {
          navigateTo(context: context, screen: SearchView());
        },
        icon: Icon(Icons.search),
      ),
    ],
  );
}
