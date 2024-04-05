import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Query(
        options: QueryOptions(
          document: gql("""
          query SpaceX {
            company {
                ceo
                coo
                cto
                employees
                name
            }
          }
          """),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const CircularProgressIndicator();
          }

          final company = result.data!['company'];

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(company['ceo']),
                Text(company['coo']),
                Text(company['cto']),
                Text(company['employees'].toString()),
                Text(company['name']),
              ],
            ),
          );
        },
      ),
    );
  }
}
