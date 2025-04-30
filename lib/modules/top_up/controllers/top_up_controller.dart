import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  final RxString amount = '₹0.00'.obs;
  final RxList<String> quickAmounts = ['₹100', '₹500', '₹1000', '₹2000'].obs;
  final RxList<Map<String, dynamic>> paymentMethods = <Map<String, dynamic>>[].obs;
  final RxInt selectedMethodIndex = 0.obs;
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    loadPaymentMethods();
  }
  
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
  
  void loadPaymentMethods() {
    paymentMethods.value = [
      {
        'id': '1',
        'name': 'Credit/Debit Card',
        'icon': Icons.credit_card,
        'color': Colors.blue,
        'details': 'Visa **** 5678',
      },
      {
        'id': '2',
        'name': 'UPI',
        'icon': Icons.account_balance,
        'color': Colors.green,
        'details': 'samantha@upi',
      },
      {
        'id': '3',
        'name': 'Net Banking',
        'icon': Icons.language,
        'color': Colors.orange,
        'details': 'HDFC Bank',
      },
      {
        'id': '4',
        'name': 'Wallet',
        'icon': Icons.account_balance_wallet,
        'color': Colors.purple,
        'details': 'PayTM Wallet',
      },
    ];
  }
  
  void selectPaymentMethod(int index) {
    selectedMethodIndex.value = index;
  }
  
  void setQuickAmount(String amount) {
    this.amount.value = amount;
  }
  
  void appendDigit(String digit) {
    String currentAmount = amount.value.replaceAll('₹', '').replaceAll('.00', '');
    if (currentAmount == '0') {
      currentAmount = digit;
    } else {
      currentAmount += digit;
    }
    amount.value = '₹$currentAmount.00';
  }

  void deleteDigit() {
    String currentAmount = amount.value.replaceAll('₹', '').replaceAll('.00', '');
    if (currentAmount.length > 1) {
      currentAmount = currentAmount.substring(0, currentAmount.length - 1);
    } else {
      currentAmount = '0';
    }
    amount.value = '₹$currentAmount.00';
  }
  
  void topUp() {
    // Check if amount is valid
    final numericAmount = double.parse(amount.value.replaceAll('₹', '').replaceAll(',', ''));
    
    if (numericAmount <= 0) {
      Get.snackbar(
        'Invalid Amount',
        'Please enter an amount greater than 0',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    
    // Show loading
    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      
      // Show success dialog
      Get.dialog(
        AlertDialog(
          title: const Text('Top Up Successful'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              const SizedBox(height: 16),
              const Text(
                'Your account has been topped up successfully.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Amount: ${amount.value}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Payment Method: ${paymentMethods[selectedMethodIndex.value]['name']}',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('Done'),
            ),
          ],
        ),
      );
    });
  }
}
