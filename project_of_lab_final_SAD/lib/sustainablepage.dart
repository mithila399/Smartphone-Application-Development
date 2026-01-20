import 'package:flutter/material.dart';

class SustainablePage extends StatelessWidget {
  const SustainablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        title: const Text("Sustainable Lifestyle"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Live Sustainably 🌱",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "A sustainable lifestyle means reducing environmental impact by making responsible choices in daily life to protect the planet for future generations.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            sustainableCard(
              icon: Icons.energy_savings_leaf,
              title: "Save Energy",
              text:
                  "Use energy-efficient appliances, turn off unused lights, and prefer renewable energy sources like solar or wind power.",
            ),

            sustainableCard(
              icon: Icons.restaurant,
              title: "Sustainable Food",
              text:
                  "Choose locally grown food, reduce food waste, and eat more plant-based meals to lower carbon emissions.",
            ),

            sustainableCard(
              icon: Icons.directions_bike,
              title: "Eco-Friendly Transport",
              text:
                  "Walk, cycle, or use public transport whenever possible to reduce air pollution and fuel consumption.",
            ),

            sustainableCard(
              icon: Icons.recycling,
              title: "Reduce Waste",
              text:
                  "Practice reduce, reuse and recycle. Avoid single-use plastics and choose reusable products.",
            ),

            sustainableCard(
              icon: Icons.water_drop,
              title: "Conserve Water",
              text:
                  "Fix leaks, take shorter showers, and reuse water where possible to protect this vital resource.",
            ),

            sustainableCard(
              icon: Icons.shopping_bag,
              title: "Responsible Consumption",
              text:
                  "Buy only what you need, choose eco-friendly products, and support sustainable brands.",
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= CARD WIDGET ================= */

Widget sustainableCard({
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
