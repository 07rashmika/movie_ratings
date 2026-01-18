import 'package:flutter/material.dart';
import 'package:movie_ratings/widgets/main_drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              child: TextButton(child: const Text('A'), onPressed: () {}),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(onTapScreen: (identifier) {}),
    );
  }
}
