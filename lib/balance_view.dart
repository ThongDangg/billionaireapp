import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// https://www.appicon.co/ de tao icon tu hinh anh 

class BalanceView extends StatelessWidget {
  double balance;

  BalanceView({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Balance Part"),
          SizedBox(height: 20),
          Text(
            " \$ ${NumberFormat.simpleCurrency(name: '').format(balance)}",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
