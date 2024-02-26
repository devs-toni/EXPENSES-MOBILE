import 'dart:convert';

import 'package:expenses/core/exception/domain/exception.dart';
import 'package:expenses/core/user/domain/user.dart';
import 'package:expenses/core/user/user_api_client.dart';
import 'package:expenses/screens/home_screen.dart';
import 'package:expenses/utils/debug.dart';
import 'package:expenses/utils/validator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  bool _showPassword = false;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> result = await _apiClient.login(
        emailController.text,
        passwordController.text,
      );
      LoggerDegub.error(result.toString());
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      try {
        LoginResult loginResult = LoginResult.fromJson(result);
        String accessToken = loginResult.token;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } catch (e) {
        LoggerDegub.error(e.toString());
        Exception apiException = Exception.fromJson(result);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${apiException.type}: ${apiException.detail}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(120, 0, 175, 177),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Image.asset('assets/login-icon.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      return Validator.validateEmail(value ?? '');
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    obscureText: !_showPassword,
                    controller: passwordController,
                    validator: (value) {
                      return Validator.validatePassword(value ?? '');
                    },
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your password'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 175, 177), fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 175, 177),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      login();
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => const Home()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                const Text('New User? Create Account')
              ],
            ),
          )),
    );
  }
}
