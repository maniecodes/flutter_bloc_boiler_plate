import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boiler_plate/blocs/bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider(
    create: (context) {
      // return
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text('Welcome to Flutter Bloc'),
          ),
        ),
      ),
    );
  }
}
