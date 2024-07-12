import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(
                text:
                    '\n\nVeritas provides information on the work of the Parliament of Zimbabwe and the Laws of Zimbabwe, making public domain information widely available.\n\n',
              ),
              TextSpan(
                text: 'For subscription requests and inquiries, email ',
              ),
              TextSpan(
                text: 'veritaszim@gmail.com',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '. \n \nFor correspondence, please email ',
              ),
              TextSpan(
                text: 'veritas@mango.zw',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' (Please note it is veritas@mango.zw).',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
