import 'package:desvendando_a_odontologia/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';
import '../../widgets/warn_card.dart';

class BeneficiosAleitamentoLessonScreen extends StatefulWidget {
  const BeneficiosAleitamentoLessonScreen({super.key});

  @override
  State<BeneficiosAleitamentoLessonScreen> createState() =>
      _BeneficiosAleitamentoLessonScreen();
}

class _BeneficiosAleitamentoLessonScreen extends State<BeneficiosAleitamentoLessonScreen> {
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
                Text("Quais os benefícios?"),
                Text("Para os bebês: "),
                InfoCardWidget(
                  title: "1. Proteção Imunológica",
                  content:
                      "Dentre os componentes do leite materno estão inúmeros fatores imunológicos, "
                          "como IgA, IgM e IgG além de macrófagos, neutrófilos, linfócitos B e T "
                          "entre outros que oferecem proteção contra diversas infecções.  ",
                ),
                SizedBox(
                  height: 20,
                ),
                WarnCard(
                  text:
                  "Apesar da proteção oferecida pelo leite materno é importante que as vacinas sejam tomadas de acordo com o calendário vacinal",
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
                  title: "2. Reduz a Mortalidade Infantil",
                  content:
                      "Segundo fontes oficiais como Organização Mundial da Saúde, Ministério da Saúde e Unicef,"
                          "cerca de 6 (seis) milhões de vidas de crianças vem sendo salvas anualmente em "
                          "decorrência da promoção e aumento das taxas de amamentação exclusiva.",
                ),
                SizedBox(
                  height: 20,
                ),
                InfoCardWidget(
                  title: "3. Prevenção de Doenças",
                  content:
                      "Prevenção de doenças futuras como diabetes, hipertensão,"
                          " obesidade e colesterol alto além de diminuir as chances "
                          "do desenvolvimento de alergias e infecções respiratórias.",
                ),
                SizedBox(
                  height: 20,
                ),
                InfoCardWidget(
                  title: "4. Melhora na Inteligência",
                  content:
                      "A amamentação possui efeitos positivos no desenvolvimento das áreas cognitivas,"
                          " motoras e emocionais por favorecer o vínculo entre o bebê e sua mãe.",
                ),
              ],
            ),
          )),
          Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text("Para as mães: "),
                    InfoCardWidget(
                      title: "1. Redução do tamanho do útero",
                      content:
                      "Durante a amamentação o organismo materno produz diversos tipos de hormônios e substâncias,"
                          " dentre eles a ocitocina, responsáveis por várias funções, dentre elas a redução do tamanho"
                          " do útero mais rápida.  ",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoCardWidget(
                      title: "2. Diminuição do Sangramento",
                      content:
                      "Assim como a involução uterina a ocitocina também é responsável pela diminuição "
                          "do sangramento uterino pós-parto, diminuindo anemia materna. ",
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
                      title: "3. Peso e gordura corporal reduzidos",
                      content:
                      "O retorno para o peso anterior a gravidez mais rapidamente também é observado em mães que amamentam. ",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoCardWidget(
                      title: "4. Redução das Chances de Câncer",
                      content:
                      "A relação entre a diminuição do desenvolvimento de câncer de mama, "
                          "ovários e útero e a amamentação já é bem conhecida. Calcula-se uma redução "
                          "de 4,3% a cada 12 meses de duração do aleitamento.",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoCardWidget(
                      title: "5. Redução do Estresse e Ansiedade",
                      content:
                      "O aleitamento materno é relacionado a diminuição do estresse e ansiedade possuindo"
                          " um efeito protetor a saúde psicológica e diminuindo as chances do desenvolvimento de depressão pós-parto. ",
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
                      title: "6. Redução de Doenças",
                      content:
                      "A amamentação é relacionada a diminuição de doenças como diabetes, "
                          "hipertensão além de oferecer proteção contra fraturas ósseas. ",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoCardWidget(
                      title: "7. Reduz as Chances de Nova Gravidez ",
                      content:
                      "O ato de amamentar é um conhecido método contraceptivo e de planejamento familiar. "
                          "Mães que amamentam exclusivamente ou de forma predominante possuem menores chances de engravidar "
                          "novamente durante esse período.",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WarnCard(text:
                    "Isso ocorre desde que: \n"
                      "1 .O bebê seja menor de seis meses; \n"
                      "2. Lactante ainda não tenha menstruado pós-parto.")
                  ],
                ),
              )),
          Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text("Além disso..."),
                    InfoCardWidget(
                      title: "",
                      content:
                      "No desenvolvimento da criança em seus primeiros anos de vida, "
                          "a amamentação é a maneira mais eficiente de atender aos aspectos: ",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "A amamentação é responsável por criar e fortalecer laços entre a mãe e o bebê,"
                          " sendo uma oportunidade desde cedo da criança desenvolver sentimentos afetuosos,"
                          " de confiança, proteção e segurança. ",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Outro benefício, é a redução de custos para a família já que o leite materno"
                          " não oferece impacto a renda familiar em comparação com as fórmulas infantis.",
                    ),
                  ],
                ),
              )),
          Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text("Portanto ..."),
                    InfoCardWidget(
                      title: "",
                      content:
                      "O leite materno contém cerca de 160 substâncias, "
                          "dentre elas proteínas, carboidratos, gorduras, vitaminas e células,"
                          " sendo o alimento perfeito para o desenvolvimento satisfatório do bebê,"
                          " proporcionando ganho de peso, correto desenvolvimento das estruturas orais envolvidas"
                          " e melhor desenvolvimento cognitivo.                                         ",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "O leite materno em sua composição contém características ideais para o crescimento"
                          " e desenvolvimento da criança, sendo benéfico tanto para a mãe quanto para o bebê.",
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
            Text(
              'Benefícios do Aleitamento',
              style: AppTypography.typodermic(size: 24),
            ),
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
