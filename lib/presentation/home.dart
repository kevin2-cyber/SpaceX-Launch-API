import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          child: Container(
                            color: Colors.yellowAccent,
                          ),
                        );
                      }
                  );
                },
                height: 50,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                color: Colors.black,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                    'Show History',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
