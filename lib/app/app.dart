import 'package:flutter/material.dart';
import 'package:spacex_api/core/constants.dart';
import 'package:spacex_api/presentation/home.dart';

class SpaceX extends StatelessWidget {
  const SpaceX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(fontFamily: AppConstants.kFont),
      home: const HomeScreen(),
    );
  }
}
