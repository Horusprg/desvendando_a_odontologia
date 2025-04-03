import 'package:desvendando_a_odontologia/widgets/warn_card.dart';
import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class BaixoPesoLessonScreen extends StatefulWidget {
  const BaixoPesoLessonScreen({super.key});

  @override
  State<BaixoPesoLessonScreen> createState() =>
      _BaixoPesoLessonScreen();
}

class _BaixoPesoLessonScreen
    extends State<BaixoPesoLessonScreen> {
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
                      title: "Baixo peso ao nascimento",
                      content:
                      "A Organização Mundial da Saúde (OMS) define com baixo peso ao nascer "
                          "(BPN) o nascimento de bebês com peso inferior a 2.500g.",
                    ),
                    Image.asset('assets/peso_bebe.webp', width: 200, height: 200,),
                    WarnCard(text: "O baixo peso ao nascer é considerado como um importante problema de saúde "
                        "pública  devido  sua associação com a mortalidade neonatal.")

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
                      "A mortalidade neonatal refere-se à morte de bebês que ocorrem nos"
                          " primeiros 28 dias de vida. É um importante indicador de saúde pública, "
                          "refletindo as condições de saúde materna, cuidados durante a gravidez e no parto,"
                          " bem como a qualidade do atendimento neonatal.",
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
                'Baixo peso\n ao nascimento',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
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
