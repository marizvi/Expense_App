import 'package:exp_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

// below one is known as getter and getter does not have any arguement lists

      List<Map<String,Object>> get groupedTransactionValues{
        //generate is a utility constructor in list class
        // here index will go from 0-6
        return List.generate(7,(index) {
          // if index = 0, then our weekday will be today and if index = 1 then our weekday will be yesterday.
          final weekDay = DateTime.now().subtract(Duration(days:index),);
          //provide weekdays of last 7 days..
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
            'day' : DateFormat.E().format(weekDay).substring(0,1),//gives m for monday, t for tuesday etc {imported from intl}
            'amount' : totalSum,
          };
        }).reversed.toList();// reversed is used to arrange data 
      }

// above getter summons up all transactions of a single day into one and 
//calculates total amount spent on that particular day


double get totalSpending{
  return groupedTransactionValues.fold(0.0,(sum,item){
    return sum + (item['amount'] as num);
  });
}

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child:
      Container( // just to set padding
        padding: EdgeInsets.all(4),
        child:
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data){
            // return Text(data['day'] + ':' + data['amount'].toString(),);
            //if statements are like above and we are recieving any error then go for below kind of statement.
            return Flexible( 
              fit: FlexFit.tight,// without this, if we add on transactions then when amount is larger other bars will start shifting creating disorder
            child: ChartBar(
              (data['day'] as String),
               (data['amount'] as double),
              //  (data['amount'] as double)/totalSpending, //this one is absolutely fine but since this app do not uses any database,
              // so whenever we start the app with 0 entries then it will produce error so to avoid this error temporary we used below statement..
               totalSpending == 0.0 ? 0.0 : (data['amount'] as double)/totalSpending,
               ),);
      }).toList(),
        
      ),
       ),   );
  }
}