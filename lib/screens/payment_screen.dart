import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Payment Method", style: TextStyle(fontSize: 16)),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text("Credit/Debit Card"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text("Wallet"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text("Cash"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}