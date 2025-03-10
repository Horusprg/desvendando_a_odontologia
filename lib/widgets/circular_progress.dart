import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'circular_progress_painter.dart';

class CircularProgressWidget extends StatelessWidget {
  final int current;
  final int total;
  final Color color;

  const CircularProgressWidget(
      {super.key,
      required this.current,
      required this.total,
      required this.color});

  @override
  Widget build(BuildContext context) {
    double progress = current / total;

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Circle (Grey)
          CustomPaint(
            size: Size(120, 120),
            painter: CircularProgressPainter(
              progress: progress,
              backgroundColor: Colors.grey.shade300,
              progressColor: color,
              strokeWidth: 8.0, // Adjust stroke thickness
            ),
          ),

          // Center Text (Formatted)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$current",
                style: GoogleFonts.nunito(
                  fontSize: 24, // Adjusted size
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Text(
                "/$total",
                style: GoogleFonts.nunito(
                  fontSize: 14, // Adjusted size
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
