import 'package:flutter/material.dart';
import 'package:wallet/appearance/theme.dart';

class AlertManager {
  displaySnackbar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Constants().appColor,
        duration: const Duration(milliseconds: 3000)));
  }
}
