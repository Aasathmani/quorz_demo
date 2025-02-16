import 'dart:convert';

import 'package:app_qoruz/src/core/exceptions.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<Map<String, dynamic>>> fetchRecentList(int count) async {
    try {
      final url = Uri.parse(
          "https://staging3.hashfame.com/api/v1/interview.mplist?page=$count");
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        final List<dynamic> jsonData =
            jsonResponse['marketplace_requests'] as List<dynamic>? ?? [];

        return jsonData.map((e) => e as Map<String, dynamic>).toList();
      } else {
        throw APIValidationFailException(
          message:
              "Failed to fetch recent list. Status Code: ${response.statusCode}",
        );
      }
    } catch (e) {
      if (e is APIValidationFailException) {
        rethrow; // Let the caller handle this error
      }
      throw CustomException(
        'Fetching recent list failed',
        message: e.toString(),
      );
    }
  }
}
