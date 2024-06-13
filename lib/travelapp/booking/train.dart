import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelapp/travelapp/booking/train_searching.dart';
import 'package:travelapp/travelapp/constants/constants.dart';

class TrainBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of date tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Redcolor,
          title: Text(
            'Train Booking',
            style: TextStyle(
                fontFamily: "Sora",
                fontWeight: FontWeight.bold,
                color: WhiteColor),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrainSearchApp()));
            },
            child: Icon(
              Icons.arrow_back,
              color: WhiteColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Redcolor,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                tabs: [
                  DateTab(date: 'Thu, 13', status: 'Filling Fast'),
                  DateTab(date: 'Fri, 14', status: 'Filling Fast'),
                  DateTab(date: 'Sat, 15', status: 'Filling Fast'),
                  DateTab(date: 'Sun, 16', status: 'Filling Fast'),
                  DateTab(date: 'Mon, 17', status: 'Available'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TrainList(), // For Thu, 13
                  TrainList(), // For Fri, 14
                  TrainList(), // For Sat, 15
                  TrainList(), // For Sun, 16
                  TrainList(), // For Mon, 17
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateTab extends StatelessWidget {
  final String date;
  final String status;

  DateTab({required this.date, required this.status});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          Text(status, style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}

class TrainList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        TrainCard(
          trainName: "INTERCITY SF EX",
          startTime: "09:15",
          endTime: "10:42",
          duration: "1h 27m",
          startStation: "CLT",
          endStation: "CAN",
          availability: "All Days",
          seats: [
            SeatAvailability(
                seatType: "2S", price: "₹ 80", availability: "URR_AVBL 1"),
            SeatAvailability(
                seatType: "CC", price: "₹ 315", availability: "URR_AVBL 1"),
          ],
        ),
        TrainCard(
          trainName: "MS MAQ EXP",
          startTime: "14:45",
          endTime: "16:20",
          duration: "1h 35m",
          startStation: "CLT",
          endStation: "CAN",
          availability: "All Days",
          seats: [
            SeatAvailability(
                seatType: "SL", price: "₹ 145", availability: "AVL 51"),
            SeatAvailability(
                seatType: "2S", price: "₹ 65", availability: "WL 10 (51%)"),
            SeatAvailability(
                seatType: "3A", price: "₹ 505", availability: "Tap to refresh"),
          ],
        ),
        TrainCard(
          trainName: "LTT GARIB RATH",
          startTime: "15:35",
          endTime: "16:37",
          duration: "1h 2m",
          startStation: "CLT",
          endStation: "CAN",
          availability: "S M T W T F S",
          seats: [
            SeatAvailability(
                seatType: "CC", price: "₹ 480", availability: "AVL 3"),
            SeatAvailability(
                seatType: "CC", price: "₹ 220", availability: "WL 9 (46%)"),
            SeatAvailability(
                seatType: "3A", price: "₹ 280", availability: "Tap to refresh"),
          ],
        ),
        TrainCard(
          trainName: "GIMB HUMSAFAR",
          startTime: "16:30",
          endTime: "17:52",
          duration: "1h 22m",
          startStation: "CLT",
          endStation: "CAN",
          availability: "S M T W T F S",
          seats: [
            SeatAvailability(
                seatType: "SL", price: "₹ 465", availability: "AVL 3"),
            SeatAvailability(
                seatType: "SL", price: "₹ 195", availability: "WL 22 (88%)"),
            SeatAvailability(
                seatType: "3A", price: "₹ 625", availability: "Tap to refresh"),
          ],
        ),
      ],
    );
  }
}

class TrainCard extends StatelessWidget {
  final String trainName;
  final String startTime;
  final String endTime;
  final String duration;
  final String startStation;
  final String endStation;
  final String availability;
  final List<SeatAvailability> seats;

  TrainCard({
    required this.trainName,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.startStation,
    required this.endStation,
    required this.availability,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      // color: HexColor("EEF4E6"),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(trainName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$startTime $startStation'),
                Text(duration),
                Text('$endTime $endStation'),
              ],
            ),
            SizedBox(height: 5),
            Text(availability),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: seats.map((seat) => SeatTile(seat: seat)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatTile extends StatelessWidget {
  final SeatAvailability seat;

  SeatTile({required this.seat});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("D4E6F1"),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(seat.seatType,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(seat.price, style: TextStyle(fontSize: 12)),
            Text(seat.availability, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class SeatAvailability {
  final String seatType;
  final String price;
  final String availability;

  SeatAvailability({
    required this.seatType,
    required this.price,
    required this.availability,
  });
}
