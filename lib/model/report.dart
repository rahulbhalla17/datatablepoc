

class Report {
  final String centerName;
  final String date;
  final int calculated;
  final int adjustment;
  final int net;
  final String notes;
  final String paymentType;
  final String status;

  const Report({
    required this.centerName,
    required this.date,
    required this.calculated,
    required this.adjustment,
    required this.net,
    required this.notes,
    required this.paymentType,
    required this.status,
  });
}
