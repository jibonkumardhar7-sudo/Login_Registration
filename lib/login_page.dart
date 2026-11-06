import 'package:flutter/material.dart';
import 'package:log_regi/components/my_button.dart';
import 'package:log_regi/components/my_textfield.dart';
import 'package:log_regi/components/square_tile.dart';
import 'package:log_regi/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void signUserIn() {
    final identifier = usernameController.text.trim();
    final password = passwordController.text;

    if (identifier.isEmpty && password.isEmpty) {
      _showMessage('Please enter your email or phone and password');
      return;
    }

    if (identifier.isEmpty) {
      _showMessage('Please enter your email or phone');
      return;
    }

    if (password.isEmpty) {
      _showMessage('Please enter your password');
      return;
    }

    if (_formKey.currentState!.validate()) {
      debugPrint('Validation passed');
    }
  }

  void onForgotPassword() {}

  void onRegister() {}

  void onGoogleSignIn() {}

  void onAppleSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.lock, size: 100),
                  const SizedBox(height: 50),
                  Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Email or Phone',
                    obscureText: false,
                    validator: validateEmailOrPhone,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: validateLoginPassword,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: onForgotPassword,
                          borderRadius: BorderRadius.circular(4),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyButton(onTap: signUserIn),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        imagePath: 'lib/images/google.png',
                        onTap: onGoogleSignIn,
                      ),
                      const SizedBox(width: 25),
                      SquareTile(
                        imagePath: 'lib/images/apple.png',
                        onTap: onAppleSignIn,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: onRegister,
                        borderRadius: BorderRadius.circular(4),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}