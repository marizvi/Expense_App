import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

// below one is known as getter and getter does not have any arguement lists

      List<Map<String,Object>> get groupedTransactionValues{
        return List.generate(7,(index) {
          final weekDay = DateTime.now().subtract(Duration(days:index),);
          double totalSum=0.0;
          for(var i=0;i<recentTransactions.length;i++)
          {
            //.date is from our defined transactions list
            //.day is inbuilt from intl library
              if(recentTransactions[i].date.day == weekDay.day && 
                  recentTransactions[i].date.month==weekDay.month &&
                  recentTransactions[i].date.year == weekDay.year
                  )
                  {
                    totalSum+=recentTransactions[i].amount;
                  }
          }

          print(DateFormat.E().format(weekDay));
          print(totalSum);

          return {
            'Day' : DateFormat.E().format(weekDay),//gives m for monday, t for tuesday etc {imported from intl}
            'amount' : 9.99,
          };
        });
      }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: [
        
      ],),
    );
  }
}