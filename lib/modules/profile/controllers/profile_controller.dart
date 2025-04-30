import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString name = 'Samantha Wilson'.obs;
  final RxString email = 'samantha.wilson@example.com'.obs;
  final RxString phone = '+91 9876543210'.obs;
  final RxString address = '123 Main Street, Mumbai, India'.obs;
  final RxBool isDarkMode = false.obs;
  final RxBool isNotificationsEnabled = true.obs;
  final RxBool isBiometricEnabled = false.obs;
  
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Personal Information',
      'icon': Icons.person_outline,
      'action': 'personal_info',
    },
    {
      'title': 'Payment Methods',
      'icon': Icons.credit_card,
      'action': 'payment_methods',
    },
    {
      'title': 'Security',
      'icon': Icons.security,
      'action': 'security',
    },
    {
      'title': 'Notifications',
      'icon': Icons.notifications_none,
      'action': 'notifications',
    },
    {
      'title': 'Privacy Policy',
      'icon': Icons.privacy_tip_outlined,
      'action': 'privacy_policy',
    },
    {
      'title': 'Help & Support',
      'icon': Icons.help_outline,
      'action': 'help_support',
    },
    {
      'title': 'About',
      'icon': Icons.info_outline,
      'action': 'about',
    },
  ];
  
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    // In a real app, you would apply the theme change here
  }
  
  void toggleNotifications() {
    isNotificationsEnabled.value = !isNotificationsEnabled.value;
  }
  
  void toggleBiometric() {
    isBiometricEnabled.value = !isBiometricEnabled.value;
  }
  
  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              // In a real app, you would clear user session here
              Get.offAllNamed('/login');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
  
  void handleMenuAction(String action) {
    switch (action) {
      case 'personal_info':
        Get.snackbar(
          'Personal Information',
          'Edit your personal information',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'payment_methods':
        Get.snackbar(
          'Payment Methods',
          'Manage your payment methods',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'security':
        Get.snackbar(
          'Security',
          'Manage your security settings',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'notifications':
        Get.snackbar(
          'Notifications',
          'Manage your notification preferences',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'privacy_policy':
        Get.snackbar(
          'Privacy Policy',
          'View our privacy policy',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'help_support':
        Get.snackbar(
          'Help & Support',
          'Get help and support',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      case 'about':
        Get.snackbar(
          'About',
          'About EasyPay',
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
    }
  }
}
