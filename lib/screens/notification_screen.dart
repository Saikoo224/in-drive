import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Ride Completed',
      message: 'Your ride from Mohandessin to Tagamoa has been completed successfully.',
      date: DateTime(2025, 4, 21, 16, 00),
      icon: Icons.check_circle_outline,
      color: Colors.green,
    ),
    NotificationItem(
      title: 'Ride Cancelled',
      message: 'Your ride from Nasr City to Zamalek was cancelled by the driver.',
      date: DateTime(2025, 4, 20, 10, 15),
      icon: Icons.cancel_outlined,
      color: Colors.redAccent,
    ),
    NotificationItem(
      title: 'New Promo',
      message: 'Enjoy 20% off your next ride from Downtown to any destination!',
      date: DateTime(2025, 4, 19, 09, 00),
      icon: Icons.local_offer_outlined,
      color: Colors.deepPurpleAccent,
    ),
    NotificationItem(
      title: 'Ride Reminder',
      message: 'Don’t forget your upcoming ride from Maadi to Heliopolis at 2:15 PM.',
      date: DateTime(2025, 4, 17, 13, 45),
      icon: Icons.directions_car,
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F9),
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Ride History',
            onPressed: () {
              Navigator.pushNamed(context, '/rideHistory');
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [item.color.withOpacity(0.05), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
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
                backgroundColor: item.color.withOpacity(0.2),
                child: Icon(item.icon, color: item.color),
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: item.color,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  '${item.message}\n${DateFormat('EEE, dd MMM • hh:mm a').format(item.date)}',
                  style: const TextStyle(height: 1.5, fontSize: 13),
                ),
              ),
              isThreeLine: true,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped: ${item.title}'),
                    backgroundColor: item.color,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime date;
  final IconData icon;
  final Color color;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.date,
    required this.icon,
    required this.color,
  });
}
