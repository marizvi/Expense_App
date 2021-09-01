import 'package:exp_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';

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
  
// String titleInput="";
// String amountInput="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body:Column( 
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
        ]
      )
    );
  }
}
