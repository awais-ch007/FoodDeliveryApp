import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/register_page.dart';

import '../../pages/login_page.dart';

class LogInOrRegister extends StatefulWidget {
  const LogInOrRegister({super.key});

  @override
  State<LogInOrRegister> createState() => _LogInOrRegisterState();
}

class _LogInOrRegisterState extends State<LogInOrRegister> {
  bool showLoginpage = true;
  void togglePages() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}
