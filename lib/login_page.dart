import 'package:flutter/material.dart';
import 'sign_up_page.dart';
import 'main.dart';
import 'package:flutter/gestures.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  void _togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
  }

  void _logIn(BuildContext context) {
    // Add validation and log in logic here
    String email = _emailController.text;
    String password = _passwordController.text;
    if (email.contains('@') && password.length > 6) {
      // Navigate to Home Page on successful login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Show error message
      print("Invalid login details!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomePage())),
        ),
        title: Image.asset('assets/logo 2.png', height: 55, width: 216),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              'Hi! Welcome Back!',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Color(0xFF020024),
              ),
            ),
            SizedBox(height: 9),
            Text(
              'Sign In to continue',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                color: Color(0xFF828282).withOpacity(0.9),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined, size: 20),
                hintText: 'Enter Email Address',
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xFF828282).withOpacity(0.5),
                ),
                border: UnderlineInputBorder(),
              ),
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
              ),
            ),
            SizedBox(height: 20),
            StatefulBuilder(
              builder: (context, setState) {
                return TextField(
                  controller: _passwordController,
                  obscureText: _isPasswordObscured,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline, size: 20),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF828282).withOpacity(0.5),
                    ),
                    border: UnderlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured ? Icons.visibility : Icons.visibility_off,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _togglePasswordVisibility();
                        });
                      },
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.9),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () => _logIn(context),
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
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF006FB4),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpPage()));
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}