import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);


      List<Map<String,Object>> get groupedTransactionValues{
        return List.generate(7,(index) {
          final weekDay = DateTime.now().subtract(Duration(days:index),);
          return {
            'Day' : DateFormat.E(weekDay),//gives m for monday, t for tuesday etc {imported from intl}
            'amount' : 9.99,
          };
        });
      }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: [
        
      ],),
    );
  }
}