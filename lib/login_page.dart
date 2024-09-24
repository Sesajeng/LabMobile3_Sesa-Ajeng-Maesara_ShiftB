import 'package:flutter/material.dart';
import 'package:pertemuan3_aplikasi/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(controller, placeholder, isPassword, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue[900]),
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.blue.shade900, width: 2.0),
          ),
        ),
      ),
    );
  }

  _showDialog(String message, Widget nextPage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nextPage,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF42A5F5), Color(0xFF1565C0)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 20),
                  const Text(
                    'Welcome Volunteer!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Log in the access your dashboard!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _showInput(_usernameController, 'Username', false, Icons.person),
                  _showInput(_passwordController, 'Password', true, Icons.lock),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_usernameController.text == 'SesaAjeng' &&
                          _passwordController.text == 'sesa12345') {
                        _saveUsername();
                        _showDialog('Login Berhasil', const HomePage());
                      } else {
                        _showDialog('Username atau Password Salah', const LoginPage());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80.0,
                        vertical: 15.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5.0,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password logic
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white70),
                    ),
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
