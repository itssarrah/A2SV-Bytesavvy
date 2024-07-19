import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../colors.dart';  

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          color: red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 250),
              RotatedText('Disease '),
              SizedBox(height: 100),
              RotatedText('Chat bot'),
              SizedBox(height: 100),
              RotatedText('Plantable '),
              Spacer(), 
              CupertinoChatButton(), 
              SizedBox(height: 20), 
            ],
          ),
        ),
        Positioned(
          top: 220,
          right: 0, 
          child: CustomPaint(
            size: Size(50, 80),
            painter: RightArcPainter(),
          ),
        ),
      ],
    );
  }
}

class RotatedText extends StatelessWidget {
  final String text;

  const RotatedText(this.text);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.5708,
      child: Text(
        text,
        style: TextStyle(color: Color.fromARGB(196, 255, 255, 255)),
      ),
    );
  }
}

class CupertinoChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(CupertinoIcons.chat_bubble_2_fill, color: red),
          ],
        ),
      ),
    );
  }
}

class RightArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(246, 255, 255, 255)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, size.height / 2, size.width, 0);
    path.close();

    canvas.drawPath(path, paint);

  
    final circlePaint = Paint()
      ..color = Colors.black 
      ..style = PaintingStyle.fill;

    final circleRadius = 3.0; 
    canvas.drawCircle(
      Offset(size.width - circleRadius, size.height / 2), 
      circleRadius,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
