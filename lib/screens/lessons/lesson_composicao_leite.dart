import 'package:desvendando_a_odontologia/widgets/info_card.dart';
import 'package:desvendando_a_odontologia/widgets/milk_comparison.dart';
import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../core/typography.dart';

class ComposicaoLeiteLessonScreen extends StatefulWidget {
  const ComposicaoLeiteLessonScreen({super.key});

  @override
  State<ComposicaoLeiteLessonScreen> createState() =>
      _ComposicaoLeiteLessonScreen();
}

class _ComposicaoLeiteLessonScreen extends State<ComposicaoLeiteLessonScreen> {
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
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [MilkComparison()],
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
                    title: "Você sabia???",
                    content:
                        "No primeiro momento do pós-parto a produção do leite é chamado de colostro e possui maior quantidade "
                        "de proteínas e uma menor quantidade de gordura.",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A coloração também é alterada, nos 2-4 primeiros dias o leite se mostra com uma coloração amarela mais forte ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A composição do leite materno de mães de bebês prematuros possui diferenças, "
                        "dentre elas, a maior concentração de calorias, lipídeos e proteínas e "
                        "uma menor concentração de lactose, tanto no colostro quanto no leite maduro.",
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
                        "O leite materno contém 160 substâncias, como proteínas, "
                        "carboidratos, gorduras, vitaminas e células, sendo um alimento essencial"
                        " para um desenvolvimento satisfatório do bebê ...",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Além de possuir numerosos fatores imunológicos que protegem a criança contra infecções enquanto seu sistema imunológico não está completamente formado. ",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "O leite do final da mamada é rico em calorias que dá energia ao bebê além da sensação de saciamento, "
                        "por essa razão, é importante o esvaziamento da mama. ",
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
            Text(
              'Composição do Leite',
              style: AppTypography.typodermic(size: 24),
            ),
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
