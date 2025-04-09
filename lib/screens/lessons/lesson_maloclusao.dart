import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class MaloclusaoLessonScreen extends StatefulWidget {
  const MaloclusaoLessonScreen({super.key});

  @override
  State<MaloclusaoLessonScreen> createState() => _MaloclusaoLessonScreen();
}

class _MaloclusaoLessonScreen extends State<MaloclusaoLessonScreen> {
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
                    title: "Mordida aberta anterior",
                    content:
                        "Maloclusão adquirida pelo uso frequente de chupeta durante "
                        "o hábito de sucção, ocasionando uma abertura da mordida na região anterior dos dentes",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Observa-se alterações do perfil facial e estético da criança",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Além disso dificuldade na fala de determinados fonemas e apreensão dos alimentos",
                  ),
                  Image.asset(
                    'assets/mordida_aberta.webp',
                    width: 300,
                    height: 300,
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
                    title: "Mordida cruzada posterior",
                    content:
                        "Maloclusão adquirida pelo uso frequente de chupeta durante o hábito de sucção, ocasionando um cruzamento  anormal dos dentes posteriores",
                  ),
                  Image.asset(
                    'assets/mordida_cruzada.webp',
                    width: 200,
                    height: 200,
                  ),
                  InfoCardWidget(
                    title: "Apinhamento dentário",
                    content:
                        "Ocorre devido à falta de espaço para a erupção dos dentes permanentes ",
                  ),
                  Image.asset(
                    'assets/apinhamento.webp',
                    width: 200,
                    height: 200,
                  ),
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
                    title: "Classe II",
                    content:
                        "Maloclusão caraterizada pela arcada superior se encontrar a frente da superior ",
                  ),
                  Image.asset(
                    'assets/classe_2.webp',
                    width: 200,
                    height: 200,
                  ),
                  InfoCardWidget(
                    title: "Mordida profunda",
                    content:
                        "Maloclusão caracterizada pelo cobrimento dos dentes inferiores pelos dentes superiores",
                  ),
                  Image.asset(
                    'assets/mordida_profunda.webp',
                    width: 200,
                    height: 200,
                  ),
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
                    title: "Alterações no sistema motora-oral",
                    content:
                        "A Associação Americana da Fonoaudiologia define esta alteração como distúrbio miofuncional oral, que inclui anteriorização anormal da língua, incompetência labial, podendo incluir alterações fonoarticulatórias",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A alteração motora-oral que compromete as funções de respiração, mastigação e deglutição. ",
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
            Wrap(children: [
              Text(
                'Maloclusões',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            const Spacer(),
            Text(
              '${_currentPage + 1}/4',
              style: TextStyle(
                  color: AppColors.rose,
                  fontSize: 24,
                  fontFamily: 'Typodermic'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 32),
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
