import 'package:flutter/material.dart';
import 'QuizPage.dart';
class EncryptionCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/encryption.png', width: 30, height: 30),
            SizedBox(width: 10),
            Text(
              'Encryption',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'What Is Encryption?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: 'Encryption',
                      style: TextStyle(color: Color(0xFF006fb4), fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: ' is like turning your message into a secret code that only the intended recipient can understand.'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Imagine you want to send a sensitive letter. You don’t want anyone else to read it, right? So you create a secret language between you and the recipient.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- When you encrypt a message, it becomes scrambled and unreadable to others.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/pic1.png', width: double.infinity),
              SizedBox(height: 20),
              Text(
                'What Are The Types Of Encryption?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: 'Symmetric Encryption',
                      style: TextStyle(color: Color(0xFF006fb4), fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: ': Imagine you have a magic box that can lock and unlock things. You use the same magic key to lock (encrypt) and unlock (decrypt) your message. Both you and your friend have a copy of this magic key. Examples: AES, DES.'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/pic2.png', width: double.infinity),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: 'Asymmetric Encryption',
                      style: TextStyle(color: Color(0xFF006fb4), fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: ': This is like having two keys, a lock, and an unlock key. You give your friend the lock key (public key) so they can lock a message for you. But only you have the unlock key (private key) to open it. Examples: RSA, ECC.'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/pic3.png', width: double.infinity),
              SizedBox(height: 20),
              Text(
                'How Does It Work?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- You use a special cipher (like a secret codebook) to manipulate the message.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- The recipient knows how to unscramble it using the same cipher.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Even if someone else gets a copy of the encrypted message, they won’t understand it. It’s like a secret handshake only you and the recipient know!',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'So ... Why Is Encryption Important?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: 'Privacy',
                      style: TextStyle(color: Color(0xFF006fb4), fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: ': It keeps your messages and data safe from others.'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: 'Security',
                      style: TextStyle(color: Color(0xFF006fb4), fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: ': Protects your information from being stolen or tampered with.'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: '- '),
                    TextSpan(
                      text: 'Trust',
                      style: TextStyle(color: Color(0xFF006fb4), fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: ': Helps you communicate securely over the internet.'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(

                    onPressed: () => _navigateToQuiz(context), // Navigate to the quiz page

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  child: Text('To Quiz!', style: TextStyle(color: Colors.white)),

                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
void _navigateToQuiz(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => QuizPage()),
  );
}
