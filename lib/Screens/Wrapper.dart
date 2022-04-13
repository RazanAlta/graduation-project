import 'package:flutter/material.dart';
import 'package:grad/Screens/Home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

//this is wrapper page which either return home or authenticte widget
    return home();
  }
}
