import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/provider/trip_provider.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    var wishlist = context.watch<TripProvider>().wishtrip;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: WhiteColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Redcolor,
        title: Text(
          "My Favourites (${wishlist.length})",
          style: TextStyle(
            fontFamily: "Sora",
            fontSize: 20,
            color: WhiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: wishlist.length,
          itemBuilder: (context, index) {
            final trip = wishlist[index];
            return Card(
              elevation: 3,
              shadowColor: Redcolor,
              key: ValueKey(trip.image),
              child: GridTile(
                header: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close, color: WhiteColor),
                    onPressed: () {
                      context.read<TripProvider>().removeFromList(trip);
                    },
                  ),
                ),
                child: trip.image != null
                    ? Image.asset(
                        trip.image!,
                        fit: BoxFit.fill,
                      )
                    : Container(
                        color: Colors.grey,
                        child: Center(child: Text("No Image")),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
