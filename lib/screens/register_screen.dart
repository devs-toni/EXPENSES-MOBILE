// ignore_for_file: use_build_context_synchronously

import 'package:expenses/core/exception/domain/exception.dart';
import 'package:expenses/core/user/user_api_client.dart';
import 'package:expenses/core/user/domain/register_result.dart';
import 'package:expenses/core/user/domain/register_user.dart';
import 'package:expenses/screens/login_screen.dart';
import 'package:expenses/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController(text: '');
  final TextEditingController lastnameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController birthdayController = TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');

  final UserApiClient _apiClient = UserApiClient();
  bool _showPassword = false;

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();
      var userData = RegisterUser(
          firstnameController.text, 
          lastnameController.text, 
          emailController.text, 
          birthdayController.text, 
          phoneController.text, 
          passwordController.text
        );
      Map<String, dynamic> result = await _apiClient.registerUser(userData);
      try {
        RegisterResult registerResult = RegisterResult.fromJson(result);
        EasyLoading.showSuccess('User registered successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      } catch (e) {
        Exception apiException = Exception.fromJson(result);
        EasyLoading.showError('${apiException.type}: ${apiException.detail}');
        _formKey.currentState?.reset();
      }
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Register'),
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
                        child: Image.asset('assets/register-icon.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: firstnameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Firstname',
                        hintText: 'Enter your firstname'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    controller: lastnameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Lastname',
                        hintText: 'Enter your lastname'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                    controller: birthdayController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Birthday',
                        hintText: 'Enter your birthday'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 60),
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
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 175, 177),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      registerUser();
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => const Home()));
                    },
                    child: const Text(
                      'Create',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
              ],
            ),
          )),
    );
  }
}
