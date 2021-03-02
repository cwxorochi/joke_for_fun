import 'package:flutter/material.dart';
import 'package:joke_app/backend/backend.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Joke> joke;

  @override
  void initState() {
    super.initState();
    joke = context.read<Backend>().getJoke();
  }

  void handleChangeJoke() {
    setState(() {
      joke = context.read<Backend>().getJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Joke for Fun'),
        ),
      ),
      body: FutureBuilder(
        future: joke,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final data = snapshot.data;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 60.0,
                        horizontal: 20.0,
                      ),
                      child: Column(
                        children: [
                          if (data.setup != null)
                            Text(
                              data.setup,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          if (data.setup != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Text(
                                data.delivery,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          if (data.setup == null)
                            Text(
                              data.joke,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        onPressed: () {
                          handleChangeJoke();
                        },
                        child: Center(
                          child: Text('Next'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
