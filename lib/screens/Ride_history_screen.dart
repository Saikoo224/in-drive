import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  final List<Ride> rideHistory = [
    Ride(
      'Mohandessin',
      'Tagamoa',
      DateTime(2025, 4, 21, 15, 30),
      75.0,
      'Completed',
    ),
    Ride(
      'Nasr City',
      'Zamalek',
      DateTime(2025, 4, 20, 10, 0),
      60.0,
      'Cancelled',
    ),
    Ride(
      'Sheikh Zayed',
      'Downtown',
      DateTime(2025, 4, 18, 19, 45),
      90.0,
      'Completed',
    ),
    Ride(
      'Maadi',
      'Heliopolis',
      DateTime(2025, 4, 17, 14, 15),
      65.0,
      'Completed',
    ),
    Ride(
      'October City',
      'New Cairo',
      DateTime(2025, 4, 16, 09, 30),
      80.0,
      'Cancelled',
    ),
    Ride(
      'Abbassia',
      'Garden City',
      DateTime(2025, 4, 15, 18, 00),
      50.0,
      'Completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.support_agent),
            onPressed: () {
              Navigator.pushNamed(context, '/support');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
        title: const Text('Ride History'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: rideHistory.length,
        itemBuilder: (context, index) {
          final ride = rideHistory[index];
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    ride.status == 'Completed'
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.shade100,
                  child: const Icon(Icons.directions_car, color: Colors.teal),
                ),
                title: Wrap(
                  spacing: 4,
                  children: [
                    const Icon(Icons.location_on, color: Colors.teal, size: 16),
                    Flexible(
                      child: Text(
                        ride.from,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text('→'),
                    const Icon(Icons.flag, color: Colors.teal, size: 18),
                    Flexible(
                      child: Text(
                        ride.to,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  '${DateFormat('EEE, dd MMM yyyy • hh:mm a').format(ride.date)}\n'
                  'Fare: ${ride.fare.toStringAsFixed(2)} EGP',
                  style: const TextStyle(height: 1.4, fontSize: 10),
                ),
                trailing: ride.status == 'Completed'
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.cancel, color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Ride {
  final String from;
  final String to;
  final DateTime date;
  final double fare;
  final String status;

  const Ride(this.from, this.to, this.date, this.fare, this.status);
}
