import 'package:flutter/material.dart';
import 'dart:math' as math;
class RipplesAnimation11 extends StatefulWidget {
  const RipplesAnimation11(Key key) : super(key: key);

  @override
  _RipplesAnimation11State createState() => _RipplesAnimation11State();
}

class _RipplesAnimation11State extends State<RipplesAnimation11> with TickerProviderStateMixin {
  late AnimationController _controller;
  final double size = 95.0;
  final Color color = Colors.yellow.withOpacity(0.50);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 700), vsync: this,
    )..repeat();  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[color,color,
                //  Color.lerp(color, Colors.black, .05),

              ],
            ),
          ),
          child: ScaleTransition(
            filterQuality: FilterQuality.low,
              scale: Tween(begin: 0.99, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const PulsateCurve(),
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/S 20140830_230352.jpg",
                  height: 30,
                  width: 30,
                ),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: CirclePainter(
            _controller,
            color: color,
          ),
          child: SizedBox(
            width: size * 5.125,
            height: size * 5.125,
            child: _button(),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(
      this._animation, {
        required this.color,
      }) : super(repaint: _animation);
  final Color color;
  final Animation<double> _animation;
  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 6.0)).clamp(0.0, 1.0);
    final Color _color = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value /4);
    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 1.0, size.width, size.height);
    for (int wave =5; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}

class PulsateCurve extends Curve {
  const PulsateCurve();
  @override
  double transform(double t) {
    if (t == 0 || t == 10) {
      return 0.10;
    }
    return math.sin(t * math.pi);
  }
}