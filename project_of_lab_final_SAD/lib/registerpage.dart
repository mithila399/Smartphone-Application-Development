import 'package:flutter/material.dart';
import 'package:project_of_lab_final_mithila/inputfield.dart';
import 'package:project_of_lab_final_mithila/homepage.dart';
import 'package:project_of_lab_final_mithila/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  bool _isLoading = false;

  final _supabase = Supabase.instance.client;

  void register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authResponse = await _supabase.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final user = authResponse.user;
      if (user != null) {
        // Save extra user info in profiles table
        await _supabase.from('profiles').insert({
          'id': user.id, // Link to auth.users
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registered Successfully!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );

        // Clear fields
        _nameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _cPasswordController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authResponse.error?.message ?? 'Registration failed')),
        );
      }
    } on AuthApiException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unexpected error: $e')));
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            elevation: 5,
            color: Colors.blueGrey[100],
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Register Form", style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),

                    InputField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      label: "Name",
                      hint: "Enter Name",
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Enter name";
                        if (!RegExp(r'^[a-zA-Z \.]+$').hasMatch(value)) return "Enter valid name";
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    InputField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: "Email",
                      hint: "Enter Email",
                      icon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Enter email";
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    InputField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      hint: "Enter Password",
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Enter password";
                        if (value.length < 8) return "Password too short";
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    InputField(
                      controller: _cPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      label: "Confirm Password",
                      hint: "Confirm Password",
                      icon: Icons.lock,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Enter confirm password";
                        if (value != _passwordController.text) return "Passwords do not match";
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: register,
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Register"),
                    ),
                    const SizedBox(height: 15),

                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      ),
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on AuthResponse {
  get error => null;
}
