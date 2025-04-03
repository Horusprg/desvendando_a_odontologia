import 'package:desvendando_a_odontologia/core/theme.dart';
import 'package:desvendando_a_odontologia/core/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmamentacaoLessonScreen extends StatefulWidget {
  const AmamentacaoLessonScreen({super.key});

  @override
  State<AmamentacaoLessonScreen> createState() => _AmamentacaoLessonScreen();
}

class _AmamentacaoLessonScreen extends State<AmamentacaoLessonScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'O aleitamento materno é o principal responsável pela'
                    ' nutrição e desenvolvimento saudável do bebê nos primeiros seis meses de vida, '
                    'sendo recomendado pela Organização Mundial da Saúde - OMS e Ministério da Saúde - '
                    'MS de forma exclusiva até os 6 meses e de forma complementar até os 2 anos',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.ebGaramond(
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text(
                  'A amamentação exclusiva é fundamental para o crescimento e desenvolvimento da criança, bem como para proteção contra diversas doenças, além de não representar custos para o orçamento familiar.',
                  style: GoogleFonts.ebGaramond(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'A introdução de outros alimentos, além do leite materno, nos primeiros quatro meses de vida do bebê, pode interferir negativamente na absorção dos nutrientes e levando a diminuição da ingestão do leite materno, perda de peso e ao aumento do risco de diarreias, infecções e alergias.',
                  style: GoogleFonts.ebGaramond(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          )),
        ],
      ),
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            Text(
              'Amamentação',
              style: AppTypography.typodermic(size: 30),
            ),
            const Spacer(),
            Text(
              '${_currentPage + 1}/2',
              style: TextStyle(
                  color: AppColors.lightRose,
                  fontSize: 24,
                  fontFamily: 'Typodermic'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => _controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
        ],
      ),
    );
  }
}
