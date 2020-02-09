import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iphone_faces/ui/components/IPhoneAppIcon.dart';
import 'package:iphone_faces/ui/components/customIcons/CalendarAppIconWidget.dart';
import 'package:iphone_faces/ui/components/customIcons/ClockAppIconWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
       scaffoldBackgroundColor: Colors.black,       
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class IPhoneIconInfo {
  String name;
  String image;
  Function action;
  Widget widget;
  IPhoneIconInfo({this.name, this.image, this.widget, this.action});
}

class _MyHomePageState extends State<MyHomePage> {


  final List<IPhoneIconInfo> content = [
    IPhoneIconInfo(name:'Calendar', widget:CalendarAppIconWidget(), action:  (){launch('calendar://a', forceSafariVC: false);}),
    IPhoneIconInfo(name:'Clock', widget:ClockAppIconWidget()),
    IPhoneIconInfo(name:'SMS', image:'resources/images/iPhoneIcons/sms-iPhone1-icon.png', action: (){launch('sms:');}),
    IPhoneIconInfo(name:'Photos', image:"resources/images/iPhoneIcons/photos-iPhone1-icon.png", action: (){launch('photo:');}),
    IPhoneIconInfo(name:'Camera', image:'resources/images/iPhoneIcons/camera-iPhone1-icon.png'),
    IPhoneIconInfo(name:'Youtube', image:"resources/images/iPhoneIcons/youtube-iPhone1-icon.png", action: (){launch('youtube://com');}),
    IPhoneIconInfo(name:'Stocks', image:'resources/images/iPhoneIcons/stocks-iPhone1-icon.png'),
    IPhoneIconInfo(name:'Maps', image:'resources/images/iPhoneIcons/maps-iPhone1-icon.png', action: (){launch('maps://com');}),
    IPhoneIconInfo(name:'Calculator', image:'resources/images/iPhoneIcons/calculator-iPhone1-icon.png'),
    IPhoneIconInfo(name:'Notes', image:'resources/images/iPhoneIcons/notes-iPhone1-icon.png'),
    IPhoneIconInfo(name:'Settings', image:'resources/images/iPhoneIcons/settings-iPhone1-icon.png'),
    ];

  final List<IPhoneIconInfo> bottomIcons = [
    IPhoneIconInfo(name:'Phone', image:'resources/images/iPhoneIcons/phone-iPhone1-icon.png', action: (){launch('tel:');}),
    IPhoneIconInfo(name:'Mail', image:"resources/images/iPhoneIcons/mail-iPhone1-icon.png", action: (){launch('mailto:');}),
    IPhoneIconInfo(name:'Safari', image:'resources/images/iPhoneIcons/safari-iPhone1-icon.png'),
    IPhoneIconInfo(name:'iPod', image:"resources/images/iPhoneIcons/iPod-iPhone1-icon.png"),
    ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: Container(
        height:150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.withAlpha(125), Colors.white.withAlpha(125)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 8,
            ),
          itemBuilder: (context, i) => IPhoneAppIcon(bottomIcons[i]),
          itemCount: bottomIcons.length,
          ),
        ),
      body: SafeArea(
        child:GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 8,
            ),
          itemBuilder: (context, i) => IPhoneAppIcon(content[i]),
          itemCount: content.length,
        ),
      ),
    );
  }
}
