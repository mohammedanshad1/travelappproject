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
    var trip = trips.isNotEmpty ? trips[5] : null;

    return Scaffold(
      body: trip == null
          ? Center(child: Text("No trip available"))
          : Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/latvia.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 450,
                  width: 400,
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: Icon(
                      triplist.contains(trip)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color:
                          triplist.contains(trip) ? Colors.red : Colors.white,
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
                Container(
                  padding: const EdgeInsets.only(top: 470, left: 10),
                  decoration: BoxDecoration(
                    // color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  child: const Text(
                    "Bangkok, the vibrant capital of Thailand is bustling metropolis renowned for its ornate temples, bustling street markets, and dynamic nightlife. Home to iconic landmarks such as the Grand Palace, Wat Arun, and the floating markets.",
                    style: TextStyle(
                      //  color: BlackColordark,
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 600, left: 10),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: const Row(
                      children: [
                        Icon(Icons.punch_clock_sharp),
                        Text(
                          "8am-12am",
                          style: TextStyle(fontFamily: "Sora"),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 630, left: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text(
                        "Monday-Saturday",
                        style: TextStyle(fontFamily: "Sora"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 670, left: 30),
                  child: Container(
                    height: 60, // Set the height as desired
                    width: 290, // Set the width as desired
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor("E0FAFB"),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20), // Adjust padding as needed
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()));
                      },
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          fontFamily: "Sora",
                          color: BlackColordark,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
