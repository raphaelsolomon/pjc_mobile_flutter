import 'package:flutter/material.dart';

class RectBlurPainter extends CustomPainter {
  double rectWidth;
  double blurSigma;
  RectBlurPainter({@required this.rectWidth, this.blurSigma});

  @override
  void paint(Canvas canvas, Size size) {
    // This is the flutter_screenutil library
    //ScreenUtil.init(width: 750.0, height: 1334.0, allowFontScaling: true);

    Paint paint = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = rectWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = new Offset(0, 6);

    canvas.drawRect(center & Size(50, 5), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
