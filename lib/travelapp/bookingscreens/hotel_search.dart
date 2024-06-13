import 'package:flutter/material.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/screens/home_screen.dart';

class HotelBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Redcolor,
        title: Text(
          'Hotels',
          style: TextStyle(
              fontFamily: "Sora",
              fontWeight: FontWeight.bold,
              color: WhiteColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: WhiteColor,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelSearchForm(),
            SizedBox(height: 16),
            Text('Hotels Near Me',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  HotelCard(
                    imageUrl:
                        'https://i.pinimg.com/564x/f7/49/5a/f7495a2469dbc9b3469f55d63d81fdd9.jpg',
                    name: 'Medora Hotel',
                    location: 'Kozhikode',
                    distance: '2.9 km',
                    rating: 7.8,
                    reviews: 1712,
                    price: 1966,
                    discount: 49,
                  ),
                  HotelCard(
                    imageUrl:
                        'https://i.pinimg.com/564x/1a/44/50/1a4450a35163da74c1e7e7531ef586f1.jpg',
                    name: 'Kovilakom Residency',
                    location: 'Kozhikode',
                    distance: '2.5 km',
                    rating: 8.2,
                    reviews: 1407,
                    price: 2786,
                    discount: 22,
                  ),
                  HotelCard(
                    imageUrl:
                        'https://i.pinimg.com/736x/df/37/86/df37865a267eb9a97449cc8774e7c1cc.jpg',
                    name: 'Palazzo Versace',
                    location: 'Dubai',
                    distance: '10 km',
                    rating: 9.0,
                    reviews: 842,
                    price: 10250,
                    discount: 15,
                  ),
                  HotelCard(
                    imageUrl:
                        'https://i.pinimg.com/564x/c2/a2/04/c2a20442d7140fb96e676c31e0800ae3.jpg',
                    name: 'The Plaza',
                    location: 'New York',
                    distance: '8 km',
                    rating: 8.5,
                    reviews: 1225,
                    price: 8500,
                    discount: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelSearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            HotelSearchField(
                icon: Icons.send,
                label: 'Enter Room Name',
                iconColor: Colors.red),
            HotelSearchField(
                icon: Icons.room,
                label: '1 Room . 2 Adults',
                iconColor: Colors.red),

            HotelSearchField(
                icon: Icons.price_change,
                label: 'Price Range',
                iconColor: Colors.red),
            SizedBox(height: 10),
            // SpecialFaresOptions(),
            //SizedBox(height: 10),
            // AssuredOption(),
            SearchHotelssButton()
          ],
        ),
      ),
    );
  }
}

class SearchHotelssButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => FlightBookingScreen()));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        backgroundColor: Lightblue,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            'Search Hotels',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class PriceFilterChip extends StatelessWidget {
  final String label;

  PriceFilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      onSelected: (bool selected) {},
    );
  }
}

class HotelSearchField extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  HotelSearchField(
      {required this.icon, required this.label, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.withOpacity(0.1), Colors.blue.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 16),
          Text(label),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final String distance;
  final double rating;
  final int reviews;
  final int price;
  final int discount;

  HotelCard({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.distance,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(imageUrl,
                  height: 120, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('$location • $distance from you'),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text('$rating',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Text('($reviews reviews)',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('₹$price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(width: 8),
                      Text('$discount% off',
                          style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
