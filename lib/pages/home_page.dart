import 'package:demo/pages/login_page.dart';
import 'package:demo/pages/sub_pages/page_five.dart';
import 'package:demo/pages/sub_pages/page_four.dart';
import 'package:demo/pages/sub_pages/page_one.dart';
import 'package:demo/pages/sub_pages/page_three.dart';
import 'package:demo/pages/sub_pages/page_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override

  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final tabs = [
    page_one(),
    page_two(),
    page_three(),
    page_four(),
    page_five(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment App'),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            if(FirebaseAuth.instance.currentUser! == null){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            }
            else{

            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Cycle',
            icon: Icon(Icons.cyclone),
          ),
          BottomNavigationBarItem(
            label: 'Calender',
            icon: Icon(Icons.calendar_month_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Track',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Analysis',
            icon: Icon(Icons.notes_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Content',
            icon: Icon(Icons.book_rounded),
          ),
        ],

      ),
    );
  }
}