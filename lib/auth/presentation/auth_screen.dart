import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/home_screen.dart';
import '../domain/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthController controller = AuthController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  String error = '';

  void showError(String message) {
    setState(() {
      error = message;
    });
  }

  void goToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Future<void> handleLogin() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      return showError('Email dan password wajib diisi');
    }

    try {
      await controller.login(
        emailController.text,
        passController.text,
      );
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getString('token') != null) {
        goToHome();
      } else {
        showError('Login gagal. Token tidak ditemukan.');
      }
    } catch (e) {
      showError('Login error: $e');
    }
  }

  Future<void> handleRegister() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passController.text.isEmpty) {
      return showError('Semua field wajib diisi');
    }

    try {
      await controller.register(
        nameController.text,
        emailController.text,
        passController.text,
      );
      showError('Registrasi berhasil. Silakan login.');
    } catch (e) {
      showError('Register error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login/Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (error.isNotEmpty)
              Text(error, style: const TextStyle(color: Colors.red)),
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(labelText: 'Name (untuk Register)'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: handleRegister, child: const Text('Register')),
            ElevatedButton(onPressed: handleLogin, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
