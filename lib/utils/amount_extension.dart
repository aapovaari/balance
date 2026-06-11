extension AmountExtension on int {
  String get formattedAmount {
    final euros = this ~/ 100;
    final cents = (this % 100).toString().padLeft(2, '0');
    return '$euros,$cents €';
  }
}
