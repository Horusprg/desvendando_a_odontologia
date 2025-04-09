import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class PartoPrematuroLessonScreen extends StatefulWidget {
  const PartoPrematuroLessonScreen({super.key});

  @override
  State<PartoPrematuroLessonScreen> createState() =>
      _PartoPrematuroLessonScreen();
}

class _PartoPrematuroLessonScreen extends State<PartoPrematuroLessonScreen> {
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
                        "Outra complicação gestacional que pode está relacionado com a doença periodontal é o parto prematuro.",
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
                        "Uma gravidez completa dura de 37 a 42 semanas. O bebê é considerado prematuro se nascer antes da 37ª semana. ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A Organização Mundial de Saúde (OMS) classifica a prematuridade assim:",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "Extremamente prematuro",
                    content:
                        "Quando o bebê nasce com menos de 28 semanas de gestação.",
                  ),
                  InfoCardWidget(
                    title: "Muito prematuro",
                    content:
                        "É quando nasce entre 28 e 32 semanas de gestação.",
                  ),
                  InfoCardWidget(
                    title: "Prematuro moderado a tardio",
                    content:
                        "Quando o bebê nasce entre 32 e 37 semanas de gestação.",
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
                        "Cerca de 15 milhões de crianças nascem prematuras todos os anos no mundo. "
                        "No Brasil, 340 mil bebês nascem antes do tempo, o que é cerca"
                        " de 12% dos nascimentos anuais no país.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Estima-se que 931 bebês nascem antes do tempo por dia no país.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "1 em cada 10 bebês nasce prematuro ao redor do mundo.",
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
                        "Os principais fatores de risco para o parto prematuro, são: ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Infecções durante a gravidez, incluindo infecções de origem odontológicas;\n\n"
                        "Histórico de partos prematuros anteriores;\n\n"
                        "Alterações clínicas na gestante ou no feto que necessitem de interrupção antes do tempo esperado e outros;\n\n"
                        "Consumo de drogas como álcool e cigarro;\n\n"
                        "Malformações uterinas;\n\n"
                        "Pré-eclâmpsia e entre outros.\n",
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
                        "Os bebês prematuros normalmente apresentam baixo peso, ou seja, menos que 2,5 kg."
                        " Os bebês prematuros também podem apresentar pouca gordura corporal, pele fina e lisa, "
                        "podendo ter ainda a cabeça maior que o corpo. Quanto ao seu comportamento, é comum que"
                        " fiquem a maior parte do tempo com os olhos fechados e tenham reflexos mais lentos.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Essas características não devem ser motivo de preocupação pois "
                        "com o acompanhamento, o bebê ganhará peso, crescerá e se desenvolverá.",
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
                    title:
                        "Quais as principais complicações causadas pela prematuridade e o baixo peso ao nascer?",
                    content: "",
                  ),
                  InfoCardWidget(
                    title: "Problemas respiratórios:",
                    content:
                        "Bebês prematuros frequentemente enfrentam dificuldades respiratórias"
                        " devido à produção inadequada de uma substância chamada surfactante, "
                        "necessitando de suporte respiratório.",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "Retinopatia da prematuridade:",
                    content:
                        "Prematuros, especialmente os nascidos com menos de 32 semanas, "
                        "podem desenvolver uma doença na retina devido ao crescimento desorganizado "
                        "dos vasos sanguíneos. Em alguns casos, pode evoluir sem sequelas, mas em"
                        " situações graves, pode necessitar de tratamento e cirurgia e levar à cegueira.",
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
                    title: "Dificuldade para manter a temperatura corporal:",
                    content:
                        "A hipertermia, que é quando a temperatura corporal está abaixo de 36,5º C, "
                        "é comum em bebês prematuros, sendo a incubadora utilizado na UTI para mantê-los aquecidos. ",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "Dificuldade na alimentar:",
                    content:
                        "Bebês prematuros têm dificuldade em coordenar a respiração,"
                        " sucção e deglutição, sendo,  necessário, por vezes, o recebimento "
                        "do leite materno por meio  de sonda gástrica durante seu período de internação.",
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
                'Parto Prematuro',
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
