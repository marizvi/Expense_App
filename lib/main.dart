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
        mainAxisAlignment:MainAxisAlignment.center,
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
                child:Text(obj.title));
            }
          ).toList(),),

        ]
      )
    );
  }
}
