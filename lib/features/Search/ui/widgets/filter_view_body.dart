import 'package:flutter/material.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({super.key, required this.locationArgument});
  final LocationArgument locationArgument;

  @override
  Widget build(BuildContext context) {
    return Text(locationArgument.district);
  }
}
