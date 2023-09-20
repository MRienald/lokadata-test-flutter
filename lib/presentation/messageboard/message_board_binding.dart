import 'package:get/get.dart';
import 'package:message_board_mobile/presentation/messageboard/message_board_controller.dart';

class MessageBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MessageBoardController>(() => MessageBoardController());
  }
}