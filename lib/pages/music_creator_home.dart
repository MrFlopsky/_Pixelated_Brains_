import 'package:flutter/material.dart';
import 'genre_page.dart';

class MusicCreatorHome extends StatelessWidget {
  const MusicCreatorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7b4397), Color(0xFFdc2430)],
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "MyTune",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.7),
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
              // Buttons
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAnimatedButton(
                      text: "Let's Jam",
                      gradientColors: const [Color(0xFFF953C6), Color(0xFFB91D73)],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GenrePage()), // Navigate to GenrePage
                        );
                      },
                    ),

                    const SizedBox(height: 20),
                    _buildAnimatedButton(
                      text: "Inspire from Artists",
                      gradientColors: const [Color(0xFF36D1DC), Color(0xFF5B86E5)],
                      onPressed: () {
                        // Add your action here
                      },
                    ),
                  ],
                ),
              ),
              // Now Playing Bar
              _buildNowPlayingBar(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedButton({
    required String text,
    required List<Color> gradientColors,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNowPlayingBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.music_note, color: Colors.purpleAccent),
                    const SizedBox(width: 10),
                    Text(
                      "Now Playing: Song Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF953C6),
                  ),
                ),
              ],
            ),
          ),
          // Footer Navigation
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.white.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFooterItem("Home"),
                _buildFooterItem("Search"),
                _buildFooterItem("Library"),
                _buildFooterItem("Profile"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String text) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.white70),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
