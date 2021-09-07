import 'package:flutter/material.dart';
import '../models/transaction.dart';
import "package:intl/intl.dart";

class TransactionList extends StatelessWidget {

final List<Transaction> transactions;

TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return 
            // Column(
            Container(
            height: 420,
            child:transactions.isEmpty? 
            Column(children: [
              Text('No Transactions added Yet!!',
              style: TextStyle(fontFamily: 'Open Sans'),
              ),
              // to add space between abovetext and below image we used.
              SizedBox(
                height: 20,
              ),

              Container(
                height: 380,
                width: double.infinity,
              child: Image.asset('assets/images/img1.png',
              fit: BoxFit.cover
              ),
              )

            ],)
             : ListView.builder(
              itemBuilder: (ctx,index){
                  return Card(
                //row is used to seperate amount section from actual content section...
                child:Row(children:
                 [
                          //row 1
                          Container(
                            decoration: BoxDecoration(border:
                               Border.all(
                                color:Theme.of(context).primaryColor,
                               width: 2,
                               ),
                               borderRadius: BorderRadius.circular(10),
                               ) ,
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                            padding: EdgeInsets.all(10),
                            child:Text('\u{20B9} '+
                            transactions[index].amount.toStringAsFixed(2), // fixing decimal places
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color:Theme.of(context).primaryColor,
                              ),
                              )
                              ),
                          //row 2
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(
                              transactions[index].title, 
                              style: 
                              TextStyle(fontSize: 18,fontFamily: 'Open Sans',fontWeight: FontWeight.w500),
                              ),
                            Text(
                              DateFormat.yMMMEd().format(transactions[index].date),style: TextStyle(color: Colors.grey),),
                          ],),        
                  
                ],)
                );
              },
              itemCount: transactions.length,
          ));
  }
}
