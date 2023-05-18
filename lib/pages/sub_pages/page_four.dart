import 'package:flutter/material.dart';

class page_four extends StatefulWidget {
  const page_four({Key? key}) : super(key: key);

  @override
  State<page_four> createState() => _page_fourState();
}

class _page_fourState extends State<page_four> {
  @override
  Widget build(BuildContext context) {
    return _page();
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _greeting(),
          const SizedBox(height: 50),
          _charts(),
          const SizedBox(height: 50),
          _add_button()
        ],
      ),
    );
  }

  Widget _greeting() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your cycle history, \nat a glance',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "data",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Image(
          height: 100,
          width: 100,
          image: NetworkImage(
              "https://i.pinimg.com/564x/cf/3a/85/cf3a85903da41b00c7baae08c508e9e5.jpg"),
        ),
      ],
    );
  }

  Widget _charts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _card(),
        _card(),
        _card()
      ],
    );
  }

  Widget _card() {
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      child: const SizedBox(
        width: 110,
        height: 200,

        child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('A card that can be tapped')
              ],
            ),
        ),
      ),
    ));
  }
  Widget _add_button(){
    return Container(
      child: ElevatedButton(
        onPressed: (){

          debugPrint("Username");
        },
        child: Text("Add +"),
      ),
    );
  }
}
