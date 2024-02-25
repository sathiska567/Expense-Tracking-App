import 'package:expence_tracking_app/model/expence.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  // create a constructor
  const ExpenseItem(this.expence, {super.key});

  final Expence expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expence.title,
              style: Theme.of(context).textTheme.labelLarge,
              
              ),
            const SizedBox(height: 4),
             Row(
              children: [
                Text("\$${expence.amount.toStringAsFixed(2)}"),   // 12.5453 --> 12.54 - toStringAsFixed(),if need to add $ to infront of amout can use \$ symbol. 
                
                   const Spacer(),

                 Row(
                  children: [
                    const Icon(Icons.alarm),  
                     const SizedBox(width: 4),
                     Text(expence.formattedDate),

                  ],
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
