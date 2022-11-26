import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/appearance/theme.dart';
import 'package:wallet/providers/expense_provider.dart';
import 'package:wallet/screens/adder.dart';
import 'package:wallet/screens/custom_widgets/list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants().backColor,
        body: Column(
          children: [
            Container(
              color: Constants().appColor,
              height: 350,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "BALANCE",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                        "\$ ${Provider.of<ExpenseProvider>(context, listen: true).total.toString()} USD",
                        style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    SizedBox(
                        height: 45,
                        width: 135,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AdderScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              "Create",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Constants().appColor),
                            ))),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Provider.of<ExpenseProvider>(context, listen: false)
                        .movements
                        .isEmpty
                    ? const Center(
                        child: Text(
                          "No movements registered",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )
                    : Consumer<ExpenseProvider>(
                        builder: (context, prov, child) {
                          var moves = prov.movements;
                          return ListView.builder(
                              itemCount: moves.length,
                              itemBuilder: (context, index) {
                                return CustomTile(movement: moves[index]);
                              });
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
