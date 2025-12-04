
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Profile Page"),
      ),

      body: Column(
        children: [
          Container(
            height: 400,
            width: 600,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 255, 68),
              border: Border.all(color: const Color.fromARGB(255, 150, 181, 133),width: 5),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(colors: [const Color.fromARGB(255, 165, 68, 255),const Color.fromARGB(255, 228, 24, 255)])
            ),
            child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Profile Section",
                  style: TextStyle(fontSize: 30),),
                  Image.network("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                  height: 200, width: 200,),
                  Text("Mithila"),
                  SizedBox(),
              ],
            ),
              
            
          ),
          ),

          SizedBox(
            height: 400,
            width: 600,
            child: Card(
              color: Colors.greenAccent,
              child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Card"),
            ),))
        ],
      ),

    );
  }
}