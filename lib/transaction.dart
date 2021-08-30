import 'package:flutter/foundation.dart';

// remember it is not a widget but just an information..

class Transaction{
 final String id;
 final String title;
 final double amount;
 final DateTime date;

 Transaction(
   @required this.id,
   @required this.title,
   @required this.amount,
   @required this.date,
 );
}