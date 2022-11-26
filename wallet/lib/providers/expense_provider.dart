import 'package:flutter/cupertino.dart';
import 'package:wallet/models/movement.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Movement> movements = [];
  num total = 0;

  addMove(Movement move) {
    movements.add(move);
    getTotal(move);
    notifyListeners();
  }

  getTotal(Movement move) {
    move.isExpense ? total -= move.amount : total += move.amount;
  }
}
