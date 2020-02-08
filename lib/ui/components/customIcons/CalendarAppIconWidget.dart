import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarAppIconWidget extends StatefulWidget {
  CalendarAppIconWidget({Key key}) : super(key: key);

  @override
  _CalendarAppIconWidgetState createState() => _CalendarAppIconWidgetState();
}

class _CalendarAppIconWidgetState extends State<CalendarAppIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(10),
           ),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,  
        mainAxisSize: MainAxisSize.max,       
         children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  child:Text(DateFormat("EEEE").format(DateTime.now()), 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      shadows: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2, 2),
                          blurRadius: 3
                        ),
                      ]
                      ),  
                    textAlign: TextAlign.center),
                  color: Colors.red,
              
            ),
            Expanded(
              child:Text("${DateTime.now().day}", style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
            ),
         ],
       ),
    );
  }
}