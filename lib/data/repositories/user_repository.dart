import '../models/user_model.dart';

class UserRepository {
  // In a real app, this would connect to an API or database
  Future<UserModel> getCurrentUser() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    return UserModel(
      id: '1',
      name: 'Samantha',
      email: 'samantha@example.com',
      phone: '+91 9876543210',
      avatar: '',
      balance: 4590.00,
    );
  }
}
