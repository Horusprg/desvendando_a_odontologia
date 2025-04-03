import 'package:desvendando_a_odontologia/widgets/warn_card.dart';
import 'package:flutter/material.dart';
import 'package:desvendando_a_odontologia/widgets/info_card.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class ImportanciaPreNatalLessonScreen extends StatefulWidget {
  const ImportanciaPreNatalLessonScreen({super.key});

  @override
  State<ImportanciaPreNatalLessonScreen> createState() =>
      _ImportanciaPreNatalLessonScreen();
}

class _ImportanciaPreNatalLessonScreen
    extends State<ImportanciaPreNatalLessonScreen> {
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
                      "O cuidado com a saúde bucal deve fazer parte da assistência pré natal."
                          " Neste período as mudanças fisiológicas que ocorrem nas gestantes,"
                          " acabam por impactar também a cavidade oral, fazendo necessário o acompanhamento clínico odontológico. "
                        "Dentre os principais repercussões observadas na cavidade oral, como citado anteriormente no aplicativo, são:  ",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "-> Aumento dos níveis de inflamação periodontal, devido às alterações dos níveis hormonais;\n"
                        "-> Mudanças comportamentais, com alterações na dieta e hábitos de saúde bucal. ",
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
                      title: "Como realizar as consultas odontológicas?",
                      content:
                      "Para realizar as consultas odontológicas, a mulher grávida"
                          " que está fazendo acompanhamento médico, deve falar com o seu médico "
                          "ou a enfermeira da unidade de saúde onde faz as consultas de pré-natal. "
                          "Assim, eles podem encaminhá-la para um dentista na mesma unidade de saúde ou"
                          " em outro lugar onde ofereçam cuidados odontológicos. ",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "É importante que ela converse com a equipe de saúde para"
                          " receber orientações sobre como cuidar da saúde bucal"
                          " durante a gravidez. ",
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
                      title: "Durante o pré natal odontológico...",
                      content:
                      "O dentista que ficará responsável por cuidar da saúde bucal da gestante, fará isso de duas formas. ",
                    ),
                    InfoCardWidget(
                      title: "1.",
                      content:
                      "Primeiro, ele se concentra em garantir que a futura mamãe tenha"
                          " uma boca saudável, envolvendo a realização de limpeza dos dentes"
                          " e cuidados com as gengivas, tratamentos simples, evitando "
                          " procedimentos invasivos como clareamento ou colocação de aparelho",
                    ),
                    InfoCardWidget(
                      title: "2.",
                      content:
                      "Em segundo lugar, o dentista dá conselhos à gestante sobre "
                          "como cuidar da saúde bucal do bebê que está a caminho. "
                          "Isso inclui orientações sobre a boca do recém-nascido, "
                          "amamentação, hábitos alimentares e como usar chupeta e mamadeira.",
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
                      title: "Uso de medicamentos durante a gestação",
                      content:
                      "Durante a gravidez, é melhor evitar tomar qualquer remédio "
                          "contudo, nem sempre é possível. Portanto, se for realmente necessário, deve ser usado com muito cuidado."
                          " A maioria dos remédios de uso odontológico são seguros durante a gestação.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "O tratamento para gestantes deve ser escolhido com base na "
                          "análise de riscos e benefícios para o bebê e a mãe. ",
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
                      "Devido à especificidade das gestantes, cuidados especiais com "
                          "medicamentos são necessários, especialmente nos primeiros três"
                          " meses de gestação, quando os órgãos do bebê estão se desenvolvendo "
                          "e o risco de malformações congênitas é maior.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Listaremos os principais e mais recomendados grupos de "
                          "medicamentos utilizados na clínica odontológica.",
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
                      title: "Anestésicos Locais na Gestação",
                      content:
                      "Os anestésicos locais são seguros para usar durante a gravidez "
                          "e não têm contraindicações específicas. No entanto, é importante"
                          " observar a técnica usada, a quantidade aplicada, o uso de vasoconstritores,"
                          " os efeitos tóxicos nas células e a possibilidade de causar problemas no bebê.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Lidocaína",
                      content:
                      "A lidocaína a 2% com epinefrina (1:100.000) é o anestésico mais usado."
                          " É recomendado usar no máximo dois tubetes (3,6 ml) por sessão.",
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
                      title: "Benzocaína e prilocaína",
                      content:
                      "Devem ser evitadas na gravidez, pois podem reduzir a circulação de sangue "
                          "na placenta e causar risco de problemas como metemoglobinemia"
                          " e falta de oxigênio no bebê.",
                    ),
                    WarnCard(text: "Metemoglobinemia: Ocorre devido ao aumento de um"
                        " tipo de hemoglobina que não consegue transportar oxigênio adequadamente."),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Uso de vasoconstritores",
                      content:
                      "A adrenalina no anestésico é rapidamente transformada no corpo. "
                          "Ela ajuda aumentando a concentração do anestésico no local, "
                          "tem ação que ajuda a parar o sangramento e prolonga o efeito do anestésico.",
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
                      title: "Analgésicos",
                      content:
                      "O dentista tem a responsabilidade de conhecer os aspectos farmacológicos"
                          " dos medicamentos que prescreve, especialmente no caso das gestantes."
                          " Qualquer erro na sua prescrição para esses grupos, em  especial, "
                          "pode causar efeitos irreversíveis no bebê.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Paracetamol",
                      content:
                      "O paracetamol é o analgésico mais prescrito pelos dentistas, incluindo para as gestantes. ",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Dipirona sódica",
                      content:
                      "A dipirona sódica é a segunda opção, embora faltem evidências de "
                          "que seu uso seja prejudicial para o bebê, o recomendado é "
                          "evitar este medicamento nos primeiros três meses da gestação "
                          "e é contra indicado no último trimestre.",
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
                      title: "Anti-inflamatórios",
                      content:
                      "Anti-inflamatórios são remédios utilizados para reduzir"
                          " a inflamação no corpo. Eles ajudam a aliviar sintomas como dor,"
                          " inchaço, vermelhidão e calor, que são sinais típicos de uma resposta inflamatória. ",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Paracetamol",
                      content:
                      "É geralmente considerado seguro durante toda a gravidez e é amplamente recomendado "
                          "para o alívio da dor e febre. ",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Corticosteroides",
                      content:
                      "Tratamentos de emergência como tratamento de canal ou "
                          "cirurgia podem usar uma única dose de 4 mg de betametasona ou dexametasona. "
                          "Esse grupo, é considerado mais seguro do que os AINEs quando usados "
                          "topicamente para tratar inflamações na boca.",
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
                      title: "Anti-inflamatórios não esteroides (AINES)",
                      content:
                      "De forma geral os AINEs não devem ser recomendados"
                          " para gestantes. Se for necessária sua utilização durante a gestação,"
                          " o ácido acetilsalicílico, como a aspirina, em pequenas doses é provavelmente o mais seguro deles.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Devem ser evitados especialmente no terceiro, pois podem causar "
                          "problemas como o fechamento prematuro do ducto arterial "
                          "no feto, prolongamento do trabalho de parto, "
                          "maior risco de hemorragia pós-parto.",
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
                      title: "Antibióticos",
                      content:
                      "",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Penicilinas",
                      content:
                      "As penicilinas são as melhores opções durante a gravidez para prevenir e tratar infecções na mãe e no bebê.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Outras opções seguras",
                      content:
                      "Outras escolhas seguras incluem cefalosporinas e macrolídeos,"
                          " exceto a eritromicina no tipo estolato, que pode ser prejudicial ao fígado.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Tetraciclinas",
                      content:
                      "Evite tetraciclinas durante a gravidez, pois podem passar para o bebê através da placenta e causar problemas.",
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
                      title: "Uso do flúor na gestação",
                      content:
                      "",
                    ),
                    InfoCardWidget(
                      title: "Flúor tópico",
                      content:
                      "Usar flúor diretamente nos dentes durante a gravidez "
                          "não é proibido, mas só ajuda os dentes da mãe, "
                          "não os do bebê que está se desenvolvendo.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Suplementação com flúor",
                      content:
                      "Não é recomendado tomar suplementos pré-natais com flúor, "
                          "especialmente em vitaminas que contêm cálcio, porque isso "
                          "pode diminuir a absorção de ambos, o que pode causar problemas"
                          " sérios para a mãe e o bebê.",
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
                      "A American Dental Association (ADA) e a Food and Drug a American Dental"
                          " Association (ADA) e a Food and Drug Administration (FDA) "
                          "sugerem evitar o uso de flúor em suplementos pré-natais.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "",
                      content:
                      "É melhor usar flúor depois que os dentes nascem, através de "
                          "aplicação tópica ou bochechos, para ajudar na reconstrução"
                          " dos dentes enfraquecidos, aumentando o flúor na superfície do esmalte.",
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
                      title: "Exames radiográficos na gestação",
                      content:
                      "",
                    ),
                    InfoCardWidget(
                      title: "Quando evitar?",
                      content:
                      "Evite fazer radiografias no primeiro trimestre da gravidez "
                          "porque é quando os órgãos do bebê estão se formando e são mais sensíveis.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Precauções necessárias",
                      content:
                      "Se tomadas todas as precauções, é seguro realizar radiografias"
                          " durante a gravidez. Isso inclui usar um avental de chumbo para"
                          " proteger o abdômen, ajustar a dose de radiação, usar filmes rápidos e"
                          " manter o tempo de exposição aos raios X o mais curto possível.",
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
                      title: "Casos de urgência",
                      content:
                      "Se houver uma emergência, as radiografias não precisam"
                          " ser adiadas se todas as precauções forem tomadas. A "
                          "quantidade de radiação que o bebê recebe é muito pequena,"
                          " e as radiografias dentárias usam doses muito baixas, abaixo do limite seguro.",
                    ),
                    SizedBox(height: 20,),
                    InfoCardWidget(
                      title: "Importância das radiografias",
                      content:
                      "Radiografias são essenciais para diagnósticos e tratamentos adequados,"
                          " e não devem ser negligenciadas em gestantes quando necessárias.",
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
                      title: "Como realizar a higiene bucal adequada?",
                      content:
                      "",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "É necessário escovar os dentes sempre após as refeições e principalmente a noite;",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Para isso deve-se utilizar uma escova de cerdas macia e com a cabeça pequena."
                          " O creme dental deve conter flúor (acima de 1000 ppmF) com uma"
                          " quantidade recomendada com mais ou menos o tamanho de uma ervilha;",
                    ),
                  ],
                ),
              )),
          Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    InfoCardWidget(
                      title: "Técnica de escovação",
                      content: "",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Posicione a escova inclinada em direção à gengiva. Em seguida,"
                          " movimentos de cima para baixo em todos os dentes, por fora e por dentro.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Em seguida, faça movimentos de vai e vem em todas as faces dos dentes e de dentro para fora.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Por fim, escove a língua “varrendo” da parte de trás em direção a ponta.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "Passe o fio dental duas vezes em cada espaço entre os dentes,"
                          " primeiro pressionando em direção a um dente, depois em direção ao outro.",
                    ),
                    InfoCardWidget(
                      title: "",
                      content:
                      "O fio deve descer delicadamente até o fundo da gengiva. Por fim,"
                          " puxe para o lado da superfície do dente pressionando o fio para retirar.",
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
                'Importância do\n Pré-Natal Odontológico',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            const Spacer(),
            Text(
              '${_currentPage + 1}/17',
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
