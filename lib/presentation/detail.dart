import 'package:flutter/material.dart';
import 'package:spacex_api/model/history.dart';
import 'package:spacex_api/presentation/about.dart';

class Detail extends StatefulWidget {
  final History history;
  const Detail({super.key, required this.history});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.history.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.history.details,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                },
                  child: const Text('About Us'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
