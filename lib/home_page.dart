import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  final Map<String, Map<String, List<String>>> constitution;

  const HomePage({Key? key, required this.constitution}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.teal[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Constitution',
              onPressed: () {
                Navigator.pushNamed(context, '/constitution');
              },
            ),
            CustomButton(
              text: 'Search',
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            CustomButton(
              text: 'About Us',
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            CustomButton(
              text: 'Chat to Us',
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
            ),
            CustomButton(
              text: 'Exit',
              onPressed: () {
                if (Platform.isIOS) {
                  exit(0);
                } else {
                  SystemNavigator.pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Text color
          backgroundColor: Colors.teal[600], // Button color
          minimumSize: const Size(200, 50), // Button size
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          textStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
