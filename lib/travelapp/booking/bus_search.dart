import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/screens/home_screen.dart';

class BusSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.lightBlueAccent,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      home: BusSearchScreen(),
    );
  }
}

class BusSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Book Buses',
          style: TextStyle(
              fontFamily: "Sora",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BusSearchForm(),
              SizedBox(height: 20),
              SearchBusesButton(),
              //     SizedBox(height: 20),
              //     ServicesGrid(),
              //     SizedBox(height: 20),
              //     RecentSearches(),
            ],
          ),
        ),
      ),
    );
  }
}

class BusSearchForm extends StatelessWidget {
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Expanded(
            //       child: OutlinedButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Volvo',
            //           style:
            //               TextStyle(fontFamily: "Sora", color: BlackColordark),
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 10),
            //     Expanded(
            //       child: OutlinedButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Round Trip',
            //           style:
            //               TextStyle(fontFamily: "Sora", color: BlackColordark),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 10),
            BusSearchField(
                icon: Icons.send, label: 'Leaving From', iconColor: Colors.red),
            BusSearchField(
                icon: Icons.call_received,
                label: 'Going To',
                iconColor: Colors.red),
            BusSearchField(
                icon: Icons.calendar_today,
                label: 'Thu, 13 Jun',
                iconColor: Colors.red),
            BusSearchField(
                icon: Icons.person,
                label: '1 Traveller •',
                iconColor: Colors.red),
            SizedBox(height: 10),
            // SpecialFaresOptions(),
            //SizedBox(height: 10),
            AssuredOption(),
          ],
        ),
      ),
    );
  }
}

class BusSearchField extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  BusSearchField(
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

// class SpecialFaresOptions extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         OutlinedButton(onPressed: () {}, child: Text('Student')),
//         OutlinedButton(onPressed: () {}, child: Text('Senior Citizen')),
//         OutlinedButton(onPressed: () {}, child: Text('Armed Forces')),
//       ],
//     );
//   }
// }

class AssuredOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (bool? value) {}),
        Text('Always opt for Assured'),
        Spacer(),
        Text('₹0 cancellation fee', style: TextStyle(color: Colors.green)),
      ],
    );
  }
}

class SearchBusesButton extends StatelessWidget {
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
            'Search Buses',
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

// class ServicesGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       crossAxisCount: 3,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       children: [
//         ServiceItem(
//           icon: Icons.flight,
//           label: 'Flight Status',
//         ),
//         ServiceItem(icon: Icons.credit_card, label: 'Credit Card'),
//         ServiceItem(icon: Icons.book, label: 'Book Visa'),
//         ServiceItem(icon: Icons.policy, label: 'Travel Insurance'),
//         ServiceItem(icon: Icons.trip_origin, label: 'Plan'),
//         ServiceItem(icon: Icons.car_rental, label: 'Car Rentals'),
//         ServiceItem(icon: Icons.group, label: 'Group Booking'),
//         ServiceItem(icon: Icons.local_taxi, label: 'Airport Cabs'),
//       ],
//     );
//   }
// }

// class ServiceItem extends StatelessWidget {
//   final IconData icon;
//   final String label;

//   ServiceItem({required this.icon, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 40, color: Colors.red),
//           SizedBox(height: 10),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontFamily: "Sora"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class RecentSearches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Lightblue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Text('Your recent searches',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: "Sora")),
          Spacer(),
          Icon(Icons.arrow_drop_down, color: Colors.blue),
        ],
      ),
    );
  }
}
