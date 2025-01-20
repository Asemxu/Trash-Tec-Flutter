import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _handleRegister() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        // Simulate API call
        await Future.delayed(Duration(seconds: 2));
        
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al registrar usuario'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.green[300]!, Colors.green[700]!],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(Icons.recycling, size: 100, color: Colors.white),
                    SizedBox(height: 30),
                    Card(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                            key: formKey,
                            child: Column(
                            children: [
                                Text(
                                'Registro',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    labelText: 'Correo electrónico',
                                    prefixIcon: Icon(Icons.email),
                                ),
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Por favor ingrese su correo';
                                    }
                                    return null;
                                },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    labelText: 'Nombres',
                                    prefixIcon: Icon(Icons.person),
                                ),
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Por favor ingrese sus nombres';
                                    }
                                    return null;
                                },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                controller: lastNameController,
                                decoration: InputDecoration(
                                    labelText: 'Apellidos',
                                    prefixIcon: Icon(Icons.person_outline),
                                ),
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Por favor ingrese sus apellidos';
                                    }
                                    return null;
                                },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                controller: passwordController,
                                obscureText: obscurePassword,
                                decoration: InputDecoration(
                                    labelText: 'Contraseña',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                    icon: Icon(
                                        obscurePassword ? Icons.visibility : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                        setState(() {
                                        obscurePassword = !obscurePassword;
                                        });
                                    },
                                    ),
                                ),
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Por favor ingrese su contraseña';
                                    }
                                    return null;
                                },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                controller: confirmPasswordController,
                                obscureText: obscureConfirmPassword,
                                decoration: InputDecoration(
                                    labelText: 'Confirmar contraseña',
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                    icon: Icon(
                                        obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                        setState(() {
                                        obscureConfirmPassword = !obscureConfirmPassword;
                                        });
                                    },
                                    ),
                                ),
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                    return 'Por favor confirme su contraseña';
                                    }
                                    if (value != passwordController.text) {
                                    return 'Las contraseñas no coinciden';
                                    }
                                    return null;
                                },
                                ),
                                SizedBox(height: 25),
                                ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                ),
                                onPressed: isLoading ? null : _handleRegister,
                                child: isLoading
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Text(
                                        'Registrarse',
                                        style: TextStyle(color: Colors.white),
                                        ),
                                ),
                                SizedBox(height: 15),
                                TextButton(
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                child: Text(
                                    'Ya tengo una cuenta',
                                    style: TextStyle(color: Colors.green),
                                ),
                                ),
                            ],
                            ),
                        ),
                        ),
                    ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}