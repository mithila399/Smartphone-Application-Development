import 'package:flutter/material.dart';
import 'package:project_of_lab_final_mithila/awarnesspage.dart';
import 'package:project_of_lab_final_mithila/ecotipspage.dart';
import 'package:project_of_lab_final_mithila/sustainablepage.dart';
import 'schedule_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        title: const Text(
          "Eco Life",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            // Big Profile Button
            profileButton(context, page: const ProfilePage()),

            const SizedBox(height: 30),

            // Vertical Buttons
            ecoButton(
                context,
                title: "Awareness",
                icon: Icons.public,
                color: Colors.green,
                page: const AwarenessPage()),
            const SizedBox(height: 12),
            ecoButton(
                context,
                title: "Eco Tips",
                icon: Icons.recycling,
                color: Colors.lightGreen,
                page: const EcoTipsPage()),
            const SizedBox(height: 12),
            ecoButton(
                context,
                title: "Sustainable",
                icon: Icons.eco,
                color: Colors.teal,
                page: const SustainablePage()),
            const SizedBox(height: 12),
            ecoButton(
                context,
                title: "Schedule",
                icon: Icons.calendar_today,
                color: Colors.green.shade600,
                page: const SchedulePage()),
          ],
        ),
      ),
    );
  }
}

/* -------- BIG PROFILE BUTTON -------- */
Widget profileButton(BuildContext context, {required Widget page}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green.shade700,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.person, size: 60, color: Colors.white),
        SizedBox(height: 10),
        Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    ),
  );
}

/* -------- REGULAR VERTICAL ECO BUTTON -------- */
Widget ecoButton(
  BuildContext context, {
  required String title,
  required IconData icon,
  required Color color,
  required Widget page,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: color, width: 2)),
      elevation: 3,
    ),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    },
    child: Row(
      children: [
        Icon(icon, size: 30, color: color),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    ),
  );
}
