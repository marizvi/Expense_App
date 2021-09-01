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
            height: 320,
            child:ListView(
            children: 
            // here we have not used this [] brackets because transactions is itself a list of Transaction
            //and cards cannot be defined under the list,
            transactions.map((obj){
              return Card(
                //row is used to seperate amount section from actual content section...
                child:Row(children:
                 [
                          //row 1
                          Container(
                            decoration: BoxDecoration(border:
                               Border.all(color:Colors.purple,width: 2,),borderRadius: BorderRadius.circular(10),) ,
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                            padding: EdgeInsets.all(10),
                            child:Text('\u{20B9} '+
                            obj.amount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.purple,
                              ),
                              )
                                  ),
                          //row 2
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(obj.title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Text(
                              DateFormat.yMMMEd().format(obj.date),style: TextStyle(color: Colors.grey),),
                          ],),        
                  
                ],)
                );
            }
    ).toList(),));
  }
}
