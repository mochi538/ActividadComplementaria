import 'package:flutter/material.dart';

class registro extends StatefulWidget {
  @override
  _registroState createState() => _registroState();
}

class _registroState extends State<registro> {
  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de Registro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_nombreController, "Nombre", TextInputType.name),
              _buildTextField(_usuarioController, "Nombre de usuario", TextInputType.text),
              _buildTextField(_correoController, "Correo", TextInputType.emailAddress, validator: (value) {
                if (value == null || !RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+").hasMatch(value)) {
                  return "Ingrese un correo válido";
                }
                return null;
              }),
              _buildTextField(_telefonoController, "Teléfono", TextInputType.phone),
              _buildPasswordField(_passwordController, "Contraseña"),
              _buildPasswordField(_confirmPasswordController, "Confirmar Contraseña", validator: (value) {
                if (value != _passwordController.text) {
                  return "Las contraseñas no coinciden";
                }
                return null;
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Formulario válido")),
                    );
                  }
                },
                child: Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, TextInputType inputType, {String? Function(String?)? validator}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator ?? (value) {
          if (value == null || value.isEmpty) {
            return "Por favor ingrese su $label";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String label, {String? Function(String?)? validator}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator ?? (value) {
          if (value == null || value.isEmpty) {
            return "Por favor ingrese su $label";
          }
          if (value.length < 6) {
            return "$label debe tener al menos 6 caracteres";
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _usuarioController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _correoController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }
}
