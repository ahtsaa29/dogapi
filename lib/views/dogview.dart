import 'package:api/controller/DogController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogView extends StatelessWidget {
  const DogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dc = Get.find<DogController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (dc.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: dc.DogList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(dc.DogList[index].name!),
                      leading: Image.network(dc.DogList[index].image.url),
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
