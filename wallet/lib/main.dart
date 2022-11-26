import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/appearance/theme.dart';
import 'package:wallet/providers/expense_provider.dart';
import 'package:wallet/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => ExpenseProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallet Manager',
        theme: ScreenTheme().theme,
        home: HomeScreen(),
      ),
    );
  }
}
