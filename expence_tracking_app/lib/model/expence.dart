import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import "package:intl/intl.dart";

final formatter = DateFormat.yMd();   // this use to formate the date

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food:Icon(Icons.lunch_dining),
  Category.travel:Icon(Icons.flight_takeoff),
  Category.leisure:Icon(Icons.movie),
  Category.work:Icon(Icons.work),

};

class Expence {
  //Constructor
  Expence({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // this uuid help to generate unique id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;

  String get formattedDate{
    return formatter.format(date);
  }

}



class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  final Category category;
  final List<Expence> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
