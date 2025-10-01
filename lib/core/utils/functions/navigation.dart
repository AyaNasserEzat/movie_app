import 'package:flutter/material.dart';

navigateTo({required BuildContext context,required Widget screen }){
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return screen;
  }));
}