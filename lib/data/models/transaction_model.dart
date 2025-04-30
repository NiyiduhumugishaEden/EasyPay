class TransactionModel {
  final String id;
  final String senderId;
  final String receiverId;
  final double amount;
  final DateTime date;
  final String status;
  final String type;

  TransactionModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.date,
    required this.status,
    required this.type,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      status: json['status'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'amount': amount,
      'date': date.toIso8601String(),
      'status': status,
      'type': type,
    };
  }
}
