import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onTapScreen});

  final void Function(String identifier) onTapScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Color(0xFF2C2C2C),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            height: 200,
            child: ShaderMask(
              // Applying the gradient here
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFFFC6B01), Color(0xFF171717)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                'FB',
                style: TextStyle(
                  fontSize: 86,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .white, // This color is required but will be replaced by gradient
                ),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 25, left: 30),
            leading: Icon(Icons.home_outlined, size: 32),
            title: Text(
              'Dashboard',
              style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 24)),
            ),
            onTap: () {
              onTapScreen('dashboard');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 25, left: 30),
            leading: Icon(Icons.videocam, size: 32),
            title: Text(
              'Your Movies',
              style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 24)),
            ),
            onTap: () {
              onTapScreen('your_movies');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 25, left: 30),
            leading: Icon(Icons.leaderboard_outlined, size: 32),
            title: Text(
              'Rankings',
              style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 24)),
            ),
            onTap: () {
              onTapScreen('rankings');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 25, left: 30),
            leading: Icon(Icons.people_alt_outlined, size: 32),
            title: Text(
              'Community',
              style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 24)),
            ),
            onTap: () {
              onTapScreen('community');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 25, left: 30),
            leading: Icon(Icons.square_outlined, size: 32),
            title: Text(
              'Notifications',
              style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 24)),
            ),
            onTap: () {
              onTapScreen('notifications');
            },
          ),
          Spacer(),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 15, left: 30),
            leading: Icon(Icons.settings_outlined, size: 32),
            title: Text(
              'Settings',
              style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 24)),
            ),
            onTap: () {
              onTapScreen('notifications');
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
