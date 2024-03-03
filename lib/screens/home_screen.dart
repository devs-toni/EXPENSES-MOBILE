import 'package:expenses/core/expense/domain/expense.dart';
import 'package:expenses/core/expense/expense_api_client.dart';
import 'package:expenses/core/user/domain/login_result.dart';
import 'package:expenses/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final LoginResult loginData;

  const Home({Key? key, required this.loginData}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<String> dropdownExpenses = [];
  String? dropdownValue;
  final ExpenseApiClient _expenseApiClient = ExpenseApiClient();

  Future<List<dynamic>> getExpenses() async {
    return await _expenseApiClient.getExpenses(widget.loginData.token);
  }

  @override
  void initState() {
    super.initState();
    getExpenses().then((expensesList) {
      List<String> expenses = [];
      for (var expense in expensesList) {
        expenses.add(Expense.fromJson(expense).name);
      }
      setState(() {
        dropdownExpenses = expenses;
        dropdownValue = expenses.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: const Color.fromARGB(120, 0, 175, 177),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(120, 0, 175, 177),
          onPressed: () {},
          child: const Icon(Icons.menu),
        ),
        body: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              DropdownButton(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? expense) {
                  setState(() {
                    dropdownValue = expense;
                  });
                },
                items: dropdownExpenses
                    .map<DropdownMenuItem<String>>((String expense) {
                  return DropdownMenuItem<String>(
                    value: expense,
                    child: Text(expense),
                  );
                }).toList(),
              ),
              LogoutButton(accessToken: widget.loginData.token)
            ],
          )),
        ));
  }
}
