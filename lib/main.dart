import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pro_cats/bloc/fact_bloc.dart';
import 'package:pro_cats/entity/cat_fact.dart';
import 'package:pro_cats/home_screen.dart';


Future<void> main() async{
  await Hive.initFlutter();

  Hive.registerAdapter(CatFactAdapter());
  await Hive.openBox<CatFact>('facts');

  runApp(BlocProvider(
    create: (_) => FactBloc()..add(UpdateFact()),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Pro Cats';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.black45,
            shadowColor: Colors.black45
        ),
        title: _title,
        home: HomeScreen()
    );
  }
}

