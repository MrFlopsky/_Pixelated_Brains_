import 'package:flutter/material.dart';
import 'package:mytune/global_state.dart'; // Import global state
import 'generate_soundtrack_page.dart'; // Import GenerateSoundtrackPage

class InstrumentPage extends StatefulWidget {
  @override
  _InstrumentPageState createState() => _InstrumentPageState();
}

class _InstrumentPageState extends State<InstrumentPage> {
  final List<String> instruments = [
    "Saxophone",
    "Piano",
    "Bass",
    "Trumpet",
    "Flute",
    "Keyboard",
    "Guitar",
    "Percussion",
  ];

  final Set<String> selectedInstruments = {};

  void _submitInstruments() {
    // Save selected instruments to global state
    userChoices["instruments"] = selectedInstruments.toList();

    // Navigate to the Generate Soundtrack page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GenerateSoundtrackPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Select Instruments", style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: instruments.length,
              itemBuilder: (context, index) {
                final instrument = instruments[index];
                final isSelected = selectedInstruments.contains(instrument);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedInstruments.remove(instrument);
                      } else {
                        selectedInstruments.add(instrument);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.deepPurpleAccent
                          : Colors.deepPurple.shade900,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                    ),
                    child: Text(
                      instrument,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _submitInstruments,
            child: Text("Confirm Selection"),
          ),
        ],
      ),
    );
  }
}
