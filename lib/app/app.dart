import 'package:flutter/material.dart';
import 'package:spacex_api/presentation/home.dart';

class SpaceX extends StatelessWidget {
  const SpaceX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light(
        useMaterial3: true
       ).copywith(
       fontFamily: 'One Ui Sans'
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true
      ).copywith(
       fontFamily: 'One Ui Sans'
      ),
      home: HomeScreen(),
    );
  }
}
