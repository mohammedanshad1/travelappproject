import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/travelapp/booking/bus_search.dart';
import 'package:travelapp/travelapp/booking/flight_search.dart';
import 'package:travelapp/travelapp/booking/train_searching.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/screens/agra.dart';
import 'package:travelapp/travelapp/screens/amsterdam.dart';
import 'package:travelapp/travelapp/screens/belin.dart';
import 'package:travelapp/travelapp/screens/china.dart';
import 'package:travelapp/travelapp/screens/indonesia.dart';
import 'package:travelapp/travelapp/screens/istanbul.dart';
import 'package:travelapp/travelapp/screens/latvia.dart';
import 'package:travelapp/travelapp/screens/profile_screen.dart';
import 'package:travelapp/travelapp/screens/settings_screen.dart';
import 'package:travelapp/travelapp/screens/turkey.dart';
import 'package:travelapp/travelapp/screens/vietnam_booking.dart';
import 'package:travelapp/travelapp/screens/wishlist.dart';

import 'bangkok.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeContent(),
    WishList(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 25,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red, // Set selected item color to red
        unselectedItemColor: Colors.black, // Set unselected item color to black
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 35,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 35,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 35,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/bangkok.jpg",
      "assets/vietnam.jpg",
      "assets/indonesia.jpg",
      "assets/china.jpg",
      "assets/turkey.jpg",
      "assets/latvia.jpg",
      "assets/india.jpg",
      "assets/amsterdam.jpg",
      "assets/germany.jpg",
      "assets/istanbul.jpg"
    ];

    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 10),
          child: ListTile(
            title: Text(
              "Explore",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: "Sora",
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "explore your world beauty",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/Anshad.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        ),

        // Search field
        Container(
          margin: EdgeInsets.all(20),
          height: 60,
          width: 340,
          decoration: BoxDecoration(
            color: Lightblue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CupertinoSearchTextField(
            backgroundColor: Lightblue,
            prefixIcon: Icon(
              CupertinoIcons.search,
              size: 26,
              color: BlackColor,
            ),
            placeholder: 'Search places',
            placeholderStyle:
                TextStyle(color: BlackColor, fontWeight: FontWeight.bold),
            style: TextStyle(
              color: BlackColor,
            ),
          ),
        ),

        // Icons row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIconContainer(context, Icons.flight),
            buildIconContainer(context, Icons.train),
            buildIconContainer(context, Icons.bus_alert_rounded),
            buildIconContainer(context, Icons.restaurant),
          ],
        ),

        // Grid view
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height *
                0.6, // Adjust the height as needed
            padding: const EdgeInsets.all(15.0),
            child: Hero(
              tag: 'Photo',
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.72,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Bangkok()),
                        );
                      }
                      if (index == 1) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Vietnam()),
                        );
                      }
                      if (index == 2) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Indonesia()),
                        );
                      }
                      if (index == 3) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => China()),
                        );
                      }
                      if (index == 4) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Istanbul()),
                        );
                      }
                      if (index == 5) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Latvia()),
                        );
                      }
                      if (index == 6) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Agra()),
                        );
                      }
                      if (index == 7) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Amsterdam()),
                        );
                      }
                      if (index == 8) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Berlin()),
                        );
                      }
                      if (index == 9) {
                        // If the first image is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Turkey()),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildIconContainer(BuildContext context, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.flight) {
          // If the flight icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FlightSearchScreen()),
          );
        }
        if (icon == Icons.train) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TrainSearchScreen()),
          );
        }
        if (icon == Icons.bus_alert_rounded) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BusSearchScreen()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(15),
        height: 55,
        width: 50,
        decoration: BoxDecoration(
          color: Iconcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
            )
          ],
        ),
      ),
    );
  }

// class FavoriteScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Favorite Screen"),
//     );
//   }
// }

// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Settings Screen"),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Profile Screen"),
//     );
//   }
// }
}
