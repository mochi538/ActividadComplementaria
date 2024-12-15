import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

/* Clase con los métodos */
class CompanyHolding {
  /* Atributos */
  Map<String, String> companies = {}; 
  double totalRevenue = 0.0; 

  /*  Método para añadir una empresa */
  void addCompany(String name, String sector) {
    companies[name] = sector;
  }

  /*  Método para calcular los ingresos totales */
  void calculateTotalRevenue(Map<String, double> revenues) {
    totalRevenue = 0.0;
    revenues.forEach((companyName, revenue) {
      if (companies.containsKey(companyName)) {
        totalRevenue += revenue;
      }
    });
  }

  // Método para mostrar las empresas y sus sectores
  String displayCompanies() {
    if (companies.isEmpty) {
      return 'No hay empresas registradas.';
    } else {
      String result = '';
      companies.forEach((name, sector) {
        result += 'Empresa: $name, Sector: $sector\n';
      });
      return result;
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CompanyHolding holding;

  @override
  void initState() {
    super.initState();
    holding = CompanyHolding();

    
    holding.addCompany('Compañia 1', 'Ropa');
    holding.addCompany('Compañia 2', 'Alimentación');
    holding.addCompany('Compañia 3', 'Electrodomésticos');

    
    Map<String, double> revenues = {
      'Compañia 1': 5000000.0,
      'Compañia 2': 2000000.0,
      'Compañia 3': 1500000.0,
    };

    // Calcular los ingresos totales
    holding.calculateTotalRevenue(revenues);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Company Holding'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Empresas y Sectores:',
                style: Theme.of(context).textTheme.titleLarge, 
              ),
              Text(
                holding.displayCompanies(),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Ingresos Totales: \$${holding.totalRevenue.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
