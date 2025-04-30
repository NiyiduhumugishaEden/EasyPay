import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'shared/themes/app_theme.dart';

class EasyPayApp extends StatelessWidget {
  const EasyPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EasyPay',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
