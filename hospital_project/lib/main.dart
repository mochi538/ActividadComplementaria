import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú de Navegación',
      home: Opciones(),
    );
  }
}

class Opciones extends StatelessWidget {
  final List<MenuOption> options = [
    MenuOption(title: 'Opción 1', screen: OptionScreen(title: 'Pantalla 1')),
    MenuOption(title: 'Opción 2', screen: OptionScreen(title: 'Pantalla 2')),
    MenuOption(title: 'Opción 3', screen: OptionScreen(title: 'Pantalla 3')),
    MenuOption(title: 'Opción 4', screen: OptionScreen(title: 'Pantalla 4')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Options'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => options[index].screen,
                  ),
                );
              },
              child: Card(
                elevation: 4,
                child: Center(
                  child: Text(
                    options[index].title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  final String title;

  OptionScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Bienvenido a $title',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MenuOption {
  final String title;
  final Widget screen;

  MenuOption({required this.title, required this.screen});
}
