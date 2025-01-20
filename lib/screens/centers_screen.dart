import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class CenterScreen extends StatefulWidget {
  @override
  State<CenterScreen> createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  final mapController = MapController();
  Position? userLocation;
  int? hoveredMarkerId;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      userLocation = position;
    });
  }

  void _openGoogleMapsRoute(LatLng destination) async {
    if (userLocation == null) return;

    final url = Uri.parse('https://www.google.com/maps/dir/?api=1'
        '&origin=${userLocation!.latitude},${userLocation!.longitude}'
        '&destination=${destination.latitude},${destination.longitude}'
        '&travelmode=driving');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  final List<Map<String, dynamic>> centers = [
    {
      'name': 'RECICLAMAS',
      'position': LatLng(-12.0464, -77.0428),
      'address': 'Av. La Marina 3239, San Miguel, Lima',
      'phone': '(01) 564-3214',
      'schedule': 'Lun-Vie: 8:00 AM - 6:00 PM\nSáb: 8:00 AM - 1:00 PM',
      'description': 'Empresa líder en gestión y reciclaje de residuos electrónicos en Perú.',
      'materials': ['Electrónicos', 'Baterías', 'Metales', 'Plásticos'],
      'website': 'www.reciclamas.pe',
      'image': 'assets/images/slash.png',
      'video': 'https://youtu.be/watch?v=7UZbI1_y3Eo', // Video sobre reciclaje electrónico
      'email': 'contacto@reciclamas.pe',
      'socialMedia': {
        'facebook': 'facebook.com/reciclamas',
        'instagram': '@reciclamas'
      }
    },
    {
      'name': 'Ciudad Saludable',
      'position': LatLng(-12.0553, -77.0802),
      'address': 'Av. General Córdova 285, Miraflores, Lima',
      'phone': '(01) 628-7176',
      'schedule': 'Lun-Vie: 9:00 AM - 5:00 PM',
      'description': 'ONG dedicada al reciclaje inclusivo y gestión ambiental sostenible.',
      'materials': ['Papel', 'Cartón', 'Plástico PET', 'Vidrio'],
      'website': 'www.ciudadsaludable.org',
      'image': 'assets/images/slash.png',
      'video': 'https://youtu.be/watch?v=YuKh-kHP2pk', // Video sobre reciclaje inclusivo
      'email': 'info@ciudadsaludable.org',
      'socialMedia': {
        'facebook': 'facebook.com/ciudadsaludable',
        'instagram': '@ciudadsaludable'
      }
    },
    {
      'name': 'BEFESA PERU',
      'position': LatLng(-12.0240, -77.1185),
      'address': 'Av. Las Torres 180, Callao',
      'phone': '(01) 613-6500',
      'schedule': 'Lun-Vie: 7:00 AM - 4:00 PM',
      'description': 'Especialistas en gestión de residuos industriales y peligrosos.',
      'materials': ['Residuos industriales', 'Químicos', 'Metales pesados'],
      'website': 'www.befesa.com/peru',
      'image': 'assets/images/slash.png',
      'video': 'https://youtu.be/watch?v=8J7JZcsoHyA', // Video sobre residuos industriales
      'email': 'contacto@befesa.com.pe',
      'socialMedia': {
        'facebook': 'facebook.com/befesaperu',
        'instagram': '@befesaperu'
      }
    },
    {
      'name': 'Reciclaje Arequipa',
      'position': LatLng(-16.4090, -71.5374),
      'address': 'Av. Parra 308, Arequipa',
      'phone': '(054) 234-567',
      'schedule': 'Lun-Sab: 8:00 AM - 5:00 PM',
      'description': 'Centro de reciclaje líder en la región sur del Perú.',
      'materials': ['Papel', 'Plástico', 'Metal', 'Vidrio'],
      'website': 'www.reciclarequipa.com',
      'image': 'assets/images/reciclaje_arequipa.png',
      'video': 'https://youtu.be/watch?v=YNi0bgQ3j0w', // Video sobre reciclaje en Arequipa
      'email': 'info@reciclarequipa.com',
      'socialMedia': {
        'facebook': 'facebook.com/reciclarequipa',
        'instagram': '@reciclarequipa'
      }
    },
    {
      'name': 'Recicla Cusco',
      'position': LatLng(-13.5319, -71.9675),
      'address': 'Av. Sol 345, Cusco',
      'phone': '(084) 234-567',
      'schedule': 'Lun-Vie: 8:30 AM - 5:30 PM',
      'description': 'Centro de reciclaje comprometido con la preservación del patrimonio cultural.',
      'materials': ['Papel', 'Plástico', 'Vidrio', 'Residuos orgánicos'],
      'website': 'www.reciclacusco.com',
      'image': 'assets/images/slash.png',
      'video': 'https://youtu.be/watch?v=zF_sFPoN7cc', // Video sobre reciclaje en Cusco
      'email': 'contacto@reciclacusco.com',
      'socialMedia': {
        'facebook': 'facebook.com/reciclacusco',
        'instagram': '@reciclacusco'
      }
    },
    {
      'name': 'EcoPiura',
      'position': LatLng(-5.1944, -80.6328),
      'address': 'Av. Grau 1230, Piura',
      'phone': '(073) 234-567',
      'schedule': 'Lun-Vie: 8:00 AM - 6:00 PM\nSáb: 9:00 AM - 1:00 PM',
      'description': 'Centro de reciclaje especializado en residuos agroindustriales y plásticos.',
      'materials': ['Plástico agrícola', 'Residuos orgánicos', 'PET', 'Cartón'],
      'website': 'www.ecopiura.com',
      'image': 'assets/images/slash.png',
      'video': 'https://youtu.be/watch?v=_7XMZ-nxiJY', // Video sobre reciclaje agrícola
      'email': 'contacto@ecopiura.com',
      'socialMedia': {
        'facebook': 'facebook.com/ecopiura',
        'instagram': '@ecopiura'
      }
    },
    {
      'name': 'Recicladora Trujillo',
      'position': LatLng(-8.1159, -79.0299),
      'address': 'Av. España 2340, Trujillo',
      'phone': '(044) 234-567',
      'schedule': 'Lun-Vie: 7:30 AM - 5:30 PM\nSáb: 8:00 AM - 2:00 PM',
      'description': 'Empresa líder en La Libertad en gestión integral de residuos sólidos.',
      'materials': ['Metales', 'Papel', 'Plástico', 'Vidrio', 'RAEE'],
      'website': 'www.recicladoratrujillo.com',
      'image': 'assets/images/slash.png',
      'video': 'https://youtu.be/watch?v=Xow2GY_kNZY', // Video sobre reciclaje en Trujillo
      'email': 'info@recicladoratrujillo.com',
      'socialMedia': {
        'facebook': 'facebook.com/recicladoratrujillo',
        'instagram': '@recitrujillo'
      }
    },
    {
      'name': 'EcoIca',
      'position': LatLng(-14.0678, -75.7286),
      'address': 'Av. Los Maestros 567, Ica',
      'phone': '(056) 234-567',
      'schedule': 'Lun-Vie: 8:30 AM - 5:30 PM\nSáb: 9:00 AM - 1:00 PM',
      'description': 'Centro de reciclaje especializado en residuos agrícolas y vitivinícolas.',
      'materials': ['Residuos agrícolas', 'Plástico', 'Cartón', 'Vidrio'],
      'website': 'www.ecoica.com',
      'image': 'assets/images/slash.png',
      'video': 'https://youtu.be/watch?v=_6xlNyWPpB8', // Video sobre reciclaje en Ica
      'email': 'contacto@ecoica.com',
      'socialMedia': {
        'facebook': 'facebook.com/ecoica',
        'instagram': '@ecoica'
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate center point
    double sumLat = 0;
    double sumLng = 0;
    centers.forEach((center) {
      sumLat += center['position'].latitude;
      sumLng += center['position'].longitude;
    });
    
    final centerPoint = LatLng(
      sumLat / centers.length,
      sumLng / centers.length,
    );

    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: centerPoint,
          zoom: 5.5, // Adjusted zoom to show all of Peru
          maxZoom: 18.0,
          minZoom: 5.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: [
                  LatLng(userLocation?.latitude ?? 0, userLocation?.longitude ?? 0),
                  // Add destination point here
                ],
                color: Colors.blue,
                strokeWidth: 5.0,
                isDotted: true,
                gradientColors: [
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ],
          ),
          MarkerLayer(
            markers: centers.map((center) => Marker(
              point: center['position'],
              width: 50,
              height: 50,
              builder: (context) => Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 4,
                                  width: 40,
                                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 175),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              center['image'],
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  center['name'],
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  center['website'],
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(height: 32),
                                      Text(
                                        center['description'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 24),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.location_on, color: Colors.green),
                                          title: Text(center['address']),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.schedule, color: Colors.green),
                                          title: Text(center['schedule']),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.phone, color: Colors.green),
                                          title: Text(center['phone']),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.email, color: Colors.green),
                                          title: Text(center['email']),
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Materiales Aceptados',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Wrap(
                                        spacing: 8,
                                        children: (center['materials'] as List).map((material) => 
                                          Chip(
                                            label: Text(material),
                                            backgroundColor: Colors.green[100],
                                          ),
                                        ).toList(),
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Redes Sociales',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.facebook),
                                            onPressed: () {},
                                            color: Colors.blue,
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {},
                                            color: Colors.purple,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Video Presentación',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      InkWell(
                                        onTap: () async {
                                          final url = center['video'];
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          }
                                        },
                                        child: Container(
                                          height: 200,
                                          margin: EdgeInsets.symmetric(horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: AssetImage(center['image']),
                                              fit: BoxFit.cover,
                                              opacity: 0.7,
                                            ),
                                          ),
                                          child: Center(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    onLongPressStart: (_) {
                      showBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 4,
                                  width: 40,
                                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 175),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              center['image'],
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  center['name'],
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  center['website'],
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(height: 32),
                                      Text(
                                        center['description'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 24),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.location_on, color: Colors.green),
                                          title: Text(center['address']),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.schedule, color: Colors.green),
                                          title: Text(center['schedule']),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.phone, color: Colors.green),
                                          title: Text(center['phone']),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          leading: Icon(Icons.email, color: Colors.green),
                                          title: Text(center['email']),
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Materiales Aceptados',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Wrap(
                                        spacing: 8,
                                        children: (center['materials'] as List).map((material) => 
                                          Chip(
                                            label: Text(material),
                                            backgroundColor: Colors.green[100],
                                          ),
                                        ).toList(),
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Redes Sociales',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.facebook),
                                            onPressed: () {},
                                            color: Colors.blue,
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {},
                                            color: Colors.purple,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 24),
                                      Text(
                                        'Video Presentación',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      InkWell(
                                        onTap: () async {
                                          final url = center['video'];
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          }
                                        },
                                        child: Container(
                                          height: 200,
                                          margin: EdgeInsets.symmetric(horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: AssetImage(center['image']),
                                              fit: BoxFit.cover,
                                              opacity: 0.7,
                                            ),
                                          ),
                                          child: Center(
                                            child: Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    onLongPressEnd: (_) {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.recycling,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              double currentZoom = mapController.zoom;
              mapController.move(
                mapController.center, 
                currentZoom + 1.0
              );
            },
            heroTag: 'zoom_in',
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              double currentZoom = mapController.zoom;
              mapController.move(
                mapController.center, 
                currentZoom - 1.0
              );
            },
            heroTag: 'zoom_out',
          ),
        ],
      ),
    );
  }
}
