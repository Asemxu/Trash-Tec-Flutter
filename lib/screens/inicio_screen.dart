import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido a Trash Tec',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildOptionCard(
                  icon: Icons.map,
                  title: 'Mapa',
                  onTap: () {
                    // Navigate to map
                  },
                ),
                _buildOptionCard(
                  icon: Icons.recycling,
                  title: 'Reciclar',
                  onTap: () {
                    // Navigate to recycling
                  },
                ),
                _buildOptionCard(
                  icon: Icons.info,
                  title: 'Información',
                  onTap: () {
                    // Navigate to info
                  },
                ),
                _buildOptionCard(
                  icon: Icons.settings,
                  title: 'Configuración',
                  onTap: () {
                    // Navigate to settings
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}