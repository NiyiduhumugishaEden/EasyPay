import '../models/transaction_model.dart';

class TransactionRepository {
  // In a real app, this would connect to an API or database
  Future<List<TransactionModel>> getRecentTransactions() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      TransactionModel(
        id: '1',
        senderId: '1',
        receiverId: '2',
        amount: 240.00,
        date: DateTime(2022, 2, 24),
        status: 'completed',
        type: 'send',
      ),
    ];
  }
  
  Future<TransactionModel> createTransaction({
    required String receiverId,
    required double amount,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 800));
    
    return TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: '1',
      receiverId: receiverId,
      amount: amount,
      date: DateTime.now(),
      status: 'completed',
      type: 'send',
    );
  }
}
