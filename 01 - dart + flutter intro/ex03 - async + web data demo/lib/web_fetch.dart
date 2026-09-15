import 'dart:convert';

import 'package:http/http.dart' as http;

/// Returns JSON from a provided endpoint
///
/// Will throw a [FormatException] if the [endpoint] is not a well-formed URI.
Future<dynamic> getJSON(String endpoint) async {
  final url = Uri.parse(endpoint);
  final response = await http.get(url);
  return jsonDecode(response.body);
}
