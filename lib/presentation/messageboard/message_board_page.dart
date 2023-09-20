import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_board_mobile/presentation/messageboard/message_board_controller.dart';
import 'package:message_board_mobile/resources/resources.dart';
import 'package:message_board_mobile/utils/widget/parent_app_bar.dart';

class MessageBoardPage extends StatelessWidget{
  const MessageBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: GetBuilder<MessageBoardController>(
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.colorPrimary,
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: AppColors.approvedState,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}