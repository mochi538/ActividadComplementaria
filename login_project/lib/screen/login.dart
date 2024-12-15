import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_project/screen/registro.dart';



class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar:AppBar(
              
            ),
        body:
        Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Form(
                    child: Column(
              children: [
                Image.network(
                  "https://static-00.iconduck.com/assets.00/profile-user-icon-512x512-nm62qfu0.png",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "username",
                    border: OutlineInputBorder(),
                  ),
                  /* Validación */
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => registro(),
                          ));
                    },
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 126, 126, 126),
                      minimumSize: Size(double.infinity, 50),
                      elevation: 50,
                    )),
                    ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Ingresar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 126, 126, 126),
                      minimumSize: Size(double.infinity, 50),
                      elevation: 50,
                    )),

                    Text("Olvidó su contraseña"),

              ],
            )
            )
            )
            )
          
        );
  }
}