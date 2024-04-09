import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_api/core/constants.dart';

import '../../model/history.dart';

class HistorySearchResult extends StatefulWidget {
   final String query;
  const HistorySearchResult({super.key, required this.query});

  @override
  State<HistorySearchResult> createState() => _HistorySearchResultState();
}

class _HistorySearchResultState extends State<HistorySearchResult> {
  late Future<History> _history;

  List<History> histories = [];

  @override
  void initState() {
    super.initState();
    _history = fetchData(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<History>(
        future: _history,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data!.title),
            );
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  //TODO: fix API
  Future<History> fetchData(String query) async {
    final HttpLink httpLink = HttpLink(AppConstants.kBaseUrl);

    final ValueNotifier<GraphQLClient> qlClient = ValueNotifier(
        GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())));

    final result = await qlClient.value.query(
      QueryOptions(document: gql(AppConstants.historyQuery),),
    );
    // parse response into a list of history objects
    histories = (result.data!['histories'] as List)
        .map((historyJson) => History.fromJson(historyJson))
        .toList();

    return History.fromJson(result.data!['histories']);
  }
}
