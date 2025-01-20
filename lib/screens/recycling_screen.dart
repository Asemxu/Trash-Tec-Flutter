import 'package:flutter/material.dart';
import 'dart:async';

class RecyclingScreen extends StatefulWidget {
  const RecyclingScreen({super.key});

  @override
  State<RecyclingScreen> createState() => RecyclingScreenState();
}

class RecyclingScreenState extends State<RecyclingScreen> with SingleTickerProviderStateMixin {
  Map<int, ScrollController> scrollControllers = {};
  int selectedIndex = -1;
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  final List<Map<String, dynamic>> recyclingItems = [
    {
      'title': 'Aparatos de Refrigeración',
      'icon': Icons.ac_unit,
      'description': 'Equipos diseñados para mantener alimentos y otros productos a bajas temperaturas.',
      'image': 'assets/images/fridge.png',
      'permitido': [
        'Refrigeradoras domésticas',
        'Congeladores',
        'Aires acondicionados',
        'Dispensadores de agua',
        'Deshumidificadores'
      ],
      'noPermitido': [
        'Equipos con gases tóxicos',
        'Aparatos industriales',
        'Equipos con fugas de gas',
        'Refrigeradores sin etiqueta de gas'
      ],
      'tips': [
        'Desconecta y descongela 24h antes',
        'Vacía y limpia completamente',
        'No dañes los circuitos de refrigeración',
        'Transporta en posición vertical'
      ]
    },
    {
      'title': 'Aparatos grandes y medianos',
      'icon': Icons.tv,
      'description': 'Electrodomésticos de uso común en el hogar de tamaño considerable.',
      'image': 'assets/images/microwave.png',
      'permitido': [
        'Lavadoras',
        'Secadoras',
        'Lavavajillas',
        'Cocinas eléctricas',
        'Hornos microondas'
      ],
      'noPermitido': [
        'Equipos con residuos tóxicos',
        'Aparatos con aceites sin drenar',
        'Equipos industriales',
        'Aparatos incompletos'
      ],
      'tips': [
        'Desconecta y limpia antes de reciclar',
        'Retira residuos de detergentes',
        'Drena el agua completamente',
        'Asegura las puertas para el transporte'
      ]
    },
    {
      'title': 'Pequeños electrodomésticos',
      'icon': Icons.phone_android,
      'description': 'Aparatos eléctricos pequeños de uso doméstico diario.',
      'image': 'assets/images/coffee.png',
      'permitido': [
        'Cafeteras',
        'Tostadoras',
        'Batidoras',
        'Planchas',
        'Secadores de pelo'
      ],
      'noPermitido': [
        'Aparatos con baterías dañadas',
        'Equipos con fugas de aceite',
        'Dispositivos muy oxidados',
        'Aparatos sin identificar'
      ],
      'tips': [
        'Retira las baterías si las tiene',
        'Limpia de residuos',
        'Empaca de forma segura',
        'Mantén los cables enrollados'
      ]
    },
    {
      'title': 'Equipos informáticos',
      'icon': Icons.computer,
      'description': 'Dispositivos relacionados con la informática y procesamiento de datos.',
      'image': 'assets/images/desktop.png',
      'permitido': [
        'Computadoras de escritorio',
        'Laptops',
        'Impresoras',
        'Escáneres',
        'Teclados y mouse'
      ],
      'noPermitido': [
        'Equipos con información sensible',
        'Baterías dañadas',
        'Cartuchos de tinta',
        'Dispositivos mojados'
      ],
      'tips': [
        'Respalda y borra tu información',
        'Retira baterías y cartuchos',
        'Desconecta todos los cables',
        'Empaca protegiendo las pantallas'
      ]
    },
    {
      'title': 'Pantallas y monitores',
      'icon': Icons.monitor,
      'description': 'Dispositivos de visualización y pantallas electrónicas.',
      'image': 'assets/images/computer.png',
      'permitido': [
        'Monitores LCD/LED',
        'Televisores',
        'Pantallas de computadora',
        'Marcos digitales',
        'Tablets'
      ],
      'noPermitido': [
        'Pantallas rotas',
        'Monitores CRT antiguos',
        'Dispositivos con mercurio',
        'Pantallas sin identificar'
      ],
      'tips': [
        'Manipula con cuidado',
        'No rompas las pantallas',
        'Usa el embalaje original si es posible',
        'Protege las superficies'
      ]
    },
    {
      'title': 'Lámparas y luminarias',
      'icon': Icons.lightbulb_outline,
      'description': 'Dispositivos de iluminación y sus componentes.',
      'image': 'assets/images/lamp.png',
      'permitido': [
        'Lámparas LED',
        'Focos ahorradores',
        'Tubos fluorescentes',
        'Lámparas de escritorio',
        'Luminarias decorativas'
      ],
      'noPermitido': [
        'Lámparas rotas',
        'Bombillas incandescentes',
        'Focos con mercurio dañados',
        'Luminarias industriales'
      ],
      'tips': [
        'Maneja con cuidado para evitar roturas',
        'Separa por tipo de tecnología',
        'Usa embalaje protector',
        'Evita golpes durante el transporte'
      ]
    },
    {
      'title': 'Herramientas eléctricas',
      'icon': Icons.build,
      'description': 'Herramientas y equipos eléctricos de uso doméstico.',
      'image': 'assets/images/router.png',
      'permitido': [
        'Taladros',
        'Destornilladores eléctricos',
        'Sierras eléctricas',
        'Lijadoras',
        'Soldadores'
      ],
      'noPermitido': [
        'Herramientas con baterías dañadas',
        'Equipos con aceites',
        'Herramientas industriales',
        'Aparatos muy oxidados'
      ],
      'tips': [
        'Retira las baterías recargables',
        'Limpia de residuos y polvo',
        'Agrupa los cables correctamente',
        'Protege las partes cortantes'
      ]
    }
  ];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));

    for (var i = 0; i < recyclingItems.length; i++) {
      scrollControllers[i] = ScrollController();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (selectedIndex != -1) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    for (var controller in scrollControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void onItemTap(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = -1;
        animationController.reverse();
      } else {
        selectedIndex = index;
        animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/slash.png',
              height: 30,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Recicla Ahora!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: recyclingItems.length,
        itemBuilder: (context, index) {
          final item = recyclingItems[index];
          return Column(
            children: [
              ListTile(
                tileColor: selectedIndex == index 
                    ? Colors.green.withOpacity(0.15) 
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(selectedIndex == index ? 16 : 0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green[300]!,
                        Colors.green[500]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    item['icon'],
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                title: Text(
                  item['title'],
                  style: TextStyle(
                    fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.w500,
                    fontSize: 16,
                    color: selectedIndex == index ? Colors.green[700] : Colors.black87,
                  ),
                ),
                trailing: AnimatedRotation(
                  turns: selectedIndex == index ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? Colors.green[50] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: selectedIndex == index ? Colors.green[700] : Colors.grey[600],
                      size: 28,
                    ),
                  ),
                ),
                onTap: () => onItemTap(index),
              ),
              if (selectedIndex == index)
                SizeTransition(
                  sizeFactor: fadeAnimation,
                  child: SlideTransition(
                    position: slideAnimation,
                    child: FadeTransition(
                      opacity: fadeAnimation,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.05),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Container(
                          height: 290,
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: RawScrollbar(
                            controller: scrollControllers[index],
                            thumbColor: Colors.green.withOpacity(0.6),
                            radius: Radius.circular(20),
                            thickness: 5,
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              controller: scrollControllers[index],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    item['image'],
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    item['description'],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 16),
                                  buildSection('Permitido', item['permitido'], Icons.check_circle, Colors.green),
                                  const SizedBox(height: 16),
                                  buildSection('No Permitido', item['noPermitido'], Icons.cancel, Colors.red),
                                  const SizedBox(height: 16),
                                  buildSection('Tips', item['tips'], Icons.lightbulb, Colors.amber),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Divider(height: 1),
            ],
          );
        },
      ),
    );
  }

  Widget buildSection(String title, List<String> items, IconData icon, Color color) {
    // Helper method to get section-specific icon and color
    IconData getSectionIcon() {
      switch (title.toLowerCase()) {
        case 'permitido':
          return Icons.check_circle;
        case 'no permitido':
          return Icons.cancel;
        case 'tips':
          return Icons.lightbulb;
        default:
          return icon;
      }
    }

    Color getSectionColor() {
      switch (title.toLowerCase()) {
        case 'permitido':
          return Colors.green;
        case 'no permitido':
          return Colors.red;
        case 'tips':
          return Colors.amber;
        default:
          return color;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: getSectionColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(getSectionIcon(), color: getSectionColor()),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: getSectionColor(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: getSectionColor().withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  getSectionIcon(),
                  size: 16,
                  color: getSectionColor(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        )).toList(),
      ],
    );
  }
}