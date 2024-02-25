import 'package:expence_tracking_app/widgets/expenses_list.dart';
import 'package:expence_tracking_app/model/expence.dart';
import 'package:expence_tracking_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expence> _registeredExpenses = [
    Expence(
      title: "flutter",
      amount: 100,
      date: DateTime.now(),
      category: "food",
    ),
    Expence(
      title: "New Course",
      amount: 90,
      date: DateTime.now(),
      category: "work",
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expence expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpence(Expence expence) {
    final expenceIndex = _registeredExpenses.indexOf(expence);

    setState(() {
      _registeredExpenses.remove(expence);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expence Deleted !"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenceIndex, expence);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
        child: Text("No expenses Found , Start Adding some expences ! "));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        onRemoveItem: _removeExpence,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracking "),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Expanded(child: mainContent)
          
          ],
      ),
    );
  }
}
