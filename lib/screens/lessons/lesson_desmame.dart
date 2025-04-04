import 'package:desvendando_a_odontologia/widgets/info_card.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class DesmameLessonScreen extends StatefulWidget {
  const DesmameLessonScreen({super.key});

  @override
  State<DesmameLessonScreen> createState() => _DesmameLessonScreen();
}

class _DesmameLessonScreen extends State<DesmameLessonScreen> {
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
                        "O desmame precoce acontece com a introdução de um novo "
                        "alimento antes dos seis meses de vida da criança ou "
                        "mesmo a supressão completa do aleitamento materno. ",
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
                    title: "Desmame Precoce x Odontologia",
                    content:
                        "O desmame precoce pode ocasionar alterações odontológicas "
                        "futuras devido sua interrupção do processo de desenvolvimento"
                        " motor-oral natural decorrente da amamentação",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Essa interrupção, pode ser causada por diversos fatores como os já abordados anteriormente",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "E estão relacionadas a alterações no padrão esperado do sistema estomatognático, dentre elas, podemos citar: ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "A utilização de bicos artificiais",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Alterações na postura da língua",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Alterações no padrão de respiração",
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
                    title: "Principais causas do desmame precoce",
                    content: "A criança teve dificuldade para pegar o peito;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Dor nos seios e dificuldades ao amamentar;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Atividades ou trabalho que separa a mãe do bebê ao longo do dia;",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Crença em mitos e ditos populares sobre a amamentação.",
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
                    title: "Dificuldades na pega",
                    content:
                        "A pega correta é fundamental para a desenvolvimento do bebê, "
                        "assim como, para evitar a ocorrência de dores na lactante",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A pega é o momento em que o bebê está posicionado no seio e como ele está o abocanhando ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Para que esse movimento ocorra de maneira eficiente é necessário que o bebê esteja de "
                        "boca bem aberta de forma que consiga abocanhar não só o mamilo como também a aréola, "
                        "formando uma vedação entre a boca e os seios",
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
                        "Para a amamentação ocorrer de forma efetiva são necessários movimentos mandibulares, "
                        "para baixo, para frente, para cima e para atrás",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Esses movimentos são fundamentais para o correto crescimento e desenvolvimento craniofacial do bebê",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A língua possui um papel fundamental na retirada do leite, o chamado movimento de ordenha,"
                        " ao realizar movimentos de ondulação e pressão responsável pela emissão"
                        " do leite no interior da cavidade",
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
                    title: "Dor ao amamentar",
                    content:
                        "Dores ao amamentar podem ser ocasionadas por diversos fatores, como:",
                  ),
                  Text("Pega incorreta"),
                  Text("Alterações mamilares"),
                  Text("Alterações orais no bebê"),
                  Text("Uso inadequado de bombas para retirada do leite"),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A pega incorreta está associada a dificuldade e dor ao amamentar além de dificultar o "
                        "esvaziamento da mama ocasionando a diminuição da produção de leite e"
                        " na dificuldade de ganho de peso do bebê",
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
                        "As alterações mamilares mais comuns são os mamilos planos e "
                        "os invertidos entretanto, essas alterações não impedem as lactantes amamentarem",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Nestes casos, é necessário que o bebê abocanhe o mamilo e parte da aureola de forma que este último se"
                        " \"transforme\" em um bico e assim a ordenha aconteça de forma tranquila, eficiente e sem dor",
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
                        "As alterações orais nas crianças que podem provocar dor durante"
                        " a amamentação geralmente estão relacionadas a disfunções nos freios orais",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A ordenha feita através de bombas de retirada de leite de maneira inadequada também"
                        " pode provocar dores por essa razão é de grande importância a leitura atenta dos manuais que as acompanham",
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
                    title: "Volta ao trabalho",
                    content:
                        "A Volta ao trabalho fora de casa e o retorno a rotina são comumente relacionadas a interrupção da amamentação",
                  ),
                  InfoCardWidget(
                    title: "Você sabia?",
                    content:
                        "Lactantes possuem diversos direitos que protegem e asseguram o direito da amamentação ...",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "E é dever de todos monitorar, fiscalizar e denunciar caso seus direitos sejam descumpridos",
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
                        "Dentre os direitos que asseguram a amamentação, estão...",
                  ),
                  Text("Licença maternidade"),
                  Text(
                      "Garantia do trabalho durante o período de gestação e lactação"),
                  Text("Direito à creche"),
                  Text("Direito a pausas periódicas para amamentar"),
                  Text(
                      "Alojamento conjunto para a lactante e lactente permaneçam juntos em hospitais e maternidades vinculadas ao SUS"),
                  Text(
                      "Normas brasileira que regulamentam a comercialização de alimentos para lactentes e Crianças na primeira Infância, bicos, chupetas e mamadeiras "),
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
                    title: "Mitos/crenças",
                    content: "Os seios ficam muito caídos",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Apenas o leite materno não sustenta",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Em casos de cólicas é necessário dar um chá de coentro ou outro para alívio no bebê",
                  ),
                  InfoCardWidget(
                    title: "",
                    content: "Maisena, leite e chás ajudam a sustentar o bebê",
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
                    title: "Os seios ficam muito caídos",
                    content: "A amamentação não faz os peitos caírem",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "O fator essencial para que o seio da mulher se modifique é o genético",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Se sua mãe tem seios flácidos você também tem maior propensão de ter, independente da amamentação",
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
                    title: "Apenas o leite materno não sustenta",
                    content:
                        "Somente o leite produzido pela mãe é suficiente para a correta nutrição do bebê até os 6 primeiros meses de vida e ...",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A introdução de outros alimentos de forma complementar e substituição total não é recomendada em todos os casos",
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
                        "Em casos de cólicas é necessário dar um chá de coentro ou outro para alívio no bebê.",
                    content:
                        "O Ministério da Saúde adverte aos responsáveis que não se deve fazer o uso de chás no período de amamentação natural, pois é um  fator que leva ao desmame precoce. ",
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
                    title: "Maisena, leite e chás ajudam a sustentar o bebê",
                    content:
                        "Seu bebê não precisa de mingau ou leite. Ele precisa, em primeiro lugar, de leite materno, o principal alimento pra ele até 1 ano de vida.",
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
                'Desmame\n precoce',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            const Spacer(),
            Text(
              '${_currentPage + 1}/15',
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
