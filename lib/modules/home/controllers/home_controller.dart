// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../routes/app_routes.dart';

// class HomeController extends GetxController {
//   final RxString balance = '₹4,590.00'.obs;
//   final RxString cardNumber = '4242424242424242'.obs;
//   final RxString cardHolderName = 'Samantha Wilson'.obs;
//   final RxString expiryDate = '12/25'.obs;
//   final RxList transactions = [].obs;
//   final RxInt currentNavIndex = 0.obs;

//   // For animated greeting
//   final RxString greeting = 'Hi, '.obs;
//   final RxString userName = 'Samantha'.obs;
//   final RxDouble opacity = 0.0.obs;
  
//   // For services
//   final services = [
//     {'icon': Icons.language, 'name': 'Internet', 'color': const Color(0xFF64B5F6)},
//     {'icon': Icons.water_drop, 'name': 'Water', 'color': const Color(0xFF4FC3F7)},
//     {'icon': Icons.bolt, 'name': 'Electricity', 'color': const Color(0xFFFFB74D)},
//     {'icon': Icons.tv, 'name': 'TV Cable', 'color': const Color(0xFF9575CD)},
//     {'icon': Icons.directions_car, 'name': 'Vehicle', 'color': const Color(0xFFE57373)},
//     {'icon': Icons.home, 'name': 'Rent', 'color': const Color(0xFF4DB6AC)},
//     {'icon': Icons.trending_up, 'name': 'Invest', 'color': const Color(0xFF81C784)},
//     {'icon': Icons.grid_view, 'name': 'More', 'color': const Color(0xFFBA68C8)},
//   ];

//   @override
//   void onInit() {
//     super.onInit();
//     // Simulate fetching data
//     loadTransactions();
    
//     // Animate greeting
//     Future.delayed(const Duration(milliseconds: 300), () {
//       opacity.value = 1.0;
//     });
//   }

//   void loadTransactions() {
//     transactions.addAll([
//       {
//         'name': 'Raj K',
//         'date': 'February 24, 2022',
//         'amount': '₹240.00',
//         'type': 'send',
//         'icon': Icons.directions_car,
//         'color': const Color(0xFFE57373),
//       },
//       {
//         'name': 'Priya M',
//         'date': 'February 22, 2022',
//         'amount': '₹1,200.00',
//         'type': 'receive',
//         'icon': Icons.home,
//         'color': const Color(0xFF4DB6AC),
//       },
//       {
//         'name': 'Electricity Bill',
//         'date': 'February 20, 2022',
//         'amount': '₹450.00',
//         'type': 'send',
//         'icon': Icons.bolt,
//         'color': const Color(0xFFFFB74D),
//       },
//     ]);
//   }

//   void goToSendMoney() {
//     Get.toNamed(Routes.SEND_MONEY);
//   }

//   void goToTopUp() {
//     Get.snackbar(
//       'Top Up',
//       'Top Up feature coming soon!',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.black87,
//       colorText: Colors.white,
//       margin: const EdgeInsets.all(16),
//       borderRadius: 16,
//     );
//   }

//   void goToWithdraw() {
//     Get.snackbar(
//       'Withdraw',
//       'Withdraw feature coming soon!',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.black87,
//       colorText: Colors.white,
//       margin: const EdgeInsets.all(16),
//       borderRadius: 16,
//     );
//   }
  
//   void changeNavIndex(int index) {
//     currentNavIndex.value = index;
    
//     if (index == 1) {
//       Get.snackbar(
//         'History',
//         'Transaction history feature coming soon!',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.black87,
//         colorText: Colors.white,
//         margin: const EdgeInsets.all(16),
//         borderRadius: 16,
//       );
//     } else if (index == 2) {
//       Get.snackbar(
//         'Scan QR',
//         'QR scanning feature coming soon!',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.black87,
//         colorText: Colors.white,
//         margin: const EdgeInsets.all(16),
//         borderRadius: 16,
//       );
//     } else if (index == 3) {
//       Get.snackbar(
//         'Notifications',
//         'Notifications feature coming soon!',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.black87,
//         colorText: Colors.white,
//         margin: const EdgeInsets.all(16),
//         borderRadius: 16,
//       );
//     } else if (index == 4) {
//       Get.snackbar(
//         'Profile',
//         'Profile feature coming soon!',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.black87,
//         colorText: Colors.white,
//         margin: const EdgeInsets.all(16),
//         borderRadius: 16,
//       );
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final RxString balance = '₹4,590.00'.obs;
  final RxString cardNumber = '4242424242424242'.obs;
  final RxString cardHolderName = 'Samantha Wilson'.obs;
  final RxString expiryDate = '12/25'.obs;
  final RxList transactions = [].obs;
  final RxInt currentNavIndex = 0.obs;

  // For animated greeting
  final RxString greeting = 'Hi, '.obs;
  final RxString userName = 'Samantha'.obs;
  final RxDouble opacity = 0.0.obs;
  
  // For services
  final services = [
    {'icon': Icons.language, 'name': 'Internet', 'color': const Color(0xFF64B5F6)},
    {'icon': Icons.water_drop, 'name': 'Water', 'color': const Color(0xFF4FC3F7)},
    {'icon': Icons.bolt, 'name': 'Electricity', 'color': const Color(0xFFFFB74D)},
    {'icon': Icons.tv, 'name': 'TV Cable', 'color': const Color(0xFF9575CD)},
    {'icon': Icons.directions_car, 'name': 'Vehicle', 'color': const Color(0xFFE57373)},
    {'icon': Icons.home, 'name': 'Rent', 'color': const Color(0xFF4DB6AC)},
    {'icon': Icons.trending_up, 'name': 'Invest', 'color': const Color(0xFF81C784)},
    {'icon': Icons.grid_view, 'name': 'More', 'color': const Color(0xFFBA68C8)},
  ];

  @override
  void onInit() {
    super.onInit();
    // Simulate fetching data
    loadTransactions();
    
    // Animate greeting
    Future.delayed(const Duration(milliseconds: 300), () {
      opacity.value = 1.0;
    });
  }

  void loadTransactions() {
    transactions.addAll([
      {
        'name': 'Raj K',
        'date': 'February 24, 2022',
        'amount': '₹240.00',
        'type': 'send',
        'icon': Icons.directions_car,
        'color': const Color(0xFFE57373),
      },
      {
        'name': 'Priya M',
        'date': 'February 22, 2022',
        'amount': '₹1,200.00',
        'type': 'receive',
        'icon': Icons.home,
        'color': const Color(0xFF4DB6AC),
      },
      {
        'name': 'Electricity Bill',
        'date': 'February 20, 2022',
        'amount': '₹450.00',
        'type': 'send',
        'icon': Icons.bolt,
        'color': const Color(0xFFFFB74D),
      },
    ]);
  }

  void goToSendMoney() {
    Get.toNamed(Routes.SEND_MONEY);
  }

  void goToTopUp() {
    Get.toNamed(Routes.TOP_UP);
  }

  void goToWithdraw() {
    Get.toNamed(Routes.WITHDRAW);
  }
  
  void changeNavIndex(int index) {
    currentNavIndex.value = index;
    
    if (index == 1) {
      Get.toNamed(Routes.HISTORY);
    } else if (index == 2) {
      Get.snackbar(
        'Scan QR',
        'QR scanning feature coming soon!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 16,
      );
    } else if (index == 3) {
      Get.toNamed(Routes.NOTIFICATIONS);
    } else if (index == 4) {
      Get.toNamed(Routes.PROFILE);
    }
  }
}
