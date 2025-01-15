import 'package:flutter/material.dart';
import '../../models/navigation_item.dart';


final List<NavigationItem> navigationItems = [
  NavigationItem(
    label: 'Inicio',
    icon: Icons.home_outlined,
  ),
  NavigationItem(
    label: 'Calendario',
    icon: Icons.calendar_month_outlined,
  ),
  NavigationItem(
    label: 'Centros',
    icon: Icons.location_on_outlined,
  ),
  NavigationItem(
    label: 'Reciclaje',
    icon: Icons.recycling_outlined,
  ),
  NavigationItem(
    label: 'Más',
    icon: Icons.more_horiz_outlined,
  ),
];