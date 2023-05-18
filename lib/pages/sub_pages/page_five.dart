import 'package:flutter/material.dart';

class page_five extends StatefulWidget {
  const page_five({Key? key}) : super(key: key);

  @override
  State<page_five> createState() => _page_fiveState();
}

class _page_fiveState extends State<page_five> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: _page(),
    );
  }

  Widget _page() {
    return ListView(
      children: <Widget>[
        _card(),
        const SizedBox(height: 20),
        _card(),
        const SizedBox(height: 20),
        _card()
      ],
    );
  }
  Widget _card(){
    return const Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        child: SizedBox(
          width: double.infinity,
          height: 270,
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Image(
                image: NetworkImage("https://i.pinimg.com/564x/0d/68/37/0d68371f7674f2e53a39f09babaafdc8.jpg"),
              ),
              Text("data",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ));
  }
}
