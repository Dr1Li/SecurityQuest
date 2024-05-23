import 'package:flutter/material.dart';
import 'main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isFeedbackVisible = false;
  bool _isSubmitting = false;
  bool _isSent = false;
  TextEditingController _controller = TextEditingController();

  void _toggleFeedbackForm() {
    setState(() {
      _isFeedbackVisible = !_isFeedbackVisible;
      if (!_isFeedbackVisible) {
        _controller.clear();
        _isSent = false;
        _isSubmitting = false;
      }
    });
  }

  void _submitFeedback() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _isSubmitting = true;
      });

      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          _isSubmitting = false;
          _isSent = true;
        });

        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            _isFeedbackVisible = false;
            _controller.clear();
            _isSent = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Color(0xFF006FB4),
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC2C2C2),
                minimumSize: Size(320, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: _toggleFeedbackForm,
              child: Text(
                'Send Us a Feed-back',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000).withOpacity(0.8),
                ),
              ),
            ),
            if (_isFeedbackVisible)
              Column(
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: _controller,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Write your comments here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_controller.text.isNotEmpty)
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: _toggleFeedbackForm,
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _controller.text.isNotEmpty ? Color(0xFF006FB4) : Color(0xFFC2C2C2),
                        ),
                        onPressed: _controller.text.isNotEmpty ? _submitFeedback : null,
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                  if (_isSubmitting)
                    Text(
                      'Sending your feed-back!',
                      style: TextStyle(color: Colors.blue),
                    ),
                  if (_isSent)
                    Text(
                      'Sent successfully!!',
                      style: TextStyle(color: Colors.green),
                    ),
                ],
              ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC2C2C2),
                minimumSize: Size(320, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000).withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}