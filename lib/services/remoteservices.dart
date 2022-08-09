import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/DogModel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<DogModel>?> fetchDogList() async {
    try {
      var response = await client.get(
        Uri.parse("https://api.thedogapi.com/v1/breeds"),
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return dogModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.defaultDialog(
        title: "ServiceError",
        content: Text(
          e.toString(),
        ),
      );
    }
    return null;
  }
}
