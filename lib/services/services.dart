import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/idea_model.dart';

class ApiServices {
  String endpoint = 'https://ideas.b-labs.ch/api/ideas.json?page_size=1000';

  Future<List<IdeaModel>> getIdeas() async {
    String username = 'hello@b-labs.ch';
    String password = 'adminadmin123';
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$username:$password'))}';

    Response response = await get(Uri.parse(endpoint));
    response = await get(Uri.parse(endpoint),
        headers: <String, String>{'authorization': basicAuth});

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => IdeaModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final ideaProvider = Provider<ApiServices>((ref) => ApiServices());
