import 'package:flutter/material.dart';

class RhombusPainter extends CustomPainter {
  final Color color;

  RhombusPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RhombusWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  RhombusWidget(
      {required this.width, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RhombusPainter(color: color),
      size: Size(width, height),
    );
  }
}
