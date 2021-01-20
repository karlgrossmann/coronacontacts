import 'package:coronacontacts/models/covid_country_data_model.dart';
import 'package:coronacontacts/models/restaurant_data_model.dart';
import 'package:coronacontacts/models/world_covid_data_model.dart';
import 'package:coronacontacts/constants/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiManager {

  Future<CovidCountryData> fetchCountryData() async {
    final response = await http.get(Strings.germany_api_url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return CovidCountryData.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load covid country data.');
    }
  }

  Future<List<WorldCovidDataModel>> fetchWorldData() async {
    var worldCovidDataModel = null;

    try {
      final response = await http.get(Strings.world_api_url);

      if (response.statusCode == 200) {
        var jsonString = response.body;

        worldCovidDataModel = worldCovidDataModelFromJson(jsonString);
      }
    } catch (Exception) {
      return worldCovidDataModel;
    }

    return worldCovidDataModel;
  }

  Future<List<RestaurantData>> fetchRestaurantData() async {
    var restaurantData = null;

    try {
      final response = await http.get(Strings.restaurant_api_url);

      if (response.statusCode == 200) {
        var jsonString = response.body;

        restaurantData = restaurantDataFromJson(jsonString);
      }
      } catch (Exception) {
        return restaurantData;
      }

    return restaurantData;
  }
}