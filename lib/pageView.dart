import 'package:page_indicator/page_indicator.dart';
import './welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageViewState();
  }
}

class MyPageViewState extends State<MyPageView> {
  PageController controller = PageController();

  void setPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
  }

  Widget _getButton(int index) {
    if (index == 2) {
      return RaisedButton(
        textColor: Colors.white,
        color: Colors.black.withOpacity(0.1),
        child: Text('Get Started'),
        onPressed: () {
          setPreference();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => WelcomePage()));
        },
      );
    } else
      return Container();
  }

  Widget _getPage(BuildContext context, int index) {
    return Container(
      color: index % 2 == 0 ? Colors.pink : Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Page ${index + 1}',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          _getButton(index),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View'),
      ),
      body: PageIndicatorContainer(
        pageView: PageView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return _getPage(context, index);
          },
        ),
        length: 3,
        align: IndicatorAlign.bottom,
        indicatorColor: Colors.black.withOpacity(0.2),
        indicatorSelectorColor: Colors.white.withOpacity(0.5),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}