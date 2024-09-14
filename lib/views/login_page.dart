import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = AuthController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;

  void _login() {
    String user = _userController.text;
    String password = _passwordController.text;

    if (_authController.login(user, password)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Usuario o contraseña incorrectos'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ingrese su usuario y contraseña para ver los países',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            fontFamily: 'Montserrat',
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    obscureText: !_showPassword,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
