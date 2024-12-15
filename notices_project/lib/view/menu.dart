import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Inicio', style: TextStyle(fontSize: 24))),
    Center(child: Text('Más relevante', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notices Project'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[500],
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.purple[400],
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.abc_rounded),
              title: Text('Últimas noticias'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_soccer),
              title: Text('Deportes'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Farándula'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.laptop),
              title: Text('Tecnología'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Lo más relevante',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
