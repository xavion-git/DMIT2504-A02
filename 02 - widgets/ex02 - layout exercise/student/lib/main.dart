import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Layout Demo'),
        ),
        body: Column(
          children: [
            const ProfileHeading(),
            ClipOval(
              child: Image.asset(
                'assets/images/me.jpg',
                height: 250,
                width: 250,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Nathan Humphrey',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ProfileInfo('Role', 'Developer'),
            const ProfileInfo('Team', 'Front-End Main Product'),
            const ProfileInfo('Handle', '@NateAtNait'),
            const ProfileInfo('Supervisor', 'Sally Anne'),
          ],
        ),
      ),
    );
  }
}

class ProfileHeading extends StatelessWidget {
  /// The heading for the profile page
  const ProfileHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Employee Profile',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
