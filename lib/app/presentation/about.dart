import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_api/core/constants.dart';

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppConstants.elon,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.fill,
                  ),
                  Text(company['ceo']),
                  Image.asset(
                    AppConstants.gwynne,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.fill,
                  ),
                  Text(company['coo']),
                  Image.asset(
                    AppConstants.elon,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.fill,
                  ),
                  Text(company['cto']),
                  Text(company['employees'].toString()),
                  Text(company['name']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
