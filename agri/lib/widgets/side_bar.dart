import 'package:agri/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Sidebar(),
    ),
  ));
}

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  double _arcPosition = 220.0;

  void _moveArc(double position) {
    setState(() {
      _arcPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          color: green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 250),
              SidebarItem(text: 'Disease', onTap: () => _moveArc(220.0)),
              SizedBox(height: 100),
              SidebarItem(text: 'Chat bot', onTap: () => _moveArc(350.0)),
              SizedBox(height: 100),
              SidebarItem(text: 'Plantable', onTap: () => _moveArc(220.0)),
              Spacer(),
              CupertinoChatButton(onPressed: () => _moveArc(350.0)),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          top: _arcPosition,
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

class SidebarItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SidebarItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RotatedText(text),
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

class CupertinoChatButton extends StatefulWidget {
  final VoidCallback onPressed;

  const CupertinoChatButton({required this.onPressed});

  @override
  _CupertinoChatButtonState createState() => _CupertinoChatButtonState();
}

class _CupertinoChatButtonState extends State<CupertinoChatButton> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTooltip(context);
    });
  }

  void _showTooltip(BuildContext context) {
    final overlay = Overlay.of(context).context.findRenderObject();
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy - 40,
        left: offset.dx + 40,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Text(
              'Hello, I am your AI assistant',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(entry);

    Future.delayed(Duration(seconds: 3), () {
      entry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: widget.onPressed,
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
            Icon(CupertinoIcons.chat_bubble_2_fill, color: green),
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
