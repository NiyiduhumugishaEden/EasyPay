import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class TransferReceiptController extends GetxController {
  final RxString amount = '\$132.00'.obs;
  final RxString recipient = 'Nayantara V'.obs;
  final RxString phone = '8050530XXX'.obs;
  final RxString time = '3:02 PM'.obs;

  void done() {
    Get.offAllNamed(Routes.HOME);
  }

  void transferMore() {
    Get.offNamed(Routes.SEND_MONEY);
  }
}
