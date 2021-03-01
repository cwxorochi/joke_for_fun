import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class Backend {
  const Backend({this.hostUrl});

  final String hostUrl;

  Future<Joke> getJoke() async {
    final url = '$hostUrl';

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final body = response.body;

    final jsonData = json.decode(body);

    final joke = Joke.fromJson(jsonData);

    return joke;
  }
}

class Joke {
  const Joke({
    @required this.id,
    this.category,
    this.setup,
    this.delivery,
    this.joke,
  });

  factory Joke.fromJson(Map<String, dynamic> jsonMap) {
    return Joke(
      id: jsonMap['id'],
      category: jsonMap['Pun'],
      setup: jsonMap['setup'],
      delivery: jsonMap['delivery'],
      joke: jsonMap['joke'],
    );
  }

  // factory Rocket.fromMap(Map<String, dynamic> json) {}
  final int id;
  final String category;
  final String setup;
  final String delivery;
  final String joke;
}
