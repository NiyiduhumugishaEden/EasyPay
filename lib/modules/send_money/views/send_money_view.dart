import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/app_assets.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/widgets/custom_button.dart';
import '../controllers/send_money_controller.dart';
import '../widgets/keypad_button.dart';

class SendMoneyView extends GetView<SendMoneyController> {
  const SendMoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the values directly to avoid nesting Obx widgets
    final String recipientName = controller.recipient.value;
    final String phoneNumber = controller.phone.value;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: controller.goBack,
        ),
        title: const Text('Send Money'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Recipient Info
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Hero(
                  tag: 'recipient_avatar',
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: AppColors.primaryGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(AppAssets.avatar),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  recipientName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  phoneNumber,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          
          // Amount display with Obx
          Obx(() => Text(
            controller.amount.value,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          )),
          
          const SizedBox(height: 24),
          
          // Keypad
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Prevent overflow
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeypadButton(
                        text: '1',
                        onTap: () => controller.appendDigit('1'),
                      ),
                      KeypadButton(
                        text: '2',
                        onTap: () => controller.appendDigit('2'),
                      ),
                      KeypadButton(
                        text: '3',
                        onTap: () => controller.appendDigit('3'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeypadButton(
                        text: '4',
                        onTap: () => controller.appendDigit('4'),
                      ),
                      KeypadButton(
                        text: '5',
                        onTap: () => controller.appendDigit('5'),
                      ),
                      KeypadButton(
                        text: '6',
                        onTap: () => controller.appendDigit('6'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeypadButton(
                        text: '7',
                        onTap: () => controller.appendDigit('7'),
                      ),
                      KeypadButton(
                        text: '8',
                        onTap: () => controller.appendDigit('8'),
                      ),
                      KeypadButton(
                        text: '9',
                        onTap: () => controller.appendDigit('9'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      KeypadButton(
                        text: '.',
                        onTap: controller.addDecimal,
                      ),
                      KeypadButton(
                        text: '0',
                        onTap: () => controller.appendDigit('0'),
                      ),
                      KeypadButton(
                        icon: Icons.backspace_rounded,
                        onTap: controller.deleteDigit,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Send Button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CustomButton(
              text: 'Send Money',
              onPressed: controller.sendMoney,
              isGradient: true,
              icon: Icons.send_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
