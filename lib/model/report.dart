
class Report {
  final String centerName;
  final String date;
  final int calculated;
  final int adjustment;
  final int net;
  final String notes;
  final String paymentType;
  final String status;

   Report({
    required this.centerName,
    required this.date,
    required this.calculated,
    required this.adjustment,
    required this.net,
    required this.notes,
    required this.paymentType,
    required this.status,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    centerName: json['centerName'],
    date: json['date'],
    calculated: json['calculated'],
    adjustment: json['adjustment'],
    net: json['net'],
    notes: json['notes'],
    paymentType: json['paymentType'],
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'centerName': centerName,
    'date': date,
    'calculated': calculated,
    'adjustment': adjustment,
    'net': net,
    'notes': notes,
    'paymentType': paymentType,
    'status': status,
  };
}



