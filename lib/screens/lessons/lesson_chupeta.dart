import 'package:desvendando_a_odontologia/widgets/warn_card.dart';
import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class ChupetaLessonScreen extends StatefulWidget {
  const ChupetaLessonScreen({super.key});

  @override
  State<ChupetaLessonScreen> createState() => _ChupetaLessonScreen();
}

class _ChupetaLessonScreen extends State<ChupetaLessonScreen> {
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
                    title: "O uso da chupeta e mamadeira comprometem",
                    content: "O desenvolvimento motor-oral",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "O padrão respiratório",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Correto desenvolvimento da musculara facial",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "A posição de repouso da língua",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Movimentação perio-oral",
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
                        "A posição correta de repouso da língua é aquela em que a ponta da língua toca no palato, conhecido como \"o céu da boca\"",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "No aleitamento artificial a atividade muscular é inadequada, o que influencia negativamente"
                        " na posição de repouso da lingua e de toda a musculatura orofacial gerando uma respiração inadequada (respiração oral) e possibilitando a instalação de maloclusões.",
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
                        "O uso da chupeta durante o primeiro ano de vida também pode ocasionar alterações na "
                        "movimentação da musculatura perioral, principalmente da língua, alterando sua posição "
                        "de repouso, e nas bochechas.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Podem ocasionar maloclusões relacionadas a alterações no arco dentário, como veremos mais à frente",
                  ),
                  WarnCard(
                      text:
                          "Evite o surgimento de maloclusões e alterações na respiração de seu filho!")
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
                    title: "Além disso...",
                    content:
                        "A mamadeira estimula o trabalho apenas dos músculos bucinadores e do orbicular da boca, "
                        "deixando de estimular outros músculos",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "O excessivo trabalho muscular dos orbiculares estimulada pela mamadeira pode influenciar no crescimento craniofacial,"
                        " levando a arcadas estreitas, falta de espaço para dentes e língua e incorreto crescimento mandibular. ",
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
                    title: "Você sabia?",
                    content:
                        "O formato dos bicos das mamadeiras influenciam no desenvolvimento da face",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Portanto, quando for indispensável a utilização de bicos, devemos saber como escolher...",
                  ),
                  InfoCardWidget(
                    title: "Como escolher o bico adequado? ",
                    content: "Comprimento\nTamanho do furo\nFlexibilidade",
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
                    title: "Como escolher o bico adequado?",
                    content:
                        "Na escolha de um bico adequado, deve-se considerar o comprimento e a flexibilidade, "
                        "bem como o tamanho do furo e a posição que o mesmo irá impor na cavidade bucal. ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Evitar os bicos curtos",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "O bico deve ser flexível o suficiente para permitir uma fácil adaptação à boca da criança.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "O furo precisa favorecer um adequado fluxo de leite.",
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
                    title: "Você sabia?",
                    content:
                        "A chupeta também pode ser responsável pelo desmame precoce e contribuir para a introdução da mamadeira",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Associa-se ao menor número de sucções, comparado ao seio materno, "
                        "levando a redução no trabalho da musculatura perioral, "
                        "o que comprometeria o desenvolvimento motor-oral da face.",
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
                    title: "Recapitulando...",
                    content:
                        "O uso da mamadeira e da chupeta, podem causar disfunções na mastigação, "
                        "deglutição e articulação dos sons da fala, conduzindo a alterações na respiração,"
                        " alterações de mordida e má oclusões. ",
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
                    title: "Você sabia?",
                    content:
                        "Quando ocorre o desmame precoce a criança não supre suas necessidades"
                        " de sucção e acaba adquirindo hábitos de sucção não nutritiva,"
                        " dentre eles, a sucção digital e o uso de chupeta, ocasionando alterações na oclusão dentária.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "As mais relacionadas, são:\n"
                        "Mordida aberta anterior\n"
                        "Mordida cruzada posterior\n"
                        "Apinhamento dentário\n"
                        "Relação de classe II",
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
                'Chupeta e mamadeira',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            const Spacer(),
            Text(
              '${_currentPage + 1}/9',
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
