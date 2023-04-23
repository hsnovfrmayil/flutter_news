import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  String link;
  String txt;
  PersonPage({super.key, required this.link, required this.txt});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  String src =
      "https://img.traveltriangle.com/blog/wp-content/uploads/2019/01/Mountains-In-New-Zealand-Cover.jpg";
  String text = "Turistlerin en cox diqqetini ceken yerlerin adi aciqlandi";
  @override
  void initState() {
    super.initState();
    src = widget.link;
    text = widget.txt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Global"),
      ),
      body: Column(
        children: [
          Image.network(
            src,
            height: MediaQuery.of(context).size.height / 3,
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.white),
                color: Colors.green,
                borderRadius: BorderRadius.circular(15)),
            height: 150,
            child: const Center(
                child: Text(
              "Burada Sizin Reklaminiz ola biler",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            )),
          )
        ],
      ),
    );
  }
}
