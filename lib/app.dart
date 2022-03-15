import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/binding/init_binding.dart';
import 'package:todolist/content_root.dart';
import 'package:todolist/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "todolist",
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'SpoqaHanSansNeo',
      ),
      routes: routes,
      initialBinding: InitBinding(),
      home: const ContentRoot(),
    );
  }
}
