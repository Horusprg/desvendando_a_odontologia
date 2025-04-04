import 'package:flutter/material.dart';

class MilkComparison extends StatelessWidget {
  const MilkComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMilkColumn(
            "Colostro",
            // "assets/colostro.png",
            "48 Calorias\n(kcal/dL)",
            "1,8 Lipídios\n(g/dL)",
            "1,9 Proteínas\n(g/dL)",
            "5,1 Lactose\n(g/dL)",
          ),
          _buildMilkColumn(
            "Leite maduro",
            // "assets/leite_maduro.png",
            "62 Calorias\n(kcal/dL)",
            "3,0 Lipídios\n(g/dL)",
            "1,3 Proteínas\n(g/dL)",
            "6,1 Lactose\n(g/dL)",
          ),
          _buildMilkColumn(
            "Leite de vaca",
            // "assets/leite_vaca.png",
            "69 Calorias\n(kcal/dL)",
            "3,7 Lipídios\n(g/dL)",
            "3,3 Proteínas\n(g/dL)",
            "4,8 Lactose\n(g/dL)",
          ),
        ],
      ),
    );
  }

  Widget _buildMilkColumn(
      String title, String cal, String fat, String protein, String lactose) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.pink,
          ),
        ),
        const SizedBox(height: 8),
        // Image.asset(imagePath, height: 80),
        const SizedBox(height: 8),
        _buildInfoBox(cal),
        _buildInfoBox(fat),
        _buildInfoBox(protein),
        _buildInfoBox(lactose),
      ],
    );
  }

  Widget _buildInfoBox(String text) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
