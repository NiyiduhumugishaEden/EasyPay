import 'package:get/get.dart';
import '../controllers/transfer_receipt_controller.dart';

class TransferReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferReceiptController>(
      () => TransferReceiptController(),
    );
  }
}
