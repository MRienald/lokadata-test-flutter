
import 'package:get_storage/get_storage.dart';
import 'package:message_board_mobile/data/local/storage/storage_constants.dart';

class Initializer {
  static Future<void> init() async {
    try {
      await globalLocalData();
    } catch (err) {
      rethrow;
    }
  }

  static globalLocalData() async {
    await GetStorage.init(StorageName.STORAGE_NAME);
    // Global Local Database
  }
}
