import 'package:flutter/material.dart';
import 'EncryptionCoursePage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _courseTitles = ['Encryption', 'Network Security', 'Malware Detection'];
  List<String> _filteredCourses = [];

  void _filterCourses() {
    setState(() {
      _filteredCourses = _courseTitles
          .where((course) => course.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _filterCourses,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCourses.length,
                itemBuilder: (context, index) {
                  return _buildCourseCard(context, _filteredCourses[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, String title) {
    IconData icon;
    String description;

    switch (title) {
      case 'Encryption':
        icon = Icons.vpn_key;
        description = 'Process of converting plaintext into cyphertext for security.';
        break;
      case 'Network Security':
        icon = Icons.security;
        description = 'Protect the integrity, confidentiality, and availability of networks.';
        break;
      case 'Malware Detection':
        icon = Icons.bug_report;
        description = 'Detect and prevent malicious software from compromising systems.';
        break;
      default:
        icon = Icons.book;
        description = '';
    }

    return GestureDetector(
      onTap: () {
        if (title == 'Encryption') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EncryptionCoursePage()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}