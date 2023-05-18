import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontroller= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.blue
            ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }
  Widget _page(){
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          const SizedBox(height: 50),
          _inputField("UserName", usernamecontroller),
          const SizedBox(height: 30),
          _inputField("Password", passwordController,isPassword: true),
          const SizedBox(height: 50),
          _loginBtn(),
          const SizedBox(height: 30),
          _extraText(),
        ],
      ),
    );
  }
  Widget _icon(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle
      ),
      child: const Icon(Icons.person,color: Colors.white,size: 120,),
    );
  }
  Widget _inputField(String hint, TextEditingController controller,{isPassword = false}){
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.white30)
    );
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
  Widget _loginBtn(){
    return ElevatedButton(
        onPressed: (){
          FirebaseAuth.instance.signInWithEmailAndPassword(email: usernamecontroller.text, password: passwordController.text).then((value) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())
            );
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: const SizedBox(
            width: double.infinity ,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
        )
    );
  }
  Widget _extraText(){
    return ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
        child: const SizedBox(
            width: double.infinity ,
            child: Text(
              "Don't have an Account ?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
        )
    );
  }
}
