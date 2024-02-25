import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import "package:expence_tracking_app/model/expence.dart";

final formatter = DateFormat.yMd(); // this use to formate the date

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expence expence) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController =
      TextEditingController(); // this is used to handle user input
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController
        .dispose(); // this is used to dispose the controller when the widget is disposed
    _amountController.dispose();
    super.dispose();
  }

  void _pressedDataPicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenceData() {
    final enteredAmount = double.tryParse(_amountController
        .text); // tryParse("hello") => null , tryParse("1.23")=>1.23
    final amountInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountInvalid ||
        _selectedDate == null) {
      //  show error message
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text("Please Enter correct details"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));

      return;
    }

    widget.onAddExpense(Expence(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory.name));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        
        children: [
         const SizedBox(height: 30,),
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  autocorrect: true,
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: "\$ ", label: Text("Enter Amount")),
                ),
              ),
              Text(_selectedDate == null
                  ? "No Selected date"
                  : formatter.format(_selectedDate!),style: const TextStyle(fontSize: 13),),
              IconButton(
                  onPressed: _pressedDataPicker,
                  icon: const Icon(Icons.calendar_today_outlined))
            ],
          ),

          const SizedBox(height: 40,),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toString())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }

                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => {Navigator.pop(context)},
              ),
              ElevatedButton(
                  onPressed: _submitExpenceData,
                  child: const Text("Save Elevasion"))
            ],
          )
        ],
      ),
    );
  }
}
