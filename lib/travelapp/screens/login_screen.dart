import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Redcolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Welcome...!",
                    style: TextStyle(
                      fontFamily: 'Sora',
                      color: WhiteColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: (MediaQuery.of(context).size.width - 200) / 2,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/Designer__3_-removebg-preview.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField(
                    context,
                    icon: CupertinoIcons.person,
                    placeholder: 'First Name',
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    context,
                    icon: Icons.password,
                    placeholder: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 50, // Set the height as desired
                      width: 250, // Set the width as desired
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              Lightblue, // Amber color for contrast
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: "Sora",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/Google__G__logo.svg.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Connect with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context,
      {required IconData icon,
      required String placeholder,
      bool obscureText = false}) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: CupertinoSearchTextField(
        backgroundColor: Colors.white,
        prefixIcon: Icon(
          icon,
          size: 26,
          color: BlackColor,
        ),
        placeholder: placeholder,
        placeholderStyle: TextStyle(
          color: BlackColor,
          fontWeight: FontWeight.bold,
        ),
        style: TextStyle(
          color: BlackColor,
        ),
      ),
    );
  }
}

// Add this extension to handle hex color strings
extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
