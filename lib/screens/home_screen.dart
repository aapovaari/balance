import 'package:balance/models/transaction.dart';
import 'package:balance/widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:balance/widgets/transaction_item.dart';
import 'package:balance/providers/transaction_provider.dart';

/// Tämä on sovelluksen pääruutu, joka näyttää käyttäjälle saldon
/// ja viimeisimmät tapahtumat.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionProvider);
    final balance = transactions.fold(
      0,
      (sum, t) =>
          sum + (t.type == TransactionType.income ? t.amount : -t.amount),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BALANCE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      BalanceCard(balance: balance),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsetsGeometry.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Viimeisimmät tapahtumat',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Näytä kaikki'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                final transaction = transactions[index];
                return TransactionItem(transaction: transaction);
              },
            ),
          ),
        ],
      ),
    );
  }
}
