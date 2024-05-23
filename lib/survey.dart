import 'package:flutter/material.dart';
import 'home_page.dart';
class Survey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiStepForm(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}


class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Form state
  String? _selectedLevel;
  String? _selectedInterest;
  String? _selectedStatus;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0), // Add padding to the top
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            _buildLevelPage(),
            _buildInterestPage(),
            _buildStatusPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildHeader("What's your level?"),
          SizedBox(height: 20),
          _buildRadioButton('Novice', _selectedLevel, (value) {
            setState(() {
              _selectedLevel = value;
            });
          }),
          _buildRadioButton('Intermediate', _selectedLevel, (value) {
            setState(() {
              _selectedLevel = value;
            });
          }),
          _buildRadioButton('Advanced', _selectedLevel, (value) {
            setState(() {
              _selectedLevel = value;
            });
          }),
          _buildRadioButton('Expert', _selectedLevel, (value) {
            setState(() {
              _selectedLevel = value;
            });
          }),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  textStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                child: Text('Next', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInterestPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildHeader("What's your interests?"),
          SizedBox(height: 20),
          _buildCheckBox(
            'Technical Cybersecurity',
            'primarily deals with using a wide range of skills, expertise, and knowledge to keep people, companies, and their data safe.',
            _selectedInterest,
                (value) {
              setState(() {
                _selectedInterest = value;
              });
            },
          ),
          _buildCheckBox(
            'Organization',
            'involves strategic planning, policies, and coordination across the entire organization.',
            _selectedInterest,
                (value) {
              setState(() {
                _selectedInterest = value;
              });
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _previousPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  textStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                child: Text('Back', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  textStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                child: Text('Next', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildHeader("What's your status?"),
          SizedBox(height: 20),
          _buildRadioButton('Student', _selectedStatus, (value) {
            setState(() {
              _selectedStatus = value;
            });
          }),
          _buildRadioButton('Employee', _selectedStatus, (value) {
            setState(() {
              _selectedStatus = value;
            });
          }),
          _buildRadioButton('Other', _selectedStatus, (value) {
            setState(() {
              _selectedStatus = value;
            });
          }),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _previousPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  textStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                child: Text('Back', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                  print('Selected level: $_selectedLevel');
                  print('Selected interest: $_selectedInterest');
                  print('Selected status: $_selectedStatus');
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  textStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.edit, size: 48, color: Colors.deepPurple),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRadioButton(
      String title, String? groupValue, ValueChanged<String?> onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFC2C2C2), // Box color
        borderRadius: BorderRadius.circular(5),
      ),
      child: RadioListTile<String>(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        value: title,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Colors.deepPurple,
      ),
    );
  }

  Widget _buildCheckBox(String title, String subtitle, String? groupValue,
      ValueChanged<String?> onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFC2C2C2), // Box color
        borderRadius: BorderRadius.circular(5),
      ),
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        value: groupValue == title,
        onChanged: (bool? value) {
          if (value == true) {
            onChanged(title);
          } else {
            onChanged(null);
          }
        },
        activeColor: Colors.deepPurple,
        checkColor: Colors.white,
      ),
    );
  }}
