import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController {
  final RxString amount = '₹0.00'.obs;
  final RxString balance = '₹4,590.00'.obs;
  final RxList<Map<String, dynamic>> bankAccounts = <Map<String, dynamic>>[].obs;
  final RxInt selectedAccountIndex = 0.obs;
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadBankAccounts();
  }
  
  void loadBankAccounts() {
    bankAccounts.value = [
      {
        'id': '1',
        'bank_name': 'HDFC Bank',
        'account_number': '****5678',
        'account_holder': 'Samantha Wilson',
        'icon': Icons.account_balance,
        'color': Colors.blue,
      },
      {
        'id': '2',
        'bank_name': 'ICICI Bank',
        'account_number': '****1234',
        'account_holder': 'Samantha Wilson',
        'icon': Icons.account_balance,
        'color': Colors.orange,
      },
      {
        'id': '3',
        'bank_name': 'SBI',
        'account_number': '****9876',
        'account_holder': 'Samantha Wilson',
        'icon': Icons.account_balance,
        'color': Colors.green,
      },
    ];
  }
  
  void selectAccount(int index) {
    selectedAccountIndex.value = index;
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
  
  void setAmount(String value) {
    // Remove non-numeric characters
    String numericValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (numericValue.isEmpty) {
      numericValue = '0';
    }
    amount.value = '₹$numericValue.00';
  }
  
  void withdraw() {
    // Check if amount is valid
    final numericAmount = double.parse(amount.value.replaceAll('₹', '').replaceAll(',', ''));
    final numericBalance = double.parse(balance.value.replaceAll('₹', '').replaceAll(',', ''));
    
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
    
    if (numericAmount > numericBalance) {
      Get.snackbar(
        'Insufficient Balance',
        'You do not have enough balance for this withdrawal',
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
          title: const Text('Withdrawal Successful'),
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
                'Your withdrawal request has been processed successfully.',
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
                'Bank: ${bankAccounts[selectedAccountIndex.value]['bank_name']}',
              ),
              const SizedBox(height: 4),
              Text(
                'Account: ${bankAccounts[selectedAccountIndex.value]['account_number']}',
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
