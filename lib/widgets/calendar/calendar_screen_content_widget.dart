import 'package:flutter/material.dart';
import '../../models/calendar_content.dart';
import 'pickup_date_widget.dart';
import 'collection_centers_widget.dart';


class CalendarScreenContent extends StatefulWidget  {
  final CalendarScreenData data;

  const CalendarScreenContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CalendarScreenContent> createState() => CalendarScreenContentState();
}

class CalendarScreenContentState extends State<CalendarScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PickupDateWidget(pickUpDate : widget.data.pickUpDate),
            CollectionCenterWidget(centers : widget.data.collectionCenters)
          ],
        ),
      ),
    );
  }
}