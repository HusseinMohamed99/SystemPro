import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Search/ui/widgets/recent_searches_screen.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: const RecentSearchesScreen().allPadding(
        vPadding: kPaddingDefaultVertical,
        hPadding: kPaddingDefaultHorizontal,
      ),
    );
  }
}
