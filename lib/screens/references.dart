import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../core/theme.dart';

class ReferencesScreen extends StatefulWidget {
  const ReferencesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReferencesState();
  }
}

class _ReferencesState extends State<ReferencesScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColors.lightBlue,
            ),
          ),
          Positioned(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: screenHeight * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .2),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Referências',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.background),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(16),
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          child: Text(
                            """
ANDRADE, H. S.; PESSOA, R. A.; DONIZETE, L. C. V. Fatores relacionados ao desmame precoce do aleitamento materno. Revista Brasileira de Medicina de Família e Comunidade, v. 13, n. 40, p. 1–11, 11 jun. 2018.
BATISTA, L. R. V.; TRICHES, T. C.; MOREIRA, E. A. M. Desenvolvimento bucal e aleitamento materno em crianças com fissura labiopalatal. Revista Paulista de Pediatria, v. 29, p. 674–679, dez. 2011.
BECKERS, Kalie F. et al. Maternal microbiome and the hypertensive disorder of pregnancy, preeclampsia. American Journal of Physiology-Heart and Circulatory Physiology, v. 318, n. 1, p. 1-10, 1 jan. 2020. Disponível em: <http://dx.doi.org/10.1152/ajpheart.00469.2019>.
BOBETSIS, Yiorgos A. et al. Periodontal disease and adverse pregnancy outcomes. Periodontology 2000, v. 83, n. 1, p. 154–174, 2020.
BRASIL. Ministério da Saúde. 17/11 – Dia Mundial da Prematuridade: Separação Zero. Aja Agora! Mantenha pais e bebês prematuros juntos. Biblioteca Virtual em Saúde do Ministério da Saúde. Disponível em: <https://bvsms.saude.gov.br/17-11-dia-mundial-da-prematuridade-separacao-zero-aja-agora-mantenha-pais-e-bebes-prematuros-juntos/>. Acesso em: 20 nov. 2024.
BRASIL. Ministério da Saúde. Pequenas ações, grande impacto: contato pele a pele imediato para todos os bebês, em todos os lugares – 17/11 Dia Mundial da Prematuridade. Biblioteca Virtual em Saúde do Ministério da Saúde. Disponível em: <https://bvsms.saude.gov.br/pequenas-acoes-grande-impacto-contato-pele-a-pele-imediato-para-todos-os-bebes-em-todos-os-lugares-17-11-dia-mundial-da-prematuridade/>. Acesso em: 20 nov. 2024.
BRASIL. Ministério da Saúde. Pré-eclâmpsia/Eclâmpsia. Biblioteca Virtual em Saúde do Ministério da Saúde. Disponível em: <https://bvsms.saude.gov.br/pre-eclampsia-eclampsia/>. Acesso em: 23 nov. 2024.
BUI, Fiona Q. et al. Association between periodontal pathogens and systemic disease. Biomedical Journal, v. 42, n. 1, p. 27–35, 2019.
DDALMASO, M. S.; BONAMIGO, A. W. A pesquisa on-line sobre amamentação: entre o senso comum e a OMS na era digital. Revista Eletrônica de Comunicação, Informação e Inovação em Saúde, v. 13, n. 4, 20 dez. 2019.
DEGASPERI, Jeniffer Urbano; DIAS, Anna Julia Wunsch; BOLETA-CERANTO, Daniela de Cassia Faglioni. Alterações orais e sistêmicas decorrentes da gestação e a importância do pré-natal médico e odontológico para redução das complicações gestacionais. Research, Society and Development, v. 10, n. 3, p. e8810312976–e8810312976, 2021.
GALVÃO, H. M. S. P. A influência do aleitamento materno no desenvolvimento do sistema estomatognático. 9 jul. 2020.
GOMES, C. F. et al. Surface electromyography of facial muscles during natural and artificial feeding of infants. Jornal de Pediatria, v. 82, p. 103–109, abr. 2006.
GÜRSOY, Mervi et al. Clinical changes in periodontium during pregnancy and post‐partum. Journal of Clinical Periodontology, v. 35, n. 7, p. 576–583, 2008.
HEGDE, R.; AWAN, K. H. Effects of periodontal disease on systemic health. Disease-a-Month, v. 65, n. 6, Oral Health Special Issue, p. 185–192, 2019.
JAFRI, Zeba et al. Influence of female sex hormones on periodontium: A case series. Journal of Natural Science, Biology, and Medicine, v. 6, n. Suppl 1, p. S146–S149, 2015.
JÚNIOR, R. P.; NOMURA, M. L.; POLITANO, G. T. Doença periodontal e complicações obstétricas: há relação de risco? *RBGO Gynecology & Obstetrics*, v. 29, n. 7, 1 jul. 2007.
KAMALABADI, Yasaman Mohammadi et al. Unfavourable beliefs about oral health and safety of dental care during pregnancy: a systematic review. BMC Oral Health, v. 23, n. 1, p. 762, 2023.
KARIMI, Newsha; SAMIEE, Negin; MORADI, Yousef. The association between periodontal disease and risk of adverse maternal or neonatal outcomes: A systematic review and meta‐analysis of analytical observational studies. Health Science Reports, v. 6, n. 10, p. e1630, 2023.
LAURETTA, R. et al. Gender in Endocrine Diseases: Role of Sex Gonadal Hormones. International Journal of Endocrinology, v. 2018, p. 4847376, 2018.
LE, Quynh-Anh et al. Periodontitis and Preeclampsia in Pregnancy: a systematic review and meta-analysis. Maternal and Child Health Journal, v. 26, n. 12, p. 2419-2443, 8 out. 2022. Disponível em: <http://dx.doi.org/10.1007/s10995-022-03556-6>.
LOPEZ, Teresinha SP; MOURA, Lúcia FAD; LIMA, Maria CMP. Association between breastfeeding and breathing pattern in children: a sectional study. Jornal de Pediatria, v. 90, p. 396-402, 2014.
MACIEL, A. P. F. et al. Experiências e dificuldades das primíparas na amamentação. Research, Society and Development, v. 11, n. 7, p. e6911729028–e6911729028, 15 maio 2022.
MACIEL, Y. L.; SOBRINHO, A. R. DA S.; MEDRADO, J. DE G. B. Influência da anquiloglossia neonatal no aleitamento materno: revisão de literatura. Archives of Health Investigation, v. 10, n. 6, p. 992–995, 21 jun. 2021.
MARKOU, Eleni et al. The influence of periodontal disease on adverse pregnancy outcomes: A systematic review and meta-analysis. Journal of Periodontology, v. 94, n. 4, p. 406-421, 2023.
MARTINS, J. P. et al. Frequência e intensidade de dor durante a amamentação em puérperas e suas consequências para o desmame. Revista Brasileira de Ginecologia e Obstetrícia, v. 42, n. 1, p. 16–21, 2020.
MATSUBARA, Ana Silvério; DEMETRIO, Aline Tieme Watanabe. Atendimento odontológico às gestantes: revisão da literatura. Uningá Review, v. 29, n. 2, p. 97–104, 2017.
MILHEM, R.; SANTOS, A. C.; LIMA, E. F. P. Fatores de risco para a ocorrência de fissura labiopalatina e impacto na saúde bucal da criança. Revista Brasileira de Cirurgia Plástica, v. 27, n. 3, p. 419–424, 2012.
MOREIRA, Carolina de C.; SILVA, J. A.; BARROS, F. C. R. Influência da alimentação no desenvolvimento do sistema estomatognático e na saúde geral da criança. Journal of Pediatric Dentistry, v. 42, n. 3, p. 24-32, 2018.
OLIVEIRA, R. S.; CORDEIRO, M. M.; FERREIRA, S. A. Aspectos da saúde bucal e sua influência na gestação. Jornal Brasileiro de Odontologia, v. 21, n. 4, p. 20–27, 2020.
QUAL ANTIBIÓTICO E ANTI-INFLAMATÓRIO DE ESCOLHA PARA CASOS DE INFECÇÃO DENTÁRIA EM PACIENTES GESTANTES. Portal Biblioteca Virtual em Saúde - Atenção Primária à Saúde. Disponível em: https://aps-repo.bvs.br/aps/qual-antibiotico-e-anti-inflamatorio-de-eleicao-para-casos-de-infeccao-dentaria-em-pacientes-gestantes/. Acesso em: 7 Jan. 2024.
RIBEIRO, S. S. et al. Associação entre as condições de saúde bucal da gestante e o desenvolvimento de fissura labiopalatina em crianças. Revista Brasileira de Odontopediatria, v. 12, n. 1, p. 55–63, 2021.
RIVERA, J. et al. Periodontal disease and preterm birth: a systematic review and meta-analysis. Journal of Clinical Periodontology, v. 38, n. 10, p. 938–945, 2011.
SAMPAIO, S. S. et al. Estudo dos efeitos da amamentação no desenvolvimento das arcadas dentárias das crianças. Revista de Odontologia da Universidade de São Paulo, v. 30, n. 1, p. 45–51, 2020.
TAVARES, R. S. et al. O impacto do aleitamento materno no desenvolvimento do sistema estomatognático: uma revisão. Revista Brasileira de Odontologia Pediátrica, v. 11, n. 1, p. 1–10, 2022.
TINER, B. C. et al. O papel da saúde bucal na gestação e seu impacto nas condições neonatais. Periodontology, v. 54, n. 6, p. 788–795, 2021.
WAGNER, L. et al. Impacto da dieta na saúde periodontal durante a gravidez. Journal of Periodontal Research, v. 53, n. 6, p. 741–749, 2018.
ZANON, R. D.; SILVA, J. R.; PEREIRA, R. T. Estratégias de suporte para amamentação: revisões e novas abordagens. Revista de Saúde Pública, v. 54, n. 1, p. 111–119, 2021.
                            """, // Seu texto completo aqui
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
