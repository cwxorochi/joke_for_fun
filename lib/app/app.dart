import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:joke_app/app/theme.dart';
import 'package:joke_app/backend/backend.dart';
import 'package:joke_app/home/home_screen.dart';

class JokeApp extends StatelessWidget {
  const JokeApp({Key key, this.backend})
      : assert(backend != null),
        super(key: key);

  final Backend backend;

  @override
  Widget build(BuildContext context) {
    timeDilation = 5;
    return Provider.value(
      value: backend,
      child: MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
