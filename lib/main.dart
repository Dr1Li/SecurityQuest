import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_up_page.dart';

void main() async {
  runApp(SecurityQuestApp());
}

class SecurityQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 360,
                height: 240,
                margin: EdgeInsets.only(top: 70.0),
                child: Image.asset('assets/logowelcome.png'), // Replace with your logo asset
              ),
              SizedBox(height: 37.0),
              Text(
                'Hello Security Adventurers!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              SizedBox(height: 16.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFF828282),
                  ),
                  children: [
                    TextSpan(text: 'Welcome to your '),
                    TextSpan(
                      text: 'Security Quest',
                      style: TextStyle(color: Color(0xFF006FB4)),
                    ),
                    TextSpan(text: '. Solve challenges to further your learning journey.'),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Column(
                children: [
                  SizedBox(
                    width: 236,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF006FB4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  SizedBox(
                    width: 236,
                    height: 44,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xFF006FB4),
                          width: 2.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color(0xFF006FB4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
