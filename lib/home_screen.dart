import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key,
    required this.userName,
    required this.userLastName,
    required this.userMotherLastName,
    required this.userPhone,
    required this.userEmail,
    required this.userAge
  });

  final String userName;
  final String userLastName;
  final String userMotherLastName;
  final String userPhone;
  final String userEmail;
  final String userAge;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  clearData() async {
    final SharedPreferences prefs = await _prefs;
    //prefs.clear
    prefs.remove("email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information Page",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
              child: Text(
                "Information Page",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              )),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome ${widget.userName} ${widget.userLastName} ${widget.userMotherLastName}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your phone is ${widget.userPhone} ",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your email is ${widget.userEmail} ",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your age is ${widget.userAge} ",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 150.0, right: 150.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  clearData();
                },
                child: const Text(
                  "Back",
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ],
      ),
    );
  }
}
