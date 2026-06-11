import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../providers/transaction_provider.dart';

/// Tämä widget on modal bottom sheet, joka avautuu, kun käyttäjä haluaa lisätä uuden tapahtuman.
/// Käyttäjä syöttää tapahtuman kategorian ja summan, ja tallentaan tapahtuman providerin kautta.
class NewTransaction extends ConsumerStatefulWidget {
  final TransactionType type;

  const NewTransaction({super.key, required this.type});

  @override
  ConsumerState<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends ConsumerState<NewTransaction> {
  final _categoryController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _categoryController,
            decoration: const InputDecoration(
              labelText: 'Kategoria (esim. Ruoka)',
            ),
          ),
          const SizedBox(height: 16),

          TextField(
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Summa (€)'),
          ),
          const SizedBox(height: 32),

          FilledButton(
            onPressed: () {
              final categoryText = _categoryController.text;
              final amountText = _amountController.text;

              ref
                  .read(transactionProvider.notifier)
                  .addTransaction(categoryText, amountText, widget.type);
              Navigator.of(context).pop();
            },
            child: const Text('Tallenna tapahtuma'),
          ),
        ],
      ),
    );
  }
}
