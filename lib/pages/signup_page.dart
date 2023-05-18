import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _signUpPage();
}

class _signUpPage extends State<SignUpPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Colors.blue,
            Colors.green,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          const SizedBox(height: 50),
          _inputField("UserName", usernamecontroller),
          const SizedBox(height: 30),
          _inputField("Email", emailController),
          const SizedBox(height: 30),
          _inputField("Password", passwordController, isPassword: true),
          const SizedBox(height: 50),
          _loginBtn(),
          const SizedBox(height: 30),
          _extraText(),
        ],
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 120,
      ),
    );
  }

  Widget _inputField(String hint, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white30));
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }).onError((error, stackTrace) {
            debugPrint(error.toString());
          });
        },
        child: const SizedBox(
            width: double.infinity,
            child: Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )));
  }

  Widget _extraText() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: const SizedBox(
            width: double.infinity,
            child: Text(
              "Already a user ?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )));
  }
}
