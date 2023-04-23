import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String apiText = "Hello";
  String text = "Hello";
  String buttonText = "Show News";
  List _itemsMain = [];
  List _itemsMain2 = [];
  Future<void> readJsonMain() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final data = await json.decode(response);
    setState(() {
      _itemsMain = data["items"];
    });
  }

  Future<void> readJsonMain2() async {
    final String response = await rootBundle.loadString("assets/sport.json");
    final data = await json.decode(response);
    setState(() {
      _itemsMain2 = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("News Global"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    text = value.trim().toLowerCase();
                  });
                },
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, minWidth: 25),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: (() {
                readJsonMain();
                readJsonMain2();
                buttonText = "News";
              }),
              child: Text(
                buttonText,
              )),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < _itemsMain.length; i++) ...{
                    if (_itemsMain[i]["text"]
                        .toString()
                        .trim()
                        .toLowerCase()
                        .contains(text)) ...[
                      containerwithPage(
                          src: _itemsMain[i]["src"],
                          text: _itemsMain[i]["text"]),
                    ],
                  },
                  for (int j = 0; j < _itemsMain2.length; j++) ...{
                    if (_itemsMain2[j]["text"]
                        .toString()
                        .trim()
                        .toLowerCase()
                        .contains(text)) ...[
                      containerwithPage(
                          src: _itemsMain2[j]["src"],
                          text: _itemsMain2[j]["text"]),
                    ]
                  }
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container containerwithPage(
      {required String src, required String text, double height = 200}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Image.network(
              src,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
