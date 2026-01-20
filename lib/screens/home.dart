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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            leading: Text(
              'Filmmate',
              style: TextStyle(color: Colors.white, fontSize: 42),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(background: Image.network('src')),
          ),
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image.network('src'),
                Column(
                  children: [
                    Text('Trending'),
                    Text('Movie Name'),
                    Row(
                      children: [
                        Text('time'),
                        Text('Language'),
                        Text('resolution'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
