import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_api/app/presentation/detail.dart';
import 'package:spacex_api/core/constants.dart';

import '../../model/model.dart';
import 'about.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<History> histories = [];
  List<Ship> ships = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const About())),
          icon: const Icon(LineIcons.infoCircle),
        ),
        title: const Text('Welcome to SpaceX'),
        centerTitle: true,
      ),
      body: Query(
        options: QueryOptions(
          document: gql(AppConstants.shipQuery)
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return Lottie.asset(AppConstants.kSpaceX,
                height: MediaQuery.of(context).size.height, fit: BoxFit.fill);
          }

          // parse response into a list of history objects
          ships = (result.data!['ships'] as List)
              .map((shipJson) => Ship.fromJson(shipJson))
              .toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    onChanged: onSearchTextChanged,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 12),
                      hintText: "Search Ships...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      // fillColor: Colors.grey.shade800,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: ListView.builder(
                    itemCount: histories.length,
                    itemBuilder: (context, index) {
                      final ship = ships[index];
                      return Card.outlined(
                        child: ListTile(
                          title: Text(ship.name),
                          subtitle: Text(ship.type),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(ship: ship))),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      ships.where((ship) =>
      ship.name.toLowerCase().contains(searchText.toLowerCase()) ||
          ship.type.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
}
