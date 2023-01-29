import 'package:flutter/material.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [
    Container(
      child: Text("Aaaaaaaaaaaaaaa"),
    ),
    Container(),
    Container(),
  ];
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.card_membership), label: "Api"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_membership), label: "Download"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_membership), label: "Card"),
          ]),
    );
  }
}
