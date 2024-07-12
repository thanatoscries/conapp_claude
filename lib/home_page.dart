import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

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
              text: 'WhatsApp Us',
              onPressed: () {
                launchWhatsApp();
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

  //TODO : Implement a logging service for any crashes/errors

  void launchWhatsApp() async {
    final String contact = "+263789905942"; // Veritas Chatbot
    final String text = 'Hi, I would like to know more about my constitution';

    final String androidUrl =
        "https://wa.me/$contact?text=${Uri.encodeComponent(text)}";
    final String iosUrl =
        "https://wa.me/$contact?text=${Uri.encodeComponent(text)}";
    final String webUrl =
        "https://api.whatsapp.com/send/?phone=$contact&text=${Uri.encodeComponent(text)}";

    try {
      if (await canLaunchUrl(Uri.parse(androidUrl))) {
        await launchUrl(Uri.parse(androidUrl));
      } else if (await canLaunchUrl(Uri.parse(iosUrl))) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(webUrl));
      }
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }
}

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
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal[600],
          minimumSize: const Size(200, 50),
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
