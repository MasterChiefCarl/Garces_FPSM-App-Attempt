import 'package:flutter/material.dart';
import 'package:fpsm_garces/controllers/data_class.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>DataClass(),
    child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider State Management App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const HomePage()
    ),);
  }
}