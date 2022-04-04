// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              
              tabs: [
                Tab(text: "Gender"),
                Tab(text: "Status"),
                Tab(text: "Names"),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                Text("Hi"),
                Text("Hello"),
                Text("Selam"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
