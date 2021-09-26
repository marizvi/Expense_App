import 'package:exp_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


void main() {  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'DancingScript',
           textTheme:ThemeData.light().textTheme.copyWith(
          // button: TextStyle(color: Colors.white),
          title: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto', 
                          fontSize: 12,
                          fontWeight:FontWeight.w400
                          ),
          ),
         //with this we can only provide Roboto font to whole appbar title.
          appBarTheme: AppBarTheme(
          textTheme:ThemeData.light().textTheme.copyWith(
          title: TextStyle(
                          fontFamily: 'Roboto', 
                          fontSize: 20,
                          fontWeight:FontWeight.w800
                          ),
          ),
          )
       ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
// String titleInput="";
// String amountInput="";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final List<Transaction> _usertransaction = [
    //  Transaction(
    //   't1','New Shoes' ,6999 , DateTime.now(),
    //   ), 
    // Transaction(
    //   't2','weekly Groceries' ,2500 , DateTime.now(),
    //   ), 
  ];

// this recentTransaction getter is being transfered to chart widget
// finding all transactions younger than today minus 7 days
List<Transaction> get _recentTransactions{ 
  // can also be achieved through for loop
  // where allows us to run function for every item in a list
  // if that function is true then that item is kept in a newly returned list otherwise its not included
  // in newly returned list.
  return _usertransaction.where((tx){
    // isAfter returns either true or false
    return tx.date.isAfter(
      DateTime.now().subtract(Duration(days:7),
    )
      //only transactions younger than 7 days are included here
    );
  }).toList();
}

// getter just provide all transactions in last 7 days
//now go to chart.dart

void _addNewTranscation(String txtitle, double txamount, DateTime chosenDate )
{
  final newTx = Transaction(
    DateTime.now().toString(), 
    txtitle,
     txamount, 
     chosenDate,
     );
     
     setState(() {
       _usertransaction.add(newTx);
     });
}

void _deleteTransaction(String id)
{
  setState(() {
    _usertransaction.removeWhere((tx){
      return tx.id == id;
    } );
  });
}

void startAddNewTransaction(BuildContext ctx)
{
  showModalBottomSheet(context: ctx, 
  builder: (_)
   {
    // or simply, 
    return NewTransaction(_addNewTranscation);

     // if even clicking at the bottom sheet, sheet gets closes then use below gesture method
     
      // return GestureDetector(
      //   onTap: (){}, // does nothing on tapping i.e avoids closing the sheet if we tap on sheet
      //   child: NewTransaction(_addNewTranscation),
      //   behavior: HitTestBehavior.opaque,
      //   );
   }
   );
}
bool _showChart = false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(onPressed: ()=>startAddNewTransaction(context), icon: Icon(Icons.add_box_rounded))
        ],
      ),
      body:SingleChildScrollView(
        child:Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Show Chart'),
              Switch(value: _showChart, onChanged: (val){
                setState(() {
                  _showChart = val;
                });
              })
            ],
            ),
           _showChart ?
           Container(
             height: MediaQuery.of(context).size.height*0.6,
             child: 
           Chart(_recentTransactions),
           ):

                // UserTransaction(),
                Container(
                  height: MediaQuery.of(context).size.height*0.6,
                child: TransactionList(_usertransaction,_deleteTransaction),
                )

        ]
      )
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      child:Icon(Icons.add),onPressed: ()=>startAddNewTransaction(context)),
    );
  }
}
