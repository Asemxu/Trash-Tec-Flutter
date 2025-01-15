import 'package:flutter/material.dart';
import '../../models/home_content.dart';

final List<RecyclingFact> facts = [
  RecyclingFact(
    title: '¿Sabías que?',
    description: 'Un teléfono móvil puede contener hasta 40 elementos diferentes, incluyendo oro y plata.',
    imageUrl: 'assets/images/fact1.png',
  ),
  RecyclingFact(
    title: 'Dato curioso',
    description: 'Por cada millón de teléfonos reciclados, se pueden recuperar 15.8 toneladas de cobre.',
    imageUrl: 'assets/images/fact2.png', 
  ),
  RecyclingFact(
    title: 'Impacto ambiental',
    description: 'Reciclar una tonelada de e-waste evita la emisión de 2 toneladas de gases de efecto invernadero.',
    imageUrl: 'assets/images/fact3.png',
  ),
  RecyclingFact(
    title: 'Recursos valiosos',
    description: 'Las placas base de las computadoras contienen más oro que el mineral extraído de las minas.',
    imageUrl: 'assets/images/fact4.png',
  ),
  RecyclingFact(
    title: 'Crecimiento exponencial',
    description: 'Se generan más de 50 millones de toneladas de residuos electrónicos cada año globalmente.',
    imageUrl: 'assets/images/fact5.png',
  ),
];

final List<Category> categories = [
  Category(
    name: 'Smartphones',
    icon: 'assets/icons/smartphone.png',
    description: 'Teléfonos móviles y accesorios',
  ),
  Category(
    name: 'Computadoras',
    icon: 'assets/icons/computer.png',
    description: 'Laptops, PC y tablets',
  ),
  Category(
    name: 'Electrodomésticos',
    icon: 'assets/icons/appliance.png',
    description: 'Lavadoras, refrigeradoras, etc',
  ),
  Category(
    name: 'TV y Audio',
    icon: 'assets/icons/tv.png',
    description: 'Televisores y equipos de sonido',
  ),
  Category(
    name: 'Pequeños aparatos',
    icon: 'assets/icons/small.png',
    description: 'Tostadoras, licuadoras, etc',
  ),
  Category(
    name: 'Impresoras',
    icon: 'assets/icons/printer.png',
    description: 'Impresoras y escáneres',
  ),
  Category(
    name: 'Videojuegos',
    icon: 'assets/icons/gaming.png',
    description: 'Consolas y accesorios',
  ),
  Category(
    name: 'Baterías',
    icon: 'assets/icons/battery.png',
    description: 'Pilas y baterías recargables',
  ),
  Category(
    name: 'Cables',
    icon: 'assets/icons/cable.png',
    description: 'Cables y cargadores',
  ),
  Category(
    name: 'Otros',
    icon: 'assets/icons/other.png',
    description: 'Otros dispositivos electrónicos',
  ),
];

final List<Benefit> benefits = [
  Benefit(
    title: 'Conservación de recursos',
    description: 'Ayuda a preservar materiales valiosos y reduce la extracción de materias primas',
    imageUrl: 'assets/images/conservation.png',
  ),
  Benefit(
    title: 'Reducción de emisiones',
    description: 'Disminuye la huella de carbono y gases de efecto invernadero',
    imageUrl: 'assets/images/emissions.png',
  ),
  Benefit(
    title: 'Economía circular',
    description: 'Fomenta un ciclo sostenible de reutilización y reciclaje',
    imageUrl: 'assets/images/circular.png',
  ),
  Benefit(
    title: 'Innovación tecnológica',
    description: 'Impulsa el desarrollo de nuevas tecnologías de reciclaje',
    imageUrl: 'assets/images/innovation.png',
  ),
  Benefit(
    title: 'Impacto social',
    description: 'Genera empleos y mejora la calidad de vida en las comunidades',
    imageUrl: 'assets/images/social.png',
  ),
];

final List<RecyclingReason> reasons = [
  RecyclingReason(
    title: 'Protección ambiental',
    description: 'Reduce la contaminación del suelo y agua por materiales tóxicos',
    imageUrl: 'assets/images/environment.png',
  ),
  RecyclingReason(
    title: 'Conservación de recursos',
    description: 'Ahorra materiales valiosos como oro, plata y cobre',
    imageUrl: 'assets/images/resources.png',
  ),
  RecyclingReason(
    title: 'Ahorro energético',
    description: 'Requiere menos energía reciclar que extraer nuevos materiales',
    imageUrl: 'assets/images/energy.png',
  ),
  RecyclingReason(
    title: 'Reducción de residuos',
    description: 'Disminuye la cantidad de basura electrónica en vertederos',
    imageUrl: 'assets/images/waste.png',
  ),
  RecyclingReason(
    title: 'Economía circular',
    description: 'Fomenta un ciclo sostenible de producción y consumo',
    imageUrl: 'assets/images/circular.png',
  ),
  RecyclingReason(
    title: 'Creación de empleos',
    description: 'Genera puestos de trabajo en la industria del reciclaje',
    imageUrl: 'assets/images/jobs.png',
  ),
  RecyclingReason(
    title: 'Seguridad de datos',
    description: 'Garantiza la destrucción segura de información personal',
    imageUrl: 'assets/images/security.png',
  ),
  RecyclingReason(
    title: 'Cumplimiento legal',
    description: 'Ayuda a cumplir con las normativas ambientales vigentes',
    imageUrl: 'assets/images/legal.png',
  ),
  RecyclingReason(
    title: 'Innovación tecnológica',
    description: 'Impulsa el desarrollo de nuevas tecnologías de reciclaje',
    imageUrl: 'assets/images/innovation.png',
  ),
  RecyclingReason(
    title: 'Responsabilidad social',
    description: 'Contribuye a un futuro más sostenible para las próximas generaciones',
    imageUrl: 'assets/images/social.png',
  ),
];