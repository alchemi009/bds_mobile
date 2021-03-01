// To parse this JSON data, do
//
//     final deliveryList = deliveryListFromJson(jsonString);

import 'dart:convert';

DeliveryList deliveryListFromJson(String str) =>
    DeliveryList.fromJson(json.decode(str));

String deliveryListToJson(DeliveryList data) => json.encode(data.toJson());

class DeliveryList {
  DeliveryList({
    this.deliveries,
  });

  List<Delivery> deliveries;

  factory DeliveryList.fromJson(Map<String, dynamic> json) => DeliveryList(
        deliveries: List<Delivery>.from(
            json["deliveries"].map((x) => Delivery.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "deliveries": List<dynamic>.from(deliveries.map((x) => x.toJson())),
      };
}

class Delivery {
  Delivery({
    this.deliveryDate,
    this.id,
    this.latitude,
    this.longitude,
    this.status,
    this.subscriberAddress,
    this.subscriberEmail,
    this.subscriberFname,
    this.subscriberId,
    this.subscriberLname,
  });

  String deliveryDate;
  int id;
  String latitude;
  String longitude;
  Status status;
  String subscriberAddress;
  dynamic subscriberEmail;
  String subscriberFname;
  int subscriberId;
  String subscriberLname;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        deliveryDate: json["delivery_date"],
        id: json["id"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        status: statusValues.map[json["status"]],
        subscriberAddress: json["subscriber_address"],
        subscriberEmail: json["subscriber_email"],
        subscriberFname: json["subscriber_fname"],
        subscriberId: json["subscriber_id"],
        subscriberLname: json["subscriber_lname"],
      );

  Map<String, dynamic> toJson() => {
        "delivery_date": deliveryDate,
        "id": id,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "status": statusValues.reverse[status],
        "subscriber_address": subscriberAddress,
        "subscriber_email": subscriberEmail,
        "subscriber_fname": subscriberFname,
        "subscriber_id": subscriberId,
        "subscriber_lname": subscriberLname,
      };
}

enum Status { DELIVERED, IN_PROGRESS, PENDING }

final statusValues = EnumValues({
  "DELIVERED": Status.DELIVERED,
  "IN-PROGRESS": Status.IN_PROGRESS,
  "PENDING": Status.PENDING
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
