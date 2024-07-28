// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/restaraunt.dart';
import 'package:fooddeliveryapp/pages/Home_Page.dart';
import 'package:fooddeliveryapp/services/database/firestore.dart';
import 'package:fooddeliveryapp/widgets/cart_receipt.dart';
import 'package:fooddeliveryapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  FireStoreService db = FireStoreService();

  @override
  void initState() {
    super.initState();
    String receipt = context.read<Restaraunt>().displayCartReciept();
    db.saveOrdertoDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Consumer<Restaraunt>(builder: (context, restaraunt, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Order Progress"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CartReceipt(),
              SizedBox(
                height: height * 0.1,
              ),
              CustomButton(
                  text: 'Order Recieved',
                  onTap: () {
                    restaraunt.clearCart();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      );
    });
  }
}
