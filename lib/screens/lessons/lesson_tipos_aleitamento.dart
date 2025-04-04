import 'package:desvendando_a_odontologia/widgets/info_card.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class TiposAleitamentoLessonScreen extends StatefulWidget {
  const TiposAleitamentoLessonScreen({super.key});

  @override
  State<TiposAleitamentoLessonScreen> createState() =>
      _TiposAleitamentoLessonScreen();
}

class _TiposAleitamentoLessonScreen
    extends State<TiposAleitamentoLessonScreen> {
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
          SingleChildScrollView(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  InfoCardWidget(
                    title: "Aleitamento Materno ",
                    content:
                        "O nome que se dá quando a criança recebe o leite materno, seja através da mama ou pela ordenha, independentemente de utilizar outras formas de alimentos sólidos ou líquidos.",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "Aleitamento Materno Exclusivo",
                    content:
                        "É aquele tipo que o bebê se alimenta exclusivamente do leite humano, podendo ser tanto por meio da mama ou ordenhado.",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/aleitamento.webp',
                    width: 200,
                    height: 250,
                  )
                ],
              ),
            )),
          ),
          SingleChildScrollView(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  InfoCardWidget(
                    title: "Aleitamento Materno Predominante",
                    content:
                        "É aquele tipo que o bebê recebe outros liquídos como água ou bebidas a base de água, além do leite materno.",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "Aleitamento Materno Complementado",
                    content:
                        "É o tipo em que a criança recebe, além do aleitamento materno, "
                        "qualquer alimento solido ou semissólido, de forma complementar"
                        " e não como substituto do leite humano. ",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "Aleitamento Materno Misto ou Parcial",
                    content:
                        "É quando a criança recebe leite de origem humana, além de outros tipos de leite.",
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            Text(
              'Tipos de Aleitamento',
              style: AppTypography.typodermic(size: 24),
            ),
            const Spacer(),
            Text(
              '${_currentPage + 1}/2',
              style: TextStyle(
                  color: AppColors.rose,
                  fontSize: 24,
                  fontFamily: 'Typodermic'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
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
      ),
    );
  }
}
