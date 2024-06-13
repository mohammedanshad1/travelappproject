import 'package:flutter/material.dart';
import 'package:travelapp/travelapp/booking/flight_search.dart';
import 'package:travelapp/travelapp/constants/constants.dart';

class FlightBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Redcolor,
        title: Text(
          "DEL → BOM",
          style: TextStyle(
              fontFamily: "Sora",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: WhiteColor),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FlightSearchApp()));
            },
            child: Icon(
              Icons.arrow_back,
              color: WhiteColor,
            )),
      ),
      body: Column(
        children: [
          DateSelection(),
          PromotionBanner(),
          FlightList(),
          // BottomNavigation(),
        ],
      ),
    );
  }
}

class DateSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          DateTile(
            date: 'Wed, 12',
            price: '₹ 7213',
          ),
          DateTile(date: 'Thu, 13', price: '₹ 5923', isSelected: true),
          DateTile(date: 'Fri, 14', price: '₹ 5652'),
          DateTile(date: 'Sat, 15', price: '₹ 5398'),
          DateTile(date: 'Sun, 16', price: '₹ 5275'),
        ],
      ),
    );
  }
}

class DateTile extends StatelessWidget {
  final String date;
  final String price;
  final bool isSelected;

  DateTile({required this.date, required this.price, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[100] : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(date, style: TextStyle(fontSize: 16, fontFamily: "Sora")),
          Text(price, style: TextStyle(fontSize: 16, fontFamily: "Sora")),
        ],
      ),
    );
  }
}

class PromotionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.orange[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Get Flat 12% Off with ICICI Bank Credit Card",
              style: TextStyle(fontSize: 16, fontFamily: "Sora")),
        ],
      ),
    );
  }
}

class FlightList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          FlightTile(
            airline: 'Vistara',
            flightNumber: 'UK 933',
            departure: '15:30',
            duration: '2h 5m',
            arrival: '17:35',
            price: '₹ 5,693',
            oldPrice: '₹ 5,923',
            isCheapest: true,
          ),
          FlightTile(
            airline: 'SpiceJet',
            flightNumber: 'SG 8269',
            departure: '00:30',
            duration: '2h 15m',
            arrival: '02:45',
            price: '₹ 5,801',
            oldPrice: '₹ 6,031',
            isEarliest: true,
          ),
          FlightTile(
            airline: 'Vistara',
            flightNumber: 'UK 951',
            departure: '14:20',
            duration: '2h 5m',
            arrival: '16:25',
            price: '₹ 6,797',
            oldPrice: '₹ 7,057',
          ),
          FlightTile(
            airline: 'IndiGo',
            flightNumber: '6E 519',
            departure: '23:30',
            duration: '2h 10m',
            arrival: '01:40',
            price: '₹ 6,933',
            oldPrice: '₹ 7,108',
          ),
        ],
      ),
    );
  }
}

class FlightTile extends StatelessWidget {
  final String airline;
  final String flightNumber;
  final String departure;
  final String duration;
  final String arrival;
  final String price;
  final String oldPrice;
  final bool isCheapest;
  final bool isEarliest;

  FlightTile({
    required this.airline,
    required this.flightNumber,
    required this.departure,
    required this.duration,
    required this.arrival,
    required this.price,
    required this.oldPrice,
    this.isCheapest = false,
    this.isEarliest = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AirlineLogo(airline: airline),
                SizedBox(width: 10),
                Text(
                  '$airline • $flightNumber',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlightTime(time: departure),
                FlightDuration(duration: duration),
                FlightTime(time: arrival),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                SizedBox(width: 10),
                Text(
                  oldPrice,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            if (isCheapest)
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.blue),
                  SizedBox(width: 5),
                  Text("Cheapest", style: TextStyle(color: Colors.blue)),
                ],
              ),
            if (isEarliest)
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.blue),
                  SizedBox(width: 5),
                  Text("Earliest", style: TextStyle(color: Colors.blue)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class AirlineLogo extends StatelessWidget {
  final String airline;

  AirlineLogo({required this.airline});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> airlineImages = {
      'Vistara': 'assets/icons8-ups-airlines-48.png',
      'SpiceJet': 'assets/icons8-klm-airlines-48.png',
      'IndiGo': 'assets/icons8-lufthansa-48.png',
      'AirIndia':
          'assets/icons8-iberia-airlines-48.png', // Replace with actual image path
    };

    return Container(
      width: 30,
      height: 30,
      child: Image.asset(
        airlineImages[airline] ?? 'assets/icons8-ups-airlines-48.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class FlightTime extends StatelessWidget {
  final String time;

  FlightTime({required this.time});

  @override
  Widget build(BuildContext context) {
    return Text(time, style: TextStyle(fontSize: 16));
  }
}

class FlightDuration extends StatelessWidget {
  final String duration;

  FlightDuration({required this.duration});

  @override
  Widget build(BuildContext context) {
    return Text(duration, style: TextStyle(fontSize: 16, color: Colors.grey));
  }
}

// class BottomNavigation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       //  backgroundColor: WhiteColor,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.filter_list,
//             color: BlackColordark,
//           ),
//           label: 'FILTER',
//         ),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.swap_horiz,
//               color: BlackColordark,
//             ),
//             label: 'NON-STOP'),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.access_time,
//               color: BlackColordark,
//             ),
//             label: 'TIME'),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.airplanemode_active,
//               color: BlackColordark,
//             ),
//             label: 'AIRLINE'),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.sort,
//               color: BlackColordark,
//             ),
//             label: 'SORT'),
//       ],
//     );
//   }
// }
