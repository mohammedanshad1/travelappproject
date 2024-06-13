import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/screens/booking_success.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
          'Payment Method',
          style: TextStyle(
              color: WhiteColor,
              fontSize: 20,
              fontFamily: "Sora",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPaymentOption(0, 'Credit Card', 'assets/business.png',
                '**** 1606', '+1 6006 **** 24'),
            _buildPaymentOption(
                1, 'Paypal', 'assets/visa.png', '**** 5221', '5221 **** 2465'),
            _buildPaymentOption(2, 'Google Pay', 'assets/google-pay.png',
                '**** 4142', '4142 **** 7667'),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      color: HexColor("D2AA40"),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Promo Code",
                        hintStyle: TextStyle(
                          color: Iconcolor,
                          fontFamily: "Sora",
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: Icon(
                          Icons.book_online,
                          color: WhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                ElevatedButton(
                  onPressed: () {
                    // Handle apply promo code
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Lightblue,
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(fontFamily: "Sora", color: BlackColordark),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildAmountDetails(
              'Transfer Amount',
              '\$30.20',
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            _buildAmountDetails('Additional Cost', '\$0.50'),
            Divider(thickness: 1),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            _buildAmountDetails('Total', '\$30.70'),
            SizedBox(height: screenHeight * 0.19),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SuccessPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Lightblue,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(double.infinity, 0), // Full width button
              ),
              child: Text(
                'Pay',
                style: TextStyle(
                  fontFamily: "Sora",
                  color: BlackColordark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(int index, String title, String assetPath,
      String cardDigits, String cardNumber) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _selectedPaymentMethod == index
                ? Colors.blue
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Image.asset(assetPath, width: 40, height: 40),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(cardNumber, style: TextStyle(color: Colors.grey)),
              ],
            ),
            Spacer(),
            if (_selectedPaymentMethod == index)
              Icon(Icons.radio_button_checked, color: Colors.blue)
            else
              Icon(Icons.radio_button_off, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountDetails(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Iconcolor,
              fontFamily: "Sora",
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
