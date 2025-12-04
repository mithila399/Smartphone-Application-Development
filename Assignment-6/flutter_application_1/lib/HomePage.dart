//mithila
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        title: const Text("Home Page"),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.settings)),
          IconButton(onPressed: null, icon: Icon(Icons.notifications)),
        ],
      ),

      drawer: NavigationDrawer(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              accountName: const Text("Student Name"),
              accountEmail: const Text("student@email.com"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {},
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Web image only
            Center(
              child: Image.network(
                "https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp",
                width: 350,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Icon(Icons.star, size: 40, color: Colors.amber),
                    SizedBox(height: 5),
                    Text(
                      "Column 1",
                      style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 154, 112, 112)),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  children: const [
                    Icon(Icons.favorite, size: 40, color: Colors.pinkAccent),
                    SizedBox(height: 5),
                    Text(
                      "Column 2",
                      style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 147, 112, 112)),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Hello, Everyone!",
              style: TextStyle(fontSize: 40, color: Colors.deepPurple),
            ),

            const Text(
              "Learning Flutter",
              style: TextStyle(fontSize: 35, color: Colors.deepPurple),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 85, 133, 149),
                fixedSize: const Size(160, 60),
              ),
              child: const Text("Enter", style: TextStyle(fontSize: 20)),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}