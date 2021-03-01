import 'dart:convert';

import 'package:bds_mobile/constants/strings.dart';
import 'package:bds_mobile/models/deliverymodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<DeliveryList> getDeliveries() async {
    var client = http.Client();

    var deliveryList = null;

    var response = await client.get(Strings.baseUrl);

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        deliveryList = DeliveryList.fromJson(jsonMap);
      }
    } catch (Exception) {
      return deliveryList;
    }

    return deliveryList;
  }
}
