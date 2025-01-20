import 'package:flutter/material.dart';
import '../models/calendar_content.dart';
import './skeleton/calendar_screen_skeleton.dart';
import '../services/calendar_content_service.dart';
import '../widgets/calendar/calendar_screen_content_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  late Future<CalendarScreenData> calendarDataFuture;
  final CalendarContentService contentService = CalendarContentService();

  @override
  void initState() {
    super.initState();
    calendarDataFuture = loadCalendarData();
  }

  Future<CalendarScreenData> loadCalendarData() async {
    final centers = await contentService.getCollectionCenters();
    final pickUpDate = await contentService.getPickUpDate();

    return CalendarScreenData(
      collectionCenters: centers,
      pickUpDate: pickUpDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CalendarScreenData>(
      future: calendarDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CalendarScreenSkeleton();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: Text('No data available'));
        }
        
        return CalendarScreenContent(data: snapshot.data!);
      },
    );
  }
}