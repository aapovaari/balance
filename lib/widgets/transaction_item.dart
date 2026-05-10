import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:balance/models/transaction.dart';

/// Tämä widget näyttää yksittäisen tapahtuman.
/// Se on kortti, joka sisältää tapahtuman kategorian, päivämäärän ja summan.
/// Tapahtuman tyyppi (tulo vai meno) määrittää kortin ulkoasun,
/// kuten värit ja ikonit.
class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isIncome ? Colors.green.shade50 : Colors.red.shade50,
          radius: 25,
          child: Icon(
            isIncome ? Icons.arrow_upward : Icons.arrow_downward,
            color: isIncome ? Colors.green : Colors.red,
          ),
        ),
        title: Text(
          transaction.category,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat('d.M.y').format(transaction.date)),
        trailing: Text(
          // 4. Tässä on keksimäsi kaava yhdistettynä miinus/plus -merkkiin!
          '${isIncome ? '+' : '-'} ${(transaction.amount / 100).toStringAsFixed(2)} €',
          style: TextStyle(
            color: isIncome ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
