import 'package:flutter/material.dart';
import './pageView.dart';
import './welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstTime = prefs.getBool('firstTime') == null ? true : false;
  return firstTime;
}

Future<Widget> getPage() async {
  bool res = await isFirstTime();
  print(res);
  if(res == true) {
    return MyPageView();
  }
  else {
    return WelcomePage();
  }
}

void main() async {
  runApp(
    MaterialApp(
      home: await getPage()
    )
  );
}