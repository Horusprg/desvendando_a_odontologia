import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class PreEclampsiaLessonScreen extends StatefulWidget {
  const PreEclampsiaLessonScreen({super.key});

  @override
  State<PreEclampsiaLessonScreen> createState() => _PreEclampsiaLessonScreen();
}

class _PreEclampsiaLessonScreen extends State<PreEclampsiaLessonScreen> {
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
                    title: "",
                    content:
                        "A pré-eclâmpsia é um problema grave e está relacionada com "
                        "o aumento da pressão arterial, pressão que o sangue exerce "
                        "sobre as paredes das artérias, de grávidas. ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Pode acontecer em qualquer gestante, atingindo cerca de 5% das "
                        "mulheres neste período, ocorrendo principalmente durante a segunda metade "
                        "da gravidez ou até seis meses após o parto.",
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
                    title: "",
                    content:
                        "O diagnóstico de pré-eclâmpsia geralmente é feito durante o pré-natal "
                        "quando é detectado a hipertensão (aumento de pressão arterial) e "
                        "proteinúria (presença de proteína na urina) após a 20º semana de gestação.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Identificá-la de forma precoce é fundamental para garantir a saúde tanto "
                        "da mãe quanto do bebê, é importante que as informações sobre a doença sejam "
                        "amplamente conhecidas, não apenas pelas gestantes, mas também por sua rede de apoio.",
                  ),
                ],
              ),
            )),
          ),
          SingleChildScrollView(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InfoCardWidget(
                    title: "",
                    content:
                        "A pré-eclâmpsia pode ocorrer de forma assintomática, porém, os sintomas mais comuns, são:",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Dor de cabeça, que não desaparece mesmo com a utilização de remédios;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Inchaço principalmente nos membros inferiores, como perna e pés;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Ganho de peso de um quilo ou mais em uma semana;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Proteinúria, ou seja, perda de proteína via urina;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Náusea ou vômito após os primeiros três meses de gestação;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Hipertensão arterial (Pressão alta).",
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
                    title: "",
                    content:
                        "A hipertensão arterial específica da gravidez, pré-eclâmpsia, "
                        " quando não identificada e tratada, precocemente pode trazer complicações"
                        " maiores a gravidez, podendo causar, inclusive, risco de vida para mãe e bebê. ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Na mãe pode causar edema e hemorragia cerebral, "
                        "insuficiência renal e cardíaca além do desprendimento "
                        "prematuro da placenta da parede uterina.",
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
                    title: "",
                    content:
                        "A hipertensão arterial específica da gravidez, pré-eclâmpsia,  "
                        "quando não identificada e tratada, pode evoluir para a eclâmpsia,"
                        " uma forma grave da doença, caracterizada por convulsões que põem em"
                        " risco a vida da mãe e do feto, podendo levar ao nascimento prematuro.",
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
                'Pré-eclâmpsia',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            const Spacer(),
            Text(
              '${_currentPage + 1}/5',
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
