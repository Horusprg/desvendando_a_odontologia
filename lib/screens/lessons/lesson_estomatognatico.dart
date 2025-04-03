import 'package:desvendando_a_odontologia/widgets/info_card.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class EstomatognaticoLessonScreen extends StatefulWidget {
  const EstomatognaticoLessonScreen({super.key});

  @override
  State<EstomatognaticoLessonScreen> createState() =>
      _EstomatognaticoLessonScreen();
}

class _EstomatognaticoLessonScreen extends State<EstomatognaticoLessonScreen> {
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
                InfoCardWidget(
                  title: "O sistema estomatognático é...",
                  content:
                      "Um conjunto de estruturas cranio-faciais  que juntas atuam realizando funções como:",
                ),
                SizedBox(height: 20,),
                InfoCardWidget(
                  title: "1. Deglutição",
                  content:
                  "",
                ),
                InfoCardWidget(
                  title: "2. Mastigação",
                  content:
                  "",
                ),
                InfoCardWidget(
                  title: "3. Fala",
                  content:
                  "",
                ),
                InfoCardWidget(
                  title: "4. Sucção",
                  content:
                  "",
                ),
                InfoCardWidget(
                  title: "5. Respiração",
                  content:
                  "",
                ),
              ],
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                InfoCardWidget(
                  title: "",
                  content:
                      "Embora o desenvolvimento do Sistema Estomatognático esteja diretamente relacionado a fatores genéticos,"
                      " herdados a partir dos genes do pai e da mãe, e ter sua formação ainda na fase intrauterina,"
                      " esse sistema também sofre influência dos fatores ambientais.",
                ),
                SizedBox(
                  height: 20,
                ),
                InfoCardWidget(
                  title: "",
                  content:
                      "Um exemplo disso é a sucção e a respiração, bastante solicitadas durante o processo da amamentação",
                ),
              ],
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                InfoCardWidget(
                  title: "",
                  content:
                      "O desenvolvimento Motor-Oral está ligado às funções de nutrição,"
                      " respiração e articulação de sons.  ",
                ),
                InfoCardWidget(
                  title: "",
                  content:
                      "A amamentação influencia diretamente em seu desenvolvimento. ",
                ),
              ],
            ),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                InfoCardWidget(
                  title: "",
                  content:
                      "A sucção durante o aleitamento natural, promove o desenvolvimento "
                          "dos órgãos fonoarticulatós influenciando positivamente na mobilidade,"
                          " força, postura, e no desenvolvimento das funções de respiração, mastigação, deglutição e articulação dos sons da fala.",
                ),
              ],
            ),
          )),
        ],
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Wrap(children: [
              Text(
                'O que é o sistema\n estomatognático?',
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
