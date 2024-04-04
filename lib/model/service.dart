
import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_api/model/history.dart';

class SpaceXService {
  static Future<History> fetchData() async {
    // setState(() {
    // _loading = true
    // })
    HttpLink link = HttpLink('https://spacex-production.up.railway.app/');
    GraphQLClient qlClient = GraphQLClient(
        link: link,
        cache: GraphQLCache(
            store: HiveStore(),
        )
    );
    QueryResult qResult = await qlClient.query(
      QueryOptions(
        document: gql(
          """
          query SpaceX(\$sort: String) {
              company {
                ceo
                coo
                cto
                employees
                name
            }
            histories(sort: \$sort) { 
              id
              title
              details
              event_date_utc
            }
          }
          """
        )
      ),
    );
    final json = jsonDecode(qResult.data!['histories']);
    return History.fromJson(json);
  }
}