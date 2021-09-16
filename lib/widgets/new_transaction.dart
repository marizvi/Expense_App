import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime? _selectedDate; // improtant '?'

  void submitData(){

    if(amountController.text.isEmpty)
    return;

      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);

      if(enteredTitle.isEmpty || enteredAmount <=0 || _selectedDate==null)
      {
        return;
      }

    // widget.something allows us to access property of widget class inside state class
    // because addTx is not defined in state class
    widget.addTx(
          titleController.text, 
          double.parse(amountController.text),
          _selectedDate,
          );

  Navigator.of(context).pop();
  //navigator allows us to close topmost screen..
  //navigator is a property of State class.
  } 

  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2021), 
      lastDate: DateTime.now()
      ).then((pickedDate){
          if( pickedDate==null)
          return;
          setState(() {
          _selectedDate = pickedDate;
          });
      });
      print("...");
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
                  Row(children: [
                    Expanded(child: 
                    Text(_selectedDate == null ? 'No Date Chosen!' : DateFormat.yMd().format(_selectedDate!),// important '!'
                     style: TextStyle(fontFamily: 'Roboto'),
                     ),),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                      ),
                      onPressed: _presentDatePicker,
                     child: Text("Choose Date",
                     style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
                     ),
                     )
                  ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                    ),
                  child: Text('Add Transaction',
                  // style: TextStyle(color: Theme.of(context).textTheme.button.color, fontFamily: 'Roboto' ),
                  style: TextStyle(color: Colors.white, fontFamily: 'Roboto' ),
                  ),
                  onPressed: submitData,
                    // print(titleInput);
                    // print(amountInput);
                  )
                ],
                ),)
                );
  }
}