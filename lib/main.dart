import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_book_design/widgets/custom_book_new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // You can adjust this to match your design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'BD books New App',
          home: HomeScreen(),
          // getPages: AppRoutes.appRoutes(),
          // initialRoute: RouteName.splashScreen,
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageCardNew(
            imageUrl:
            'https://wafilife-media.wafilife.com/uploads/2021/04/message-01-250x379.jpg',
          ),

        ],
      ),
    );
  }
}
