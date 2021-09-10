import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  ChartBar(this.label,this.spendingAmount,this.spendingPercentOfTotal);


  @override
  Widget build(BuildContext context) {
    return Column(children:[
      //fittedbox allows us to shrink data whenever its becoming large enough
      FittedBox(
        child:
      Text('\u{20B9} ${spendingAmount.toStringAsFixed(0)}'),
      ),
      SizedBox(height: 4),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: [
            Container( // this container is for grey colour only 
              decoration:BoxDecoration(
              border: Border.all(
              color: Colors.grey,
              width: 1.0
             ),
             color: Color.fromRGBO(220,220,220,1),
             borderRadius: BorderRadius.circular(10)
             ),
             ),
             FractionallySizedBox(
               heightFactor: spendingPercentOfTotal, // always ranges from 0 to 1 % of surrounding container at 16th line above from here
               child:Container(
                 decoration: BoxDecoration(
                   color: Theme.of(context).primaryColor,
                   borderRadius:BorderRadius.circular(10),
                 ),
                 )
             )
          ],
        ),
      ),
      SizedBox(height: 4),
      Text(label)
    ]
    );
  }
}