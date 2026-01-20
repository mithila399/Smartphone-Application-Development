import 'package:flutter/material.dart';

class AwarenessPage extends StatelessWidget {
  const AwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text("Environment Awareness"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Protect Our Planet 🌍",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Environmental awareness means understanding the importance of protecting nature and using natural resources responsibly for future generations.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            awarenessCard(
              icon: Icons.delete,
              title: "Reduce Pollution",
              text:
                  "Air, water and soil pollution harm humans, animals and plants. We should reduce waste, avoid plastic and use eco-friendly products.",
            ),

            awarenessCard(
              icon: Icons.local_florist,
              title: "Protect Forests",
              text:
                  "Trees provide oxygen, reduce global warming and support wildlife. Avoid deforestation and plant more trees.",
            ),

            awarenessCard(
              icon: Icons.water_drop,
              title: "Save Water",
              text:
                  "Water is a precious resource. Turn off taps when not in use and avoid wasting clean water.",
            ),

            awarenessCard(
              icon: Icons.energy_savings_leaf,
              title: "Save Energy",
              text:
                  "Use energy-efficient appliances, turn off unused lights and support renewable energy sources like solar power.",
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= CARD WIDGET ================= */

Widget awarenessCard({
  required IconData icon,
  required String title,
  required String text,
}) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.only(bottom: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade100,
            child: Icon(icon, color: Colors.green.shade700),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
