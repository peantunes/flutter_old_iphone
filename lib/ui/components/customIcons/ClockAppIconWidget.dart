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
         child: Stack(
           fit: StackFit.expand,
           children: [
              CustomPaint(
               painter: ClockNumbersPainter(),
              ),
              CustomPaint(
                painter: ClockDialPainter(hours: DateTime.now().hour, minutes: DateTime.now().minute),
              )
           ],
         ),
       )
    );
  }
}

class ClockNumbersPainter extends CustomPainter {
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

class ClockDialPainter extends CustomPainter {
  final paintHour = Paint();
  
  int hours = 3;
  int minutes = 10;

  ClockDialPainter({this.hours=17, this.minutes=42}) {
    paintHour.color = Colors.black87;
    paintHour.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // final angle = 2 * pi / 12;
    final radius = size.width/2;

    canvas.save();
    canvas.translate(radius, radius);
    
    int hours12 = this.hours >= 12 ? this.hours-12 : this.hours;
    int minutes60 = this.minutes == 0 ? 60 : this.minutes;
    double hourRotate = 2*pi*((hours12/12)+(this.minutes/720));
    canvas.rotate(hourRotate);

    Path path = Path();

    //shape hand stem
    path.moveTo(0.0, -radius+(radius/3));
    path.lineTo(-2.0, 1.0);
    path.lineTo(3.0, 0.0);
    path.lineTo(1.0, -radius+(radius/3));
    path.close();
    canvas.drawPath(path, paintHour);

    canvas.rotate(-hourRotate); 
    canvas.rotate(2*pi*((minutes60)/60)); 
    path.moveTo(-1.0, -radius+(radius/5));
    path.lineTo(-2.0, 0.0);
    path.lineTo(2.0, 0.0);
    path.lineTo(1.0, -radius+(radius/5));

    path.close();
    canvas.drawPath(path, paintHour);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}