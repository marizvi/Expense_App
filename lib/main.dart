import 'package:exp_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';
import '../models/transaction.dart';


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
        fontFamily: 'DancingScript',

          
         //with this we can only provide Roboto font to whole appbar title.
          appBarTheme: AppBarTheme(
          textTheme:ThemeData.light().textTheme.copyWith(
          title: TextStyle(
                          fontFamily: 'Roboto', 
                          fontSize: 20,
                          fontWeight:FontWeight.w800
                          )
          ))
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

List<Transaction> get _recentTransactions{
  return _usertransaction.where((tx){
    return tx.date.isAfter(
      DateTime.now().subtract(Duration(days:7),
    )
    );
  }).toList();
}

void _addNewTranscation(String txtitle, double txamount)
{
  final newTx = Transaction(
    DateTime.now().toString(), 
    txtitle,
     txamount, 
     DateTime.now()
     );
     
     setState(() {
       _usertransaction.add(newTx);
     });
}


void startAddNewTransaction(BuildContext ctx)
{
  showModalBottomSheet(context: ctx, 
  builder: (_)
   {
    // or simply, return NewTransaction(_addNewTranscation),

     // not understood anything about gesture..
     
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTranscation),
        behavior: HitTestBehavior.opaque,
        );
   }
   );
}

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
           
           Chart(_recentTransactions),
                // UserTransaction(),
                TransactionList(_usertransaction),

        ]
      )
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      child:Icon(Icons.add),onPressed: ()=>startAddNewTransaction(context)),
    );
  }
}
