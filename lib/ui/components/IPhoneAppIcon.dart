import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iphone_faces/main.dart';

class IPhoneAppIcon extends StatelessWidget {
  final TextStyle textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    shadows: [ 
      Shadow(
        offset: Offset(2, 2),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );
  final double iConSize = 80;

  final IPhoneIconInfo item;

  IPhoneAppIcon(this.item);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.item.action != null){
          this.item.action();
          return;
        }
          showDialog(
          context:context,
          builder: (BuildContext context) => new CupertinoAlertDialog(
                title: new Text(item.name),
                content: new Text("Not yet implemented"),
                actions: [
                  CupertinoDialogAction(
                      isDefaultAction: true, child: new Text("Close"), onPressed: () => Navigator.pop(context, 'Discard'),)
                ],
              ),
        );
      },
      child:  simpleIcon(),
    );
  }

  Widget simpleIcon() {
    return Container(
        child:Column(
          children:[
            Container(
              width: iConSize,
              height: iConSize,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadiusDirectional.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black38,
                    offset: Offset(3, 3),
                    spreadRadius: 4,
                  ),
                ],
              ),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: item.widget != null ? item.widget : Image.asset(this.item.image,
                  // scale: 0.5,
                  width: iConSize,
                  height: iConSize,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(this.item.name, 
            style: textStyle,
            )
          ]
        ),
      );
  }
}