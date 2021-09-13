import 'package:facebook/data/Repository.dart';
import 'package:facebook/screens/navScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/newsfeed_states.dart';
import 'bloc/newsfeed_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NewsFeedBloc(InitialState(), Repository()),
        child: NavScreen(),
      ),
    );
  }
}
