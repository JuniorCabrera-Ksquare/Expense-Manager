import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/appearance/alert_manager.dart';
import 'package:wallet/appearance/theme.dart';
import 'package:wallet/models/movement.dart';
import 'package:wallet/providers/expense_provider.dart';

class AdderScreen extends StatefulWidget {
  const AdderScreen({super.key});

  @override
  State<AdderScreen> createState() => _AdderScreenState();
}

class _AdderScreenState extends State<AdderScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  bool? _isExp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
                onPressed: () => Navigator.of(context).pop())
            : null,
      ),
      backgroundColor: Constants().backColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      toggleable: true,
                      activeColor: Constants().appColor,
                      title: Text("Income",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Constants().appColor)),
                      value: false,
                      groupValue: _isExp,
                      onChanged: (value) {
                        setState(() {
                          _isExp = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      toggleable: true,
                      activeColor: Constants().appColor,
                      title: Text("Expense",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Constants().appColor)),
                      value: true,
                      groupValue: _isExp,
                      onChanged: (value) {
                        setState(() {
                          _isExp = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  TextField(
                      controller: _titleCtrl,
                      style: const TextStyle(fontSize: 18, height: 1),
                      decoration: const InputDecoration(
                          labelText: "Title", border: OutlineInputBorder())),
                  const SizedBox(height: 8),
                  TextField(
                      controller: _priceCtrl,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 18, height: 1),
                      decoration: const InputDecoration(
                          labelText: "Amount", border: OutlineInputBorder())),
                  const SizedBox(height: 8),
                  TextField(
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      controller: _descriptionCtrl,
                      style: const TextStyle(fontSize: 18, height: 1),
                      decoration: const InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder())),
                  const SizedBox(height: 28),
                  SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_titleCtrl.text.isEmpty ||
                                _priceCtrl.text.isEmpty ||
                                _descriptionCtrl.text.isEmpty ||
                                _isExp == null) {
                              AlertManager().displaySnackbar(
                                  context, "Please, fill out all the fields.");
                            } else {
                              Movement movement = Movement(
                                  title: _titleCtrl.text,
                                  fecha: DateTime.now(),
                                  amount: double.parse(_priceCtrl.text),
                                  isExpense: _isExp!);

                              Provider.of<ExpenseProvider>(context,
                                      listen: false)
                                  .addMove(movement);

                              FocusManager.instance.primaryFocus?.unfocus();

                              setState(() {
                                _titleCtrl.clear();
                                _priceCtrl.clear();
                                _descriptionCtrl.clear();
                                _isExp = null;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Constants().appColor),
                          child: const Text(
                            "SUBMIT",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ))),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
