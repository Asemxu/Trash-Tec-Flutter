import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../models/home_content.dart';
class ReasonsSection extends StatefulWidget {
  final List<RecyclingReason> reasons;
  
  const ReasonsSection({Key? key, required this.reasons}) : super(key: key);
  
  @override
  State<ReasonsSection> createState() => ReasonsSectionState();
}

class ReasonsSectionState extends State<ReasonsSection> {
  int currentReasonPage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 , vertical:20),
          child: Text(
            '10 razones por la que deberiamos reciclar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider.builder(
          itemCount: (widget.reasons.length / 2).ceil(),
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentReasonPage = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final startIndex = index * 2;
            return Row(
              children: [
                Expanded(child: buildReasonCard(widget.reasons[startIndex])),
                if (startIndex + 1 < widget.reasons.length)
                  Expanded(child: buildReasonCard(widget.reasons[startIndex + 1])),
              ],
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                (widget.reasons.length / 2).ceil(),
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentReasonPage == index ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget buildReasonCard(RecyclingReason reason) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                reason.imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.error),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reason.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    reason.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}