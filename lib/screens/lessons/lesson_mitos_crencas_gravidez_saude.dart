import 'package:desvendando_a_odontologia/widgets/warn_card.dart';
import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class MitosCrencasLessonScreen extends StatefulWidget {
  const MitosCrencasLessonScreen({super.key});

  @override
  State<MitosCrencasLessonScreen> createState() => _MitosCrencasLessonScreen();
}

class _MitosCrencasLessonScreen extends State<MitosCrencasLessonScreen> {
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
                    title: "Mitos e Crenças sobre gravidez x Saúde bucal",
                    content:
                        "A gestação é um período cheio de desafios, medos e incertezas. "
                        "Dentre esses medos, os cuidados e acompanhamento odontológico podem fazer parte, "
                        "podendo afetar a saúde do bebê e da gestante. Além disso, durante esse período "
                        "existe uma falta de percepção da necessidade ou, urgência, de se "
                        "realizar os cuidados com a saúde oral. ",
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
                        "Os mitos e crenças que popularmente estão relacionados a saúde bucal e gestação, são: ",
                  ),
                  InfoCardWidget(
                    title: "1. A mulher perde cálcio durante a gestação",
                    content:
                        "Existe a crença que durante a gestação a mulher perde cálcio do seu corpo, "
                        "incluindo dos dentes, para a formação do bebê.\n"
                        "O que ocorre, no entanto, é que o cálcio utilizado na "
                        "formação do bebê é proveniente da alimentação da gestante.  ",
                  ),
                  InfoCardWidget(
                    title: "2. A gestante pode fazer o exame de raio-X.",
                    content:
                        "Durante a gravidez a gestante pode realizar exames que"
                        " envolvam o raio X, se for extremamente necessário sempre "
                        "utilizando os equipamentos de segurança como o avental e protetor de tireóide. ",
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
                    title: "3. A gestação traz cárie e perda de dentes",
                    content:
                        "Uma crença bastante popular é a que a cada gestação a mulher perde um dente,"
                        " o que é um mito, não há relação entre gravidez e perda de dentes."
                        " A cárie é consequência de uma alimentação desregulada, rica em carboidratos e falta de higiene bucal.",
                  ),
                  InfoCardWidget(
                    title: "4. As gestantes não podem usar anestésicos",
                    content:
                        "O uso de anestésico em gestante é permitido. Porém deve-se atentar"
                        " para a presença de vasoconstritores que não são aconselhados para esse grupo de pacientes. "
                        "A lidocaína é o anestésico mais apropriado para o uso em gestantes.",
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
                  WarnCard(
                      text:
                          "Alguns aspectos devem ser observados quanto a utilização de"
                          " anestésicos locais em gestantes, dentre eles, destaca-se: \n"
                          "-> Técnica anestésica;\n"
                          "-> Quantidade da droga administrada;\n "
                          "-> Ausência/presença de vasoconstritor;\n"
                          "-> Efeitos citotóxicos."),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "A periodontite pode causar parto prematuro",
                    content:
                        "A periodontite, um processo inflamatório dos tecidos que circundam os dentes. De fato, essa"
                        "inflamação pode causar alterações na gestação. Os microorganismos"
                        "presentes na placa bacteriana podem atingir a corrente sanguínea e estimular a produção da prostaglandina,  "
                        "um hormônio capaz de provocar contrações do útero e acelerar o trabalho de parto podenco causar complicações "
                        "como um nascimento prematuro ou bebê de baixo peso. ",
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
                'Mitos e Crenças',
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
