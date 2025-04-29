import 'package:flutter/material.dart';

class ResultsCountAndSortButton extends StatefulWidget {
  const ResultsCountAndSortButton({super.key});

  @override
  State<ResultsCountAndSortButton> createState() =>
      _ResultsCountAndSortButtonState();
}

class _ResultsCountAndSortButtonState extends State<ResultsCountAndSortButton> {
  String selectedSort = 'Newest';

  final List<String> sortOptions = [
    'Newest',
    'Price (Low to High)',
    'Price (High to Low)',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('1537 Properties', style: TextStyle(fontSize: 16)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedSort = value;
              });
            },
            itemBuilder: (context) {
              return sortOptions.map((option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
            child: Row(
              children: [
                const Icon(Icons.swap_vert, size: 18),
                const SizedBox(width: 4),
                Text(selectedSort),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
