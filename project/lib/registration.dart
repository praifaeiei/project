import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(""),
      ),
      body: _page(context),
    );
  }

  Widget _page(BuildContext context) {
    return Container(
      color: Colors.white, 
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              _icon(),
              SizedBox(height: 50),
              _inputField(context, "User name", usernameController),
              SizedBox(height: 20),
              _inputField(context, "Email", emailController),
              SizedBox(height: 20),
              _inputField(context, "Password", passwordController, isPassword: true),
              SizedBox(height: 50),
              _registerBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 14, 13, 13), width: 2),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.person_add, color: const Color.fromARGB(255, 10, 10, 10), size: 120),
    );
  }

  Widget _inputField(BuildContext context, String hintText, TextEditingController controller, {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Color.fromARGB(255, 8, 8, 8)),
    );

    return TextField(
      controller: controller,
      style: const TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _registerBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_validateInput(context)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('สมัครสำเร็จ'),
            ),
          );
          Navigator.pop(context);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Register",
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

  bool _validateInput(BuildContext context) {
    if (usernameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all information'),
        ),
      );
      return false;
    }
    return true;
  }
}
