import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  SubscriptionState createState() => SubscriptionState();
}

class SubscriptionState extends State<Subscription> {

  bool _subscribed = false;

  @override
  Widget build(BuildContext context) {

    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    !_subscribed ? 'Subscribe' : 'Unsubscribe',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    _showDialog(context);
                  }),
              const SizedBox(
                height: 100,
              ),
              Text(
                _subscribed ? 'Subscribed' : 'Not Subscribed',
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              // DropdownMenu(
              //   helperText: 'Select one ',
              //   enableFilter: true,
              //   onSelected: (expense) => {
              //     print(expense)
              //   },
              //   dropdownMenuEntries: <DropdownMenuEntry<String>> [
              //   DropdownMenuEntry(
              //     value: 'Alquiler',
              //     label: 'Alquiler'
              //   ),
              //   DropdownMenuEntry(
              //     value: 'Gasolina',
              //     label: 'Gasolina'
              //   ),
              //   DropdownMenuEntry(
              //     value: 'Compra',
              //     label: 'Compra'
              //   ),
              //   DropdownMenuEntry(
              //     value: 'Cenas',
              //     label: 'Cenas'
              //   ),
              //   DropdownMenuEntry(
              //     value: 'Internet',
              //     label: 'Internet'
              //   ),
              // ]
              // )
            ],
          ),
        );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text('Subscription'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  _subscribed = !_subscribed;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
      context: context,
    );
  }
}