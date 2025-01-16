import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../models/home_content.dart';

class BenefitsSection extends StatelessWidget {
  final List<Benefit> benefits;
  
  const BenefitsSection({Key? key, required this.benefits}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Beneficios',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: benefits.length,
          itemBuilder: (context, index) => buildBenefitCard(benefits[index]),
        ),
      ],
    );
  }
  
  Widget buildBenefitCard(Benefit benefit) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
        leading: Image.network(
            benefit.imageUrl,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error_outline, size: 40);
            },
            loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
                width: 40,
                height: 40,
                child: Center(
                child: CircularProgressIndicator(
                    strokeWidth: 2,
                ),
                ),
            );
            },
        ),
        title: Text(benefit.title),
        subtitle: Text(benefit.description),
        ),
    );  
  }
}