import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/app_assets.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_card.dart';
import '../controllers/transfer_receipt_controller.dart';

class TransferReceiptView extends GetView<TransferReceiptController> {
  const TransferReceiptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Get.back(),
        ),
        title: const Text('Transfer Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Success Card
                    CustomCard(
                      padding: const EdgeInsets.all(24),
                      borderRadius: 24,
                      child: Column(
                        children: [
                          // Success Illustration with animation
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.8, end: 1.0),
                            duration: const Duration(seconds: 1),
                            curve: Curves.elasticOut,
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Image.asset(
                                  AppAssets.success,
                                  height: 150,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Transfer Success',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Your money has been successfully sent to',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Obx(() => Text(
                            controller.recipient.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          )),
                          const SizedBox(height: 24),
                          Container(
                            height: 1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Total Transfer',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(() => Text(
                            controller.amount.value,
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          )),
                          const SizedBox(height: 24),
                          // Recipient Info
                          CustomCard(
                            padding: const EdgeInsets.all(16),
                            backgroundColor: Colors.grey.shade50,
                            borderRadius: 16,
                            hasShadow: false,
                            child: Row(
                              children: [
                                Hero(
                                  tag: 'recipient_avatar',
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundImage: AssetImage(AppAssets.avatar),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Obx(() => Text(
                                        controller.recipient.value,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: AppColors.primary,
                                        ),
                                      )),
                                      Obx(() => Text(
                                        controller.phone.value,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textSecondary,
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Obx(() => Text(
                                  controller.time.value,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Buttons
            CustomButton(
              text: 'Done',
              onPressed: controller.done,
              isGradient: true,
              icon: Icons.check_circle_rounded,
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: controller.transferMore,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text(
                'Transfer more money',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
