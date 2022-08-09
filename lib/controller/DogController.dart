import 'package:api/models/DogModel.dart';
import 'package:api/services/remoteservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogController extends GetxController {
  var DogList = <DogModel>[].obs;
  final isLoading = true.obs;

  Future getDog() async {
    try {
      isLoading(true);
      var dog = await RemoteServices.fetchDogList();
      (dog != null) ? DogList.value = dog : null;
    } catch (e) {
      Get.defaultDialog(
        title: "Controller error",
        content: Text(
          e.toString(),
        ),
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDog();
  }
}
