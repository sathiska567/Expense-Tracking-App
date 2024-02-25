import 'package:expence_tracking_app/model/expence.dart';
import 'package:expence_tracking_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveItem});

  final List<Expence> expenses;
  final void Function(Expence expence) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(expenses[index]),
            background:
                Container(color: Theme.of(context).colorScheme.error.withOpacity(0.4) , margin:const EdgeInsets.symmetric(horizontal: 10),),
                
            onDismissed: (direction) {
              onRemoveItem(expenses[index]);
            },
            child: ExpenseItem(expenses[index])));
  }
}
