import 'package:flutter/material.dart';
import 'package:joke_app/app/app.dart';
import 'package:joke_app/backend/backend.dart';

void main() {
  final backend =
      Backend(hostUrl: 'https://v2.jokeapi.dev/joke/Programming,Pun');

  runApp(
    JokeApp(
      backend: backend,
    ),
  );
}
