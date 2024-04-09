import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_api/app/presentation/home.dart';
import 'package:spacex_api/core/constants.dart';

class SpaceX extends StatelessWidget {
  // final HttpLink httpLink = HttpLink(AppConstants.kBaseUrl);
  //
  //     final ValueNotifier<GraphQLClient> qlClient = ValueNotifier(
  //   GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())));
      const SpaceX({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(AppConstants.kBaseUrl);

    final ValueNotifier<GraphQLClient> qlClient = ValueNotifier(
        GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())));
    return GraphQLProvider(
      client: qlClient,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(fontFamily: AppConstants.kFont),
        home: const HomeScreen(),
      ),
    );
  }
}
