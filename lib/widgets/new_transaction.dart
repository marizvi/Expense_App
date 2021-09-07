import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){

      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if(enteredTitle.isEmpty || enteredAmount <=0)
      {
        return;
      }

    // widget.something allows us to access property of widget class inside state class
    widget.addTx(
          titleController.text, 
          double.parse(amountController.text),
          );

  Navigator.of(context).pop();
  //navigator allows us to close topmost screen..
  //navigator is a property of State class.
  }

  @override
  Widget build(BuildContext context) {
    return Card(
                  elevation:5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                  TextField(
                    decoration:InputDecoration(labelText:'Title' ) ,
                    controller: titleController,
                    onSubmitted: (_)=>submitData(), // used to directly submit when we just press done on keyboard if all entries are filled
                    // onChanged: (val){
                    //   titleInput=val;
                    // },
                    ),
                  TextField(
                    decoration: InputDecoration(labelText:'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                      // onsubmit requires String arguement to be passed,
                      // so to avoid any error instead of any proper argument we have used '_' sign which reflects that i do pass argument but do not care about it
                    onSubmitted: (_)=>submitData(),

                    // onChanged: (val){
                    //   amountInput=val;
                    // },
                  ),
                  
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[600])
                    ),
                  child: Text('Add Transaction'),
                  onPressed: submitData,
                    // print(titleInput);
                    // print(amountInput);
                  )
                ],
                ),)
                );
  }
}