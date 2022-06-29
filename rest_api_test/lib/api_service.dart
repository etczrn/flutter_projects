import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rest_api_test/constants.dart';
import 'package:rest_api_test/model.dart';

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      // * 1. Hit the GET HTTP request.
      var response = await http.get(url);
      // * 2. Check whether the API call was successful or not using response.statusCode
      // * If the statusCode is 200,
      // *  we then convert the JSON (response.body) into a List
      // * using the method userFromJson, which is available in the model class that we created,
      // * and then return the model object.
      if (response.statusCode == 200) {
        List<User> model = userFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
