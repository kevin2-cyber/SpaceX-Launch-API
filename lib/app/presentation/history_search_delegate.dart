import 'package:flutter/material.dart';
import 'package:spacex_api/app/presentation/history_search_results.dart';

class HistorySearchDelegate extends SearchDelegate {

  List<String> searchResults = [
    'Cairo',
    'Nairobi',
    'Accra',
    'Kigali',
    'Berlin'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          if(query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear))
  ];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(onPressed: () => close(context,null), icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => HistorySearchResult(query: query);

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}