import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto_e_commerce/presentation/screens/splash/splash.dart';
import 'constants/theme_data.dart';
import 'helper/bloc_observer.dart';
import 'helper/project_routes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tokoto',
        theme: projectThemeData(),
        initialRoute: SplashScreen.routeName,
        routes: projectRoutes);
  }
}
