import 'package:flutter/material.dart';
import '../../models/calendar_content.dart';

class CollectionCenterWidget extends StatelessWidget {
  final List<CollectionCenter> centers;

  const CollectionCenterWidget({
    Key? key,
    required this.centers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: centers.length,
          itemBuilder: (context, index) => buildCollectionCenterCard(centers[index]),
        )
      ]
    );
  }

  Widget buildCollectionCenterCard(CollectionCenter center) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  center.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, color: Colors.grey[500]),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      center.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      center.address,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              // Icon(
              //   Icons.arrow_forward_ios,
              //   size: 16,
              //   color: Colors.grey[400],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}