//Converter Page
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Input_Field.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String name = "";
  String? nameError;
  String? passError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Converter"),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SizedBox(
          height: 350,
          width: 320,
          child: Card(
            color: const Color.fromARGB(255, 77, 91, 107),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: nameError,
                      hintText: "Write Name",
                      labelText: "Name",
                      prefixIcon: const Icon(Icons.person),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PASSWORD FIELD (Custom Widget)
                  Input_Field(
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    hint: "Enter Password",
                    label: "Password",
                    icon: Icons.lock,
                    errorText: passError,
                  ),

                  const SizedBox(height: 20),

                  // BUTTON
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nameError = null;
                        passError = null;

                        if (nameController.text.isEmpty) {
                          nameError = "Name field is empty";
                        }

                        if (passController.text.isEmpty) {
                          passError = "Password field is empty";
                        }

                        if (nameError == null && passError == null) {
                          name = nameController.text;
                        }
                      });
                    },
                    child: const Text("Submit"),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Name is: $name",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}