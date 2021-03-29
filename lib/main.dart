
import 'package:flutter/material.dart';
import 'butc_liste.dart';
import 'utils/strings.dart';

void main(){

  runApp(BurcRehberiApp());

}

class BurcRehberiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:Strings.APP_NAME,
      theme:ThemeData(),
      debugShowCheckedModeBanner:false,

      home:MyHomePage(
      ),
    );
  }
}



class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MainPage();
  }




}

