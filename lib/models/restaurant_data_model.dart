// To parse this JSON data, do
//
//     final restaurantData = restaurantDataFromJson(jsonString);

import 'dart:convert';

List<RestaurantData> restaurantDataFromJson(String str) => List<RestaurantData>.from(json.decode(str).map((x) => RestaurantData.fromJson(x)));

String restaurantDataToJson(List<RestaurantData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantData {
    RestaurantData({
        this.city,
        this.name,
        this.owner,
        this.rating,
        this.street,
        this.tables,
        this.type,
        this.zipcode,
        this.percentage
    });

    String city;
    String name;
    String owner;
    double rating;
    String street;
    int tables;
    String type;
    String zipcode;
    int percentage;

    factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
        city: json["city"],
        name: json["name"],
        owner: json["owner"],
        rating: json["rating"].toDouble(),
        street: json["street"],
        tables: json["tables"],
        type: json["type"],
        zipcode: json["zipcode"],
        percentage: json["percentage"]
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "name": name,
        "owner": owner,
        "rating": rating,
        "street": street,
        "tables": tables,
        "type": type,
        "zipcode": zipcode,
        "percentage": percentage
    };
}
