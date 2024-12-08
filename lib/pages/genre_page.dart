import 'package:flutter/material.dart';
import 'package:mytune/global_state.dart'; // Import global state
import 'instrument_page.dart';            // Import the instrument selector page

class GenrePage extends StatefulWidget {
  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  final List<String> genres = [
    "Pop",
    "Hip-Hop and Rap",
    "Jazz",
    "Electric",
    "Classical",
    "Latin",
    "Blues",
    "Disco",
    "Reggae",
  ];

  final PageController _pageController = PageController(viewportFraction: 0.3);

  void _selectGenre(String genre) {
    // Save the selected genre in global state
    userChoices["genre"] = genre;

    // Navigate to the instrument selector page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InstrumentPage()), // InstrumentPage widget
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Choose a Genre", style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.shade900,
                  Colors.deepPurple.shade600,
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _selectGenre(genres[index]), // Call _selectGenre
                    child: Transform.scale(
                      scale: 0.9,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purpleAccent.shade200,
                              Colors.deepPurpleAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            genres[index],
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
