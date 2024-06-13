import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/provider/trip_provider.dart';
import 'package:travelapp/travelapp/screens/paymentscreen.dart';

class Latvia extends StatefulWidget {
  const Latvia({Key? key}) : super(key: key);

  @override
  State<Latvia> createState() => _LatviaState();
}

class _LatviaState extends State<Latvia> {
  @override
  Widget build(BuildContext context) {
    var trips = context.watch<TripProvider>().trips;
    var triplist = context.watch<TripProvider>().wishtrip;
    var trip = trips.isNotEmpty ? trips[5] : null; // Get the first trip or null

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: trip == null
          ? Center(child: Text("No trip available"))
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: 'Photo',
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/latvia.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: screenHeight * 0.60,
                          width: screenWidth,
                        ),
                      ),
                      Positioned(
                        top: 45,
                        right: 16,
                        child: IconButton(
                          icon: Icon(
                            triplist.contains(trip)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: triplist.contains(trip)
                                ? Colors.red
                                : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            if (!triplist.contains(trip)) {
                              context.read<TripProvider>().addToList(trip);
                            } else {
                              context.read<TripProvider>().removeFromList(trip);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: const Text(
                      "Latvia, located on the eastern shore of the Baltic Sea, is a Northern European country known for its picturesque landscapes and rich cultural heritage. The capital city, Riga, stands out with its stunning Art Nouveau architecture and a well-preserved medieval old town.",
                      style: TextStyle(
                        fontFamily: "Sora",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      Icon(Icons.punch_clock_sharp, size: screenHeight * 0.03),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        "8am-12am",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.05),
                      Icon(Icons.calendar_month, size: screenHeight * 0.03),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        "Monday-Saturday",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor("E0FAFB"),
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage()),
                        );
                      },
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          fontFamily: "Sora",
                          color: BlackColordark,
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
    );
  }
}
