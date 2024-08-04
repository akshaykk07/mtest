import 'package:flutter/material.dart';

import '../models/data_model.dart';
import '../widgets/apptext.dart';
import '../widgets/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TextFieldItem> items = [];
  double total = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(
          name: 'Home',
          colors: customBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: CustomTextfield(
                        hint: 'Name Product',
                        keyboardType: TextInputType.name,
                        size: size,
                        controller: items[index].nameController,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 2,
                      child: CustomTextfield(
                        controller: items[index].priceController,
                        onchange: (value) {
                          updateTotal();
                        },
                        keyboardType: TextInputType.number,
                        hint: 'Price',
                        size: size,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        removeField(index);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5.0,
                offset: const Offset(0.0, 3.0)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02, horizontal: size.width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: prefer_const_constructors
                  AppText(
                    name: 'Subtotal',
                    colors: customBalck,
                    size: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    name: '\$ ${total.toString()}',
                    colors: customBalck,
                    size: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(size: size)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewField,
        shape: const CircleBorder(),
        backgroundColor: customBlue,
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }

  void addNewField() {
    final nameController = TextEditingController();
    final priceController = TextEditingController();

    setState(() {
      items.add(TextFieldItem(nameController, priceController));
    });
  }

  void removeField(int index) {
    if (items.isNotEmpty) {
      setState(() {
        items.removeAt(index);
        updateTotal();
      });
    }
  }

  void updateTotal() {
    double totals = 0;
    for (var item in items) {
      final value = double.tryParse(item.priceController.text);
      if (value != null) {
        totals += value;
      }
    }
    setState(() {
      total = totals;
    });
  }
}