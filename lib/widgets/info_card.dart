import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCardWidget extends StatelessWidget {
  final String title;
  final String content;

  const InfoCardWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: GoogleFonts.podkova(
            fontSize: 30,
            color: AppColors.rose,
            fontWeight: FontWeight.w600,
            height: 1.1

          ),
        ),
        Text(content,
        textAlign: TextAlign.justify,
        style: GoogleFonts.ebGaramond(
          fontSize: 20
        ),
        )
      ],
    );
  }
  
}
