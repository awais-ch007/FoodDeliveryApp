// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:fooddeliveryapp/services/auth/auth_Service.dart';
import 'package:fooddeliveryapp/widgets/custom_button.dart';
import 'package:fooddeliveryapp/widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  SignUpPage({super.key, this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

  void register() async {
    final _authService = AuthService();

    if (passwordController.text == confirmpasswordController.text) {
      try {
        await _authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(e.toString()),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Password don't match"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Lets create an acount for you. ',
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 25,
            ),

            CustomeTextField(
                controller: emailController,
                hintText: 'Enter Email',
                obscureText: false),

            //email textfield

            //password textfield
            const SizedBox(
              height: 25,
            ),
            CustomeTextField(
                controller: passwordController,
                hintText: 'Enter Password',
                obscureText: true),
            //confirm password textfield
            const SizedBox(
              height: 25,
            ),
            CustomeTextField(
                controller: confirmpasswordController,
                hintText: 'Confirm Password',
                obscureText: true),
            //button
            const SizedBox(
              height: 25,
            ),
            CustomButton(
                onTap: () {
                  register();
                },
                text: 'Sign Up'),

            const SizedBox(
              height: 25,
            ),
            //not a member
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have an Account?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginPage()));
                  ,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
