import 'dart:convert';
import 'package:http/http.dart' as http;

class AppUtils {
  static Future<dynamic> sendRequest({
    required String endpoint,
  }) async {
    var uri = Uri.parse(endpoint);
    var httpClient = http.Client();

    http.Response? response;
    response = await httpClient.get(uri);

    return json.decode(response.body);
  }
}
