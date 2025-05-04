import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book a Ride")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pick-up Location", style: TextStyle(fontSize: 16)),
            const TextField(decoration: InputDecoration(hintText: "Enter pick-up location")),
            const SizedBox(height: 20),
            const Text("Drop-off Location", style: TextStyle(fontSize: 16)),
            const TextField(decoration: InputDecoration(hintText: "Enter drop-off location")),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: const Text("Find Ride"),
            )
          ],
        ),
      ),
    );
  }
}