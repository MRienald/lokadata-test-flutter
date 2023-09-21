// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:message_board_mobile/data/local/storage/storage_constants.dart';
import 'package:message_board_mobile/data/remote/api_services.dart';
import 'package:message_board_mobile/data/remote/base/base_controller.dart';
import 'package:message_board_mobile/data/remote/errorhandler/error_handler.dart';
import 'package:message_board_mobile/model/message.dart';

class MessageBoardController extends BaseController<Message> {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  @override
  // TODO: implement statusData
  get statusData => dataList;

  @override
  // TODO: implement storageName
  String get storageName => StorageName.MESSAGE;

  @override
  void onInit() async {
    await getAllMessage();
    super.onInit();
  }

  String formatDate(DateTime date) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    return '$day/$month/$year';
  }

  Future<void> getAllMessage() async {
    await RestClient.create().then(
      (value) => value
      .getAllMessage()
      .validateResponse()
      .then((data) async {
        await saveCacheAndFinish(list: data.data);
      }).handleError((onError){
        finishLoadData(errorMessage: onError.toString());
        debugPrint("error : " + onError.toString());
        return throw onError;
      })
    );
  }

}