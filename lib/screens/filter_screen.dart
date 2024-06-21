import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> selectedGenres = [];
  List<String> selectedFormats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Filter',
          style: TextStyle(
            color: Colors.yellow[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow[700]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Genres',
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                FilterChip(
                  label: Text('All'),
                  selected: selectedGenres.contains('All'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres = ['All'];
                      } else {
                        selectedGenres.remove('All');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Fiction'),
                  selected: selectedGenres.contains('Fiction'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add('Fiction');
                      } else {
                        selectedGenres.remove('Fiction');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Horror'),
                  selected: selectedGenres.contains('Horror'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add('Horror');
                      } else {
                        selectedGenres.remove('Horror');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Fantasy'),
                  selected: selectedGenres.contains('Fantasy'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add('Fantasy');
                      } else {
                        selectedGenres.remove('Fantasy');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Poetry'),
                  selected: selectedGenres.contains('Poetry'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add('Poetry');
                      } else {
                        selectedGenres.remove('Poetry');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Detective'),
                  selected: selectedGenres.contains('Detective'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add('Detective');
                      } else {
                        selectedGenres.remove('Detective');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Suspense'),
                  selected: selectedGenres.contains('Suspense'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add('Suspense');
                      } else {
                        selectedGenres.remove('Suspense');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Adventure'),
                  selected: selectedGenres.contains('Adventure'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedGenres.add('Adventure');
                      } else {
                        selectedGenres.remove('Adventure');
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Format',
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                FilterChip(
                  label: Text('New Books'),
                  selected: selectedFormats.contains('New Books'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('New Books');
                      } else {
                        selectedFormats.remove('New Books');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Old Books'),
                  selected: selectedFormats.contains('Old Books'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('Old Books');
                      } else {
                        selectedFormats.remove('Old Books');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('For Donation'),
                  selected: selectedFormats.contains('For Donation'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('For Donation');
                      } else {
                        selectedFormats.remove('For Donation');
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Subjects',
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                FilterChip(
                  label: Text('English'),
                  selected: selectedFormats.contains('English'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('English');
                      } else {
                        selectedFormats.remove('English');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Urdu'),
                  selected: selectedFormats.contains('Urdu'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('Urdu');
                      } else {
                        selectedFormats.remove('Urdu');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Physics'),
                  selected: selectedFormats.contains('Physics'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('Physics');
                      } else {
                        selectedFormats.remove('Physics');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Computer'),
                  selected: selectedFormats.contains('Computer'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('Computer');
                      } else {
                        selectedFormats.remove('Computer');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: Text('Chemistry'),
                  selected: selectedFormats.contains('Chemistry'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedFormats.add('Chemistry');
                      } else {
                        selectedFormats.remove('Chemistry');
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.yellow[700],
                ),
                onPressed: () {
                  // Implement filter results functionality here
                  // You can use selectedGenres and selectedFormats lists to filter the results
                },
                child: Text('Results'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
