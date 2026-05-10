import 'package:flutter/material.dart';

/// Tämä widget näyttää käyttäjän saldon. Se on yksinkertainen kortti,
/// joka ottaa vastaan kokonaislukuna saldon sentteinä ja näyttää sen euroina.
class BalanceCard extends StatelessWidget {
  final int balance;

  const BalanceCard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Saldo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${(balance / 100).toStringAsFixed(2)} €',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
