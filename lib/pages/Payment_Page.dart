import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fooddeliveryapp/widgets/custom_button.dart';

import 'DeliveryProgressPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void onPayNow() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Confirm Payment'),
                content: SingleChildScrollView(
                  child: ListBody(children: [
                    Text('Card Number : $cardNumber'),
                    Text('Expiry Date : $expiryDate'),
                    Text('CardHolder Name : $cardHolderName'),
                    Text(' Cvv Code : $cvvCode'),
                  ]),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DeliveryProgressPage()));
                      },
                      child: const Text('Confirm')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Checkout',
        ),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (data) {},
              ),
              CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    cardHolderName = data.cardHolderName;
                    expiryDate = data.expiryDate;
                    cvvCode = data.cvvCode;
                  });
                },
                formKey: formKey,
              ),
              const SizedBox(height: 20),
              CustomButton(text: 'Pay Now', onTap: onPayNow),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
