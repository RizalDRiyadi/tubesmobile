import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'main.dart';




class Themeset{
  static bool darkMode = false;
}
class ReloadApp extends StatefulWidget {
  final Function(BuildContext context) builder;
  ReloadApp({required this.builder});

  @override
  ReloadAppState createState() => ReloadAppState();
  static ReloadAppState? of(BuildContext context){
    return context.findAncestorStateOfType();
  }
}

class ReloadAppState extends State<ReloadApp> {
  @override
  Widget build(BuildContext context) {
   return widget.builder(context);
  }
  void rebuild(){
    setState(() {

    });
  }
}
