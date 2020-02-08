import 'package:flutter/material.dart';
import 'dart:math';

class ClockAppIconWidget extends StatefulWidget {
  ClockAppIconWidget({Key key}) : super(key: key);

  @override
  _ClockAppIconWidgetState createState() => _ClockAppIconWidgetState();
}

class _ClockAppIconWidgetState extends State<ClockAppIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(color: Colors.white.withAlpha(40),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10),

          // border: RoundedRectangleBorder()
          ),
       child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
         decoration: BoxDecoration(
           color: Colors.white,
           shape: BoxShape.circle,
         ),
         child: CustomPaint(painter: ClockDialPainter(),),
       )
    );
  }
}

class ClockDialPainter extends CustomPainter {
  final tickPaint = Paint();
  final TextPainter textPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
  final TextStyle textStyle = const TextStyle(
          color: Colors.black,
          fontFamily: 'Times New Roman',
          fontWeight: FontWeight.bold,
          fontSize: 10.0,
        );

  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength = 8.0;
    final angle = 2 * pi / 12;
    final radius = size.width/2;
    print(radius);
    canvas.save();
    canvas.translate(radius, radius);

    final changeValue = 360/60;
    final values = const [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    for (var i=0; i<12; i++) {
      // canvas.drawLine(Offset(0.0, -radius), Offset(0.0, -radius+tickMarkLength), tickPaint);
      
      canvas.save();
      
      canvas.translate(0.0, -radius+5.0);
      textPainter.text = TextSpan(
        text: "${values[i]}",
        style: textStyle,
      );
      canvas.rotate(-angle*i);

      textPainter.layout();

      textPainter.paint(canvas, Offset(-(textPainter.width/2), - (textPainter.height/2)));

      canvas.restore();
      
      canvas.rotate(angle);

    }

    canvas.restore();
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}