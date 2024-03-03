import 'package:expenses/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:expenses/core/user/user_api_client.dart';

class LogoutButton extends StatefulWidget {
  final String accessToken;

  const LogoutButton({Key? key, required this.accessToken}) : super(key: key);
  
  @override
  LogoutButtonState createState() => LogoutButtonState();
}

class LogoutButtonState extends State<LogoutButton> {
  final UserApiClient _userApiClient = UserApiClient();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(120, 0, 175, 177),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                logout(context);
              }),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    Map<String, dynamic> result = await _userApiClient.logout(widget.accessToken);
    if (result['result'] == '200') {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => const Login()
        )
      );
    }
  }
}
