import 'package:flutter_test/flutter_test.dart';
import 'package:balance/models/transaction.dart';

void main() {
  group('Transaction', () {
    test('should create a Transaction object with valid data', () {
      final transaction = Transaction(
        id: '1',
        amount: 1000,
        date: DateTime(2024, 6, 1),
        category: 'Test Transaction',
        type: TransactionType.income,
      );

      expect(transaction.id, '1');
      expect(transaction.amount, 1000);
      expect(transaction.date, DateTime(2024, 6, 1));
      expect(transaction.category, 'Test Transaction');
      expect(transaction.type, TransactionType.income);
    });
  });
}
