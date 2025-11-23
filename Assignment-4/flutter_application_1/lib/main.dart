import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(131, 16, 101, 229),
        title: const Text(
          "Homepage",
          style: TextStyle(
            color: Color.fromARGB(255, 22, 246, 242),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search), // 🔍 Added Search icon
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 234, 19, 19),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("Mithila"),
              accountEmail: Text("mithila399@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("P", style: TextStyle(fontSize: 24)),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 53, 121, 239),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.video_call),
              title: Text("Photos"),
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Videos"),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text("Contact"),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Welcome to my App!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 53, 121, 239),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 🔍 Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search something...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Profile Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const ListTile(
                  leading: Icon(Icons.person, color: Colors.blueAccent),
                  title: Text("Profile"),
                  subtitle: Text("View and edit your profile"),
                ),
              ),

              const SizedBox(height: 15),

              // 🔹 Meetings Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const ListTile(
                  leading: Icon(Icons.video_call, color: Colors.greenAccent),
                  title: Text("Photos"),
                  subtitle: Text("Check daily photos"),
                ),
              ),

              const SizedBox(height: 15),

              // 🔹 Daily Routine Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const ListTile(
                  leading: Icon(Icons.calendar_month,
                      color: Colors.amberAccent),
                  title: Text("Videos"),
                  subtitle: Text("View your daily videos"),
                ),
              ),

              const SizedBox(height: 15),

              // 🔹 Contact Info Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const ListTile(
                  leading: Icon(Icons.contact_mail, color: Colors.pinkAccent),
                  title: Text("Contact"),
                  subtitle: Text("Get in touch or send feedback"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}