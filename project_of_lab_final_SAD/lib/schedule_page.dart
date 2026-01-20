import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  // Sample weekly eco schedule
  final List<Map<String, String>> weeklySchedule = const [
    {
      "day": "Monday",
      "activity": "Pick up trash in your neighborhood 🗑️"
    },
    {
      "day": "Tuesday",
      "activity": "Plant a tree or water plants 🌱"
    },
    {
      "day": "Wednesday",
      "activity": "Use public transport or cycle 🚴‍♂️"
    },
    {
      "day": "Thursday",
      "activity": "Save water & electricity 💧⚡"
    },
    {
      "day": "Friday",
      "activity": "Avoid single-use plastics ♻️"
    },
    {
      "day": "Saturday",
      "activity": "Learn about eco-friendly products 📚"
    },
    {
      "day": "Sunday",
      "activity": "Spend time in nature & relax 🌳"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text("Weekly Eco Schedule"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: weeklySchedule.length,
        itemBuilder: (context, index) {
          final daySchedule = weeklySchedule[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 12, horizontal: 16),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade700,
                child: Text(
                  daySchedule['day']![0], // first letter of day
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                daySchedule['day']!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                daySchedule['activity']!,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          );
        },
      ),
    );
  }
}
