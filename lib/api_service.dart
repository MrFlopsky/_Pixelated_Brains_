import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = "http://127.0.0.1:5000"; // Use http://127.0.0.1:5000 for browser testing

  static Future<Map<String, dynamic>> generateSoundtrack(
      String genre, List<String> instruments) async {
    final url = Uri.parse("$_baseUrl/generate");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"genre": genre, "instruments": instruments}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Response Data: $responseData"); // Debugging log
        return responseData;
      } else {
        throw Exception("Failed to generate soundtrack. Status Code: ${response.statusCode}");
      }

    } catch (e) {
      print("Error: $e");
      return {"status": "error", "message": e.toString()};
    }
  }
}
