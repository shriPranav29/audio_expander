
import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotaryKnob extends StatefulWidget {
  const RotaryKnob({super.key});

  @override
  State<RotaryKnob> createState() => _RotaryKnobState();
}

class _RotaryKnobState extends State<RotaryKnob> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'BASS CONTROL',
          style: TextStyle(
            color: Color(0xFFB8A9E8),
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              value = (value - details.delta.dy * 0.5)
                  .clamp(0.0, 100.0);
            });
          },
          onHorizontalDragUpdate: (details) {
            setState(() {
              value = (value + details.delta.dx * 0.5)
                  .clamp(0.0, 100.0);
            });
          },
          child: SizedBox(
            width: 220,
            height: 220,
            child: CustomPaint(
              painter: KnobPainter(value: value),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value.round().toString(),
                      style: const TextStyle(
                        color: Color(0xFFE8E0F5),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'LEVEL',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '0                 ${value.round()}'
          '                 100',
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

class KnobPainter extends CustomPainter {
  final double value;

  KnobPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.42;

    final outer = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF343B59), Color(0xFF101529)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
        Rect.fromCircle(center: center, radius: radius + 15),
      );

    canvas.drawCircle(center, radius + 15, outer);

    final face = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF303751), Color(0xFF171D32)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      );

    canvas.drawCircle(center, radius, face);

    final tickPaint = Paint()
      ..color = const Color(0xFF737D9E)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i <= 20; i++) {
      final angle = (-135 + i * 13.5) * math.pi / 180;
      final inner = radius + 23;
      final outerRadius = radius + (i % 5 == 0 ? 34 : 28);

      canvas.drawLine(
        Offset(
          center.dx + inner * math.cos(angle),
          center.dy + inner * math.sin(angle),
        ),
        Offset(
          center.dx + outerRadius * math.cos(angle),
          center.dy + outerRadius * math.sin(angle),
        ),
        tickPaint,
      );
    }

    // Rotate the indicator as the value changes.
    final angle = (-135 + value * 2.7) * math.pi / 180;

    final indicator = Paint()
      ..color = const Color(0xFFE8E0F5)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(
        center.dx + (radius - 20) * math.cos(angle),
        center.dy + (radius - 20) * math.sin(angle),
      ),
      Offset(
        center.dx + (radius - 42) * math.cos(angle),
        center.dy + (radius - 42) * math.sin(angle),
      ),
      indicator,
    );
  }

  @override
  bool shouldRepaint(covariant KnobPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
