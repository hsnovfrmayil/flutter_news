import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/pages/person.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String buttonText = "Show News";
  List _items = [];
  List _items2 = [];
  List _items3 = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  Future<void> readJson2() async {
    final String response = await rootBundle.loadString("assets/sport.json");
    final data2 = await json.decode(response);
    setState(() {
      _items2 = data2["items"];
    });
  }

  Future<void> readJson3() async {
    final String response = await rootBundle.loadString("assets/weather.json");
    final data3 = await json.decode(response);
    setState(() {
      _items3 = data3["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.black,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "News",
                  ),
                  Tab(
                    text: "Sport",
                  ),
                  Tab(
                    text: "Weather",
                  ),
                ],
              )),
          body: TabBarView(children: [
            newsScrollView(),
            sportScrollView(),
            weatherScrollView(),
          ])),
    );
  }

  SingleChildScrollView newsScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: (() {
                readJson();
                buttonText = "News";
              }),
              child: Text(
                buttonText,
              )),
          for (int i = 0; i < _items.length; i++) ...{
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => PersonPage(
                          link: _items[i]["src"], txt: _items[i]["extra"]))));
                });
              },
              child: containerwithPage(
                  src: _items[i]["src"], text: _items[i]["text"]),
            )
          },
        ],
      ),
    );
  }

  SingleChildScrollView sportScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: (() {
                readJson2();
                buttonText = "News";
              }),
              child: Text(
                buttonText,
              )),
          for (int i = 0; i < _items2.length; i++) ...{
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => PersonPage(
                          link: _items2[i]["src"], txt: _items2[i]["extra"]))));
                });
              },
              child: containerwithPage(
                  src: _items2[i]["src"], text: _items2[i]["text"]),
            )
          },
        ],
      ),
    );
  }

  SingleChildScrollView weatherScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: (() {
                readJson3();
                buttonText = "News";
              }),
              child: Text(
                buttonText,
              )),
          for (int i = 0; i < _items3.length; i++) ...{
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => PersonPage(
                          link: _items3[i]["src"], txt: _items3[i]["text"]))));
                });
              },
              child: containerwithPage(
                  src: _items3[i]["src"], text: _items3[i]["text"]),
            )
          },
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
