import 'package:flutter/material.dart';

class SupportHelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support & Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('Call Us'),
                subtitle: Text('+1 800 123 4567'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Email Us'),
                subtitle: Text('support@acadimiq.com'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.chat),
                title: Text('Live Chat'),
                subtitle: Text('Available 24/7'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('FAQs'),
                subtitle: Text('Frequently Asked Questions'),
                onTap: () {
                  // Navigate to FAQs screen
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('User Guide'),
                subtitle: Text('Step-by-step guide to using Acadimiq'),
                onTap: () {
                  // Navigate to User Guide screen
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.bug_report),
                title: Text('Report an Issue'),
                subtitle: Text('Help us improve Acadimiq'),
                onTap: () {
                  // Navigate to Report an Issue screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
