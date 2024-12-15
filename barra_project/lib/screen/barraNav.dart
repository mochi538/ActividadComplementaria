import 'package:flutter/material.dart';

class barraNav extends StatefulWidget {
  @override
  _barraNavState createState() => _barraNavState();
}

class _barraNavState extends State<barraNav> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App TabBar"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home), text: "Inicio"),
            Tab(icon: Icon(Icons.message), text: "Mensajes"),
            Tab(icon: Icon(Icons.person), text: "Perfil"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Inicip")),
          Center(child: Text("Mensajes")),
          Center(child: Text("Perfil")),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
