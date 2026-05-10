import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';

/// Tämä widget sisältää kaksi painiketta, joilla käyttäjä voi lisätä uuden tulon tai menon.
/// Painikkeiden painalluksesta avautuu modal bottom sheet, jossa käyttäjä voi syöttää uuden tapahtuman tiedot.
class AddTransactionButtons extends StatelessWidget {
  final VoidCallback onAdd;

  const AddTransactionButtons({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewTransaction(type: TransactionType.income);
                    },
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('LISÄÄ TULO'),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewTransaction(type: TransactionType.expense);
                    },
                  );
                },
                icon: const Icon(Icons.remove),
                label: const Text('LISÄÄ MENO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
