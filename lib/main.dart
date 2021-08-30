import 'package:flutter/material.dart';
import 'transaction.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      't1','New Shoes' ,6999 , DateTime.now(),
      ), 
    Transaction(
      't2','weekly Groceries' ,2500 , DateTime.now(),
      ), 
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body:Column( 
        mainAxisAlignment:MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        <Widget>[
            Container(
              width: double.infinity,
              child:Card(
                color: Colors.blue[200],
              child: Text('Chart!'),
            elevation: 5,
                  ),
                ),

                //cannot use below approach because we do not know beforehand 
                //how much widgets do we need(i.e how much cards do we need)
          // Column(children: <Widget>[
          //   Card(),
          //   Card(),
          // ])

          Column(
            children: transactions.map((obj){
              return Card(

                //row is used to seperate amount section from actual content section...
                child:Row(children:
                 <Widget>[
                          //row 1
                          Container(
                            decoration: BoxDecoration(border:
                               Border.all(color:Colors.purple,width: 2,),borderRadius: BorderRadius.circular(10),) ,
                            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                            padding: EdgeInsets.all(10),
                            child:Text(
                              obj.amount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.purple,
                              ),
                              )
                                  ),
                          //row 2
                          Column(children: <Widget>[
                            Text(obj.title),
                            Text(obj.date.toString()),
                          ],)        
                  
                ],)
                );
            }
          ).toList(),),

        ]
      )
    );
  }
}
