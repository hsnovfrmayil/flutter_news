import 'package:flutter/material.dart';
import 'package:news_app/pages/home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("News Global"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.network(
                        "https://www.writeups.org/wp-content/uploads/Tintin.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Column(
                  children: const [
                    Text(
                      "HaSanov",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "@hsnovfrmayil",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          gestureDedectorforProfile(titleText: "Check News"),
          gestureDedectorforProfile(titleText: "Favorite News"),
          gestureDedectorforProfile(titleText: "Add News"),
        ],
      ),
    );
  }

  GestureDetector gestureDedectorforProfile({required String titleText}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => const HomePage())));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListTile(
          title: Text(
            titleText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text("All News"),
          leading: const Icon(Icons.abc),
          trailing: const Icon(Icons.newspaper),
        ),
      ),
    );
  }
}
