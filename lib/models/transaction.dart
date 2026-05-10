enum TransactionType { income, expense }

/// Tämä on tapahtuman malli, joka sisältää kaikki tarvittavat tiedot
/// tapahtuman tallentamiseen ja näyttämiseen. Jokaisella tapahtumalla on
/// uniikki ID, summa sentteinä, päivämäärä, kategoria ja tyyppi (tulo vai meno).
class Transaction {
  final String id;
  final int amount;
  final DateTime date;
  final String category;
  final TransactionType type;

  Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });
}
