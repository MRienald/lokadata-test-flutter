// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:message_board_mobile/presentation/messageboard/message_board_controller.dart';
import 'package:message_board_mobile/resources/resources.dart';
import 'package:message_board_mobile/utils/widget/rhombus_container.dart';
import 'package:sizer/sizer.dart';

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
                backgroundColor: Color.fromARGB(255, 206, 185, 143),
              ),
              body: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Message Board",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Text(
                      "Berbagi pesanmu disini!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                            color: AppColors.background3,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Icon(
                            Icons.search_rounded,
                            size: 10.w,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Container(
                          alignment: Alignment.center,
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                            color: AppColors.background3,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Icon(
                            Icons.headphones_rounded,
                            size: 10.w,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Container(
                          alignment: Alignment.center,
                          height: 7.h,
                          width: 7.h,
                          decoration: BoxDecoration(
                            color: AppColors.background3,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Icon(
                            Icons.add_comment_rounded,
                            size: 10.w,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Container(
                      height: 25.h,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://thumbor.comeup.com/unsafe/fit-in/1260x708/filters:quality(90):no_upscale()/uploads/media/picture/2023-05-09/11350373-4738654-645a61fc666ab.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Text(
                      "Message",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.5.h),
                      height: 24.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.dataList.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 21.7.h,
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.background3,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AppImages.imgCallCenter.image().image,
                                          ),
                                          SizedBox(width: 3.w,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 35.w,
                                                child: Text(
                                                  controller.dataList[index].user?.name ?? '-- no name --',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 45.w,
                                                child: Text(
                                                  '< ${controller.dataList[index].user?.email ?? ''}>',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 2.h,),
                                      Text(
                                        controller.dataList[index].message ?? '',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 1.2.w,
                                child: Container(
                                  height: 8.w,
                                  width: 8.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryRed,
                                    shape: BoxShape.circle
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    size: 5.5.w,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 1.2.w,
                                child: InkWell(
                                  onTap: () {
                                    Logger().e("Delete");
                                  },
                                  child: Container(
                                    height: 8.w,
                                    width: 8.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.background2.withOpacity(0.3),
                                      shape: BoxShape.circle
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 2.5.h,
                                left: 4.w,
                                child: InkWell(
                                  onTap: () {
                                    Logger().e("Update");
                                  },
                                  child: Container(
                                    height: 8.w,
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.blueTag.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text(
                                      "Edit Pesan",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.darkGrey
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 3.h,
                                right: 6.w,
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  height: 4.5.h,
                                  child: Text(
                                    controller.formatDate(controller.dataList[index].updatedAt ?? DateTime.now()),
                                    style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
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