import 'package:flutter/material.dart';
import 'home_page.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizForm(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}

class QuizForm extends StatefulWidget {
  @override
  _QuizFormState createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<String?> _answers = List<String?>.filled(4, null);
  int _score = 0;

  // Correct answers
  final Map<int, String> _correctAnswers = {
    0: 'Turning a message into a secret code.',
    1: 'They’re unreadable to unauthorized eyes.',
    2: 'It’s a type of encryption software.',
    3: 'Symmetric Encryption.',
  };

  void _nextPage() {
    if (_currentPage < 3) {
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

  void _submitQuiz() {
    _score = 0;
    for (int i = 0; i < _answers.length; i++) {
      if (_answers[i] == _correctAnswers[i]) {
        _score++;
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScorePage(score: _score, retry: _retryQuiz, finish: _finishQuiz),
      ),
    );
  }

  void _retryQuiz() {
    setState(() {
      _answers = List<String?>.filled(4, null);
      _score = 0;
      _currentPage = 0;
    });
    _pageController.jumpToPage(0);
    Navigator.pop(context);
  }

  void _finishQuiz() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            _buildQuestionPage(
              question: "What is Encryption?",
              options: [
                'Turning a message into a secret code.',
                'Sending a message without any protection.',
                'Deleting a message completely.',
              ],
              index: 0,
            ),
            _buildQuestionPage(
              question: "Which of the following is true about encrypted messages?",
              options: [
                'They are always written in plain language.',
                'They’re unreadable to unauthorized eyes.',
                'They are easy to read by anyone.',
              ],
              index: 1,
            ),
            _buildQuestionPage(
              question: "What role does a cipher play in encryption?",
              options: [
                'It’s a codebook for changing the message.',
                'It’s a secret handshake.',
                'It’s a type of encryption software.',
              ],
              index: 2,
            ),
            _buildQuestionPage(
              question: "Which encryption method uses a single key for both encryption and decryption?",
              options: [
                'Asymmetric Encryption.',
                'Reversed Encryption.',
                'Symmetric Encryption.',
              ],
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionPage({required String question, required List<String> options, required int index}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildHeader("Quiz Time!"),
          SizedBox(height: 20),
          Text(
            question,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          for (String option in options)
            _buildRadioButton(option, _answers[index], (value) {
              setState(() {
                _answers[index] = value;
              });
            }),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage > 0)
                ElevatedButton(
                  onPressed: _previousPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  child: Text('Back', style: TextStyle(color: Colors.white)),
                ),
              if (_currentPage < 3)
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              if (_currentPage == 3)
                ElevatedButton(
                  onPressed: _submitQuiz,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
          child: Icon(Icons.quiz, size: 48, color: Colors.blue),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
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
        color: Color(0xFFC2C2C2),
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
        activeColor: Colors.blue,
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final VoidCallback retry;
  final VoidCallback finish;

  ScorePage({required this.score, required this.retry, required this.finish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your Score: $score/4',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: retry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                child: Text('Retry', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: finish,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                child: Text('Finish', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}