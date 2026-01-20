import 'package:flutter/material.dart';
import 'package:project_of_lab_final_mithila/addtippage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EcoTipsPage extends StatefulWidget {
  const EcoTipsPage({super.key});

  @override
  State<EcoTipsPage> createState() => _EcoTipsPageState();
}

class _EcoTipsPageState extends State<EcoTipsPage> {
  final SupabaseClient supabase = Supabase.instance.client;
  bool isLoading = true;
  List<Map<String, dynamic>> tips = [];

  /// -------- DEFAULT TIPS (READ ONLY) --------
  final List<Map<String, String>> defaultTips = [
    {
      "title": "Reduce Plastic Use",
      "description":
          "Avoid single-use plastics and use reusable bags and bottles."
    },
    {
      "title": "Save Water",
      "description":
          "Turn off taps when not in use, take short showers, and reuse water."
    },
    {
      "title": "Plant Trees",
      "description":
          "Plant trees to improve air quality and support wildlife."
    },
    {
      "title": "Conserve Energy",
      "description":
          "Use LED bulbs, unplug devices not in use, and try renewable energy sources."
    },
    {
      "title": "Use Public Transport",
      "description":
          "Walk, cycle, or use public transport to reduce carbon emissions."
    },
  ];

  @override
  void initState() {
    super.initState();
    loadTips();
  }

  /// -------- LOAD TIPS --------
  Future<void> loadTips() async {
    setState(() => isLoading = true);

    final data = await supabase
        .from('eco_tips')
        .select('id, title, description')
        .order('id', ascending: false);

    setState(() {
      tips = [
        /// Default tips (id = null)
        ...defaultTips.map((tip) => {
              "id": null,
              "title": tip['title'],
              "description": tip['description'],
            }),

        /// User added tips (id != null)
        ...List<Map<String, dynamic>>.from(data),
      ];
      isLoading = false;
    });
  }

  /// -------- DELETE TIP --------
  Future<void> deleteTip(int id) async {
    await supabase.from('eco_tips').delete().eq('id', id);
    loadTips();
  }

  /// -------- EDIT TIP --------
  void editTip(Map<String, dynamic> tip) {
    final titleController =
        TextEditingController(text: tip['title']);
    final descController =
        TextEditingController(text: tip['description']);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Tip"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              await supabase.from('eco_tips').update({
                'title': titleController.text,
                'description': descController.text,
              }).eq('id', tip['id']);

              Navigator.pop(context);
              loadTips();
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text("Eco Tips"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade700,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTipPage()),
          );
          loadTips();
        },
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tips.length,
              itemBuilder: (context, index) {
                final tip = tips[index];

                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                tip['title'] ?? '',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            /// ✅ ONLY USER-ADDED TIPS CAN EDIT/DELETE
                            if (tip['id'] != null) ...[
                              IconButton(
                                icon: const Icon(Icons.edit,
                                    color: Colors.green),
                                onPressed: () => editTip(tip),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red),
                                onPressed: () => deleteTip(tip['id']),
                              ),
                            ]
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tip['description'] ?? '',
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
