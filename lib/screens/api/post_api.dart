import 'dart:convert';

import 'package:flutter_api/models/post_model.dart';
import 'package:http/http.dart' as http;

Future<List<PostModel>> getData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  final jsonResponse = jsonDecode(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonResponse.map<PostModel>(PostModel.fromjson).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load posts');
  }
}
