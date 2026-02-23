import 'package:flutter/material.dart';

class DiagonalCutPainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final double borderWidth;

  DiagonalCutPainter({
    required this.color,
    this.borderColor = Colors.black,
    this.borderWidth = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path()
      ..moveTo(20, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 20, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DiagonalStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 1)
      ..style = PaintingStyle.fill;

    const stripeWidth = 100.0;
    for (
      double i = -size.height;
      i < size.width + size.height;
      i += stripeWidth * 2
    ) {
      final path = Path()
        ..moveTo(i, 0)
        ..lineTo(i + stripeWidth, 0)
        ..lineTo(i + stripeWidth + size.height, size.height)
        ..lineTo(i + size.height, size.height)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
