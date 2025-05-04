import 'package:flutter/material.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ride Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Driver: John Doe", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Car: Toyota Prius - Blue", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Estimated Time: 15 minutes", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}