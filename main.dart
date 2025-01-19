import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false; // Flag to track the current theme

  // List of items with their toggle states
  final List<Map<String, dynamic>> items = List.generate(
    10,
    (index) => {"title": "Item ${index + 1}", "isToggled": false},
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(), // Toggle theme
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Toggle and SwitchList Example'),
          backgroundColor: isDarkTheme ? Colors.grey[850] : Colors.teal,
        ),
        body: Column(
          children: [
            // Toggle Buttons to switch between Dark and Light Theme
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Icon(
                    isDarkTheme ? Icons.nightlight_round : Icons.wb_sunny,
                    size: 80,
                    color: isDarkTheme ? Colors.yellow : Colors.orange,
                  ),
                  SizedBox(height: 20),
                  Text(
                    isDarkTheme ? 'Dark Theme' : 'Light Theme',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  ToggleButtons(
                    isSelected: [isDarkTheme, !isDarkTheme],
                    onPressed: (index) {
                      setState(() {
                        isDarkTheme = index == 0; // Update the theme flag
                      });
                    },
                    fillColor: Colors.teal,
                    selectedColor: Colors.white,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('Dark'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text('Light'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Switch ListTile Example
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    elevation: 2,
                    child: SwitchListTile(
                      title: Text(
                        items[index]["title"],
                        style: TextStyle(fontSize: 18),
                      ),
                      value: items[index]["isToggled"],
                      onChanged: (bool value) {
                        setState(() {
                          items[index]["isToggled"] =
                              value; // Update toggle state
                        });
                      },
                      activeColor: Colors.teal,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
