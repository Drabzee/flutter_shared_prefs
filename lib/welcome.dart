import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatelessWidget {

  Future<bool> getPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Text('Welcome to my app.')
      ),
    );
  }
}