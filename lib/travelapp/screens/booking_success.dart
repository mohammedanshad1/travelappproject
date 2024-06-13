import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/screens/home_screen.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _showConfirmationDialog(context));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Redcolor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: WhiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Payment Confirmation',
          style: TextStyle(
              color: WhiteColor,
              fontSize: 20,
              fontFamily: "Sora",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Redirecting...',
          style: TextStyle(fontFamily: "Sora", fontSize: 16),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            height: 350, // Increase the height of the dialog box
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Lottie.asset(
                    'assets/Animation - 1718186051189.json',
                    repeat: false, // Disable looping if you only want to play it once
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your booking is confirmed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Sora",
                    fontWeight: FontWeight.bold,
                    fontSize: 22, // Increase text size
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontFamily: "Sora",
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
