import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making HTTP requests
import 'dart:convert'; // For handling JSON
import 'package:mytune/global_state.dart'; // Import global state for user choices

class GenerateSoundtrackPage extends StatefulWidget {
  @override
  _GenerateSoundtrackPageState createState() => _GenerateSoundtrackPageState();
}

class _GenerateSoundtrackPageState extends State<GenerateSoundtrackPage> {
  bool _isGenerating = false;
  String _soundtrackLink = "";
  String _errorMessage = "";

  Future<void> _generateSoundtrack() async {
    setState(() {
      _isGenerating = true;
      _soundtrackLink = "";
      _errorMessage = "";
    });

    final String genre = userChoices["genre"] ?? "Unknown";
    final List<String> instruments = userChoices["instruments"] ?? [];

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/generate'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "genre": genre,
          "instruments": instruments,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _isGenerating = false;
          _soundtrackLink = responseData['audio_url'] ?? "";
        });
      } else {
        setState(() {
          _isGenerating = false;
          _errorMessage = "Failed to generate soundtrack. Please try again.";
        });
      }
    } catch (error) {
      setState(() {
        _isGenerating = false;
        _errorMessage = "An error occurred. Please check your connection.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String genre = userChoices["genre"] ?? "Unknown";
    final List<String> instruments = userChoices["instruments"] ?? [];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Generate Soundtrack"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Selection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Genre: $genre\nInstruments: ${instruments.join(", ")}",
              style: TextStyle(fontSize: 16, color: Colors.grey[300]),
            ),
            SizedBox(height: 20),
            _isGenerating
                ? Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ),
            )
                : ElevatedButton(
              onPressed: _generateSoundtrack,
              child: Text("Generate Soundtrack"),
            ),
            SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            if (_soundtrackLink.isNotEmpty)
              Column(
                children: [
                  Text(
                    "Soundtrack Generated!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Logic to open the link or play the soundtrack
                      print("Opening: $_soundtrackLink");
                    },
                    child: Text(
                      "Play Soundtrack",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
