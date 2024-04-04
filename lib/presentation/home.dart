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
  List<dynamic> mockHistory = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _isLoading ?
        const CircularProgressIndicator() :  Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: mockHistory.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(mockHistory[index]['title']),
                subtitle: Text('${DateTime.parse(mockHistory[index]['event_date_utc'])}'),
              );
            },
          ),
        ),
      ),
    );
  }

  void fetchData() async {
    setState(() {
      _isLoading = true;
    });

    HttpLink link = HttpLink(AppConstants.kBaseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    QueryResult qResult = await qlClient.query(
      QueryOptions(
          document: gql(
              """
          query SpaceX() {
            histories() { 
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

    setState(() {
      mockHistory = qResult.data!['histories'];
      _isLoading = false;
    });
  }
}
