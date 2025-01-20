import 'package:flutter/material.dart';
// import 'main_screen.dart';
import 'login_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  void handleLogout(BuildContext context) async {
    bool isLoading = false;
    final bool? confirmLogout = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Cerrar Sesión'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('¿Estás seguro que deseas salir?'),
                  if (isLoading) ...[
                    const SizedBox(height: 20),
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ],
                ],
              ),
              actions: [
                TextButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context, false),
                  child: const Text('No'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() => isLoading = true);
                          await Future.delayed(const Duration(seconds: 3));
                          if (context.mounted) {
                            Navigator.pop(context, true);
                          }
                        },
                  child: const Text('Si'),
                ),
              ],
            );
          },
        );
      },
    );

    if (confirmLogout == true) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Usuario Demo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'usuario@demo.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Otros'),
            leading: const Icon(Icons.category),
          ),
          ListTile(
            title: const Text('Instrucciones'),
            leading: const Icon(Icons.info),
          ),
          ListTile(
            title: const Text('Acerca de TrasTec App'),
            leading: const Icon(Icons.info_outline),
          ),
          ListTile(
            title: const Text('Cerrar Sesión'),
            leading: const Icon(Icons.logout, color: Colors.red),
            onTap: () => handleLogout(context),
          ),
        ],
      ),
    );
  }
}
