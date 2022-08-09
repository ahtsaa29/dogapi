import 'package:api/bindings/controllerbinging.dart';
import 'package:api/views/dogview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: ControllerBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DogView(),
    );
  }
}
