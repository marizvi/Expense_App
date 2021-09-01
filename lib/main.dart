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

final titleController = TextEditingController();
final amountController = TextEditingController();


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
                Card(
                  elevation:5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                  TextField(
                    decoration:InputDecoration(labelText:'Title' ) ,
                    controller: amountController,
                    // onChanged: (val){
                    //   titleInput=val;
                    // },
                    ),
                  TextField(
                    decoration: InputDecoration(labelText:'Amount'),
                    controller: amountController,
                    // onChanged: (val){
                    //   amountInput=val;
                    // },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[600])
                    ),
                  child: Text('Add Transaction'),
                  onPressed: (){
                    // print(titleInput);
                    // print(amountInput);
                      print(titleController.text);
                  },
                  )
                ],
                ),)
                ),
                //cannot use below approach because we do not know beforehand 
                //how much widgets do we need(i.e how much cards do we need)
          // Column(children: <Widget>[
          //   Card(),
          //   Card(),
          // ])
            TransactionList() 
        ]
      )
    );
  }
}
