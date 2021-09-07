import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);


      List<Map<String,Object>> get groupedTransactionValues{
        return List.generate(7,(index){
          return {
            'Day' : 'T',
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