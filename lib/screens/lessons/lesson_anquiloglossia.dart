import 'package:desvendando_a_odontologia/widgets/info_card.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class AnquiloglossiaLessonScreen extends StatefulWidget {
  const AnquiloglossiaLessonScreen({super.key});

  @override
  State<AnquiloglossiaLessonScreen> createState() =>
      _AnquiloglossiaLessonScreen();
}

class _AnquiloglossiaLessonScreen extends State<AnquiloglossiaLessonScreen> {
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
                    title: "Anquiloglossia",
                    content:
                        "A anquilogossia, popularmente conhecida como \"língua presa\" "
                        "é a condição em que a criança apresenta a inserção do freio lingual anormalmente curto, "
                        "podendo ser mais grosso, espesso, ou fino, delgado ",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Essa disposição pode prejudicar e restringir a movimentação da língua essencial "
                        "para o bom funcionamento da amamentação, ocasionando a dificuldade de esvaziamento"
                        " da mama e consequentemente a produção e continuidade do aleitamento",
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
                    title: "No Brasil ... ",
                    content:
                        "A lei nº 13.002, de 20 de junho de 2014, popularmente conhecida como \"lei do teste da linguinha\", "
                        "define a obrigatoriedade da avaliação do frênulo lingual em bebês em todos os hospitais e"
                        " maternidades do país. ",
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
                    title: "Fissura palatina",
                    content:
                        "A amamentação em crianças que possuem alguma má formação craniofacial, "
                        "mesmo sendo um fator dificultador, ainda sim deve ser incentivada,"
                        " devido aos diversos benefícios abordados ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "As fissuras labiopalatinas são malformações ocasionadas devido a não"
                        " junção das estruturas dos lábios, palato ou de ambos",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Dependendo do tipo de fissura há uma alteração no grau de dificuldade no processo de amamentação",
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
                    title: "Fissura palatina",
                    content: "As principais dificuldades apresentadas, são:\n\n"
                        "Sucção fraca;\n"
                        "Dificuldade na pega;\n"
                        "Refluxo de leite pelo nariz;\n"
                        "Ganho de peso insuficiente;\n"
                        "Traumas mamilares.",
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
            Spacer(),
            Wrap(children: [
              Text(
                'Anquiloglossia e\n Fissuras Labiopalatais',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            Spacer(),
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
