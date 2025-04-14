import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class RotatingWorkTypeForm {
  Future<Map<String, dynamic>?> createRotatingWorkType(
      Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var typedServerUrl = prefs.getString("typed_url");
    var response = await http.post(
      Uri.parse('$typedServerUrl/api/rotatingworktype/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      print("Failed to create rotating work type: ${response.statusCode}");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getRotatingWorkTypeDetails(int workTypeId) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var typedServerUrl = prefs.getString("typed_url");
    var response = await http.get(
      Uri.parse('$typedServerUrl/api/rotatingworktype/$workTypeId/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(
          "Failed to get rotating work type details: ${response.statusCode}");
      return null;
    }
  }

  Future<Map<String, dynamic>?> updateRotatingWorkType(
      int workTypeId, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var typedServerUrl = prefs.getString("typed_url");
    var response = await http.put(
      Uri.parse('$typedServerUrl/api/rotatingworktype/$workTypeId/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(
          "Failed to update rotating work type: ${response.statusCode}");
      return null;
    }
  }
}