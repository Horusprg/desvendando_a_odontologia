import 'package:desvendando_a_odontologia/widgets/info_card.dart';
import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../core/typography.dart';

class DenticaoLessonScreen extends StatefulWidget {
  const DenticaoLessonScreen({super.key});

  @override
  State<DenticaoLessonScreen> createState() => _DenticaoLessonScreen();
}

class _DenticaoLessonScreen extends State<DenticaoLessonScreen> {
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
                    title: "Desenvolvimento da primeira dentição",
                    content:
                        "O processo de deglutição na amamentação, pelo exercício da musculatura, "
                        "respiração influência no correto crescimento facial, permite o desenvolvimento satisfatório da primeira dentição",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "A chamada dentição decídua ou popularmente conhecida como"
                        " \"dentes de leite\", que começa a ocorrer por volta dos 6 meses",
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
                    title: "Desenvolvimento da musculatura facial",
                    content:
                        "A amamentação é capaz de harmonizar todo o sistema estomatognático. ",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "Quando a criança é amamentada ela está realizando um exercício físico importante para desenvolver a musculatura bucal e perioral.",
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
                    title: "Recapitulando",
                    content: "A sucção proveniente da amamentação promove:",
                  ),
                  InfoCardWidget(
                    title: "",
                    content:
                        "O crescimento, desenvolvimento ósseo e influenciam no formato da face e na harmonia da arcada dentária.",
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
            Spacer(),
            Wrap(children: [
              Text(
                'Primeira dentição',
                overflow: TextOverflow.visible,
                maxLines: 2,
                softWrap: true,
                style: AppTypography.typodermic(size: 24),
              )
            ]),
            Spacer(),
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
