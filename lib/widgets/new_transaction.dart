import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../providers/transaction_provider.dart';

/// Uuden tapahtuman syöttämiseen tarkoitettu widgetti.
/// Sisältää tekstikentät kategorian ja summan syöttämiseen, sekä tallennuspainikkeen.
/// Kun tallennuspainiketta painetaan, luodaan uusi Transaction-olio ja lisätään se transactionProvideriin.
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

              final parsedDouble =
                  double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

              final amountInCents = (parsedDouble * 100).toInt();

              final newTransaction = Transaction(
                id: DateTime.now().toString(),
                category: categoryText,
                amount: amountInCents,
                date: DateTime.now(),
                type: widget.type,
              );
              ref
                  .read(transactionProvider.notifier)
                  .addTransaction(newTransaction);
              Navigator.of(context).pop();
            },
            child: const Text('Tallenna tapahtuma'),
          ),
        ],
      ),
    );
  }
}
