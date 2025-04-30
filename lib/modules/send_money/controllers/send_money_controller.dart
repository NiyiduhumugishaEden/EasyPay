import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SendMoneyController extends GetxController {
  final RxString amount = '₹130.00'.obs;
  final RxString recipient = 'Nayantara V'.obs;
  final RxString phone = '+91 8050530XXX'.obs;

  void appendDigit(String digit) {
    String currentAmount = amount.value.replaceAll('₹', '').replaceAll('.00', '');
    if (currentAmount == '0' || currentAmount == '130') {
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

  void addDecimal() {
    // Not needed for this implementation as we're always showing .00
  }

  void sendMoney() {
    Get.toNamed(Routes.TRANSFER_RECEIPT);
  }

  void goBack() {
    Get.back();
  }
}
