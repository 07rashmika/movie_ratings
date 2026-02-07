import 'package:flutter/material.dart';
import 'package:movie_ratings/screens/download.dart';
import 'package:movie_ratings/screens/home.dart';
import 'package:movie_ratings/screens/play_list.dart';
import 'package:movie_ratings/screens/profile.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

Widget _dotNotification() {
  return Stack(
    alignment: .topRight,
    children: [
      Icon(Icons.notifications_outlined),
      Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(shape: .circle, color: Colors.red),
      ),
    ],
  );
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const PlayListScreen(),
    const DownloadScreen(),
    const ProfileScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Film Rate',
          style: TextStyle(
            fontSize: 28,
            fontWeight: .w600,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 32,
          ),
          IconButton(onPressed: () {}, icon: _dotNotification(), iconSize: 32),
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        type: .fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 32),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline, size: 32),
            label: 'PlayList',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sim_card_download_outlined, size: 32),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, size: 32),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
