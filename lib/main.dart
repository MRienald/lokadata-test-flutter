import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:message_board_mobile/initializer.dart';
import 'package:message_board_mobile/routes/page_names.dart';
import 'package:message_board_mobile/routes/page_routes.dart';
import 'package:message_board_mobile/themes/app_theme.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    Get.put(GetStorage());
  } else {
    await Initializer.init();
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // translations: AppTranslation(),
        // locale: LocaleHelper().getCurrentLocale(),
        // fallbackLocale: LocaleHelper().fallbackLocale,
        initialRoute: PageName.MESSAGEBOARD,
        getPages: PageRoutes.pages,
        theme: AppTheme.buildThemeData(false),
        builder: (BuildContext context, child) {
          return MediaQuery(
            child: child ?? Container(),
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
      );
    });
  }
}