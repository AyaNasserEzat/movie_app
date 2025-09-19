import 'package:flutter/material.dart';

 customAppBar({required String title}){
  return AppBar(
    scrolledUnderElevation: 0,
 backgroundColor: Colors.black54,
    title: Text(title),
    elevation: 0,
    centerTitle: true,
    leading: Icon(Icons.arrow_back_ios),
    
  );
}