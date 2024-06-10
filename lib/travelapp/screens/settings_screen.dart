import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/travelapp/constants/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Redcolor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: WhiteColor,
            ),
            onPressed: () {
              // Handle back action
            },
          ),
          title: Text(
            'Settings',
            style: TextStyle(
                color: WhiteColor,
                fontSize: 20,
                fontFamily: "Sora",
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  //   shadowColor: BlackColor,
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "Account",
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "Privacy",
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.privacy_tip),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "Language",
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.language),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "Country",
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.satellite_alt),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "Theme",
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.display_settings),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.logout),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
