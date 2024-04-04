import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_api/core/constants.dart';
import 'package:spacex_api/model/history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 // late  History history;
  List<History> history = [];
  final bool _isLoading = false;
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: _isLoading ?
              const CircularProgressIndicator() :  Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          history[index].title,
                          style: Theme.of(context).textTheme.titleLarge
                      ),
                      subtitle: Text(
                          '${history[index].eventDateUtc}',
                          style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<History> fetchData() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   HttpLink link = HttpLink(AppConstants.kBaseUrl);
  //   GraphQLClient qlClient = GraphQLClient(
  //     link: link,
  //     cache: GraphQLCache(
  //       store: HiveStore(),
  //     ),
  //   );
  //   Query(
  //     options: QueryOptions(
  //       document: gql(
  //           """
  //         query SpaceX() {
  //           histories() {
  //             id
  //             title
  //             details
  //             event_date_utc
  //           }
  //         }
  //         """
  //       )
  //     ),
  //     builder: (QueryResult<Object?> result, Future<QueryResult<Object?>> Function(FetchMoreOptions)? fetchMore, Future<QueryResult<Object?>?> Function()? refetch) {
  //
  //     },
  //   );
  //   //
  //   // setState(() {
  //   //   history = qResult.data!['histories'];
  //   //   _isLoading = false;
  //   // });
  //   final json = jsonDecode(result.data!['histories']);
  //   return History.fromJson(json);
  // }
}
