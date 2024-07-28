// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/models/Food.dart';
import 'package:fooddeliveryapp/models/restaraunt.dart';
import 'package:fooddeliveryapp/widgets/description.dart';
import 'package:fooddeliveryapp/widgets/food_tile.dart';
import 'package:fooddeliveryapp/widgets/home_drawer.dart';
import 'package:fooddeliveryapp/widgets/location.dart';
import 'package:fooddeliveryapp/widgets/sliver_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddeliveryapp/widgets/tab_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final food = categoryMenu[index];
            return FoodTile(
              food: food,
              onTap: () {},
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      drawer: const HomeDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxisScrolled) => [
          MySliverAppBar(
            // ignore: sort_child_properties_last
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //location
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                MyLocation(),
                const Description(),

                //description
              ],
            ),
            title: MyTabBar(tabController: _tabController),
          )
        ],
        body: Consumer<Restaraunt>(
          builder: (context, restaraunt, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaraunt.menu)),
        ),
      ),
    );
  }
}
