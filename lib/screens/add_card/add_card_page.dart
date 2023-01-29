import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_competition/data/models/colors_model.dart';
import 'package:flutter_competition/screens/widgets/add_card_textfield.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  int colorIndex = 0;
  String number = "";
  String expireDate = "";
  String cardName = "";
  String owner = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Card Page")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          ColorModel.colors[colorIndex].colorA,
                          ColorModel.colors[colorIndex].colorB
                        ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Shaxsiy",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          number,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          expireDate,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          cardName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          owner,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 50,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 8);
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: ColorModel.colors.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            setState(() {
                              colorIndex = index;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(colors: [
                                  ColorModel.colors[index].colorA,
                                  ColorModel.colors[index].colorB
                                ])),
                          ),
                        );
                      },
                    ),
                  ),
                  AddCardTextfield(
                    txtType: TextInputType.number,
                    name: "Karta raqami",
                    hintText: "0000 0000 0000 0000",
                    onChanged: (value) {
                      setState(() {
                        if (value.toString().length % 4 == 0) {
                          number = number + " ";
                        }
                        number = value;
                      });
                    },
                  ),
                  AddCardTextfield(
                    txtType: TextInputType.number,
                    name: "Amal qilish muddati",
                    hintText: "00/00",
                    onChanged: (value) {
                      expireDate = value;
                      setState(() {});
                    },
                  ),
                  AddCardTextfield(
                    txtType: TextInputType.text,
                    name: "Karta nomi",
                    hintText: "My Card",
                    onChanged: (value) {
                      cardName = value;
                      setState(() {});
                    },
                  ),
                  AddCardTextfield(
                    txtType: TextInputType.text,
                    name: "Karta egasi to'liq ism sharifi",
                    hintText: "Palonchiyev Pistonchi",
                    onChanged: (value) {
                      owner = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          )),
          Container(
            height: 55,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(24)),
            child: const Center(
              child: Text(
                "Add Card",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
