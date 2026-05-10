import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';

/// Tämä on tapahtumien provider, joka hallinnoi tapahtumien tilaa sovelluksessa.
/// Se käyttää Riverpodin NotifierProvideria, joka tarjoaa reaktiivisen tavan hallita tilaa.
/// Tapahtumat tallennetaan listana, ja provider tarjoaa metodin uuden tapahtuman lisäämiseen.
class TransactionNotifier extends Notifier<List<Transaction>> {
  @override
  List<Transaction> build() {
    return [
      Transaction(
        id: '1',
        category: 'Food',
        amount: 1250,
        date: DateTime.now(),
        type: TransactionType.expense,
      ),
      Transaction(
        id: '2',
        category: 'Transport',
        amount: 730,
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: TransactionType.expense,
      ),
      Transaction(
        id: '3',
        category: 'Entertainment',
        amount: 2500,
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: TransactionType.expense,
      ),
    ];
  }

  void addTransaction(Transaction newTransaction) {
    state = [...state, newTransaction];
  }
}

final transactionProvider =
    NotifierProvider<TransactionNotifier, List<Transaction>>(() {
      return TransactionNotifier();
    });
