import 'package:flutter/material.dart';
import 'package:project/one.dart'; 
import 'registration.dart'; 

class login extends StatefulWidget {
  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static const String correctUsername = "thanyp";
  static const String correctPassword = "080646";
  

  bool _validateInput(BuildContext context) {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all information'),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(""),
      ),
      body: _page(),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("Username", usernameController),
            const SizedBox(height: 20),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),
            const SizedBox(height: 20),
            _registerBtn(), 
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(162, 12, 12, 12), width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Color.fromARGB(255, 8, 8, 8), size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Color.fromARGB(255, 7, 7, 7)),
    );

    return TextField(
      style: const TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        if (_validateInput(context)) {
          _login(context);
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromARGB(137, 226, 38, 154), 
        backgroundColor: Colors.white, 
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _registerBtn() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationPage()), 
        );
      },
      child: const Text(
        "Don't have an account? Register ",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 12, 12, 12)),
      ),
    );
  }

  // ฟังก์ชันตรวจสอบการเข้าสู่ระบบ
  void _login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    // เช็คความถูกต้องของชื่อผู้ใช้และรหัสผ่าน
    if (username != correctUsername || password != correctPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect email or password'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => one()), 
    );
  }
}
