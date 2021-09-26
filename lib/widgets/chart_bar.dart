import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  ChartBar(this.label,this.spendingAmount,this.spendingPercentOfTotal);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constraint){
      return Column(children:[
      //fittedbox allows us to shrink data whenever its becoming large enough
      Container(
        height: constraint.maxHeight*0.15,
        child:
      FittedBox(
        child:
      Text('\u{20B9} ${spendingAmount.toStringAsFixed(0)}'),
      ),),
      SizedBox(height: constraint.maxHeight*0.05,),
      Container(
        // height: MediaQuery.of(context).size.height*0.08,//also possible through this way
        height:constraint.maxHeight*0.6,
        width: 10,
        child: Stack(
          children: [
            Container( // this container is for grey colour only 
              // width: 20,//no matter how much width you provide here it won't exceed 10(which is the width of parent)
              decoration:BoxDecoration(
              border: Border.all(
              color: Colors.grey,
              width: 1.0 //border width
             ),
             color: Color.fromRGBO(220,220,220,1),
             borderRadius: BorderRadius.circular(10)
             ),
             ),
             FractionallySizedBox(
               heightFactor: spendingPercentOfTotal, // always ranges from 0 to 1 % of surrounding container at 17th line above from here
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
      SizedBox(height: constraint.maxHeight * 0.05),
      Container(
        height: constraint.maxHeight*0.15, //whenever trying to make font responsive always wrap text widget inside container
        child: Text(label))
    ]
    );
    },);
    
  }
}