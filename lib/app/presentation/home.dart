import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_api/app/presentation/history_search_delegate.dart';
import 'package:spacex_api/core/constants.dart';

import '../../model/history.dart';
import 'about.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _controller = AnimationController(vsync: this);
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const About())),
                icon: const Icon(LineIcons.infoCircle),
              ),
              title: const Text('Welcome to SpaceX'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () =>
                        showSearch(
                          context: context,
                          delegate: HistorySearchDelegate(),
                        ),
                    icon: const Icon(Icons.search))
              ],
            ),
            body: Lottie.asset(
                AppConstants.kSpaceX,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill
            ),
          );
    // }, Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Welcome to SpaceX'),
    //     centerTitle: true,
    //     actions: [
    //       IconButton(
    //         onPressed: () => showSearch(
    //           context: context,
    //           delegate: HistorySearchDelegate(),
    //         ),
    //        icon: const Icon(Icons.search))
    //     ],
    //   ),
    //   body: SafeArea(
    //     child: Lottie.asset(
    //       AppConstants.kSpaceX
    //   controller: _controller,
    //   AppConstants.kSpaceX,
    // onLoaded: (composition) {
    //   // Configure the AnimationController with the duration of the
    //   // Lottie file and start the animation.
    //   _controller..duration = composition.duration..forward();
    // }
    // ),
    // child: Query(
    //   options: QueryOptions(
    //     document: gql("""
    //   query SpaceX() {
    //     histories() {
    //       id
    //       title
    //       details
    //       event_date_utc
    //     }
    //   }
    //      """),
    //   ),
    //   builder: (QueryResult result,
    //       {VoidCallback? refetch, FetchMore? fetchMore}) {
    //     if (result.hasException) {
    //       return Text(result.exception.toString());
    //     }
    //
    //     if (result.isLoading) {
    //       return const CircularProgressIndicator();
    //     }
    //
    //     // parse response into a list of history objects
    //     histories = (result.data!['histories'] as List)
    //         .map((historyJson) => History.fromJson(historyJson))
    //         .toList();
    //
    //     return SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Container(
    //             height: MediaQuery.of(context).size.height,
    //             width: MediaQuery.of(context).size.width,
    //             decoration: const BoxDecoration(
    //                 borderRadius: BorderRadius.only(
    //                     topRight: Radius.circular(20),
    //                     topLeft: Radius.circular(20))),
    //             child: ListView.builder(
    //               itemCount: histories.length,
    //               itemBuilder: (context, index) {
    //                 final history = histories[index];
    //                 return GestureDetector(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) =>
    //                                 Detail(history: history)));
    //                   },
    //                   child: Card.outlined(
    //                     child: ListTile(
    //                       title: Text(history.title),
    //                       subtitle: Text(history.eventDateUtc.toString()),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // ),
  }
}

