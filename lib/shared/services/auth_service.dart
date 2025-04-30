import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class AuthService extends GetxService {
  final UserRepository _userRepository = UserRepository();
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  
  Future<AuthService> init() async {
    // In a real app, check if user is logged in
    return this;
  }
  
  Future<bool> login(String email, String password) async {
    try {
      // In a real app, validate credentials with API
      final user = await _userRepository.getCurrentUser();
      currentUser.value = user;
      return true;
    } catch (e) {
      return false;
    }
  }
  
  void logout() {
    currentUser.value = null;
  }
  
  bool get isLoggedIn => currentUser.value != null;
}
