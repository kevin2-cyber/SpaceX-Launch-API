import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_api/model/history.dart';
import 'package:spacex_api/presentation/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late  History history;
  List<History> histories = [];
  bool sorted = false;

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SizedBox(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: Center(
      //     child: _isLoading ?
      //     const CircularProgressIndicator() :  Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: ListView.builder(
      //         itemCount: history.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text(
      //                 history[index].title,
      //                 style: Theme.of(context).textTheme.titleLarge
      //             ),
      //             subtitle: Text(
      //                 '${history[index].eventDateUtc}',
      //                 style: Theme.of(context).textTheme.titleSmall,
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ),
      // ),
      body: Query(
        options: QueryOptions(
          document: gql("""
          query SpaceX() {
            histories() {
              id
              title
              details
              event_date_utc
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

          // parse response into a list of history objects
          histories = (result.data!['histories'] as List)
              .map((historyJson) => History.fromJson(historyJson))
              .toList();

          return ListView.builder(
            itemCount: histories.length,
            itemBuilder: (context, index) {
              final history = histories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(history: history)));
                },
                child: Card.outlined(
                  child: ListTile(
                    title: Text(history.title),
                    subtitle: Text(history.eventDateUtc.toString()),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
