import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_api/core/constants.dart';
import 'package:spacex_api/presentation/home.dart';

class SpaceX extends StatelessWidget {
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
