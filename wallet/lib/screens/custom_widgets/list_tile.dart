import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallet/models/movement.dart';

class CustomTile extends StatelessWidget {
  final Movement movement;
  const CustomTile({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            movement.title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(DateFormat('M/d/y hh:mm a').format(movement.fecha)),
          trailing: movement.isExpense
              ? Text("-${movement.amount}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red))
              : Text("+${movement.amount}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.green))),
    );
  }
}
