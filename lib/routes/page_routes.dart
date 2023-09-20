import 'package:get/get.dart';
import 'package:message_board_mobile/presentation/messageboard/message_board_page.dart';
import 'package:message_board_mobile/presentation/messageboard/message_board_binding.dart';
import 'package:message_board_mobile/routes/page_names.dart';

class PageRoutes{
  static final pages = [
    GetPage(
      name: PageName.MESSAGEBOARD,
      page: () => const MessageBoardPage(),
      binding: MessageBoardBinding(),
    ),
  ];
}