import 'package:flutter/material.dart';
import '../models/transaction.dart';
import "package:intl/intl.dart";

class TransactionList extends StatelessWidget {

final List<Transaction> transactions;
final Function deleteTx;

TransactionList(this.transactions, this.deleteTx);
  
  @override
  Widget build(BuildContext context) {
    return 
            // Column(
            Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child:transactions.isEmpty? 
            LayoutBuilder(builder: (ctx,constraints){
              
              return Column(children: [
              Text('No Transactions added Yet!!',
              style: TextStyle(fontFamily: 'Open Sans'),
              ),
              // to add space between abovetext and below image we used.
              SizedBox(
                height: 20,
              ),

              Container(
                height: constraints.maxHeight*0.7,
                width: double.infinity,
              child: Image.asset('assets/images/img1.png',
              fit: BoxFit.cover
              ),
              )

            ],);
            })
            
             : ListView.builder( //makes the list scrollable otherwise if used only column then it is not scrollable
              itemBuilder: (ctx,index){
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                    // child: FittedBox(
                      child: Text('\u{20B9} ${transactions[index].amount}',
                      style:Theme.of(context).textTheme.title,
                      // TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 12,
                      //           color:Theme.of(context).primaryColorLight,
                      //         ),
                              ),
                      // ),
                    ),
                  ),
                  title: Text(transactions[index].title,
                  style: 
                        TextStyle(fontSize: 18,fontFamily: 'Open Sans',fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(DateFormat.yMMMEd().format(transactions[index].date)
                  ),
                  trailing: MediaQuery.of(context).size.width>420?
                  TextButton.icon(
                    onPressed: ()=>deleteTx(transactions[index].id), // always pass any function recieving arguements in this manner only
                    icon: Icon(Icons.delete), 
                    label: Text("Delete"),
                    style: ButtonStyle(
                    // backgroundColor:  MaterialStateProperty.all(Colors.redAccent[400]),
                    foregroundColor: MaterialStateProperty.all( Theme.of(context).errorColor) // to change text color
                    ),
                    ):
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: ()=>deleteTx(transactions[index].id), // always pass any function recieving arguements in this manner only
                    color: Theme.of(context).errorColor,
                    ),
                ),
                );
              },
              itemCount: transactions.length,
          ));
  }
}
