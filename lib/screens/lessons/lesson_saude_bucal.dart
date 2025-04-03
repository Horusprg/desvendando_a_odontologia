import 'package:desvendando_a_odontologia/widgets/warn_card.dart';
import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class SaudeBucalLessonScreen extends StatefulWidget {
  const SaudeBucalLessonScreen({super.key});

  @override
  State<SaudeBucalLessonScreen> createState() =>
      _SaudeBucalLessonScreen();
}

class _SaudeBucalLessonScreen
    extends State<SaudeBucalLessonScreen> {
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
                      "Durante a gestação algumas alterações orais são comumente relatadas pelas mamães, dentre elas destacam-se:",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Aumento dos níveis de inflamação periodontal;",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Doença cárie.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Essas modificações na cavidade oral estão geralmente associadas"
                          " a mudanças hormonais, metabólicas e de higiene oral que ocorrem nesta fase.",
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
                      title: "Inflamação Periodontal",
                      content:
                      "Os tecidos periodontais, que circundam os dentes, tornam-se mais passíveis a mudanças inflamatórias formada por placa "
                          "dentária diante de alterações hormonais, como por exemplo devido ao aumento dos níveis de estrógeno"
                          " e progesterona durante a gestação.",
                    ),
                    SizedBox(height: 20,),
                    WarnCard(text: "Os hormônios sexuais femininos têm um importante papel nas alterações periodontais. ")
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
                      "A gengivite gravídica é uma frequente alteração periodontal observada em gestantes.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "É uma resposta exagerada à presença de placa dentária e ocorre com "
                          "frequência entre as gestante, com taxas que podem alcançar de 35 e 100%; ",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Sua aparência é caracterizada pela  gengiva com coloração avermelhada,"
                          " inchadas, com sangramento ao toque ou durante a escovação.",
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
                      title: "Como é feito o tratamento da Gengivite gravídica?",
                      content:
                      "Pode desaparecer alguns meses após o parto desde que os irritantes sejam eliminados ",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Os irritantes serão eliminados através da remoção do biofilme"
                          " bacteriano por meio de uma boa higiene bucal e profilaxia profissional",
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
                      "O Granuloma gravídico, também chamado de tumor gravídico,  "
                          "é uma lesão benigna que surge geralmente entre o primeiro trimestre da gestação,"
                          " resultante de traumas por repetições e irritação local sobre a mucosa gengival;",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Sua aparência é caracterizada por uma coloração que varia entre rosa, vermelho e violeta,"
                          " dependendo da idade da lesão e geralmente pode apresenta uma superfície ulcerada e frágil, "
                          "coberta por uma  membrana amarelada.",
                    ),
                    SizedBox(height: 20,),
                    Image.asset('assets/granuloma.webp', width: 300, height: 200,)

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
                      "Para seu tratamento é indicada a remoção cirúrgica em casos em que há interferência na mastigação,"
                          " na execução da higiene bucal, estética ou em situações de ulceração; "
                          "caso contrário os irritantes locais devem ser removidos e a lesão mantida e "
                          "observado até o período de pós-parto, quando normalmente ocorre sua redução espontânea. ",
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
                      title: "Doença cárie",
                      content:
                      "O surgimento das lesões de cárie dentária não está diretamente ligada a gestação, "
                          "mas, sim, a fatores como a menor capacidade estomacal, que faz com que a gestante "
                          "diminua a quantidade de ingestão de alimentos durante as refeições e aumente sua frequência",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Esta atitude resulta em um aumento da disponibilidade de nutrientes que, "
                          "associado ao descuido com a higiene bucal, aumenta o risco de cárie;",
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
                'Saúde Bucal da Mamãe',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            const Spacer(),
            Text(
              '${_currentPage + 1}/7',
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
