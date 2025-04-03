import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class RespiracaoLessonScreen extends StatefulWidget {
  const RespiracaoLessonScreen({super.key});

  @override
  State<RespiracaoLessonScreen> createState() =>
      _RespiracaoLessonScreen();
}

class _RespiracaoLessonScreen
    extends State<RespiracaoLessonScreen> {
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
                      title: "",
                      content:
                      "O padrão de respiração pode sofrer influências negativas do "
                          "desmame precoce, criança que recebe o aleitamento materno mantém "
                          "a postura de repouso de lábios selados e respiração nasal que é o padrão respiratório correto. ",
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
                      "Por outro lado, quando ocorre o desmame precoce a postura de lábios entreabertos do bebê "
                          "é mais comum, facilitando a respiração oral, respiração inadequada, "
                          "que pode interferir no desenvolvimento da oclusão, da face além de interferir negativamente na qualidade de vida",
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
                      "Somente a sucção no peito materno promove a atividade muscular correta...",
                    ),

                  ],
                ),
              )),
        ],
      ),
      appBar: AppBar(
        title: Row(
          children: [
            const Spacer(),
            Wrap(children: [
              Text(
                'Respiração',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            const Spacer(),
            Text(
              '${_currentPage + 1}/3',
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
