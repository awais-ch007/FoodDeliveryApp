// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:fooddeliveryapp/services/auth/auth_Service.dart';
import 'package:fooddeliveryapp/widgets/Drawer_Tile.dart';

import '../pages/Settings_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      final _authService = AuthService();
      _authService.signOut();
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(),
          ),
          DrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DrawerTile(
            icon: Icons.settings,
            text: 'S E T T I N G S',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
          const Spacer(),
          DrawerTile(
            text: 'L O G O U T',
            icon: Icons.logout,
            onTap: logout,
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
