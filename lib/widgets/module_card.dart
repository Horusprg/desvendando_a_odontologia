import 'package:flutter/material.dart';
import '../core/theme.dart';

class ModuleCardButtonWidget extends StatefulWidget {
  final String text;
  final String imagePath;
  final Color color;
  final List<String>? subtopics; // Lista de subtópicos (pode ser nula)

  const ModuleCardButtonWidget({
    super.key,
    required this.text,
    required this.imagePath,
    required this.color,
    this.subtopics, // Novo parâmetro opcional
  });

  @override
  State<ModuleCardButtonWidget> createState() => _ModuleCardButtonWidgetState();
}

class _ModuleCardButtonWidgetState extends State<ModuleCardButtonWidget> {
  bool isExpanded = false; // Controla a expansão dos subtópicos

  final Map<String, String> topicToRoute = {
    "Amamentação": "/lesson-amamentacao",
    "Tipos de Aleitamento": "/lesson-tipos-aleitamento",
    "Composição do Leite": "/lesson-composicao-leite",
    "Benefícios do Aleitamento": "/lesson-beneficios-aleitamento",
    "O que é o sistema estomatognático?": "/lesson-estomatognatico",
    "Desenvolvimento da primeira dentição": "/lesson-desenvolvimento-denticao",
    "Anquiloglossia e Fissuras Labiopalatais": "/lesson-anquiloglossia",
    "Saúde Bucal da Mamãe": "/lesson-saude-mamae",
    "Mitos e Crenças sobre Gravidez e Saúde Bucal": "/lesson-mitos",
    "Pré-eclâmpsia": "/lesson-eclampsia",
    "Baixo peso ao nascimento": "/lesson-baixo-peso",
    "Parto prematuro": "/lesson-prematuro",
    "A Importância do Pré-Natal Odontológico": "/lesson-pre-natal",
    "O que é o desmame precoce e quais as suas causas?": "/lesson-desmame",
    "Uso de Chupeta e Mamadeira": "/lesson-chupeta",
    "Tipos de Maloclusão": "/lesson-maloclusao",
    "Respiração Bucal": "/lesson-respiracao-bucal",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card principal
        GestureDetector(
          onTap: () {
            setState(() {
              // Só alterna expansão se houver subtópicos
              if (widget.subtopics != null && widget.subtopics!.isNotEmpty) {
                isExpanded = !isExpanded;
              }
            });
            if (widget.subtopics!.isEmpty) {
              print(widget.text);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: widget.color, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  widget.imagePath,
                  width: MediaQuery.of(context).size.width * 0.25,
                  fit: BoxFit.fitHeight,
                ),
                Expanded(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.1,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: double.infinity,
                  width: 50,
                  color: widget.color,
                  child: (widget.subtopics?.isNotEmpty ?? false)
                      ? AnimatedRotation(
                          duration: const Duration(milliseconds: 100),
                          turns:
                              isExpanded ? 0.25 : 0.0, // 0.25 turns = 90 graus
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                          ),
                        )
                      : const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                        ),
                ),
              ],
            ),
          ),
        ),

        // Área de subtópicos (só aparece se expandido e houver subtópicos)
        if (isExpanded && widget.subtopics?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
            child: Column(
              children: widget.subtopics!.map((subtopic) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: widget.color, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, topicToRoute[subtopic]!);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subtopic,
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: 50,
                            decoration: BoxDecoration(
                              color: widget.color,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
