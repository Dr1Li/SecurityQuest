import 'package:flutter/material.dart';
import 'main.dart';
import 'login_page.dart';
import 'package:flutter/gestures.dart';
import 'survey.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    });
  }

  bool _validateEmail(String email) {
    return email.contains('@');
  }

  bool _validatePassword(String password) {
    return password.length > 6;
  }

  void _signUp() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (_validateEmail(email) && _validatePassword(password) && password == confirmPassword) {
      // Navigate to the Survey page
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Survey()));
    } else {
      // Show error message
      print('Invalid sign-up details!');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage())),
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
            SizedBox(height: 30),
            Text(
              'Create an Account',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Color(0xFF020024),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline, size: 20),
                hintText: 'Enter Username',
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
            TextField(
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
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _isConfirmPasswordObscured,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline, size: 20),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xFF828282).withOpacity(0.5),
                ),
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordObscured ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                  ),
                  onPressed: _toggleConfirmPasswordVisibility,
                ),
              ),
              style: TextStyle(
                color: Colors.black.withOpacity(0.9),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006FB4),
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
                    TextSpan(text: 'Already a User? '),
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        color: Color(0xFF006FB4),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
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
