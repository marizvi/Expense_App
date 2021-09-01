import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
    
    final List<Transaction> _usertransaction = [
     Transaction(
      't1','New Shoes' ,6999 , DateTime.now(),
      ), 
    Transaction(
      't2','weekly Groceries' ,2500 , DateTime.now(),
      ), 
  ];

void _addNewTranscation(String txtitle, double txamount)
{
  final newTx = Transaction(
    DateTime.now().toString(), 
    txtitle,
     txamount, 
     DateTime.now()
     );
     
     setState(() {
       _usertransaction.add(newTx);
     });
}

  @override
  Widget build(BuildContext context) {
  return Column(
    children: <Widget>[
      NewTransaction(_addNewTranscation),
      TransactionList(_usertransaction), 
    ],
  );
  }
}