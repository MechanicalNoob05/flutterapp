// ignore_for_file: camel_case_types

import 'package:demo/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class page_one extends StatefulWidget {
  @override
  State<page_one> createState() => _page_oneState();
}

class _page_oneState extends State<page_one> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text("Logout"),
      onPressed: () {
        FirebaseAuth.instance.signOut().then((value) {

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });
      },
    ));
  }
}
