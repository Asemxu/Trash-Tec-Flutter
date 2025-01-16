import 'package:flutter/material.dart';
import '../../models/home_content.dart';
import 'facts_section_widget.dart';
import 'benefits_section_widget.dart';
import 'categories_section_widget.dart';
import 'reasons_section_widget.dart';


class HomeScreenContent extends StatefulWidget  {
  final HomeScreenData data;

  const HomeScreenContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<HomeScreenContent> createState() => HomeScreenContentState();
}

class HomeScreenContentState extends State<HomeScreenContent> {
  int currentReasonPage = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FactsSection(facts: widget.data.facts),
            const SizedBox(height: 24),
            CategoriesSection(categories: widget.data.categories),
            const SizedBox(height: 24),
            BenefitsSection(benefits: widget.data.benefits),
            const SizedBox(height: 24),
            ReasonsSection(reasons: widget.data.reasons),
          ],
        ),
      ),
    );
  }
}