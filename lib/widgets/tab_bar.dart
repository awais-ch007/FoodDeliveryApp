// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/Food.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    List<Tab> _buildCatehoryTabs() {
      return FoodCategory.values.map((category) {
        return Tab(
          text: category.toString().split('.').last,
        );
      }).toList();
    }

    // ignore: avoid_unnecessary_containers
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCatehoryTabs(),
      ),
    );
  }
}
