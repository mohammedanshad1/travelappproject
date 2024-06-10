import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/travelapp/constants/constants.dart';
import 'package:travelapp/travelapp/screens/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Define TextEditingController for each text field to manage their states
  final TextEditingController _nameController =
      TextEditingController(text: 'Mohammed Anshad');
  final TextEditingController _phoneController =
      TextEditingController(text: '9744043830');
  final TextEditingController _emailController =
      TextEditingController(text: 'anshadkk556@gmail.com');

  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Redcolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 120),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  "assets/Anshad.jpg",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 320),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isEditing
                      ? _buildTextField(
                          controller: _nameController,
                          label: 'Name',
                          icon: Icons.person,
                        )
                      : _buildListTile(
                          context,
                          icon: Icons.person,
                          title: 'Name',
                          subtitle: _nameController.text,
                        ),
                  SizedBox(height: 20),
                  _isEditing
                      ? _buildTextField(
                          controller: _phoneController,
                          label: 'Phone',
                          icon: Icons.phone,
                        )
                      : _buildListTile(
                          context,
                          icon: Icons.phone,
                          title: 'Phone',
                          subtitle: _phoneController.text,
                        ),
                  SizedBox(height: 20),
                  _isEditing
                      ? _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.email,
                        )
                      : _buildListTile(
                          context,
                          icon: Icons.email,
                          title: 'Email',
                          subtitle: _emailController.text,
                        ),
                  SizedBox(height: 20),
                  Center(
                    child: _buildButton(
                      context,
                      label: _isEditing ? 'Save' : 'Edit',
                      onPressed: () {
                        setState(() {
                          if (_isEditing) {
                            // Save the changes
                            // You can add saving logic here, like updating a backend or local storage
                          }
                          _isEditing = !_isEditing;
                        });
                      },
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

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Container(
      height: 80,
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
      child: ListTile(
        leading: Icon(
          icon,
          color: BlackColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: BlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: BlackColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      required IconData icon}) {
    return Container(
      height: 80,
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
      child: ListTile(
        leading: Icon(
          icon,
          color: BlackColor,
        ),
        title: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required VoidCallback onPressed}) {
    return Container(
      height: 50, // Set the height as desired
      width: 100, // Set the width as desired
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Lightblue, // Light blue color for contrast
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: "Sora",
            fontWeight: FontWeight.bold,
          ),
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
